@implementation WFOverlayImageEditorProcessingView

- (WFOverlayImageEditorProcessingView)initWithEffect:(id)a3
{
  WFOverlayImageEditorProcessingView *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  WFOverlayImageEditorProcessingView *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)WFOverlayImageEditorProcessingView;
  v3 = -[WFOverlayImageEditorProcessingView initWithEffect:](&v25, sel_initWithEffect_, a3);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v4, "startAnimating");
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFOverlayImageEditorProcessingView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    v6 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v8);

    WFLocalizedString(CFSTR("Processing Image…"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v9);

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFOverlayImageEditorProcessingView contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v6);

    v11 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFOverlayImageEditorProcessingView contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v11);

    v13 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFOverlayImageEditorProcessingView contentView](v3, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v13);

    -[WFOverlayImageEditorProcessingView contentView](v3, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("spacer1, spacer2, processingLabel, processingIndicatorView"), v11, v13, v6, v4, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[spacer1][processingIndicatorView]-4-[processingLabel][spacer2(==spacer1)]|"), 1024, 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addConstraints:", v18);

    -[WFOverlayImageEditorProcessingView contentView](v3, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDD1628];
    -[WFOverlayImageEditorProcessingView contentView](v3, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 10, 0, v6, 10, 1.0, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addConstraint:", v22);

    v23 = v3;
  }

  return v3;
}

@end
