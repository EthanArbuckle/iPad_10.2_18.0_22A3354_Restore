@implementation AMSUIMessageView

- (AMSUIMessageView)initWithStyle:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  AMSUIMessageView *v8;
  AMSUIMessageView *v9;
  AMSUICommonButton *v10;
  AMSUICommonButton *debugButton;
  AMSUICommonVisualEffectView *v12;
  AMSUICommonVisualEffectView *backgroundVisualEffectView;
  uint64_t v14;
  UIScrollView *containerView;
  AMSUICommonImageView *v16;
  UIImageView *backgroundImageView;
  AMSUICommonImageView *v18;
  AMSUICommonImageView *imageView;
  uint64_t v20;
  UIView *imageContainerView;
  NSArray *separatorViews;
  AMSUIMessageViewLayoutContext *v23;
  AMSUIMessageViewLayoutContext *layoutContext;
  AMSUICommonTextView *v25;
  AMSUICommonTextView *textView;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)AMSUIMessageView;
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = -[AMSUICommonView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x24BDBF090], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[AMSUIMessageView setPreservesSuperviewLayoutMargins:](v8, "setPreservesSuperviewLayoutMargins:", 0);
    v9->_imageStyle = 0;
    v9->_style = a3;
    if (os_variant_has_internal_content()
      && (objc_msgSend(MEMORY[0x24BE08418], "isRunningUnitTests") & 1) == 0)
    {
      v10 = -[AMSUICommonButton initWithFrame:]([AMSUICommonButton alloc], "initWithFrame:", v4, v5, v6, v7);
      debugButton = v9->_debugButton;
      v9->_debugButton = v10;

    }
    v12 = objc_alloc_init(AMSUICommonVisualEffectView);
    backgroundVisualEffectView = v9->_backgroundVisualEffectView;
    v9->_backgroundVisualEffectView = v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD918]), "initWithFrame:", v4, v5, v6, v7);
    containerView = v9->_containerView;
    v9->_containerView = (UIScrollView *)v14;

    v16 = -[AMSUICommonImageView initWithFrame:]([AMSUICommonImageView alloc], "initWithFrame:", v4, v5, v6, v7);
    backgroundImageView = v9->_backgroundImageView;
    v9->_backgroundImageView = &v16->super;

    v18 = -[AMSUICommonImageView initWithFrame:]([AMSUICommonImageView alloc], "initWithFrame:", v4, v5, v6, v7);
    imageView = v9->_imageView;
    v9->_imageView = v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v4, v5, v6, v7);
    imageContainerView = v9->_imageContainerView;
    v9->_imageContainerView = (UIView *)v20;

    v9->_isImageSymbolImage = 0;
    separatorViews = v9->_separatorViews;
    v9->_separatorViews = (NSArray *)MEMORY[0x24BDBD1A8];

    v23 = -[AMSUIMessageViewLayoutContext initWithMessageView:]([AMSUIMessageViewLayoutContext alloc], "initWithMessageView:", v9);
    layoutContext = v9->_layoutContext;
    v9->_layoutContext = v23;

    v25 = -[AMSUICommonTextView initWithFrame:]([AMSUICommonTextView alloc], "initWithFrame:", v4, v5, v6, v7);
    textView = v9->_textView;
    v9->_textView = v25;

    -[AMSUIMessageView _setupInitialLayout](v9, "_setupInitialLayout");
    -[AMSUIMessageView _setupDefaults](v9, "_setupDefaults");
    -[AMSUIMessageView _startObservations](v9, "_startObservations");
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[AMSUIMessageView _endObservations](self, "_endObservations");
  v3.receiver = self;
  v3.super_class = (Class)AMSUIMessageView;
  -[AMSUIMessageView dealloc](&v3, sel_dealloc);
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIMessageView;
  -[AMSUIMessageView didMoveToSuperview](&v6, sel_didMoveToSuperview);
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AMSUIMessageView style](self, "style"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ didMoveToSuperview"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView _recordNewsDebugEventWithCategory:](self, "_recordNewsDebugEventWithCategory:", v5);

}

- (void)_recordNewsDebugEventWithCategory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_variant_has_internal_content())
  {
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.news"));

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_opt_class();
        AMSLogKey();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v10;
        v17 = 2114;
        v18 = v11;
        _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Recording debug event for news", (uint8_t *)&v15, 0x16u);

      }
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08288]), "initWithSubsystem:category:error:", CFSTR("MessagingUI"), v3, 0);
      objc_msgSend(v12, "setClientApp:", v5);
      objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", CFSTR("AppleNews"), CFSTR("1"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE08260], "internalInstanceUsingBag:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "enqueueEvent:", v12);

    }
  }

}

- (void)_setupDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;

  -[AMSUIMessageView containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);

  -[AMSUIMessageView containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentInsetAdjustmentBehavior:", 2);

  -[AMSUIMessageView _setBackground](self, "_setBackground");
  -[AMSUIMessageView _setupImageViewDefault](self, "_setupImageViewDefault");
  -[AMSUIMessageView _setupImageView](self, "_setupImageView");
  -[AMSUIMessageView _setAccessibilityIdentifier](self, "_setAccessibilityIdentifier");
  -[AMSUIMessageView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataDetectorTypes:", 0);

  -[AMSUIMessageView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEditable:", 0);

  -[AMSUIMessageView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollEnabled:", 0);

  -[AMSUIMessageView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowsHorizontalScrollIndicator:", 0);

  -[AMSUIMessageView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowsVerticalScrollIndicator:", 0);

  -[AMSUIMessageView textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v11);

  -[AMSUIMessageView textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLineFragmentPadding:", 0.0);

  -[AMSUIMessageView textView](self, "textView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLineBreakMode:", 4);

  -[AMSUIMessageView textView](self, "textView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUserInteractionEnabled:", 0);

  -[AMSUIMessageView textView](self, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "textContainerInset");
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[AMSUIMessageView textView](self, "textView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTextContainerInset:", v20, 1.0, v22, v24);

  -[AMSUIMessageView backgroundImageView](self, "backgroundImageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClipsToBounds:", 1);

  +[AMSUIAppearance _defaultSeparatorColor](AMSUIAppearance, "_defaultSeparatorColor");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView setSeparatorColor:](self, "setSeparatorColor:", v27);

}

- (void)_setupInitialLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[AMSUIMessageView imageContainerView](self, "imageContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[AMSUIMessageView containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView imageContainerView](self, "imageContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[AMSUIMessageView containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[AMSUIMessageView backgroundImageView](self, "backgroundImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView addSubview:](self, "addSubview:", v9);

  -[AMSUIMessageView backgroundVisualEffectView](self, "backgroundVisualEffectView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView containerView](self, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[AMSUIMessageView backgroundVisualEffectView](self, "backgroundVisualEffectView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView addSubview:](self, "addSubview:", v13);

}

- (void)setupDebugButtonWithTarget:(id)a3 action:(SEL)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v6 = (void *)MEMORY[0x24BEBD660];
  v7 = a3;
  objc_msgSend(v6, "configurationWithPointSize:", 14.0);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView debugButton](self, "debugButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("ant.fill"), v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:forState:", v9, 0);

  -[AMSUIMessageView debugButton](self, "debugButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", 0, 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView debugButton](self, "debugButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v11);

  -[AMSUIMessageView debugButton](self, "debugButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeToFit");

  -[AMSUIMessageView debugButton](self, "debugButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[AMSUIMessageView debugButton](self, "debugButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20 + 8.0, v22 + 8.0);

  -[AMSUIMessageView debugButton](self, "debugButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setContentHorizontalAlignment:", 1);

  -[AMSUIMessageView debugButton](self, "debugButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setContentVerticalAlignment:", 1);

  -[AMSUIMessageView debugButton](self, "debugButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addTarget:action:forControlEvents:", v7, a4, 64);

  -[AMSUIMessageView debugButton](self, "debugButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  v29 = v28;
  v31 = v30;
  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDebugButtonSize:", v29, v31);

  -[AMSUIMessageView containerView](self, "containerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView debugButton](self, "debugButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v34);

}

- (void)_setShadow
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  if (-[AMSUIMessageView style](self, "style") == 4)
  {
    -[AMSUIMessageView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceStyle");

    if (v4 == 2)
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray4Color");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");
    -[AMSUIMessageView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShadowColor:", v6);

    -[AMSUIMessageView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayScale");
    v10 = 100.0 / v9;
    -[AMSUIMessageView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowRadius:", v10);

    -[AMSUIMessageView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1050253722;
    objc_msgSend(v12, "setShadowOpacity:", v13);

    -[AMSUIMessageView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowOffset:", 0.0, 10.0);

    -[AMSUIMessageView layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMasksToBounds:", 0);

    -[AMSUIMessageView layer](self, "layer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShadowPath:", 0);

  }
}

- (void)_setupMICAAssetWithData:(id)a3 originalURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  MicaPlayer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v7 = a3;
  -[AMSUIMessageView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v10 = v9;

  v11 = -[MicaPlayer initWithData:url:retinaScale:]([MicaPlayer alloc], "initWithData:url:retinaScale:", v7, v6, v10);
  -[AMSUIMessageView setMicaPlayer:](self, "setMicaPlayer:", v11);

  -[AMSUIMessageView iconColor](self, "iconColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AMSUIMessageView iconColor](self, "iconColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIMessageView _setMICAPlayerTintColor:](self, "_setMICAPlayerTintColor:", v13);

  }
  -[AMSUIMessageView micaPlayer](self, "micaPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView imageContainerView](self, "imageContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addToLayer:onTop:gravity:", v16, 0, *MEMORY[0x24BDE5C98]);

  -[AMSUIMessageView setNeedsLayout](self, "setNeedsLayout");
  -[AMSUIMessageView micaPlayer](self, "micaPlayer");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLoopDuringPlayback:", 1);

}

- (void)_setBackground
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  id v11;

  -[AMSUIMessageView maskShapeView](self, "maskShapeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_4;
  if (-[AMSUIMessageView style](self, "style"))
  {
    -[AMSUIMessageView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 10.0);
    -[AMSUIMessageView _continuousCornerRadius](self, "_continuousCornerRadius");
    v5 = v4;
    -[AMSUIMessageView backgroundImageView](self, "backgroundImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setContinuousCornerRadius:", v5);

    -[AMSUIMessageView _continuousCornerRadius](self, "_continuousCornerRadius");
    v8 = v7;
    -[AMSUIMessageView backgroundVisualEffectView](self, "backgroundVisualEffectView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setContinuousCornerRadius:", v8);
LABEL_4:

  }
  v9 = -[AMSUIMessageView style](self, "style");
  -[AMSUIMessageView traitCollection](self, "traitCollection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSUIAppearance _defaultBackgroundColorForStyle:withTraitCollection:](AMSUIAppearance, "_defaultBackgroundColorForStyle:withTraitCollection:", v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView setBackgroundColor:](self, "setBackgroundColor:", v10);

}

- (void)_setupImageView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  id v71;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView imageContainerView](self, "imageContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  if (-[AMSUIMessageView isImageSymbolImage](self, "isImageSymbolImage")
    || (-[AMSUIMessageView imageView](self, "imageView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "image"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isSymbolImage"),
        v6,
        v5,
        v7))
  {
    -[AMSUIMessageView imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 4;
  }
  else
  {
    -[AMSUIMessageView imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1;
  }
  objc_msgSend(v8, "setContentMode:", v10);

  if (-[AMSUIMessageView style](self, "style"))
  {
    if (-[AMSUIMessageView style](self, "style") == 4)
    {
      -[AMSUIMessageView imageView](self, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_setContinuousCornerRadius:", 6.0);

      if (-[AMSUIMessageView isImageSymbolImage](self, "isImageSymbolImage")
        || (-[AMSUIMessageView imageView](self, "imageView"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v12, "image"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "isSymbolImage"),
            v13,
            v12,
            (v14 & 1) != 0))
      {
        -[AMSUIMessageView imageView](self, "imageView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBorderWidth:", 0.0);

        -[AMSUIMessageView imageContainerView](self, "imageContainerView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setShadowColor:", 0);

        -[AMSUIMessageView imageContainerView](self, "imageContainerView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v21) = 0;
        objc_msgSend(v20, "setShadowOpacity:", v21);

        -[AMSUIMessageView imageContainerView](self, "imageContainerView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "layer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setShadowPath:", 0);
      }
      else
      {
        -[AMSUIMessageView traitCollection](self, "traitCollection");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "userInterfaceStyle");

        if (v29 == 2)
          objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
        else
          objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "colorWithAlphaComponent:", 0.1);
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v31 = objc_msgSend(v30, "CGColor");
        -[AMSUIMessageView imageView](self, "imageView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "layer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setBorderColor:", v31);

        -[AMSUIMessageView imageView](self, "imageView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "layer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setBorderWidth:", 0.5);

        objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v37 = objc_msgSend(v36, "CGColor");
        -[AMSUIMessageView imageContainerView](self, "imageContainerView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "layer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setShadowColor:", v37);

        -[AMSUIMessageView traitCollection](self, "traitCollection");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "displayScale");
        v42 = 5.0 / v41;
        -[AMSUIMessageView imageContainerView](self, "imageContainerView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "layer");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setShadowRadius:", v42);

        -[AMSUIMessageView imageContainerView](self, "imageContainerView");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "layer");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setShadowOffset:", 0.0, 2.0);

        -[AMSUIMessageView imageContainerView](self, "imageContainerView");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "layer");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v49) = 1050253722;
        objc_msgSend(v48, "setShadowOpacity:", v49);

        -[AMSUIMessageView imageContainerView](self, "imageContainerView");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "layer");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setMasksToBounds:", 0);

        -[AMSUIMessageView imageContainerView](self, "imageContainerView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "layer");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setShadowPath:", 0);

      }
    }
    else
    {
      if (-[AMSUIMessageView style](self, "style") == 5)
      {
        -[AMSUIMessageView imageView](self, "imageView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v24;
        v25 = 4.0;
      }
      else
      {
        if (-[AMSUIMessageView imageStyle](self, "imageStyle") != 2)
          goto LABEL_24;
        -[AMSUIMessageView traitCollection](self, "traitCollection");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "userInterfaceIdiom");

        -[AMSUIMessageView imageView](self, "imageView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v24;
        if (v27 == 5)
          v25 = 4.0;
        else
          v25 = 6.0;
      }
      objc_msgSend(v24, "_setContinuousCornerRadius:", v25);
    }
  }
  else
  {
    -[AMSUIMessageView imageView](self, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentMode:", 4);
  }

LABEL_24:
  if (!-[AMSUIMessageView style](self, "style"))
  {
    -[AMSUIMessageView imageView](self, "imageView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "_setOverrideUserInterfaceRenderingMode:", 1);

  }
  -[AMSUIMessageView imageView](self, "imageView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "layer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setMasksToBounds:", 1);

  -[AMSUIMessageView imageView](self, "imageView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "image");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    -[AMSUIMessageView imageView](self, "imageView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "image");
    v71 = (id)objc_claimAutoreleasedReturnValue();

    -[AMSUIMessageView imageView](self, "imageView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "image");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "size");
    v62 = v61;
    v64 = v63;

    -[AMSUIMessageView imageView](self, "imageView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "frame");
    v67 = v66;
    v69 = v68;

    if (v62 / v64 * v69 > v67)
    {
      -[AMSUIMessageView imageView](self, "imageView");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setContentMode:", 1);

    }
  }
}

- (void)_setupImageViewDefault
{
  void *v3;
  id v4;

  +[AMSUIAppearance _defaultImageViewColorForStyle:](AMSUIAppearance, "_defaultImageViewColorForStyle:", -[AMSUIMessageView style](self, "style"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AMSUIMessageView imageView](self, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTintColor:", v4);

  }
}

- (void)_setAccessibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView accessoryView](self, "accessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIMessageView accessoryView](self, "accessoryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[AMSUIMessageView accessorySecondaryView](self, "accessorySecondaryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSUIMessageView accessorySecondaryView](self, "accessorySecondaryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[AMSUIMessageView footerButtonViews](self, "footerButtonViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSUIMessageView footerButtonViews](self, "footerButtonViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "image");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[AMSUIMessageView imageView](self, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accessibilityLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_11;
    -[AMSUIMessageView imageView](self, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v16);

  }
LABEL_11:
  -[AMSUIMessageView textView](self, "textView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "hasText"))
  {
    -[AMSUIMessageView textView](self, "textView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accessibilityLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_15;
    -[AMSUIMessageView textView](self, "textView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessibilityLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v20);

  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24CB5A078);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v22 = v10;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v39;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v26);
        if (objc_msgSend(v21, "length"))
          objc_msgSend(v21, "appendString:", CFSTR(", "));
        objc_msgSend(v21, "appendFormat:", CFSTR("%@"), v27);
        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v24);
  }

  if (objc_msgSend(v21, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIMessageView setAccessibilityLabel:](self, "setAccessibilityLabel:", v28);

  }
  else
  {
    -[AMSUIMessageView setAccessibilityLabel:](self, "setAccessibilityLabel:", 0);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v29 = v3;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v35;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v33++), "setIsAccessibilityElement:", 1);
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v31);
  }

  -[AMSUIMessageView setAms_accessibilitySupplementaryFooterViews:](self, "setAms_accessibilitySupplementaryFooterViews:", v29);
  -[AMSUIMessageView setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);

}

- (void)_setMICAPlayerTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  id v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AMSUIMessageView micaPlayer](self, "micaPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUIMessageView micaPlayer](self, "micaPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "publishedObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[AMSUIMessageView micaPlayer](self, "micaPlayer", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "publishedObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            v15 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v16 = v15;
            else
              v16 = 0;

            if (objc_msgSend(v16, "fillColor") && CGColorGetAlpha((CGColorRef)objc_msgSend(v16, "fillColor")) > 0.0)
              objc_msgSend(v16, "setFillColor:", objc_msgSend(objc_retainAutorelease(v4), "CGColor"));
            if (objc_msgSend(v16, "strokeColor") && CGColorGetAlpha((CGColorRef)objc_msgSend(v16, "strokeColor")) > 0.0)
              objc_msgSend(v16, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(v4), "CGColor"));

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v12);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v24 = objc_opt_class();
        _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: No published objects to tint", buf, 0xCu);
      }

    }
  }

}

- (void)_setAccessibilityIdentifier
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  id v6;

  v3 = -[AMSUIMessageView style](self, "style");
  if (v3 > 5)
    v4 = CFSTR("bubbleTip");
  else
    v4 = off_24CB50190[v3];
  -[AMSUIMessageView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v4);
  -[AMSUIMessageView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("primaryImageView"));

  -[AMSUIMessageView textView](self, "textView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("textView"));

}

- (void)_setTextViewText
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  -[AMSUIMessageView title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[AMSUIMessageView message](self, "message");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v5;

  -[AMSUIMessageView title](self, "title");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[AMSUIMessageView message](self, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_msgSend(v14, "mutableCopy");
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("\n"));
      objc_msgSend(v9, "appendAttributedString:", v10);

      -[AMSUIMessageView message](self, "message");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendAttributedString:", v11);

      v12 = objc_alloc_init(MEMORY[0x24BEBB490]);
      -[AMSUIMessageView _textViewParagraphSpacingBefore](self, "_textViewParagraphSpacingBefore");
      objc_msgSend(v12, "setParagraphSpacingBefore:");
      objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x24BEBB3A8], v12, 0, objc_msgSend(v9, "length"));

      v14 = v9;
    }
  }
  -[AMSUIMessageView textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttributedText:", v14);

}

- (void)setAccessoryViewForDialogAction:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  AMSUIMessageButton *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[AMSUIMessageButton initWithDialogAction:messageStyle:]([AMSUIMessageButton alloc], "initWithDialogAction:messageStyle:", v9, -[AMSUIMessageView style](self, "style"));

  -[AMSUIMessageButton addTarget:action:forControlEvents:](v10, "addTarget:action:forControlEvents:", v8, a5, 64);
  -[AMSUIMessageView setAccessoryView:](self, "setAccessoryView:", v10);

}

- (void)setAccessorySecondaryViewForDialogAction:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  AMSUIMessageButton *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[AMSUIMessageButton initWithDialogAction:messageStyle:]([AMSUIMessageButton alloc], "initWithDialogAction:messageStyle:", v9, -[AMSUIMessageView style](self, "style"));

  -[AMSUIMessageButton addTarget:action:forControlEvents:](v10, "addTarget:action:forControlEvents:", v8, a5, 64);
  -[AMSUIMessageView setAccessorySecondaryView:](self, "setAccessorySecondaryView:", v10);

}

- (void)setBodyDialogAction:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v9;
  id v10;
  id v11;
  id v12;

  objc_storeStrong((id *)&self->_bodyAction, a3);
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc(MEMORY[0x24BEBDA20]);

  v12 = (id)objc_msgSend(v11, "initWithTarget:action:", v10, a5);
  -[AMSUIMessageView addGestureRecognizer:](self, "addGestureRecognizer:", v12);

}

- (void)setFooterForDialogActions:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__AMSUIMessageView_setFooterForDialogActions_target_action___block_invoke;
  v11[3] = &unk_24CB50148;
  v11[4] = self;
  v12 = v8;
  v13 = a5;
  v9 = v8;
  objc_msgSend(a3, "ams_mapWithTransform:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView setFooterButtonViews:](self, "setFooterButtonViews:", v10);

}

AMSUIMessageButton *__60__AMSUIMessageView_setFooterForDialogActions_target_action___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSUIMessageButton *v4;

  v3 = a2;
  v4 = -[AMSUIMessageButton initWithDialogAction:messageStyle:]([AMSUIMessageButton alloc], "initWithDialogAction:messageStyle:", v3, objc_msgSend(*(id *)(a1 + 32), "style"));

  -[AMSUIMessageButton setFooterStyle](v4, "setFooterStyle");
  -[AMSUIMessageButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 64);
  return v4;
}

- (void)setupBubbleArrowMaskView
{
  void *v3;
  AMSUIPopoverShapeLayerView *v4;
  AMSUIPopoverShapeLayerView *v5;

  -[AMSUIMessageView maskShapeView](self, "maskShapeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [AMSUIPopoverShapeLayerView alloc];
    v5 = -[AMSUIPopoverShapeLayerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[AMSUIPopoverShapeLayerView setHidden:](v5, "setHidden:", 1);
    -[AMSUIPopoverShapeLayerView setViewToMaskWhenContentExtendsOverArrow:](v5, "setViewToMaskWhenContentExtendsOverArrow:", self);
    -[AMSUIMessageView addSubview:](self, "addSubview:", v5);
    -[AMSUIMessageView setMaskShapeView:](self, "setMaskShapeView:", v5);

  }
}

- (void)removeBubbleArrowMaskView
{
  void *v3;

  -[AMSUIMessageView setMaskView:](self, "setMaskView:", 0);
  -[AMSUIMessageView maskShapeView](self, "maskShapeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[AMSUIMessageView setMaskShapeView:](self, "setMaskShapeView:", 0);
}

- (void)_startObservations
{
  id v3;

  -[AMSUIMessageView imageView](self, "imageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("image"), 1, 0);

}

- (void)_endObservations
{
  id v3;

  -[AMSUIMessageView imageView](self, "imageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("image"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[AMSUIMessageView imageView](self, "imageView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 != v11)
  {

LABEL_5:
    v16.receiver = self;
    v16.super_class = (Class)AMSUIMessageView;
    -[AMSUIMessageView observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
    goto LABEL_6;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("image"));

  if (!v14)
    goto LABEL_5;
  -[AMSUIMessageView _setupImageView](self, "_setupImageView");
  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidate");

  -[AMSUIMessageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
LABEL_6:

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView accessoryView](self, "accessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUIMessageView accessoryView](self, "accessoryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  -[AMSUIMessageView footerButtonViews](self, "footerButtonViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[AMSUIMessageView footerButtonViews](self, "footerButtonViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v9);

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setNeedsLayout
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIMessageView;
  -[AMSUIMessageView setNeedsLayout](&v4, sel_setNeedsLayout);
  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSUIMessageView;
  -[AMSUIMessageView layoutSubviews](&v7, sel_layoutSubviews);
  -[AMSUIMessageView _syncRectsFromContext](self, "_syncRectsFromContext");
  -[AMSUIMessageView micaPlayer](self, "micaPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIMessageView micaPlayer](self, "micaPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIMessageView imageContainerView](self, "imageContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "moveAndResizeWithinParentLayer:usingGravity:animate:", v6, *MEMORY[0x24BDE5C98], 0);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[AMSUIMessageView setIsSizing:](self, "setIsSizing:", 1);
  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  -[AMSUIMessageView _syncRectsFromContext](self, "_syncRectsFromContext");
  -[AMSUIMessageView setIsSizing:](self, "setIsSizing:", 0);
  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 3;
}

- (BOOL)_layoutHeightDependsOnWidth
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AMSUIMessageView;
  v4 = a3;
  -[AMSUIMessageView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[AMSUIMessageView traitCollection](self, "traitCollection", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceLevel");
  v7 = objc_msgSend(v4, "userInterfaceLevel");

  if (v6 != v7)
    -[AMSUIMessageView _setupImageView](self, "_setupImageView");
  -[AMSUIMessageView iconColor](self, "iconColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView _setMICAPlayerTintColor:](self, "_setMICAPlayerTintColor:", v8);

  -[AMSUIMessageView _setTextAlignment](self, "_setTextAlignment");
  -[AMSUIMessageView _setTextViewText](self, "_setTextViewText");
  -[AMSUIMessageView _setShadow](self, "_setShadow");
}

- (void)_syncRectsFromContext
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  unint64_t v83;
  void *v84;
  void *v85;
  unint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  unint64_t v90;
  void *v91;
  void *v92;
  unint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  void *v117;
  _QWORD v118[5];
  _QWORD v119[5];

  -[AMSUIMessageView _setTextAlignment](self, "_setTextAlignment");
  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutSubviewFrames");

  -[AMSUIMessageView accessoryView](self, "accessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIMessageView layoutContext](self, "layoutContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentLayoutMargins");
    v7 = v6;
    v9 = v8;
    v11 = v10;

    -[AMSUIMessageView layoutContext](self, "layoutContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessorySpacing");
    v14 = v13;

    v15 = -v11;
    if (-[AMSUIMessageView style](self, "style") == 4)
    {
      -[AMSUIMessageView traitCollection](self, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "layoutDirection");

      if (v17 == 1)
      {
        -[AMSUIMessageView frame](self, "frame");
        v19 = v18;
        -[AMSUIMessageView layoutContext](self, "layoutContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "accessoryViewFrame");
        v22 = v19 - v21;
        -[AMSUIMessageView layoutContext](self, "layoutContext");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "accessoryViewFrame");
        v25 = -(v22 - v24);

      }
      else
      {
        -[AMSUIMessageView layoutContext](self, "layoutContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "accessoryViewFrame");
        v25 = -v28;
      }

      -[AMSUIMessageView layoutContext](self, "layoutContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "accessoryViewFrame");
      v26 = -v30;

      -[AMSUIMessageView frame](self, "frame");
      v32 = v31;
      -[AMSUIMessageView layoutContext](self, "layoutContext");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "accessoryViewFrame");
      v35 = v32 - v34;
      -[AMSUIMessageView layoutContext](self, "layoutContext");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "accessoryViewFrame");
      v27 = -(v35 - v37);

    }
    else
    {
      v25 = -v14;
      v26 = -v7;
      v27 = -v9;
    }
    -[AMSUIMessageView accessoryView](self, "accessoryView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setHitTestDirectionalInsets:", v26, v25, v27, v15);

  }
  -[AMSUIMessageView imageView](self, "imageView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "image");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = 0;
  }
  else
  {
    -[AMSUIMessageView micaPlayer](self, "micaPlayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v42 == 0;

  }
  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "contentSize");
  v45 = v44;
  v47 = v46;

  -[AMSUIMessageView imageContainerView](self, "imageContainerView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setHidden:", v41);

  -[AMSUIMessageView imageContainerView](self, "imageContainerView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "imageViewFrame");
  objc_msgSend(v49, "setFrame:");

  -[AMSUIMessageView imageView](self, "imageView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView imageContainerView](self, "imageContainerView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bounds");
  objc_msgSend(v51, "setFrame:");

  -[AMSUIMessageView textView](self, "textView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "textViewFrame");
  objc_msgSend(v53, "setFrame:");

  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "debugButtonFrame");
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v63 = v62;
  -[AMSUIMessageView debugButton](self, "debugButton");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setFrame:", v57, v59, v61, v63);

  -[AMSUIMessageView bounds](self, "bounds");
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v72 = v71;
  if (-[AMSUIMessageView style](self, "style") == 2)
  {
    -[AMSUIMessageView safeAreaInsets](self, "safeAreaInsets");
    v68 = v73;
    -[AMSUIMessageView safeAreaInsets](self, "safeAreaInsets");
    v66 = v74;
  }
  -[AMSUIMessageView containerView](self, "containerView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView bounds](self, "bounds");
  objc_msgSend(v75, "setFrame:");

  -[AMSUIMessageView containerView](self, "containerView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setContentSize:", v45, v47);

  -[AMSUIMessageView backgroundVisualEffectView](self, "backgroundVisualEffectView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setFrame:", v66, v68, v70, v72);

  -[AMSUIMessageView accessoryView](self, "accessoryView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "accessoryViewFrame");
  objc_msgSend(v78, "setFrame:");

  -[AMSUIMessageView accessorySecondaryView](self, "accessorySecondaryView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "accessorySecondaryViewFrame");
  objc_msgSend(v80, "setFrame:");

  -[AMSUIMessageView separatorViews](self, "separatorViews");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "count");
  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "separatorViewFrames");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "count");

  if (v83 < v86)
  {
    v87 = (void *)MEMORY[0x24BDBCEB8];
    -[AMSUIMessageView separatorViews](self, "separatorViews");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "arrayWithArray:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {

      v90 = objc_msgSend(v89, "count");
      -[AMSUIMessageView layoutContext](self, "layoutContext");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "separatorViewFrames");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v92, "count");

      if (v90 >= v93)
        break;
      -[AMSUIMessageView _makeSeparatorView](self, "_makeSeparatorView");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "addObject:", v88);
      -[AMSUIMessageView containerView](self, "containerView");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "addSubview:", v88);

    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v89);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIMessageView setSeparatorViews:](self, "setSeparatorViews:", v95);

  }
  -[AMSUIMessageView layoutContext](self, "layoutContext");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "separatorViewFrames");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "count");

  v99 = MEMORY[0x24BDAC760];
  if (v98)
  {
    -[AMSUIMessageView separatorViews](self, "separatorViews");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = v99;
    v119[1] = 3221225472;
    v119[2] = __41__AMSUIMessageView__syncRectsFromContext__block_invoke;
    v119[3] = &unk_24CB50170;
    v119[4] = self;
    objc_msgSend(v100, "enumerateObjectsUsingBlock:", v119);

  }
  -[AMSUIMessageView footerButtonViews](self, "footerButtonViews");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v99;
  v118[1] = 3221225472;
  v118[2] = __41__AMSUIMessageView__syncRectsFromContext__block_invoke_2;
  v118[3] = &unk_24CB50170;
  v118[4] = self;
  objc_msgSend(v101, "enumerateObjectsUsingBlock:", v118);

  -[AMSUIMessageView backgroundImageView](self, "backgroundImageView");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView backgroundImageView](self, "backgroundImageView");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "image");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setHidden:", v104 == 0);

  -[AMSUIMessageView backgroundImageView](self, "backgroundImageView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageView bounds](self, "bounds");
  objc_msgSend(v105, "setFrame:");

  -[AMSUIMessageView maskShapeView](self, "maskShapeView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    -[AMSUIMessageView layoutContext](self, "layoutContext");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "maskViewFrame");
    v109 = v108;
    v111 = v110;
    v113 = v112;
    v115 = v114;
    -[AMSUIMessageView maskShapeView](self, "maskShapeView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setFrame:", v109, v111, v113, v115);

    -[AMSUIMessageView maskShapeView](self, "maskShapeView");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setNeedsLayout");

  }
  -[AMSUIMessageView _setAccessibility](self, "_setAccessibility");
}

void __41__AMSUIMessageView__syncRectsFromContext__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "layoutContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "separatorViewFrames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= a3)
  {
    objc_msgSend(v11, "setHidden:", 0);
    objc_msgSend(*(id *)(a1 + 32), "layoutContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "separatorViewFrames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CGRectValue");
    objc_msgSend(v11, "setFrame:");

  }
  else
  {
    objc_msgSend(v11, "setHidden:", 1);
  }

}

void __41__AMSUIMessageView__syncRectsFromContext__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "layoutContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footerButtonFrames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "layoutContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "footerButtonFrames");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "CGRectValue");
    objc_msgSend(v5, "setFrame:");

  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x24BE08418], "isRunningUnitTests");
    objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = 138543362;
        v19 = objc_opt_class();
        _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Internal inconsistency there are less frames allocated for footer buttons", (uint8_t *)&v18, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v13, 0);

    }
    else
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        v18 = 138543362;
        v19 = objc_opt_class();
        _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_FAULT, "%{public}@: Internal inconsistency there are less frames allocated for footer buttons", (uint8_t *)&v18, 0xCu);
      }

    }
  }

}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
  UIView *v4;
  UIView *accessoryView;
  UIView *v6;
  void *v7;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
  accessoryView = self->_accessoryView;
  self->_accessoryView = v4;
  v6 = v4;

  -[AMSUIMessageView containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  -[AMSUIMessageView setNeedsLayout](self, "setNeedsLayout");
}

- (UIView)accessorySecondaryView
{
  return self->_accessorySecondaryView;
}

- (void)setAccessorySecondaryView:(id)a3
{
  UIView *v4;
  UIView *accessorySecondaryView;
  UIView *v6;
  void *v7;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_accessorySecondaryView, "removeFromSuperview");
  accessorySecondaryView = self->_accessorySecondaryView;
  self->_accessorySecondaryView = v4;
  v6 = v4;

  -[AMSUIMessageView containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  -[AMSUIMessageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUIMessageView;
  -[AMSUIMessageView setBackgroundColor:](&v5, sel_setBackgroundColor_);
  if (!a3)
    -[AMSUIMessageView _setBackground](self, "_setBackground");
}

- (NSArray)footerButtonViews
{
  return self->_footerButtonViews;
}

- (void)setFooterButtonViews:(id)a3
{
  id v5;
  NSArray **p_footerButtonViews;
  NSArray *footerButtonViews;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_footerButtonViews = &self->_footerButtonViews;
  footerButtonViews = self->_footerButtonViews;
  if (footerButtonViews)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = footerButtonViews;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12++), "removeFromSuperview");
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v10);
    }

  }
  objc_storeStrong((id *)&self->_footerButtonViews, a3);
  v13 = *p_footerButtonViews;
  if (*p_footerButtonViews)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v13;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18);
          -[AMSUIMessageView containerView](self, "containerView", (_QWORD)v21);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addSubview:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v16);
    }

  }
  -[AMSUIMessageView setNeedsLayout](self, "setNeedsLayout", (_QWORD)v21);

}

- (UIColor)iconColor
{
  return self->_iconColor;
}

- (void)setIconColor:(id)a3
{
  UIColor *v4;
  void *v5;
  UIColor *iconColor;

  v4 = (UIColor *)a3;
  -[AMSUIMessageView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

  -[AMSUIMessageView _setMICAPlayerTintColor:](self, "_setMICAPlayerTintColor:", v4);
  iconColor = self->_iconColor;
  self->_iconColor = v4;

}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void)setSeparatorColor:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_separatorColor, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[AMSUIMessageView separatorViews](self, "separatorViews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setBackgroundColor:", v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)_makeSeparatorView
{
  AMSUICommonView *v3;
  void *v4;

  v3 = objc_alloc_init(AMSUICommonView);
  -[AMSUIMessageView separatorColor](self, "separatorColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[AMSUICommonView setIsAccessibilityElement:](v3, "setIsAccessibilityElement:", 0);
  return v3;
}

- (void)_setTextAlignment
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[AMSUIMessageView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "textAlignment");

  if (-[AMSUIMessageView style](self, "style") == 1)
  {
    -[AMSUIMessageView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      v7 = -[AMSUIMessageView preLayoutImageView](self, "preLayoutImageView");

      if (!v7)
      {
        -[AMSUIMessageView layoutContext](self, "layoutContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "shouldUseStackedLayout");

        if (v9)
          v4 = 4;
        else
          v4 = 1;
      }
    }
  }
  -[AMSUIMessageView textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "textAlignment");

  if (v4 != v11)
  {
    -[AMSUIMessageView textView](self, "textView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextAlignment:", v4);

  }
}

- (double)_textViewParagraphSpacingBefore
{
  unint64_t v2;
  double result;

  v2 = -[AMSUIMessageView style](self, "style");
  result = 2.0;
  if (!v2)
    return 0.0;
  return result;
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageView, a3);
}

- (AMSUICommonImageView)imageView
{
  return self->_imageView;
}

- (BOOL)isImageSymbolImage
{
  return self->_isImageSymbolImage;
}

- (void)setIsImageSymbolImage:(BOOL)a3
{
  self->_isImageSymbolImage = a3;
}

- (BOOL)isSizing
{
  return self->_isSizing;
}

- (void)setIsSizing:(BOOL)a3
{
  self->_isSizing = a3;
}

- (NSAttributedString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (AMSUICommonTextView)textView
{
  return self->_textView;
}

- (AMSDialogAction)bodyAction
{
  return self->_bodyAction;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)preLayoutImageView
{
  return self->_preLayoutImageView;
}

- (void)setPreLayoutImageView:(BOOL)a3
{
  self->_preLayoutImageView = a3;
}

- (NSArray)ams_accessibilitySupplementaryFooterViews
{
  return self->_ams_accessibilitySupplementaryFooterViews;
}

- (void)setAms_accessibilitySupplementaryFooterViews:(id)a3
{
  objc_storeStrong((id *)&self->_ams_accessibilitySupplementaryFooterViews, a3);
}

- (AMSUICommonVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, a3);
}

- (UIScrollView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (AMSUICommonButton)debugButton
{
  return self->_debugButton;
}

- (void)setDebugButton:(id)a3
{
  objc_storeStrong((id *)&self->_debugButton, a3);
}

- (UIView)imageContainerView
{
  return self->_imageContainerView;
}

- (void)setImageContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_imageContainerView, a3);
}

- (unint64_t)imageStyle
{
  return self->_imageStyle;
}

- (void)setImageStyle:(unint64_t)a3
{
  self->_imageStyle = a3;
}

- (AMSUIMessageViewLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (void)setLayoutContext:(id)a3
{
  objc_storeStrong((id *)&self->_layoutContext, a3);
}

- (AMSUIPopoverShapeLayerView)maskShapeView
{
  return self->_maskShapeView;
}

- (void)setMaskShapeView:(id)a3
{
  objc_storeStrong((id *)&self->_maskShapeView, a3);
}

- (MicaPlayer)micaPlayer
{
  return self->_micaPlayer;
}

- (void)setMicaPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_micaPlayer, a3);
}

- (NSArray)separatorViews
{
  return self->_separatorViews;
}

- (void)setSeparatorViews:(id)a3
{
  objc_storeStrong((id *)&self->_separatorViews, a3);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_micaPlayer, 0);
  objc_storeStrong((id *)&self->_maskShapeView, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_imageContainerView, 0);
  objc_storeStrong((id *)&self->_debugButton, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_ams_accessibilitySupplementaryFooterViews, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bodyAction, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_iconColor, 0);
  objc_storeStrong((id *)&self->_footerButtonViews, 0);
  objc_storeStrong((id *)&self->_accessorySecondaryView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
