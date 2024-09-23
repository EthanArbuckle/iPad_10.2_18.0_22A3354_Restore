@implementation CLKUIMetalResourceManager

- (CLKUIMetalResourceManager)init
{
  CLKUIMetalResourceManager *v2;
  MTLDevice *v3;
  MTLDevice *device;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *textureStreamingQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLKUIMetalResourceManager;
  v2 = -[CLKUIResourceManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v2->_device;
    v2->_device = v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.NanoTimeKit.CLKUIMetalResourceManager.TextureStreaming", v5);
    textureStreamingQueue = v2->_textureStreamingQueue;
    v2->_textureStreamingQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

+ (MTLDevice)sharedDevice
{
  id *v2;
  MTLDevice *v3;

  objc_msgSend(a1, "sharedMetalInstance");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = (MTLDevice *)v2[9];

  return v3;
}

+ (id)sharedCommandQueue
{
  id v2;
  id WeakRetained;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&sharedCommandQueue__sharedCommandQueue);
  if (!WeakRetained)
  {
    objc_msgSend(v2, "sharedDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = (id)objc_msgSend(v4, "newCommandQueue");

    objc_storeWeak(&sharedCommandQueue__sharedCommandQueue, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (MTLTexture)sharedNilTexture2D
{
  void *v3;
  void *v4;
  id *v5;
  id v6;
  id *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id *v13;
  id v14;

  objc_msgSend(a1, "sharedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __47__CLKUIMetalResourceManager_sharedNilTexture2D__block_invoke;
    v12 = &unk_1E86E0158;
    v13 = v3;
    v14 = a1;
    if (sharedNilTexture2D_onceToken != -1)
      dispatch_once(&sharedNilTexture2D_onceToken, &v9);
    objc_msgSend(a1, "sharedMetalInstance", v9, v10, v11, v12);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = v5[10];

    v7 = v13;
  }
  else
  {
    objc_msgSend(a1, "sharedMetalInstance");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = v7[10];
  }

  return (MTLTexture *)v6;
}

void __47__CLKUIMetalResourceManager_sharedNilTexture2D__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[3];
  int64x2_t v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, 4, 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUsage:", 0);
  objc_msgSend(v2, "setStorageMode:", 0);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v2);
  objc_msgSend(v3, "setLabel:", CFSTR("CLKUIMetalResourceManager Nil Texture2D"));
  v4 = malloc_type_calloc(1uLL, 0x40uLL, 0xCD1DF82DuLL);
  memset(v7, 0, sizeof(v7));
  v8 = vdupq_n_s64(4uLL);
  v9 = 1;
  objc_msgSend(v3, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v7, 0, 0, v4, 16, 64);
  free(v4);
  objc_msgSend(*(id *)(a1 + 40), "sharedMetalInstance");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5[10];
  v5[10] = v3;

}

+ (MTLTexture)sharedNilTextureCube
{
  void *v3;
  void *v4;
  id *v5;
  id v6;
  id *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id *v13;
  id v14;

  objc_msgSend(a1, "sharedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __49__CLKUIMetalResourceManager_sharedNilTextureCube__block_invoke;
    v12 = &unk_1E86E0158;
    v13 = v3;
    v14 = a1;
    if (sharedNilTextureCube_onceToken != -1)
      dispatch_once(&sharedNilTextureCube_onceToken, &v9);
    objc_msgSend(a1, "sharedMetalInstance", v9, v10, v11, v12);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = v5[11];

    v7 = v13;
  }
  else
  {
    objc_msgSend(a1, "sharedMetalInstance");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = v7[11];
  }

  return (MTLTexture *)v6;
}

void __49__CLKUIMetalResourceManager_sharedNilTextureCube__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t i;
  _QWORD *v6;
  void *v7;
  _QWORD v8[3];
  int64x2_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", 80, 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUsage:", 0);
  objc_msgSend(v2, "setStorageMode:", 0);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v2);
  objc_msgSend(v3, "setLabel:", CFSTR("CLKUIMetalResourceManager Nil TextureCube"));
  v4 = malloc_type_calloc(1uLL, 0x40uLL, 0x39221CF8uLL);
  for (i = 0; i != 6; ++i)
  {
    memset(v8, 0, sizeof(v8));
    v9 = vdupq_n_s64(4uLL);
    v10 = 1;
    objc_msgSend(v3, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v8, 0, i, v4, 16, 64);
  }
  free(v4);
  objc_msgSend(*(id *)(a1 + 40), "sharedMetalInstance");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6[11];
  v6[11] = v3;

}

+ (void)addCompletedErrorCheckToCommandBuffer:(id)a3 forCase:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__CLKUIMetalResourceManager_addCompletedErrorCheckToCommandBuffer_forCase___block_invoke;
  v7[3] = &unk_1E86E0180;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "addCompletedHandler:", v7);

}

void __75__CLKUIMetalResourceManager_addCompletedErrorCheckToCommandBuffer_forCase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "status") != 4)
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "code");
    if (objc_msgSend(v4, "code") == 4 && (CLKInternalBuild() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CLKUIMTLCommandBufferException"), CFSTR("GPU Error Code %lu found submitting MTLCommandBuffer for %@: %@"), v5, *(_QWORD *)(a1 + 32), v4);
    }
    else
    {
      _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218498;
        v9 = v5;
        v10 = 2112;
        v11 = v7;
        v12 = 2112;
        v13 = v4;
        _os_log_fault_impl(&dword_1CB9A4000, v6, OS_LOG_TYPE_FAULT, "GPU Error Code %lu found submitting MTLCommandBuffer for %@: %@", buf, 0x20u);
      }

    }
  }

}

+ (void)setSynchronousTextureStreamingEnabled:(BOOL)a3
{
  if (_synchronousTextureStreamingEnabled != a3)
  {
    _synchronousTextureStreamingEnabled = a3;
    if (a3)
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_3);
  }
}

void __67__CLKUIMetalResourceManager_setSynchronousTextureStreamingEnabled___block_invoke()
{
  _synchronousTextureStreamingEnabled = 0;
}

+ (BOOL)synchronousTextureStreamingEnabled
{
  return _synchronousTextureStreamingEnabled;
}

+ (id)textureStreamingQueue
{
  id *v2;
  id v3;

  objc_msgSend(a1, "sharedMetalInstance");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[12];

  return v3;
}

- (id)nullAtlas2D
{
  if (nullAtlas2D_onceToken != -1)
    dispatch_once(&nullAtlas2D_onceToken, &__block_literal_global_12);
  return (id)__nullAtlas2D;
}

void __40__CLKUIMetalResourceManager_nullAtlas2D__block_invoke()
{
  CLKUIMetalAtlas *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [CLKUIMetalAtlas alloc];
  +[CLKUIMetalResourceManager sharedNilTexture2D](CLKUIMetalResourceManager, "sharedNilTexture2D");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[CLKUIMetalAtlas initWithUuid:nilTexture:streaming:](v0, "initWithUuid:nilTexture:streaming:", 0, v3, 0);
  v2 = (void *)__nullAtlas2D;
  __nullAtlas2D = v1;

}

- (id)nullAtlasCube
{
  if (nullAtlasCube_onceToken != -1)
    dispatch_once(&nullAtlasCube_onceToken, &__block_literal_global_15);
  return (id)__nullAtlasCube;
}

void __42__CLKUIMetalResourceManager_nullAtlasCube__block_invoke()
{
  CLKUIMetalAtlas *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [CLKUIMetalAtlas alloc];
  +[CLKUIMetalResourceManager sharedNilTextureCube](CLKUIMetalResourceManager, "sharedNilTextureCube");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[CLKUIMetalAtlas initWithUuid:nilTexture:streaming:](v0, "initWithUuid:nilTexture:streaming:", 0, v3, 0);
  v2 = (void *)__nullAtlasCube;
  __nullAtlasCube = v1;

}

- (id)_newAtlasForUuid:(id)a3 nullTexture:(id)a4 streaming:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a3;
  objc_msgSend(a4, "atlas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nilTexture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CLKUIMetalResourceManager _newAtlasForUuid:nilTexture:streaming:](self, "_newAtlasForUuid:nilTexture:streaming:", v8, v10, v5);

  return v11;
}

- (id)_newAtlasForUuid:(id)a3 nilTexture:(id)a4 streaming:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  CLKUIMetalAtlas *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[CLKUIMetalAtlas initWithUuid:nilTexture:streaming:]([CLKUIMetalAtlas alloc], "initWithUuid:nilTexture:streaming:", v8, v7, v5);

  return v9;
}

- (void)_purgeAtlases:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "purge");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updateTextureStreamingForAtlas:(id)a3
{
  objc_msgSend(a3, "updateTextureStreaming");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureStreamingQueue, 0);
  objc_storeStrong((id *)&self->_nilTextureCube, 0);
  objc_storeStrong((id *)&self->_nilTexture2D, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
