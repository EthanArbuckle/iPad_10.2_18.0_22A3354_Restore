@implementation HDRImageConverter_Metal

- (HDRImageConverter_Metal)init
{
  HDRImageConverter_Metal *v2;
  HDRImageConverter_Metal *v3;
  uint64_t v4;
  MTLDevice *metalDevice;
  MTLDevice *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  MTLDevice *v12;
  uint64_t v13;
  id v14;
  MTLLibrary *metalLibrary;
  id v16;
  id v17;
  MTLDevice *v18;
  uint64_t v19;
  id v20;
  MTLBinaryArchive *metalArchive;
  HDRImageConverter_Metal *v22;
  const char *v24;
  uint64_t v25;
  MTLCommandQueue *metalCommandQueue;
  id v27;
  void *v28;
  void *v29;
  int v30;
  MTLDevice *v31;
  uint64_t v32;
  id v33;
  MTLBinaryArchive *metalBinaryArchive;
  const char *v35;
  id v36;
  id v37;
  const char *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)HDRImageConverter_Metal;
  v2 = -[HDRImageConverter_Metal init](&v43, sel_init);
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "metalDevice");
  v4 = objc_claimAutoreleasedReturnValue();
  metalDevice = v2->_metalDevice;
  v2->_metalDevice = (MTLDevice *)v4;

  v6 = v2->_metalDevice;
  if (v6)
  {
    -[MTLDevice name](v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "rangeOfString:options:", CFSTR("virtual"), 3);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[MTLDevice name](v2->_metalDevice, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "rangeOfString:options:", CFSTR("Intel"), 3);

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.ImageIO"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v2->_metalDevice;
        v42 = 0;
        v13 = -[MTLDevice newDefaultLibraryWithBundle:error:](v12, "newDefaultLibraryWithBundle:error:", v11, &v42);
        v14 = v42;
        metalLibrary = v2->_metalLibrary;
        v2->_metalLibrary = (MTLLibrary *)v13;

        if (v2->_metalLibrary)
        {
          objc_msgSend(v11, "URLForResource:withExtension:", CFSTR("archive"), CFSTR("metallib"));
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = objc_alloc_init(MEMORY[0x1E0CC6A28]);
            objc_msgSend(v17, "setUrl:", v16);
            v18 = v2->_metalDevice;
            v41 = v14;
            v19 = -[MTLDevice newBinaryArchiveWithDescriptor:error:](v18, "newBinaryArchiveWithDescriptor:error:", v17, &v41);
            v20 = v41;

            metalArchive = v2->_metalArchive;
            v2->_metalArchive = (MTLBinaryArchive *)v19;

            if (!v2->_metalArchive)
            {
              v37 = objc_retainAutorelease(v16);
              v38 = (const char *)objc_msgSend(v37, "fileSystemRepresentation");
              objc_msgSend(v20, "description");
              v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              LogError("-[HDRImageConverter_Metal init]", 87, "*** Failed to load metal archive from bundle: %s, error: %s", v38, (const char *)objc_msgSend(v39, "UTF8String"));

              v22 = 0;
              v16 = v37;
              v14 = v20;
              goto LABEL_27;
            }

            v14 = v20;
          }
          if (gFunc_CVMetalTextureCacheCreate(0, 0, v2->_metalDevice, 0, &v2->_metalTextureCache))
          {
            LogError("-[HDRImageConverter_Metal init]", 95, "Failed to create Metal texture cache");
            v22 = 0;
LABEL_28:

            goto LABEL_17;
          }
          v25 = -[MTLDevice newCommandQueue](v2->_metalDevice, "newCommandQueue");
          metalCommandQueue = v2->_metalCommandQueue;
          v2->_metalCommandQueue = (MTLCommandQueue *)v25;

          -[MTLCommandQueue setBackgroundGPUPriority:](v2->_metalCommandQueue, "setBackgroundGPUPriority:", 2);
          -[HDRImageConverter_Metal metalBinaryArchiveFileForHarvest](v2, "metalBinaryArchiveFileForHarvest");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v27 = objc_alloc_init(MEMORY[0x1E0CC6A28]);
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "path");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v28, "fileExistsAtPath:", v29);

            if (v30)
              objc_msgSend(v27, "setUrl:", v17);
            v31 = v3->_metalDevice;
            v40 = v14;
            v32 = -[MTLDevice newBinaryArchiveWithDescriptor:error:](v31, "newBinaryArchiveWithDescriptor:error:", v27, &v40);
            v33 = v40;

            metalBinaryArchive = v3->_metalBinaryArchive;
            v3->_metalBinaryArchive = (MTLBinaryArchive *)v32;

            if (!v3->_metalBinaryArchive)
            {
              v35 = (const char *)objc_msgSend(objc_retainAutorelease(v17), "fileSystemRepresentation");
              objc_msgSend(v33, "description");
              v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              LogError("-[HDRImageConverter_Metal init]", 112, "Failed to create Metal binary archive at path: '%s', error: '%s'", v35, (const char *)objc_msgSend(v36, "UTF8String"));

            }
            v14 = v33;
          }
          v22 = v3;
        }
        else
        {
          objc_msgSend(v11, "description");
          v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v24 = (const char *)objc_msgSend(v16, "UTF8String");
          objc_msgSend(v14, "description");
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          LogError("-[HDRImageConverter_Metal init]", 76, "*** Failed to load metal library from bundle: %s, error: %s", v24, (const char *)objc_msgSend(v17, "UTF8String"));
          v22 = 0;
        }
LABEL_27:

        goto LABEL_28;
      }
      if ((gIIODebugFlags & 0x300000) != 0)
        ImageIOLog("☀️ Metal converter not available: Intel GPU does not support argument buffers [128179728]");
    }
    else if ((gIIODebugFlags & 0x300000) != 0)
    {
      ImageIOLog("☀️ Metal converter not available: VM does not support argument buffers [100784848]");
    }
  }
  else if ((gIIODebugFlags & 0x300000) != 0)
  {
    ImageIOLog("☀️ Metal converter not available: no device!");
  }
  v22 = 0;
LABEL_17:

  return v22;
}

- (id)metalBinaryArchiveFileForHarvest
{
  void *v2;
  void *v3;

  v2 = (void *)CFPreferencesCopyValue(CFSTR("IIOHDRMetalHarvestBinaryArchive"), CFSTR("com.apple.ImageIO"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)dealloc
{
  __CVMetalTextureCache *metalTextureCache;
  objc_super v4;

  metalTextureCache = self->_metalTextureCache;
  if (metalTextureCache)
  {
    CFRelease(metalTextureCache);
    self->_metalTextureCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)HDRImageConverter_Metal;
  -[HDRImageConverter_Metal dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "metalDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@[%@]"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)metalDevice
{
  id v3;
  _QWORD block[5];

  if (IIO_XPCServer())
  {
    objc_msgSend(a1, "selectMetalDevice");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__HDRImageConverter_Metal_metalDevice__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[HDRImageConverter_Metal metalDevice]::onceToken != -1)
      dispatch_once(&+[HDRImageConverter_Metal metalDevice]::onceToken, block);
    v3 = (id)+[HDRImageConverter_Metal metalDevice]::s_device;
  }
  return v3;
}

+ (id)selectMetalDevice
{
  return MTLCreateSystemDefaultDevice();
}

- (id)metalLibraryFunctionWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HDRImageConverter_Metal metalLibrary](self, "metalLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newFunctionWithName:", v4);

  if (v6)
    v7 = v6;
  else
    LogError("-[HDRImageConverter_Metal metalLibraryFunctionWithName:]", 174, "Failed to load Metal kernel function named '%s'", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));

  return v6;
}

- (id)metalLibraryFunctionWithName:(id)a3 functionConstant:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  id v14;
  const char *v15;
  id v16;
  void *v17;
  id v18;
  const char *v19;
  id v20;
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CC6AA8]);
  objc_msgSend(v8, "setName:", v6);
  objc_msgSend(v8, "setConstantValues:", v7);
  if (self->_metalArchive)
  {
    objc_msgSend(v8, "setOptions:", 4);
    v24[0] = self->_metalArchive;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBinaryArchives:", v9);

  }
  -[HDRImageConverter_Metal metalLibrary](self, "metalLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v11 = (void *)objc_msgSend(v10, "newFunctionWithDescriptor:error:", v8, &v23);
  v12 = v23;

  if (v11)
    goto LABEL_4;
  if (!self->_metalArchive)
    goto LABEL_7;
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  objc_msgSend(v7, "description");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (const char *)objc_msgSend(v14, "UTF8String");
  objc_msgSend(v12, "description");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LogWarning("-[HDRImageConverter_Metal metalLibraryFunctionWithName:functionConstant:]", 191, "Failed to load precompiled Metal kernel function named '%s' with constants values: '%s', error: %s. Will retry and allow compile, this is costly!", v13, v15, (const char *)objc_msgSend(v16, "UTF8String"));

  objc_msgSend(v8, "setOptions:", 0);
  objc_msgSend(v8, "setBinaryArchives:", 0);
  -[HDRImageConverter_Metal metalLibrary](self, "metalLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v12;
  v11 = (void *)objc_msgSend(v17, "newFunctionWithDescriptor:error:", v8, &v22);
  v18 = v22;

  v12 = v18;
  if (v11)
  {
LABEL_4:
    objc_msgSend(v11, "setLabel:", v6);
  }
  else
  {
LABEL_7:
    v19 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    objc_msgSend(v12, "description");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("-[HDRImageConverter_Metal metalLibraryFunctionWithName:functionConstant:]", 197, "Failed to load Metal kernel function named '%s', error: %s", v19, (const char *)objc_msgSend(v20, "UTF8String"));

    v11 = 0;
  }

  return v11;
}

- (id)metalComputePipelineStateWithFunction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  MTLBinaryArchive *metalBinaryArchive;
  char v13;
  id v14;
  void *v15;
  MTLBinaryArchive *v16;
  char v17;
  id v18;
  id v19;
  const char *v20;
  id v21;
  void *v22;
  id v23;
  const char *v24;
  id v25;
  const char *v26;
  const char *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CC6A78]);
  objc_msgSend(v5, "setComputeFunction:", v4);
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabel:", v6);

  if (self->_metalArchive)
  {
    v33[0] = self->_metalArchive;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBinaryArchives:", v7);

    v8 = 4;
  }
  else
  {
    v8 = 0;
  }
  -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v10 = (void *)objc_msgSend(v9, "newComputePipelineStateWithDescriptor:options:reflection:error:", v5, v8, 0, &v32);
  v11 = v32;

  if (!v10)
  {
    if (!self->_metalArchive)
      goto LABEL_12;
    objc_msgSend(v4, "name");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend(v19, "UTF8String");
    objc_msgSend(v11, "description");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogWarning("-[HDRImageConverter_Metal metalComputePipelineStateWithFunction:]", 216, "Failed to create precompiled MTLComputePipelineState for function '%s', error: %s, will retry and allow compiling, this is inefficient!", v20, (const char *)objc_msgSend(v21, "UTF8String"));

    objc_msgSend(v5, "setBinaryArchives:", 0);
    -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v11;
    v10 = (void *)objc_msgSend(v22, "newComputePipelineStateWithDescriptor:options:reflection:error:", v5, 0, 0, &v31);
    v23 = v31;

    v11 = v23;
    if (!v10)
    {
LABEL_12:
      objc_msgSend(v4, "name");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v24 = (const char *)objc_msgSend(v18, "UTF8String");
      objc_msgSend(v11, "description");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LogError("-[HDRImageConverter_Metal metalComputePipelineStateWithFunction:]", 222, "Failed to create MTLComputePipelineState for function '%s', error: %s", v24, (const char *)objc_msgSend(v25, "UTF8String"));
      v10 = 0;
      goto LABEL_15;
    }
  }
  metalBinaryArchive = self->_metalBinaryArchive;
  if (metalBinaryArchive)
  {
    v30 = v11;
    v13 = -[MTLBinaryArchive addComputePipelineFunctionsWithDescriptor:error:](metalBinaryArchive, "addComputePipelineFunctionsWithDescriptor:error:", v5, &v30);
    v14 = v30;

    if ((v13 & 1) != 0)
    {
      -[HDRImageConverter_Metal metalBinaryArchiveFileForHarvest](self, "metalBinaryArchiveFileForHarvest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_metalBinaryArchive;
      v29 = v14;
      v17 = -[MTLBinaryArchive serializeToURL:error:](v16, "serializeToURL:error:", v15, &v29);
      v11 = v29;

      if ((v17 & 1) != 0)
      {
        if ((gIIODebugFlags & 0x300000) != 0)
        {
          v18 = objc_retainAutorelease(v15);
          ImageIOLog("Saved Metal binary archive to  '%s'", (const char *)objc_msgSend(v18, "fileSystemRepresentation"));
        }
        else
        {
          v18 = v15;
        }
        goto LABEL_16;
      }
      v18 = objc_retainAutorelease(v15);
      v27 = (const char *)objc_msgSend(v18, "fileSystemRepresentation");
      objc_msgSend(v11, "description");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LogError("-[HDRImageConverter_Metal metalComputePipelineStateWithFunction:]", 234, "Failed to save Metal binary archive to '%s', error: %s", v27, (const char *)objc_msgSend(v25, "UTF8String"));
    }
    else
    {
      objc_msgSend(v5, "label");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = (const char *)objc_msgSend(v18, "UTF8String");
      objc_msgSend(v14, "description");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LogError("-[HDRImageConverter_Metal metalComputePipelineStateWithFunction:]", 229, "Failed to add compute pipeline state '%s' to binary archive, error: %s", v26, (const char *)objc_msgSend(v25, "UTF8String"));
      v11 = v14;
    }
LABEL_15:

LABEL_16:
  }

  return v10;
}

- (unint64_t)metalPixelFormatForPixelFormat:(unsigned int)a3 plane:(unsigned int)a4
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  unsigned __int16 v11;
  int v12;
  unsigned __int16 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;

  if ((int)a3 > 1380411456)
  {
    if ((int)a3 <= 2016686641)
    {
      if ((int)a3 <= 1815491697)
      {
        if (a3 == 1380411457)
        {
          if (!a4)
            goto LABEL_45;
        }
        else
        {
          if (a3 != 1815162994)
            goto LABEL_80;
          if (!a4)
            goto LABEL_45;
        }
        goto LABEL_55;
      }
      if (a3 == 1815491698)
      {
        if (!a4)
          goto LABEL_45;
        goto LABEL_55;
      }
      v13 = 12848;
    }
    else
    {
      if ((int)a3 > 2019963439)
      {
        if (a3 != 2019963440 && a3 != 2019963442)
        {
          v10 = 2019963956;
          goto LABEL_39;
        }
LABEL_40:
        -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        MTLPixelFormatGetInfoForDevice();

        if (a4 == 1)
          v9 = 60;
        else
          v9 = 0;
        if (!a4)
          goto LABEL_45;
        goto LABEL_44;
      }
      if (a3 == 2016686642)
        goto LABEL_40;
      v13 = 13364;
    }
    v10 = v13 | 0x78340000;
LABEL_39:
    if (a3 != v10)
      goto LABEL_80;
    goto LABEL_40;
  }
  if ((int)a3 > 875836517)
  {
    if ((int)a3 > 1111970368)
    {
      switch(a3)
      {
        case 0x42475241u:
          if (!a4)
            goto LABEL_45;
          break;
        case 0x4C303038u:
          if (!a4)
            goto LABEL_45;
          break;
        case 0x4C303130u:
          -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          MTLPixelFormatGetInfoForDevice();

          v8 = 20;
          if (a4)
            v8 = 0;
          v9 = v8;
          goto LABEL_44;
        default:
LABEL_80:
          if ((a3 & 0x80000000) != 0)
            __maskrune((int)a3 >> 24, 0x40000uLL);
          if (((a3 << 8) & 0x80000000) != 0)
            __maskrune((int)(a3 << 8) >> 24, 0x40000uLL);
          if (((a3 << 16) & 0x80000000) != 0)
            __maskrune((__int16)a3 >> 8, 0x40000uLL);
          if (a3 << 24 > 0x7F000000)
            __maskrune((char)a3, 0x40000uLL);
          LogError("-[HDRImageConverter_Metal metalPixelFormatForPixelFormat:plane:]", 300, "Unsupported pixel format: '%c%c%c%c'");
          return 0;
      }
LABEL_55:
      v9 = 0;
      goto LABEL_56;
    }
    if (a3 == 875836518)
      goto LABEL_31;
    v12 = 875836534;
    goto LABEL_30;
  }
  if ((int)a3 > 875704933)
  {
    if (a3 != 875704934)
    {
      v11 = 12918;
      goto LABEL_29;
    }
  }
  else if (a3 != 875704422)
  {
    v11 = 12406;
LABEL_29:
    v12 = v11 | 0x34320000;
LABEL_30:
    if (a3 != v12)
      goto LABEL_80;
  }
LABEL_31:
  if (a4 == 1)
    v9 = 30;
  else
    v9 = 0;
  if (!a4)
    goto LABEL_45;
LABEL_44:
  if (v9)
  {
LABEL_45:
    -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MTLPixelFormatGetInfoForDevice();

    LogError("-[HDRImageConverter_Metal metalPixelFormatForPixelFormat:plane:]", 305, "Unsupported Metal pixel format: %lu");
    return 0;
  }
LABEL_56:
  if ((gIIODebugFlags & 0x300000) != 0)
  {
    v16 = MEMORY[0x1E0C80978];
    if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * HIBYTE(a3) + 60) & 0x40000) != 0)
      v17 = HIBYTE(a3);
    else
      v17 = 46;
    v18 = (int)(a3 << 8) >> 24;
    if (((a3 << 8) & 0x80000000) != 0)
      v19 = __maskrune((int)(a3 << 8) >> 24, 0x40000uLL);
    else
      v19 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v18 + 60) & 0x40000;
    if (v19)
      v20 = v18;
    else
      v20 = 46;
    v21 = (__int16)a3 >> 8;
    if (((a3 << 16) & 0x80000000) != 0)
      v22 = __maskrune((__int16)a3 >> 8, 0x40000uLL);
    else
      v22 = *(_DWORD *)(v16 + 4 * v21 + 60) & 0x40000;
    if (v22)
      v23 = v21;
    else
      v23 = 46;
    if (a3 << 24 <= 0x7F000000)
      v24 = *(_DWORD *)(v16 + 4 * (char)a3 + 60) & 0x40000;
    else
      v24 = __maskrune((char)a3, 0x40000uLL);
    if (v24)
      v25 = (char)a3;
    else
      v25 = 46;
    ImageIOLog("☀️  metalPixelFormatForPixelFormat: '%c%c%c%c' plane: %u -> %lu\n", v17, v20, v23, v25, a4, v9);
  }
  return v9;
}

- (__CVBuffer)metalTextureFromBuffer:(__CVBuffer *)a3 plane:(unsigned int)a4
{
  __CVBuffer *result;
  __CVBuffer *v8;
  uint64_t WidthOfPlane;
  uint64_t HeightOfPlane;
  __CVBuffer *v11;

  result = -[HDRImageConverter_Metal metalPixelFormatForPixelFormat:plane:](self, "metalPixelFormatForPixelFormat:plane:", gFunc_CVPixelBufferGetPixelFormatType(a3), *(_QWORD *)&a4);
  if (result)
  {
    v8 = result;
    v11 = 0;
    WidthOfPlane = gFunc_CVPixelBufferGetWidthOfPlane(a3, a4);
    HeightOfPlane = gFunc_CVPixelBufferGetHeightOfPlane(a3, a4);
    if (((uint64_t (*)(_QWORD, __CVMetalTextureCache *, __CVBuffer *, _QWORD, __CVBuffer *, uint64_t, uint64_t, _QWORD, __CVBuffer **))gFunc_CVMetalTextureCacheCreateTextureFromImage)(0, -[HDRImageConverter_Metal metalTextureCache](self, "metalTextureCache"), a3, 0, v8, WidthOfPlane, HeightOfPlane, a4, &v11))
    {
      LogError("-[HDRImageConverter_Metal metalTextureFromBuffer:plane:]", 324, "Failed to create Metal texture");
      return 0;
    }
    else
    {
      return v11;
    }
  }
  return result;
}

- (id)metalTextureFromTableData:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  unint64_t v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = objc_alloc_init(MEMORY[0x1E0CC6BB8]);
  objc_msgSend(v6, "setTextureType:", 0);
  objc_msgSend(v6, "setPixelFormat:", 55);
  v5 >>= 2;
  objc_msgSend(v6, "setWidth:", v5);
  objc_msgSend(v6, "setResourceOptions:", 0);
  objc_msgSend(v6, "setUsage:", 1);
  -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newTextureWithDescriptor:", v6);

  v12 = v5;
  v9 = objc_retainAutorelease(v4);
  objc_msgSend(v8, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", &v11, 0, objc_msgSend(v9, "bytes", 0, 0, 0, v12, vdupq_n_s64(1uLL)), objc_msgSend(v9, "length"));

  return v8;
}

- (BOOL)commitAndWaitUntilCompleted:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__HDRImageConverter_Metal_commitAndWaitUntilCompleted___block_invoke;
  v6[3] = &unk_1E1BBE130;
  v6[4] = &v7;
  objc_msgSend(v3, "addCompletedHandler:", v6);
  objc_msgSend(v3, "commit");
  objc_msgSend(v3, "waitUntilCompleted");
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeThreadGroupSizeForOutputSize:(SEL)a3 pipelineState:(id *)a4
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t var1;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  id v21;

  v21 = a5;
  v7 = objc_msgSend(v21, "threadExecutionWidth");
  v8 = objc_msgSend(v21, "maxTotalThreadsPerThreadgroup");
  v9 = v8 / v7;
  retstr->var0 = v7;
  retstr->var1 = v8 / v7;
  retstr->var2 = 1;
  if (v7 <= v8)
  {
    v10 = 0;
    var1 = a4->var1;
    v12 = a4->var0 + v7;
    v13 = -1;
    v14 = -(uint64_t)(var1 * a4->var0);
    v15 = -1;
    do
    {
      if (v7 + v10 <= v9)
        v16 = v9;
      else
        v16 = v7 + v10;
      if (v7 + v10 >= v9)
        v17 = v9;
      else
        v17 = v7 + v10;
      if (v14 + (var1 + v9 - 1) / v9 * v9 * (v12 + v10 - 1) / (v7 + v10) * (v7 + v10) <= v13)
      {
        v18 = v16 / v17;
        if (v18 <= v15)
        {
          retstr->var0 = v7 + v10;
          retstr->var1 = v9;
          v15 = v18;
          v13 = v14 + (var1 + v9 - 1) / v9 * v9 * (v12 + v10 - 1) / (v7 + v10) * (v7 + v10);
          retstr->var2 = 1;
        }
      }
      v19 = 2 * v7 + v10;
      v10 += v7;
      v9 = v8 / v19;
    }
    while (v7 + v10 <= v8);
  }

  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeGridSizeForThreadGroupSize:(SEL)a3 outputSize:(id *)a4
{
  unint64_t v5;

  v5 = (a5->var1 + a4->var1 - 1) / a4->var1;
  retstr->var0 = (a5->var0 + a4->var0 - 1) / a4->var0;
  retstr->var1 = v5;
  retstr->var2 = 1;
  return self;
}

- (void)encodeInputImage:(__CVBuffer *)a3 transform:(id *)a4 toBuffer:(id)a5 offset:(unint64_t)a6 withArgumentEncoder:(id)a7 computeEncoder:(id)a8 index:(unint64_t)a9 textures:(id)a10
{
  id v16;
  id v17;
  id v18;
  int var0;
  __CVBuffer *v20;
  __CVBuffer *v21;
  void *v22;
  void *v23;
  _OWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a5;
  v16 = a7;
  v17 = a8;
  v18 = a10;
  var0 = a4->var0;
  v20 = -[HDRImageConverter_Metal metalTextureFromBuffer:plane:](self, "metalTextureFromBuffer:plane:", a3, 0);
  if (var0 == 2)
    v21 = -[HDRImageConverter_Metal metalTextureFromBuffer:plane:](self, "metalTextureFromBuffer:plane:", a3, 1);
  else
    v21 = 0;
  objc_msgSend(v16, "setArgumentBuffer:offset:", v33, a6);
  if (v20)
  {
    gFunc_CVMetalTextureGetTexture(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v16, "setTexture:atIndex:", v22, 1);
  if (v20)

  if (v21)
  {
    gFunc_CVMetalTextureGetTexture(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(v16, "setTexture:atIndex:", v23, 2);
  if (v21)

  v24 = (_OWORD *)objc_msgSend(v16, "constantDataAtIndex:", 3);
  v25 = *(_OWORD *)&a4->var0;
  v26 = *(_OWORD *)&a4[4].var0;
  v27 = *(_OWORD *)&a4[12].var0;
  v24[2] = *(_OWORD *)&a4[8].var0;
  v24[3] = v27;
  *v24 = v25;
  v24[1] = v26;
  v28 = *(_OWORD *)&a4[16].var0;
  v29 = *(_OWORD *)&a4[20].var0;
  v30 = *(_OWORD *)&a4[28].var0;
  v24[6] = *(_OWORD *)&a4[24].var0;
  v24[7] = v30;
  v24[4] = v28;
  v24[5] = v29;
  objc_msgSend(v17, "setBuffer:offset:atIndex:", v33, a6, a9);
  if (v20)
  {
    gFunc_CVMetalTextureGetTexture(v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "useResource:usage:", v31, 1);

    objc_msgSend(v18, "addObject:", v20);
  }
  if (v21)
  {
    gFunc_CVMetalTextureGetTexture(v21);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "useResource:usage:", v32, 1);

    objc_msgSend(v18, "addObject:", v21);
  }

}

- (void)encodeOutputImage:(__CVBuffer *)a3 transform:(id *)a4 toBuffer:(id)a5 offset:(unint64_t)a6 withArgumentEncoder:(id)a7 computeEncoder:(id)a8 index:(unint64_t)a9 textures:(id)a10
{
  id v16;
  id v17;
  id v18;
  int var0;
  __CVBuffer *v20;
  __CVBuffer *v21;
  void *v22;
  void *v23;
  _OWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a5;
  v16 = a7;
  v17 = a8;
  v18 = a10;
  var0 = a4->var0;
  v20 = -[HDRImageConverter_Metal metalTextureFromBuffer:plane:](self, "metalTextureFromBuffer:plane:", a3, 0);
  if (var0 == 2)
    v21 = -[HDRImageConverter_Metal metalTextureFromBuffer:plane:](self, "metalTextureFromBuffer:plane:", a3, 1);
  else
    v21 = 0;
  objc_msgSend(v16, "setArgumentBuffer:offset:", v32, a6);
  if (v20)
  {
    gFunc_CVMetalTextureGetTexture(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v16, "setTexture:atIndex:", v22, 1);
  if (v20)

  if (v21)
  {
    gFunc_CVMetalTextureGetTexture(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(v16, "setTexture:atIndex:", v23, 2);
  if (v21)

  v24 = (_OWORD *)objc_msgSend(v16, "constantDataAtIndex:", 4);
  v25 = *(_OWORD *)&a4->var0;
  v26 = *(_OWORD *)&a4[8].var0;
  v24[1] = *(_OWORD *)&a4[4].var0;
  v24[2] = v26;
  *v24 = v25;
  v27 = *(_OWORD *)&a4[12].var0;
  v28 = *(_OWORD *)&a4[16].var0;
  v29 = *(_OWORD *)&a4[24].var0;
  v24[5] = *(_OWORD *)&a4[20].var0;
  v24[6] = v29;
  v24[3] = v27;
  v24[4] = v28;
  objc_msgSend(v17, "setBuffer:offset:atIndex:", v32, a6, a9);
  if (v20)
  {
    gFunc_CVMetalTextureGetTexture(v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "useResource:usage:", v30, 2);

    objc_msgSend(v18, "addObject:", v20);
  }
  if (v21)
  {
    gFunc_CVMetalTextureGetTexture(v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "useResource:usage:", v31, 2);

    objc_msgSend(v18, "addObject:", v21);
  }

}

- (void)encodeInputColorTransform:(id *)a3 toBuffer:(id)a4 offset:(unint64_t)a5 withArgumentEncoder:(id)a6 computeEncoder:(id)a7 index:(unint64_t)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  int var0;
  _OWORD *v19;
  __int128 v20;
  __int128 v21;
  float var7;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;

  v34 = a4;
  v14 = a6;
  v15 = a7;
  if (a3->var0.var0 == 6)
  {
    -[HDRImageConverter_Metal metalTextureFromTableData:](self, "metalTextureFromTableData:", *(_QWORD *)&a3->var1.var1.var3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  if (LODWORD(a3->var1.var1.var7) == 5)
  {
    -[HDRImageConverter_Metal metalTextureFromTableData:](self, "metalTextureFromTableData:", *(_QWORD *)&a3[1].var0.var1.var7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v14, "setArgumentBuffer:offset:", v34, a5);
  var0 = a3->var0.var0;
  *(_DWORD *)objc_msgSend(v14, "constantDataAtIndex:", 1) = var0;
  v19 = (_OWORD *)objc_msgSend(v14, "constantDataAtIndex:", 2);
  v20 = *(_OWORD *)&a3->var0.var1.var3;
  v21 = *(_OWORD *)&a3->var1.var0;
  v19[1] = *(_OWORD *)&a3->var0.var1.var7;
  v19[2] = v21;
  *v19 = v20;
  objc_msgSend(v14, "setTexture:atIndex:", v16, 11);
  var7 = a3->var1.var1.var7;
  *(float *)objc_msgSend(v14, "constantDataAtIndex:", 12) = var7;
  v23 = (_OWORD *)objc_msgSend(v14, "constantDataAtIndex:", 13);
  v24 = *(_OWORD *)&a3->var1.var3.var1;
  v25 = *(_OWORD *)&a3[1].var0.var1.var3;
  v23[1] = *(_OWORD *)&a3[1].var0.var0;
  v23[2] = v25;
  *v23 = v24;
  v26 = (_OWORD *)objc_msgSend(v14, "constantDataAtIndex:", 22);
  v27 = *(_OWORD *)&a3[1].var1.var0;
  v28 = *(_OWORD *)&a3[1].var1.var1.var3;
  v29 = *(_OWORD *)&a3[1].var1.var3.var1;
  v26[2] = *(_OWORD *)&a3[1].var1.var1.var7;
  v26[3] = v29;
  *v26 = v27;
  v26[1] = v28;
  objc_msgSend(v14, "setTexture:atIndex:", v17, 24);
  v30 = (_OWORD *)objc_msgSend(v14, "constantDataAtIndex:", 25);
  v31 = *(_OWORD *)&a3[2].var0.var0;
  v32 = *(_OWORD *)&a3[2].var0.var1.var3;
  v33 = *(_OWORD *)&a3[2].var1.var0;
  v30[2] = *(_OWORD *)&a3[2].var0.var1.var7;
  v30[3] = v33;
  *v30 = v31;
  v30[1] = v32;
  objc_msgSend(v15, "setBuffer:offset:atIndex:", v34, a5, a8);
  if (v16)
    objc_msgSend(v15, "useResource:usage:", v16, 1);
  if (v17)
    objc_msgSend(v15, "useResource:usage:", v17, 1);

}

- (void)encodeOutputColorTransform:(id *)a3 toBuffer:(id)a4 offset:(unint64_t)a5 withArgumentEncoder:(id)a6 computeEncoder:(id)a7 index:(unint64_t)a8
{
  id v14;
  id v15;
  void *v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  int var0;
  _OWORD *v22;
  __int128 v23;
  __int128 v24;
  _OWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;

  v33 = a4;
  v14 = a6;
  v15 = a7;
  if (a3->var2.var0 == 5)
  {
    -[HDRImageConverter_Metal metalTextureFromTableData:](self, "metalTextureFromTableData:", *(_QWORD *)&a3[1].var1.var1.var1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v14, "setArgumentBuffer:offset:", v33, a5);
  v17 = (_OWORD *)objc_msgSend(v14, "constantDataAtIndex:", 1);
  v18 = *(_OWORD *)&a3->var0.var1;
  v19 = *(_OWORD *)&a3->var1.var1.var1;
  v20 = *(_OWORD *)&a3->var1.var2;
  v17[2] = *(_OWORD *)&a3->var1.var1.var5;
  v17[3] = v20;
  *v17 = v18;
  v17[1] = v19;
  var0 = a3->var2.var0;
  *(_DWORD *)objc_msgSend(v14, "constantDataAtIndex:", 3) = var0;
  v22 = (_OWORD *)objc_msgSend(v14, "constantDataAtIndex:", 4);
  v23 = *(_OWORD *)&a3->var2.var1.var3;
  v24 = *(_OWORD *)&a3[1].var0.var1;
  v22[1] = *(_OWORD *)&a3->var2.var1.var7;
  v22[2] = v24;
  *v22 = v23;
  v25 = (_OWORD *)objc_msgSend(v14, "constantDataAtIndex:", 13);
  v26 = *(_OWORD *)&a3[1].var1.var1.var5;
  v27 = *(_OWORD *)&a3[1].var1.var2;
  v28 = *(_OWORD *)&a3[1].var2.var1.var3;
  v25[2] = *(_OWORD *)&a3[1].var2.var0;
  v25[3] = v28;
  *v25 = v26;
  v25[1] = v27;
  objc_msgSend(v14, "setTexture:atIndex:", v16, 15);
  v29 = (_OWORD *)objc_msgSend(v14, "constantDataAtIndex:", 16);
  *v29 = *(_OWORD *)&a3[1].var2.var1.var7;
  v30 = *(_OWORD *)&a3[2].var0.var1;
  v31 = *(_OWORD *)&a3[2].var1.var1.var1;
  v32 = *(_OWORD *)&a3[2].var1.var2;
  v29[3] = *(_OWORD *)&a3[2].var1.var1.var5;
  v29[4] = v32;
  v29[1] = v30;
  v29[2] = v31;
  objc_msgSend(v15, "setBuffer:offset:atIndex:", v33, a5, a8);
  if (v16)
    objc_msgSend(v15, "useResource:usage:", v16, 1);

}

- (void)encodeInputGainTransform:(id *)a3 toBuffer:(id)a4 offset:(unint64_t)a5 withArgumentEncoder:(id)a6 computeEncoder:(id)a7 index:(unint64_t)a8
{
  id v13;
  id v14;
  _OWORD *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v16 = a4;
  v13 = a6;
  v14 = a7;
  v21 = *(_OWORD *)&a3[8].var0.var0;
  v22 = *(_OWORD *)&a3[10].var0.var0;
  v17 = *(_OWORD *)&a3->var0.var0;
  v18 = *(_OWORD *)&a3[2].var0.var0;
  v19 = *(_OWORD *)&a3[4].var0.var0;
  v20 = *(_OWORD *)&a3[6].var0.var0;
  v26 = *(_OWORD *)&a3[18].var0.var0;
  v27 = *(_OWORD *)&a3[20].var0.var0;
  v24 = *(_OWORD *)&a3[14].var0.var0;
  v25 = *(_OWORD *)&a3[16].var0.var0;
  v23 = *(_OWORD *)&a3[12].var0.var0;
  objc_msgSend(v13, "setArgumentBuffer:offset:", v16, a5);
  v15 = (_OWORD *)objc_msgSend(v13, "constantDataAtIndex:", 1);
  v15[8] = v25;
  v15[9] = v26;
  v15[10] = v27;
  v15[4] = v21;
  v15[5] = v22;
  v15[6] = v23;
  v15[7] = v24;
  *v15 = v17;
  v15[1] = v18;
  v15[2] = v19;
  v15[3] = v20;
  objc_msgSend(v14, "setBuffer:offset:atIndex:", v16, a5, a8);

}

- (void)encodeOutputGainTransform:(id *)a3 toBuffer:(id)a4 offset:(unint64_t)a5 withArgumentEncoder:(id)a6 computeEncoder:(id)a7 index:(unint64_t)a8
{
  id v13;
  id v14;
  $D79CC1B1AE515C1FB7988FA1E5926177 v15;
  uint64_t v16;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v18 = a4;
  v13 = a6;
  v14 = a7;
  v23 = *(_OWORD *)&a3[8].var0.var0;
  v24 = *(_OWORD *)&a3[10].var0.var0;
  v19 = *(_OWORD *)&a3->var0.var0;
  v20 = *(_OWORD *)&a3[2].var0.var0;
  v21 = *(_OWORD *)&a3[4].var0.var0;
  v22 = *(_OWORD *)&a3[6].var0.var0;
  v28 = *(_OWORD *)&a3[18].var0.var0;
  v29 = *(_OWORD *)&a3[20].var0.var0;
  v26 = *(_OWORD *)&a3[14].var0.var0;
  v27 = *(_OWORD *)&a3[16].var0.var0;
  v25 = *(_OWORD *)&a3[12].var0.var0;
  v15 = a3[22];
  v17 = *(_OWORD *)&a3[24].var0.var0;
  objc_msgSend(v13, "setArgumentBuffer:offset:", v18, a5);
  v16 = objc_msgSend(v13, "constantDataAtIndex:", 2);
  *(_OWORD *)(v16 + 128) = v27;
  *(_OWORD *)(v16 + 144) = v28;
  *(_OWORD *)(v16 + 160) = v29;
  *(_OWORD *)(v16 + 64) = v23;
  *(_OWORD *)(v16 + 80) = v24;
  *(_OWORD *)(v16 + 96) = v25;
  *(_OWORD *)(v16 + 112) = v26;
  *(_OWORD *)v16 = v19;
  *(_OWORD *)(v16 + 16) = v20;
  *(_OWORD *)(v16 + 32) = v21;
  *(_OWORD *)(v16 + 48) = v22;
  *($D79CC1B1AE515C1FB7988FA1E5926177 *)(v16 + 176) = v15;
  *(_QWORD *)(v16 + 184) = 0;
  *(_OWORD *)(v16 + 192) = v17;
  *(_QWORD *)(v16 + 208) = 0;
  *(_QWORD *)(v16 + 216) = 0;
  objc_msgSend(v14, "setBuffer:offset:atIndex:", v18, a5, a8);

}

- (BOOL)isPixelFormatSupported:(unsigned int)a3
{
  return -[HDRImageConverter_Metal metalPixelFormatForPixelFormat:plane:](self, "metalPixelFormatForPixelFormat:plane:", *(_QWORD *)&a3, 0) != 0;
}

- (BOOL)canUseImageBlocks
{
  void *v2;
  char v3;

  -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsFamily:", 1004);

  return v3;
}

- (id)conversionFunctionWithName:(id)a3 subsampling:
{
  int *v3;
  int *v4;
  __CFString *v6;
  void *v7;
  char v8;
  __CFString *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  int v19;
  char v20;

  v4 = v3;
  v6 = (__CFString *)a3;
  v20 = 0;
  v19 = *v4;
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("convert_image_to_image")))
  {
    -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "supportsFamily:", 1001);

    if ((v8 & 1) != 0)
    {

      v19 = *v4;
      v9 = CFSTR("xdr::convert_image_to_image_loop");
    }
    else
    {
      v20 = 1;

      *v4 = 65537;
      v9 = CFSTR("xdr::convert_image_to_image_reduce");
    }
  }
  else if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("convert_gainmap_image_to_image")))
  {
    -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "supportsFamily:", 1001);

    if ((v11 & 1) != 0)
    {

      v19 = *v4;
      v9 = CFSTR("xdr::convert_gainmap_image_to_image_loop");
    }
    else
    {
      v20 = 1;

      *v4 = 65537;
      v9 = CFSTR("xdr::convert_gainmap_image_to_image_reduce");
    }
  }
  else if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("convert_image_to_gainmap_image")))
  {
    -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "supportsFamily:", 5001);

    if ((v13 & 1) != 0)
    {
      *v4 = 65537;
      v9 = CFSTR("xdr::convert_image_to_gainmap_image_reduce");
    }
    else
    {
      v19 = *v4;
      v9 = CFSTR("xdr::convert_image_to_gainmap_image_loop");
    }
  }
  else if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("convert_gainmap_image_to_gainmap_image")))
  {
    -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "supportsFamily:", 5001);

    if ((v15 & 1) != 0)
    {
      *v4 = 65537;
      v9 = CFSTR("xdr::convert_gainmap_image_to_gainmap_image_reduce");
    }
    else
    {
      v19 = *v4;
      v9 = CFSTR("xdr::convert_gainmap_image_to_gainmap_image_loop");
    }
  }
  else
  {
    v9 = v6;
    if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("compute_luma_gain_histogram")))
    {

      *v4 = 524296;
      v19 = 131074;
      v9 = CFSTR("xdr::compute_luma_gain_histogram_8x8");
    }
  }
  v16 = objc_alloc_init(MEMORY[0x1E0CC6A98]);
  objc_msgSend(v16, "setConstantValue:type:atIndex:", &v19, 42, 1);
  objc_msgSend(v16, "setConstantValue:type:atIndex:", &v20, 53, 2);
  -[HDRImageConverter_Metal metalLibraryFunctionWithName:functionConstant:](self, "metalLibraryFunctionWithName:functionConstant:", v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 toImage:(__CVBuffer *)a5 transform:(id *)a6
{
  uint32x4_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  unsigned int Height;
  int32x2_t v22;
  int8x8_t v23;
  float32x2_t v24;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  void *v52;
  void *v53;
  int8x8_t v57;
  void *v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  _QWORD v63[3];
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  _QWORD v68[3];
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  unsigned __int16 v72;
  unsigned __int16 v73;
  unsigned __int16 v74;
  unsigned __int16 v75;

  v7 = vmovl_u16(vmax_u16((uint16x4_t)vdup_lane_s16(*(int16x4_t *)&a6[3].var0.var1.var1.var3, 0).u32[0], (uint16x4_t)vext_s8(*(int8x8_t *)&a6[3].var0.var1.var1.var3, *(int8x8_t *)&a6[3].var0.var1.var1.var3, 2uLL).u32[0]));
  v75 = v7.u16[2];
  v74 = v7.i16[0];
  -[HDRImageConverter_Metal conversionFunctionWithName:subsampling:](self, "conversionFunctionWithName:subsampling:", CFSTR("convert_image_to_image"), &v74);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v53 = v8;
    -[HDRImageConverter_Metal metalComputePipelineStateWithFunction:](self, "metalComputePipelineStateWithFunction:", v8);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      -[HDRImageConverter_Metal metalCommandQueue](self, "metalCommandQueue");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "commandBuffer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "computeCommandEncoder");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setComputePipelineState:", v58);
      v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v48 = (void *)objc_msgSend(v53, "newArgumentEncoderWithBufferIndex:", 1);
      v47 = (void *)objc_msgSend(v53, "newArgumentEncoderWithBufferIndex:", 2);
      v52 = (void *)objc_msgSend(v53, "newArgumentEncoderWithBufferIndex:", 5);
      v44 = (void *)objc_msgSend(v53, "newArgumentEncoderWithBufferIndex:", 7);
      v43 = objc_msgSend(v48, "alignment");
      v42 = objc_msgSend(v48, "encodedLength");
      v41 = objc_msgSend(v48, "alignment");
      v40 = objc_msgSend(v48, "alignment");
      v39 = objc_msgSend(v47, "alignment");
      v38 = objc_msgSend(v47, "encodedLength");
      v37 = objc_msgSend(v47, "alignment");
      v9 = objc_msgSend(v47, "alignment");
      v36 = objc_msgSend(v52, "alignment");
      v35 = objc_msgSend(v52, "encodedLength");
      v10 = objc_msgSend(v52, "alignment");
      v11 = objc_msgSend(v52, "alignment");
      v12 = objc_msgSend(v44, "alignment");
      v13 = objc_msgSend(v44, "encodedLength");
      v14 = objc_msgSend(v44, "alignment");
      v15 = objc_msgSend(v44, "alignment");
      -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (v42 + v41 - 1) / v40 * v43;
      v18 = v17 + (v38 + v37 - 1) / v9 * v39;
      v19 = v18 + (v35 + v10 - 1) / v11 * v36;
      v20 = (void *)objc_msgSend(v16, "newBufferWithLength:options:", v19 + (v13 + v14 - 1) / v15 * v12, 0);

      -[HDRImageConverter_Metal encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", a3, a4, v20, 0, v48, v49, 1, v51);
      -[HDRImageConverter_Metal encodeOutputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeOutputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", a5, &a6[2].var0.var1.var2, v20, v17, v47, v49, 2, v51);
      -[HDRImageConverter_Metal encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", &a4[1].var1, v20, v18, v52, v49, 5);
      -[HDRImageConverter_Metal encodeOutputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeOutputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", a6, v20, v19, v44, v49, 7);
      LODWORD(v11) = gFunc_CVPixelBufferGetWidth(a5);
      Height = gFunc_CVPixelBufferGetHeight(a5);
      v22.i32[0] = v74;
      v22.i32[1] = v75;
      v57 = (int8x8_t)__PAIR64__(Height, v11);
      v23 = vand_s8((int8x8_t)vadd_s32((int32x2_t)__PAIR64__(Height, v11), vadd_s32(v22, (int32x2_t)-1)), (int8x8_t)0xFFFF0000FFFFLL);
      v73 = v23.i32[1] / v75;
      v72 = v23.i32[0] / v74;
      objc_msgSend(v49, "setBytes:length:atIndex:", &v72, 4, 13);
      v24 = vadd_f32((float32x2_t)vorr_s8(vand_s8(v57, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
      __asm { FMOV            V1.2S, #1.0 }
      *(float32x2_t *)&v30 = vdiv_f32(_D1, v24);
      *((float32x2_t *)&v30 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v24);
      v71 = v30;
      objc_msgSend(v49, "setBytes:length:atIndex:", &v71, 16, 14);
      v31 = v72;
      v32 = v73;
      v69 = 0uLL;
      v70 = 0;
      v68[0] = v72;
      v68[1] = v73;
      v68[2] = 1;
      -[HDRImageConverter_Metal computeThreadGroupSizeForOutputSize:pipelineState:](self, "computeThreadGroupSizeForOutputSize:pipelineState:", v68, v58);
      v66 = 0uLL;
      v67 = 0;
      v64 = v69;
      v65 = v70;
      v63[0] = v31;
      v63[1] = v32;
      v63[2] = 1;
      -[HDRImageConverter_Metal computeGridSizeForThreadGroupSize:outputSize:](self, "computeGridSizeForThreadGroupSize:outputSize:", &v64, v63);
      v61 = v66;
      v62 = v67;
      v59 = v69;
      v60 = v70;
      objc_msgSend(v49, "dispatchThreadgroups:threadsPerThreadgroup:", &v61, &v59);
      objc_msgSend(v49, "endEncoding");
      v33 = -[HDRImageConverter_Metal commitAndWaitUntilCompleted:](self, "commitAndWaitUntilCompleted:", v45);

    }
    else
    {
      v33 = 0;
    }

    v8 = v53;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 gainMap:(__CVBuffer *)a5 transform:(id *)a6 toImage:(__CVBuffer *)a7 transform:(id *)a8
{
  uint32x4_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  unsigned int Height;
  int32x2_t v25;
  int8x8_t v26;
  float32x2_t v27;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  void *v58;
  __CVBuffer *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v66;
  void *v67;
  void *v68;
  int8x8_t v72;
  id v73;
  void *v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  _QWORD v79[3];
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  uint64_t v83;
  _QWORD v84[3];
  __int128 v85;
  uint64_t v86;
  __int128 v87;
  unsigned __int16 v88;
  unsigned __int16 v89;
  unsigned __int16 v90;
  unsigned __int16 v91;

  v10 = vmovl_u16(vmax_u16((uint16x4_t)vdup_lane_s16(*(int16x4_t *)&a8[3].var0.var1.var1.var3, 0).u32[0], (uint16x4_t)vext_s8(*(int8x8_t *)&a8[3].var0.var1.var1.var3, *(int8x8_t *)&a8[3].var0.var1.var1.var3, 2uLL).u32[0]));
  v91 = v10.u16[2];
  v90 = v10.i16[0];
  -[HDRImageConverter_Metal conversionFunctionWithName:subsampling:](self, "conversionFunctionWithName:subsampling:", CFSTR("convert_gainmap_image_to_image"), &v90);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v68 = v11;
    -[HDRImageConverter_Metal metalComputePipelineStateWithFunction:](self, "metalComputePipelineStateWithFunction:", v11);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      -[HDRImageConverter_Metal metalCommandQueue](self, "metalCommandQueue");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "commandBuffer");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "computeCommandEncoder");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setComputePipelineState:", v74);
      v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v66 = (void *)objc_msgSend(v68, "newArgumentEncoderWithBufferIndex:", 1);
      v62 = (void *)objc_msgSend(v68, "newArgumentEncoderWithBufferIndex:", 2);
      v67 = (void *)objc_msgSend(v68, "newArgumentEncoderWithBufferIndex:", 5);
      v61 = (void *)objc_msgSend(v68, "newArgumentEncoderWithBufferIndex:", 8);
      v60 = (void *)objc_msgSend(v68, "newArgumentEncoderWithBufferIndex:", 7);
      v55 = objc_msgSend(v66, "alignment");
      v54 = objc_msgSend(v66, "encodedLength");
      v53 = objc_msgSend(v66, "alignment");
      v52 = objc_msgSend(v66, "alignment");
      v51 = objc_msgSend(v66, "alignment");
      v50 = objc_msgSend(v66, "encodedLength");
      v49 = objc_msgSend(v66, "alignment");
      v48 = objc_msgSend(v66, "alignment");
      v47 = objc_msgSend(v62, "alignment");
      v46 = objc_msgSend(v62, "encodedLength");
      v45 = objc_msgSend(v62, "alignment");
      v12 = objc_msgSend(v62, "alignment");
      v44 = objc_msgSend(v67, "alignment");
      v43 = objc_msgSend(v67, "encodedLength");
      v42 = objc_msgSend(v67, "alignment");
      v41 = objc_msgSend(v67, "alignment");
      v40 = objc_msgSend(v61, "alignment");
      v39 = objc_msgSend(v61, "encodedLength");
      v38 = objc_msgSend(v61, "alignment");
      v13 = objc_msgSend(v61, "alignment");
      v14 = objc_msgSend(v60, "alignment");
      v15 = objc_msgSend(v60, "encodedLength");
      v16 = objc_msgSend(v60, "alignment");
      v17 = objc_msgSend(v60, "alignment");
      v59 = a7;
      -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (v54 + v53 - 1) / v52 * v55;
      v20 = v19 + (v50 + v49 - 1) / v48 * v51;
      v21 = v20 + (v46 + v45 - 1) / v12 * v47;
      v56 = v21 + (v43 + v42 - 1) / v41 * v44;
      v22 = v56 + (v39 + v38 - 1) / v13 * v40;
      v23 = (void *)objc_msgSend(v18, "newBufferWithLength:options:", v22 + (v15 + v16 - 1) / v17 * v14, 0);

      -[HDRImageConverter_Metal encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", a3, a4, v23, 0, v66, v63, 1, v73);
      -[HDRImageConverter_Metal encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", a5, a6, v23, v19, v66, v63, 3, v73);
      -[HDRImageConverter_Metal encodeOutputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeOutputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", v59, &a8[2].var0.var1.var2, v23, v20, v62, v63, 2, v73);
      -[HDRImageConverter_Metal encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", &a4[1].var1, v23, v21, v67, v63, 5);
      -[HDRImageConverter_Metal encodeInputGainTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeInputGainTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", &a6[10].var1.var1, v23, v56, v61, v63, 8);
      -[HDRImageConverter_Metal encodeOutputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeOutputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", a8, v23, v22, v60, v63, 7);
      LODWORD(v18) = gFunc_CVPixelBufferGetWidth(v59);
      Height = gFunc_CVPixelBufferGetHeight(v59);
      v25.i32[0] = v90;
      v25.i32[1] = v91;
      v72 = (int8x8_t)__PAIR64__(Height, v18);
      v26 = vand_s8((int8x8_t)vadd_s32((int32x2_t)__PAIR64__(Height, v18), vadd_s32(v25, (int32x2_t)-1)), (int8x8_t)0xFFFF0000FFFFLL);
      v89 = v26.i32[1] / v91;
      v88 = v26.i32[0] / v90;
      objc_msgSend(v63, "setBytes:length:atIndex:", &v88, 4, 13);
      v27 = vadd_f32((float32x2_t)vorr_s8(vand_s8(v72, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
      __asm { FMOV            V1.2S, #1.0 }
      *(float32x2_t *)&v33 = vdiv_f32(_D1, v27);
      *((float32x2_t *)&v33 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v27);
      v87 = v33;
      objc_msgSend(v63, "setBytes:length:atIndex:", &v87, 16, 14);
      v34 = v88;
      v35 = v89;
      v85 = 0uLL;
      v86 = 0;
      v84[0] = v88;
      v84[1] = v89;
      v84[2] = 1;
      -[HDRImageConverter_Metal computeThreadGroupSizeForOutputSize:pipelineState:](self, "computeThreadGroupSizeForOutputSize:pipelineState:", v84, v74);
      v82 = 0uLL;
      v83 = 0;
      v80 = v85;
      v81 = v86;
      v79[0] = v34;
      v79[1] = v35;
      v79[2] = 1;
      -[HDRImageConverter_Metal computeGridSizeForThreadGroupSize:outputSize:](self, "computeGridSizeForThreadGroupSize:outputSize:", &v80, v79);
      v77 = v82;
      v78 = v83;
      v75 = v85;
      v76 = v86;
      objc_msgSend(v63, "dispatchThreadgroups:threadsPerThreadgroup:", &v77, &v75);
      objc_msgSend(v63, "endEncoding");
      v36 = -[HDRImageConverter_Metal commitAndWaitUntilCompleted:](self, "commitAndWaitUntilCompleted:", v57);

    }
    else
    {
      v36 = 0;
    }

    v11 = v68;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 toImage:(__CVBuffer *)a6 transform:(id *)a7 gainMap:(__CVBuffer *)a8 transform:(id *)a9
{
  uint16x4_t v11;
  uint16x4_t v12;
  int16x4_t v13;
  uint32x4_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  unsigned int Height;
  int32x2_t v28;
  int8x8_t v29;
  float32x2_t v30;
  __int128 v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  __CVBuffer *v67;
  void *v68;
  void *v69;
  void *v73;
  void *v74;
  int8x8_t v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  __int128 v82;
  uint64_t v83;
  __int128 v84;
  uint64_t v85;
  _QWORD v86[3];
  __int128 v87;
  uint64_t v88;
  __int128 v89;
  uint64_t v90;
  _QWORD v91[3];
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  unsigned __int16 v95;
  unsigned __int16 v96;
  unsigned __int16 v97;
  unsigned __int16 v98;

  v11 = *(uint16x4_t *)&a7[3].var0.var1.var1.var3;
  v11.i16[3] = 0;
  v12 = *(uint16x4_t *)&a9[26].var1.var0;
  v12.i16[3] = 0;
  v13 = (int16x4_t)vmax_u16(v11, v12);
  v14 = vmovl_u16(vmax_u16((uint16x4_t)vdup_lane_s16(v13, 0).u32[0], (uint16x4_t)vext_s8((int8x8_t)v13, (int8x8_t)v13, 2uLL).u32[0]));
  v98 = v14.u16[2];
  v97 = v14.i16[0];
  -[HDRImageConverter_Metal conversionFunctionWithName:subsampling:](self, "conversionFunctionWithName:subsampling:", CFSTR("convert_image_to_gainmap_image"), &v97);
  v15 = objc_claimAutoreleasedReturnValue();
  v80 = (void *)v15;
  if (v15)
  {
    -[HDRImageConverter_Metal metalComputePipelineStateWithFunction:](self, "metalComputePipelineStateWithFunction:", v15);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v81)
    {
      -[HDRImageConverter_Metal metalCommandQueue](self, "metalCommandQueue");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "commandBuffer");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "computeCommandEncoder");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setComputePipelineState:", v81);
      v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v68 = (void *)objc_msgSend((id)v15, "newArgumentEncoderWithBufferIndex:", 1);
      v74 = (void *)objc_msgSend((id)v15, "newArgumentEncoderWithBufferIndex:", 2);
      v79 = (void *)objc_msgSend((id)v15, "newArgumentEncoderWithBufferIndex:", 5);
      v73 = (void *)objc_msgSend((id)v15, "newArgumentEncoderWithBufferIndex:", 7);
      v64 = (void *)objc_msgSend((id)v15, "newArgumentEncoderWithBufferIndex:", 10);
      v62 = objc_msgSend(v68, "alignment");
      v60 = objc_msgSend(v68, "encodedLength");
      v59 = objc_msgSend(v68, "alignment");
      v58 = objc_msgSend(v68, "alignment");
      v57 = objc_msgSend(v74, "alignment");
      v56 = objc_msgSend(v74, "encodedLength");
      v55 = objc_msgSend(v74, "alignment");
      v54 = objc_msgSend(v74, "alignment");
      v53 = objc_msgSend(v74, "alignment");
      v52 = objc_msgSend(v74, "encodedLength");
      v51 = objc_msgSend(v74, "alignment");
      v50 = objc_msgSend(v74, "alignment");
      v49 = objc_msgSend(v79, "alignment");
      v48 = objc_msgSend(v79, "encodedLength");
      v47 = objc_msgSend(v79, "alignment");
      v46 = objc_msgSend(v79, "alignment");
      v45 = objc_msgSend(v79, "alignment");
      v44 = objc_msgSend(v79, "encodedLength");
      v43 = objc_msgSend(v79, "alignment");
      v42 = objc_msgSend(v79, "alignment");
      v41 = objc_msgSend(v73, "alignment");
      v40 = objc_msgSend(v73, "encodedLength");
      v39 = objc_msgSend(v73, "alignment");
      v16 = objc_msgSend(v73, "alignment");
      v17 = objc_msgSend(v64, "alignment");
      v18 = objc_msgSend(v64, "encodedLength");
      v19 = objc_msgSend(v64, "alignment");
      v20 = objc_msgSend(v64, "alignment");
      v67 = a6;
      -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (v60 + v59 - 1) / v58 * v62;
      v23 = v22 + (v56 + v55 - 1) / v54 * v57;
      v24 = v23 + (v52 + v51 - 1) / v50 * v53;
      v63 = v24 + (v48 + v47 - 1) / v46 * v49;
      v61 = v63 + (v44 + v43 - 1) / v42 * v45;
      v25 = v61 + (v40 + v39 - 1) / v16 * v41;
      v26 = (void *)objc_msgSend(v21, "newBufferWithLength:options:", v25 + (v18 + v19 - 1) / v20 * v17, 0);

      -[HDRImageConverter_Metal encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", a3, a4, v26, 0, v68, v69, 1, v78);
      -[HDRImageConverter_Metal encodeOutputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeOutputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", v67, &a7[2].var0.var1.var2, v26, v22, v74, v69, 2, v78);
      -[HDRImageConverter_Metal encodeOutputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeOutputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", a8, &a9[18].var1, v26, v23, v74, v69, 4, v78);
      -[HDRImageConverter_Metal encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", &a4[1].var1, v26, v24, v79, v69, 5);
      -[HDRImageConverter_Metal encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", &a5[1].var1, v26, v63, v79, v69, 6);
      -[HDRImageConverter_Metal encodeOutputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeOutputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", a7, v26, v61, v73, v69, 7);
      -[HDRImageConverter_Metal encodeOutputGainTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeOutputGainTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", a9, v26, v25, v64, v69, 10);
      LODWORD(v24) = gFunc_CVPixelBufferGetWidth(v67);
      Height = gFunc_CVPixelBufferGetHeight(v67);
      v28.i32[0] = v97;
      v28.i32[1] = v98;
      v77 = (int8x8_t)__PAIR64__(Height, v24);
      v29 = vand_s8((int8x8_t)vadd_s32((int32x2_t)__PAIR64__(Height, v24), vadd_s32(v28, (int32x2_t)-1)), (int8x8_t)0xFFFF0000FFFFLL);
      v96 = v29.i32[1] / v98;
      v95 = v29.i32[0] / v97;
      objc_msgSend(v69, "setBytes:length:atIndex:", &v95, 4, 13);
      v30 = vadd_f32((float32x2_t)vorr_s8(vand_s8(v77, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
      __asm { FMOV            V1.2S, #1.0 }
      *(float32x2_t *)&v36 = vdiv_f32(_D1, v30);
      *((float32x2_t *)&v36 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v30);
      v94 = v36;
      objc_msgSend(v69, "setBytes:length:atIndex:", &v94, 16, 14);
      v15 = v95;
      v37 = v96;
      v92 = 0uLL;
      v93 = 0;
      v91[0] = v95;
      v91[1] = v96;
      v91[2] = 1;
      -[HDRImageConverter_Metal computeThreadGroupSizeForOutputSize:pipelineState:](self, "computeThreadGroupSizeForOutputSize:pipelineState:", v91, v81);
      v89 = 0uLL;
      v90 = 0;
      v87 = v92;
      v88 = v93;
      v86[0] = v15;
      v86[1] = v37;
      v86[2] = 1;
      -[HDRImageConverter_Metal computeGridSizeForThreadGroupSize:outputSize:](self, "computeGridSizeForThreadGroupSize:outputSize:", &v87, v86);
      v84 = v89;
      v85 = v90;
      v82 = v92;
      v83 = v93;
      objc_msgSend(v69, "dispatchThreadgroups:threadsPerThreadgroup:", &v84, &v82);
      objc_msgSend(v69, "endEncoding");
      LOBYTE(v15) = -[HDRImageConverter_Metal commitAndWaitUntilCompleted:](self, "commitAndWaitUntilCompleted:", v65);

    }
    else
    {
      LOBYTE(v15) = 0;
    }

  }
  return v15;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 gainMap:(__CVBuffer *)a6 transform:(id *)a7 alternate:(id *)a8 toImage:(__CVBuffer *)a9 transform:(id *)a10 gainMap:(__CVBuffer *)a11 transform:(id *)a12
{
  uint16x4_t v13;
  uint16x4_t v14;
  int16x4_t v15;
  uint32x4_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  const $7F5F757F935EFDA1B622558C1678222D *v36;
  unsigned int Width;
  unsigned int Height;
  int32x2_t v39;
  int8x8_t v40;
  float32x2_t v41;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v93;
  void *v94;
  int8x8_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  __int128 v107;
  uint64_t v108;
  __int128 v109;
  uint64_t v110;
  _QWORD v111[3];
  __int128 v112;
  uint64_t v113;
  __int128 v114;
  uint64_t v115;
  _QWORD v116[3];
  __int128 v117;
  uint64_t v118;
  __int128 v119;
  unsigned __int16 v120;
  unsigned __int16 v121;
  unsigned __int16 v122;
  unsigned __int16 v123;

  v13 = *(uint16x4_t *)&a10[3].var0.var1.var1.var3;
  v13.i16[3] = 0;
  v14 = *(uint16x4_t *)&a12[26].var1.var0;
  v14.i16[3] = 0;
  v15 = (int16x4_t)vmax_u16(v13, v14);
  v16 = vmovl_u16(vmax_u16((uint16x4_t)vdup_lane_s16(v15, 0).u32[0], (uint16x4_t)vext_s8((int8x8_t)v15, (int8x8_t)v15, 2uLL).u32[0]));
  v123 = v16.u16[2];
  v122 = v16.i16[0];
  -[HDRImageConverter_Metal conversionFunctionWithName:subsampling:](self, "conversionFunctionWithName:subsampling:", CFSTR("convert_gainmap_image_to_gainmap_image"), &v122);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v94 = v17;
    -[HDRImageConverter_Metal metalComputePipelineStateWithFunction:](self, "metalComputePipelineStateWithFunction:", v17);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v104)
    {
      -[HDRImageConverter_Metal metalCommandQueue](self, "metalCommandQueue");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "commandBuffer");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "computeCommandEncoder");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setComputePipelineState:", v104);
      v106 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v103 = (void *)objc_msgSend(v94, "newArgumentEncoderWithBufferIndex:", 1);
      v102 = (void *)objc_msgSend(v94, "newArgumentEncoderWithBufferIndex:", 2);
      v101 = (void *)objc_msgSend(v94, "newArgumentEncoderWithBufferIndex:", 5);
      v100 = (void *)objc_msgSend(v94, "newArgumentEncoderWithBufferIndex:", 8);
      v99 = (void *)objc_msgSend(v94, "newArgumentEncoderWithBufferIndex:", 7);
      v93 = (void *)objc_msgSend(v94, "newArgumentEncoderWithBufferIndex:", 10);
      v86 = objc_msgSend(v103, "alignment");
      v84 = objc_msgSend(v103, "encodedLength");
      v82 = objc_msgSend(v103, "alignment");
      v80 = objc_msgSend(v103, "alignment");
      v79 = objc_msgSend(v103, "alignment");
      v78 = objc_msgSend(v103, "encodedLength");
      v77 = objc_msgSend(v103, "alignment");
      v76 = objc_msgSend(v103, "alignment");
      v75 = objc_msgSend(v102, "alignment");
      v74 = objc_msgSend(v102, "encodedLength");
      v73 = objc_msgSend(v102, "alignment");
      v72 = objc_msgSend(v102, "alignment");
      v71 = objc_msgSend(v102, "alignment");
      v70 = objc_msgSend(v102, "encodedLength");
      v69 = objc_msgSend(v102, "alignment");
      v68 = objc_msgSend(v102, "alignment");
      v67 = objc_msgSend(v101, "alignment");
      v66 = objc_msgSend(v101, "encodedLength");
      v65 = objc_msgSend(v101, "alignment");
      v64 = objc_msgSend(v101, "alignment");
      v63 = objc_msgSend(v101, "alignment");
      v62 = objc_msgSend(v101, "encodedLength");
      v61 = objc_msgSend(v101, "alignment");
      v60 = objc_msgSend(v101, "alignment");
      v59 = objc_msgSend(v100, "alignment");
      v58 = objc_msgSend(v100, "encodedLength");
      v57 = objc_msgSend(v100, "alignment");
      v56 = objc_msgSend(v100, "alignment");
      v55 = objc_msgSend(v100, "alignment");
      v18 = objc_msgSend(v100, "encodedLength");
      v19 = objc_msgSend(v100, "alignment");
      v54 = objc_msgSend(v100, "alignment");
      v53 = objc_msgSend(v99, "alignment");
      v20 = objc_msgSend(v99, "encodedLength");
      v21 = objc_msgSend(v99, "alignment");
      v52 = objc_msgSend(v99, "alignment");
      v22 = objc_msgSend(v99, "alignment");
      v23 = objc_msgSend(v93, "encodedLength");
      v24 = objc_msgSend(v99, "alignment");
      v25 = objc_msgSend(v99, "alignment");
      -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v18 + v19;
      v28 = v20 + v21;
      v29 = (v84 + v82 - 1) / v80 * v86;
      v30 = v29 + (v78 + v77 - 1) / v76 * v79;
      v31 = v30 + (v74 + v73 - 1) / v72 * v75;
      v32 = v31 + (v70 + v69 - 1) / v68 * v71;
      v87 = v32 + (v66 + v65 - 1) / v64 * v67;
      v85 = v87 + (v62 + v61 - 1) / v60 * v63;
      v83 = v85 + (v58 + v57 - 1) / v56 * v59;
      v81 = v83 + (v27 - 1) / v54 * v55;
      v33 = v81 + (v28 - 1) / v52 * v53 + (v23 + v24 - 1) / v25 * v22;
      v34 = v81 + (v28 - 1) / v52 * v53;
      v35 = (void *)objc_msgSend(v26, "newBufferWithLength:options:", v33, 0);

      -[HDRImageConverter_Metal encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", a3, a4, v35, 0, v103, v105, 1, v106);
      if (a7->var0.var0)
        v36 = a7;
      else
        v36 = a8;
      -[HDRImageConverter_Metal encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", a6, v36, v35, v29, v103, v105, 3, v106);
      -[HDRImageConverter_Metal encodeOutputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeOutputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", a9, &a10[2].var0.var1.var2, v35, v30, v102, v105, 2, v106);
      -[HDRImageConverter_Metal encodeOutputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeOutputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", a11, &a12[18].var1, v35, v31, v102, v105, 4, v106);
      -[HDRImageConverter_Metal encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", &a4[1].var1, v35, v32, v101, v105, 5);
      -[HDRImageConverter_Metal encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", &a5[1].var1, v35, v87, v101, v105, 6);
      -[HDRImageConverter_Metal encodeInputGainTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeInputGainTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", &a7[10].var1.var1, v35, v85, v100, v105, 8);
      -[HDRImageConverter_Metal encodeInputGainTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeInputGainTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", &a8[10].var1.var1, v35, v83, v100, v105, 9);
      -[HDRImageConverter_Metal encodeOutputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeOutputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", a10, v35, v81, v99, v105, 7);
      -[HDRImageConverter_Metal encodeOutputGainTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeOutputGainTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", a12, v35, v34, v93, v105, 10);
      Width = gFunc_CVPixelBufferGetWidth(a9);
      Height = gFunc_CVPixelBufferGetHeight(a9);
      v39.i32[0] = v122;
      v39.i32[1] = v123;
      v98 = (int8x8_t)__PAIR64__(Height, Width);
      v40 = vand_s8((int8x8_t)vadd_s32((int32x2_t)__PAIR64__(Height, Width), vadd_s32(v39, (int32x2_t)-1)), (int8x8_t)0xFFFF0000FFFFLL);
      v121 = v40.i32[1] / v123;
      v120 = v40.i32[0] / v122;
      objc_msgSend(v105, "setBytes:length:atIndex:", &v120, 4, 13);
      v41 = vadd_f32((float32x2_t)vorr_s8(vand_s8(v98, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
      __asm { FMOV            V1.2S, #1.0 }
      *(float32x2_t *)&v47 = vdiv_f32(_D1, v41);
      *((float32x2_t *)&v47 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v41);
      v119 = v47;
      objc_msgSend(v105, "setBytes:length:atIndex:", &v119, 16, 14);
      v48 = v120;
      v49 = v121;
      v117 = 0uLL;
      v118 = 0;
      v116[0] = v120;
      v116[1] = v121;
      v116[2] = 1;
      -[HDRImageConverter_Metal computeThreadGroupSizeForOutputSize:pipelineState:](self, "computeThreadGroupSizeForOutputSize:pipelineState:", v116, v104);
      v114 = 0uLL;
      v115 = 0;
      v112 = v117;
      v113 = v118;
      v111[0] = v48;
      v111[1] = v49;
      v111[2] = 1;
      -[HDRImageConverter_Metal computeGridSizeForThreadGroupSize:outputSize:](self, "computeGridSizeForThreadGroupSize:outputSize:", &v112, v111);
      v109 = v114;
      v110 = v115;
      v107 = v117;
      v108 = v118;
      objc_msgSend(v105, "dispatchThreadgroups:threadsPerThreadgroup:", &v109, &v107);
      objc_msgSend(v105, "endEncoding");
      v50 = -[HDRImageConverter_Metal commitAndWaitUntilCompleted:](self, "commitAndWaitUntilCompleted:", v88);

    }
    else
    {
      v50 = 0;
    }

    v17 = v94;
  }
  else
  {
    v50 = 0;
  }

  return v50;
}

- (BOOL)computeLumaGainHistogram:(id *)a3 scale:(__CVBuffer *)a4 image:(id *)a5 transform:(__CVBuffer *)a6 gainMap:(id *)a7 transform:
{
  uint64_t v7;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  unsigned int Height;
  int32x2_t v25;
  int8x8_t v26;
  float32x2_t v27;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  id v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  __CVBuffer *v50;
  void *v51;
  void *v52;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  int8x8_t v61;
  void *v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  _QWORD v67[3];
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  _QWORD v72[3];
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  unsigned __int16 v76;
  unsigned __int16 v77;
  int v78;
  uint64_t v79[3];

  v79[0] = v7;
  v78 = 524296;
  -[HDRImageConverter_Metal conversionFunctionWithName:subsampling:](self, "conversionFunctionWithName:subsampling:", CFSTR("compute_luma_gain_histogram"), &v78);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v58 = v10;
    -[HDRImageConverter_Metal metalComputePipelineStateWithFunction:](self, "metalComputePipelineStateWithFunction:", v10);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      -[HDRImageConverter_Metal metalCommandQueue](self, "metalCommandQueue");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "commandBuffer");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "computeCommandEncoder");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setComputePipelineState:", v62);
      v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v57 = (void *)objc_msgSend(v58, "newArgumentEncoderWithBufferIndex:", 1);
      v56 = (void *)objc_msgSend(v58, "newArgumentEncoderWithBufferIndex:", 5);
      v49 = (void *)objc_msgSend(v58, "newArgumentEncoderWithBufferIndex:", 8);
      v47 = objc_msgSend(v57, "alignment");
      v46 = objc_msgSend(v57, "encodedLength");
      v45 = objc_msgSend(v57, "alignment");
      v44 = objc_msgSend(v57, "alignment");
      v43 = objc_msgSend(v57, "alignment");
      v42 = objc_msgSend(v57, "encodedLength");
      v41 = objc_msgSend(v57, "alignment");
      v11 = objc_msgSend(v57, "alignment");
      v40 = objc_msgSend(v56, "alignment");
      v39 = objc_msgSend(v56, "encodedLength");
      v12 = objc_msgSend(v56, "alignment");
      v13 = objc_msgSend(v56, "alignment");
      v14 = objc_msgSend(v49, "alignment");
      v15 = objc_msgSend(v49, "encodedLength");
      v16 = objc_msgSend(v49, "alignment");
      v17 = objc_msgSend(v49, "alignment");
      v50 = a4;
      -[HDRImageConverter_Metal metalDevice](self, "metalDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (v46 + v45 - 1) / v44 * v47;
      v20 = v19 + (v42 + v41 - 1) / v11 * v43;
      v21 = v20 + (v39 + v12 - 1) / v13 * v40;
      v22 = v21 + (v15 + v16 - 1) / v17 * v14;
      v23 = (void *)objc_msgSend(v18, "newBufferWithLength:options:", v22 + 4096, 0);

      -[HDRImageConverter_Metal encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", v50, a5, v23, 0, v57, v52, 1, v55);
      -[HDRImageConverter_Metal encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:](self, "encodeInputImage:transform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:textures:", a6, a7, v23, v19, v57, v52, 3, v55);
      -[HDRImageConverter_Metal encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeInputColorTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", &a5[1].var1, v23, v20, v56, v52, 5);
      -[HDRImageConverter_Metal encodeInputGainTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:](self, "encodeInputGainTransform:toBuffer:offset:withArgumentEncoder:computeEncoder:index:", &a7[10].var1.var1, v23, v21, v49, v52, 8);
      objc_msgSend(v52, "setBuffer:offset:atIndex:", v23, v22, 11);
      objc_msgSend(v52, "setBytes:length:atIndex:", v79, 8, 12);
      LODWORD(v16) = gFunc_CVPixelBufferGetWidth(v50);
      Height = gFunc_CVPixelBufferGetHeight(v50);
      v25.i32[0] = (unsigned __int16)v78;
      v25.i32[1] = HIWORD(v78);
      v61 = (int8x8_t)__PAIR64__(Height, v16);
      v26 = vand_s8((int8x8_t)vadd_s32((int32x2_t)__PAIR64__(Height, v16), vadd_s32(v25, (int32x2_t)-1)), (int8x8_t)0xFFFF0000FFFFLL);
      v77 = v26.i32[1] / HIWORD(v78);
      v76 = v26.i32[0] / (unsigned __int16)v78;
      objc_msgSend(v52, "setBytes:length:atIndex:", &v76, 4, 13);
      v27 = vadd_f32((float32x2_t)vorr_s8(vand_s8(v61, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
      __asm { FMOV            V1.2S, #1.0 }
      *(float32x2_t *)&v33 = vdiv_f32(_D1, v27);
      *((float32x2_t *)&v33 + 1) = vdiv_f32(0, v27);
      v75 = v33;
      objc_msgSend(v52, "setBytes:length:atIndex:", &v75, 16, 14);
      v34 = v76;
      v35 = v77;
      v73 = 0uLL;
      v74 = 0;
      v72[0] = v76;
      v72[1] = v77;
      v72[2] = 1;
      -[HDRImageConverter_Metal computeThreadGroupSizeForOutputSize:pipelineState:](self, "computeThreadGroupSizeForOutputSize:pipelineState:", v72, v62);
      v70 = 0uLL;
      v71 = 0;
      v68 = v73;
      v69 = v74;
      v67[0] = v34;
      v67[1] = v35;
      v67[2] = 1;
      -[HDRImageConverter_Metal computeGridSizeForThreadGroupSize:outputSize:](self, "computeGridSizeForThreadGroupSize:outputSize:", &v68, v67);
      v65 = v70;
      v66 = v71;
      v63 = v73;
      v64 = v74;
      objc_msgSend(v52, "dispatchThreadgroups:threadsPerThreadgroup:", &v65, &v63);
      objc_msgSend(v52, "endEncoding");
      v36 = -[HDRImageConverter_Metal commitAndWaitUntilCompleted:](self, "commitAndWaitUntilCompleted:", v51);

      v37 = objc_retainAutorelease(v23);
      memcpy(a3, (const void *)(objc_msgSend(v37, "contents") + v22), sizeof($1FF2F8D2599020761ACEFF31D93EEB84));

    }
    else
    {
      v36 = 0;
    }

    v10 = v58;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (MTLDevice)metalDevice
{
  return self->_metalDevice;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (MTLLibrary)metalLibrary
{
  return self->_metalLibrary;
}

- (MTLBinaryArchive)metalArchive
{
  return self->_metalArchive;
}

- (MTLBinaryArchive)metalBinaryArchive
{
  return self->_metalBinaryArchive;
}

- (__CVMetalTextureCache)metalTextureCache
{
  return self->_metalTextureCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalBinaryArchive, 0);
  objc_storeStrong((id *)&self->_metalArchive, 0);
  objc_storeStrong((id *)&self->_metalLibrary, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
}

@end
