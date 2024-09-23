@implementation ASVInlinePreview

- (void)commonInitWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CALayer *v8;
  CALayer *layer;
  CALayer *v10;
  CALayer *errorLayer;
  CAActivityIndicatorLayer *v12;
  CAActivityIndicatorLayer *spinnerLayer;
  void *v14;
  id v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ++_instanceCount;
  self->_duration = 0.0;
  v8 = (CALayer *)objc_opt_new();
  layer = self->_layer;
  self->_layer = v8;

  -[CALayer setFrame:](self->_layer, "setFrame:", x, y, width, height);
  -[ASVInlinePreview _createErrorLayer](self, "_createErrorLayer");
  v10 = (CALayer *)objc_claimAutoreleasedReturnValue();
  errorLayer = self->_errorLayer;
  self->_errorLayer = v10;

  -[CALayer setHidden:](self->_errorLayer, "setHidden:", 1);
  -[CALayer addSublayer:](self->_layer, "addSublayer:", self->_errorLayer);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.235294118, 0.235294118, 0.262745098, 0.6);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[CAActivityIndicatorLayer initWithColor:]([CAActivityIndicatorLayer alloc], "initWithColor:", v15);
  spinnerLayer = self->_spinnerLayer;
  self->_spinnerLayer = v12;

  -[CAActivityIndicatorLayer setFrame:](self->_spinnerLayer, "setFrame:", 0.0, 0.0, 20.0, 20.0);
  -[CALayer addSublayer:](self->_layer, "addSublayer:", self->_spinnerLayer);
  -[ASVInlinePreview updateLayout](self, "updateLayout");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_showErrorLayer, CFSTR("ASVConnectionInterrupted"), 0);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v3 = _asvLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D93A7000, v3, OS_LOG_TYPE_INFO, "#Inline: dealloc: invalidating _animationUpdateTimer", buf, 2u);
  }
  -[NSTimer invalidate](self->_animationUpdateTimer, "invalidate");
  -[ASVInlinePreview sendTeardownEvent](self, "sendTeardownEvent");
  --_instanceCount;
  v4.receiver = self;
  v4.super_class = (Class)ASVInlinePreview;
  -[ASVInlinePreview dealloc](&v4, sel_dealloc);
}

+ (id)getService
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  +[ASVInlinePreviewFactory shared](ASVInlinePreviewFactory, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedInlineService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[ASVInlinePreviewFactory shared](ASVInlinePreviewFactory, "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedInlineService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v6 = _asvLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D93A7000, v6, OS_LOG_TYPE_INFO, "#Inline: Extension not launched", v8, 2u);
    }
    v5 = 0;
  }
  return v5;
}

- (void)sendTeardownEvent
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  +[ASVInlinePreview getService](ASVInlinePreview, "getService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ASVInlinePreview uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "teardownInlinePreviewWithUUID:completion:", v4, &__block_literal_global_2);

  }
  else
  {
    v5 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v5 = _asvLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D93A7000, v5, OS_LOG_TYPE_INFO, "#Inline: Couldn't get service", v6, 2u);
    }
  }

}

void __46__ASVInlinePreview_Private__sendTeardownEvent__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v3 = _asvLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D93A7000, v3, OS_LOG_TYPE_INFO, "#Inline: Successfully teardown %@", (uint8_t *)&v4, 0xCu);
  }

}

+ (int)instanceCount
{
  return _instanceCount;
}

+ (void)remoteInstanceCount:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v3 = a3;
  v4 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v4 = _asvLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D93A7000, v4, OS_LOG_TYPE_INFO, "#Inline: Get remoteInstanceCount", buf, 2u);
  }
  +[ASVInlinePreview getService](ASVInlinePreview, "getService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__ASVInlinePreview_Private__remoteInstanceCount___block_invoke;
    v8[3] = &unk_1E9F0C878;
    v9 = v3;
    objc_msgSend(v5, "sendARQLEvent:forUUID:completion:", &unk_1E9F29DD8, v6, v8);

  }
  else
  {
    v7 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v7 = _asvLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D93A7000, v7, OS_LOG_TYPE_INFO, "#Inline: Couldn't get service", buf, 2u);
    }
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

void __49__ASVInlinePreview_Private__remoteInstanceCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1D93A7000, v7, OS_LOG_TYPE_INFO, "#Inline: replyPayload: %@", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("instanceCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v8, "intValue"));
  }
  else
  {
    v10 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v10 = _asvLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D93A7000, v10, OS_LOG_TYPE_ERROR, "#Inline: Couldn't get remoteInstanceCount", (uint8_t *)&v11, 2u);
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0xFFFFFFFFLL);
  }

}

+ (void)debugGetMemoryUsage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a3;
  +[ASVInlinePreview getService](ASVInlinePreview, "getService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__ASVInlinePreview_Private__debugGetMemoryUsage___block_invoke;
    v7[3] = &unk_1E9F0C878;
    v8 = v3;
    objc_msgSend(v4, "sendARQLEvent:forUUID:completion:", &unk_1E9F29E00, v5, v7);

  }
  else
  {
    v6 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v6 = _asvLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D93A7000, v6, OS_LOG_TYPE_INFO, "#Inline: Couldn't get service", buf, 2u);
    }
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
  }

}

void __49__ASVInlinePreview_Private__debugGetMemoryUsage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("processMemoryLimit"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("currentMemoryFootprint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v5, "integerValue"), objc_msgSend(v4, "integerValue"));
}

- (void)updateLayout
{
  -[ASVInlinePreview centerLayerInParent:](self, "centerLayerInParent:", self->_spinnerLayer);
  -[ASVInlinePreview centerLayerInParent:](self, "centerLayerInParent:", self->_errorLayer);
}

- (void)centerLayerInParent:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bounds");
    v6 = v5;
    objc_msgSend(v15, "bounds");
    v8 = (v6 - v7) * 0.5;
    objc_msgSend(v4, "bounds");
    v10 = v9;
    objc_msgSend(v15, "bounds");
    v12 = (v10 - v11) * 0.5;
    objc_msgSend(v15, "bounds");
    v14 = v13;
    objc_msgSend(v15, "bounds");
    objc_msgSend(v15, "setFrame:", v8, v12, v14);
  }

}

- (void)showErrorLayer
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  v3 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v3 = _asvLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D93A7000, v3, OS_LOG_TYPE_INFO, "#Inline: showErrorLayer called", buf, 2u);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__ASVInlinePreview_Private__showErrorLayer__block_invoke;
  v4[3] = &unk_1E9F0C8A0;
  v4[4] = self;
  ASVRunInMainThread(v4);
}

uint64_t __43__ASVInlinePreview_Private__showErrorLayer__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "stopAnimating");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setHidden:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "updateLayout");
}

- (BOOL)hasError
{
  return !-[CALayer isHidden](self->_errorLayer, "isHidden");
}

- (id)_createErrorLayer
{
  void *v2;
  id v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setName:", CFSTR("CircleMask"));
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(v3, "CGColor"));

  objc_msgSend(v2, "setFrame:", 0.0, 0.0, 60.0, 60.0);
  objc_msgSend(v2, "bounds");
  objc_msgSend(v2, "setCornerRadius:", v4 * 0.5);
  v5 = objc_alloc_init(MEMORY[0x1E0D16C08]);
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 60.0, 60.0);
  objc_msgSend(v5, "setName:", CFSTR("CircleMaterial"));
  objc_msgSend(v5, "setRecipe:", *MEMORY[0x1E0D16B78]);
  objc_msgSend(v5, "setWeighting:", 1.0);
  objc_msgSend(v5, "setMask:", v2);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 22.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("arkit.badge.xmark"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;
  v12 = objc_retainAutorelease(v7);
  objc_msgSend(v12, "CGImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "CGColor");

  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setContentsGravity:", *MEMORY[0x1E0CD2F90]);
  objc_msgSend(v15, "setName:", CFSTR("IconMask"));
  objc_msgSend(v15, "setContents:", v13);
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, v9, v11);
  v16 = objc_alloc_init(MEMORY[0x1E0D16C08]);
  objc_msgSend(v16, "setFrame:", (60.0 - v9) * 0.5 + 2.5, (60.0 - v11) * 0.5, v9, v11);
  objc_msgSend(v16, "setName:", CFSTR("IconMaterial"));
  objc_msgSend(v16, "setRecipe:", *MEMORY[0x1E0D16B80]);
  objc_msgSend(v16, "setWeighting:", 1.0);
  objc_msgSend(v16, "setMask:", v15);
  objc_msgSend(v5, "addSublayer:", v16);

  return v5;
}

void __46__ASVInlinePreview_Private__setEnableShadows___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(unsigned __int8 *)(a1 + 32);
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_1D93A7000, v7, OS_LOG_TYPE_INFO, "#Inline: setEnableShadows: %d", (uint8_t *)v10, 8u);
  }
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inlinePreview:setEnableShadows:", v9, *(unsigned __int8 *)(a1 + 32));

}

- (void)setIsPlaying:(BOOL)a3 reply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ASVInlinePreview_Private__setIsPlaying_reply___block_invoke;
  v8[3] = &unk_1E9F0C910;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ASVInlinePreview getSharedInlineServiceFailable:](self, "getSharedInlineServiceFailable:", v8);

}

void __48__ASVInlinePreview_Private__setIsPlaying_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    v20 = v8;
    _os_log_impl(&dword_1D93A7000, v7, OS_LOG_TYPE_INFO, "#Inline: setIsPlaying: %d", buf, 8u);
  }
  v17[1] = CFSTR("isPlaying");
  v18[0] = CFSTR("isPlaying");
  v17[0] = CFSTR("request");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__ASVInlinePreview_Private__setIsPlaying_reply___block_invoke_58;
  v14[3] = &unk_1E9F0C8E8;
  v12 = *(id *)(a1 + 40);
  v15 = v10;
  v16 = v12;
  v14[4] = *(_QWORD *)(a1 + 32);
  v13 = v10;
  objc_msgSend(v5, "sendARQLEvent:forUUID:completion:", v13, v11, v14);

}

void __48__ASVInlinePreview_Private__setIsPlaying_reply___block_invoke_58(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("error"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v4 = _asvLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1D93A7000, v4, OS_LOG_TYPE_ERROR, "#Inline: Unable to setIsPlaying. Error: %@", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(_QWORD, uint64_t, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "isPlaying"), v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "updateRuntimeStateFrom:", *(_QWORD *)(a1 + 40));
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "isPlaying"), 0);
  }

}

void __42__ASVInlinePreview_Private__setIsLooping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(unsigned __int8 *)(a1 + 32);
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_1D93A7000, v7, OS_LOG_TYPE_INFO, "#Inline: setIsLooping: %d", (uint8_t *)v10, 8u);
  }
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inlinePreview:setIsLooping:", v9, *(unsigned __int8 *)(a1 + 32));

}

void __40__ASVInlinePreview_Private__setIsMuted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(unsigned __int8 *)(a1 + 32);
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_1D93A7000, v7, OS_LOG_TYPE_INFO, "#Inline: setIsMuted: %d", (uint8_t *)v10, 8u);
  }
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inlinePreview:setIsMuted:", v9, *(unsigned __int8 *)(a1 + 32));

}

void __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke_2;
    v6[3] = &unk_1E9F0C988;
    objc_copyWeak(&v7, v4);
    objc_msgSend(WeakRetained, "getSharedInlineServiceFailable:", v6);
    objc_destroyWeak(&v7);
  }

}

void __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke_3;
  v8[3] = &unk_1E9F0C960;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  objc_msgSend(v5, "sendARQLEvent:forUUID:completion:", &unk_1E9F29E28, v7, v8);

  objc_destroyWeak(&v9);
}

void __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke_4;
  v8[3] = &unk_1E9F0C938;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v7 = v5;
  v9 = v7;
  ASVRunInMainThread(v8);

  objc_destroyWeak(&v10);
}

void __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke_4(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[8])
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "updateRuntimeStateFrom:", *(_QWORD *)(a1 + 32));
    v3 = v5[8];
    v4 = objc_msgSend(v5, "isPlaying");
    objc_msgSend(v5, "currentTime");
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
    WeakRetained = v5;
  }

}

void __44__ASVInlinePreview_Private__setCurrentTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inlinePreview:setCurrentTime:", v6, *(double *)(a1 + 32));

}

- (void)_getCameraTransform:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, __n128);
  _QWORD v9[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v5 = _asvLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D93A7000, v5, OS_LOG_TYPE_INFO, "#Inline: _getCameraTransform() called", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AssetViewer.ASVInlinePreview"), 5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVInlinePreview cameraTransformReply](self, "cameraTransformReply");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ASVInlinePreview cameraTransformReply](self, "cameraTransformReply");
    v8 = (void (**)(_QWORD, _QWORD, __n128))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, __n128))v8)[2](v8, v6, (__n128)0);

  }
  -[ASVInlinePreview setCameraTransformReply:](self, "setCameraTransformReply:", v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__ASVInlinePreview_Private___getCameraTransform___block_invoke;
  v9[3] = &unk_1E9F0CA20;
  v9[4] = self;
  -[ASVInlinePreview getSharedInlineServiceFailable:](self, "getSharedInlineServiceFailable:", v9);

}

void __49__ASVInlinePreview_Private___getCameraTransform___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__ASVInlinePreview_Private___getCameraTransform___block_invoke_2;
  v6[3] = &unk_1E9F0C9F8;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "sendARQLEvent:forUUID:completion:", &unk_1E9F29E50, v5, v6);

}

void __49__ASVInlinePreview_Private___getCameraTransform___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D93A7000, v7, OS_LOG_TYPE_INFO, "#Inline: _getCameraTransform() received reply", v8, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "updateRuntimeStateFrom:", v5);

}

- (void)setCameraTransform:(ASVInlinePreview *)self
{
  __int128 v2;
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__ASVInlinePreview_Private__setCameraTransform___block_invoke;
  v3[3] = &__block_descriptor_48_e51_v24__0___ARQLInlineService3__8__ASVInlinePreview_16l;
  v4 = v2;
  -[ASVInlinePreview getSharedInlineServiceFailable:](self, "getSharedInlineServiceFailable:", v3);
}

void __48__ASVInlinePreview_Private__setCameraTransform___block_invoke(float *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = a1[9];
    v9 = a1[8];
    v10 = a1[10];
    v15 = 134218496;
    v16 = v8;
    v17 = 2048;
    v18 = v9;
    v19 = 2048;
    v20 = v10;
    _os_log_impl(&dword_1D93A7000, v7, OS_LOG_TYPE_INFO, "#Inline: setCameraYaw: %g, %g, %g", (uint8_t *)&v15, 0x20u);
  }
  objc_msgSend(v6, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = a1[8];
  *(float *)&v12 = a1[9];
  *(float *)&v14 = a1[10];
  objc_msgSend(v5, "inlinePreview:setCameraYaw:pitch:scale:options:", v11, &unk_1E9F29E78, v12, v13, v14);

}

- (void)updateRuntimeStateFrom:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  __int128 v16;
  int v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, __n128);
  int v20;
  __int128 v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "objectForKey:", CFSTR("duration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ASVInlinePreview willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
    objc_msgSend(v4, "doubleValue");
    self->_duration = v5;
    -[ASVInlinePreview didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"));
  }
  objc_msgSend(v22, "objectForKey:", CFSTR("isPlaying"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ASVInlinePreview willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isPlaying"));
    self->_isPlaying = objc_msgSend(v6, "BOOLValue");
    -[ASVInlinePreview didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isPlaying"));
  }
  objc_msgSend(v22, "objectForKey:", CFSTR("hasAudio"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ASVInlinePreview willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hasAudio"));
    self->_hasAudio = objc_msgSend(v7, "BOOLValue");
    -[ASVInlinePreview didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hasAudio"));
  }
  objc_msgSend(v22, "objectForKey:", CFSTR("currentTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ASVInlinePreview willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentTime"));
    objc_msgSend(v8, "doubleValue");
    self->_currentTime = v9;
    -[ASVInlinePreview didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentTime"));
  }
  objc_msgSend(v22, "objectForKey:", CFSTR("yaw"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", CFSTR("pitch"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", CFSTR("scale"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v10)
  {
    if (v11)
    {
      if (v12)
      {
        objc_msgSend(v11, "floatValue");
        *(_QWORD *)&v21 = v14;
        objc_msgSend(v10, "floatValue");
        v20 = v15;
        objc_msgSend(v13, "floatValue");
        v16 = v21;
        DWORD1(v16) = v20;
        DWORD2(v16) = v17;
        *(_OWORD *)self->_cameraTransform = v16;
        -[ASVInlinePreview cameraTransformReply](self, "cameraTransformReply");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          -[ASVInlinePreview cameraTransformReply](self, "cameraTransformReply");
          v19 = (void (**)(_QWORD, _QWORD, __n128))objc_claimAutoreleasedReturnValue();
          v19[2](v19, 0, *(__n128 *)self->_cameraTransform);

          -[ASVInlinePreview setCameraTransformReply:](self, "setCameraTransformReply:", 0);
        }
      }
    }
  }

}

- (ASVInlinePreview)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  ASVInlinePreview *v7;
  uint64_t v8;
  NSUUID *uuid;
  ASVInlinePreview *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)ASVInlinePreview;
  v7 = -[ASVInlinePreview init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_opt_new();
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;

    v7->_resizeLayerImmediately = 1;
    -[ASVInlinePreview commonInitWithFrame:](v7, "commonInitWithFrame:", x, y, width, height);
    v10 = v7;
  }

  return v7;
}

- (void)getSharedInlineServiceFailable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  +[ASVInlinePreviewFactory shared](ASVInlinePreviewFactory, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ASVInlinePreview_getSharedInlineServiceFailable___block_invoke;
  v8[3] = &unk_1E9F0D1F0;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v7, "getSharedInlineServiceWithCompletionHandler:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __51__ASVInlinePreview_getSharedInlineServiceFailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = _asvLogHandle;
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        v5 = _asvLogHandle;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_1D93A7000, v5, OS_LOG_TYPE_ERROR, "#Inline: getSharedInlineServiceFailable: Unable to get shared service, error: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "sharedInlineService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, WeakRetained);

    }
  }

}

- (void)setupRemoteConnectionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19[5];
  id location;

  v4 = a3;
  +[ASVInlinePreviewFactory shared](ASVInlinePreviewFactory, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[CALayer bounds](self->_layer, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__ASVInlinePreview_setupRemoteConnectionWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E9F0D268;
  objc_copyWeak(v19, &location);
  v14 = v4;
  v18 = v14;
  v19[1] = v7;
  v19[2] = v9;
  v19[3] = v11;
  v19[4] = v13;
  v15 = v5;
  v17 = v15;
  objc_msgSend(v15, "getSharedInlineServiceWithCompletionHandler:", v16);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

void __63__ASVInlinePreview_setupRemoteConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;
  CGRect v23;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = _asvLogHandle;
  if (v3)
  {
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v5 = _asvLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v3;
      _os_log_impl(&dword_1D93A7000, v5, OS_LOG_TYPE_ERROR, "#Inline: Unable to getSharedInlineServiceWithCompletionHandler, error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(WeakRetained, "showErrorLayer");
  }
  else
  {
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v5 = _asvLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(double *)(a1 + 56);
      v7 = *(double *)(a1 + 64);
      v8 = *(double *)(a1 + 72);
      v9 = *(double *)(a1 + 80);
      v10 = v5;
      v23.origin.x = v6;
      v23.origin.y = v7;
      v23.size.width = v8;
      v23.size.height = v9;
      NSStringFromCGRect(v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl(&dword_1D93A7000, v10, OS_LOG_TYPE_INFO, "#Inline: setupRemoteConnectionWithCompletionHandler, frame: %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "sharedInlineService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = WeakRetained[1];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__ASVInlinePreview_setupRemoteConnectionWithCompletionHandler___block_invoke_2;
    v15[3] = &unk_1E9F0D240;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    v16 = *(id *)(a1 + 40);
    v14 = *(_OWORD *)(a1 + 72);
    v18 = *(_OWORD *)(a1 + 56);
    v19 = v14;
    objc_msgSend(v12, "createInlinePreviewWithUUID:initialBounds:contextIdReply:", v13, v15, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

    objc_destroyWeak(&v17);
  }

}

void __63__ASVInlinePreview_setupRemoteConnectionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  int v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8)
  {
    v10 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v10 = _asvLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_impl(&dword_1D93A7000, v10, OS_LOG_TYPE_ERROR, "#Inline: Unable to create remote context, error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(WeakRetained, "showErrorLayer");
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__ASVInlinePreview_setupRemoteConnectionWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E9F0D218;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    v17 = a3;
    v11 = *(_OWORD *)(a1 + 64);
    v15 = *(_OWORD *)(a1 + 48);
    v16 = v11;
    v13 = *(id *)(a1 + 32);
    ASVRunInMainThread(v12);

    objc_destroyWeak(&v14);
  }

}

void __63__ASVInlinePreview_setupRemoteConnectionWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;
  CGRect v12;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CD27B0], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContextId:", *(unsigned int *)(a1 + 80));
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v4 = _asvLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    objc_msgSend(v3, "frame");
    NSStringFromCGRect(v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1D93A7000, v5, OS_LOG_TYPE_INFO, "#Inline: layerHost.frame: %@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(v3, "setAllowsHitTesting:", 0);
  v7 = (void *)WeakRetained[2];
  WeakRetained[2] = v3;
  v8 = v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  ASVInlinePreview *v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[CAActivityIndicatorLayer startAnimating](self->_spinnerLayer, "startAnimating");
  +[ASVInlinePreviewFactory shared](ASVInlinePreviewFactory, "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke;
  v12[3] = &unk_1E9F0D330;
  objc_copyWeak(&v17, &location);
  v9 = v7;
  v16 = v9;
  v10 = v6;
  v13 = v10;
  v11 = v8;
  v14 = v11;
  v15 = self;
  objc_msgSend(v11, "getSharedInlineServiceWithCompletionHandler:", v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v3)
  {
    v5 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v5 = _asvLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_impl(&dword_1D93A7000, v5, OS_LOG_TYPE_ERROR, "#Inline: Unable to getSharedInlineServiceWithCompletionHandler, error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(WeakRetained, "showErrorLayer");
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CD3240], "wrapperWithURL:readonly:error:", v6, 1, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    v9 = _asvLogHandle;
    if (v8)
    {
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        v9 = _asvLogHandle;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v8;
        _os_log_impl(&dword_1D93A7000, v9, OS_LOG_TYPE_ERROR, "#Inline: Unable to extend file sandbox to extension, error: %@", buf, 0xCu);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      objc_msgSend(WeakRetained, "showErrorLayer");
    }
    else
    {
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        v9 = _asvLogHandle;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D93A7000, v9, OS_LOG_TYPE_INFO, "#Inline: calling prepareInlinePreviewWithScopedURLWrapperAttributes", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 40), "sharedInlineService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_8;
      v12[3] = &unk_1E9F0D308;
      objc_copyWeak(&v14, (id *)(a1 + 64));
      v13 = *(id *)(a1 + 56);
      objc_msgSend(v10, "prepareInlinePreviewWithScopedURLWrapperAttributes:forUUID:completion:", v7, v11, v12);

      objc_destroyWeak(&v14);
    }

  }
}

void __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_2;
  v12[3] = &unk_1E9F0D2E0;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v10 = v9;
  v13 = v10;
  v15 = *(id *)(a1 + 32);
  v11 = v8;
  v14 = v11;
  ASVRunInMainThread(v12);

  objc_destroyWeak(&v16);
}

void __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v5 = _asvLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl(&dword_1D93A7000, v5, OS_LOG_TYPE_ERROR, "#Inline: Unable to load file for inline preview, error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(v4, "showErrorLayer");
  }
  else
  {
    objc_msgSend(WeakRetained, "spinnerLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopAnimating");

    objc_msgSend(v4[5], "addSublayer:", v4[2]);
    objc_msgSend(v4, "updateLayout");
    objc_msgSend(v4, "updateRuntimeStateFrom:", *(_QWORD *)(a1 + 40));
    *((_BYTE *)v4 + 32) = 0;
    objc_msgSend(v4[5], "bounds");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v4[2], "bounds");
    if (v9 != v13 || v11 != v12)
    {
      v15 = _asvLogHandle;
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        v15 = _asvLogHandle;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D93A7000, v15, OS_LOG_TYPE_INFO, "#Inline: Frame was changed during loading - resizing...", buf, 2u);
      }
      objc_msgSend(v4[5], "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_9;
      v24[3] = &unk_1E9F0D2B8;
      objc_copyWeak(&v25, v2);
      objc_msgSend(v4, "updateFrame:completionHandler:", v24, v17, v19, v21, v23);
      objc_destroyWeak(&v25);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a2;
  v6 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_2_10;
  v7[3] = &unk_1E9F0D290;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  ASVRunInMainThread(v7);
  objc_msgSend(v5, "invalidate");
  objc_destroyWeak(&v8);

}

void __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_2_10(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[5], "bounds");
  objc_msgSend(WeakRetained, "setFrameWithinFencedTransaction:");

}

- (void)createFullscreenInstanceWithInitialFrame:(CGRect)a3 previewOptions:(id)a4 completionHandler:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  NSUUID *uuid;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20[2];
  id location;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  if (self->_fullscreenService)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASVInlinePreview_iOS.m"), 187, CFSTR("A fullscreen instance already exists"));

  }
  +[ASVInlinePreviewFactory shared](ASVInlinePreviewFactory, "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  uuid = self->_uuid;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__ASVInlinePreview_createFullscreenInstanceWithInitialFrame_previewOptions_completionHandler___block_invoke;
  v18[3] = &unk_1E9F0D380;
  objc_copyWeak(v20, &location);
  v16 = v13;
  v19 = v16;
  v20[1] = (id)a2;
  objc_msgSend(v14, "createFullscreenInstanceWithUUID:initialFrame:previewOptions:completionHandler:", uuid, v12, v18, x, y, width, height);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

}

void __94__ASVInlinePreview_createFullscreenInstanceWithInitialFrame_previewOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25[2];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __94__ASVInlinePreview_createFullscreenInstanceWithInitialFrame_previewOptions_completionHandler___block_invoke_2;
  v19[3] = &unk_1E9F0D358;
  objc_copyWeak(v25, (id *)(a1 + 40));
  v13 = v12;
  v20 = v13;
  v14 = v9;
  v21 = v14;
  v15 = v10;
  v22 = v15;
  v16 = *(id *)(a1 + 32);
  v17 = *(void **)(a1 + 48);
  v24 = v16;
  v25[1] = v17;
  v18 = v11;
  v23 = v18;
  ASVRunInMainThread(v19);

  objc_destroyWeak(v25);
}

void __94__ASVInlinePreview_createFullscreenInstanceWithInitialFrame_previewOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  ASVInlineHostViewController *v5;
  void *v6;
  void *v7;
  ASVInlineHostViewController *v8;
  void (*v9)(void);
  NSObject *v10;
  void *v11;
  int v12;
  ASVInlineHostViewController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (!*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40) && (v6 = *(void **)(a1 + 48)) != 0)
  {
    if (WeakRetained[3])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), v3, CFSTR("ASVInlinePreview_iOS.m"), 201, CFSTR("A fullscreen instance already exists"));

      v6 = *(void **)(a1 + 48);
    }
    objc_storeStrong(v3 + 3, v6);
    objc_msgSend(MEMORY[0x1E0CD2778], "handleFromXPCRepresentation:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = -[ASVInlineHostViewController initWithUUID:child:fullscreenInlineService:canonicalWebPageURL:]([ASVInlineHostViewController alloc], "initWithUUID:child:fullscreenInlineService:canonicalWebPageURL:", v3[1], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3[6]);
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AssetViewer.ASVInlinePreview"), 3, 0);
      v8 = (ASVInlineHostViewController *)objc_claimAutoreleasedReturnValue();
      v10 = _asvLogHandle;
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        v10 = _asvLogHandle;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_1D93A7000, v10, OS_LOG_TYPE_ERROR, "#Inline: Didn't receive fence handler when creating fullscreen instance, error: %@", (uint8_t *)&v12, 0xCu);
      }
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    v9();

  }
  else
  {
    v4 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v4 = _asvLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(ASVInlineHostViewController **)(a1 + 32);
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1D93A7000, v4, OS_LOG_TYPE_ERROR, "#Inline: Unable to create fullscreen instance, error: %@", (uint8_t *)&v12, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (void)observeDismissFullscreenWithCompletionHandler:(id)a3
{
  id v5;
  ARQLInlineService2 *fullscreenService;
  NSUUID *uuid;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id location;

  v5 = a3;
  if (!self->_fullscreenService)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASVInlinePreview_iOS.m"), 221, CFSTR("_fullscreenService should not be nil before observing dismiss fullscreen"));

  }
  objc_initWeak(&location, self);
  fullscreenService = self->_fullscreenService;
  uuid = self->_uuid;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__ASVInlinePreview_observeDismissFullscreenWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E9F0D3A8;
  objc_copyWeak(v12, &location);
  v8 = v5;
  v11 = v8;
  v12[1] = (id)a2;
  -[ARQLInlineService2 observeReturnedToInlineForUUID:fenceHandleCompletion:](fullscreenService, "observeReturnedToInlineForUUID:fenceHandleCompletion:", uuid, v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

void __66__ASVInlinePreview_observeDismissFullscreenWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  _QWORD *WeakRetained;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CD2778], "handleFromXPCRepresentation:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v10 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v10 = _asvLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1D93A7000, v10, OS_LOG_TYPE_INFO, "#Inline: return to inline payload: %@", (uint8_t *)&v14, 0xCu);
    }
    v11 = (void *)WeakRetained[3];
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), WeakRetained, CFSTR("ASVInlinePreview_iOS.m"), 238, CFSTR("_fullscreenService should not be nil before setting it nil"));

      v11 = (void *)WeakRetained[3];
    }
    WeakRetained[3] = 0;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AssetViewer.ASVInlinePreview"), 3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v12 = _asvLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1D93A7000, v12, OS_LOG_TYPE_ERROR, "#Inline: No CAFenceHandle when returning to inline, error: %@", (uint8_t *)&v14, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)updateFrame:(CGRect)a3 completionHandler:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  ARQLInlineService2 *fullscreenService;
  double v15;
  double v16;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSUUID *uuid;
  id v26;
  _QWORD v27[4];
  id v28;
  BOOL v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v10 = _asvLogHandle;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    NSStringFromCGRect(v35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer bounds](self->_layer, "bounds");
    NSStringFromCGRect(v36);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v12;
    v32 = 2112;
    v33 = v13;
    _os_log_impl(&dword_1D93A7000, v11, OS_LOG_TYPE_INFO, "#Inline: updateFrame called - newFrame: %@, oldFrame: %@", buf, 0x16u);

  }
  fullscreenService = self->_fullscreenService;
  if (!fullscreenService)
  {
    -[CALayerHost bounds](self->_layerHost, "bounds");
    if (width == v16 && height == v15)
    {
      v18 = _asvLogHandle;
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        v18 = _asvLogHandle;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = v18;
        v37.origin.x = x;
        v37.origin.y = y;
        v37.size.width = width;
        v37.size.height = height;
        NSStringFromCGRect(v37);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CALayer bounds](self->_layer, "bounds");
        NSStringFromCGRect(v38);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v20;
        v32 = 2112;
        v33 = v21;
        _os_log_impl(&dword_1D93A7000, v19, OS_LOG_TYPE_INFO, "#Inline: Trying to updateFrame while in inline, but new bounds size is the same as current. newFrame: %@, oldFrame: %@", buf, 0x16u);

      }
    }
  }
  if (self->_resizeLayerImmediately)
  {
    v22 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v22 = _asvLogHandle;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D93A7000, v22, OS_LOG_TYPE_INFO, "#Inline: Updating bounds immediately since showing error or spinner", buf, 2u);
    }
    -[ASVInlinePreview setFrameWithinFencedTransaction:](self, "setFrameWithinFencedTransaction:", x, y, width, height);
  }
  +[ASVInlinePreviewFactory shared](ASVInlinePreviewFactory, "shared");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sharedInlineService");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __50__ASVInlinePreview_updateFrame_completionHandler___block_invoke;
  v27[3] = &unk_1E9F0D3D0;
  v28 = v9;
  v29 = fullscreenService == 0;
  v26 = v9;
  objc_msgSend(v24, "updateBounds:forUUID:fenceHandleCompletion:", uuid, v27, x, y, width, height);

}

void __50__ASVInlinePreview_updateFrame_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v10 = _asvLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1D93A7000, v10, OS_LOG_TYPE_ERROR, "#Inline: Error while updating frame, error: %@", (uint8_t *)&v14, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2778], "handleFromXPCRepresentation:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || !*(_BYTE *)(a1 + 40))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AssetViewer.ASVInlinePreview"), 3, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = _asvLogHandle;
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        v13 = _asvLogHandle;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412290;
        v15 = v12;
        _os_log_impl(&dword_1D93A7000, v13, OS_LOG_TYPE_ERROR, "#Inline: No CAFenceHandle when updating frame, error: %@", (uint8_t *)&v14, 0xCu);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

- (void)setFrameWithinFencedTransaction:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v8 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v8 = _asvLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    NSStringFromCGRect(v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_1D93A7000, v9, OS_LOG_TYPE_INFO, "#Inline: Setting frame %@ to root and child layers", (uint8_t *)&v11, 0xCu);

  }
  -[CALayer setFrame:](self->_layer, "setFrame:", x, y, width, height);
  -[CALayer bounds](self->_layer, "bounds");
  -[CALayerHost setFrame:](self->_layerHost, "setFrame:");
  -[ASVInlinePreview updateLayout](self, "updateLayout");
}

- (id)inlineTouchesFromUITouches:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v13 = objc_alloc(MEMORY[0x1E0CD3238]);
        v14 = (void *)objc_msgSend(v13, "initWithUITouch:", v12, (_QWORD)v17);
        objc_msgSend(v6, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASVInlinePreview_iOS.m"), 303, CFSTR("arqlTouches shound not return zero"));

  }
  return v6;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  ASVInlinePreview *v13;

  v5 = a3;
  +[ASVInlinePreviewFactory shared](ASVInlinePreviewFactory, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVInlinePreview inlineTouchesFromUITouches:](self, "inlineTouchesFromUITouches:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__ASVInlinePreview_touchesBegan_withEvent___block_invoke;
  v10[3] = &unk_1E9F0D3F8;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v9, "getSharedInlineServiceWithCompletionHandler:", v10);

}

void __43__ASVInlinePreview_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sharedInlineService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchesBegan:forUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  ASVInlinePreview *v13;

  v5 = a3;
  +[ASVInlinePreviewFactory shared](ASVInlinePreviewFactory, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVInlinePreview inlineTouchesFromUITouches:](self, "inlineTouchesFromUITouches:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__ASVInlinePreview_touchesMoved_withEvent___block_invoke;
  v10[3] = &unk_1E9F0D3F8;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v9, "getSharedInlineServiceWithCompletionHandler:", v10);

}

void __43__ASVInlinePreview_touchesMoved_withEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sharedInlineService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchesMoved:forUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  id v21;
  ASVInlinePreview *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[ASVInlinePreviewFactory shared](ASVInlinePreviewFactory, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVInlinePreview inlineTouchesFromUITouches:](self, "inlineTouchesFromUITouches:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __43__ASVInlinePreview_touchesEnded_withEvent___block_invoke;
  v19[3] = &unk_1E9F0D3F8;
  v8 = v6;
  v20 = v8;
  v9 = v7;
  v21 = v9;
  v22 = self;
  objc_msgSend(v8, "getSharedInlineServiceWithCompletionHandler:", v19);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(MEMORY[0x1E0CD3238], "removeUIDForUITouch:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

void __43__ASVInlinePreview_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sharedInlineService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchesEnded:forUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  ASVInlinePreview *v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[ASVInlinePreviewFactory shared](ASVInlinePreviewFactory, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__ASVInlinePreview_touchesCancelled_withEvent___block_invoke;
  v18[3] = &unk_1E9F0D3F8;
  v7 = v6;
  v19 = v7;
  v20 = self;
  v8 = v5;
  v21 = v8;
  objc_msgSend(v7, "getSharedInlineServiceWithCompletionHandler:", v18);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(MEMORY[0x1E0CD3238], "removeUIDForUITouch:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

void __47__ASVInlinePreview_touchesCancelled_withEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "sharedInlineService");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "inlineTouchesFromUITouches:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "touchesCancelled:forUUID:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));

}

- (void)getCameraTransform:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  v5 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v5 = _asvLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D93A7000, v5, OS_LOG_TYPE_INFO, "#Inline: getCameraTransform() called", v6, 2u);
  }
  -[ASVInlinePreview _getCameraTransform:](self, "_getCameraTransform:", v4);

}

+ (void)_kill:(int)a3
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x1E0C80C00];
  v4 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v4 = _asvLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_1D93A7000, v4, OS_LOG_TYPE_INFO, "#Inline: Killing inline preview service, signal: %d", (uint8_t *)v7, 8u);
  }
  +[ASVInlinePreviewFactory shared](ASVInlinePreviewFactory, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_kill:", v3);

}

- (void)setWantsDebugColors:(BOOL)a3
{
  CALayerHost *layerHost;
  CALayerHost **p_layerHost;
  id v6;
  id v7;
  CALayer **p_layer;
  CALayer *layer;
  id v10;
  void *v11;
  id v12;

  p_layerHost = &self->_layerHost;
  layerHost = self->_layerHost;
  if (a3)
  {
    -[CALayerHost setBorderWidth:](layerHost, "setBorderWidth:", 2.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayerHost setBorderColor:](self->_layerHost, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayerHost setBackgroundColor:](self->_layerHost, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

    layer = self->_layer;
    p_layer = &self->_layer;
    -[CALayer setBorderWidth:](layer, "setBorderWidth:", 2.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBorderColor:](*p_layer, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CALayerHost setBorderWidth:](layerHost, "setBorderWidth:", 0.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    p_layer = (CALayer **)p_layerHost;
  }
  v12 = objc_retainAutorelease(v11);
  -[CALayer setBackgroundColor:](*p_layer, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (CALayer)layer
{
  return self->_layer;
}

- (NSURL)canonicalWebPageURL
{
  return self->_canonicalWebPageURL;
}

- (void)setCanonicalWebPageURL:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalWebPageURL, a3);
}

- (NSString)urlFragment
{
  return self->_urlFragment;
}

- (void)setUrlFragment:(id)a3
{
  objc_storeStrong((id *)&self->_urlFragment, a3);
}

- (BOOL)enableShadows
{
  return self->_enableShadows;
}

- (void)setEnableShadows:(BOOL)a3
{
  self->_enableShadows = a3;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (id)animationObserverBlock
{
  return self->_animationObserverBlock;
}

- (void)setAnimationObserverBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isLooping
{
  return self->_isLooping;
}

- (void)setIsLooping:(BOOL)a3
{
  self->_isLooping = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)hasAudio
{
  return self->_hasAudio;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setIsMuted:(BOOL)a3
{
  self->_isMuted = a3;
}

- (__n128)cameraTransform
{
  return a1[8];
}

- (CAActivityIndicatorLayer)spinnerLayer
{
  return self->_spinnerLayer;
}

- (CALayer)errorLayer
{
  return self->_errorLayer;
}

- (id)cameraTransformReply
{
  return self->_cameraTransformReply;
}

- (void)setCameraTransformReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSTimer)animationUpdateTimer
{
  return self->_animationUpdateTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationUpdateTimer, 0);
  objc_storeStrong(&self->_cameraTransformReply, 0);
  objc_storeStrong((id *)&self->_errorLayer, 0);
  objc_storeStrong((id *)&self->_spinnerLayer, 0);
  objc_storeStrong(&self->_animationObserverBlock, 0);
  objc_storeStrong((id *)&self->_urlFragment, 0);
  objc_storeStrong((id *)&self->_canonicalWebPageURL, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_fullscreenService, 0);
  objc_storeStrong((id *)&self->_layerHost, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
