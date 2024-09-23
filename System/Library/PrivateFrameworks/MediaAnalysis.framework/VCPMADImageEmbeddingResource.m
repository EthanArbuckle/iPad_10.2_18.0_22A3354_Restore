@implementation VCPMADImageEmbeddingResource

- (VCPMADImageEmbeddingResource)initWithRevision:(unint64_t)a3
{
  VCPMADImageEmbeddingResource *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VCPMADImageEmbeddingResource;
  v4 = -[VCPMADImageEmbeddingResource init](&v9, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("VCPMADImageEmbeddingResource", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    v4->_version = a3;
  }
  return v4;
}

+ (id)sharedResourceForRevision:(unint64_t)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__VCPMADImageEmbeddingResource_sharedResourceForRevision___block_invoke;
  v13[3] = &__block_descriptor_40_e35___VCPMADImageEmbeddingResource_8__0l;
  v13[4] = a3;
  objc_msgSend(v10, "sharedInstanceWithIdentifier:andCreationBlock:", v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

VCPMADImageEmbeddingResource *__58__VCPMADImageEmbeddingResource_sharedResourceForRevision___block_invoke(uint64_t a1)
{
  return -[VCPMADImageEmbeddingResource initWithRevision:]([VCPMADImageEmbeddingResource alloc], "initWithRevision:", *(_QWORD *)(a1 + 32));
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
    return 10;
  else
    return 100;
}

- (VCPImageBackboneAnalyzer)imageBackbone
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
  v9 = __Block_byref_object_copy__18;
  v10 = __Block_byref_object_dispose__18;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__VCPMADImageEmbeddingResource_imageBackbone__block_invoke;
  v5[3] = &unk_1E6B16E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (VCPImageBackboneAnalyzer *)v3;
}

void __45__VCPMADImageEmbeddingResource_imageBackbone__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  int v8;
  VCPImageBackboneAnalyzer *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    if (DeviceGeqD5x())
    {
      VCPSignPostLog();
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = os_signpost_id_generate(v2);

      VCPSignPostLog();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
      {
        LOWORD(v14[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPImageBackbone_init", ", (uint8_t *)v14, 2u);
      }

      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) - 2;
      if (v6 > 2)
      {
        v7 = 0;
      }
      else
      {
        v7 = (void *)qword_1E6B176D8[v6];
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v8 = objc_msgSend(v7, "intValue");
          v14[0] = 67109120;
          v14[1] = v8;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "ImageEmbeddingTask set VCPImageBackboneAnalyzer revision %d", (uint8_t *)v14, 8u);
        }
      }
      v9 = -[VCPImageBackboneAnalyzer initWithRequestedAnalyses:andRevision:useSharedModel:]([VCPImageBackboneAnalyzer alloc], "initWithRequestedAnalyses:andRevision:useSharedModel:", 0x1000000000000, v7, 0);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 16);
      *(_QWORD *)(v10 + 16) = v9;

      VCPSignPostLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v12))
      {
        LOWORD(v14[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v3, "VCPImageBackbone_init", ", (uint8_t *)v14, 2u);
      }

    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "ImageEmbeddingTask not supported on this device, requires devices >=D5x", (uint8_t *)v14, 2u);
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
  block[2] = __37__VCPMADImageEmbeddingResource_purge__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__VCPMADImageEmbeddingResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBackbone, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
