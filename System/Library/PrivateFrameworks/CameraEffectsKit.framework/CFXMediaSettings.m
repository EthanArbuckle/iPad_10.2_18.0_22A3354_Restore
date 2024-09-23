@implementation CFXMediaSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1)
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_66);
  return (id)sharedInstance_sharedCompositionSettings;
}

void __34__CFXMediaSettings_sharedInstance__block_invoke()
{
  CFXMediaSettings *v0;
  void *v1;

  v0 = objc_alloc_init(CFXMediaSettings);
  v1 = (void *)sharedInstance_sharedCompositionSettings;
  sharedInstance_sharedCompositionSettings = (uint64_t)v0;

}

- (CFXMediaSettings)init
{
  char *v2;
  CFXMediaSettings *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CFXMediaSettings;
  v2 = -[CFXMediaSettings init](&v15, sel_init);
  v3 = (CFXMediaSettings *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 1) = 0x1E0000001ELL;
    *(_OWORD *)(v2 + 40) = kDefaultRenderSize;
    *(_OWORD *)(v2 + 24) = kDefaultRenderSize;
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@.queue"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v9);
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    v12 = dispatch_queue_create(v11, MEMORY[0x24BDAC9C0]);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v12;

  }
  return v3;
}

- (int)timeScale
{
  CFXMediaSettings *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CFXMediaSettings queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__CFXMediaSettings_timeScale__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __29__CFXMediaSettings_timeScale__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)setTimeScale:(int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  -[CFXMediaSettings queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__CFXMediaSettings_setTimeScale___block_invoke;
  v6[3] = &unk_24EE59670;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_async(v5, v6);

}

uint64_t __33__CFXMediaSettings_setTimeScale___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 8) = *(_DWORD *)(result + 40);
  return result;
}

- (int)frameRate
{
  CFXMediaSettings *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CFXMediaSettings queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__CFXMediaSettings_frameRate__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __29__CFXMediaSettings_frameRate__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 12);
  return result;
}

- (void)setFrameRate:(int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  -[CFXMediaSettings queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__CFXMediaSettings_setFrameRate___block_invoke;
  v6[3] = &unk_24EE59670;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_async(v5, v6);

}

uint64_t __33__CFXMediaSettings_setFrameRate___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 12) = *(_DWORD *)(result + 40);
  return result;
}

- (CGSize)frameSize
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  CGSize result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = &unk_226ACDFC7;
  -[CFXMediaSettings queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __29__CFXMediaSettings_frameSize__block_invoke;
  v8[3] = &unk_24EE57A80;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v3, v8);

  v4 = v10[4];
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

__n128 __29__CFXMediaSettings_frameSize__block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 24);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (void)setFrameSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  NSObject *v6;
  _QWORD block[7];

  height = a3.height;
  width = a3.width;
  -[CFXMediaSettings queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CFXMediaSettings_setFrameSize___block_invoke;
  block[3] = &unk_24EE5A250;
  *(CGFloat *)&block[5] = width;
  *(CGFloat *)&block[6] = height;
  block[4] = self;
  dispatch_barrier_async(v6, block);

}

__n128 __33__CFXMediaSettings_setFrameSize___block_invoke(uint64_t a1)
{
  NSObject *v2;
  __n128 result;

  JFXLog_camera();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __33__CFXMediaSettings_setFrameSize___block_invoke_cold_1(a1);

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

- (CGSize)renderSize
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  CGSize result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = &unk_226ACDFC7;
  -[CFXMediaSettings queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__CFXMediaSettings_renderSize__block_invoke;
  v8[3] = &unk_24EE57A80;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v3, v8);

  v4 = v10[4];
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

__n128 __30__CFXMediaSettings_renderSize__block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 40);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (void)setRenderSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  NSObject *v6;
  _QWORD block[7];

  height = a3.height;
  width = a3.width;
  -[CFXMediaSettings queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CFXMediaSettings_setRenderSize___block_invoke;
  block[3] = &unk_24EE5A250;
  *(CGFloat *)&block[5] = width;
  *(CGFloat *)&block[6] = height;
  block[4] = self;
  dispatch_barrier_async(v6, block);

}

__n128 __34__CFXMediaSettings_setRenderSize___block_invoke(uint64_t a1)
{
  NSObject *v2;
  __n128 result;

  JFXLog_camera();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __33__CFXMediaSettings_setFrameSize___block_invoke_cold_1(a1);

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __33__CFXMediaSettings_setFrameSize___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  double v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v3 = OUTLINED_FUNCTION_3_6();
  objc_msgSend(v4, "numberWithDouble:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 1760), "numberWithDouble:", *(double *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_2269A9000, v7, v8, "size: {%@, %@}", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_1_2();
}

@end
