@implementation HACCContentViewController

- (HACCContentViewController)initWithContentModule:(unint64_t)a3 andDelegate:(id)a4
{
  id v6;
  HACCContentViewController *v7;
  HACCContentViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HACCContentModule *contentView;
  void *v14;
  void *v15;
  HACCContentModule *v16;
  void *v17;
  HACCContentModule *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HACCContentViewController;
  v7 = -[HACCContentViewController init](&v23, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_controlType = -[HACCContentViewController controlTypeForModule:](v7, "controlTypeForModule:", a3);
    -[HACCContentViewController view](v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    -[HACCContentViewController view](v8, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOpaque:", 1);

    -[HACCContentViewController contentViewForControlType:module:delegate:](v8, "contentViewForControlType:module:delegate:", v8->_controlType, a3, v6);
    v12 = objc_claimAutoreleasedReturnValue();
    contentView = v8->_contentView;
    v8->_contentView = (HACCContentModule *)v12;

    -[HACCContentViewController view](v8, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTag:", HUICCViewTagForModule(a3));

    -[HACCContentViewController view](v8, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v8->_contentView);

    v16 = v8->_contentView;
    -[HACCContentViewController _axIdentifierForModule:](v8, "_axIdentifierForModule:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCContentModule setAccessibilityIdentifier:](v16, "setAccessibilityIdentifier:", v17);

    v18 = v8->_contentView;
    -[HACCContentViewController view](v8, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    -[HACCContentModule setFrame:](v18, "setFrame:");

    -[HACCContentModule setDelegate:](v8->_contentView, "setDelegate:", v6);
    -[HACCContentModule setModule:](v8->_contentView, "setModule:", a3);
    -[HACCContentModule setAutoresizingMask:](v8->_contentView, "setAutoresizingMask:", 18);
    -[HACCContentModule updateValue](v8->_contentView, "updateValue");
    -[HACCContentViewController updateViewConstraints](v8, "updateViewConstraints");
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v8, sel__handleTapGestureRecognizer_);
    objc_msgSend(v20, "setDelegate:", v8);
    -[HACCContentViewController view](v8, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addGestureRecognizer:", v20);

    -[HACCContentViewController setTapRecognizer:](v8, "setTapRecognizer:", v20);
  }

  return v8;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HACCContentViewController;
  -[HACCContentViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HACCContentViewController _contentViewSubscribeListeners](self, "_contentViewSubscribeListeners");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HACCContentViewController;
  -[HACCContentViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[HACCContentViewController _contentViewUnsubscribeListeners](self, "_contentViewUnsubscribeListeners");
}

- (void)_contentViewSubscribeListeners
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[HACCContentModule subscribeListeners](self->_contentView, "subscribeListeners");
}

- (void)_contentViewUnsubscribeListeners
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[HACCContentModule unsubscribeListeners](self->_contentView, "unsubscribeListeners");
}

- (void)updateValue
{
  -[HACCContentModule updateValue](self->_contentView, "updateValue");
}

- (void)updateWithValue:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  if (-[HACCContentModule module](self->_contentView, "module") == 23
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = *MEMORY[0x24BE4BE28];
    v5 = v14;
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE4BE20]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE4BE30]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "unsignedIntegerValue");
    -[HACCContentModule updateViewsWithSlowLeq:fastLeq:andThreshold:](self->_contentView, "updateViewsWithSlowLeq:fastLeq:andThreshold:", v13, v8, v11);
  }
  else
  {
    -[HACCContentModule updateValue](self->_contentView, "updateValue");
  }

}

- (id)value
{
  return (id)-[HACCContentModule contentValue](self->_contentView, "contentValue");
}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  HACCContentModule *contentView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HACCContentViewController;
  -[HACCContentViewController updateViewConstraints](&v8, sel_updateViewConstraints);
  -[HACCContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConstraints:", v5);

  -[HACCContentModule setHidden:](self->_contentView, "setHidden:", 0);
  -[HACCContentModule updateConstraints](self->_contentView, "updateConstraints");
  contentView = self->_contentView;
  -[HACCContentViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[HACCContentModule setFrame:](contentView, "setFrame:");

}

- (unint64_t)controlTypeForModule:(unint64_t)a3
{
  if (a3 > 0x23)
    return 1;
  else
    return qword_21A98E470[a3];
}

- (id)contentViewForControlType:(unint64_t)a3 module:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  void *v9;
  HUICCMenuCheckmarkView *v10;
  HACCSlider *v11;
  __objc2_class *v12;
  id v13;
  __objc2_class *v14;
  HUICCMenuTextView *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  id location;

  v8 = a5;
  v9 = v8;
  switch(a3)
  {
    case 0uLL:
      v12 = HACCStatusView;
      goto LABEL_8;
    case 1uLL:
      v11 = -[HACCSlider initWithModule:andDelegate:]([HACCSlider alloc], "initWithModule:andDelegate:", a4, v8);
      goto LABEL_18;
    case 2uLL:
      v12 = HUICCBackgroundSoundsButton;
      goto LABEL_8;
    case 3uLL:
      if (objc_msgSend(v8, "shouldShowHeadphoneLevelUnavailable"))
      {
        v12 = HUIHeadphoneLevelUnavailableView;
LABEL_8:
        v13 = [v12 alloc];
        v11 = (HACCSlider *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      }
      else
      {
        v14 = HUIHeadphoneLevelView;
LABEL_17:
        v11 = (HACCSlider *)objc_alloc_init(v14);
      }
LABEL_18:
      v15 = (HUICCMenuTextView *)v11;
LABEL_19:

      return v15;
    case 4uLL:
      v14 = HACCLiveListenButton;
      goto LABEL_17;
    case 5uLL:
      v14 = HACCPMEToggle;
      goto LABEL_17;
    case 6uLL:
      v14 = HACCPSESettings;
      goto LABEL_17;
    case 7uLL:
    case 9uLL:
      v10 = [HUICCMenuCheckmarkView alloc];
      v11 = -[HUICCMenuCheckmarkView initWithFrame:andModule:](v10, "initWithFrame:andModule:", a4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      goto LABEL_18;
    case 8uLL:
      v14 = HACCSSLButton;
      goto LABEL_17;
    case 0xAuLL:
      v15 = -[HUICCMenuTextView initWithModule:andDelegate:]([HUICCMenuTextView alloc], "initWithModule:andDelegate:", a4, v8);
      objc_initWeak(&location, v15);
      objc_initWeak(&from, self);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __71__HACCContentViewController_contentViewForControlType_module_delegate___block_invoke;
      v17[3] = &unk_24DD61A08;
      objc_copyWeak(&v18, &from);
      objc_copyWeak(&v19, &location);
      -[HUICCMenuTextView setPresentVCBlock:](v15, "setPresentVCBlock:", v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      goto LABEL_19;
    case 0xBuLL:
      v11 = -[HUICCFooterView initWithModule:]([HUICCFooterView alloc], "initWithModule:", a4);
      goto LABEL_18;
    default:
      v15 = 0;
      goto LABEL_19;
  }
}

void __71__HACCContentViewController_contentViewForControlType_module_delegate___block_invoke(id *a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "willTransitionToExpandedContentMode:", 1);
  v4 = a1 + 4;
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v3, 1, 0);

  objc_msgSend(v3, "didTransitionToExpandedContentMode:", 1);
  a1 += 5;
  v6 = objc_loadWeakRetained(a1);
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateView");

  v10 = objc_loadWeakRetained(a1);
  objc_msgSend(v10, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(v4);
  objc_msgSend(v8, "viewController:didExpand:", v9, 1);

}

- (void)addExpandedView:(id)a3 shouldAlwaysExpand:(BOOL)a4
{
  _BOOL4 v4;
  HACCContentModule *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = self->_contentView;
    -[HACCContentModule addExpandedView:](v6, "addExpandedView:", v7);
    if (v4 && -[HACCContentModule supportsExpanding](v6, "supportsExpanding"))
    {
      -[HACCContentModule setIsExpanded:](v6, "setIsExpanded:", 1);
      -[HACCContentViewController setShouldAlwaysExpand:](self, "setShouldAlwaysExpand:", 1);
    }

  }
}

- (void)removeExpandedView:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[HACCContentModule removeExpandedView:](self->_contentView, "removeExpandedView:", v4);

}

- (void)_handleTapGestureRecognizer:(id)a3
{
  HACCContentModule *v4;
  id v5;

  v5 = a3;
  if ((!v5 || objc_msgSend(v5, "state") == 3)
    && !-[HACCContentViewController shouldAlwaysExpand](self, "shouldAlwaysExpand"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = self->_contentView;
      if (-[HACCContentModule supportsExpanding](v4, "supportsExpanding"))
        -[HACCContentModule setIsExpanded:](v4, "setIsExpanded:", -[HACCContentModule isExpanded](v4, "isExpanded") ^ 1);
      else
        -[HACCContentModule buttonTapped](v4, "buttonTapped");

    }
  }

}

- (id)_axIdentifierForModule:(unint64_t)a3
{
  if (a3 > 0x23)
    return 0;
  else
    return off_24DD61A28[a3];
}

- (double)preferredExpandedContentHeight
{
  return self->preferredExpandedContentHeight;
}

- (CGRect)collapsedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_collapsedFrame.origin.x;
  y = self->_collapsedFrame.origin.y;
  width = self->_collapsedFrame.size.width;
  height = self->_collapsedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCollapsedFrame:(CGRect)a3
{
  self->_collapsedFrame = a3;
}

- (HACCContentModule)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (CCUIContentModuleContentViewController)expandedViewController
{
  return self->_expandedViewController;
}

- (void)setExpandedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_expandedViewController, a3);
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapRecognizer, a3);
}

- (BOOL)shouldAlwaysExpand
{
  return self->_shouldAlwaysExpand;
}

- (void)setShouldAlwaysExpand:(BOOL)a3
{
  self->_shouldAlwaysExpand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_expandedViewController, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_detailTransitioningDelegate, 0);
}

@end
