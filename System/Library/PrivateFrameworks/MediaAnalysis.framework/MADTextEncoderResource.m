@implementation MADTextEncoderResource

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
  v8[2] = __40__MADTextEncoderResource_sharedResource__block_invoke;
  v8[3] = &__block_descriptor_40_e5__8__0l;
  v8[4] = a1;
  objc_msgSend(v3, "sharedInstanceWithIdentifier:andCreationBlock:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __40__MADTextEncoderResource_sharedResource__block_invoke()
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (id)sharedResource:(int64_t)a3
{
  __objc2_class *v3;
  int v4;
  id result;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1:
      v3 = MADSystemSearchMD2TextEncoderResource;
      goto LABEL_11;
    case 2:
      v3 = MADSystemSearchMD3TextEncoderResource;
      goto LABEL_11;
    case 3:
    case 5:
    case 7:
      v3 = MADGenerativePlaygroundsMD1TextEncoderResource;
      goto LABEL_11;
    case 4:
      v3 = MADSystemSearchMD4TextEncoderResource;
      goto LABEL_11;
    case 6:
      v3 = MADGenerativePlaygroundsMD4TextEncoderResource;
LABEL_11:
      -[__objc2_class sharedResource](v3, "sharedResource");
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = a3;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = v4;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MADTextEncoderResource requested for unsupported revision (%d)", (uint8_t *)v6, 8u);
      }
      result = 0;
      break;
  }
  return result;
}

- (MADTextEncoderResource)init
{
  MADTextEncoderResource *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MADTextEncoderResource;
  v2 = -[MADTextEncoderResource init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MADTextEmbeddingResource", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
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

- (int64_t)revision
{
  objc_class *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ needs to implement revision", (uint8_t *)&v5, 0xCu);

  }
  return 0;
}

- (int64_t)tokenEmbeddingType
{
  objc_class *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ needs to implement tokenEmbeddingType", (uint8_t *)&v5, 0xCu);

  }
  return 0;
}

- (unint64_t)version
{
  objc_class *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ needs to implement version", (uint8_t *)&v5, 0xCu);

  }
  return 0;
}

- (id)additionalLayerNames
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (CSUTextEncoder)textEncoder
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
  v9 = __Block_byref_object_copy__45;
  v10 = __Block_byref_object_dispose__45;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__MADTextEncoderResource_textEncoder__block_invoke;
  v5[3] = &unk_1E6B16E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CSUTextEncoder *)v3;
}

void __37__MADTextEncoderResource_textEncoder__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[2];
  if (v3)
    goto LABEL_2;
  v4 = objc_msgSend(v2, "revision");
  if (v4)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0D18910], "createForRevision:error:", v4, &v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v18;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "additionalLayerNames");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAdditionalLayerNames:", v7);

      VCPSignPostLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_signpost_id_generate(v8);

      VCPSignPostLog();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CSUTextEncoder_init", ", buf, 2u);
      }

      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18908]), "initWithConfiguration:", v5);
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 16);
      *(_QWORD *)(v13 + 16) = v12;

      VCPSignPostLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v16, OS_SIGNPOST_INTERVAL_END, v9, "CSUTextEncoder_init", ", buf, 2u);
      }

      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
      {

        v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
LABEL_2:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
        return;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create text encoder", buf, 2u);
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v17;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create text encoder configuration (%@)", buf, 0xCu);

    }
    return;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid text encoder configuration", buf, 2u);
  }
}

- (id)tokensForAgeType:(unsigned __int16)a3
{
  return 0;
}

- (void)purge
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__MADTextEncoderResource_purge__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __31__MADTextEncoderResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncoder, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
