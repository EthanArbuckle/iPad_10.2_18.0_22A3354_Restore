@implementation NULivePhotoRenderRequest

- (NULivePhotoRenderRequest)initWithComposition:(id)a3
{
  NULivePhotoRenderRequest *v3;
  uint64_t v4;
  NUColorSpace *colorSpace;
  uint64_t v6;
  NUScalePolicy *scalePolicy;
  NURenderContext *v8;
  NURenderContext *stillBufferRenderContext;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NULivePhotoRenderRequest;
  v3 = -[NURenderRequest initWithComposition:](&v11, sel_initWithComposition_, a3);
  +[NUColorSpace sRGBColorSpace](NUColorSpace, "sRGBColorSpace");
  v4 = objc_claimAutoreleasedReturnValue();
  colorSpace = v3->_colorSpace;
  v3->_colorSpace = (NUColorSpace *)v4;

  +[NUFixedScalePolicy oneToOneScalePolicy](NUFixedScalePolicy, "oneToOneScalePolicy");
  v6 = objc_claimAutoreleasedReturnValue();
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v6;

  v8 = -[NURenderContext initWithPurpose:]([NURenderContext alloc], "initWithPurpose:", 1);
  stillBufferRenderContext = v3->_stillBufferRenderContext;
  v3->_stillBufferRenderContext = v8;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NULivePhotoRenderRequest;
  v4 = -[NURenderRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setColorSpace:", self->_colorSpace);
  objc_msgSend(v4, "setScalePolicy:", self->_scalePolicy);
  objc_storeStrong(v4 + 19, self->_stillBufferRenderContext);
  return v4;
}

- (void)submit:(id)a3
{
  NSObject *v4;
  dispatch_queue_t v5;
  NUBufferRenderRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NUVideoRenderRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  NUPriority *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  NUPriority *v22;
  NUVideoPropertiesRequest *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;

  v29 = a3;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create("NULivePhotoRenderRequest", v4);

  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__25795;
  v42[4] = __Block_byref_object_dispose__25796;
  v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__25795;
  v40[4] = __Block_byref_object_dispose__25796;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__25795;
  v38[4] = __Block_byref_object_dispose__25796;
  v39 = 0;
  +[NURenderTransaction begin](NURenderTransaction, "begin");
  v6 = -[NURenderRequest initWithRequest:]([NUBufferRenderRequest alloc], "initWithRequest:", self);
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[NURenderRequest name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-stillFrame"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setName:](v6, "setName:", v9);

  -[NURenderRequest setRenderContext:](v6, "setRenderContext:", self->_stillBufferRenderContext);
  -[NULivePhotoRenderRequest scalePolicy](self, "scalePolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageRenderRequest setScalePolicy:](v6, "setScalePolicy:", v10);

  -[NULivePhotoRenderRequest colorSpace](self, "colorSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageRenderRequest setColorSpace:](v6, "setColorSpace:", v11);

  -[NURenderRequest setResponseQueue:](v6, "setResponseQueue:", v5);
  v12 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __35__NULivePhotoRenderRequest_submit___block_invoke;
  v37[3] = &unk_1E50640C8;
  v37[4] = v40;
  -[NUBufferRenderRequest submit:](v6, "submit:", v37);
  v13 = -[NURenderRequest initWithRequest:]([NUVideoRenderRequest alloc], "initWithRequest:", self);
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[NURenderRequest name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-NUVideoRenderRequest"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setName:](v13, "setName:", v16);

  v17 = [NUPriority alloc];
  -[NURenderRequest priority](self, "priority");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "level");
  -[NURenderRequest priority](self, "priority");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "order");
  v22 = -[NUPriority initWithLevel:order:](v17, "initWithLevel:order:", v19, v21 + 0.00999999978);
  -[NURenderRequest setPriority:](v13, "setPriority:", v22);

  -[NURenderRequest setResponseQueue:](v13, "setResponseQueue:", v5);
  v36[0] = v12;
  v36[1] = 3221225472;
  v36[2] = __35__NULivePhotoRenderRequest_submit___block_invoke_2;
  v36[3] = &unk_1E50640C8;
  v36[4] = v42;
  -[NUVideoRenderRequest submit:](v13, "submit:", v36);
  v23 = -[NURenderRequest initWithRequest:]([NUVideoPropertiesRequest alloc], "initWithRequest:", self);
  -[NURenderRequest priority](v13, "priority");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setPriority:](v23, "setPriority:", v24);

  -[NURenderRequest setResponseQueue:](v23, "setResponseQueue:", v5);
  v25 = (void *)MEMORY[0x1E0CB3940];
  -[NURenderRequest name](self, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@-videoProperties"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setName:](v23, "setName:", v27);

  v35[0] = v12;
  v35[1] = 3221225472;
  v35[2] = __35__NULivePhotoRenderRequest_submit___block_invoke_3;
  v35[3] = &unk_1E50640C8;
  v35[4] = v38;
  -[NUVideoPropertiesRequest submit:](v23, "submit:", v35);
  v30[0] = v12;
  v30[1] = 3221225472;
  v30[2] = __35__NULivePhotoRenderRequest_submit___block_invoke_4;
  v30[3] = &unk_1E5064118;
  v33 = v42;
  v34 = v38;
  v32 = v40;
  v30[4] = self;
  v28 = v29;
  v31 = v28;
  +[NURenderTransaction commitAndNotifyOnQueue:withBlock:](NURenderTransaction, "commitAndNotifyOnQueue:withBlock:", v5, v30);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v42, 8);
}

- (id)livePhotoRenderResultFromPhotoResponse:(id)a3 videoResponse:(id)a4 propertiesResponse:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!a6)
  {
    NUAssertLogger_25713();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_25713();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v31;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NULivePhotoRenderRequest livePhotoRenderResultFromPhotoResponse:videoResponse:propertiesResponse:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/LivePhoto/NULivePhotoRenderRequest.m", 156, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"error != NULL");
  }
  v12 = v11;
  objc_msgSend(v9, "result:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v10, "result:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v12, "result:", a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v14, "avAsset");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "videoComposition");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        memset(buf, 0, sizeof(buf));
        objc_msgSend(v15, "properties");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
          objc_msgSend(v17, "livePhotoKeyFrameTime");
        else
          memset(buf, 0, sizeof(buf));

        +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 3, CFSTR("Failed to extract time for live photo"), v16);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return 0;
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 160, 1);
}

- (void)setScalePolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_scalePolicy, 0);
  objc_storeStrong((id *)&self->_stillBufferRenderContext, 0);
}

void __35__NULivePhotoRenderRequest_submit___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__NULivePhotoRenderRequest_submit___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__NULivePhotoRenderRequest_submit___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__NULivePhotoRenderRequest_submit___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NUResponse *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NUResponse *v10;
  _QWORD block[4];
  NUResponse *v12;
  id v13;
  id v14;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v2 = *(void **)(a1 + 32);
    v14 = 0;
    objc_msgSend(v2, "livePhotoRenderResultFromPhotoResponse:videoResponse:propertiesResponse:error:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v14;
    if (v3)
    {
      v5 = -[NUResponse initWithResult:]([NUResponse alloc], "initWithResult:", v3);
    }
    else
    {
      v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to render live photo"), v6, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = -[NUResponse initWithError:]([NUResponse alloc], "initWithError:", v7);
    }
    objc_msgSend(*(id *)(a1 + 32), "responseQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__NULivePhotoRenderRequest_submit___block_invoke_5;
    block[3] = &unk_1E50640F0;
    v9 = *(id *)(a1 + 40);
    v12 = v5;
    v13 = v9;
    v10 = v5;
    dispatch_async(v8, block);

  }
}

uint64_t __35__NULivePhotoRenderRequest_submit___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
