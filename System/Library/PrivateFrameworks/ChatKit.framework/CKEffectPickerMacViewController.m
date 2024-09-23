@implementation CKEffectPickerMacViewController

- (CKEffectPickerMacViewController)initWithComposition:(id)a3 balloonViewOrigin:(CGPoint)a4 color:(char)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  CKEffectPickerMacViewController *v11;
  CKEffectPickerMacViewController *v12;
  CKFullScreenEffectManager *v13;
  CKFullScreenEffectManager *fsem;
  objc_super v16;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKEffectPickerMacViewController;
  v11 = -[CKEffectPickerMacViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_composition, a3);
    v12->_balloonViewOrigin.x = x;
    v12->_balloonViewOrigin.y = y;
    v12->_color = a5;
    v12->_hasSelectedDefaultEffect = 0;
    v13 = objc_alloc_init(CKFullScreenEffectManager);
    fsem = v12->_fsem;
    v12->_fsem = v13;

    v12->_showingInStandAloneWindow = 0;
    v12->_isInlineReply = 0;
  }

  return v12;
}

- (CKEffectPickerMacViewController)initWithEntryView:(id)a3 balloonViewOrigin:(CGPoint)a4 color:(char)a5 isInlineReply:(BOOL)a6
{
  CGFloat y;
  CGFloat x;
  id v11;
  CKEffectPickerMacViewController *v12;
  CKEffectPickerMacViewController *v13;
  CKFullScreenEffectManager *v14;
  CKFullScreenEffectManager *fsem;
  objc_super v17;

  y = a4.y;
  x = a4.x;
  v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKEffectPickerMacViewController;
  v12 = -[CKEffectPickerMacViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_entryView, v11);
    v13->_balloonViewOrigin.x = x;
    v13->_balloonViewOrigin.y = y;
    v13->_color = a5;
    v13->_hasSelectedDefaultEffect = 0;
    v14 = objc_alloc_init(CKFullScreenEffectManager);
    fsem = v13->_fsem;
    v13->_fsem = v14;

    v13->_showingInStandAloneWindow = 0;
    v13->_isInlineReply = a6;
  }

  return v13;
}

- (void)dismissViewControllerKeepingSideMount:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  objc_super v9;

  v5 = a4;
  v8 = a5;
  if (!a3)
    -[UIViewController dismissViewControllerAnimated:completion:](self->_wolfEffectSelectionVC, "dismissViewControllerAnimated:completion:", 1, 0);
  v9.receiver = self;
  v9.super_class = (Class)CKEffectPickerMacViewController;
  -[CKEffectPickerMacViewController dismissViewControllerAnimated:completion:](&v9, sel_dismissViewControllerAnimated_completion_, v5, v8);

}

- (void)createTranscriptBlurBackground
{
  CKEffectPickerBackgroundView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CKEffectPickerBackgroundView *v9;

  v3 = [CKEffectPickerBackgroundView alloc];
  -[CKEffectPickerMacViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v9 = -[CKEffectPickerBackgroundView initWithFrame:](v3, "initWithFrame:");

  -[CKEffectPickerBackgroundView setBackgroundColorForTranscriptType:](v9, "setBackgroundColorForTranscriptType:", -[CKEffectPickerMacViewController isInlineReply](self, "isInlineReply"));
  -[CKEffectPickerBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKEffectPickerMacViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v9);

  -[CKEffectPickerMacViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView __ck_makeEdgesEqualTo:](v9, "__ck_makeEdgesEqualTo:", v6);

  -[CKEffectPickerBackgroundView effectView](v9, "effectView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController setContentView:](self, "setContentView:", v8);

}

- (void)createBalloonView
{
  CKBalloonView *v3;
  void *v4;
  int v5;
  CKBalloonView *balloonView;

  CKBalloonViewForClass(-[CKComposition balloonViewClass](self->_composition, "balloonViewClass"));
  v3 = (CKBalloonView *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonView configureForComposition:](v3, "configureForComposition:", self->_composition);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[CKBalloonView setColor:](v3, "setColor:", self->_color);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAccessibilityPreferredContentSizeCategory");

    if (v5)
      -[CKBalloonView truncateForLargeText](v3, "truncateForLargeText");
  }
  -[CKBalloonView setCanUseOpaqueMask:](v3, "setCanUseOpaqueMask:", 0);
  -[CKBalloonView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  balloonView = self->_balloonView;
  self->_balloonView = v3;

}

- (id)createSendButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendButtonColorForColorType:", -[CKEffectPickerMacViewController color](self, "color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setContentHorizontalAlignment:", 3);
  objc_msgSend(v3, "setContentVerticalAlignment:", 3);
  +[CKEntryViewButton entryViewButtonImageForType:color:](CKEntryViewButton, "entryViewButtonImageForType:color:", 4, -[CKEffectPickerMacViewController color](self, "color"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_imageThatSuppressesAccessibilityHairlineThickening");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setImage:forState:", v8, 0);
  objc_msgSend(v3, "setImage:forState:", v8, 4);
  objc_msgSend(v3, "setTintColor:", v6);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_touchUpInsideSendButton_, 64);

  return v3;
}

- (void)placeSendButton
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  -[CKEffectPickerMacViewController sendButton](self, "sendButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CKEffectPickerMacViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "effectPickerPresentsSelectionView") & 1) != 0)
  {
    objc_msgSend(v4, "bottomAnchor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKEffectPickerMacViewController selectionViewController](self, "selectionViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  v19 = (void *)v6;

  v20 = (void *)MEMORY[0x1E0CB3718];
  -[CKEffectPickerMacViewController sendButton](self, "sendButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, -20.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v24;
  -[CKEffectPickerMacViewController sendButton](self, "sendButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v6, -12.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  -[CKEffectPickerMacViewController sendButton](self, "sendButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendButtonSize");
  objc_msgSend(v11, "constraintEqualToConstant:");
  v21 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v13;
  -[CKEffectPickerMacViewController sendButton](self, "sendButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendButtonSize");
  objc_msgSend(v15, "constraintEqualToConstant:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v18);

}

- (void)placeBalloonContainer:(id)a3
{
  id v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *balloonWidthConstraint;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *balloonHeightConstraint;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", self->_balloonView);
  -[CKEffectPickerMacViewController setBalloonContainer:](self, "setBalloonContainer:", v4);
  objc_msgSend(v4, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", 0.0);
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  balloonWidthConstraint = self->_balloonWidthConstraint;
  self->_balloonWidthConstraint = v6;

  objc_msgSend(v4, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToConstant:", 0.0);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  balloonHeightConstraint = self->_balloonHeightConstraint;
  self->_balloonHeightConstraint = v9;

  v21 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v4, "rightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leftAnchor](self->_sendButton, "leftAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "balloonMaskTailSizeForTailShape:", 1);
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -(8.0 - v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  objc_msgSend(v4, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bottomAnchor](self->_sendButton, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self->_balloonWidthConstraint;
  v22[1] = v18;
  v22[2] = v19;
  v22[3] = self->_balloonHeightConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v20);

}

- (void)showCloseButton
{
  UIButton *v3;
  UIButton *closeButton;
  UIButton *v5;
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
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 7);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  -[UIButton addTarget:action:forEvents:](v3, "addTarget:action:forEvents:", self, sel_closeButtonPressed_, 64);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_contentView, "addSubview:", v3);
  closeButton = self->_closeButton;
  self->_closeButton = v3;
  v5 = v3;

  -[CKEffectPickerMacViewController contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3718];
  -[UIButton leftAnchor](v5, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 20.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  -[UIButton centerYAnchor](v5, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController sendButton](self, "sendButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  -[UIButton widthAnchor](v5, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 21.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v11;
  -[UIButton heightAnchor](v5, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 21.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v14);

}

- (void)viewDidLoad
{
  void *v3;
  char v4;
  unint64_t v5;
  CKEffectSelectionViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CKEffectPreviewCollectionViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  CKChatControllerDummyAnimator *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  CKEffectPreviewCollectionViewController *v77;
  objc_super v78;
  _QWORD v79[2];
  _QWORD v80[6];

  v80[4] = *MEMORY[0x1E0C80C00];
  v78.receiver = self;
  v78.super_class = (Class)CKEffectPickerMacViewController;
  -[CKEffectPickerMacViewController viewDidLoad](&v78, sel_viewDidLoad);
  -[CKEffectPickerMacViewController createTranscriptBlurBackground](self, "createTranscriptBlurBackground");
  -[CKEffectPickerMacViewController createBalloonView](self, "createBalloonView");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectPickerPresentsSelectionView");

  v5 = 0x1E0C99000;
  if ((v4 & 1) == 0)
  {
    v6 = objc_alloc_init(CKEffectSelectionViewController);
    -[CKEffectSelectionViewController setDelegate:](v6, "setDelegate:", self);
    -[CKEffectSelectionViewController view](v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKEffectSelectionViewController view](v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "heightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionViewController maxCellHeight](v6, "maxCellHeight");
    objc_msgSend(v9, "constraintEqualToConstant:", v10 + 15.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerMacViewController setHeightConstraint:](self, "setHeightConstraint:", v11);

    -[CKEffectPickerMacViewController addChildViewController:](self, "addChildViewController:", v6);
    -[CKEffectPickerMacViewController contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionViewController view](v6, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    v65 = (void *)MEMORY[0x1E0CB3718];
    -[CKEffectSelectionViewController view](v6, "view");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "leftAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerMacViewController contentView](self, "contentView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "leftAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v70);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v68;
    -[CKEffectSelectionViewController view](v6, "view");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerMacViewController contentView](self, "contentView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, 15.0 + -18.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v14;
    -[CKEffectSelectionViewController view](v6, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerMacViewController contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2] = v19;
    -[CKEffectPickerMacViewController heightConstraint](self, "heightConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v80[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "activateConstraints:", v21);

    v5 = 0x1E0C99000uLL;
    -[CKEffectSelectionViewController didMoveToParentViewController:](v6, "didMoveToParentViewController:", self);
    -[CKEffectPickerMacViewController setSelectionViewController:](self, "setSelectionViewController:", v6);

  }
  v22 = objc_alloc_init(CKEffectPreviewCollectionViewController);
  -[CKEffectPickerMacViewController setEffectPreviewOverlayView:](self, "setEffectPreviewOverlayView:", 0);
  -[CKEffectPickerMacViewController contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPreviewCollectionViewController view](v22, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v24);

  -[CKEffectPickerMacViewController addChildViewController:](self, "addChildViewController:", v22);
  -[CKEffectPreviewCollectionViewController view](v22, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "__ck_makeEdgesEqualTo:", v26);

  -[CKEffectPreviewCollectionViewController didMoveToParentViewController:](v22, "didMoveToParentViewController:", self);
  -[CKEffectPreviewCollectionViewController setDelegate:](v22, "setDelegate:", self);
  -[CKEffectPreviewCollectionViewController view](v22, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUserInteractionEnabled:", 0);

  -[CKEffectPreviewCollectionViewController view](v22, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CKEffectPreviewCollectionViewController displayEffectWithIdentifier:](v22, "displayEffectWithIdentifier:", 0);
  v77 = v22;
  -[CKEffectPickerMacViewController setEffectCollectionViewController:](self, "setEffectCollectionViewController:", v22);
  v29 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  CKFrameworkBundle();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("EFFECT_PICKER_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v31);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 22.0, *MEMORY[0x1E0DC1420]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFont:", v32);

  objc_msgSend(v29, "sizeToFit");
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKEffectPickerMacViewController setTitleLabel:](self, "setTitleLabel:", v29);
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 18);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:");
  v33 = objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController setTitleVibrancyEffect:](self, "setTitleVibrancyEffect:", v33);
  v71 = (void *)v33;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v33);
  objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v34, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", v29);

  -[CKEffectPickerMacViewController setTitleContainerView:](self, "setTitleContainerView:", v34);
  -[CKEffectPickerMacViewController contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", v34);

  objc_msgSend(v34, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "__ck_makeEdgesEqualTo:", v29);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "macEffectPickerTitleLeadingPadding");
  v40 = v39;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "macAppKitToolbarHeight");
  v43 = v42;

  v75 = v29;
  objc_msgSend(v29, "bounds");
  v45 = v44 * 0.5;
  if (v44 >= v43)
    v45 = 0.0;
  v46 = v43 * 0.5 - v45;
  v67 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v34, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController contentView](self, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v48, v40);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v49;
  objc_msgSend(v34, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController contentView](self, "contentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v52, v46);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v53;
  objc_msgSend(*(id *)(v5 + 3360), "arrayWithObjects:count:", v79, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "activateConstraints:", v54);

  -[CKEffectPickerMacViewController createSendButton](self, "createSendButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController setSendButton:](self, "setSendButton:", v55);

  -[CKEffectPickerMacViewController contentView](self, "contentView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController sendButton](self, "sendButton");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addSubview:", v57);

  -[CKEffectPickerMacViewController placeSendButton](self, "placeSendButton");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v57) = objc_msgSend(v58, "effectPickerShowsCloseButton");

  if ((_DWORD)v57)
    -[CKEffectPickerMacViewController showCloseButton](self, "showCloseButton");
  v59 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[CKEffectPickerMacViewController contentView](self, "contentView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addSubview:", v59);

  -[CKEffectPickerMacViewController placeBalloonContainer:](self, "placeBalloonContainer:", v59);
  v61 = objc_alloc_init(CKChatControllerDummyAnimator);
  -[CKEffectPickerMacViewController setDummyAnimator:](self, "setDummyAnimator:", v61);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKEffectPickerMacViewController;
  -[CKEffectPickerMacViewController viewDidLayoutSubviews](&v18, sel_viewDidLayoutSubviews);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "senderTranscriptInsets");
  objc_msgSend(v3, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:", 1, 0, 0, 0, v6, v8, v9, v10, v11);
  v13 = v12;

  -[CKBalloonView prepareForDisplay](self->_balloonView, "prepareForDisplay");
  -[CKBalloonView setNeedsLayout](self->_balloonView, "setNeedsLayout");
  -[CKBalloonView setNeedsDisplay](self->_balloonView, "setNeedsDisplay");
  -[CKBalloonView layoutIfNeeded](self->_balloonView, "layoutIfNeeded");
  -[CKBalloonView sizeThatFits:](self->_balloonView, "sizeThatFits:", v13, 1.79769313e308);
  v15 = v14;
  v17 = v16;
  -[CKBalloonView setFrame:](self->_balloonView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v14, v16);
  -[NSLayoutConstraint setConstant:](self->_balloonHeightConstraint, "setConstant:", v17);
  -[NSLayoutConstraint setConstant:](self->_balloonWidthConstraint, "setConstant:", v15);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKEffectPickerMacViewController;
  -[CKEffectPickerMacViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (!-[CKEffectPickerMacViewController hasSelectedDefaultEffect](self, "hasSelectedDefaultEffect"))
  {
    -[CKEffectPickerMacViewController setHasSelectedDefaultEffect:](self, "setHasSelectedDefaultEffect:", 1);
    -[CKEffectPickerMacViewController selectionViewController](self, "selectionViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelectedEffectIdentifier:", CFSTR("com.apple.messages.effect.CKHeartEffect"));

    -[CKEffectPickerMacViewController setEffectIdentifier:](self, "setEffectIdentifier:", CFSTR("com.apple.messages.effect.CKHeartEffect"));
  }
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB740], 0, sel_closeButtonPressed_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_keyCommandReturn_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)keyCommandReturn:(id)a3
{
  -[CKEffectPickerMacViewController touchUpInsideSendButton:](self, "touchUpInsideSendButton:", self);
}

- (void)touchUpInsideSendButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CKEffectPickerMacViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController selectionViewController](self, "selectionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedEffectIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectPickerViewController:effectWithIdentifierSelected:", self, v5);

}

- (void)closeButtonPressed:(id)a3
{
  id v4;

  -[CKEffectPickerMacViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectPickerViewControllerClose:animated:", self, 0);

}

- (BOOL)effectSelectionViewController:(id)a3 didSelectEffectWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
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
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  void *v43;
  CKEffectPickerMacViewController *v44;
  id v45;

  v5 = a4;
  -[CKEffectPickerMacViewController setEffectIdentifier:](self, "setEffectIdentifier:", v5);
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.invisibleink")) & 1) == 0)
  {
    -[CKEffectPickerMacViewController balloonView](self, "balloonView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInvisibleInkEffectEnabled:", 0);

  }
  -[CKEffectPickerMacViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKEffectPickerMacViewController effectShouldDisplayOverBalloon:](self, "effectShouldDisplayOverBalloon:", v5);
  -[CKEffectPickerMacViewController effectCollectionViewController](self, "effectCollectionViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController balloonContainer](self, "balloonContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "insertSubview:aboveSubview:", v10, v11);
  else
    objc_msgSend(v7, "insertSubview:belowSubview:", v10, v11);

  -[CKEffectPickerMacViewController sendButton](self, "sendButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController balloonContainer](self, "balloonContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSubview:aboveSubview:", v12, v13);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v14, "effectPickerShowsCloseButton");

  if ((_DWORD)v13)
  {
    -[CKEffectPickerMacViewController closeButton](self, "closeButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerMacViewController balloonContainer](self, "balloonContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:aboveSubview:", v15, v16);

  }
  -[CKEffectPickerMacViewController titleContainerView](self, "titleContainerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerMacViewController balloonContainer](self, "balloonContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSubview:aboveSubview:", v17, v18);

  -[CKEffectPickerMacViewController fsem](self, "fsem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "effectForIdentifier:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 && objc_msgSend(v20, "effectIsDark"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "effectPickerPresentsSelectionView");

    if ((v22 & 1) == 0)
    {
      -[CKEffectPickerMacViewController selectionViewController](self, "selectionViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerMacViewController effectCollectionViewController](self, "effectCollectionViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertSubview:aboveSubview:", v24, v26);

    }
    -[CKEffectPickerMacViewController titleVibrancyEffect](self, "titleVibrancyEffect");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerMacViewController titleContainerView](self, "titleContainerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setEffect:", v27);

  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "effectPickerPresentsSelectionView");

    if ((v30 & 1) == 0)
    {
      -[CKEffectPickerMacViewController selectionViewController](self, "selectionViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEffectPickerMacViewController effectCollectionViewController](self, "effectCollectionViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertSubview:belowSubview:", v32, v34);

    }
    -[CKEffectPickerMacViewController titleContainerView](self, "titleContainerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setEffect:", 0);
  }

  +[CKImpactEffectManager effectIdentifiers](CKImpactEffectManager, "effectIdentifiers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "containsObject:", v5);

  if (v36)
  {
    -[CKEffectPickerMacViewController effectCollectionViewController](self, "effectCollectionViewController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "displayEffectWithIdentifier:", 0);

    -[CKEffectPickerMacViewController startAnimationPreviewForIdentifier:](self, "startAnimationPreviewForIdentifier:", v5);
  }
  else
  {
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = __95__CKEffectPickerMacViewController_effectSelectionViewController_didSelectEffectWithIdentifier___block_invoke;
    v43 = &unk_1E274A108;
    v44 = self;
    v45 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], &v40);

  }
  if (objc_msgSend(v20, "effectIsDark", v40, v41, v42, v43, v44))
    v38 = 2;
  else
    v38 = 0;
  -[CKEffectPickerMacViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v38);

  return 1;
}

void __95__CKEffectPickerMacViewController_effectSelectionViewController_didSelectEffectWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "effectCollectionViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayEffectWithIdentifier:", *(_QWORD *)(a1 + 40));

}

- (BOOL)effectShouldDisplayOverBalloon:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("com.apple.messages.effect.CKHappyBirthdayEffect");
  v8[1] = CFSTR("com.apple.messages.effect.CKConfettiEffect");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_defaultSendAnimationContextForAnimationPreview
{
  CKSendAnimationContext *v2;

  v2 = objc_alloc_init(CKSendAnimationContext);
  -[CKSendAnimationContext setIsSender:](v2, "setIsSender:", 1);
  -[CKSendAnimationContext setShouldRepeat:](v2, "setShouldRepeat:", 0);
  return v2;
}

- (void)startAnimationPreviewForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKEffectPickerMacViewController balloonView](self, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "subviews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  if (v5)
  {
    objc_msgSend(v5, "setInvisibleInkEffectEnabled:", objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.invisibleink")));
    objc_msgSend(v5, "prepareForDisplayIfNeeded");
    -[CKEffectPickerMacViewController _defaultSendAnimationContextForAnimationPreview](self, "_defaultSendAnimationContextForAnimationPreview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setThrowBalloonViews:", v12);

    v13 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAnimatableTextViews:", v14);

    if (!v7)
    objc_msgSend(v11, "setImpactIdentifier:", v4);
    -[CKEffectPickerMacViewController dummyAnimator](self, "dummyAnimator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "beginAnimationWithSendAnimationContext:", v11);

  }
}

- (CKEffectPickerViewControllerDelegate)delegate
{
  return (CKEffectPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)effectPreviewOverlayView
{
  return self->_effectPreviewOverlayView;
}

- (void)setEffectPreviewOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_effectPreviewOverlayView, a3);
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_balloonView, a3);
}

- (CKEffectPreviewCollectionViewController)effectCollectionViewController
{
  return self->_effectCollectionViewController;
}

- (void)setEffectCollectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_effectCollectionViewController, a3);
}

- (BOOL)isInlineReply
{
  return self->_isInlineReply;
}

- (void)setIsInlineReply:(BOOL)a3
{
  self->_isInlineReply = a3;
}

- (CKEffectSelectionViewController)selectionViewController
{
  return self->_selectionViewController;
}

- (void)setSelectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_selectionViewController, a3);
}

- (CKChatControllerDummyAnimator)dummyAnimator
{
  return self->_dummyAnimator;
}

- (void)setDummyAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_dummyAnimator, a3);
}

- (UIView)balloonContainer
{
  return self->_balloonContainer;
}

- (void)setBalloonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_balloonContainer, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIVisualEffectView)titleContainerView
{
  return self->_titleContainerView;
}

- (void)setTitleContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_titleContainerView, a3);
}

- (UIVibrancyEffect)titleVibrancyEffect
{
  return self->_titleVibrancyEffect;
}

- (void)setTitleVibrancyEffect:(id)a3
{
  objc_storeStrong((id *)&self->_titleVibrancyEffect, a3);
}

- (UIView)sendButton
{
  return self->_sendButton;
}

- (void)setSendButton:(id)a3
{
  objc_storeStrong((id *)&self->_sendButton, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (CKComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
}

- (CGPoint)balloonViewOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_balloonViewOrigin.x;
  y = self->_balloonViewOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBalloonViewOrigin:(CGPoint)a3
{
  self->_balloonViewOrigin = a3;
}

- (char)color
{
  return self->_color;
}

- (void)setColor:(char)a3
{
  self->_color = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSLayoutConstraint)balloonWidthConstraint
{
  return self->_balloonWidthConstraint;
}

- (void)setBalloonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_balloonWidthConstraint, a3);
}

- (NSLayoutConstraint)balloonHeightConstraint
{
  return self->_balloonHeightConstraint;
}

- (void)setBalloonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_balloonHeightConstraint, a3);
}

- (BOOL)hasSelectedDefaultEffect
{
  return self->_hasSelectedDefaultEffect;
}

- (void)setHasSelectedDefaultEffect:(BOOL)a3
{
  self->_hasSelectedDefaultEffect = a3;
}

- (CKFullScreenEffectManager)fsem
{
  return self->_fsem;
}

- (void)setFsem:(id)a3
{
  objc_storeStrong((id *)&self->_fsem, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (BOOL)showingInStandAloneWindow
{
  return self->_showingInStandAloneWindow;
}

- (void)setShowingInStandAloneWindow:(BOOL)a3
{
  self->_showingInStandAloneWindow = a3;
}

- (NSString)effectIdentifier
{
  return self->_effectIdentifier;
}

- (void)setEffectIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_effectIdentifier, a3);
}

- (UIViewController)wolfEffectSelectionVC
{
  return self->_wolfEffectSelectionVC;
}

- (void)setWolfEffectSelectionVC:(id)a3
{
  objc_storeStrong((id *)&self->_wolfEffectSelectionVC, a3);
}

- (UIViewController)effectsPresentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_effectsPresentingViewController);
}

- (void)setEffectsPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_effectsPresentingViewController, a3);
}

- (UIView)effectsPresentingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_effectsPresentingView);
}

- (void)setEffectsPresentingView:(id)a3
{
  objc_storeWeak((id *)&self->_effectsPresentingView, a3);
}

- (CKMessageEntryView)entryView
{
  return (CKMessageEntryView *)objc_loadWeakRetained((id *)&self->_entryView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_entryView);
  objc_destroyWeak((id *)&self->_effectsPresentingView);
  objc_destroyWeak((id *)&self->_effectsPresentingViewController);
  objc_storeStrong((id *)&self->_wolfEffectSelectionVC, 0);
  objc_storeStrong((id *)&self->_effectIdentifier, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_fsem, 0);
  objc_storeStrong((id *)&self->_balloonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_balloonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_titleVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_titleContainerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_balloonContainer, 0);
  objc_storeStrong((id *)&self->_dummyAnimator, 0);
  objc_storeStrong((id *)&self->_selectionViewController, 0);
  objc_storeStrong((id *)&self->_effectCollectionViewController, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_effectPreviewOverlayView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
