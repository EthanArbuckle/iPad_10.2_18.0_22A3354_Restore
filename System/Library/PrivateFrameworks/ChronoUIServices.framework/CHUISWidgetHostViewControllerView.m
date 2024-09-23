@implementation CHUISWidgetHostViewControllerView

- (double)_currentDisplayScale
{
  void *v3;
  double v4;
  double v5;

  BSDispatchQueueAssertMain();
  -[CHUISWidgetHostViewControllerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  return v5;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CHUISWidgetHostViewController **p_parentController;
  id WeakRetained;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  id v14;
  char v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[8];
  objc_super v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  CGSize v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v32 = *MEMORY[0x1E0C80C00];
  p_parentController = &self->_parentController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  objc_msgSend(WeakRetained, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CHUISWidgetHostViewControllerView _currentDisplayScale](self, "_currentDisplayScale");
  objc_msgSend(v10, "_effectiveSizePixelAlignedForDisplayScale:");
  v13 = width == v12 && height == v11;
  if (v13
    || (v14 = objc_loadWeakRetained((id *)p_parentController),
        v15 = objc_msgSend(v14, "metricsDefineSize"),
        v14,
        (v15 & 1) == 0))
  {
    v25.receiver = self;
    v25.super_class = (Class)CHUISWidgetHostViewControllerView;
    -[CHUISWidgetHostViewControllerView setFrame:](&v25, sel_setFrame_, x, y, width, height);
    CHUISLogViewController();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_loadWeakRetained((id *)p_parentController);
      objc_msgSend(v20, "_cachedSceneLogDigest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33.width = width;
      v33.height = height;
      NSStringFromCGSize(v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v27 = v20;
      v28 = 2114;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_1B711E000, v19, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Changing frame to %@", buf, 0x20u);

    }
    v23 = objc_loadWeakRetained((id *)p_parentController);
    objc_msgSend(v23, "setPreferredContentSize:", width, height);

    v16 = objc_loadWeakRetained((id *)p_parentController);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __46__CHUISWidgetHostViewControllerView_setFrame___block_invoke;
    v24[3] = &__block_descriptor_64_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    *(double *)&v24[4] = x;
    *(double *)&v24[5] = y;
    *(double *)&v24[6] = width;
    *(double *)&v24[7] = height;
    -[NSObject modifySceneSettings:](v16, "modifySceneSettings:", v24);
  }
  else
  {
    CHUISLogViewController();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_loadWeakRetained((id *)p_parentController);
      objc_msgSend(v17, "_cachedSceneLogDigest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v27 = v17;
      v28 = 2114;
      v29 = v18;
      _os_log_impl(&dword_1B711E000, v16, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Eating frame change in view because not configured to change the frame.", buf, 0x16u);

    }
  }

}

id __46__CHUISWidgetHostViewControllerView_setFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  objc_msgSend(a2, "setFrame:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0DC3490]);
    objc_msgSend(MEMORY[0x1E0DC3BC0], "_synchronizedDrawingFence");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAnimationFence:", v3);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  int v4;
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGSize result;

  -[CHUISWidgetHostViewControllerView parentController](self, "parentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "metricsDefineSize");

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
    objc_msgSend(WeakRetained, "metrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CHUISWidgetHostViewControllerView _currentDisplayScale](self, "_currentDisplayScale");
    objc_msgSend(v6, "_effectiveSizePixelAlignedForDisplayScale:");
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CHUISWidgetHostViewControllerView;
    -[CHUISWidgetHostViewControllerView intrinsicContentSize](&v15, sel_intrinsicContentSize);
    v8 = v11;
    v10 = v12;
  }
  v13 = v8;
  v14 = v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (id)accessibilityHUDRepresentation
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  objc_msgSend(WeakRetained, "_snapshotViewIgnoringVibrancyEffect:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v4, "setContentMode:", 1);
  -[CHUISWidgetHostViewControllerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  v7 = objc_alloc(MEMORY[0x1E0D01958]);
  if (v6 == 2)
    v8 = 2;
  else
    v8 = 1;
  v9 = (void *)objc_msgSend(v7, "initWithEffectType:backgroundType:color:", 0, v8, 0);
  v10 = objc_alloc(MEMORY[0x1E0D01960]);
  objc_msgSend(v4, "bounds");
  v11 = (void *)objc_msgSend(v10, "initWithFrame:");
  objc_msgSend(v11, "setConfiguration:", v9);
  objc_msgSend(v11, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v4);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3418]), "initWithCustomView:", v11);
  return v13;
}

- (CHUISWidgetHostViewController)parentController
{
  return (CHUISWidgetHostViewController *)objc_loadWeakRetained((id *)&self->_parentController);
}

- (void)setParentController:(id)a3
{
  objc_storeWeak((id *)&self->_parentController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentController);
}

@end
