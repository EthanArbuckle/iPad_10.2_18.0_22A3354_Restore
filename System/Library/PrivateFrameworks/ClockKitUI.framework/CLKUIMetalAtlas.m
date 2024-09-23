@implementation CLKUIMetalAtlas

- (CLKUIMetalAtlas)initWithUuid:(id)a3 nilTexture:(id)a4 streaming:(BOOL)a5
{
  id v9;
  CLKUIMetalAtlas *v10;
  CLKUIMetalAtlas *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLKUIMetalAtlas;
  v10 = -[CLKUIAtlas initWithUuid:](&v13, sel_initWithUuid_, a3);
  v11 = v10;
  if (v10)
  {
    v10->_mainQueue_prewarmState = 0;
    objc_storeStrong((id *)&v10->_nilTexture, a4);
    v11->_streaming = a5;
    v11->_needsStreaming = a5;
  }

  return v11;
}

- (void)dealloc
{
  __assert_rtn("-[CLKUIMetalAtlas dealloc]", "CLKUIMetalTexture.m", 179, "_texture == nil");
}

+ (unint64_t)_computeMTLTextureMemoryUsageWithBacking:(id)a3 numMipmapLevelsToDrop:(unint64_t)a4
{
  id v4;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(v4, "structure");
    +[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:].cold.1();
  }

  return 0;
}

+ (id)_allocateMTLTextureWithBacking:(id)a3 numMipmapLevelsToDrop:(unint64_t)a4 device:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a5;
  if (v6)
  {
    kdebug_trace();
    objc_msgSend(v6, "structure", 0, 0);
    +[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:].cold.1();
  }

  return 0;
}

+ (id)_uploadMTLTexture:(id)a3 withBacking:(id)a4 numMipmapLevelsToDrop:(unint64_t)a5 device:(id)a6 encoder:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v15;
  uint64_t v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  if (v11)
  {
    kdebug_trace();
    v16 = 0;
    v15 = 0u;
    objc_msgSend(v11, "structure");
    +[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:].cold.1();
  }

  return 0;
}

+ (id)_createMTLTextureWithBacking:(id)a3 numMipmapLevelsToDrop:(unint64_t)a4 device:(id)a5 encoder:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  +[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:](CLKUIMetalAtlas, "_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:", v9, a4, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:](CLKUIMetalAtlas, "_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:", v12, v9, a4, v10, v11);

  return v12;
}

- (void)prewarm
{
  void *v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  void *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("none");
  if (*a2 == 1)
    v6 = CFSTR("prewarming");
  if (*a2 == 2)
    v7 = CFSTR("prewarmed");
  else
    v7 = (__CFString *)v6;
  v8 = v7;
  v9 = 138412546;
  v10 = v5;
  v11 = 2112;
  v12 = v8;
  _os_log_error_impl(&dword_1CB9A4000, a3, OS_LOG_TYPE_ERROR, "Not prewarming %@ because prewarmState = %@, but the texture is already loaded", (uint8_t *)&v9, 0x16u);

}

void __26__CLKUIMetalAtlas_prewarm__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    +[CLKUIMetalAtlas _createMTLTextureWithBacking:numMipmapLevelsToDrop:device:encoder:](CLKUIMetalAtlas, "_createMTLTextureWithBacking:numMipmapLevelsToDrop:device:encoder:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)WeakRetained[16];
    WeakRetained[16] = v3;

    CLKLoggingObjectForDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1CB9A4000, v5, OS_LOG_TYPE_DEFAULT, "Finished prewarming texture %@", buf, 0xCu);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__CLKUIMetalAtlas_prewarm__block_invoke_20;
    block[3] = &unk_1E86E0670;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __26__CLKUIMetalAtlas_prewarm__block_invoke_20(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 136) == 1)
    *(_QWORD *)(v1 + 136) = 2;
  return result;
}

- (void)finishPrewarm
{
  dispatch_block_t v3;
  void *v4;
  OS_dispatch_queue *loaderQueue;
  _QWORD block[5];

  if (self->_loaderQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__CLKUIMetalAtlas_finishPrewarm__block_invoke;
    block[3] = &unk_1E86E0670;
    block[4] = self;
    v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_sync((dispatch_queue_t)self->_loaderQueue, v3);
    +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "returnTextureLoadingQueue:", self->_loaderQueue);

    loaderQueue = self->_loaderQueue;
    self->_loaderQueue = 0;

  }
}

void __32__CLKUIMetalAtlas_finishPrewarm__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  CLKLoggingObjectForDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1CB9A4000, v2, OS_LOG_TYPE_DEFAULT, "Loading prewarmed texture %@", (uint8_t *)&v6, 0xCu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(*(_QWORD *)(a1 + 32) + 128));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 128);
  *(_QWORD *)(v4 + 128) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 2;
}

- (void)bind:(id)a3 slot:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  unint64_t numMipmapLevelsDropped;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id streamingCompletionBlock;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  MTLTexture *v49;
  MTLTexture *texture;
  id v51;
  void (**v52)(_QWORD);
  id v53;
  NSObject *v54;
  MTLTexture *nilTexture;
  void *v56;
  MTLTexture *v57;
  MTLTexture *v58;
  unint64_t v59;
  void *v60;
  _QWORD block[4];
  id v62;
  id v63;
  id v64;
  id v65;
  CLKUIMetalAtlas *v66;
  id v67;
  unint64_t v68;
  _QWORD aBlock[5];
  id v70;
  uint8_t buf[4];
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CLKUIAtlas uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_46;
  if (self->_loaderQueue)
    -[CLKUIMetalAtlas finishPrewarm](self, "finishPrewarm");
  if (self->_streaming)
  {
    v8 = 0x1EF9AD000;
    if (self->_needsStreaming)
    {
      self->_needsStreaming = 0;
      -[CLKUIAtlas backing](self, "backing");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        numMipmapLevelsDropped = self->_numMipmapLevelsDropped;
        v11 = +[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:](CLKUIMetalAtlas, "_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:", v9, numMipmapLevelsDropped);
        +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v60, "ensureMemoryAvailable:", v11) & 1) == 0)
        {
          CLKLoggingObjectForDomain();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            -[CLKUIAtlas uuid](self, "uuid");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v72 = v13;
            _os_log_impl(&dword_1CB9A4000, v12, OS_LOG_TYPE_DEFAULT, "failed to ensure enough memory for %@", buf, 0xCu);

          }
        }
        objc_msgSend(v6, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v59 = a4;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v29 = v16;

        +[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:](CLKUIMetalAtlas, "_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:", v9, numMipmapLevelsDropped, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __29__CLKUIMetalAtlas_bind_slot___block_invoke;
        aBlock[3] = &unk_1E86E0450;
        aBlock[4] = self;
        v32 = v30;
        v70 = v32;
        v33 = _Block_copy(aBlock);
        v34 = _Block_copy(v33);
        streamingCompletionBlock = self->_streamingCompletionBlock;
        self->_streamingCompletionBlock = v34;

        +[CLKUIMetalResourceManager textureStreamingQueue](CLKUIMetalResourceManager, "textureStreamingQueue");
        v36 = objc_claimAutoreleasedReturnValue();
        block[0] = v31;
        block[1] = 3221225472;
        block[2] = __29__CLKUIMetalAtlas_bind_slot___block_invoke_2;
        block[3] = &unk_1E86E0BE0;
        v62 = v32;
        v9 = v9;
        v68 = numMipmapLevelsDropped;
        v63 = v9;
        v64 = v29;
        v37 = v6;
        v65 = v37;
        v66 = self;
        v67 = v33;
        v38 = v33;
        v39 = v29;
        v40 = v32;
        dispatch_async(v36, block);

        self->_mainQueue_prewarmState = 2;
        -[CLKUIAtlas setStatus:](self, "setStatus:", 3);
        objc_msgSend(v60, "notifyAtlas:willChangeToMemoryCost:", self, v11);
        -[CLKUIAtlas setMemoryCost:](self, "setMemoryCost:", v11);

        v8 = 0x1EF9AD000uLL;
        if (self->_texture)
        {
          a4 = v59;
        }
        else
        {
          v41 = objc_msgSend(v9, "width");
          v42 = objc_msgSend(v9, "height");
          v43 = 0;
          a4 = v59;
          while (v41 > -[CLKUIAtlas maxPlaceholderSize](self, "maxPlaceholderSize")
               || v42 > -[CLKUIAtlas maxPlaceholderSize](self, "maxPlaceholderSize"))
          {
            ++v43;
            v41 >>= 1;
            v42 >>= 1;
          }
          if (self->_numMipmapLevelsDropped <= v43)
            v44 = v43;
          else
            v44 = self->_numMipmapLevelsDropped;
          objc_msgSend(v37, "device");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v45;
          if (v45)
          {
            v47 = v45;
          }
          else
          {
            +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
            v47 = (id)objc_claimAutoreleasedReturnValue();
          }
          v48 = v47;

          +[CLKUIMetalAtlas _createMTLTextureWithBacking:numMipmapLevelsToDrop:device:encoder:](CLKUIMetalAtlas, "_createMTLTextureWithBacking:numMipmapLevelsToDrop:device:encoder:", v9, v44, v48, v37);
          v49 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
          texture = self->_texture;
          self->_texture = v49;

          if (self->_mainQueue_prewarmState != 2)
            -[CLKUIMetalAtlas bind:slot:].cold.2();
          if (-[CLKUIAtlas status](self, "status") != 3)
            -[CLKUIMetalAtlas bind:slot:].cold.1();

        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (+[CLKUIMetalResourceManager synchronousTextureStreamingEnabled](CLKUIMetalResourceManager, "synchronousTextureStreamingEnabled"))
    {
      v51 = self->_streamingCompletionBlock;
      if (v51)
      {
        v52 = (void (**)(_QWORD))_Block_copy(v51);
        v53 = self->_streamingCompletionBlock;
        self->_streamingCompletionBlock = 0;

        +[CLKUIMetalResourceManager textureStreamingQueue](CLKUIMetalResourceManager, "textureStreamingQueue");
        v54 = objc_claimAutoreleasedReturnValue();
        dispatch_sync(v54, &__block_literal_global_12);

        v52[2](v52);
      }
    }

    v17 = *(int *)(v8 + 1976);
  }
  else
  {
    v17 = 80;
    if (!self->_texture)
    {
      CLKLoggingObjectForDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[CLKUIAtlas uuid](self, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v72 = v19;
        _os_log_impl(&dword_1CB9A4000, v18, OS_LOG_TYPE_DEFAULT, "Texure not prewarmed. %@", buf, 0xCu);

      }
      -[CLKUIAtlas backing](self, "backing");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = self->_numMipmapLevelsDropped;
        v22 = +[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:](CLKUIMetalAtlas, "_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:", v20, v21);
        +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "ensureMemoryAvailable:", v22) & 1) == 0)
        {
          CLKLoggingObjectForDomain();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            -[CLKUIAtlas uuid](self, "uuid");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v72 = v25;
            _os_log_impl(&dword_1CB9A4000, v24, OS_LOG_TYPE_DEFAULT, "failed to ensure enough memory for %@", buf, 0xCu);

          }
        }
        objc_msgSend(v6, "device");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          v28 = v26;
        }
        else
        {
          +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
          v28 = (id)objc_claimAutoreleasedReturnValue();
        }
        v56 = v28;

        +[CLKUIMetalAtlas _createMTLTextureWithBacking:numMipmapLevelsToDrop:device:encoder:](CLKUIMetalAtlas, "_createMTLTextureWithBacking:numMipmapLevelsToDrop:device:encoder:", v20, v21, v56, v6);
        v57 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        v58 = self->_texture;
        self->_texture = v57;

        self->_mainQueue_prewarmState = 2;
        -[CLKUIAtlas setStatus:](self, "setStatus:", 3);
        objc_msgSend(v23, "notifyAtlas:willChangeToMemoryCost:", self, v22);
        -[CLKUIAtlas setMemoryCost:](self, "setMemoryCost:", v22);

      }
    }
  }
  if (*(Class *)((char *)&self->super.super.isa + v17))
  {
    -[CLKUIAtlas setBoundTime:](self, "setBoundTime:", CACurrentMediaTime());
    nilTexture = *(Class *)((char *)&self->super.super.isa + v17);
  }
  else
  {
LABEL_46:
    nilTexture = self->_nilTexture;
  }
  objc_msgSend(v6, "setFragmentTexture:atIndex:", nilTexture, a4);

}

void __29__CLKUIMetalAtlas_bind_slot___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

void __29__CLKUIMetalAtlas_bind_slot___block_invoke_2(_QWORD *a1)
{
  id v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = +[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:](CLKUIMetalAtlas, "_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:", a1[4], a1[5], a1[10], a1[6], a1[7]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__CLKUIMetalAtlas_bind_slot___block_invoke_3;
  v4[3] = &unk_1E86E0BB8;
  v3 = (void *)a1[9];
  v4[4] = a1[8];
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __29__CLKUIMetalAtlas_bind_slot___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  if (v3 == v2)
  {
    (*(void (**)(void))(v3 + 16))();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = 0;

  }
}

- (void)purge
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id streamingCompletionBlock;
  NSObject *v8;
  id v9;
  void *v10;
  MTLTexture *texture;
  id v12;
  _QWORD block[5];
  id v14;
  _QWORD aBlock[5];

  -[CLKUIAtlas uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_loaderQueue)
      -[CLKUIMetalAtlas finishPrewarm](self, "finishPrewarm");
    if (self->_streaming)
    {
      if (-[CLKUIAtlas isPurgable](self, "isPurgable"))
      {
        v4 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __24__CLKUIMetalAtlas_purge__block_invoke;
        aBlock[3] = &unk_1E86E0670;
        aBlock[4] = self;
        v5 = _Block_copy(aBlock);
        v6 = _Block_copy(v5);
        streamingCompletionBlock = self->_streamingCompletionBlock;
        self->_streamingCompletionBlock = v6;

        +[CLKUIMetalResourceManager textureStreamingQueue](CLKUIMetalResourceManager, "textureStreamingQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        block[0] = v4;
        block[1] = 3221225472;
        block[2] = __24__CLKUIMetalAtlas_purge__block_invoke_2;
        block[3] = &unk_1E86E0BB8;
        block[4] = self;
        v14 = v5;
        v9 = v5;
        dispatch_async(v8, block);

        self->_needsStreaming = 1;
        -[CLKUIAtlas setStatus:](self, "setStatus:", 4);
        +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "notifyAtlas:willChangeToMemoryCost:", self, 0);
        -[CLKUIAtlas setMemoryCost:](self, "setMemoryCost:", 0);
        self->_mainQueue_prewarmState = 0;

      }
    }
    else if (self->_texture && -[CLKUIAtlas isPurgable](self, "isPurgable"))
    {
      texture = self->_texture;
      self->_texture = 0;

      -[CLKUIAtlas setStatus:](self, "setStatus:", 4);
      +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "notifyAtlas:willChangeToMemoryCost:", self, 0);
      -[CLKUIAtlas setMemoryCost:](self, "setMemoryCost:", 0);
      self->_mainQueue_prewarmState = 0;

    }
  }
}

void __24__CLKUIMetalAtlas_purge__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 80);
  *(_QWORD *)(v1 + 80) = 0;

}

void __24__CLKUIMetalAtlas_purge__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __24__CLKUIMetalAtlas_purge__block_invoke_3;
  v2[3] = &unk_1E86E0BB8;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __24__CLKUIMetalAtlas_purge__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  if (v3 == v2)
  {
    (*(void (**)(void))(v3 + 16))();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = 0;

  }
}

- (void)updateTextureStreaming
{
  unint64_t v3;
  unint64_t numMipmapLevelsDropped;
  unint64_t v5;
  unint64_t v6;
  double v8;
  double v9;
  double v10;

  v3 = -[CLKUIAtlas maxMipmapLevelsToDrop](self, "maxMipmapLevelsToDrop");
  numMipmapLevelsDropped = self->_numMipmapLevelsDropped;
  if (v3 != numMipmapLevelsDropped)
  {
    v5 = numMipmapLevelsDropped - (v3 != 0);
    v6 = numMipmapLevelsDropped + 1;
    if (v3 <= v5 || v3 > v6)
    {
      self->_numMipmapLevelsDropped = v3;
      self->_needsStreaming = 1;
    }
  }
  if (!+[CLKUIMetalResourceManager synchronousTextureStreamingEnabled](CLKUIMetalResourceManager, "synchronousTextureStreamingEnabled"))
  {
    v8 = CACurrentMediaTime();
    -[CLKUIAtlas boundTime](self, "boundTime");
    v10 = v9;
    if (-[CLKUIAtlas isPurgable](self, "isPurgable"))
    {
      if (v8 - v10 > 1.0)
        -[CLKUIMetalAtlas purge](self, "purge", v8 - v10);
    }
  }
}

- (MTLTexture)nilTexture
{
  return self->_nilTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nilTexture, 0);
  objc_storeStrong((id *)&self->_loaderQueue_prewarmedTexture, 0);
  objc_storeStrong((id *)&self->_loaderQueue, 0);
  objc_storeStrong(&self->_streamingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.1()
{
  __assert_rtn("+[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]", "CLKUIMetalTexture.m", 224, "opt.width > 0 && opt.height > 0");
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.2()
{
  __assert_rtn("+[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]", "CLKUIMetalTexture.m", 225, "opt.width <= CLKUITextureMaxDimension && opt.height <= CLKUITextureMaxDimension");
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.3()
{
  __assert_rtn("+[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]", "CLKUIMetalTexture.m", 226, "(opt.planes == 1) || (opt.planes == 6)");
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.4()
{
  __assert_rtn("+[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]", "CLKUIMetalTexture.m", 228, "isMipmapped || (opt.mipCount < 2)");
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.5()
{
  __assert_rtn("+[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]", "CLKUIMetalTexture.m", 280, "(width > 0) && (height > 0)");
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.6()
{
  __assert_rtn("+[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]", "CLKUIMetalTexture.m", 259, "(width > 0) && (height > 0)");
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.7()
{
  __assert_rtn("+[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]", "CLKUIMetalTexture.m", 229, "!isCubeMap || (opt.width == opt.height)");
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.8()
{
  __assert_rtn("+[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]", "CLKUIMetalTexture.m", 227, "isCompressed || ((opt.width * opt.bytesPerPixel) == (opt.planeLength / opt.height))");
}

+ (void)_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:.cold.1()
{
  __assert_rtn("+[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:]", "CLKUIMetalTexture.m", 322, "opt.width > 0 && opt.height > 0");
}

+ (void)_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:.cold.2()
{
  __assert_rtn("+[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:]", "CLKUIMetalTexture.m", 323, "opt.width <= CLKUITextureMaxDimension && opt.height <= CLKUITextureMaxDimension");
}

+ (void)_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:.cold.3()
{
  __assert_rtn("+[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:]", "CLKUIMetalTexture.m", 324, "(opt.planes == 1) || (opt.planes == 6)");
}

+ (void)_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:.cold.4()
{
  __assert_rtn("+[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:]", "CLKUIMetalTexture.m", 326, "isMipmapped || (opt.mipCount < 2)");
}

+ (void)_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:.cold.5()
{
  __assert_rtn("+[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:]", "CLKUIMetalTexture.m", 327, "!isCubeMap || (opt.width == opt.height)");
}

+ (void)_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:.cold.6()
{
  __assert_rtn("+[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:]", "CLKUIMetalTexture.m", 325, "isCompressed || ((opt.width * opt.bytesPerPixel) == (opt.planeLength / opt.height))");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.1()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 404, "opt.width > 0 && opt.height > 0");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.2()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 405, "opt.width <= CLKUITextureMaxDimension && opt.height <= CLKUITextureMaxDimension");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.3()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 406, "(opt.planes == 1) || (opt.planes == 6)");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.4()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 408, "isMipmapped || (opt.mipCount < 2)");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.5()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 506, "planeStart == (uint8_t*)opt.bytes + opt.bytesLength");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.6()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 460, "(width > 0) && (height > 0)");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.7()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 409, "!isCubeMap || (opt.width == opt.height)");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.8()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 407, "isCompressed || ((opt.width * opt.bytesPerPixel) == (opt.planeLength / opt.height))");
}

- (void)bind:slot:.cold.1()
{
  __assert_rtn("-[CLKUIMetalAtlas bind:slot:]", "CLKUIMetalTexture.m", 734, "self.status == CLKUIContentStatusReady");
}

- (void)bind:slot:.cold.2()
{
  __assert_rtn("-[CLKUIMetalAtlas bind:slot:]", "CLKUIMetalTexture.m", 733, "_mainQueue_prewarmState == CLKUIMetalAtlasPrewarmStatePrewarmed");
}

@end
