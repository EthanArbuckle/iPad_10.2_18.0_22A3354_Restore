@implementation CSAudioTimeConverterPool

- (CSAudioTimeConverterPool)init
{
  CSAudioTimeConverterPool *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *pool;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSAudioTimeConverterPool;
  v2 = -[CSAudioTimeConverterPool init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSAudioTimeConverterPool", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    pool = v2->_pool;
    v2->_pool = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)defaultConverter
{
  return -[CSAudioTimeConverterPool _getAudioTimeConverterWithAudioStreamId:](self, "_getAudioTimeConverterWithAudioStreamId:", 1);
}

- (id)defaultExclaveConverter
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__293;
  v10 = __Block_byref_object_dispose__294;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__CSAudioTimeConverterPool_defaultExclaveConverter__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_getAudioTimeConverterWithAudioStreamId:(unint64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__293;
  v11 = __Block_byref_object_dispose__294;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CSAudioTimeConverterPool__getAudioTimeConverterWithAudioStreamId___block_invoke;
  block[3] = &unk_1E6880E38;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_async_and_wait(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)pool
{
  return self->_pool;
}

- (void)setPool:(id)a3
{
  objc_storeStrong((id *)&self->_pool, a3);
}

- (CSAudioTimeConverter)exclaveTimeConverter
{
  return self->_exclaveTimeConverter;
}

- (void)setExclaveTimeConverter:(id)a3
{
  objc_storeStrong((id *)&self->_exclaveTimeConverter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclaveTimeConverter, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __68__CSAudioTimeConverterPool__getAudioTimeConverterWithAudioStreamId___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CSAudioTimeConverter *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1[4] + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    v9 = objc_alloc_init(CSAudioTimeConverter);
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    v13 = *(void **)(a1[4] + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

    if (!a1[6])
    {
      v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[CSAudioTimeConverterPool _getAudioTimeConverterWithAudioStreamId:]_block_invoke";
        _os_log_error_impl(&dword_1B502E000, v15, OS_LOG_TYPE_ERROR, "%s Requested audioTimeConverter on invalid streamHandleId", buf, 0xCu);
      }
    }
  }
}

void __51__CSAudioTimeConverterPool_defaultExclaveConverter__block_invoke(uint64_t a1)
{
  void *v2;
  CSAudioTimeConverter *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_alloc_init(CSAudioTimeConverter);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = v2;
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_303 != -1)
    dispatch_once(&sharedInstance_onceToken_303, &__block_literal_global_304);
  return (id)sharedInstance_sharedInstance_305;
}

void __42__CSAudioTimeConverterPool_sharedInstance__block_invoke()
{
  CSAudioTimeConverterPool *v0;
  void *v1;

  v0 = objc_alloc_init(CSAudioTimeConverterPool);
  v1 = (void *)sharedInstance_sharedInstance_305;
  sharedInstance_sharedInstance_305 = (uint64_t)v0;

}

@end
