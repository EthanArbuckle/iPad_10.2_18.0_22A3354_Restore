@implementation AMUIPosterCategorySwitcherItem

- (uint64_t)configuration
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

+ (id)itemWithConfiguration:(void *)a3 delegate:
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a2;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithConfiguration:delegate:", v5, v4);

  return v6;
}

- (void)setConfiguration:(uint64_t)a1
{
  id v4;
  char v5;
  id v6;

  v4 = a2;
  if (a1)
  {
    v6 = v4;
    v5 = BSEqualObjects();
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)(a1 + 88), a2);
      objc_msgSend(*(id *)(a1 + 96), "updatePosterConfiguration:withAnimationSettings:", *(_QWORD *)(a1 + 88), 0);
      v4 = v6;
    }
  }

}

- (_QWORD)posterViewController
{
  _QWORD *v1;
  void *v2;
  AMUIPosterViewController *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[12];
    if (!v2)
    {
      v3 = objc_alloc_init(AMUIPosterViewController);
      v4 = (void *)v1[12];
      v1[12] = v3;

      objc_msgSend((id)v1[12], "setDelegate:", v1);
      objc_msgSend((id)v1[12], "setChromeOrientationPolicy:", 2);
      objc_msgSend((id)v1[12], "updatePosterConfiguration:withAnimationSettings:", v1[11], 0);
      objc_msgSend(v1, "_updateContentMode");
      v2 = (void *)v1[12];
    }
    a1 = v2;
  }
  return a1;
}

- (void)noteTransitionDidBegin
{
  id v2;

  if (a1)
  {
    objc_msgSend(a1[1], "window");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_updateLabelConstraintsForInterfaceOrientation:", objc_msgSend(v2, "_windowInterfaceOrientation"));

  }
}

- (void)setTitleLabelVisible:(char)a3 onTopEdge:
{
  if (a1)
  {
    *((_BYTE *)a1 + 80) = (_BYTE)a2;
    *((_BYTE *)a1 + 81) = a3;
    return (void *)objc_msgSend(a1, "_updateTitleLabelVisibility");
  }
  return a1;
}

- (id)titleLabelView
{
  id *v1;
  id v2;

  if (a1)
  {
    v1 = a1;
    v2 = (id)objc_msgSend(a1, "itemView");
    a1 = (id *)v1[13];
  }
  return a1;
}

- (id)posterView
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[AMUIPosterCategorySwitcherItem posterViewController](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (AMUIPosterCategorySwitcherItem)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  AMUIPosterCategorySwitcherItem *v9;
  AMUIPosterCategorySwitcherItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMUIPosterCategorySwitcherItem;
  v9 = -[AMUIPosterCategorySwitcherItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    v10->_appearState = 0;
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[AMUIPosterCategorySwitcherItem invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterCategorySwitcherItem;
  -[AMUIPosterCategorySwitcherItem dealloc](&v3, sel_dealloc);
}

- (NSObject)identifier
{
  if (self)
    self = (AMUIPosterCategorySwitcherItem *)self->_configuration;
  return -[AMUIPosterCategorySwitcherItem serverUUID](self, "serverUUID");
}

- (UIView)itemView
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *itemView;
  UIView *v7;
  id v8;
  UIView *v9;
  void *v10;
  OS_dispatch_queue *Serial;
  OS_dispatch_queue *loadingQueue;
  PRSPosterConfiguration *v13;
  id WeakRetained;
  void *v15;
  char v16;
  NSObject *v17;
  PRSPosterConfiguration *v18;
  void *v19;
  void *v20;
  UIView *v21;
  UIView *v22;
  _QWORD block[4];
  PRSPosterConfiguration *v25;
  UIView *v26;
  AMUIPosterCategorySwitcherItem *v27;
  char v28;

  -[AMUIPosterCategorySwitcherItem posterViewController](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_itemView)
    goto LABEL_5;
  objc_msgSend(v4, "superview");
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  itemView = self->_itemView;

  if (v5 != itemView)
  {
    -[UIView bounds](self->_itemView, "bounds");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v4, "setAutoresizingMask:", 18);
    -[UIView addSubview:](self->_itemView, "addSubview:", v4);
  }
  v7 = self->_itemView;
  if (!v7)
  {
LABEL_5:
    v8 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend(v4, "bounds");
    v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
    objc_msgSend(v4, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v9, "addSubview:", v4);
    if (+[AMUIDataLayerViewController dataLayoutForConfiguration:](AMUIDataLayerViewController, "dataLayoutForConfiguration:", self->_configuration) == 1)
    {
      if (!self->_loadingQueue)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AMUIPosterCategoryItem-%p"), self);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        Serial = (OS_dispatch_queue *)BSDispatchQueueCreateSerial();
        loadingQueue = self->_loadingQueue;
        self->_loadingQueue = Serial;

      }
      v13 = self->_configuration;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "posterCategorySwitcherItemPrototypeSettings:", self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "useFallbackTitleAndSymbol");
      v17 = self->_loadingQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __42__AMUIPosterCategorySwitcherItem_itemView__block_invoke;
      block[3] = &unk_2507640F8;
      v25 = v13;
      v28 = v16;
      v26 = v9;
      v27 = self;
      v18 = v13;
      dispatch_async(v17, block);

    }
    objc_msgSend(v4, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsGroupOpacity:", 1);

    -[UIView layer](v9, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAllowsGroupOpacity:", 1);

    v21 = self->_itemView;
    self->_itemView = v9;

    v7 = self->_itemView;
  }
  v22 = v7;

  return v22;
}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 14);
  return WeakRetained;
}

void __42__AMUIPosterCategorySwitcherItem_itemView__block_invoke(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v14 = 0;
  objc_msgSend(v2, "amui_getConfiguredDisplayNameWithError:", &v14);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v13 = 0;
  v5 = v14;
  objc_msgSend(v4, "pr_loadAmbientConfigurationWithError:", &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;

  objc_msgSend(v6, "displayNameSystemSymbolName");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v3)
      goto LABEL_3;
    goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 56))
    v8 = CFSTR("questionmark.circle.fill");
  else
    v8 = 0;
  if (!v3)
  {
LABEL_8:
    if (*(_BYTE *)(a1 + 56))
      v3 = CFSTR("Unknown");
    else
      v3 = 0;
  }
LABEL_3:
  v11 = v3;
  v12 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v8;
  BSDispatchMain();

}

void __42__AMUIPosterCategorySwitcherItem_itemView__block_invoke_2(uint64_t a1)
{
  AMUIPhotosLabelView *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  AMUIPhotosLabelView *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id *v29;
  void *v30;
  id v31;

  if (*(_QWORD *)(a1 + 32))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v2 = -[AMUIPhotosLabelView initWithSymbolName:title:]([AMUIPhotosLabelView alloc], "initWithSymbolName:title:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      -[AMUIPhotosLabelView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[AMUIPhotosLabelView layer](v2, "layer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAllowsGroupOpacity:", 1);

      objc_msgSend(*(id *)(a1 + 48), "addSubview:", v2);
      -[AMUIPhotosLabelView setHidden:](v2, "setHidden:", 1);
      v4 = *(_QWORD *)(a1 + 56);
      v5 = *(void **)(v4 + 104);
      *(_QWORD *)(v4 + 104) = v2;
      v6 = v2;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 104), "topAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 104), "preferredTopMargin");
      objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 56);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 104), "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 104), "preferredBottomMargin");
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 56);
      v17 = *(void **)(v16 + 48);
      *(_QWORD *)(v16 + 48) = v15;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 104), "leftAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "leftAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 104), "preferredLeadingMargin");
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 56);
      v22 = *(void **)(v21 + 56);
      *(_QWORD *)(v21 + 56) = v20;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 104), "rightAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "rightAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 104), "preferredLeadingMargin");
      objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -v25);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(a1 + 56);
      v28 = *(void **)(v27 + 64);
      *(_QWORD *)(v27 + 64) = v26;

      objc_msgSend(*(id *)(a1 + 56), "_updateTitleLabelVisibility");
      v29 = *(id **)(a1 + 56);
      objc_msgSend(v29[13], "window");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_updateLabelConstraintsForInterfaceOrientation:", objc_msgSend(v30, "_windowInterfaceOrientation"));

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 56), sel__noteWindowWillRotate_, *MEMORY[0x24BDF8030], 0);

    }
  }
}

- (void)invalidate
{
  AMUIPosterViewController *posterViewController;

  -[AMUIPosterViewController invalidate](self->_posterViewController, "invalidate");
  posterViewController = self->_posterViewController;
  self->_posterViewController = 0;

}

- (void)switcherItemWillAppear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  self->_appearState = 1;
  v4 = a3;
  -[AMUIPosterCategorySwitcherItem itemView](self, "itemView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayCornerRadius");
  objc_msgSend(v7, "_setContinuousCornerRadius:");

  objc_msgSend(v7, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIPosterCategorySwitcherItem _updateLabelConstraintsForInterfaceOrientation:](self, "_updateLabelConstraintsForInterfaceOrientation:", objc_msgSend(v6, "_windowInterfaceOrientation"));
  -[AMUIPosterCategorySwitcherItem _updateClipping](self, "_updateClipping");
  -[AMUIPosterCategorySwitcherItem _updateContentMode](self, "_updateContentMode");

}

- (void)switcherItemDidAppear:(id)a3
{
  void *v4;

  self->_appearState = 2;
  -[AMUIPosterCategorySwitcherItem posterViewController](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppearanceTransitionProgress:", 1.0);

  -[AMUIPosterCategorySwitcherItem _updateClipping](self, "_updateClipping");
  -[AMUIPosterCategorySwitcherItem _updateContentMode](self, "_updateContentMode");
}

- (void)switcherItemWillDisappear:(id)a3
{
  self->_appearState = 3;
  -[AMUIPosterCategorySwitcherItem _updateClipping](self, "_updateClipping", a3);
  -[AMUIPosterCategorySwitcherItem _updateContentMode](self, "_updateContentMode");
}

- (void)switcherItemDidDisappear:(id)a3
{
  self->_appearState = 0;
  -[AMUIPosterCategorySwitcherItem _updateClipping](self, "_updateClipping", a3);
  -[AMUIPosterCategorySwitcherItem _updateContentMode](self, "_updateContentMode");
}

- (void)switcher:(id)a3 willMoveToWindow:(id)a4
{
  -[AMUIPosterCategorySwitcherItem _updateLabelConstraintsForInterfaceOrientation:](self, "_updateLabelConstraintsForInterfaceOrientation:", objc_msgSend(a4, "_windowInterfaceOrientation", a3));
}

- (void)switcher:(id)a3 didMoveToWindow:(id)a4
{
  -[AMUIPosterCategorySwitcherItem _updateLabelConstraintsForInterfaceOrientation:](self, "_updateLabelConstraintsForInterfaceOrientation:", objc_msgSend(a4, "_windowInterfaceOrientation", a3));
}

- (void)switcher:(id)a3 updateItemForPresentationProgress:(double)a4
{
  void *v6;

  self->_presentationProgress = a4;
  -[AMUIPosterCategorySwitcherItem posterViewController](self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAppearanceTransitionProgress:", a4);

  -[AMUIPosterCategorySwitcherItem _updateContentMode](self, "_updateContentMode");
}

- (void)posterViewController:(id)a3 setChromeVisibility:(BOOL)a4 withAnimationSettings:(id)a5 animationFence:(id)a6
{
  _BOOL8 v7;
  id v9;
  id WeakRetained;
  id v11;

  v7 = a4;
  v11 = a5;
  v9 = a6;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "posterCategorySwitcherItem:setChromeVisibility:withAnimationSettings:animationFence:", self, v7, v11, v9);

}

- (id)posterViewControllerRequestExtensionInstanceIdentifier:(id)a3
{
  id WeakRetained;
  void *v5;
  NSUUID *lastInstanceIdentifier;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "posterCategorySwitcherItemRequestInstanceIdentifier:preferring:", self, self->_lastInstanceIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  lastInstanceIdentifier = self->_lastInstanceIdentifier;
  self->_lastInstanceIdentifier = 0;

  return v5;
}

- (void)posterViewController:(id)a3 relinquishExtensionInstanceIdentifier:(id)a4
{
  id v6;
  id WeakRetained;

  objc_storeStrong((id *)&self->_lastInstanceIdentifier, a4);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "posterCategorySwitcherItem:relinquishInstanceIdentifier:", self, v6);

}

- (BOOL)posterViewControllerIsAuthenticated:(id)a3
{
  id WeakRetained;
  char v5;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  v5 = objc_msgSend(WeakRetained, "posterCategorySwitcherItemIsAuthenticated:", self);

  return v5;
}

- (void)posterViewController:(id)a3 didRequestInlineAuthenticationWithUnlockDestination:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "posterCategorySwitcherItem:didRequestInlineAuthenticationWithUnlockDestination:", self, v6);

}

- (BOOL)posterViewControllerHasInlineAuthenticated:(id)a3
{
  id WeakRetained;
  char v5;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  v5 = objc_msgSend(WeakRetained, "posterCategorySwitcherItemHasInlineAuthenticated:", self);

  return v5;
}

- (void)_updateClipping
{
  _BOOL8 v2;
  id v3;

  v2 = (self->_appearState & 0xFFFFFFFD) == 1;
  -[AMUIPosterCategorySwitcherItem itemView](self, "itemView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", v2);

}

- (void)_updateTitleLabelVisibility
{
  id v3;

  -[AMUIPosterCategorySwitcherItem titleLabelView]((id *)&self->super.isa);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", !self->_titleLabelVisible);
  -[NSLayoutConstraint setActive:](self->_labelTopConstraint, "setActive:", self->_titleLabelOnTopEdge);
  -[NSLayoutConstraint setActive:](self->_labelBottomConstraint, "setActive:", !self->_titleLabelOnTopEdge);

}

- (void)_updateContentMode
{
  -[AMUIPosterViewController setContentMode:](self->_posterViewController, "setContentMode:", self->_appearState != 0);
}

- (void)_updateLabelConstraintsForInterfaceOrientation:(int64_t)a3
{
  _BOOL8 v4;

  v4 = a3 == 3;
  -[NSLayoutConstraint setActive:](self->_labelLeftConstraint, "setActive:", a3 != 3);
  -[NSLayoutConstraint setActive:](self->_labelRightConstraint, "setActive:", v4);
}

- (void)_noteWindowWillRotate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView window](self->_itemView, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(v13, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDF8018]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    v9 = v7;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    v12 = objc_msgSend(v11, "integerValue");
    -[AMUIPosterCategorySwitcherItem _updateLabelConstraintsForInterfaceOrientation:](self, "_updateLabelConstraintsForInterfaceOrientation:", v12);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLabelView, 0);
  objc_storeStrong((id *)&self->_posterViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_labelRightConstraint, 0);
  objc_storeStrong((id *)&self->_labelLeftConstraint, 0);
  objc_storeStrong((id *)&self->_labelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_labelTopConstraint, 0);
  objc_storeStrong((id *)&self->_lastInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end
