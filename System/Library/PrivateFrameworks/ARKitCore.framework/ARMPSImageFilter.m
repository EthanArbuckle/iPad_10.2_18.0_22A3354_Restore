@implementation ARMPSImageFilter

- (ARMPSImageFilter)initWithImageKernel:(id)a3 device:(id)a4
{
  id v7;
  id v8;
  ARMPSImageFilter *v9;
  ARMPSImageFilter *v10;
  uint64_t v11;
  MTLCommandQueue *commandQueue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARMPSImageFilter;
  v9 = -[ARMPSImageFilter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a4);
    v11 = -[MTLDevice newCommandQueue](v10->_device, "newCommandQueue");
    commandQueue = v10->_commandQueue;
    v10->_commandQueue = (MTLCommandQueue *)v11;

    objc_storeStrong((id *)&v10->_kernel, a3);
    v10->_pixelBufferPool = 0;
  }

  return v10;
}

- (void)dealloc
{
  __CVPixelBufferPool *pixelBufferPool;
  objc_super v4;

  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
  {
    CVPixelBufferPoolRelease(pixelBufferPool);
    self->_pixelBufferPool = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ARMPSImageFilter;
  -[ARMPSImageFilter dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 format:(unint64_t)a4
{
  __CVPixelBufferPool **p_pixelBufferPool;
  double Width;
  double Height;
  OSType PixelFormatType;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  __CVBuffer *v14;
  void *v15;
  size_t v16;
  void *v17;
  void *v18;
  size_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  ARMPSImageFilter *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  p_pixelBufferPool = &self->_pixelBufferPool;
  if (a3)
  {
    Width = (double)CVPixelBufferGetWidth(a3);
    Height = (double)CVPixelBufferGetHeight(a3);
  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  ARRecreatePixelBufferPoolOnConfigurationChanges(p_pixelBufferPool, PixelFormatType, Width, Height);
  pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *p_pixelBufferPool, &pixelBufferOut))
  {
    _ARLogGeneral_15();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v13;
      v29 = 2048;
      v30 = self;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not allocate pixel buffer", buf, 0x16u);

    }
    v14 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CC6BB0];
    v16 = CVPixelBufferGetWidth(a3);
    objc_msgSend(v15, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, v16, CVPixelBufferGetHeight(a3), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v17, CVPixelBufferGetIOSurface(a3), 0);

    v18 = (void *)MEMORY[0x1E0CC6BB0];
    v19 = CVPixelBufferGetWidth(pixelBufferOut);
    objc_msgSend(v18, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, v19, CVPixelBufferGetHeight(pixelBufferOut), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUsage:", objc_msgSend(v20, "usage") | 2);
    v21 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v20, CVPixelBufferGetIOSurface(pixelBufferOut), 0);

    if (v11 && v21)
    {
      -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
      v22 = objc_claimAutoreleasedReturnValue();
      -[MPSUnaryImageKernel encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_kernel, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v22, v11, v21);
      -[NSObject commit](v22, "commit");
      -[NSObject waitUntilCompleted](v22, "waitUntilCompleted");
      v14 = pixelBufferOut;
    }
    else
    {
      _ARLogGeneral_15();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v24;
        v29 = 2048;
        v30 = self;
        _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not allocate create textures for processing", buf, 0x16u);

      }
      v14 = 0;
    }

  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kernel, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
