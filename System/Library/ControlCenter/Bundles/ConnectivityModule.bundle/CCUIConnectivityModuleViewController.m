@implementation CCUIConnectivityModuleViewController

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CCUIConnectivityModuleViewController;
  -[CCUIConnectivityModuleViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  objc_msgSend__initializeCollapsedView(self, v4, v5);
  if (objc_msgSend__isCurrentGridSizeClassImplicitlyExpanded(self, v6, v7))
    objc_msgSend__initializeExpandedView(self, v8, v9);
}

- (CCUIConnectivityModuleViewController)initWithContentModuleContext:(id)a3
{
  id v5;
  CCUIConnectivityModuleViewController *v6;
  CCUIConnectivityModuleViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIConnectivityModuleViewController;
  v6 = -[CCUIConnectivityModuleViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentModuleContext, a3);

  return v7;
}

- (void)loadView
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  id v15;

  v3 = objc_alloc(MEMORY[0x24BE19B88]);
  objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v6, v7, v8);
  v15 = (id)objc_msgSend_initWithFrame_(v3, v9, v10);

  objc_msgSend_setAutoresizingMask_(v15, v11, 18);
  objc_msgSend__setContinuousCornerRadius_(v15, v12, v13, self->_compactContinuousCornerRadius);
  objc_msgSend_setView_(self, v14, (uint64_t)v15);

}

- (void)viewDidLoad
{
  dispatch_queue_t v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CCUIConnectivityModuleViewController;
  -[CCUIConnectivityModuleViewController viewDidLoad](&v29, sel_viewDidLoad);
  v3 = dispatch_queue_create("com.apple.control-center.ConnectivityModule.cellular", 0);
  v4 = objc_alloc(MEMORY[0x24BDC2810]);
  v6 = (void *)objc_msgSend_initWithQueue_(v4, v5, (uint64_t)v3);
  objc_msgSend_setDelegate_(v6, v7, (uint64_t)self);
  objc_msgSend_setCoreTelephonyQueue_(self, v8, (uint64_t)v3);
  objc_msgSend_setCoreTelephonyClient_(self, v9, (uint64_t)v6);
  objc_msgSend_view(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_compactContinuousCornerRadius(self, v13, v14);
  v16 = v15;
  objc_msgSend_controlCenterModuleBackgroundMaterial(MEMORY[0x24BE19B38], v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAutoresizingMask_(v19, v20, 18);
  objc_msgSend__setContinuousCornerRadius_(v19, v21, v22, v16);
  objc_msgSend_setBackgroundPlatterView_(self, v23, (uint64_t)v19);
  objc_msgSend_addSubview_(v12, v24, (uint64_t)v19);
  objc_msgSend__initializeButtons(self, v25, v26);
  objc_msgSend__updateTelephonyState(self, v27, v28);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  const char *v8;
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CCUIConnectivityModuleViewController;
  v7 = a4;
  -[CCUIConnectivityModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_230FA9398;
  v9[3] = &unk_24FFCAA20;
  v9[4] = self;
  objc_msgSend_animateAlongsideTransition_completion_(v7, v8, (uint64_t)v9, 0);

}

- (void)viewWillLayoutSubviews
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t isExpanded;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  double v74;
  double v75;
  const char *v76;
  uint64_t v77;
  const char *v79;
  uint64_t v80;
  const char *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  objc_super v88;
  CGRect v89;

  v88.receiver = self;
  v88.super_class = (Class)CCUIConnectivityModuleViewController;
  -[CCUIConnectivityModuleViewController viewWillLayoutSubviews](&v88, sel_viewWillLayoutSubviews);
  objc_msgSend_view(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v5, v6, v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  isExpanded = objc_msgSend__isExpanded(self, v16, v17);
  objc_msgSend_traitCollection(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_displayScale(v21, v22, v23);

  objc_msgSend_backgroundPlatterView(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v26;
  if ((_DWORD)isExpanded)
  {
    v30 = 0.0;
    objc_msgSend_setAlpha_(v26, v27, v28, 0.0);
  }
  else
  {
    v30 = 1.0;
    objc_msgSend_setAlpha_(v26, v27, v28, 1.0);
  }
  objc_msgSend_setFrame_(v29, v31, v32, v9, v11, v13, v15);
  objc_msgSend__compressedButtonSize(self, v33, v34);
  v36 = v35;
  v38 = v37;
  UIRoundToScale();
  v40 = v39;
  UISizeRoundToScale();
  v42 = v41;
  v44 = v43;
  UISizeRoundToScale();
  v82 = v46;
  v84 = v45;
  UISizeRoundToScale();
  v86 = v47;
  v87 = v48;
  objc_msgSend_orderedButtonViewControllers(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v51, v52, v53))
  {
    v56 = 0;
    v83 = v82 + v87;
    v85 = v84 + v86;
    do
    {
      objc_msgSend_objectAtIndex_(v51, v54, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_view(v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v60, v61, v62, v30);
      v65 = v40;
      v66 = v40;
      v67 = v36;
      v68 = v38;
      switch(v56)
      {
        case 0uLL:
          goto LABEL_24;
        case 1uLL:
          v69 = v40 + v40 + v36;
          v70 = v40;
          goto LABEL_9;
        case 2uLL:
          v69 = v40;
          v70 = v40 + v40 + v38;
LABEL_9:
          objc_msgSend_setFrame_(v60, v63, v64, v69, v70, v36, v38);
          break;
        case 3uLL:
          v71 = objc_msgSend_count(v51, v63, v64, v40, v40, v36, v38);
          if (v71 == 4)
            v74 = v36;
          else
            v74 = v42;
          if (v71 == 4)
            v75 = v40 + v40 + v38;
          else
            v75 = v87;
          if (v71 == 4)
            objc_msgSend_setFrame_(v60, v72, v73, v40 + v40 + v36, v75, v74, v38);
          else
            objc_msgSend_setFrame_(v60, v72, v73, v86, v75, v74, v44);
          break;
        case 4uLL:
          v65 = v85;
          v66 = v87;
          goto LABEL_23;
        case 5uLL:
          v65 = v86;
          goto LABEL_22;
        case 6uLL:
          v65 = v85;
LABEL_22:
          v66 = v83;
LABEL_23:
          v67 = v42;
          v68 = v44;
LABEL_24:
          objc_msgSend_setFrame_(v60, v63, v64, v65, v66, v67, v68);
          break;
        default:
          break;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v89) < 375.0 && v56 >= 3)
        objc_msgSend_setGlyphScale_(v57, v76, v77, 0.5);

      ++v56;
    }
    while (v56 < objc_msgSend_count(v51, v79, v80));
  }
  objc_msgSend__layoutExpandedView(self, v54, v55);
  objc_msgSend__updateButtonContentMode_(self, v81, isExpanded);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    objc_msgSend_backgroundPlatterView(self, a2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v6, v7, v8, a3);

    objc_msgSend_view(self, v9, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v13, v11, v12, a3);

  }
}

- (void)setContentMetrics:(id)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v14 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentMetrics, a3);
    objc_msgSend_orderedExpandedButtonViewControllers(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_230FA9848;
    v15[3] = &unk_24FFCAA48;
    v16 = v14;
    objc_msgSend_enumerateObjectsUsingBlock_(v7, v8, (uint64_t)v15);

    objc_msgSend_view(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNeedsLayout(v11, v12, v13);

  }
}

- (BOOL)prefersExpandedContentSizeMatchesGridSize
{
  return 1;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  uint64_t v2;

  return objc_msgSend__isExpanded(self, a2, v2) ^ 1;
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return objc_msgSend__isExpanded(self, a2, (uint64_t)a3) ^ 1;
}

- (BOOL)shouldPerformClickInteraction
{
  uint64_t v2;

  return objc_msgSend__isExpanded(self, a2, v2) ^ 1;
}

- (BOOL)shouldPerformHoverInteraction
{
  uint64_t v2;

  return objc_msgSend__isExpanded(self, a2, v2) ^ 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  const char *v6;
  _QWORD v7[5];

  v3 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_230FA9970;
  v7[3] = &unk_24FFCA830;
  v7[4] = self;
  objc_msgSend_performWithoutAnimation_(MEMORY[0x24BDF6F90], a2, (uint64_t)v7);
  objc_msgSend_setExpandedFromTransition_(self, v5, v3);
  objc_msgSend__updateButtonContentMode_(self, v6, v3);
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (unint64_t)implicitlyExpandedGridSizeClasses
{
  return 1536;
}

- (void)setGridSizeClass:(int64_t)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  _QWORD v7[5];

  if (self->_gridSizeClass != a3)
  {
    self->_gridSizeClass = a3;
    if (objc_msgSend__isExpanded(self, a2, a3))
    {
      if ((objc_msgSend_isExpandedViewInitialized(self, v4, v5) & 1) == 0)
      {
        v7[0] = MEMORY[0x24BDAC760];
        v7[1] = 3221225472;
        v7[2] = sub_230FA9A18;
        v7[3] = &unk_24FFCA830;
        v7[4] = self;
        objc_msgSend_performWithoutAnimation_(MEMORY[0x24BDF6F90], v6, (uint64_t)v7);
      }
    }
  }
}

- (void)setResizing:(BOOL)a3
{
  const char *v4;
  id v5;

  if (self->_resizing != a3)
  {
    self->_resizing = a3;
    objc_msgSend_view(self, a2, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClipsToBounds_(v5, v4, self->_resizing);

  }
}

- (void)_updateTelephonyState
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;

  objc_msgSend_cellularDataButtonViewController(self, a2, v2);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isObservingStateChanges(v23, v4, v5))
    objc_msgSend_updateState(v23, v6, v7);
  objc_msgSend_expandedCellularDataButtonViewController(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isObservingStateChanges(v8, v9, v10))
    objc_msgSend_updateState(v8, v11, v12);
  objc_msgSend_hotspotButtonViewController(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isObservingStateChanges(v13, v14, v15))
    objc_msgSend_updateState(v13, v16, v17);
  objc_msgSend_expandedHotspotButtonViewController(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isObservingStateChanges(v18, v19, v20))
    objc_msgSend_updateState(v18, v21, v22);

}

- (void)dataSettingsChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FA9BD8;
  block[3] = &unk_24FFCA830;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_initializeCollapsedView
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;

  if ((objc_msgSend_isCollapsedViewInitialized(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_orderedButtonViewControllers(self, v4, v5);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__addButtonViewControllers_forwardingAppearanceMethods_(self, v6, (uint64_t)v22, 0);
    if (objc_msgSend_count(v22, v7, v8))
    {
      v11 = 0;
      do
      {
        v12 = v22;
        if (v11 >= 3)
        {
          v13 = (unint64_t)objc_msgSend_count(v22, v9, v10) >= 5;
          v12 = v22;
          if (v13)
          {
            objc_msgSend_objectAtIndex_(v22, v9, v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setDynamicLayoutEnabled_(v14, v15, 1);
            objc_msgSend_setGlyphScale_(v14, v16, v17, 0.6);
            objc_msgSend_view(v14, v18, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setUserInteractionEnabled_(v20, v21, 0);

            v12 = v22;
          }
        }
        ++v11;
      }
      while (v11 < objc_msgSend_count(v12, v9, v10));
    }
    objc_msgSend_setCollapsedViewInitialized_(self, v9, 1);

  }
}

- (void)_initializeExpandedView
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int isCurrentGridSizeClassImplicitlyExpanded;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  id v62;

  if ((objc_msgSend_isExpandedViewInitialized(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_contentMetrics(self, v4, v5);
    v62 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentModuleContext(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2348CC198]();
    CCUILayoutGutter();
    CCUICompactModuleContinuousCornerRadiusForGridSizeClass();
    v10 = v9;
    objc_msgSend_orderedExpandedButtonViewControllers(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    isCurrentGridSizeClassImplicitlyExpanded = objc_msgSend__isCurrentGridSizeClassImplicitlyExpanded(self, v14, v15);
    objc_msgSend__addButtonViewControllers_forwardingAppearanceMethods_(self, v17, (uint64_t)v13, isCurrentGridSizeClassImplicitlyExpanded ^ 1u);
    if (objc_msgSend_count(v13, v18, v19))
    {
      v21 = 0;
      v22 = *MEMORY[0x24BDBF090];
      v23 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v24 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v25 = *(double *)(MEMORY[0x24BDBF090] + 24);
      do
      {
        objc_msgSend_objectAtIndex_(v13, v20, v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_loadViewIfNeeded(v26, v27, v28);
        objc_msgSend_setContentModuleContext_(v26, v29, (uint64_t)v8);
        objc_msgSend_setDynamicLayoutEnabled_(v26, v30, 1);
        objc_msgSend_view(v26, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_alloc(MEMORY[0x24BE19B50]);
        v37 = (void *)objc_msgSend_initWithFrame_(v34, v35, v36, v22, v23, v24, v25);
        objc_msgSend_controlCenterModuleBackgroundMaterial(MEMORY[0x24BE19B38], v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setBackgroundView_(v37, v41, (uint64_t)v40);

        objc_msgSend_setCustomGlyphView_(v37, v42, (uint64_t)v33);
        objc_msgSend_setDelegate_(v37, v43, (uint64_t)v26);
        objc_msgSend_setContextMenuDelegate_(v37, v44, (uint64_t)v26);
        objc_msgSend_setGridSizeClass_(v37, v45, 3);
        objc_msgSend_setContinuousCornerRadius_(v37, v46, v47, v10);
        objc_msgSend_setContentMetrics_(v37, v48, (uint64_t)v62);
        objc_msgSend_setTemplateView_(v26, v49, (uint64_t)v37);
        objc_msgSend_setMenuModuleDelegate_(v37, v50, (uint64_t)v26);
        objc_msgSend_identifier(v26, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAccessibilityIdentifier_(v37, v54, (uint64_t)v53);

        objc_msgSend_view(self, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSubview_(v57, v58, (uint64_t)v37);
        objc_msgSend__refreshMenuAffordanceVisibilityForExpandedButtonViewController_(self, v59, (uint64_t)v26);

        ++v21;
      }
      while (v21 < objc_msgSend_count(v13, v60, v61));
    }
    objc_msgSend_setExpandedViewInitialized_(self, v20, 1);

  }
}

- (void)_layoutExpandedView
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  int isExpanded;
  double v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  _BOOL4 v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  unint64_t v33;
  double v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  unint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  id v58;
  CGRect v59;

  if (objc_msgSend_isExpandedViewInitialized(self, a2, v2))
  {
    objc_msgSend_view(self, v4, v5);
    v58 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bounds(v58, v6, v7);
    v9 = v8;
    isExpanded = objc_msgSend__isExpanded(self, v10, v11);
    v13 = MEMORY[0x2348CC198]();
    CCUILayoutGutter();
    v15 = v14;
    objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_userInterfaceIdiom(v18, v19, v20) == 1)
    {
      v23 = 0;
    }
    else
    {
      objc_msgSend_traitCollection(self, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_verticalSizeClass(v24, v25, v26) == 1;

    }
    objc_msgSend_orderedExpandedButtonViewControllers(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v29, v30, v31))
    {
      v33 = 0;
      if (isExpanded)
        v34 = 1.0;
      else
        v34 = 0.0;
      v35 = v9 * 0.5 + v15 * 0.5;
      if (v23)
        v9 = v9 * 0.5 - v15 * 0.5;
      do
      {
        objc_msgSend_objectAtIndex_(v29, v32, v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_templateView(v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAlpha_(v39, v40, v41, v34);
        v44 = v33 - 4;
        if (v33 >= 4)
        {
          v45 = v35;
        }
        else
        {
          v44 = v33;
          v45 = 0.0;
        }
        if (!v23)
        {
          v44 = v33;
          v45 = 0.0;
        }
        objc_msgSend_setFrame_(v39, v42, v43, v45, v15 * (double)v44 + v13 * (double)v44, v9, v13);
        objc_msgSend_contentMetrics(self, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v48;
        if (v48)
        {
          objc_msgSend_symbolScaleFactor(v48, v49, v50);
          v53 = v52;
          CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v59) >= 375.0)
            objc_msgSend_setGlyphScale_(v36, v54, v55, v53);
          else
            objc_msgSend_setGlyphScale_(v36, v54, v55, v53 * 0.8);
        }
        objc_msgSend__refreshMenuAffordanceVisibilityForExpandedButtonViewController_(self, v49, (uint64_t)v36);

        ++v33;
      }
      while (v33 < objc_msgSend_count(v29, v56, v57));
    }

  }
}

- (BOOL)_isExpanded
{
  uint64_t v2;
  char isCurrentGridSizeClassImplicitlyExpanded;
  const char *v5;
  uint64_t v6;

  isCurrentGridSizeClassImplicitlyExpanded = objc_msgSend__isCurrentGridSizeClassImplicitlyExpanded(self, a2, v2);
  return isCurrentGridSizeClassImplicitlyExpanded | objc_msgSend_isExpandedFromTransition(self, v5, v6);
}

- (void)_updateButtonContentMode:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  const char *v6;
  uint64_t v7;
  char isWifiOnlySKU;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[2];
  _QWORD v35[4];

  v3 = a3;
  v35[3] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_isButtonContentModeExpanded(self, a2, a3) != a3)
  {
    objc_msgSend_setButtonContentModeExpanded_(self, v5, v3);
    isWifiOnlySKU = objc_msgSend_isWifiOnlySKU(self, v6, v7);
    objc_msgSend_expandedWifiButtonViewController(self, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v11;
    if ((isWifiOnlySKU & 1) != 0)
    {
      v34[0] = v11;
      objc_msgSend_expandedBluetoothButtonViewController(self, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v15;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v16, (uint64_t)v34, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35[0] = v11;
      objc_msgSend_expandedBluetoothButtonViewController(self, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v15;
      objc_msgSend_expandedCellularDataButtonViewController(self, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v20;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v21, (uint64_t)v35, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = v17;
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v29, v33, 16);
    if (v24)
    {
      v26 = v24;
      v27 = *(_QWORD *)v30;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v30 != v27)
            objc_enumerationMutation(v22);
          objc_msgSend_containerWillTransitionToExpandedContentMode_(*(void **)(*((_QWORD *)&v29 + 1) + 8 * v28++), v25, v3, (_QWORD)v29);
        }
        while (v26 != v28);
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v29, v33, 16);
      }
      while (v26);
    }

  }
}

- (void)_refreshMenuAffordanceVisibilityForExpandedButtonViewController:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  objc_msgSend_templateView(v22, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expandedWifiButtonViewController(self, v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_expandedCellularDataButtonViewController(self, v10, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_expandedBluetoothButtonViewController(self, v13, v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v18 = 1;
  if (v9 != v22 && v15 != v22)
  {
    if (v12 == v22)
    {
      v18 = objc_msgSend_showsMenuModuleAsPrimaryAction(v22, v16, v17);
    }
    else
    {
      objc_msgSend_contextMenuItems(v22, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend_count(v19, v20, v21) != 0;

    }
  }
  objc_msgSend_setShowsMenuAffordance_(v6, v16, v18);

}

- (id)_makeButtonWithClass:(Class)a3
{
  id v4;

  if (objc_msgSend_isSupported(a3, a2, (uint64_t)a3))
    v4 = objc_alloc_init(a3);
  else
    v4 = 0;
  return v4;
}

- (CGSize)_compressedButtonSize
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  objc_msgSend_orderedButtonViewControllers(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v3, v4, v5))
  {
    objc_msgSend_firstObject(v3, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_button(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sizeThatFits_(v11, v12, v13, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    v15 = v14;
    v17 = v16;

  }
  else
  {
    v15 = *MEMORY[0x24BDBF148];
    v17 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)_initializeButtons
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  id v59;
  id v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  void *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;

  v3 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v4, v3);
  v84 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v6, v5);
  v76 = objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v8, v7);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v10, v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v13, v12);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v15, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v18, v17);
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAirplaneButtonViewController_(self, v20, (uint64_t)v84);
  objc_msgSend_setCellularDataButtonViewController_(self, v21, v76);
  objc_msgSend_setWifiButtonViewController_(self, v22, (uint64_t)v81);
  v80 = (void *)v11;
  objc_msgSend_setBluetoothButtonViewController_(self, v23, v11);
  objc_msgSend_setAirDropButtonViewController_(self, v24, (uint64_t)v79);
  v83 = (void *)v16;
  objc_msgSend_setHotspotButtonViewController_(self, v25, v16);
  v82 = (void *)v19;
  objc_msgSend_setVpnButtonViewController_(self, v26, v19);
  v27 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v28, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v31, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v34, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v37, v36);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v40, v39);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v43, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v46, v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_opt_class();
  objc_msgSend__makeButtonWithClass_(self, v49, v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExpandedAirplaneButtonViewController_(self, v51, (uint64_t)v29);
  objc_msgSend_setExpandedCellularDataButtonViewController_(self, v52, (uint64_t)v32);
  objc_msgSend_setExpandedWifiButtonViewController_(self, v53, (uint64_t)v35);
  v78 = (void *)v38;
  objc_msgSend_setExpandedBluetoothButtonViewController_(self, v54, v38);
  objc_msgSend_setExpandedAirDropButtonViewController_(self, v55, v41);
  objc_msgSend_setExpandedHotspotButtonViewController_(self, v56, (uint64_t)v44);
  objc_msgSend_setExpandedSatelliteButtonViewController_(self, v57, (uint64_t)v47);
  objc_msgSend_setExpandedVPNButtonViewController_(self, v58, (uint64_t)v50);
  v59 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v60 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend_addObject_(v59, v61, (uint64_t)v84);
  objc_msgSend_addObject_(v60, v62, (uint64_t)v29);
  objc_msgSend_addObject_(v59, v63, (uint64_t)v79);
  v77 = (void *)v41;
  objc_msgSend_addObject_(v60, v64, v41);
  objc_msgSend_addObject_(v59, v65, (uint64_t)v81);
  objc_msgSend_addObject_(v60, v66, (uint64_t)v35);
  v68 = (void *)v76;
  if (v76 && v32)
  {
    objc_msgSend_addObject_(v59, v67, v76);
    objc_msgSend_addObject_(v60, v69, (uint64_t)v32);
  }
  else
  {
    objc_msgSend_setWifiOnlySKU_(self, v67, 1, v76);
  }
  objc_msgSend_addObject_(v59, v70, (uint64_t)v80, v76);
  objc_msgSend_addObject_(v60, v71, (uint64_t)v78);
  if (v83 && v44)
  {
    objc_msgSend_addObject_(v59, v72, (uint64_t)v83);
    objc_msgSend_addObject_(v60, v73, (uint64_t)v44);
  }
  if (v82 && v50)
  {
    objc_msgSend_addObject_(v59, v72, (uint64_t)v82);
    objc_msgSend_addObject_(v60, v74, (uint64_t)v50);
  }
  if (v47)
    objc_msgSend_addObject_(v60, v72, (uint64_t)v47);
  objc_msgSend_setOrderedButtonViewControllers_(self, v72, (uint64_t)v59);
  objc_msgSend_setOrderedExpandedButtonViewControllers_(self, v75, (uint64_t)v60);

}

- (void)_addButtonViewControllers:(id)a3 forwardingAppearanceMethods:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v15, v19, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v6);
        objc_msgSend_bs_addChildViewController_(self, v9, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v15, v19, 16);
    }
    while (v10);
  }
  if (v4)
  {
    objc_msgSend_ccui_safelyBeginAppearanceTransitionForChildViewControllers_animated_(self, v9, 1, 0);
    objc_msgSend_ccui_safelyEndAppearanceTransitionForChildViewControllers(self, v13, v14);
  }

}

- (BOOL)_isCurrentGridSizeClassImplicitlyExpanded
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = 1 << objc_msgSend_gridSizeClass(self, a2, v2);
  return (objc_msgSend_implicitlyExpandedGridSizeClasses(self, v5, v6) & v4) != 0;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (int64_t)gridSizeClass
{
  return self->_gridSizeClass;
}

- (BOOL)isResizing
{
  return self->_resizing;
}

- (BOOL)isWifiOnlySKU
{
  return self->_wifiOnlySKU;
}

- (void)setWifiOnlySKU:(BOOL)a3
{
  self->_wifiOnlySKU = a3;
}

- (BOOL)isCollapsedViewInitialized
{
  return self->_collapsedViewInitialized;
}

- (void)setCollapsedViewInitialized:(BOOL)a3
{
  self->_collapsedViewInitialized = a3;
}

- (BOOL)isExpandedViewInitialized
{
  return self->_expandedViewInitialized;
}

- (void)setExpandedViewInitialized:(BOOL)a3
{
  self->_expandedViewInitialized = a3;
}

- (BOOL)isExpandedFromTransition
{
  return self->_expandedFromTransition;
}

- (void)setExpandedFromTransition:(BOOL)a3
{
  self->_expandedFromTransition = a3;
}

- (BOOL)isButtonContentModeExpanded
{
  return self->_buttonContentModeExpanded;
}

- (void)setButtonContentModeExpanded:(BOOL)a3
{
  self->_buttonContentModeExpanded = a3;
}

- (UIView)backgroundPlatterView
{
  return self->_backgroundPlatterView;
}

- (void)setBackgroundPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundPlatterView, a3);
}

- (NSArray)orderedButtonViewControllers
{
  return self->_orderedButtonViewControllers;
}

- (void)setOrderedButtonViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_orderedButtonViewControllers, a3);
}

- (CCUIConnectivityButtonViewController)airplaneButtonViewController
{
  return self->_airplaneButtonViewController;
}

- (void)setAirplaneButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_airplaneButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)cellularDataButtonViewController
{
  return self->_cellularDataButtonViewController;
}

- (void)setCellularDataButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cellularDataButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)wifiButtonViewController
{
  return self->_wifiButtonViewController;
}

- (void)setWifiButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_wifiButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)bluetoothButtonViewController
{
  return self->_bluetoothButtonViewController;
}

- (void)setBluetoothButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)airDropButtonViewController
{
  return self->_airDropButtonViewController;
}

- (void)setAirDropButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_airDropButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)hotspotButtonViewController
{
  return self->_hotspotButtonViewController;
}

- (void)setHotspotButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hotspotButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)vpnButtonViewController
{
  return self->_vpnButtonViewController;
}

- (void)setVpnButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_vpnButtonViewController, a3);
}

- (NSArray)orderedExpandedButtonViewControllers
{
  return self->_orderedExpandedButtonViewControllers;
}

- (void)setOrderedExpandedButtonViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_orderedExpandedButtonViewControllers, a3);
}

- (CCUIConnectivityButtonViewController)expandedAirplaneButtonViewController
{
  return self->_expandedAirplaneButtonViewController;
}

- (void)setExpandedAirplaneButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_expandedAirplaneButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)expandedCellularDataButtonViewController
{
  return self->_expandedCellularDataButtonViewController;
}

- (void)setExpandedCellularDataButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_expandedCellularDataButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)expandedWifiButtonViewController
{
  return self->_expandedWifiButtonViewController;
}

- (void)setExpandedWifiButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_expandedWifiButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)expandedBluetoothButtonViewController
{
  return self->_expandedBluetoothButtonViewController;
}

- (void)setExpandedBluetoothButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_expandedBluetoothButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)expandedAirDropButtonViewController
{
  return self->_expandedAirDropButtonViewController;
}

- (void)setExpandedAirDropButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_expandedAirDropButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)expandedHotspotButtonViewController
{
  return self->_expandedHotspotButtonViewController;
}

- (void)setExpandedHotspotButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_expandedHotspotButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)expandedSatelliteButtonViewController
{
  return self->_expandedSatelliteButtonViewController;
}

- (void)setExpandedSatelliteButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_expandedSatelliteButtonViewController, a3);
}

- (CCUIConnectivityButtonViewController)expandedVPNButtonViewController
{
  return self->_expandedVPNButtonViewController;
}

- (void)setExpandedVPNButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_expandedVPNButtonViewController, a3);
}

- (OS_dispatch_queue)coreTelephonyQueue
{
  return self->_coreTelephonyQueue;
}

- (void)setCoreTelephonyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyQueue, a3);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_coreTelephonyQueue, 0);
  objc_storeStrong((id *)&self->_expandedVPNButtonViewController, 0);
  objc_storeStrong((id *)&self->_expandedSatelliteButtonViewController, 0);
  objc_storeStrong((id *)&self->_expandedHotspotButtonViewController, 0);
  objc_storeStrong((id *)&self->_expandedAirDropButtonViewController, 0);
  objc_storeStrong((id *)&self->_expandedBluetoothButtonViewController, 0);
  objc_storeStrong((id *)&self->_expandedWifiButtonViewController, 0);
  objc_storeStrong((id *)&self->_expandedCellularDataButtonViewController, 0);
  objc_storeStrong((id *)&self->_expandedAirplaneButtonViewController, 0);
  objc_storeStrong((id *)&self->_orderedExpandedButtonViewControllers, 0);
  objc_storeStrong((id *)&self->_vpnButtonViewController, 0);
  objc_storeStrong((id *)&self->_hotspotButtonViewController, 0);
  objc_storeStrong((id *)&self->_airDropButtonViewController, 0);
  objc_storeStrong((id *)&self->_bluetoothButtonViewController, 0);
  objc_storeStrong((id *)&self->_wifiButtonViewController, 0);
  objc_storeStrong((id *)&self->_cellularDataButtonViewController, 0);
  objc_storeStrong((id *)&self->_airplaneButtonViewController, 0);
  objc_storeStrong((id *)&self->_orderedButtonViewControllers, 0);
  objc_storeStrong((id *)&self->_backgroundPlatterView, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_contentMetrics, 0);
}

@end
