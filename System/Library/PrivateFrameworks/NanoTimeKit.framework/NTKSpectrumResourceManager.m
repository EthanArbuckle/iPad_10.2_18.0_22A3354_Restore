@implementation NTKSpectrumResourceManager

+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3
{
  id v4;
  NTKSpectrumResourceManager *v5;
  void *v6;

  v4 = a1;
  objc_sync_enter(v4);
  if (!__sharedInstance)
  {
    v5 = -[NTKSpectrumResourceManager initWithPixelFormat:]([NTKSpectrumResourceManager alloc], "initWithPixelFormat:", a3);
    v6 = (void *)__sharedInstance;
    __sharedInstance = (uint64_t)v5;

  }
  objc_sync_exit(v4);

  if (*(_QWORD *)(__sharedInstance + 24) != a3)
    +[NTKSpectrumResourceManager sharedInstanceWithPixelFormat:].cold.1();
  return (id)__sharedInstance;
}

+ (void)_deallocInstance:(id)a3
{
  void *v3;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v3 = (void *)__sharedInstance;
  __sharedInstance = 0;

  objc_sync_exit(obj);
}

- (NTKSpectrumResourceManager)initWithPixelFormat:(unint64_t)a3
{
  NTKSpectrumResourceManager *v4;
  uint64_t v5;
  MTLDevice *device;
  MTLDevice *v7;
  void *v8;
  uint64_t v9;
  MTLLibrary *library;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKSpectrumResourceManager;
  v4 = -[NTKSpectrumResourceManager init](&v12, sel_init);
  if (v4)
  {
    objc_msgSend(off_1E6BCA700, "sharedDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    device = v4->_device;
    v4->_device = (MTLDevice *)v5;

    v7 = v4->_device;
    NTKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MTLDevice newDefaultLibraryWithBundle:error:](v7, "newDefaultLibraryWithBundle:error:", v8, 0);
    library = v4->_library;
    v4->_library = (MTLLibrary *)v9;

    v4->_pixelFormat = a3;
    -[NTKSpectrumResourceManager _loadGeometry](v4, "_loadGeometry");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NTKSpectrumResourceManager;
  -[NTKSpectrumResourceManager dealloc](&v2, sel_dealloc);
}

- (void)_asyncDeallocInstance
{
  int v2;
  void *v3;

  v2 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v3 = (void *)objc_opt_class();
  if (v2)
    objc_msgSend(v3, "_deallocInstance:", 0);
  else
    objc_msgSend(v3, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__deallocInstance_, 0, 0);
}

- (void)addClient
{
  NTKSpectrumResourceManager *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_clients;
  objc_sync_exit(obj);

}

- (void)removeClient
{
  NTKSpectrumResourceManager *v2;
  uint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_clients - 1;
  v2->_clients = v3;
  objc_sync_exit(v2);

  if (!v3)
    -[NTKSpectrumResourceManager _asyncDeallocInstance](v2, "_asyncDeallocInstance");
}

- (id)vignetteTexture
{
  MTLTexture *vignetteTexture;
  CGImage *v5;
  CGDataProvider *DataProvider;
  const __CFData *v7;
  CFIndex Length;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  void *v12;
  const UInt8 *BytePtr;
  id v14;
  uint64_t v15;
  uint64_t v16;
  const UInt8 *v17;
  size_t v18;
  const UInt8 *v19;
  UInt8 *i;
  UInt8 v21;
  void *v22;
  MTLTexture *v23;
  MTLTexture *v24;
  void *v25;
  void *v26;
  void *v27;
  MTLTexture *v28;
  MTLTexture *v29;
  id v30;
  _QWORD v31[3];
  _QWORD v32[3];

  vignetteTexture = self->_vignetteTexture;
  if (vignetteTexture)
    return vignetteTexture;
  NTKImageNamed(CFSTR("SpectrumVignette"));
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (CGImage *)objc_msgSend(v30, "CGImage");
  DataProvider = CGImageGetDataProvider(v5);
  v7 = CGDataProviderCopyData(DataProvider);
  Length = CFDataGetLength(v7);
  Width = CGImageGetWidth(v5);
  Height = CGImageGetHeight(v5);
  BytesPerRow = CGImageGetBytesPerRow(v5);
  v12 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", Length, 0);
  BytePtr = CFDataGetBytePtr(v7);
  v14 = objc_retainAutorelease(v12);
  v15 = objc_msgSend(v14, "contents");
  if (Height)
  {
    v16 = 0;
    v17 = &BytePtr[BytesPerRow * (Height - 1)];
    do
    {
      v18 = Width;
      v19 = v17;
      for (i = (UInt8 *)v15; v18; --v18)
      {
        v21 = *v19;
        v19 += 2;
        *i++ = v21;
      }
      ++v16;
      v15 += Width;
      v17 -= BytesPerRow;
    }
    while (v16 != Height);
  }
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, Width, Height, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUsage:", 1);
  objc_msgSend(v22, "setStorageMode:", 2);
  v23 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v22);
  v24 = self->_vignetteTexture;
  self->_vignetteTexture = v23;

  objc_msgSend(off_1E6BCA700, "sharedCommandQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commandBuffer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E6BCA700, "addCompletedErrorCheckToCommandBuffer:forCase:", v26, CFSTR("SpectrumVignette"));
  objc_msgSend(v26, "blitCommandEncoder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = Width;
  v32[1] = Height;
  v32[2] = 1;
  v28 = self->_vignetteTexture;
  memset(v31, 0, sizeof(v31));
  objc_msgSend(v27, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v14, 0, Width, Height * Width, v32, v28, 0, 0, v31);
  objc_msgSend(v27, "endEncoding");
  objc_msgSend(v26, "commit");
  CFRelease(v7);
  objc_msgSend(v26, "waitUntilScheduled");
  v29 = self->_vignetteTexture;

  return v29;
}

- (id)overlayTexture
{
  unint64_t v2;
  MTLTexture *overlayTexture;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  uint64_t j;
  void *v14;
  MTLTexture *v15;
  MTLTexture *v16;
  void *v17;
  void *v18;
  void *v19;
  MTLTexture *v20;
  MTLTexture *v21;
  _QWORD v22[3];
  __int128 v23;
  uint64_t v24;
  _OWORD v25[6];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  overlayTexture = self->_overlayTexture;
  if (overlayTexture)
    return overlayTexture;
  v6 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 2400, 0));
  v7 = objc_msgSend(v6, "contents");
  v8 = 0;
  v9 = 0x600000000;
  do
  {
    v2 = v2 & 0xFFFFFFFF00000000 | NTKSpectrumGetOverlayGradientTable_s_overlayGradientTable[v8];
    CLKUIConvertToRGBfFromSRGB8_fast();
    v11 = v9 >> 32;
    if (!(v8 * 4))
      v11 = 0;
    v25[v11] = v10;
    ++v8;
    v9 -= 0x100000000;
  }
  while (v9);
  for (i = 0; i != 6; ++i)
  {
    for (j = 0; j != 100; ++j)
      *(_DWORD *)(v7 + 4 * j) = CLKUIConvertToSRGB8FromRGBf_fast();
    v7 += 400;
  }
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 71, 600, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUsage:", 1);
  objc_msgSend(v14, "setStorageMode:", 2);
  v15 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v14);
  v16 = self->_overlayTexture;
  self->_overlayTexture = v15;

  objc_msgSend(off_1E6BCA700, "sharedCommandQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commandBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E6BCA700, "addCompletedErrorCheckToCommandBuffer:forCase:", v18, CFSTR("SpectrumOverlay"));
  objc_msgSend(v18, "blitCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = xmmword_1B755E640;
  v24 = 1;
  v20 = self->_overlayTexture;
  memset(v22, 0, sizeof(v22));
  objc_msgSend(v19, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v6, 0, 2400, 2400, &v23, v20, 0, 0, v22);
  objc_msgSend(v19, "endEncoding");
  objc_msgSend(v18, "commit");
  objc_msgSend(v18, "waitUntilScheduled");
  v21 = self->_overlayTexture;

  return v21;
}

- (void)_loadGeometry
{
  MTLBuffer *v3;
  MTLBuffer *verticesBuffer;

  v3 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &quadVertices, 16, 1);
  verticesBuffer = self->_verticesBuffer;
  self->_verticesBuffer = v3;

}

- (id)_generatePipeline:(unint64_t)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t *p_device;
  MTLDevice *device;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  unsigned __int8 v23;

  v23 = a3 & 1;
  v22 = (a3 & 2) != 0;
  v21 = (a3 & 8) != 0;
  v20 = (a3 & 0x10) != 0;
  v4 = CFSTR("spectrumConicOverlayFrgShader");
  if ((a3 & 4) == 0)
    v4 = CFSTR("spectrumConicFrgShader");
  v5 = v4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setConstantValue:type:atIndex:", &v23, 53, 0);
  objc_msgSend(v6, "setConstantValue:type:atIndex:", &v22, 53, 1);
  objc_msgSend(v6, "setConstantValue:type:atIndex:", &v21, 53, 2);
  objc_msgSend(v6, "setConstantValue:type:atIndex:", &v20, 53, 3);
  NTKBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  device = self->_device;
  p_device = (uint64_t *)&self->_device;
  objc_msgSend(off_1E6BCA6F8, "archiveWithName:bundle:device:", CFSTR("NTKSpectrumShaders"), v7, device);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CC6AB0], "functionDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setName:", CFSTR("spectrumPassVrtShader"));
  v12 = (void *)objc_msgSend(v10, "newFunctionInLibrary:withDescriptor:", p_device[22], v11);
  objc_msgSend(v11, "setName:", v5);

  objc_msgSend(v11, "setConstantValues:", v6);
  v13 = (void *)objc_msgSend(v10, "newFunctionInLibrary:withDescriptor:", p_device[22], v11);
  v14 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
  objc_msgSend(v14, "setLabel:", CFSTR("Spectrum Pipeline"));
  objc_msgSend(v14, "setVertexFunction:", v12);
  objc_msgSend(v14, "setFragmentFunction:", v13);
  objc_msgSend(v14, "colorAttachments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPixelFormat:", p_device[2]);
  if (v23 | v22)
  {
    objc_msgSend(v16, "setBlendingEnabled:", 1);
    objc_msgSend(v16, "setRgbBlendOperation:", 0);
    objc_msgSend(v16, "setAlphaBlendOperation:", 0);
    objc_msgSend(v16, "setSourceRGBBlendFactor:", 4);
    objc_msgSend(v16, "setSourceAlphaBlendFactor:", 4);
    objc_msgSend(v16, "setDestinationRGBBlendFactor:", 5);
    objc_msgSend(v16, "setDestinationAlphaBlendFactor:", 5);
  }
  v17 = (void *)objc_msgSend(v10, "newRenderPipelineStateForDevice:withDescriptor:", *p_device, v14);
  if (!v17)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[NTKSpectrumResourceManager _generatePipeline:].cold.1(v13, p_device, v18);

  }
  return v17;
}

- (id)renderPipelineForConfig:(unint64_t)a3
{
  MTLRenderPipelineState **pipelineStates;
  MTLRenderPipelineState *v6;
  MTLRenderPipelineState *v7;
  MTLRenderPipelineState *v8;

  pipelineStates = self->_pipelineStates;
  v6 = self->_pipelineStates[a3];
  if (!v6)
  {
    -[NTKSpectrumResourceManager _generatePipeline:](self, "_generatePipeline:", a3);
    v7 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    v8 = pipelineStates[a3];
    pipelineStates[a3] = v7;

    v6 = v7;
  }
  return v6;
}

- (id)verticesBuffer
{
  return self->_verticesBuffer;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_overlayTexture, 0);
  objc_storeStrong((id *)&self->_vignetteTexture, 0);
  for (i = 160; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_verticesBuffer, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (void)sharedInstanceWithPixelFormat:.cold.1()
{
  __assert_rtn("+[NTKSpectrumResourceManager sharedInstanceWithPixelFormat:]", "NTKSpectrumResourceManager.m", 73, "((NTKSpectrumResourceManager*)__sharedInstance)->_pixelFormat == pixelFormat");
}

- (void)_generatePipeline:(NSObject *)a3 .cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a2;
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_fault_impl(&dword_1B72A3000, a3, OS_LOG_TYPE_FAULT, "Spectrum Metal compilation failure: Shader=%@ Device=%@", (uint8_t *)&v7, 0x16u);

}

@end
