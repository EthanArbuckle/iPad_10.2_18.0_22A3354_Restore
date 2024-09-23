@implementation VCPMADVIResource

- (VCPMADVIResource)init
{
  VCPMADVIResource *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPMADVIResource;
  v2 = -[VCPMADVIResource init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("VCPMADVIResource", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (int64_t)activeCost
{
  if (DeviceHasANE())
    return 40;
  else
    return 100;
}

- (int64_t)inactiveCost
{
  if (DeviceHasANE())
    return 5;
  else
    return 100;
}

- (VIService)service
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
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__VCPMADVIResource_service__block_invoke;
  v5[3] = &unk_1E6B15418;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (VIService *)v3;
}

void __27__VCPMADVIResource_service__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

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
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VIService_init", ", buf, 2u);
    }

    v7 = objc_alloc_init(MEMORY[0x1E0DC6EB0]);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v7;

    VCPSignPostLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_END, v4, "VIService_init", ", v12, 2u);
    }

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (void)purge
{
  NSObject *queue;
  void *v3;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__VCPMADVIResource_purge__block_invoke;
  block[3] = &unk_1E6B15440;
  block[4] = self;
  dispatch_sync(queue, block);
  objc_msgSend(MEMORY[0x1E0CEE040], "globalSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseCachedResources");

}

void __25__VCPMADVIResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
