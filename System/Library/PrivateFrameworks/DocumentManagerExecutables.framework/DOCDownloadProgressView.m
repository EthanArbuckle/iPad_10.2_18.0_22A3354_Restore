@implementation DOCDownloadProgressView

+ (UIColor)defaultProgressColor
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedColorWithTraitCollection:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

+ (UIColor)defaultTrackColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "systemFillColor");
}

- (DOCDownloadProgressView)initWithCoder:(id)a3
{
  DOCDownloadProgressView *v3;
  DOCDownloadProgressView *v4;
  DOCDownloadProgressView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCDownloadProgressView;
  v3 = -[DOCDownloadProgressView initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[DOCDownloadProgressView doc_commonInit](v3, "doc_commonInit");
    v5 = v4;
  }

  return v4;
}

- (DOCDownloadProgressView)initWithFrame:(CGRect)a3
{
  DOCDownloadProgressView *v3;
  DOCDownloadProgressView *v4;
  DOCDownloadProgressView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCDownloadProgressView;
  v3 = -[DOCDownloadProgressView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DOCDownloadProgressView doc_commonInit](v3, "doc_commonInit");
    v5 = v4;
  }

  return v4;
}

+ (UIColor)defaultTrackColorOnSelectedBackground
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedColorWithTraitCollection:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (void)doc_commonInit
{
  DOCGhostRingView *v3;
  DOCGhostRingView *v4;
  DOCGhostRingView *ghostRingView;
  DOCIndeterminateProgressRingView *v6;
  DOCIndeterminateProgressRingView *v7;
  DOCIndeterminateProgressRingView *indeterminateProgressRingView;
  DOCDeterminateProgressRingView *v9;
  DOCDeterminateProgressRingView *v10;
  DOCDeterminateProgressRingView *determinateProgressRingView;
  void *v12;
  NSOperationQueue *v13;
  NSOperationQueue *pendingAnimationQueue;
  UITapGestureRecognizer *v15;
  UITapGestureRecognizer *tapGestureRecognizer;
  id v17;

  v3 = [DOCGhostRingView alloc];
  -[DOCDownloadProgressView bounds](self, "bounds");
  v4 = -[DOCGhostRingView initWithFrame:](v3, "initWithFrame:");
  ghostRingView = self->_ghostRingView;
  self->_ghostRingView = v4;

  v6 = [DOCIndeterminateProgressRingView alloc];
  -[DOCDownloadProgressView bounds](self, "bounds");
  v7 = -[DOCIndeterminateProgressRingView initWithFrame:](v6, "initWithFrame:");
  indeterminateProgressRingView = self->_indeterminateProgressRingView;
  self->_indeterminateProgressRingView = v7;

  v9 = [DOCDeterminateProgressRingView alloc];
  -[DOCDownloadProgressView bounds](self, "bounds");
  v10 = -[DOCDeterminateProgressRingView initWithFrame:](v9, "initWithFrame:");
  determinateProgressRingView = self->_determinateProgressRingView;
  self->_determinateProgressRingView = v10;

  -[DOCGhostRingView setAlpha:](self->_ghostRingView, "setAlpha:", 0.0);
  -[DOCIndeterminateProgressRingView setAlpha:](self->_indeterminateProgressRingView, "setAlpha:", 0.0);
  -[DOCDeterminateProgressRingView setAlpha:](self->_determinateProgressRingView, "setAlpha:", 0.0);
  objc_msgSend((id)objc_opt_class(), "defaultProgressColor");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultTrackColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCGhostRingView setTintColor:](self->_ghostRingView, "setTintColor:", v12);

  -[DOCIndeterminateProgressRingView setTintColor:](self->_indeterminateProgressRingView, "setTintColor:", v17);
  -[DOCDeterminateProgressRingView setTintColor:](self->_determinateProgressRingView, "setTintColor:", v17);
  -[DOCDownloadProgressView installSubviews](self, "installSubviews");
  v13 = (NSOperationQueue *)objc_opt_new();
  pendingAnimationQueue = self->_pendingAnimationQueue;
  self->_pendingAnimationQueue = v13;

  -[NSOperationQueue setMaxConcurrentOperationCount:](self->_pendingAnimationQueue, "setMaxConcurrentOperationCount:", 1);
  -[DOCDownloadProgressView _updateStatusPropertiesAnimated:completion:](self, "_updateStatusPropertiesAnimated:completion:", 0, 0);
  v15 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleTap_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v15;

  -[DOCDownloadProgressView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
}

- (void)installSubviews
{
  DOCDownloadProgressView *v2;
  DOCDownloadProgressView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  DOCDownloadProgressView *v8;
  void *v9;
  _QWORD v10[4];
  DOCDownloadProgressView *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v2 = self;
  -[DOCDownloadProgressView setAutoresizesSubviews:](v2, "setAutoresizesSubviews:", 1);
  v3 = v2;
  if (DOCVibrancyFeatureEnabled())
  {
    v4 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[DOCDownloadProgressView bounds](v2, "bounds");
    v5 = (void *)objc_msgSend(v4, "initWithFrame:");
    objc_msgSend(v5, "asPrimaryStrokeViewDecoratorEmbeddable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v6)
    {
      v3 = v5;

      objc_msgSend(v6, "setAutoresizingMask:", 18);
      -[DOCDownloadProgressView bounds](v2, "bounds");
      objc_msgSend(v6, "setFrame:");
      -[DOCDownloadProgressView addSubview:](v2, "addSubview:", v6);
    }

  }
  v12[0] = v2->_indeterminateProgressRingView;
  v12[1] = v2->_ghostRingView;
  v12[2] = v2->_determinateProgressRingView;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__DOCDownloadProgressView_installSubviews__block_invoke;
  v10[3] = &unk_24E327B18;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(MEMORY[0x24BEBD638], "doc_circleWithInset:", -8.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCDownloadProgressView setHoverStyle:](v2, "setHoverStyle:", v9);

}

void __42__DOCDownloadProgressView_installSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);

}

- (void)dealloc
{
  NSObject **v3;
  NSObject *v4;
  NSProgress *observedProgress;
  NSProgress *v6;
  objc_super v7;
  uint8_t buf[4];
  NSProgress *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_observedProgress && self->_shouldStopObservingProgress)
  {
    v3 = (NSObject **)MEMORY[0x24BE2DFF0];
    v4 = *MEMORY[0x24BE2DFF0];
    if (!*MEMORY[0x24BE2DFF0])
    {
      DOCInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      observedProgress = self->_observedProgress;
      *(_DWORD *)buf = 138543362;
      v9 = observedProgress;
      _os_log_impl(&dword_21EA4C000, v4, OS_LOG_TYPE_DEFAULT, "Progress: [Download Progress View] REMOVE-DEALLOC fractionCompleted observer for: %{public}@", buf, 0xCu);
    }
    -[NSProgress removeObserver:forKeyPath:](self->_observedProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
    -[NSProgress removeObserver:forKeyPath:](self->_observedProgress, "removeObserver:forKeyPath:", self, CFSTR("isIndeterminate"));
    self->_shouldStopObservingProgress = 0;
    v6 = self->_observedProgress;
    self->_observedProgress = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)DOCDownloadProgressView;
  -[DOCDownloadProgressView dealloc](&v7, sel_dealloc);
}

- (void)setActiveStrokeColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_activeStrokeColor, a3);
  v5 = a3;
  -[DOCIndeterminateProgressRingView setTintColor:](self->_indeterminateProgressRingView, "setTintColor:", v5);
  -[DOCDeterminateProgressRingView setTintColor:](self->_determinateProgressRingView, "setTintColor:", v5);

}

- (void)setInactiveStrokeColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_inactiveStrokeColor, a3);
  v5 = a3;
  -[DOCGhostRingView setTintColor:](self->_ghostRingView, "setTintColor:", v5);

}

- (void)_addToPendingAnimationQueue:(id)a3
{
  id v4;
  NSOperationQueue *v5;
  uint64_t v6;
  NSOperationQueue *v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSOperationQueue *pendingAnimationQueue;
  id v18;
  id v19;
  NSOperationQueue *v20;
  _QWORD v21[5];
  NSOperationQueue *v22;
  id v23;
  id v24;
  _QWORD aBlock[5];
  NSOperationQueue *v26;

  v4 = a3;
  v5 = self->_pendingAnimationQueue;
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke;
  aBlock[3] = &unk_24E327B40;
  aBlock[4] = self;
  v7 = v5;
  v26 = v7;
  v8 = _Block_copy(aBlock);
  v9 = (NSObject **)MEMORY[0x24BE2DFF0];
  v10 = *MEMORY[0x24BE2DFF0];
  if (!*MEMORY[0x24BE2DFF0])
  {
    DOCInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DOCDownloadProgressView _addToPendingAnimationQueue:].cold.1((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);
  pendingAnimationQueue = self->_pendingAnimationQueue;
  v21[0] = v6;
  v21[1] = 3221225472;
  v21[2] = __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_22;
  v21[3] = &unk_24E327B68;
  v21[4] = self;
  v22 = v7;
  v23 = v4;
  v24 = v8;
  v18 = v8;
  v19 = v4;
  v20 = v7;
  -[NSOperationQueue addOperationWithBlock:](pendingAnimationQueue, "addOperationWithBlock:", v21);

}

uint64_t __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke(uint64_t a1, char a2)
{
  NSObject **v4;
  NSObject *v5;

  v4 = (NSObject **)MEMORY[0x24BE2DFF0];
  v5 = *MEMORY[0x24BE2DFF0];
  if (!*MEMORY[0x24BE2DFF0])
  {
    DOCInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_cold_1(a1, a2, v5);
  return objc_msgSend(*(id *)(a1 + 40), "setSuspended:", 0);
}

void __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_22(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_2;
  v4[3] = &unk_24E327B68;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "addOperationWithBlock:", v4);

}

uint64_t __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_2(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = (NSObject **)MEMORY[0x24BE2DFF0];
  v3 = *MEMORY[0x24BE2DFF0];
  if (!*MEMORY[0x24BE2DFF0])
  {
    DOCInitLogging();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_2_cold_2(a1, v3, v4, v5, v6, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 40), "setSuspended:", 1);
  v10 = *v2;
  if (!*v2)
  {
    DOCInitLogging();
    v10 = *v2;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_2_cold_1(a1, v10, v11, v12, v13, v14, v15, v16);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_updateStatusPropertiesAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[5];

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  if (self->_progress == 0.0)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke;
    aBlock[3] = &unk_24E3279E8;
    aBlock[4] = self;
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    v9 = v8;
    if (v4)
    {
      v10 = (void *)MEMORY[0x24BEBDB00];
      v19[0] = v7;
      v19[1] = 3221225472;
      v19[2] = __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_2;
      v19[3] = &unk_24E327B90;
      v20 = v6;
      objc_msgSend(v10, "animateWithDuration:animations:completion:", v9, v19, 0.35);

    }
    else
    {
      v8[2](v8);
      if (v6)
        (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_3;
    v18[3] = &unk_24E3279E8;
    v18[4] = self;
    v9 = (void (**)(_QWORD))_Block_copy(v18);
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_4;
    v17[3] = &unk_24E3279E8;
    v17[4] = self;
    v11 = _Block_copy(v17);
    v12 = v11;
    if (v4)
    {
      v13 = (void *)MEMORY[0x24BEBDB00];
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_5;
      v14[3] = &unk_24E327BB8;
      v15 = v9;
      v16 = v6;
      objc_msgSend(v13, "animateWithDuration:animations:completion:", v12, v14, 0.35);

    }
    else
    {
      (*((void (**)(void *))v11 + 2))(v11);
      v9[2](v9);
      if (v6)
        (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }

  }
}

void __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "indeterminateProgressRingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "ghostRingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "determinateProgressRingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

}

uint64_t __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "determinateProgressRingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgress:", v3);

}

void __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "indeterminateProgressRingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "ghostRingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "determinateProgressRingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

void __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_5(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_6;
  v3[3] = &unk_24E327B90;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v1, "animateWithDuration:delay:options:animations:completion:", 134, v2, v3, 0.4, 0.0);

}

uint64_t __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  double progress;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD, _QWORD);
  _QWORD aBlock[6];
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  progress = self->_progress;
  if (progress == a3)
  {
    if (v8)
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
  else
  {
    self->_progress = a3;
    if (a3 == 0.0 || progress == 0.0)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __60__DOCDownloadProgressView__setProgress_animated_completion___block_invoke;
      v18[3] = &unk_24E327B90;
      v19 = v8;
      -[DOCDownloadProgressView _updateStatusPropertiesAnimated:completion:](self, "_updateStatusPropertiesAnimated:completion:", v5, v18);

    }
    else
    {
      v11 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __60__DOCDownloadProgressView__setProgress_animated_completion___block_invoke_2;
      aBlock[3] = &unk_24E3279C0;
      aBlock[4] = self;
      *(double *)&aBlock[5] = a3;
      v12 = _Block_copy(aBlock);
      v13 = v12;
      if (v5)
      {
        v14 = (void *)MEMORY[0x24BEBDB00];
        v15[0] = v11;
        v15[1] = 3221225472;
        v15[2] = __60__DOCDownloadProgressView__setProgress_animated_completion___block_invoke_3;
        v15[3] = &unk_24E327B90;
        v16 = v9;
        objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 134, v13, v15, 0.4, 0.0);

      }
      else
      {
        (*((void (**)(void *))v12 + 2))(v12);
        if (v9)
          v9[2](v9, 1);
      }

    }
  }

}

uint64_t __60__DOCDownloadProgressView__setProgress_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __60__DOCDownloadProgressView__setProgress_animated_completion___block_invoke_2(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "determinateProgressRingView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProgress:", v1);

}

uint64_t __60__DOCDownloadProgressView__setProgress_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void (**v8)(id, _QWORD);
  NSObject **v9;
  NSObject *v10;
  _QWORD v11[4];
  void (**v12)(id, _QWORD);
  id v13[2];
  BOOL v14;
  _BYTE location[12];
  __int16 v16;
  double v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v5 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, _QWORD))a5;
  v9 = (NSObject **)MEMORY[0x24BE2DFF0];
  v10 = *MEMORY[0x24BE2DFF0];
  if (!*MEMORY[0x24BE2DFF0])
  {
    DOCInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 138412802;
    *(_QWORD *)&location[4] = self;
    v16 = 2048;
    v17 = a3;
    v18 = 1024;
    v19 = v5;
    _os_log_debug_impl(&dword_21EA4C000, v10, OS_LOG_TYPE_DEBUG, "%@ | --setStatus--\tcalled with status: %f animated: %d", location, 0x1Cu);
  }
  if (self->_graduallyIncreasingProgress)
  {
    if (v8)
      v8[2](v8, 0);
  }
  else
  {
    objc_initWeak((id *)location, self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__DOCDownloadProgressView_setProgress_animated_completion___block_invoke;
    v11[3] = &unk_24E327BE0;
    objc_copyWeak(v13, (id *)location);
    v13[1] = *(id *)&a3;
    v14 = v5;
    v12 = v8;
    -[DOCDownloadProgressView _addToPendingAnimationQueue:](self, "_addToPendingAnimationQueue:", v11);

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)location);
  }

}

void __59__DOCDownloadProgressView_setProgress_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  double v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(double *)(a1 + 48);
  v6 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__DOCDownloadProgressView_setProgress_animated_completion___block_invoke_2;
  v8[3] = &unk_24E327BB8;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v7 = v3;
  objc_msgSend(WeakRetained, "_setProgress:animated:completion:", v6, v8, v5);

}

uint64_t __59__DOCDownloadProgressView_setProgress_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  -[DOCDownloadProgressView setProgress:animated:completion:](self, "setProgress:animated:completion:", a4, 0, a3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  int v8;
  id v9;
  objc_super v10;

  if (a6 == &DOCDownloadProgressViewKVOContext)
  {
    -[DOCDownloadProgressView observedProgress](self, "observedProgress", a3, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isIndeterminate");

    if (v8)
    {
      -[DOCDownloadProgressView setProgress:animated:](self, "setProgress:animated:", 1, 0.0);
    }
    else
    {
      -[DOCDownloadProgressView observedProgress](self, "observedProgress");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fractionCompleted");
      -[DOCDownloadProgressView setProgress:animated:](self, "setProgress:animated:", 1);

    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)DOCDownloadProgressView;
    -[DOCDownloadProgressView observeValueForKeyPath:ofObject:change:context:](&v10, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setObservedProgress:(id)a3
{
  NSProgress *v5;
  id *p_observedProgress;
  NSProgress *observedProgress;
  BOOL v8;
  NSObject **v9;
  NSObject *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  NSObject **v15;
  NSObject *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (NSProgress *)a3;
  p_observedProgress = (id *)&self->_observedProgress;
  observedProgress = self->_observedProgress;
  if (observedProgress != v5)
  {
    if (observedProgress)
      v8 = !self->_shouldStopObservingProgress;
    else
      v8 = 1;
    if (!v8)
    {
      v9 = (NSObject **)MEMORY[0x24BE2DFF0];
      v10 = *MEMORY[0x24BE2DFF0];
      if (!*MEMORY[0x24BE2DFF0])
      {
        DOCInitLogging();
        v10 = *v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *p_observedProgress;
        v18 = 138543362;
        v19 = v11;
        _os_log_impl(&dword_21EA4C000, v10, OS_LOG_TYPE_DEFAULT, "Progress: [Download Progress View] REMOVE fractionCompleted observer for: %{public}@", (uint8_t *)&v18, 0xCu);
      }
      objc_msgSend(*p_observedProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
      objc_msgSend(*p_observedProgress, "removeObserver:forKeyPath:", self, CFSTR("isIndeterminate"));
      -[DOCDownloadProgressView setShouldStopObservingProgress:](self, "setShouldStopObservingProgress:", 0);
    }
    objc_storeStrong((id *)&self->_observedProgress, a3);
    if (*p_observedProgress && (objc_msgSend(*p_observedProgress, "isFinished") & 1) == 0)
    {
      -[DOCDownloadProgressView observedProgress](self, "observedProgress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isIndeterminate");

      if (v13)
      {
        -[DOCDownloadProgressView setProgress:animated:](self, "setProgress:animated:", 1, 0.0);
      }
      else
      {
        -[DOCDownloadProgressView observedProgress](self, "observedProgress");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "fractionCompleted");
        -[DOCDownloadProgressView setProgress:animated:](self, "setProgress:animated:", 1);

      }
      v15 = (NSObject **)MEMORY[0x24BE2DFF0];
      v16 = *MEMORY[0x24BE2DFF0];
      if (!*MEMORY[0x24BE2DFF0])
      {
        DOCInitLogging();
        v16 = *v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *p_observedProgress;
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_21EA4C000, v16, OS_LOG_TYPE_DEFAULT, "Progress: [Download Progress View] ADD fractionCompleted observer for: %{public}@", (uint8_t *)&v18, 0xCu);
      }
      objc_msgSend(*p_observedProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 1, &DOCDownloadProgressViewKVOContext);
      objc_msgSend(*p_observedProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("isIndeterminate"), 1, &DOCDownloadProgressViewKVOContext);
      self->_shouldStopObservingProgress = 1;
    }
    else
    {
      -[DOCDownloadProgressView setProgress:animated:](self, "setProgress:animated:", 1, 0.0);
    }
  }

}

- (void)beginGraduallyIncreasingProgress
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;
  _QWORD aBlock[5];

  self->_graduallyIncreasingProgress = 1;
  v3 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke;
  aBlock[3] = &unk_24E3279E8;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_4;
  v6[3] = &unk_24E327C08;
  v6[4] = self;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[DOCDownloadProgressView _addToPendingAnimationQueue:](self, "_addToPendingAnimationQueue:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

uint64_t __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_2;
  v3[3] = &unk_24E3279E8;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_3;
  v2[3] = &unk_24E3278B8;
  v2[4] = v4;
  return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 134, v3, v2, 5.0, 0.0);
}

uint64_t __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setProgress:animated:completion:", 0, 0, 1.0);
}

uint64_t __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_setProgress:animated:completion:", 0, 0, 0.0);
  return result;
}

void __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_4(id *a1, void *a2)
{
  id v3;
  double v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(a1[4], "progress");
  if (v4 == 0.0)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_5;
    v6[3] = &unk_24E327BB8;
    v7 = a1[5];
    v8 = v3;
    objc_msgSend(WeakRetained, "_setProgress:animated:completion:", 1, v6, 0.0);

  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }

}

uint64_t __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fadeoutWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__DOCDownloadProgressView_fadeoutWithCompletion___block_invoke;
  v6[3] = &unk_24E327C58;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[DOCDownloadProgressView _addToPendingAnimationQueue:](self, "_addToPendingAnimationQueue:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __49__DOCDownloadProgressView_fadeoutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BEBDB00];
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__DOCDownloadProgressView_fadeoutWithCompletion___block_invoke_2;
  v10[3] = &unk_24E327C30;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __49__DOCDownloadProgressView_fadeoutWithCompletion___block_invoke_3;
  v7[3] = &unk_24E327BB8;
  v8 = *(id *)(a1 + 32);
  v6 = v3;
  v9 = v6;
  objc_msgSend(v4, "animateWithDuration:animations:completion:", v10, v7, 0.25);

  objc_destroyWeak(&v11);
}

void __49__DOCDownloadProgressView_fadeoutWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "determinateProgressRingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "ghostRingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "indeterminateProgressRingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

}

uint64_t __49__DOCDownloadProgressView_fadeoutWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)animateToFullRingAndHideWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke;
  v6[3] = &unk_24E327C58;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[DOCDownloadProgressView _addToPendingAnimationQueue:](self, "_addToPendingAnimationQueue:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "determinateProgressRingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "strokeEnd");
  v9 = v8;

  v10 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v10, "determinateProgressRingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllAnimations");

  v13 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v13, "_setProgress:animated:completion:", 0, 0, v9);

  v14 = objc_loadWeakRetained((id *)(a1 + 40));
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke_2;
  v16[3] = &unk_24E327CA8;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  v17 = *(id *)(a1 + 32);
  v15 = v3;
  v18 = v15;
  objc_msgSend(v14, "_setProgress:animated:completion:", 1, v16, 1.0);

  objc_destroyWeak(&v19);
}

void __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke_2(id *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke_3;
  v9[3] = &unk_24E327C30;
  v4 = a1 + 6;
  objc_copyWeak(&v10, a1 + 6);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke_4;
  v5[3] = &unk_24E327C80;
  v6 = a1[4];
  objc_copyWeak(&v8, v4);
  v7 = a1[5];
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v9, v5, 0.25);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
}

void __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "determinateProgressRingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "ghostRingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "indeterminateProgressRingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

}

uint64_t __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setGraduallyIncreasingProgress:", 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 36.0;
  v3 = 36.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setCanShowStopButton:(BOOL)a3
{
  self->_canShowStopButton = a3;
  -[DOCDeterminateProgressRingView setCanShowStopButton:](self->_determinateProgressRingView, "setCanShowStopButton:");
}

- (void)handleTap:(id)a3
{
  NSProgress *observedProgress;

  if (objc_msgSend(a3, "state") == 3)
  {
    observedProgress = self->_observedProgress;
    if (observedProgress)
      -[NSProgress cancel](observedProgress, "cancel");
  }
}

- (UIColor)inactiveStrokeColor
{
  return self->_inactiveStrokeColor;
}

- (UIColor)activeStrokeColor
{
  return self->_activeStrokeColor;
}

- (NSProgress)observedProgress
{
  return self->_observedProgress;
}

- (BOOL)canShowStopButton
{
  return self->_canShowStopButton;
}

- (DOCGhostRingView)ghostRingView
{
  return self->_ghostRingView;
}

- (void)setGhostRingView:(id)a3
{
  objc_storeStrong((id *)&self->_ghostRingView, a3);
}

- (DOCDeterminateProgressRingView)determinateProgressRingView
{
  return self->_determinateProgressRingView;
}

- (void)setDeterminateProgressRingView:(id)a3
{
  objc_storeStrong((id *)&self->_determinateProgressRingView, a3);
}

- (DOCIndeterminateProgressRingView)indeterminateProgressRingView
{
  return self->_indeterminateProgressRingView;
}

- (void)setIndeterminateProgressRingView:(id)a3
{
  objc_storeStrong((id *)&self->_indeterminateProgressRingView, a3);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (BOOL)graduallyIncreasingProgress
{
  return self->_graduallyIncreasingProgress;
}

- (void)setGraduallyIncreasingProgress:(BOOL)a3
{
  self->_graduallyIncreasingProgress = a3;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (BOOL)shouldStopObservingProgress
{
  return self->_shouldStopObservingProgress;
}

- (void)setShouldStopObservingProgress:(BOOL)a3
{
  self->_shouldStopObservingProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indeterminateProgressRingView, 0);
  objc_storeStrong((id *)&self->_determinateProgressRingView, 0);
  objc_storeStrong((id *)&self->_ghostRingView, 0);
  objc_storeStrong((id *)&self->_observedProgress, 0);
  objc_storeStrong((id *)&self->_activeStrokeColor, 0);
  objc_storeStrong((id *)&self->_inactiveStrokeColor, 0);
  objc_storeStrong((id *)&self->_pendingAnimationQueue, 0);
}

- (void)_addToPendingAnimationQueue:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21EA4C000, a2, a3, "%@ | --_addToPendingAnimationQueue--\tqueueing animation.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_cold_1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 1024;
  v7 = a2 & 1;
  _os_log_debug_impl(&dword_21EA4C000, log, OS_LOG_TYPE_DEBUG, "%@ | --_addToPendingAnimationQueue--\tResuming queue. Anim finished: %d.", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

void __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21EA4C000, a2, a3, "%@ | --_addToPendingAnimationQueue--\tExecuting animation.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21EA4C000, a2, a3, "%@ | --_addToPendingAnimationQueue--\tsuspending queue.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
