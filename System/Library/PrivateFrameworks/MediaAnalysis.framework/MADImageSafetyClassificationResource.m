@implementation MADImageSafetyClassificationResource

- (MADImageSafetyClassificationResource)init
{
  MADImageSafetyClassificationResource *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MADImageSafetyClassificationResource;
  v2 = -[MADImageSafetyClassificationResource init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MADImageSafetyClassificationResource", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (id)sharedResource
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", v4, &__block_literal_global_68);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

MADImageSafetyClassificationResource *__54__MADImageSafetyClassificationResource_sharedResource__block_invoke()
{
  return objc_alloc_init(MADImageSafetyClassificationResource);
}

- (int64_t)activeCost
{
  if (DeviceHasANE())
    return 10;
  else
    return 100;
}

- (int64_t)inactiveCost
{
  if (DeviceHasANE())
    return 2;
  else
    return 100;
}

- (SCMLHandler)handler
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
  v9 = __Block_byref_object_copy__41;
  v10 = __Block_byref_object_dispose__41;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MADImageSafetyClassificationResource_handler__block_invoke;
  v5[3] = &unk_1E6B15418;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SCMLHandler *)v3;
}

void __47__MADImageSafetyClassificationResource_handler__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    VCPSignPostLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_generate(v3);

    VCPSignPostLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CommSafetyHandler_init", ", buf, 2u);
    }

    v7 = objc_alloc(MEMORY[0x1E0D8C998]);
    v22 = *MEMORY[0x1E0D8C9D8];
    v23[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v9 = objc_msgSend(v7, "initWithOptions:error:", v8, &v17);
    v10 = v17;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 16);
    *(_QWORD *)(v11 + 16) = v9;

    VCPSignPostLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v14, OS_SIGNPOST_INTERVAL_END, v4, "CommSafetyHandler_init", ", buf, 2u);
    }

    if (v10 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      objc_msgSend(v10, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create %@: %@", buf, 0x16u);

    }
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (void)purge
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MADImageSafetyClassificationResource_purge__block_invoke;
  block[3] = &unk_1E6B15440;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __45__MADImageSafetyClassificationResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
