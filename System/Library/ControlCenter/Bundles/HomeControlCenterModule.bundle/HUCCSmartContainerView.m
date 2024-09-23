@implementation HUCCSmartContainerView

- (HUCCSmartContainerView)initWithFrame:(CGRect)a3
{
  const char *v3;
  uint64_t v4;
  HUCCSmartContainerView *v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HUCCSmartContainerView;
  v5 = -[HUCCSmartContainerView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    objc_msgSend_clearColor(MEMORY[0x24BDF6950], v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBackgroundColor_(v5, v7, (uint64_t)v6);

    objc_msgSend_setClipsToBounds_(v5, v8, 0);
    objc_msgSend_controlCenterModuleBackgroundMaterial(MEMORY[0x24BE19B38], v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAnimationView_(v5, v12, (uint64_t)v11);

    CCUICompactModuleContinuousCornerRadius();
    v14 = v13;
    objc_msgSend_animationView(v5, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v17, v18, v19, v14);

    objc_msgSend_setIsShowingLockSecurity_(v5, v20, 0);
  }
  return v5;
}

- (void)didMoveToSuperview
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)HUCCSmartContainerView;
  -[HUCCSmartContainerView didMoveToSuperview](&v10, sel_didMoveToSuperview);
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_window(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("yes");
    if (!v8)
      v9 = CFSTR("no");
    *(_DWORD *)buf = 138412802;
    v12 = v5;
    v13 = 2080;
    v14 = "-[HUCCSmartContainerView didMoveToSuperview]";
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_230FDD000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s — has window: %@", buf, 0x20u);

  }
}

- (void)didMoveToWindow
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)HUCCSmartContainerView;
  -[HUCCSmartContainerView didMoveToWindow](&v10, sel_didMoveToWindow);
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_window(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("yes");
    if (!v8)
      v9 = CFSTR("no");
    *(_DWORD *)buf = 138412802;
    v12 = v5;
    v13 = 2080;
    v14 = "-[HUCCSmartContainerView didMoveToWindow]";
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_230FDD000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s — has window: %@", buf, 0x20u);

  }
}

- (void)setCompressedView:(id)a3
{
  UIView *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  UIView *compressedView;
  const char *v9;
  uint64_t v10;
  UIView *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  UIView *v17;
  UIView *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  int v39;
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  UIView *v44;
  __int16 v45;
  UIView *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = (UIView *)a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    compressedView = self->_compressedView;
    v39 = 138413058;
    v40 = v7;
    v41 = 2080;
    v42 = "-[HUCCSmartContainerView setCompressedView:]";
    v43 = 2112;
    v44 = compressedView;
    v45 = 2112;
    v46 = v4;
    _os_log_impl(&dword_230FDD000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s, was %@ is %@", (uint8_t *)&v39, 0x2Au);

  }
  v11 = self->_compressedView;
  if (v11)
  {
    objc_msgSend_removeFromSuperview(v11, v9, v10);
    objc_msgSend_animationView(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeFromSuperview(v14, v15, v16);

  }
  v17 = self->_compressedView;
  self->_compressedView = v4;
  v18 = v4;

  objc_msgSend_addSubview_(self, v19, (uint64_t)self->_compressedView);
  objc_msgSend_bounds(self, v20, v21);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend_compressedView(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v32, v33, v34, v23, v25, v27, v29);

  objc_msgSend_animationView(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_insertSubview_aboveSubview_(self, v38, (uint64_t)v37, self->_compressedView);

}

- (void)setExpandedView:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  UIView *expandedView;
  const char *v10;
  uint64_t v11;
  UIView **p_expandedView;
  UIView *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  UIView *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  int v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  UIView *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    expandedView = self->_expandedView;
    v23 = 138413058;
    v24 = v8;
    v25 = 2080;
    v26 = "-[HUCCSmartContainerView setExpandedView:]";
    v27 = 2112;
    v28 = expandedView;
    v29 = 2112;
    v30 = v5;
    _os_log_impl(&dword_230FDD000, v6, OS_LOG_TYPE_DEFAULT, "%@:%s, was %@ is %@", (uint8_t *)&v23, 0x2Au);

  }
  p_expandedView = &self->_expandedView;
  v13 = self->_expandedView;
  if (v13)
    objc_msgSend_removeFromSuperview(v13, v10, v11);
  objc_storeStrong((id *)p_expandedView, a3);
  if (*p_expandedView)
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alpha(*p_expandedView, v17, v18);
      v23 = 138413058;
      v24 = v16;
      v25 = 2080;
      v26 = "-[HUCCSmartContainerView setExpandedView:]";
      v27 = 2048;
      v28 = v19;
      v29 = 2048;
      v30 = 0;
      _os_log_impl(&dword_230FDD000, v14, OS_LOG_TYPE_DEFAULT, "%@:%s, expandedView.alpha was %f is %f", (uint8_t *)&v23, 0x2Au);

    }
    objc_msgSend_setAlpha_(*p_expandedView, v20, v21, 0.0);
    objc_msgSend_addSubview_(self, v22, (uint64_t)*p_expandedView);
  }

}

- (void)willMoveToExpandedStateWithAnimationStartFrame:(CGRect)a3
{
  uint64_t v3;
  double height;
  double width;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  height = a3.size.height;
  width = a3.size.width;
  objc_msgSend_expandedView(self, a2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v7, v8, v9, 0.0, 0.0, width, height);

  objc_msgSend_animationView(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v12, v13, v14, 0.0, 0.0, width, height);

  MEMORY[0x24BEDD108](self, sel_setCompressedAnimationStartFrame_, v15);
}

- (void)resetToInitialState
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  int isShowingLockSecurity;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  objc_class *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  int v42;
  void *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_animationView(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v4, v5, 1);

  isShowingLockSecurity = objc_msgSend_isShowingLockSecurity(self, v6, v7);
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (isShowingLockSecurity)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_compressedView(self, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alpha(v15, v16, v17);
      v42 = 138413058;
      v43 = v12;
      v44 = 2080;
      v45 = "-[HUCCSmartContainerView resetToInitialState]";
      v46 = 2048;
      v47 = v18;
      v48 = 2048;
      v49 = 0;
      _os_log_impl(&dword_230FDD000, v9, OS_LOG_TYPE_DEFAULT, "%@:%s, compressedView.alpha was %f is %f", (uint8_t *)&v42, 0x2Au);

    }
    objc_msgSend_compressedView(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlpha_(v21, v22, v23, 0.0);
  }
  else
  {
    if (v10)
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_compressedView(self, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alpha(v28, v29, v30);
      v42 = 138413058;
      v43 = v25;
      v44 = 2080;
      v45 = "-[HUCCSmartContainerView resetToInitialState]";
      v46 = 2048;
      v47 = v31;
      v48 = 2048;
      v49 = 0x3FF0000000000000;
      _os_log_impl(&dword_230FDD000, v9, OS_LOG_TYPE_DEFAULT, "%@:%s, compressedView.alpha was %f is %f", (uint8_t *)&v42, 0x2Au);

    }
    objc_msgSend_compressedView(self, v32, v33);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlpha_(v21, v34, v35, 1.0);
  }

  objc_msgSend_expandedView(self, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v38, v39, v40, 0.0);

  objc_msgSend_setExpandedView_(self, v41, 0);
}

- (void)showLockSecurityWithFrameDelegate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  NSObject *v38;
  objc_class *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  _QWORD block[4];
  id v54;
  id v55;
  id location;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend_isShowingLockSecurity(self, v5, v6) & 1) == 0)
  {
    v7 = objc_alloc(MEMORY[0x24BE4F420]);
    v10 = (void *)objc_msgSend_initWithFrame_(v7, v8, v9, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend_setLockSecurityView_(self, v11, (uint64_t)v10);

    objc_msgSend_lockSecurityView(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFrameDelegate_(v14, v15, (uint64_t)v4);

    objc_msgSend_lockSecurityView(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v18, v19, 1);

    HULocalizedModelString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lockSecurityView(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateUIWithInfoText_andActionText_(v23, v24, (uint64_t)v20, &stru_24FFD8ED8);

    objc_initWeak(&location, self);
    dispatch_get_global_queue(2, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_230FE8040;
    block[3] = &unk_24FFD8188;
    objc_copyWeak(&v55, &location);
    v26 = v20;
    v54 = v26;
    dispatch_async(v25, block);

    objc_msgSend_layoutGeometry(HUCCSmartGridLayout, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lockSecurityView(self, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMosaicLayoutGeometry_(v32, v33, (uint64_t)v29);

    objc_msgSend_lockSecurityView(self, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSubview_(self, v37, (uint64_t)v36);

    HFLogForCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_compressedView(self, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alpha(v43, v44, v45);
      *(_DWORD *)buf = 138413058;
      v58 = v40;
      v59 = 2080;
      v60 = "-[HUCCSmartContainerView showLockSecurityWithFrameDelegate:]";
      v61 = 2048;
      v62 = v46;
      v63 = 2048;
      v64 = 0;
      _os_log_impl(&dword_230FDD000, v38, OS_LOG_TYPE_DEFAULT, "%@:%s, compressedView.alpha was %f is %f", buf, 0x2Au);

    }
    objc_msgSend_compressedView(self, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlpha_(v49, v50, v51, 0.0);

    objc_msgSend_setIsShowingLockSecurity_(self, v52, 1);
    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);

  }
}

- (void)hideLockSecurity
{
  uint64_t v2;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  int v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_isShowingLockSecurity(self, a2, v2))
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_compressedView(self, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alpha(v9, v10, v11);
      v25 = 138413058;
      v26 = v6;
      v27 = 2080;
      v28 = "-[HUCCSmartContainerView hideLockSecurity]";
      v29 = 2048;
      v30 = v12;
      v31 = 2048;
      v32 = 0x3FF0000000000000;
      _os_log_impl(&dword_230FDD000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s, compressedView.alpha was %f is %f", (uint8_t *)&v25, 0x2Au);

    }
    objc_msgSend_compressedView(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlpha_(v15, v16, v17, 1.0);

    objc_msgSend_lockSecurityView(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeFromSuperview(v20, v21, v22);

    objc_msgSend_setLockSecurityView_(self, v23, 0);
    objc_msgSend_setIsShowingLockSecurity_(self, v24, 0);
  }
}

- (void)layoutSubviews
{
  const char *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HUCCSmartContainerView;
  -[HUCCSmartContainerView layoutSubviews](&v18, sel_layoutSubviews);
  objc_msgSend_bounds(self, v3, v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend_lockSecurityView(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v15, v16, v17, v6, v8, v10, v12);

}

- (CGRect)compressedAnimationStartFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_compressedAnimationStartFrame.origin.x;
  y = self->_compressedAnimationStartFrame.origin.y;
  width = self->_compressedAnimationStartFrame.size.width;
  height = self->_compressedAnimationStartFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCompressedAnimationStartFrame:(CGRect)a3
{
  self->_compressedAnimationStartFrame = a3;
}

- (UIView)animationView
{
  return self->_animationView;
}

- (void)setAnimationView:(id)a3
{
  objc_storeStrong((id *)&self->_animationView, a3);
}

- (UIView)compressedView
{
  return self->_compressedView;
}

- (UIView)expandedView
{
  return self->_expandedView;
}

- (BOOL)isShowingLockSecurity
{
  return self->_isShowingLockSecurity;
}

- (void)setIsShowingLockSecurity:(BOOL)a3
{
  self->_isShowingLockSecurity = a3;
}

- (HUCCInfoMosaicGridView)lockSecurityView
{
  return self->_lockSecurityView;
}

- (void)setLockSecurityView:(id)a3
{
  objc_storeStrong((id *)&self->_lockSecurityView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockSecurityView, 0);
  objc_storeStrong((id *)&self->_expandedView, 0);
  objc_storeStrong((id *)&self->_compressedView, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
}

@end
