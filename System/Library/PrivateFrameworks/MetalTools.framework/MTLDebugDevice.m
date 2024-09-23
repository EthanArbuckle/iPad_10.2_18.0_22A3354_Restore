@implementation MTLDebugDevice

+ (BOOL)complainAboutSloppyTextureUsage
{
  return complain_about_sloppy_texture_usage;
}

- (MTLDebugDevice)initWithBaseObject:(id)a3 parent:(id)a4
{
  MTLDebugDevice *v4;
  MTLDebugDevice *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLDebugDevice;
  v4 = -[MTLToolsDevice initWithBaseObject:parent:](&v8, sel_initWithBaseObject_parent_, a3, a4);
  v5 = v4;
  if (v4)
  {
    MTLSamplerDescriptorHashMap::setLimitForDevice(&v4->_argumentBufferSamplers, v4);
    if (-[MTLDebugDevice initWithBaseObject:parent:]::once_token != -1)
      dispatch_once(&-[MTLDebugDevice initWithBaseObject:parent:]::once_token, &__block_literal_global_2);
    v5->_storeValidationEnabled = 0;
    v6 = MTLGetEnvDefault();
    v5->_storeValidationEnabled = v6 != 0;
    if (v6)
      CheckerboardRenderTargetPipelineCache::init(&v5->_checkerboardRTPipelineCache, v5);
    v5->_loadValidationEnabled = 0;
    v5->_loadValidationEnabled = MTLGetEnvDefault() != 0;
  }
  return v5;
}

const char *__44__MTLDebugDevice_initWithBaseObject_parent___block_invoke()
{
  const char *result;

  result = getenv("METAL_COMPLAIN_ABOUT_SLOPPY_TEXTURE_USAGE");
  if (result)
  {
    result = (const char *)strcmp(result, "1");
    if (!(_DWORD)result)
      complain_about_sloppy_texture_usage = 1;
  }
  return result;
}

- (id)newCommandQueue
{
  id result;
  id v4;
  MTLDebugCommandQueue *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueue");
  if (result)
  {
    v4 = result;
    v5 = -[MTLToolsCommandQueue initWithBaseObject:parent:]([MTLDebugCommandQueue alloc], "initWithBaseObject:parent:", result, self);

    return v5;
  }
  return result;
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  id result;
  id v5;
  MTLDebugCommandQueue *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithMaxCommandBufferCount:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsCommandQueue initWithBaseObject:parent:]([MTLDebugCommandQueue alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLDebugCommandQueue *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsCommandQueue initWithBaseObject:parent:]([MTLDebugCommandQueue alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heapTextureSizeAndAlignWithDescriptor:", a3);
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heapBufferSizeAndAlignWithLength:options:", a3, a4);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)validateAddressRanges:(id)a3 expectedTotalSize:(unint64_t)a4 context:(_MTLMessageContext *)a5
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;

  v7 = *MEMORY[0x24BDB03A8];
  v8 = objc_msgSend(a3, "ranges");
  if (objc_msgSend(a3, "count"))
  {
    v9 = 0;
    v10 = 0;
    v11 = v7 - 1;
    v12 = (_QWORD *)(v8 + 8);
    while (1)
    {
      v13 = *v12;
      v14 = __CFADD__(v10, *v12);
      v10 += *v12;
      if (v14)
        break;
      if ((*(v12 - 1) & v11) != 0)
      {
        _MTLMessageContextPush_();
        v13 = *v12;
      }
      if ((v13 & v11) != 0)
        _MTLMessageContextPush_();
      ++v9;
      v12 += 2;
      if (v9 >= objc_msgSend(a3, "count"))
        goto LABEL_12;
    }
    _MTLMessageContextPush_();
  }
  else
  {
    v10 = 0;
  }
LABEL_12:
  if (v10 != a4)
    _MTLMessageContextPush_();
}

- (id)newHeapWithDescriptor:(id)a3
{
  MTLDebugHeap *v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  _MTLMessageContextBegin_();
  if (objc_msgSend(a3, "type") == 2
    && (objc_msgSend(a3, "type") != 2 || !-[MTLToolsDevice supportsSparseHeaps](self, "supportsSparseHeaps")))
  {
    _MTLMessageContextPush_();
  }
  if (!objc_msgSend(a3, "size", v9, v10, v11, v12))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "storageMode") != 2
    && (objc_msgSend(a3, "storageMode")
     || !-[MTLToolsDevice supportsSharedStorageHeapResources](self, "supportsSharedStorageHeapResources")))
  {
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "cpuCacheMode") && objc_msgSend(a3, "cpuCacheMode") != 1)
    _MTLMessageContextPush_();
  if ((unint64_t)objc_msgSend(a3, "hazardTrackingMode") >= 3)
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "type") == 2 && objc_msgSend(a3, "storageMode") != 2)
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "addressRanges"))
  {
    if (!-[MTLToolsDevice supportsHeapWithAddressRanges](self, "supportsHeapWithAddressRanges"))
      _MTLMessageContextPush_();
    -[MTLDebugDevice validateAddressRanges:expectedTotalSize:context:](self, "validateAddressRanges:expectedTotalSize:context:", objc_msgSend(a3, "addressRanges"), objc_msgSend(a3, "size"), &v9);
  }
  if ((_QWORD)v9
    || (v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newHeapWithDescriptor:", a3)) == 0)
  {
    v5 = 0;
  }
  else
  {
    v7 = (void *)v6;
    v5 = -[MTLDebugHeap initWithHeap:device:]([MTLDebugHeap alloc], "initWithHeap:device:", v6, self);

  }
  _MTLMessageContextEnd();
  return v5;
}

- (id)newSharedTextureWithDescriptor:(id)a3
{
  MTLDebugTexture *v5;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!a3)
      goto LABEL_16;
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!objc_msgSend(a3, "usage") && complain_about_sloppy_texture_usage)
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "pixelFormat", v9, v10, v11, v12) == 261)
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "storageMode") != 2)
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "textureType") == 9)
      _validateTextureBufferDescriptor(a3, -[MTLToolsObject baseObject](self, "baseObject"));
    -[MTLDebugDevice validateResourceOptions:isTexture:isIOSurface:context:](self, "validateResourceOptions:isTexture:isIOSurface:context:", objc_msgSend(a3, "resourceOptions"), 1, 0, &v9);
    if (!(_QWORD)v9)
    {
      v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedTextureWithDescriptor:", a3);
      if (v7)
      {
        v8 = (void *)v7;
        v5 = -[MTLDebugTexture initWithBaseTexture:device:]([MTLDebugTexture alloc], "initWithBaseTexture:device:", v7, self);

        goto LABEL_17;
      }
    }
  }
LABEL_16:
  v5 = 0;
LABEL_17:
  _MTLMessageContextEnd();
  return v5;
}

- (id)newSharedTextureWithHandle:(id)a3
{
  __IOSurface *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  MTLDebugTexture *v12;

  if (!a3)
    MTLReportFailure();
  v5 = (__IOSurface *)objc_msgSend(a3, "ioSurface");
  if (!v5)
    MTLReportFailure();
  v6 = (void *)IOSurfaceCopyValue(v5, (CFStringRef)*MEMORY[0x24BDD8E90]);
  if (!v6)
    MTLReportFailure();
  v7 = (_QWORD *)MEMORY[0x24BDDDA58];
  if (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDDA58]))
  {
    v8 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *v7), "unsignedLongLongValue");
    if (-[MTLToolsDevice registryID](self, "registryID") != v8)
      MTLReportFailure();
    v9 = +[MTLToolsDevice newTextureDescriptorFromIOSurfaceProperties:](MTLToolsDevice, "newTextureDescriptorFromIOSurfaceProperties:", v6);

    v10 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedTextureWithHandle:", a3);
    if (v10)
    {
      v11 = (void *)v10;
      v12 = -[MTLDebugTexture initWithBaseTexture:device:]([MTLDebugTexture alloc], "initWithBaseTexture:device:", v10, self);

    }
    else
    {
      v12 = 0;
    }
    v6 = v9;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)validateMemorylessResource:(id)a3 context:(_MTLMessageContext *)a4
{
  if (objc_msgSend(a3, "storageMode") == 3)
  {
    objc_msgSend(a3, "pixelFormat");
    MTLPixelFormatGetInfoForDevice();
    _MTLMessageContextPush_();
    if (objc_msgSend(a3, "textureType", 0) != 2
      && objc_msgSend(a3, "textureType") != 4
      && objc_msgSend(a3, "textureType") != 3
      && objc_msgSend(a3, "textureType") != 8)
    {
      _MTLMessageContextPush_();
    }
  }
}

- (void)validateResourceOptions:(unint64_t)a3 isTexture:(BOOL)a4 isIOSurface:(BOOL)a5 context:(_MTLMessageContext *)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  int v10;
  unint64_t v11;
  unint64_t v12;

  v6 = a5;
  v7 = a4;
  if ((a3 & 0xF) >= 2)
  {
    v11 = a3;
    v12 = a3 & 0xF;
    _MTLMessageContextPush_();
  }
  v10 = a3 & 0xF0;
  if ((a3 & 0xF0) != 0 && v6)
    _MTLMessageContextPush_();
  if (v10 != 48)
  {
    if (v10 != 32
      && ((a3 & 0xF0) != 0
       || v7 && !-[MTLToolsDevice supportsSharedStorageTextures](self, "supportsSharedStorageTextures")))
    {
      goto LABEL_17;
    }
LABEL_15:
    if ((a3 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_18;
  }
  if (!v7)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice supportsMemorylessRenderTargets](self, "supportsMemorylessRenderTargets", v11, v12))
    goto LABEL_15;
LABEL_17:
  _MTLMessageContextPush_();
  if ((a3 & 0x100) == 0)
    goto LABEL_20;
LABEL_18:
  if ((a3 & 0x300) != 0x100)
    _MTLMessageContextPush_();
LABEL_20:
  if ((a3 & 0xFFFFFFFFFFE3FC00) != 0)
    _MTLMessageContextPush_();
}

- (void)validateNewBufferArgs:(unint64_t)a3 options:(unint64_t)a4 context:(_MTLMessageContext *)a5
{
  if (!a3)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxBufferLength](self, "maxBufferLength") < a3)
  {
    -[MTLToolsDevice maxBufferLength](self, "maxBufferLength");
    _MTLMessageContextPush_();
  }
  -[MTLDebugDevice validateResourceOptions:isTexture:isIOSurface:context:](self, "validateResourceOptions:isTexture:isIOSurface:context:", a4, 0, 0, a5);
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  MTLDebugBuffer *v7;
  uint64_t v8;
  void *v9;
  _OWORD v11[3];
  uint64_t v12;

  v12 = 0;
  memset(v11, 0, sizeof(v11));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  -[MTLDebugDevice validateNewBufferArgs:options:context:](self, "validateNewBufferArgs:options:context:", a3, a4, v11);
  _MTLMessageContextEnd();
  v7 = 0;
  if (!*(_QWORD *)&v11[0])
  {
    v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:", a3, a4);
    if (v8)
    {
      v9 = (void *)v8;
      v7 = -[MTLDebugBuffer initWithBuffer:device:options:]([MTLDebugBuffer alloc], "initWithBuffer:device:options:", v8, self, a4);

    }
    else
    {
      return 0;
    }
  }
  return v7;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  MTLDebugBuffer *v9;
  uint64_t v10;
  void *v11;
  _OWORD v13[3];
  uint64_t v14;

  v14 = 0;
  memset(v13, 0, sizeof(v13));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if ((a5 & 0xF0) == 0x20)
    _MTLMessageContextPush_();
  -[MTLDebugDevice validateNewBufferArgs:options:context:](self, "validateNewBufferArgs:options:context:", a4, a5, v13);
  if (!a3)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  if (*(_QWORD *)&v13[0])
    return 0;
  v10 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytes:length:options:", a3, a4, a5);
  if (!v10)
    return 0;
  v11 = (void *)v10;
  v9 = -[MTLDebugBuffer initWithBuffer:device:options:]([MTLDebugBuffer alloc], "initWithBuffer:device:options:", v10, self, a5);

  return v9;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6
{
  MTLDebugBuffer *v11;
  uint64_t v12;
  void *v13;
  _OWORD v15[3];
  uint64_t v16;

  v16 = 0;
  memset(v15, 0, sizeof(v15));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if ((a5 & 0xF0) == 0x20)
    _MTLMessageContextPush_();
  -[MTLDebugDevice validateNewBufferArgs:options:context:](self, "validateNewBufferArgs:options:context:", a4, a5, v15);
  if (!a3)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  if (*(_QWORD *)&v15[0])
    return 0;
  v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytesNoCopy:length:options:deallocator:", a3, a4, a5, a6);
  if (!v12)
    return 0;
  v13 = (void *)v12;
  v11 = -[MTLDebugBuffer initWithBuffer:device:bytes:options:]([MTLDebugBuffer alloc], "initWithBuffer:device:bytes:options:", v12, self, a3, a5);

  return v11;
}

- (id)newBufferWithDescriptor:(id)a3
{
  MTLDebugBuffer *v5;
  uint64_t v6;
  void *v7;
  _OWORD v9[3];
  uint64_t v10;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if ((objc_msgSend(a3, "contents") || objc_msgSend(a3, "noCopy"))
    && (objc_msgSend(a3, "resourceOptions") & 0xF0) != 0)
  {
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "noCopy") && !objc_msgSend(a3, "contents"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "addressRanges"))
  {
    if (!-[MTLToolsDevice supportsBufferWithAddressRanges](self, "supportsBufferWithAddressRanges"))
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "contents"))
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "noCopy"))
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "deallocator"))
      _MTLMessageContextPush_();
    -[MTLDebugDevice validateAddressRanges:expectedTotalSize:context:](self, "validateAddressRanges:expectedTotalSize:context:", objc_msgSend(a3, "addressRanges"), objc_msgSend(a3, "length"), v9);
  }
  _MTLMessageContextEnd();
  if (*(_QWORD *)&v9[0])
    return 0;
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithDescriptor:", a3);
  if (!v6)
    return 0;
  v7 = (void *)v6;
  v5 = -[MTLDebugBuffer initWithBuffer:device:bytes:options:]([MTLDebugBuffer alloc], "initWithBuffer:device:bytes:options:", v6, self, objc_msgSend(a3, "contents"), objc_msgSend(a3, "resourceOptions"));

  return v5;
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLDebugIndirectCommandBuffer *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD v27[3];
  uint64_t v28;

  v28 = 0;
  memset(v27, 0, sizeof(v27));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  -[MTLDebugDevice validateResourceOptions:isTexture:isIOSurface:context:](self, "validateResourceOptions:isTexture:isIOSurface:context:", a5, 0, 0, v27);
  v9 = objc_msgSend(a3, "commandTypes") & 0x60;
  v10 = objc_msgSend(a3, "commandTypes") & 0x18F;
  if (v9 && v10 || !(v9 | v10))
  {
    v15 = objc_msgSend(a3, "commandTypes");
    _MTLMessageContextPush_();
  }
  if ((objc_msgSend(a3, "commandTypes", v15) & 0xFFFFFFFFFFFFFE10) == 0)
  {
    if (!v10)
      goto LABEL_7;
    goto LABEL_6;
  }
  v16 = objc_msgSend(a3, "commandTypes");
  _MTLMessageContextPush_();
  if (v10)
  {
LABEL_6:
    -[MTLToolsObject originalObject](self, "originalObject", v16);
    MTLValidateFeatureSupport();
  }
LABEL_7:
  if (v9)
  {
    -[MTLToolsObject originalObject](self, "originalObject");
    MTLValidateFeatureSupport();
  }
  if ((objc_msgSend(a3, "commandTypes", v16) & 0x40) != 0)
  {
    -[MTLToolsObject originalObject](self, "originalObject");
    MTLValidateFeatureSupport();
  }
  if ((objc_msgSend(a3, "commandTypes") & 0xC) != 0)
  {
    -[MTLToolsObject originalObject](self, "originalObject");
    MTLValidateFeatureSupport();
  }
  if ((objc_msgSend(a3, "commandTypes") & 0x180) != 0)
  {
    -[MTLToolsObject originalObject](self, "originalObject");
    MTLValidateFeatureSupport();
  }
  if (v10)
  {
    if ((unint64_t)objc_msgSend(a3, "maxVertexBufferBindCount") >= 0x20)
    {
      v17 = objc_msgSend(a3, "maxVertexBufferBindCount");
      v22 = 31;
      _MTLMessageContextPush_();
    }
    if ((unint64_t)objc_msgSend(a3, "maxFragmentBufferBindCount", v17, v22) >= 0x20)
    {
      v18 = objc_msgSend(a3, "maxFragmentBufferBindCount");
      v23 = 31;
      _MTLMessageContextPush_();
    }
    if ((unint64_t)objc_msgSend(a3, "maxObjectBufferBindCount", v18, v23) >= 0x20)
    {
      v19 = objc_msgSend(a3, "maxObjectBufferBindCount");
      v24 = 31;
      _MTLMessageContextPush_();
    }
    if ((unint64_t)objc_msgSend(a3, "maxMeshBufferBindCount", v19, v24) >= 0x20)
    {
      v20 = objc_msgSend(a3, "maxMeshBufferBindCount");
      v25 = 31;
      _MTLMessageContextPush_();
    }
    if ((unint64_t)objc_msgSend(a3, "maxObjectThreadgroupMemoryBindCount", v20, v25) >= 0x20)
    {
      v17 = objc_msgSend(a3, "maxObjectThreadgroupMemoryBindCount");
      v22 = 31;
      _MTLMessageContextPush_();
    }
  }
  if (!v9)
  {
    if (!objc_msgSend(a3, "supportRayTracing"))
      goto LABEL_38;
    goto LABEL_35;
  }
  if ((unint64_t)objc_msgSend(a3, "maxKernelBufferBindCount") >= 0x20)
  {
    v17 = objc_msgSend(a3, "maxKernelBufferBindCount");
    v22 = 31;
    _MTLMessageContextPush_();
  }
  if ((unint64_t)objc_msgSend(a3, "maxKernelThreadgroupMemoryBindCount", v17, v22) >= 0x20)
  {
    v21 = objc_msgSend(a3, "maxKernelThreadgroupMemoryBindCount");
    v26 = 31;
    _MTLMessageContextPush_();
  }
  if ((objc_msgSend(a3, "supportRayTracing", v21, v26) & 1) != 0)
  {
    if (!-[MTLToolsDevice supportsRaytracing](self, "supportsRaytracing"))
      _MTLMessageContextPush_();
LABEL_35:
    if (v10 && !-[MTLToolsDevice supportsRaytracingFromRender](self, "supportsRaytracingFromRender"))
      _MTLMessageContextPush_();
  }
LABEL_38:
  _MTLMessageContextEnd();
  if (*(_QWORD *)&v27[0])
    return 0;
  v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIndirectCommandBufferWithDescriptor:maxCommandCount:options:", a3, a4, a5);
  if (!v12)
    return 0;
  v13 = (void *)v12;
  v11 = -[MTLDebugIndirectCommandBuffer initWithIndirectCommandBuffer:device:descriptor:maxCommandCount:options:]([MTLDebugIndirectCommandBuffer alloc], "initWithIndirectCommandBuffer:device:descriptor:maxCommandCount:options:", v12, self, a3, a4, a5);

  return v11;
}

- (id)newArgumentEncoderWithArguments:(id)a3
{
  uint64_t v5;
  void *v6;
  MTLDebugArgumentEncoder *v7;
  MTLDebugArgumentEncoder *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!(_QWORD)v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    v10 = objc_msgSend(a3, "count");
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      while (1)
      {
        v13 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v12, v14, v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((unint64_t)(objc_msgSend(v13, "dataType") - 121) > 0xE
            || -[MTLToolsDevice supportsBfloat16Buffers](self, "supportsBfloat16Buffers"))
          {
            goto LABEL_16;
          }
          v14 = v12;
          v15 = MTLDataTypeString();
        }
        else
        {
          v14 = v12;
        }
        _MTLMessageContextPush_();
LABEL_16:
        if (v11 == ++v12)
          goto LABEL_7;
      }
    }
    _MTLMessageContextPush_();
  }
LABEL_7:
  _MTLMessageContextEnd();
  v16 = 0;
  v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithArguments:structType:", a3, &v16);
  if (!v5)
    return 0;
  v6 = (void *)v5;
  v7 = [MTLDebugArgumentEncoder alloc];
  v8 = -[MTLDebugArgumentEncoder initWithBaseObject:structType:parent:](v7, "initWithBaseObject:structType:parent:", v6, v16, self);

  return v8;
}

- (id)newArgumentEncoderWithLayout:(id)a3
{
  id result;
  id v5;
  MTLDebugArgumentEncoder *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithLayout:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLDebugArgumentEncoder initWithBaseObject:structType:parent:]([MTLDebugArgumentEncoder alloc], "initWithBaseObject:structType:parent:", result, 0, self);

    return v6;
  }
  return result;
}

- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6
{
  unint64_t v11;
  uint64_t v12;
  MTLDebugTexture *v13;
  uint64_t v14;
  void *v15;
  _OWORD v17[3];
  uint64_t v18;

  v18 = 0;
  memset(v17, 0, sizeof(v17));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  v11 = -[MTLToolsDevice minBufferNoCopyAlignmentBytes](self, "minBufferNoCopyAlignmentBytes");
  v12 = objc_msgSend(a5, "resourceOptions");
  if ((v12 & 0xF0) != 0)
    _MTLMessageContextPush_();
  -[MTLDebugDevice validateNewBufferArgs:options:context:](self, "validateNewBufferArgs:options:context:", a4, v12, v17);
  if (!a3)
    _MTLMessageContextPush_();
  if (((v11 - 1) & (unint64_t)a3) != 0)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  if (*(_QWORD *)&v17[0])
    return 0;
  v14 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithBytesNoCopy:length:descriptor:deallocator:", a3, a4, a5, a6);
  if (!v14)
    return 0;
  v15 = (void *)v14;
  v13 = -[MTLDebugTexture initWithBaseTexture:device:]([MTLDebugTexture alloc], "initWithBaseTexture:device:", v14, self);

  return v13;
}

- (id)newDepthStencilStateWithDescriptor:(id)a3
{
  objc_super v6;

  if (!a3)
    MTLReportFailure();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!a3)
      return 0;
  }
  else
  {
    MTLReportFailure();
    if (!a3)
      return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)MTLDebugDevice;
    return -[MTLToolsDevice newDepthStencilStateWithDescriptor:](&v6, sel_newDepthStencilStateWithDescriptor_, a3);
  }
  return 0;
}

- (id)newTextureWithDescriptor:(id)a3
{
  MTLDebugTexture *v5;
  uint64_t v7;
  void *v8;
  _OWORD v9[3];
  uint64_t v10;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!a3)
      goto LABEL_21;
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!objc_msgSend(a3, "usage") && complain_about_sloppy_texture_usage)
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "pixelFormat") == 261)
      _MTLMessageContextPush_();
    -[MTLDebugDevice validateMemorylessResource:context:](self, "validateMemorylessResource:context:", a3, v9);
    if ((objc_msgSend(a3, "usage") & 0x20) != 0)
    {
      if ((objc_msgSend(a3, "usage") & 3) == 0)
        _MTLMessageContextPush_();
      if (objc_msgSend(a3, "pixelFormat") != 53
        && objc_msgSend(a3, "pixelFormat") != 54
        && objc_msgSend(a3, "pixelFormat") != 103)
      {
        _MTLMessageContextPush_();
      }
    }
    if (objc_msgSend(a3, "textureType") == 9)
      _validateTextureBufferDescriptor(a3, -[MTLToolsObject baseObject](self, "baseObject"));
    -[MTLDebugDevice validateResourceOptions:isTexture:isIOSurface:context:](self, "validateResourceOptions:isTexture:isIOSurface:context:", objc_msgSend(a3, "resourceOptions"), 1, 0, v9);
    if (!*(_QWORD *)&v9[0])
    {
      v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:", a3);
      if (v7)
      {
        v8 = (void *)v7;
        v5 = -[MTLDebugTexture initWithBaseTexture:device:]([MTLDebugTexture alloc], "initWithBaseTexture:device:", v7, self);

        goto LABEL_22;
      }
    }
  }
LABEL_21:
  v5 = 0;
LABEL_22:
  _MTLMessageContextEnd();
  return v5;
}

- (id)newSamplerStateWithDescriptor:(id)a3
{
  objc_super v6;

  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  validateMTLSamplerDescriptor(-[MTLToolsObject originalObject](self, "originalObject"), a3);
  if (objc_msgSend(a3, "supportArgumentBuffers"))
    MTLSamplerDescriptorHashMap::add(&self->_argumentBufferSamplers, (MTLSamplerDescriptor *)a3);
  v6.receiver = self;
  v6.super_class = (Class)MTLDebugDevice;
  return -[MTLToolsDevice newSamplerStateWithDescriptor:](&v6, sel_newSamplerStateWithDescriptor_, a3);
}

- (void)notifySamplerStateDeallocated:(id)a3
{
  MTLSamplerDescriptor *v4;

  v4 = (MTLSamplerDescriptor *)objc_msgSend(a3, "descriptor");
  if (-[MTLSamplerDescriptor supportArgumentBuffers](v4, "supportArgumentBuffers"))
    MTLSamplerDescriptorHashMap::remove(&self->_argumentBufferSamplers, v4);
}

- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4
{
  id result;
  id v7;
  MTLDebugLibrary *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDefaultLibraryWithBundle:error:", a3, a4);
  if (result)
  {
    v7 = result;
    v8 = -[MTLDebugLibrary initWithLibrary:parent:type:code:options:]([MTLDebugLibrary alloc], "initWithLibrary:parent:type:code:options:", result, self, 0, objc_msgSend(a3, "pathForResource:ofType:", CFSTR("default"), CFSTR("metallib")), 0);

    return v8;
  }
  return result;
}

- (id)newDefaultLibrary
{
  id result;
  id v4;
  MTLDebugLibrary *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDefaultLibrary");
  if (result)
  {
    v4 = result;
    v5 = -[MTLDebugLibrary initWithLibrary:parent:type:code:options:]([MTLDebugLibrary alloc], "initWithLibrary:parent:type:code:options:", result, self, 0, 0, 0);

    return v5;
  }
  return result;
}

- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  MTLDebugBinaryArchive *v10;

  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _MTLMessageContextPush_();
  v7 = (void *)objc_msgSend(a3, "url");
  if (v7 && (objc_msgSend(v7, "isFileURL") & 1) == 0)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBinaryArchiveWithDescriptor:error:", a3, a4);
  if (!v8)
    return 0;
  v9 = (void *)v8;
  v10 = -[MTLToolsObject initWithBaseObject:parent:]([MTLDebugBinaryArchive alloc], "initWithBaseObject:parent:", v8, self);

  return v10;
}

- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5
{
  id result;
  id v10;
  MTLDebugBinaryArchive *v11;

  if (a4 && (objc_msgSend(a4, "isFileURL") & 1) == 0)
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBinaryLibraryWithOptions:url:error:", a3, a4, a5);
  if (result)
  {
    v10 = result;
    v11 = -[MTLToolsObject initWithBaseObject:parent:]([MTLDebugBinaryArchive alloc], "initWithBaseObject:parent:", result, self);

    return v11;
  }
  return result;
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  return -[MTLDebugDevice newDynamicLibraryWithURL:options:error:](self, "newDynamicLibraryWithURL:options:error:", a3, 0, a4);
}

- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!(_QWORD)v11 && (objc_msgSend(a3, "isFileURL") & 1) == 0)
    _MTLMessageContextPush_();
  if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0
    && (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsStatefulDynamicLibraries") & 1) == 0)
  {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugDevice;
  return -[MTLToolsDevice newDynamicLibraryWithURL:options:error:](&v10, sel_newDynamicLibraryWithURL_options_error_, a3, a4, a5);
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a4)
    _MTLMessageContextPush_();
  if (!(_QWORD)v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    if (!objc_msgSend(a4, "computeFunction"))
      _MTLMessageContextPush_();
  }
  if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsStatefulDynamicLibraries") & 1) != 0)
  {
    if (!a3)
    {
LABEL_13:
      _MTLMessageContextPush_();
      goto LABEL_11;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
LABEL_11:
  _MTLMessageContextEnd();
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugDevice;
  return -[MTLToolsDevice newDynamicLibrary:computeDescriptor:error:](&v10, sel_newDynamicLibrary_computeDescriptor_error_, a3, a4, a5);
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!(_QWORD)v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
  }
  if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugDevice;
  return -[MTLToolsDevice newDynamicLibrary:error:](&v8, sel_newDynamicLibrary_error_, a3, a4);
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!(_QWORD)v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    if (!objc_msgSend(a3, "computeFunction"))
      _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugDevice;
  return -[MTLToolsDevice loadDynamicLibrariesForComputeDescriptor:options:error:](&v10, sel_loadDynamicLibrariesForComputeDescriptor_options_error_, a3, a4, a5);
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  objc_super v12[4];
  uint64_t v13;

  v13 = 0;
  memset(&v12[1], 0, 48);
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
  {
    _MTLMessageContextPush_();
    if (a4)
      goto LABEL_3;
LABEL_5:
    _MTLMessageContextPush_();
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  _MTLMessageContextEnd();
  v12[0].receiver = self;
  v12[0].super_class = (Class)MTLDebugDevice;
  return -[objc_super loadDynamicLibrariesForFunction:insertLibraries:options:error:](v12, sel_loadDynamicLibrariesForFunction_insertLibraries_options_error_, a3, a4, a5, a6);
}

- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;

  v6 = a4;
  if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0)
    MTLReportFailure();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "validateDynamicLibrary:state:error:", objc_msgSend(a3, "baseObject"), v6, a5);
}

- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4
{
  if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0)
    MTLReportFailure();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "validateDynamicLibraryURL:error:", a3, a4);
}

- (void)validateLinkedFunctions:(id)a3 context:(_MTLMessageContext *)a4
{
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  const __CFString *v25;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  void *v33;
  _OWORD v34[2];
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v26 = -[MTLToolsObject baseObject](self, "baseObject");
    if (objc_msgSend(a3, "functions")
      && objc_msgSend((id)objc_msgSend(a3, "functions"), "count")
      && (objc_msgSend(v26, "supportsFunctionPointers") & 1) == 0)
    {
      _MTLMessageContextPush_();
    }
    if (objc_msgSend(a3, "groups"))
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = (id)objc_msgSend(a3, "groups");
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      if (v29)
      {
        LOBYTE(v31) = 0;
        v28 = *(_QWORD *)v49;
        do
        {
          v5 = 0;
          do
          {
            if (*(_QWORD *)v49 != v28)
            {
              v6 = v5;
              objc_enumerationMutation(obj);
              v5 = v6;
            }
            v30 = v5;
            v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v5);
            v7 = v31
              || objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "groups"), "objectForKeyedSubscript:", v33), "count") != 0;
            v31 = v7;
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v8 = (void *)objc_msgSend((id)objc_msgSend(a3, "groups", v23), "objectForKeyedSubscript:", v33);
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
            if (v9)
            {
              v10 = *(_QWORD *)v45;
              do
              {
                for (i = 0; i != v9; ++i)
                {
                  if (*(_QWORD *)v45 != v10)
                    objc_enumerationMutation(v8);
                  v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
                  v40 = 0u;
                  v41 = 0u;
                  v42 = 0u;
                  v43 = 0u;
                  v13 = (void *)objc_msgSend(a3, "functions", v23, v25);
                  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
                  if (v14)
                  {
                    v15 = *(_QWORD *)v41;
LABEL_22:
                    v16 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v41 != v15)
                        objc_enumerationMutation(v13);
                      if (*(void **)(*((_QWORD *)&v40 + 1) + 8 * v16) == v12)
                        break;
                      if (v14 == ++v16)
                      {
                        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
                        if (v14)
                          goto LABEL_22;
                        goto LABEL_28;
                      }
                    }
                  }
                  else
                  {
LABEL_28:
                    v23 = objc_msgSend((id)objc_msgSend(v12, "name"), "UTF8String");
                    v25 = (const __CFString *)objc_msgSend(v33, "UTF8String");
                    _MTLMessageContextPush_();
                  }
                }
                v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
              }
              while (v9);
            }
            v5 = v30 + 1;
          }
          while (v30 + 1 != v29);
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
        }
        while (v29);
        if (v31 && (objc_msgSend(v26, "supportsFunctionPointers") & 1) == 0)
          _MTLMessageContextPush_();
      }
    }
    v17 = (void *)objc_msgSend(a3, "binaryFunctions", v23);
    v18 = v17;
    if (v17 && objc_msgSend(v17, "count"))
    {
      if ((objc_msgSend(v26, "supportsFunctionPointers") & 1) == 0)
      {
        v24 = CFSTR("binaryFunctions");
        _MTLMessageContextPush_();
      }
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v52, 16, v24);
      if (v19)
      {
        v20 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v37 != v20)
              objc_enumerationMutation(v18);
            v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
            if (!objc_msgSend(v22, "precompiledOutput", v24, v25))
            {
              v24 = (const __CFString *)objc_msgSend((id)objc_msgSend(v22, "name"), "UTF8String");
              v25 = CFSTR("binaryFunctions");
              _MTLMessageContextPush_();
            }
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
        }
        while (v19);
      }
    }
    memset(v34, 0, sizeof(v34));
    v35 = 1065353216;
    _validateUniqueNames((uint64_t)a4, v34, (void *)objc_msgSend(a3, "functions", v24), (uint64_t)"functions");
    _validateUniqueNames((uint64_t)a4, v34, (void *)objc_msgSend(a3, "privateFunctions"), (uint64_t)"privateFunctions");
    _validateUniqueNames((uint64_t)a4, v34, (void *)objc_msgSend(a3, "binaryFunctions"), (uint64_t)"binaryFunctions");
    std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table((uint64_t)v34);
  }
}

- (void)validateImageblockTypes:(id)a3 reflection:(id)a4 context:(_MTLMessageContext *)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int ComponentCount;
  uint64_t ShaderTypeName;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    if (objc_msgSend(a4, "tileBindings"))
    {
      if (objc_msgSend((id)objc_msgSend(a3, "tileFunction"), "functionType") == 3)
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v6 = (void *)objc_msgSend(a4, "tileBindings");
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v32;
          while (2)
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v32 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              if (objc_msgSend(v11, "type") == 17 && !objc_msgSend(v11, "imageBlockKind"))
              {
                if (objc_msgSend((id)objc_msgSend(v11, "dataTypeDescription"), "dataType") == 1)
                {
                  v27 = 0u;
                  v28 = 0u;
                  v29 = 0u;
                  v30 = 0u;
                  obj = (id)objc_msgSend((id)objc_msgSend(v11, "dataTypeDescription"), "members");
                  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                  if (v12)
                  {
                    v13 = v12;
                    v14 = *(_QWORD *)v28;
                    do
                    {
                      for (j = 0; j != v13; ++j)
                      {
                        if (*(_QWORD *)v28 != v14)
                          objc_enumerationMutation(obj);
                        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                        if (objc_msgSend(v16, "dataType", v22, v23, v24))
                        {
                          v17 = objc_msgSend(v16, "renderTargetIndex");
                          v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", v17), "pixelFormat");
                          MTLPixelFormatGetInfoForDevice();
                          MTLDataTypeGetComponentType();
                          ComponentCount = MTLDataTypeGetComponentCount();
                          ShaderTypeName = MTLDataTypeGetShaderTypeName();
                          v23 = v17;
                          v24 = 0;
                          v22 = ShaderTypeName;
                          _MTLMessageContextPush_();
                          v21 = v18 == 1 && ComponentCount == 4;
                          if (!v21 && v18 == 1)
                          {
                            v23 = v17;
                            v24 = 0;
                            v22 = ShaderTypeName;
                            _MTLMessageContextPush_();
                          }
                        }
                      }
                      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                    }
                    while (v13);
                  }
                }
                return;
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
            if (v8)
              continue;
            break;
          }
        }
      }
    }
  }
}

- (id)_newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v11;
  uint64_t v12;
  void *v13;
  MTLDebugRenderPipelineState *v14;
  MTLDebugRenderPipelineState *v15;
  void *v17;
  _OWORD v18[3];
  uint64_t v19;

  v19 = 0;
  memset(v18, 0, sizeof(v18));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!*(_QWORD *)&v18[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    if ((objc_msgSend(a3, "isRasterizationEnabled") & 1) == 0
      && ((objc_msgSend(a3, "isRasterizationEnabled") & 1) != 0 || objc_msgSend(a3, "fragmentFunction")))
    {
      _MTLMessageContextPush_();
    }
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "vertexLinkedFunctions"), v18);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "fragmentLinkedFunctions"), v18);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "objectLinkedFunctions"), v18);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "meshLinkedFunctions"), v18);
    if (!*(_QWORD *)&v18[0])
    {
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "vertexPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "fragmentPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "objectPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "meshPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  v11 = -[MTLToolsDevice unwrapMTLRenderPipelineDescriptor:](self, "unwrapMTLRenderPipelineDescriptor:", a3);
  v17 = 0;
  v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithDescriptor:options:reflection:error:", v11, -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, objc_msgSend(a3, "pipelineLibrary") == 0), &v17, a6);
  v13 = (void *)v12;
  if (a5)
  {
    if ((~(_BYTE)a4 & 3) != 0)
    {
      objc_msgSend(v11, "setResourceIndex:", *MEMORY[0x24BDDD9D8]);
      objc_msgSend(v11, "setForceResourceIndex:", 0);

      if (v13)
        goto LABEL_27;
      return 0;
    }
    *a5 = v17;
  }
  if (!v12)
    return 0;
LABEL_27:
  v14 = [MTLDebugRenderPipelineState alloc];
  v15 = -[MTLDebugRenderPipelineState initWithPipelineState:reflection:parent:descriptor:](v14, "initWithPipelineState:reflection:parent:descriptor:", v13, v17, self, a3);

  return v15;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return -[MTLDebugDevice _newRenderPipelineStateWithDescriptor:options:reflection:error:](self, "_newRenderPipelineStateWithDescriptor:options:reflection:error:", a3, a4 & 0xFFFFFFFFFFFDFFFFLL, a5, a6);
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v5;

  v5 = 0;
  return -[MTLDebugDevice _newRenderPipelineStateWithDescriptor:options:reflection:error:](self, "_newRenderPipelineStateWithDescriptor:options:reflection:error:", a3, 0x20000, &v5, a4);
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__MTLDebugDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_24F7945F0;
  v4[4] = a4;
  -[MTLDebugDevice _newRenderPipelineStateWithDescriptor:options:completionHandler:](self, "_newRenderPipelineStateWithDescriptor:options:completionHandler:", a3, 0x20000, v4);
}

uint64_t __73__MTLDebugDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __81__MTLDebugDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v5[3] = &unk_24F7945F0;
  v5[4] = a5;
  -[MTLDebugDevice _newRenderPipelineStateWithDescriptor:options:completionHandler:](self, "_newRenderPipelineStateWithDescriptor:options:completionHandler:", a3, a4 & 0xFFFFFFFFFFFDFFFFLL, v5);
}

uint64_t __81__MTLDebugDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  _QWORD v13[9];
  BOOL v14;
  _OWORD v15[3];
  uint64_t v16;

  v16 = 0;
  memset(v15, 0, sizeof(v15));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!*(_QWORD *)&v15[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    if ((objc_msgSend(a3, "isRasterizationEnabled") & 1) == 0
      && ((objc_msgSend(a3, "isRasterizationEnabled") & 1) != 0 || objc_msgSend(a3, "fragmentFunction")))
    {
      _MTLMessageContextPush_();
    }
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "vertexLinkedFunctions"), v15);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "fragmentLinkedFunctions"), v15);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "objectLinkedFunctions"), v15);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "meshLinkedFunctions"), v15);
    if (!*(_QWORD *)&v15[0])
    {
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "vertexPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "fragmentPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "objectPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "meshPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  v9 = (void *)objc_msgSend(a3, "copy");
  v10 = -[MTLToolsDevice unwrapMTLRenderPipelineDescriptor:](self, "unwrapMTLRenderPipelineDescriptor:", v9);
  v11 = -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, objc_msgSend(v9, "pipelineLibrary") == 0);
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__MTLDebugDevice__newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v13[3] = &unk_24F794640;
  v13[4] = self;
  v13[5] = v9;
  v14 = (~(_DWORD)a4 & 3) != 0;
  v13[7] = a5;
  v13[8] = a4;
  v13[6] = v10;
  objc_msgSend(v12, "newRenderPipelineStateWithDescriptor:options:completionHandler:", v10, v11, v13);

}

void __82__MTLDebugDevice__newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLDebugRenderPipelineState *a2, uint64_t a3)
{
  MTLDebugRenderPipelineState *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];

  v3 = a2;
  if (a2)
    v3 = -[MTLDebugRenderPipelineState initWithPipelineState:reflection:parent:descriptor:]([MTLDebugRenderPipelineState alloc], "initWithPipelineState:reflection:parent:descriptor:", a2, a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 48), "setResourceIndex:", *MEMORY[0x24BDDD9D8]);
    objc_msgSend(*(id *)(a1 + 48), "setForceResourceIndex:", 0);
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "baseObject");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __82__MTLDebugDevice__newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke_2;
    v9[3] = &unk_24F795660;
    v6 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v9[4] = v3;
    v9[5] = v8;
    objc_msgSend(v5, "newRenderPipelineStateWithDescriptor:options:completionHandler:", v6, v7, v9);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __82__MTLDebugDevice__newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v5;

  v5 = 0;
  return -[MTLDebugDevice _newComputePipelineStateWithDescriptor:options:reflection:error:](self, "_newComputePipelineStateWithDescriptor:options:reflection:error:", a3, 0x20000, &v5, a4);
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return -[MTLDebugDevice _newComputePipelineStateWithDescriptor:options:reflection:error:](self, "_newComputePipelineStateWithDescriptor:options:reflection:error:", a3, a4 & 0xFFFFFFFFFFFDFFFFLL, a5, a6);
}

- (id)_newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v11;
  uint64_t v12;
  void *v13;
  MTLDebugComputePipelineState *v14;
  MTLDebugComputePipelineState *v15;
  void *v17;
  _OWORD v18[3];
  uint64_t v19;

  v19 = 0;
  memset(v18, 0, sizeof(v18));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!*(_QWORD *)&v18[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "linkedFunctions"), v18);
    if (!*(_QWORD *)&v18[0]
      && (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0
      && (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsStatefulDynamicLibraries") & 1) == 0
      && objc_msgSend((id)objc_msgSend(a3, "preloadedLibraries"), "count"))
    {
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  v11 = -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:", a3);
  v17 = 0;
  v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithDescriptor:options:reflection:error:", v11, -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, objc_msgSend(a3, "pipelineLibrary") == 0), &v17, a6);
  v13 = (void *)v12;
  if (a5)
  {
    if ((~(_BYTE)a4 & 3) != 0)
    {
      objc_msgSend(v11, "setResourceIndex:", *MEMORY[0x24BDDD9D8]);
      objc_msgSend(v11, "setForceResourceIndex:", 0);

      if (v13)
        goto LABEL_15;
      return 0;
    }
    *a5 = v17;
  }
  if (!v12)
    return 0;
LABEL_15:
  v14 = [MTLDebugComputePipelineState alloc];
  v15 = -[MTLDebugComputePipelineState initWithComputePipelineState:reflection:parent:descriptor:](v14, "initWithComputePipelineState:reflection:parent:descriptor:", v13, v17, self, a3);

  return v15;
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__MTLDebugDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_24F794668;
  v4[4] = a4;
  -[MTLDebugDevice _newComputePipelineStateWithDescriptor:options:completionHandler:](self, "_newComputePipelineStateWithDescriptor:options:completionHandler:", a3, 0x20000, v4);
}

uint64_t __74__MTLDebugDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __82__MTLDebugDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v5[3] = &unk_24F794668;
  v5[4] = a5;
  -[MTLDebugDevice _newComputePipelineStateWithDescriptor:options:completionHandler:](self, "_newComputePipelineStateWithDescriptor:options:completionHandler:", a3, a4 & 0xFFFFFFFFFFFDFFFFLL, v5);
}

uint64_t __82__MTLDebugDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  _QWORD v13[10];
  _QWORD v14[3];
  BOOL v15;

  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  v9 = (void *)objc_msgSend(a3, "copy");
  v10 = -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:", v9);
  v11 = -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, objc_msgSend(v9, "pipelineLibrary") == 0);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = (~(_BYTE)a4 & 3) != 0;
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__MTLDebugDevice__newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v13[3] = &unk_24F7956B0;
  v13[4] = self;
  v13[5] = v9;
  v13[8] = v14;
  v13[9] = a4;
  v13[6] = v10;
  v13[7] = a5;
  objc_msgSend(v12, "newComputePipelineStateWithDescriptor:options:completionHandler:", v10, v11, v13);

  _Block_object_dispose(v14, 8);
}

void __83__MTLDebugDevice__newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLDebugComputePipelineState *a2, uint64_t a3)
{
  MTLDebugComputePipelineState *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];

  v3 = a2;
  if (a2)
    v3 = -[MTLDebugComputePipelineState initWithComputePipelineState:reflection:parent:descriptor:]([MTLDebugComputePipelineState alloc], "initWithComputePipelineState:reflection:parent:descriptor:", a2, a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "setResourceIndex:", *MEMORY[0x24BDDD9D8]);
    objc_msgSend(*(id *)(a1 + 48), "setForceResourceIndex:", 0);
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "baseObject");
    v6 = *(_QWORD *)(a1 + 72);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __83__MTLDebugDevice__newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke_2;
    v9[3] = &unk_24F795688;
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9[4] = v3;
    v9[5] = v8;
    objc_msgSend(v5, "newComputePipelineStateWithDescriptor:options:completionHandler:", v7, v6, v9);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __83__MTLDebugDevice__newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4
{
  uint64_t v5;

  v5 = 0;
  return -[MTLDebugDevice _newComputePipelineStateWithFunction:options:reflection:error:](self, "_newComputePipelineStateWithFunction:options:reflection:error:", a3, 0x20000, &v5, a4);
}

- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return -[MTLDebugDevice _newComputePipelineStateWithFunction:options:reflection:error:](self, "_newComputePipelineStateWithFunction:options:reflection:error:", a3, a4 & 0xFFFFFFFFFFFDFFFFLL, a5, a6);
}

- (id)_newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  uint64_t v11;
  void *v12;
  void *v13;
  MTLDebugComputePipelineState *v14;
  MTLDebugComputePipelineState *v15;
  void *v17;

  v17 = 0;
  v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithFunction:options:reflection:error:", objc_msgSend(a3, "baseObject"), -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, 1), &v17, a6);
  v12 = (void *)v11;
  if (a5)
  {
    if ((~(_DWORD)a4 & 3) != 0)
    {

      if (v12)
        goto LABEL_5;
      return 0;
    }
    *a5 = v17;
  }
  if (!v11)
    return 0;
LABEL_5:
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setComputeFunction:", a3);
  v14 = [MTLDebugComputePipelineState alloc];
  v15 = -[MTLDebugComputePipelineState initWithComputePipelineState:reflection:parent:descriptor:](v14, "initWithComputePipelineState:reflection:parent:descriptor:", v12, v17, self, v13);

  return v15;
}

- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__MTLDebugDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke;
  v4[3] = &unk_24F794668;
  v4[4] = a4;
  -[MTLDebugDevice _newComputePipelineStateWithFunction:options:completionHandler:](self, "_newComputePipelineStateWithFunction:options:completionHandler:", a3, 0x20000, v4);
}

uint64_t __72__MTLDebugDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __80__MTLDebugDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke;
  v5[3] = &unk_24F794668;
  v5[4] = a5;
  -[MTLDebugDevice _newComputePipelineStateWithFunction:options:completionHandler:](self, "_newComputePipelineStateWithFunction:options:completionHandler:", a3, a4 & 0xFFFFFFFFFFFDFFFFLL, v5);
}

uint64_t __80__MTLDebugDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  char v9;
  unint64_t v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  _QWORD v14[8];
  BOOL v15;

  v9 = ~(_BYTE)a4;
  v10 = -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, 1);
  v11 = (v9 & 3) != 0;
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13 = objc_msgSend(a3, "baseObject");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__MTLDebugDevice__newComputePipelineStateWithFunction_options_completionHandler___block_invoke;
  v14[3] = &unk_24F7956D8;
  v14[4] = a3;
  v14[5] = self;
  v15 = v11;
  v14[6] = a5;
  v14[7] = a4;
  objc_msgSend(v12, "newComputePipelineStateWithFunction:options:completionHandler:", v13, v10, v14);
}

void __81__MTLDebugDevice__newComputePipelineStateWithFunction_options_completionHandler___block_invoke(uint64_t a1, MTLDebugComputePipelineState *a2, uint64_t a3)
{
  MTLDebugComputePipelineState *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];

  v4 = a2;
  if (a2)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setComputeFunction:", *(_QWORD *)(a1 + 32));
    v4 = -[MTLDebugComputePipelineState initWithComputePipelineState:reflection:parent:descriptor:]([MTLDebugComputePipelineState alloc], "initWithComputePipelineState:reflection:parent:descriptor:", v4, a3, *(_QWORD *)(a1 + 40), v6);

  }
  if (*(_BYTE *)(a1 + 64))
  {
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "baseObject");
    v8 = objc_msgSend(*(id *)(a1 + 32), "baseObject");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __81__MTLDebugDevice__newComputePipelineStateWithFunction_options_completionHandler___block_invoke_2;
    v11[3] = &unk_24F795688;
    v10 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v11[4] = v4;
    v11[5] = v10;
    objc_msgSend(v7, "newComputePipelineStateWithFunction:options:completionHandler:", v8, v9, v11);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __81__MTLDebugDevice__newComputePipelineStateWithFunction_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v11;
  void *v12;
  MTLDebugRenderPipelineState *v13;
  MTLDebugRenderPipelineState *v14;
  void *v16;
  _OWORD v17[3];
  uint64_t v18;

  v18 = 0;
  memset(v17, 0, sizeof(v17));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!*(_QWORD *)&v17[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "linkedFunctions"), v17);
    if (!*(_QWORD *)&v17[0]
      && (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0
      && objc_msgSend((id)objc_msgSend(a3, "preloadedLibraries"), "count"))
    {
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  v11 = -[MTLToolsDevice unwrapMTLTileRenderPipelineDescriptor:](self, "unwrapMTLTileRenderPipelineDescriptor:", a3);
  v16 = 0;
  v12 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithTileDescriptor:options:reflection:error:", v11, -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, 1), &v16, a6);
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  -[MTLDebugDevice validateImageblockTypes:reflection:context:](self, "validateImageblockTypes:reflection:context:", v11, v16, v17);
  _MTLMessageContextEnd();
  if (a5)
  {
    if ((~(_DWORD)a4 & 3) != 0)
    {

      if (v12)
        goto LABEL_14;
      return 0;
    }
    *a5 = v16;
  }
  if (!v12)
    return 0;
LABEL_14:
  v13 = [MTLDebugRenderPipelineState alloc];
  v14 = -[MTLDebugRenderPipelineState initWithPipelineState:reflection:parent:tileDescriptor:](v13, "initWithPipelineState:reflection:parent:tileDescriptor:", v12, v16, self, a3);

  return v14;
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v5;

  v5 = 0;
  return -[MTLDebugDevice _newRenderPipelineStateWithTileDescriptor:options:reflection:error:](self, "_newRenderPipelineStateWithTileDescriptor:options:reflection:error:", a3, 0x20000, &v5, a4);
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return -[MTLDebugDevice _newRenderPipelineStateWithTileDescriptor:options:reflection:error:](self, "_newRenderPipelineStateWithTileDescriptor:options:reflection:error:", a3, a4 & 0xFFFFFFFFFFFDFFFFLL, a5, a6);
}

- (void)_newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  _QWORD v13[9];
  BOOL v14;
  _OWORD v15[3];
  uint64_t v16;

  v16 = 0;
  memset(v15, 0, sizeof(v15));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!*(_QWORD *)&v15[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "linkedFunctions"), v15);
    if (!*(_QWORD *)&v15[0]
      && (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries") & 1) == 0
      && objc_msgSend((id)objc_msgSend(a3, "preloadedLibraries"), "count"))
    {
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  v9 = (void *)objc_msgSend(a3, "copy");
  v10 = -[MTLToolsDevice unwrapMTLTileRenderPipelineDescriptor:](self, "unwrapMTLTileRenderPipelineDescriptor:", v9);
  v11 = -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, 1);
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__MTLDebugDevice__newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke;
  v13[3] = &unk_24F794640;
  v13[4] = self;
  v13[5] = v9;
  v14 = (~(_DWORD)a4 & 3) != 0;
  v13[7] = a5;
  v13[8] = a4;
  v13[6] = v10;
  objc_msgSend(v12, "newRenderPipelineStateWithTileDescriptor:options:completionHandler:", v10, v11, v13);

}

void __86__MTLDebugDevice__newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLDebugRenderPipelineState *a2, uint64_t a3)
{
  MTLDebugRenderPipelineState *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];

  v3 = a2;
  if (a2)
    v3 = -[MTLDebugRenderPipelineState initWithPipelineState:reflection:parent:tileDescriptor:]([MTLDebugRenderPipelineState alloc], "initWithPipelineState:reflection:parent:tileDescriptor:", a2, a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 72))
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "baseObject");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __86__MTLDebugDevice__newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke_2;
    v9[3] = &unk_24F795660;
    v6 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v9[4] = v3;
    v9[5] = v8;
    objc_msgSend(v5, "newRenderPipelineStateWithTileDescriptor:options:completionHandler:", v6, v7, v9);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __86__MTLDebugDevice__newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __77__MTLDebugDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_24F7945F0;
  v4[4] = a4;
  -[MTLDebugDevice _newRenderPipelineStateWithTileDescriptor:options:completionHandler:](self, "_newRenderPipelineStateWithTileDescriptor:options:completionHandler:", a3, 0x20000, v4);
}

uint64_t __77__MTLDebugDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __85__MTLDebugDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke;
  v5[3] = &unk_24F7945F0;
  v5[4] = a5;
  -[MTLDebugDevice _newRenderPipelineStateWithTileDescriptor:options:completionHandler:](self, "_newRenderPipelineStateWithTileDescriptor:options:completionHandler:", a3, a4 & 0xFFFFFFFFFFFDFFFFLL, v5);
}

uint64_t __85__MTLDebugDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v11;
  uint64_t v12;
  void *v13;
  MTLDebugRenderPipelineState *v14;
  MTLDebugRenderPipelineState *v15;
  void *v17;
  _OWORD v18[3];
  uint64_t v19;

  v19 = 0;
  memset(v18, 0, sizeof(v18));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!*(_QWORD *)&v18[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
  }
  if ((objc_msgSend(-[MTLToolsObject originalObject](self, "originalObject"), "supportsMeshShaders") & 1) == 0)
    _MTLMessageContextPush_();
  if (!*(_QWORD *)&v18[0])
  {
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "objectLinkedFunctions"), v18);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "meshLinkedFunctions"), v18);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "fragmentLinkedFunctions"), v18);
    if (!*(_QWORD *)&v18[0])
    {
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "objectPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "meshPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "fragmentPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  v11 = -[MTLToolsDevice unwrapMTLMeshRenderPipelineDescriptor:](self, "unwrapMTLMeshRenderPipelineDescriptor:", a3);
  v17 = 0;
  v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithMeshDescriptor:options:reflection:error:", v11, -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, 1), &v17, a6);
  v13 = (void *)v12;
  if (a5)
  {
    if ((~(_BYTE)a4 & 3) != 0)
    {
      objc_msgSend(v11, "setResourceIndex:", *MEMORY[0x24BDDD9D8]);
      objc_msgSend(v11, "setForceResourceIndex:", 0);

      if (v13)
        goto LABEL_23;
      return 0;
    }
    *a5 = v17;
  }
  if (!v12)
    return 0;
LABEL_23:
  v14 = [MTLDebugRenderPipelineState alloc];
  v15 = -[MTLDebugRenderPipelineState initWithPipelineState:reflection:parent:meshDescriptor:](v14, "initWithPipelineState:reflection:parent:meshDescriptor:", v13, v17, self, a3);

  return v15;
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v5;

  v5 = 0;
  return -[MTLDebugDevice _newRenderPipelineStateWithMeshDescriptor:options:reflection:error:](self, "_newRenderPipelineStateWithMeshDescriptor:options:reflection:error:", a3, 0x20000, &v5, a4);
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return -[MTLDebugDevice _newRenderPipelineStateWithMeshDescriptor:options:reflection:error:](self, "_newRenderPipelineStateWithMeshDescriptor:options:reflection:error:", a3, a4 & 0xFFFFFFFFFFFDFFFFLL, a5, a6);
}

- (void)_newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  _QWORD v13[9];
  BOOL v14;
  _OWORD v15[3];
  uint64_t v16;

  v16 = 0;
  memset(v15, 0, sizeof(v15));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!*(_QWORD *)&v15[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
  }
  if ((objc_msgSend(-[MTLToolsObject originalObject](self, "originalObject"), "supportsMeshShaders") & 1) == 0)
    _MTLMessageContextPush_();
  if (!*(_QWORD *)&v15[0])
  {
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "objectLinkedFunctions"), v15);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "meshLinkedFunctions"), v15);
    -[MTLDebugDevice validateLinkedFunctions:context:](self, "validateLinkedFunctions:context:", objc_msgSend(a3, "fragmentLinkedFunctions"), v15);
    if (!*(_QWORD *)&v15[0])
    {
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "objectPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "meshPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
      if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries") & 1) == 0
        && objc_msgSend((id)objc_msgSend(a3, "fragmentPreloadedLibraries"), "count"))
      {
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  v9 = (void *)objc_msgSend(a3, "copy");
  v10 = -[MTLToolsDevice unwrapMTLMeshRenderPipelineDescriptor:](self, "unwrapMTLMeshRenderPipelineDescriptor:", v9);
  v11 = -[MTLToolsDevice debugPipelineOptions:includePipelinePerfStats:](self, "debugPipelineOptions:includePipelinePerfStats:", a4, 1);
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__MTLDebugDevice__newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke;
  v13[3] = &unk_24F794640;
  v13[4] = self;
  v13[5] = v9;
  v14 = (~(_DWORD)a4 & 3) != 0;
  v13[7] = a5;
  v13[8] = a4;
  v13[6] = v10;
  objc_msgSend(v12, "newRenderPipelineStateWithMeshDescriptor:options:completionHandler:", v10, v11, v13);

}

void __86__MTLDebugDevice__newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLDebugRenderPipelineState *a2, uint64_t a3)
{
  MTLDebugRenderPipelineState *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];

  v3 = a2;
  if (a2)
    v3 = -[MTLDebugRenderPipelineState initWithPipelineState:reflection:parent:meshDescriptor:]([MTLDebugRenderPipelineState alloc], "initWithPipelineState:reflection:parent:meshDescriptor:", a2, a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 48), "setResourceIndex:", *MEMORY[0x24BDDD9D8]);
    objc_msgSend(*(id *)(a1 + 48), "setForceResourceIndex:", 0);
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "baseObject");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __86__MTLDebugDevice__newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke_2;
    v9[3] = &unk_24F795660;
    v6 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v9[4] = v3;
    v9[5] = v8;
    objc_msgSend(v5, "newRenderPipelineStateWithMeshDescriptor:options:completionHandler:", v6, v7, v9);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __86__MTLDebugDevice__newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __77__MTLDebugDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_24F7945F0;
  v4[4] = a4;
  -[MTLDebugDevice _newRenderPipelineStateWithMeshDescriptor:options:completionHandler:](self, "_newRenderPipelineStateWithMeshDescriptor:options:completionHandler:", a3, 0x20000, v4);
}

uint64_t __77__MTLDebugDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __85__MTLDebugDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke;
  v5[3] = &unk_24F7945F0;
  v5[4] = a5;
  -[MTLDebugDevice _newRenderPipelineStateWithMeshDescriptor:options:completionHandler:](self, "_newRenderPipelineStateWithMeshDescriptor:options:completionHandler:", a3, a4 & 0xFFFFFFFFFFFDFFFFLL, v5);
}

uint64_t __85__MTLDebugDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  MTLDebugLibrary *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(a4);
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13++), "baseObject"));
      }
      while (v11 != v13);
      v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
  v14 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithDAG:functions:error:", a3, v9, a5);

  if (!v14)
    return 0;
  v15 = -[MTLToolsObject initWithBaseObject:parent:]([MTLDebugLibrary alloc], "initWithBaseObject:parent:", v14, self);

  return v15;
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  MTLDebugLibrary *v8;

  v6 = -[MTLToolsDevice unwrapMTLStitchedLibraryDescriptor:](self, "unwrapMTLStitchedLibraryDescriptor:", a3);
  v7 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithStitchedDescriptor:error:", v6, a4);

  if (!v7)
    return 0;
  v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLDebugLibrary alloc], "initWithBaseObject:parent:", v7, self);

  return v8;
}

- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[7];

  v6 = -[MTLToolsDevice unwrapMTLStitchedLibraryDescriptor:](self, "unwrapMTLStitchedLibraryDescriptor:", a3);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__MTLDebugDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_24F794848;
  v8[4] = v6;
  v8[5] = self;
  v8[6] = a4;
  objc_msgSend(v7, "newLibraryWithStitchedDescriptor:completionHandler:", v6, v8);
}

void __69__MTLDebugDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  MTLDebugLibrary *v4;

  v4 = -[MTLToolsObject initWithBaseObject:parent:]([MTLDebugLibrary alloc], "initWithBaseObject:parent:", a2, *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)newDagStringWithGraphs:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDagStringWithGraphs:", a3);
}

- (id)newLibraryWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  MTLDebugLibrary *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(a3);
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "baseObject"));
      }
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  v15 = objc_opt_respondsToSelector();
  v16 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
  if ((v15 & 1) != 0)
    v17 = objc_msgSend(v14, "newLibraryWithCIFiltersForComputePipeline:imageFilterFunctionInfo:error:", v16, a4, a5);
  else
    v17 = objc_msgSend(v14, "newLibraryWithCIFilters:imageFilterFunctionInfo:error:", v16, a4, a5);
  v18 = (void *)v17;

  if (!v18)
    return 0;
  v19 = -[MTLDebugLibrary initWithLibrary:parent:type:code:options:]([MTLDebugLibrary alloc], "initWithLibrary:parent:type:code:options:", v18, self, 4, 0, 0);
  -[MTLDebugLibrary setImageFilterFunctions:imageFilterFunctionInfo:](v19, "setImageFilterFunctions:imageFilterFunctionInfo:", a3, a4);

  return v19;
}

- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = -[MTLDebugDevice newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:](self, "newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:", a3, a4);
  v8 = (void *)objc_msgSend(v7, "newFunctionWithName:", CFSTR("ciKernelMain"));
  v9 = -[MTLDebugDevice newComputePipelineStateWithFunction:error:](self, "newComputePipelineStateWithFunction:error:", v8, a5);

  return v9;
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  id result;
  id v8;
  MTLDebugLibrary *v9;

  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithFile:error:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLDebugLibrary initWithLibrary:parent:type:code:options:]([MTLDebugLibrary alloc], "initWithLibrary:parent:type:code:options:", result, self, 1, a3, 0);

    return v9;
  }
  return result;
}

- (id)newLibraryWithURL:(id)a3 error:(id *)a4
{
  uint64_t v7;
  id result;
  id v9;
  void *v10;
  MTLDebugLibrary *v11;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure();
    v7 = objc_msgSend(a3, "fileSystemRepresentation");
    if (!v7)
      MTLReportFailure();
  }
  else
  {
    MTLReportFailure();
    v7 = 0;
  }
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithURL:error:", a3, a4);
  if (result)
  {
    v9 = result;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v7);
    v11 = -[MTLDebugLibrary initWithLibrary:parent:type:code:options:]([MTLDebugLibrary alloc], "initWithLibrary:parent:type:code:options:", v9, self, 1, v10, 0);

    return v11;
  }
  return result;
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  void *v15;
  MTLToolsObjectCache *sourceLibraryObjectCache;
  id v17;
  uint64_t v19;
  _QWORD v21[8];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    if (!(_QWORD)v26)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v8 = (void *)objc_msgSend(a4, "libraries");
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v23;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(v8);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v19 = v11 + v13;
              _MTLMessageContextPush_();
            }
            ++v13;
          }
          while (v10 != v13);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          v11 += v13;
        }
        while (v10);
      }
    }
  }
  if (a3)
  {
    objc_opt_class();
    v14 = a5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_16;
  }
  else
  {
    v14 = a5;
  }
  _MTLMessageContextPush_();
LABEL_16:
  _MTLMessageContextEnd();
  if (a4)
    a4 = -[MTLToolsDevice unwrapMTLCompileOptions:](self, "unwrapMTLCompileOptions:", a4);
  v15 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v19), "newLibraryWithSource:options:error:", a3, a4, v14);
  sourceLibraryObjectCache = self->super.sourceLibraryObjectCache;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __53__MTLDebugDevice_newLibraryWithSource_options_error___block_invoke;
  v21[3] = &unk_24F795700;
  v21[4] = v15;
  v21[5] = self;
  v21[6] = a3;
  v21[7] = a4;
  v17 = -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](sourceLibraryObjectCache, "getCachedObjectForKey:onMiss:", v15, v21);

  return v17;
}

MTLDebugLibrary *__53__MTLDebugDevice_newLibraryWithSource_options_error___block_invoke(_QWORD *a1)
{
  return -[MTLDebugLibrary initWithLibrary:parent:type:code:options:]([MTLDebugLibrary alloc], "initWithLibrary:parent:type:code:options:", a1[4], a1[5], 2, a1[6], a1[7]);
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD v20[8];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    if (!(_QWORD)v25)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v8 = (void *)objc_msgSend(a4, "libraries");
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v22;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v8);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v18 = v11 + v13;
              _MTLMessageContextPush_();
            }
            ++v13;
          }
          while (v10 != v13);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          v11 += v13;
        }
        while (v10);
      }
    }
  }
  if (a3)
  {
    objc_opt_class();
    v14 = a5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_16;
  }
  else
  {
    v14 = a5;
  }
  _MTLMessageContextPush_();
LABEL_16:
  _MTLMessageContextEnd();
  if (a4)
    v15 = -[MTLToolsDevice unwrapMTLCompileOptions:](self, "unwrapMTLCompileOptions:", a4);
  else
    v15 = 0;
  v16 = (void *)objc_msgSend(v15, "copy", v18);
  v17 = -[MTLToolsObject baseObject](self, "baseObject");
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __65__MTLDebugDevice_newLibraryWithSource_options_completionHandler___block_invoke;
  v20[3] = &unk_24F795728;
  v20[4] = self;
  v20[5] = a3;
  v20[6] = v16;
  v20[7] = v14;
  objc_msgSend(v17, "newLibraryWithSource:options:completionHandler:", a3, v16, v20);

}

void __65__MTLDebugDevice_newLibraryWithSource_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  __int128 v7;
  uint64_t v8;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__MTLDebugDevice_newLibraryWithSource_options_completionHandler___block_invoke_2;
  v6[3] = &unk_24F795700;
  v6[4] = a2;
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 48);
  v5 = (void *)objc_msgSend(v4, "getCachedObjectForKey:onMiss:", a2, v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

MTLDebugLibrary *__65__MTLDebugDevice_newLibraryWithSource_options_completionHandler___block_invoke_2(_QWORD *a1)
{
  return -[MTLDebugLibrary initWithLibrary:parent:type:code:options:]([MTLDebugLibrary alloc], "initWithLibrary:parent:type:code:options:", a1[4], a1[5], 2, a1[6], a1[7]);
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  id result;
  id v8;
  MTLDebugLibrary *v9;

  if (!a3)
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithData:error:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLDebugLibrary initWithLibrary:parent:type:code:options:]([MTLDebugLibrary alloc], "initWithLibrary:parent:type:code:options:", result, self, 3, a3, 0);

    return v9;
  }
  return result;
}

- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4
{
  id result;
  id v8;
  MTLDebugPipelineLibrary *v9;

  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newPipelineLibraryWithFilePath:error:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLDebugPipelineLibrary initWithLibrary:parent:filePath:]([MTLDebugPipelineLibrary alloc], "initWithLibrary:parent:filePath:", result, self, a3);

    return v9;
  }
  return result;
}

- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4
{
  id result;
  id v8;
  MTLDebugResidencySet *v9;

  if (!-[MTLToolsDevice supportsFamily:](self, "supportsFamily:", 1006))
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newResidencySetWithDescriptor:error:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLDebugResidencySet initWithResidencySet:device:]([MTLDebugResidencySet alloc], "initWithResidencySet:device:", result, self);

    return v9;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5
{
  MTLDebugTexture *v9;
  uint64_t v11;
  void *v12;
  _OWORD v13[3];
  uint64_t v14;

  v14 = 0;
  memset(v13, 0, sizeof(v13));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!a3)
      goto LABEL_21;
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!objc_msgSend(a3, "usage") && complain_about_sloppy_texture_usage)
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "pixelFormat") == 261)
      _MTLMessageContextPush_();
    -[MTLDebugDevice validateMemorylessResource:context:](self, "validateMemorylessResource:context:", a3, v13);
    if ((objc_msgSend(a3, "usage") & 0x20) != 0)
    {
      if ((objc_msgSend(a3, "usage") & 3) == 0)
        _MTLMessageContextPush_();
      if (objc_msgSend(a3, "pixelFormat") != 53
        && objc_msgSend(a3, "pixelFormat") != 54
        && objc_msgSend(a3, "pixelFormat") != 103)
      {
        _MTLMessageContextPush_();
      }
    }
    -[MTLDebugDevice validateResourceOptions:isTexture:isIOSurface:context:](self, "validateResourceOptions:isTexture:isIOSurface:context:", objc_msgSend(a3, "resourceOptions"), 1, 1, v13);
    if (!a4)
      _MTLMessageContextPush_();
    if (!*(_QWORD *)&v13[0])
    {
      v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:iosurface:plane:", a3, a4, a5);
      if (v11)
      {
        v12 = (void *)v11;
        v9 = -[MTLDebugTexture initWithBaseTexture:device:plane:]([MTLDebugTexture alloc], "initWithBaseTexture:device:plane:", v11, self, a5);

        goto LABEL_22;
      }
    }
  }
LABEL_21:
  v9 = 0;
LABEL_22:
  _MTLMessageContextEnd();
  return v9;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6
{
  MTLDebugTexture *v11;
  uint64_t v13;
  void *v14;
  _OWORD v15[3];
  uint64_t v16;

  v16 = 0;
  memset(v15, 0, sizeof(v15));
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!a3)
      goto LABEL_23;
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!objc_msgSend(a3, "usage") && complain_about_sloppy_texture_usage)
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "pixelFormat") == 261)
      _MTLMessageContextPush_();
    -[MTLDebugDevice validateMemorylessResource:context:](self, "validateMemorylessResource:context:", a3, v15);
    if ((objc_msgSend(a3, "usage") & 0x20) != 0)
    {
      if ((objc_msgSend(a3, "usage") & 3) == 0)
        _MTLMessageContextPush_();
      if (objc_msgSend(a3, "pixelFormat") != 53
        && objc_msgSend(a3, "pixelFormat") != 54
        && objc_msgSend(a3, "pixelFormat") != 103)
      {
        _MTLMessageContextPush_();
      }
    }
    -[MTLDebugDevice validateResourceOptions:isTexture:isIOSurface:context:](self, "validateResourceOptions:isTexture:isIOSurface:context:", objc_msgSend(a3, "resourceOptions"), 1, 1, v15);
    if (!a4)
      _MTLMessageContextPush_();
    if (a6 >= 0x801)
      _MTLMessageContextPush_();
    if (!*(_QWORD *)&v15[0])
    {
      v13 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:iosurface:plane:slice:", a3, a4, a5, a6);
      if (v13)
      {
        v14 = (void *)v13;
        v11 = -[MTLDebugTexture initWithBaseTexture:device:plane:]([MTLDebugTexture alloc], "initWithBaseTexture:device:plane:", v13, self, a5);

        goto LABEL_24;
      }
    }
  }
LABEL_23:
  v11 = 0;
LABEL_24:
  _MTLMessageContextEnd();
  return v11;
}

- (id)newBufferWithIOSurface:(__IOSurface *)a3
{
  id result;
  id v6;
  MTLDebugBuffer *v7;

  if (!a3)
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithIOSurface:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLDebugBuffer initWithBuffer:device:options:]([MTLDebugBuffer alloc], "initWithBuffer:device:options:", result, self, 0);

    return v7;
  }
  return result;
}

- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4
{
  id result;
  id v7;
  MTLDebugTextureLayout *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureLayoutWithDescriptor:isHeapOrBufferBacked:", a3, a4);
  if (result)
  {
    v7 = result;
    v8 = -[MTLDebugTextureLayout initWithBaseTextureLayout:device:descriptor:]([MTLDebugTextureLayout alloc], "initWithBaseTextureLayout:device:descriptor:", result, self, a3);

    return v8;
  }
  return result;
}

- (const)targetDeviceInfo
{
  return (const MTLTargetDeviceArch *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "targetDeviceInfo");
}

- (unint64_t)minLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  MTLPixelFormatGetInfoForDevice();
  _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "minLinearTextureAlignmentForPixelFormat:", a3);
}

- (unint64_t)minimumLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  MTLPixelFormatGetInfoForDevice();
  MTLReportFailure();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0), "minimumLinearTextureAlignmentForPixelFormat:", a3);
}

- (id)newRasterizationRateMapWithDescriptor:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  MTLToolsRasterizationRateMap *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v17 = 0;
  v18 = 0;
  v19 = 0;
  if (a3)
    objc_msgSend(a3, "screenSize");
  v16 = 0;
  v5 = objc_msgSend(a3, "layerPointer:", &v16);
  v6 = -[MTLToolsObject baseObject](self, "baseObject");
  v8 = v17;
  v7 = v18;
  v9 = v16;
  v23 = 0;
  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  _MTLMessageContextBegin_();
  v10 = objc_msgSend(v6, "maxRasterizationRateLayerCount");
  if (!v10)
    _MTLMessageContextPush_();
  if ((unint64_t)(v8 - 16385) <= 0xFFFFFFFFFFFFBFFFLL)
    _MTLMessageContextPush_();
  if ((unint64_t)(v7 - 16385) <= 0xFFFFFFFFFFFFBFFFLL)
    _MTLMessageContextPush_();
  if (v9 - 1 >= v10)
  {
    _MTLMessageContextPush_();
    if (v5)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (!v5)
  {
LABEL_20:
    _MTLMessageContextPush_();
    goto LABEL_21;
  }
  v11 = 0;
  do
  {
    if (*(_QWORD *)(v5 + 8 * v11) || (_MTLMessageContextPush_(), *(_QWORD *)(v5 + 8 * v11)))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        _MTLMessageContextPush_();
    }
    ++v11;
  }
  while (v9 != v11);
LABEL_21:
  _MTLMessageContextEnd();
  v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRasterizationRateMapWithDescriptor:", a3);
  if (!v12)
    return 0;
  v13 = (void *)v12;
  v14 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsRasterizationRateMap alloc], "initWithBaseObject:parent:", v12, self);

  return v14;
}

- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4
{
  id result;
  id v8;
  MTLDebugCounterSampleBuffer *v9;

  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCounterSampleBufferWithDescriptor:error:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLDebugCounterSampleBuffer initWithCounterSampleBuffer:device:descriptor:]([MTLDebugCounterSampleBuffer alloc], "initWithCounterSampleBuffer:device:descriptor:", result, self, a3);

    return v9;
  }
  return result;
}

- (id)newEvent
{
  id result;
  id v4;
  MTLDebugEvent *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newEvent");
  if (result)
  {
    v4 = result;
    v5 = -[MTLToolsObject initWithBaseObject:parent:]([MTLDebugEvent alloc], "initWithBaseObject:parent:", result, self);

    return v5;
  }
  return result;
}

- (id)newSharedEvent
{
  id result;
  id v4;
  MTLDebugSharedEvent *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEvent");
  if (result)
  {
    v4 = result;
    v5 = -[MTLToolsObject initWithBaseObject:parent:]([MTLDebugSharedEvent alloc], "initWithBaseObject:parent:", result, self);

    return v5;
  }
  return result;
}

- (id)newSharedEventWithMachPort:(unsigned int)a3
{
  id result;
  id v5;
  MTLDebugSharedEvent *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEventWithMachPort:", *(_QWORD *)&a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLDebugSharedEvent alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newSharedEventWithHandle:(id)a3
{
  id result;
  id v5;
  MTLDebugSharedEvent *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEventWithHandle:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLDebugSharedEvent alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newLateEvalEvent
{
  MTLDebugLateEvalEvent *v3;
  uint64_t v4;
  void *v5;

  -[MTLToolsObject baseObject](self, "baseObject");
  _MTLMessageContextBegin_();
  if (!-[MTLToolsDevice supportsLateEvalEvent](self, "supportsLateEvalEvent"))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLateEvalEvent");
  if (!v4)
    return 0;
  v5 = (void *)v4;
  v3 = -[MTLToolsObject initWithBaseObject:parent:]([MTLDebugLateEvalEvent alloc], "initWithBaseObject:parent:", v4, self);

  return v3;
}

- (id)newFence
{
  id v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLDebugDevice;
  v3 = -[MTLToolsDevice newFence](&v6, sel_newFence);
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLDebugDevice;
    -[MTLToolsDevice maxFenceInstances](&v5, sel_maxFenceInstances);
    MTLReportFailure();
  }
  return v3;
}

- (void)addReferenceTrackingCommandBuffer:(id)a3
{
  os_unfair_lock_s *p_referenceTrackingCommandBufferLock;
  id v5;

  v5 = a3;
  p_referenceTrackingCommandBufferLock = &self->_referenceTrackingCommandBufferLock;
  os_unfair_lock_lock(&self->_referenceTrackingCommandBufferLock);
  std::__hash_table<MTLDebugCommandBuffer *,std::hash<MTLDebugCommandBuffer *>,std::equal_to<MTLDebugCommandBuffer *>,std::allocator<MTLDebugCommandBuffer *>>::__emplace_unique_key_args<MTLDebugCommandBuffer *,MTLDebugCommandBuffer * const&>((uint64_t)&self->_referenceTrackingCommandBuffers, &v5, &v5);
  os_unfair_lock_unlock(p_referenceTrackingCommandBufferLock);
}

- (void)removeReferenceTrackingCommandBuffer:(id)a3
{
  os_unfair_lock_s *p_referenceTrackingCommandBufferLock;
  unordered_set<MTLDebugCommandBuffer *, std::hash<MTLDebugCommandBuffer *>, std::equal_to<MTLDebugCommandBuffer *>, std::allocator<MTLDebugCommandBuffer *>> *p_referenceTrackingCommandBuffers;
  uint64_t *v6;
  id v7;

  v7 = a3;
  p_referenceTrackingCommandBufferLock = &self->_referenceTrackingCommandBufferLock;
  os_unfair_lock_lock(&self->_referenceTrackingCommandBufferLock);
  p_referenceTrackingCommandBuffers = &self->_referenceTrackingCommandBuffers;
  v6 = std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::find<MTLToolsObject *>(p_referenceTrackingCommandBuffers, &v7);
  if (v6)
    std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::erase(p_referenceTrackingCommandBuffers, v6);
  os_unfair_lock_unlock(p_referenceTrackingCommandBufferLock);
}

- (void)notifyExternalReferencesNonZeroOnDealloc:(id)a3
{
  id v5;
  os_unfair_lock_s *p_referenceTrackingCommandBufferLock;
  _QWORD *next;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  char v12;

  v5 = (id)objc_msgSend(a3, "baseObject");
  p_referenceTrackingCommandBufferLock = &self->_referenceTrackingCommandBufferLock;
  os_unfair_lock_lock(&self->_referenceTrackingCommandBufferLock);
  next = self->_referenceTrackingCommandBuffers.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (void *)next[2];
      v12 = 0;
      if (objc_msgSend(v10, "testObjectReferenced:wasInternallyRetained:", a3, &v12))
        v11 = v9 == 0;
      else
        v11 = 0;
      if (v11)
      {
        v8 = (id)objc_msgSend(v10, "label");
        v9 = v10;
      }
      next = (_QWORD *)*next;
    }
    while (next);
    os_unfair_lock_unlock(p_referenceTrackingCommandBufferLock);
    if (v9)
    {
      objc_msgSend(v5, "description");
      MTLReportFailure();
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_referenceTrackingCommandBufferLock);
    v8 = 0;
  }

}

- (void)validateRaytracing
{
  if (!-[MTLToolsDevice supportsRaytracing](self, "supportsRaytracing"))
    MTLReportFailure();
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3
{
  id v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  -[MTLDebugDevice validateRaytracing](self, "validateRaytracing");
  checkAccelerationStructureDescriptor(self, a4, 0);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)unwrapAccelerationStructureDescriptor(a4);
  if (v7)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend(v7, "accelerationStructureSizesWithDescriptor:", result);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  id result;
  id v6;
  MTLDebugAccelerationStructure *v7;

  -[MTLDebugDevice validateRaytracing](self, "validateRaytracing");
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithSize:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLDebugAccelerationStructure initWithBaseObject:parent:]([MTLDebugAccelerationStructure alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  id result;
  id v6;
  MTLDebugAccelerationStructure *v7;

  -[MTLDebugDevice validateRaytracing](self, "validateRaytracing");
  checkAccelerationStructureDescriptor(self, a3, 0);
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithDescriptor:", unwrapAccelerationStructureDescriptor(a3));
  if (result)
  {
    v6 = result;
    v7 = -[MTLDebugAccelerationStructure initWithBaseObject:parent:]([MTLDebugAccelerationStructure alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  id result;
  id v8;
  MTLDebugAccelerationStructure *v9;

  -[MTLDebugDevice validateRaytracing](self, "validateRaytracing");
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithSize:resourceIndex:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLDebugAccelerationStructure initWithBaseObject:parent:]([MTLDebugAccelerationStructure alloc], "initWithBaseObject:parent:", result, self);

    return v9;
  }
  return result;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  MTLToolsDevice *device;
  id result;
  id v9;
  MTLDebugAccelerationStructure *v10;
  unint64_t v11;
  uint64_t v12;

  -[MTLDebugDevice validateRaytracing](self, "validateRaytracing");
  if (!a3)
    goto LABEL_12;
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
    MTLReportFailure();
  device = self->super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    MTLReportFailure();
  if (objc_msgSend(a3, "length") <= a4)
  {
    v11 = a4;
    v12 = objc_msgSend(a3, "length");
LABEL_12:
    MTLReportFailure();
  }
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v11, v12), "newAccelerationStructureWithBuffer:offset:", objc_msgSend(a3, "baseObject"), a4);
  if (result)
  {
    v9 = result;
    v10 = -[MTLDebugAccelerationStructure initWithBaseObject:parent:]([MTLDebugAccelerationStructure alloc], "initWithBaseObject:parent:", result, self);

    return v10;
  }
  return result;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  MTLToolsDevice *device;
  id result;
  id v11;
  MTLDebugAccelerationStructure *v12;
  unint64_t v13;
  uint64_t v14;

  -[MTLDebugDevice validateRaytracing](self, "validateRaytracing");
  if (!a3)
    goto LABEL_12;
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
    MTLReportFailure();
  device = self->super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    MTLReportFailure();
  if (objc_msgSend(a3, "length") <= a4)
  {
    v13 = a4;
    v14 = objc_msgSend(a3, "length");
LABEL_12:
    MTLReportFailure();
  }
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v13, v14), "newAccelerationStructureWithBuffer:offset:resourceIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  if (result)
  {
    v11 = result;
    v12 = -[MTLDebugAccelerationStructure initWithBaseObject:parent:]([MTLDebugAccelerationStructure alloc], "initWithBaseObject:parent:", result, self);

    return v12;
  }
  return result;
}

- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4
{
  id result;
  id v8;
  MTLDebugAccelerationStructure *v9;

  if (!a3)
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializePrimitiveAccelerationStructureFromBytes:withDescriptor:", a3, unwrapAccelerationStructureDescriptor(a4));
  if (result)
  {
    v8 = result;
    v9 = -[MTLDebugAccelerationStructure initWithBaseObject:parent:]([MTLDebugAccelerationStructure alloc], "initWithBaseObject:parent:", result, self);

    return v9;
  }
  return result;
}

- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5
{
  void *v9;
  uint64_t v10;
  unsigned int v11;
  id result;
  id v14;
  MTLDebugAccelerationStructure *v15;

  if (!a3)
    MTLReportFailure();
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if (objc_msgSend(a4, "count"))
  {
    v10 = 0;
    v11 = 1;
    do
    {
      checkAccelerationStructure((uint64_t)self->super.super._device, (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", v10), 0, (uint64_t)CFSTR("Primitive acceleration structure"));
      objc_msgSend(v9, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v10), "baseObject"));
      v10 = v11;
    }
    while (objc_msgSend(a4, "count") > (unint64_t)v11++);
  }
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeInstanceAccelerationStructureFromBytes:primitiveAccelerationStructures:withDescriptor:", a3, v9, unwrapAccelerationStructureDescriptor(a5));
  if (result)
  {
    v14 = result;
    v15 = -[MTLDebugAccelerationStructure initWithBaseObject:parent:]([MTLDebugAccelerationStructure alloc], "initWithBaseObject:parent:", result, self);

    return v15;
  }
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  id result;
  id v6;
  MTLDebugAccelerationStructure *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithSize:withDescriptor:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLDebugAccelerationStructure initWithBaseObject:parent:]([MTLDebugAccelerationStructure alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5
{
  if (!a3)
  {
    MTLReportFailure();
    if (a4)
      goto LABEL_3;
LABEL_5:
    MTLReportFailure();
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializePrimitiveAccelerationStructure:fromBytes:withDescriptor:", objc_msgSend(a3, "baseObject"), a4, unwrapAccelerationStructureDescriptor(a5));
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6
{
  void *v10;
  uint64_t v11;
  unsigned int v12;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    MTLReportFailure();
    if (a4)
      goto LABEL_3;
  }
  MTLReportFailure();
LABEL_3:
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a5, "count"));
  if (objc_msgSend(a5, "count"))
  {
    v11 = 0;
    v12 = 1;
    do
    {
      checkAccelerationStructure((uint64_t)self->super.super._device, (void *)objc_msgSend(a5, "objectAtIndexedSubscript:", v11), 0, (uint64_t)CFSTR("Primitive acceleration structure"));
      objc_msgSend(v10, "addObject:", objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v11), "baseObject"));
      v11 = v12;
    }
    while (objc_msgSend(a5, "count") > (unint64_t)v12++);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeInstanceAccelerationStructure:fromBytes:primitiveAccelerationStructures:withDescriptor:", objc_msgSend(a3, "baseObject"), a4, v10, unwrapAccelerationStructureDescriptor(a6));
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v6;
  MTLDebugVisibleFunctionTable *v7;

  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLDebugVisibleFunctionTable initWithVisibleFunctionTable:parent:descriptor:stage:]([MTLDebugVisibleFunctionTable alloc], "initWithVisibleFunctionTable:parent:descriptor:stage:", result, self, a3, 0);

    return v7;
  }
  return result;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v6;
  MTLDebugIntersectionFunctionTable *v7;

  -[MTLDebugDevice validateRaytracing](self, "validateRaytracing");
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLDebugIntersectionFunctionTable initWithIntersectionFunctionTable:parent:descriptor:stage:]([MTLDebugIntersectionFunctionTable alloc], "initWithIntersectionFunctionTable:parent:descriptor:stage:", result, self, a3, 0);

    return v7;
  }
  return result;
}

- (void)clearRenderEncoder:(id)a3 writeMask:(unint64_t)a4 withCheckerboard:(float *)a5
{
  void *v9;
  CheckerboardRenderTargetPipelineCache *p_checkerboardRTPipelineCache;
  uint64_t ColorPipelineState;
  uint64_t v12;
  MTLDepthStencilState *v13;
  unint64_t v14;

  v9 = (void *)objc_msgSend(a3, "baseObject");
  p_checkerboardRTPipelineCache = &self->_checkerboardRTPipelineCache;
  v14 = a4;
  ColorPipelineState = CheckerboardRenderTargetPipelineCache::getColorPipelineState((uint64_t)p_checkerboardRTPipelineCache, (void *)objc_msgSend(a3, "descriptor"), &v14);
  if (ColorPipelineState)
  {
    v12 = ColorPipelineState;
    objc_msgSend(a3, "descriptor");
    v13 = p_checkerboardRTPipelineCache->_depthStencilState[HIDWORD(a4) & 1];
    objc_msgSend(v9, "setCullMode:", 0);
    objc_msgSend(v9, "setRenderPipelineState:", v12);
    objc_msgSend(v9, "setDepthStencilState:", v13);
    objc_msgSend(v9, "setFragmentBytes:length:atIndex:", a5, 32, 0);
    objc_msgSend(v9, "setVisibilityResultMode:offset:", 0, 0);
    objc_msgSend(v9, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  }
}

- (id)newProfileWithExecutionSize:(unint64_t)a3
{
  id result;
  id v5;
  MTLDebugDeadlineProfile *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newProfileWithExecutionSize:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLDebugDeadlineProfile alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)getDynamicLibraryForBaseObject:(id)a3
{
  MTLToolsObjectCache *dynamicLibraryObjectCache;
  _QWORD v5[6];

  dynamicLibraryObjectCache = self->super.dynamicLibraryObjectCache;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__MTLDebugDevice_getDynamicLibraryForBaseObject___block_invoke;
  v5[3] = &unk_24F7946E0;
  v5[4] = a3;
  v5[5] = self;
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](dynamicLibraryObjectCache, "getCachedObjectForKey:onMiss:", a3, v5);
}

MTLDebugDynamicLibrary *__49__MTLDebugDevice_getDynamicLibraryForBaseObject___block_invoke(uint64_t a1)
{
  return -[MTLToolsObject initWithBaseObject:parent:]([MTLDebugDynamicLibrary alloc], "initWithBaseObject:parent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)getFunctionForBaseObject:(id)a3 library:(id)a4
{
  MTLToolsObjectCache *functionObjectCache;
  _QWORD v6[6];

  functionObjectCache = self->super.functionObjectCache;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__MTLDebugDevice_getFunctionForBaseObject_library___block_invoke;
  v6[3] = &unk_24F794708;
  v6[4] = a3;
  v6[5] = a4;
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](functionObjectCache, "getCachedObjectForKey:onMiss:", a3, v6);
}

MTLDebugFunction *__51__MTLDebugDevice_getFunctionForBaseObject_library___block_invoke(uint64_t a1)
{
  return -[MTLToolsFunction initWithFunction:library:]([MTLDebugFunction alloc], "initWithFunction:library:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)getDepthStencilStateForBaseObject:(id)a3 descriptor:(id)a4
{
  MTLToolsObjectCache *depthStencilObjectCache;
  _QWORD v6[7];

  depthStencilObjectCache = self->super.depthStencilObjectCache;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__MTLDebugDevice_getDepthStencilStateForBaseObject_descriptor___block_invoke;
  v6[3] = &unk_24F794898;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = self;
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](depthStencilObjectCache, "getCachedObjectForKey:onMiss:", a3, v6);
}

MTLDebugDepthStencilState *__63__MTLDebugDevice_getDepthStencilStateForBaseObject_descriptor___block_invoke(_QWORD *a1)
{
  return -[MTLDebugDepthStencilState initWithDepthStencilState:descriptor:device:]([MTLDebugDepthStencilState alloc], "initWithDepthStencilState:descriptor:device:", a1[4], a1[5], a1[6]);
}

- (id)getSamplerStateForBaseObject:(id)a3 descriptor:(id)a4
{
  MTLToolsObjectCache *samplerObjectCache;
  _QWORD v6[7];

  samplerObjectCache = self->super.samplerObjectCache;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__MTLDebugDevice_getSamplerStateForBaseObject_descriptor___block_invoke;
  v6[3] = &unk_24F7948C0;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = self;
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](samplerObjectCache, "getCachedObjectForKey:onMiss:", a3, v6);
}

MTLDebugSamplerState *__58__MTLDebugDevice_getSamplerStateForBaseObject_descriptor___block_invoke(_QWORD *a1)
{
  return -[MTLDebugSamplerState initWithSamplerState:descriptor:device:]([MTLDebugSamplerState alloc], "initWithSamplerState:descriptor:device:", a1[4], a1[5], a1[6]);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v3 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heapAccelerationStructureSizeAndAlignWithSize:", a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  checkAccelerationStructureDescriptor(self, a3, 0);
  v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heapAccelerationStructureSizeAndAlignWithDescriptor:", unwrapAccelerationStructureDescriptor(a3));
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (id)newArgumentEncoderWithBufferBinding:(id)a3
{
  void *v5;
  MTLDebugArgumentEncoder *v6;

  v5 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferBinding:", a3);
  v6 = -[MTLDebugArgumentEncoder initWithBaseObject:structType:parent:]([MTLDebugArgumentEncoder alloc], "initWithBaseObject:structType:parent:", v5, objc_msgSend(a3, "bufferStructType"), self);

  return v6;
}

- (id)newIOHandleWithURL:(id)a3 error:(id *)a4
{
  void *v7;
  MTLDebugIOHandle *v8;

  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!a3)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _MTLMessageContextPush_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(a3, "fileSystemRepresentation"))
LABEL_7:
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v7 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIOHandleWithURL:error:", a3, a4);
  v8 = -[MTLDebugIOHandle initWithBaseObject:parent:]([MTLDebugIOHandle alloc], "initWithBaseObject:parent:", v7, self);

  return v8;
}

- (id)newIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  void *v9;
  MTLDebugIOHandle *v10;

  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!a3)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _MTLMessageContextPush_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(a3, "fileSystemRepresentation"))
LABEL_9:
    _MTLMessageContextPush_();
  if ((unint64_t)a4 >= 5)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v9 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIOHandleWithURL:compressionType:error:", a3, a4, a5);
  v10 = -[MTLDebugIOHandle initWithBaseObject:parent:]([MTLDebugIOHandle alloc], "initWithBaseObject:parent:", v9, self);

  return v10;
}

- (id)newUncachedIOHandleWithURL:(id)a3 error:(id *)a4
{
  void *v7;
  MTLDebugIOHandle *v8;

  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!a3)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _MTLMessageContextPush_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(a3, "fileSystemRepresentation"))
LABEL_7:
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v7 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newUncachedIOHandleWithURL:error:", a3, a4);
  v8 = -[MTLDebugIOHandle initWithBaseObject:parent:]([MTLDebugIOHandle alloc], "initWithBaseObject:parent:", v7, self);

  return v8;
}

- (id)newUncachedIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  void *v9;
  MTLDebugIOHandle *v10;

  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!a3)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _MTLMessageContextPush_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(a3, "fileSystemRepresentation"))
LABEL_9:
    _MTLMessageContextPush_();
  if ((unint64_t)a4 >= 5)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v9 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newUncachedIOHandleWithURL:compressionType:error:", a3, a4, a5);
  v10 = -[MTLDebugIOHandle initWithBaseObject:parent:]([MTLDebugIOHandle alloc], "initWithBaseObject:parent:", v9, self);

  return v10;
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  void *v7;
  MTLDebugIOScratchBufferAllocator *v8;
  void *v9;
  MTLDebugIOCommandQueue *v10;

  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!a3)
    goto LABEL_17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _MTLMessageContextPush_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a3, "priority") && objc_msgSend(a3, "priority") != 1 && objc_msgSend(a3, "priority") != 2)
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "type") && objc_msgSend(a3, "type") != 1)
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "scratchBufferAllocator")
      && (objc_msgSend((id)objc_msgSend(a3, "scratchBufferAllocator"), "conformsToProtocol:", &unk_255C74B70) & 1) == 0)
    {
LABEL_17:
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  v7 = (void *)objc_msgSend(a3, "copy");
  if (objc_msgSend(a3, "scratchBufferAllocator"))
  {
    v8 = -[MTLDebugIOScratchBufferAllocator initWithBaseObject:parent:]([MTLDebugIOScratchBufferAllocator alloc], "initWithBaseObject:parent:", objc_msgSend(a3, "scratchBufferAllocator"), self);
    objc_msgSend(v7, "setScratchBufferAllocator:", v8);

  }
  v9 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIOCommandQueueWithDescriptor:error:", v7, a4);
  v10 = -[MTLToolsIOCommandQueue initWithBaseObject:parent:]([MTLDebugIOCommandQueue alloc], "initWithBaseObject:parent:", v9, self);

  return v10;
}

- (BOOL)areWritableHeapsEnabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "areWritableHeapsEnabled");
}

- (void)setWritableHeapsEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setWritableHeapsEnabled:", a3);
}

- (BOOL)storeValidationEnabled
{
  return self->_storeValidationEnabled;
}

- (BOOL)loadValidationEnabled
{
  return self->_loadValidationEnabled;
}

- (void).cxx_destruct
{
  CheckerboardRenderTargetPipelineCache::~CheckerboardRenderTargetPipelineCache(&self->_checkerboardRTPipelineCache);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->_referenceTrackingCommandBuffers);
  MTLSamplerDescriptorHashMap::~MTLSamplerDescriptorHashMap(&self->_argumentBufferSamplers);
}

- (id).cxx_construct
{
  MTLSamplerDescriptorHashMap::MTLSamplerDescriptorHashMap(&self->_argumentBufferSamplers);
  self->_referenceTrackingCommandBuffers.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_referenceTrackingCommandBuffers.__table_.__p1_.__value_.__next_ = 0u;
  self->_referenceTrackingCommandBuffers.__table_.__p3_.__value_ = 1.0;
  self->_checkerboardRTPipelineCache._cache.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_checkerboardRTPipelineCache._cache.__table_.__p1_.__value_.__next_ = 0u;
  self->_checkerboardRTPipelineCache._cache.__table_.__p3_.__value_ = 1.0;
  return self;
}

@end
