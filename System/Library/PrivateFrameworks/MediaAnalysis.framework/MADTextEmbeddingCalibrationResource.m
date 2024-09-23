@implementation MADTextEmbeddingCalibrationResource

- (MADTextEmbeddingCalibrationResource)init
{
  MADTextEmbeddingCalibrationResource *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MADTextEmbeddingCalibrationResource;
  v2 = -[MADTextEmbeddingCalibrationResource init](&v10, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

+ (id)sharedResource
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__MADTextEmbeddingCalibrationResource_sharedResource__block_invoke;
  v8[3] = &__block_descriptor_40_e5__8__0l;
  v8[4] = a1;
  objc_msgSend(v3, "sharedInstanceWithIdentifier:andCreationBlock:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53__MADTextEmbeddingCalibrationResource_sharedResource__block_invoke()
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (int64_t)activeCost
{
  if (DeviceHasANE())
    return 4;
  else
    return 100;
}

- (int64_t)inactiveCost
{
  if (DeviceHasANE())
    return 1;
  else
    return 100;
}

- (MADTextEmbeddingCalibration)instance
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
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MADTextEmbeddingCalibrationResource_instance__block_invoke;
  v5[3] = &unk_1E6B15418;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MADTextEmbeddingCalibration *)v3;
}

void __47__MADTextEmbeddingCalibrationResource_instance__block_invoke(uint64_t a1)
{
  MADTextEmbeddingCalibration *v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = objc_alloc_init(MADTextEmbeddingCalibration);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
      && (int)MediaAnalysisLogLevel() >= 3
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Resource] Failed to init %@", (uint8_t *)&v7, 0xCu);

    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)purge
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MADTextEmbeddingCalibrationResource_purge__block_invoke;
  block[3] = &unk_1E6B15440;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __44__MADTextEmbeddingCalibrationResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
