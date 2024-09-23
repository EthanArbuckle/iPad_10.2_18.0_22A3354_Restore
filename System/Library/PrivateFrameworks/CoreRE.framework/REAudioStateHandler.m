@implementation REAudioStateHandler

- (REAudioStateHandler)initWithTitle:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  REAudioStateHandler *v8;
  REAudioStateHandler *v9;
  NSObject *v10;
  unint64_t osStateHandle;
  id v13;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)REAudioStateHandler;
  v8 = -[REAudioStateHandler init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v14 = v7;
    v13 = v6;
    v9->osStateHandle = os_state_add_handler();

  }
  v10 = *re::audioLogObjects((re *)v8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    osStateHandle = v9->osStateHandle;
    *(_DWORD *)buf = 134217984;
    v17 = osStateHandle;
    _os_log_impl(&dword_224FE9000, v10, OS_LOG_TYPE_DEFAULT, "Created osStateHandle: %llu", buf, 0xCu);
  }

  return v9;
}

char *__43__REAudioStateHandler_initWithTitle_block___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  size_t v8;
  char *v9;

  if (!os_variant_has_internal_diagnostics() || *(_DWORD *)(a2 + 16) != 3)
    return 0;
  v4 = (void *)MEMORY[0x227694090]();
  v5 = (void *)MEMORY[0x24BDD1770];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v6, 200, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "length");
    v9 = (char *)malloc_type_calloc(1uLL, v8 + 200, 0xB73316B3uLL);
    if (v9)
    {
      strlcpy(v9 + 136, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), 0x40uLL);
      *(_DWORD *)v9 = 1;
      *((_DWORD *)v9 + 1) = v8;
      memcpy(v9 + 200, (const void *)objc_msgSend(objc_retainAutorelease(v7), "bytes"), v8);
    }
  }
  else
  {
    v9 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v9;
}

- (void)invalidate
{
  NSObject *v3;
  unint64_t osStateHandle;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->osStateHandle)
  {
    v3 = *re::audioLogObjects((re *)self);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      osStateHandle = self->osStateHandle;
      v5 = 134217984;
      v6 = osStateHandle;
      _os_log_impl(&dword_224FE9000, v3, OS_LOG_TYPE_DEFAULT, "Removed osStateHandle: %llu", (uint8_t *)&v5, 0xCu);
    }
    os_state_remove_handler();
    self->osStateHandle = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[REAudioStateHandler invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)REAudioStateHandler;
  -[REAudioStateHandler dealloc](&v3, sel_dealloc);
}

@end
