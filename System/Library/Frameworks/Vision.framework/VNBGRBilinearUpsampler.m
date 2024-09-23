@implementation VNBGRBilinearUpsampler

- (id)libraryReturnError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  MTLLibrary *library;
  MTLDevice *device;
  void *v8;
  MTLLibrary *v9;
  MTLLibrary *v10;
  MTLLibrary *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  library = self->_library;
  if (!library)
  {
    device = self->_device;
    VNFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (MTLLibrary *)-[MTLDevice newDefaultLibraryWithBundle:error:](device, "newDefaultLibraryWithBundle:error:", v8, a3);
    v10 = self->_library;
    self->_library = v9;

    library = self->_library;
  }
  v11 = library;
  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (VNBGRBilinearUpsampler)initWithMetalDevice:(id)a3
{
  id v5;
  VNBGRBilinearUpsampler *v6;
  VNBGRBilinearUpsampler *v7;
  uint64_t v8;
  MTLCommandQueue *commandQueue;
  uint64_t v10;
  MTLLibrary *library;
  VNBGRBilinearUpsampler *v12;
  uint64_t v13;
  MPSImageBilinearScale *bilinearScale;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VNBGRBilinearUpsampler;
  v6 = -[VNBGRBilinearUpsampler init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = -[MTLDevice newCommandQueue](v7->_device, "newCommandQueue");
    commandQueue = v7->_commandQueue;
    v7->_commandQueue = (MTLCommandQueue *)v8;

    -[VNBGRBilinearUpsampler libraryReturnError:](v7, "libraryReturnError:", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    library = v7->_library;
    v7->_library = (MTLLibrary *)v10;

    if (!CVMetalTextureCacheCreate(0, 0, v7->_device, 0, &v7->_metalTextureCache))
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E08]), "initWithDevice:", v7->_device);
      bilinearScale = v7->_bilinearScale;
      v7->_bilinearScale = (MPSImageBilinearScale *)v13;

      v7->_featheringSigma = 0.75;
      v12 = v7;
      goto LABEL_6;
    }
    NSLog(CFSTR("Failed to create metal texture cache."));
  }
  v12 = 0;
LABEL_6:

  return v12;
}

- (VNBGRBilinearUpsampler)init
{
  id v3;
  VNBGRBilinearUpsampler *v4;

  v3 = MTLCreateSystemDefaultDevice();
  v4 = -[VNBGRBilinearUpsampler initWithMetalDevice:](self, "initWithMetalDevice:", v3);

  return v4;
}

- (void)dealloc
{
  __CVMetalTextureCache *metalTextureCache;
  objc_super v4;

  metalTextureCache = self->_metalTextureCache;
  if (metalTextureCache)
    CFRelease(metalTextureCache);
  v4.receiver = self;
  v4.super_class = (Class)VNBGRBilinearUpsampler;
  -[VNBGRBilinearUpsampler dealloc](&v4, sel_dealloc);
}

- (id)computePipelineStateFor:(id)a3
{
  MTLDevice *device;
  void *v4;
  void *v5;

  device = self->_device;
  v4 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", a3);
  v5 = (void *)-[MTLDevice newComputePipelineStateWithFunction:error:](device, "newComputePipelineStateWithFunction:error:", v4, 0);

  return v5;
}

- (BOOL)handlePostProcessingRequest:(id *)a3
{
  return -[VNBGRBilinearUpsampler applyEspressoMask:toImage:highResMaskBuffer:](self, "applyEspressoMask:toImage:highResMaskBuffer:", a3->var1, a3->var0, a3->var2);
}

- (BOOL)applyTextureMask:(id)a3 toImage:(__CVBuffer *)a4 highResMaskBuffer:(__CVBuffer *)a5
{
  void *v7;
  void *v8;
  MPSImageGaussianBlur *blurFilter;
  float v10;
  id v11;
  double featheringSigma;
  MPSImageGaussianBlur *v13;
  MPSImageGaussianBlur *v14;
  id v16;

  v16 = a3;
  -[VNBGRBilinearUpsampler textureFromPixelBuffer:format:](self, "textureFromPixelBuffer:format:", a5, 55);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  blurFilter = self->_blurFilter;
  if (!blurFilter || (-[MPSImageGaussianBlur sigma](blurFilter, "sigma"), self->_featheringSigma != v10))
  {
    v11 = objc_alloc(MEMORY[0x1E0CC6E48]);
    featheringSigma = self->_featheringSigma;
    *(float *)&featheringSigma = featheringSigma;
    v13 = (MPSImageGaussianBlur *)objc_msgSend(v11, "initWithDevice:sigma:", self->_device, featheringSigma);
    v14 = self->_blurFilter;
    self->_blurFilter = v13;

  }
  -[MPSImageGaussianBlur encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:](self->_blurFilter, "encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:", v8, &v16, 0);
  -[MPSImageBilinearScale encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_bilinearScale, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v8, v16, v7);
  objc_msgSend(v8, "commit");
  objc_msgSend(v8, "waitUntilCompleted");

  return 1;
}

- (BOOL)applyPixelBufferMask:(__CVBuffer *)a3 toImage:(__CVBuffer *)a4 highResMaskBuffer:(__CVBuffer *)a5
{
  void *v9;
  BOOL v10;
  void *exception;

  if (CVPixelBufferGetPixelFormatType(a3) != 1278226534)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1B0A5BC](exception, "Invalid pixel buffer format.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  -[VNBGRBilinearUpsampler textureFromPixelBuffer:format:](self, "textureFromPixelBuffer:format:", a3, 55);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VNBGRBilinearUpsampler applyTextureMask:toImage:highResMaskBuffer:](self, "applyTextureMask:toImage:highResMaskBuffer:", v9, a4, a5);

  return v10;
}

- (BOOL)applyEspressoMask:(id *)a3 toImage:(__CVBuffer *)a4 highResMaskBuffer:(__CVBuffer *)a5
{
  void *v9;
  void *v10;
  void *v11;

  v9 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", a3->var0, 4 * a3->var13 * a3->var8, 0);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, a3->var4, a3->var5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUsage:", 3);
  v11 = (void *)objc_msgSend(v9, "newTextureWithDescriptor:offset:bytesPerRow:", v10, 0, 4 * a3->var10);
  LOBYTE(a5) = -[VNBGRBilinearUpsampler applyTextureMask:toImage:highResMaskBuffer:](self, "applyTextureMask:toImage:highResMaskBuffer:", v11, a4, a5);

  return (char)a5;
}

- (id)createTextureOfSize:(CGSize)a3 withFormat:(unint64_t)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, (unint64_t)a3.width, (unint64_t)a3.height, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsage:", 3);
  v6 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v5);

  return v6;
}

- (id)textureFromPixelBuffer:(__CVBuffer *)a3 format:(unint64_t)a4
{
  __CVMetalTextureCache *metalTextureCache;
  size_t Width;
  size_t Height;
  void *v9;
  void *exception;
  CVMetalTextureRef image;

  image = 0;
  metalTextureCache = self->_metalTextureCache;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (CVMetalTextureCacheCreateTextureFromImage(0, metalTextureCache, a3, 0, (MTLPixelFormat)a4, Width, Height, 0, &image))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1B0A5BC](exception, "Failed to create input image texture.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  CVMetalTextureGetTexture(image);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(image);
  return v9;
}

- (double)featheringSigma
{
  return self->_featheringSigma;
}

- (void)setFeatheringSigma:(double)a3
{
  self->_featheringSigma = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bilinearScale, 0);
  objc_storeStrong((id *)&self->_blurFilter, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
