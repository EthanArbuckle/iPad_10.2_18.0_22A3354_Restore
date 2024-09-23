@implementation CNVisualIdentityEditablePrimaryAvatarViewController

- (CNVisualIdentityEditablePrimaryAvatarViewController)initWithVariantsManager:(id)a3
{
  return -[CNVisualIdentityEditablePrimaryAvatarViewController initWithProviderItem:variantsManager:](self, "initWithProviderItem:variantsManager:", 0, a3);
}

- (CNVisualIdentityEditablePrimaryAvatarViewController)initWithProviderItem:(id)a3 variantsManager:(id)a4
{
  id v7;
  id v8;
  CNVisualIdentityEditablePrimaryAvatarViewController *v9;
  CNVisualIdentityEditablePrimaryAvatarViewController *v10;
  CNVisualIdentityEditablePrimaryAvatarViewController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarViewController;
  v9 = -[CNVisualIdentityEditablePrimaryAvatarViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_providerItem, a3);
    objc_storeStrong((id *)&v10->_variantsManager, a4);
    v11 = v10;
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarViewController;
  -[CNVisualIdentityEditablePrimaryAvatarViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[CNVisualIdentityEditablePrimaryAvatarViewController setupImageContainerView](self, "setupImageContainerView");
  -[CNVisualIdentityEditablePrimaryAvatarViewController setupTextField](self, "setupTextField");
  -[CNVisualIdentityEditablePrimaryAvatarViewController providerItem](self, "providerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController updateViewWithProviderItem:](self, "updateViewWithProviderItem:", v5);

  +[CNUIColorRepository visualIdentityEditorBackgroundColor](CNUIColorRepository, "visualIdentityEditorBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)viewDidLayoutSubviews
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
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;

  v27.receiver = self;
  v27.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarViewController;
  -[CNVisualIdentityEditablePrimaryAvatarViewController viewDidLayoutSubviews](&v27, sel_viewDidLayoutSubviews);
  -[CNVisualIdentityEditablePrimaryAvatarViewController updateContainerViewMask](self, "updateContainerViewMask");
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  if (CGRectEqualToRect(v28, *MEMORY[0x1E0C9D648]))
    goto LABEL_4;
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  if (CGRectEqualToRect(v29, *MEMORY[0x1E0C9D628]))
  {

LABEL_4:
LABEL_5:
    -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    goto LABEL_6;
  }
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;
  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v24 = v23;
  v26 = v25;

  if (v19 != v24 || v21 != v26)
    goto LABEL_5;
LABEL_6:
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController adjustFontSizeToFitWidthForText:](self, "adjustFontSizeToFitWidthForText:", v16);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarViewController;
  -[CNVisualIdentityEditablePrimaryAvatarViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CNVisualIdentityEditablePrimaryAvatarViewController providerItem](self, "providerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController setUpFirstResponderForProviderItem:](self, "setUpFirstResponderForProviderItem:", v4);

}

- (NSString)text
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController trimTextFieldTextIfNeeded:](self, "trimTextFieldTextIfNeeded:", v4);

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)updateWithProviderItem:(id)a3
{
  id v4;

  v4 = a3;
  -[CNVisualIdentityEditablePrimaryAvatarViewController setProviderItem:](self, "setProviderItem:", v4);
  -[CNVisualIdentityEditablePrimaryAvatarViewController updateViewWithProviderItem:](self, "updateViewWithProviderItem:", v4);

}

- (void)beginEditing
{
  id v2;

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)endEditing
{
  void *v3;
  void *v4;
  id v5;

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController trimTextFieldTextIfNeeded:](self, "trimTextFieldTextIfNeeded:", v4);

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

}

- (void)setUpFirstResponderForProviderItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  id v10;

  -[CNVisualIdentityEditablePrimaryAvatarViewController providerItem](self, "providerItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE033250))
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    -[CNVisualIdentityEditablePrimaryAvatarViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0
      || (-[CNVisualIdentityEditablePrimaryAvatarViewController delegate](self, "delegate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "editableAvatarViewControllerShouldBecomeFirstResponder:", self),
          v8,
          v9))
    {
      -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "becomeFirstResponder");

    }
  }
}

- (void)updateViewWithProviderItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  -[CNVisualIdentityEditablePrimaryAvatarViewController providerItem](self, "providerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE033250))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[CNVisualIdentityEditablePrimaryAvatarViewController imageContentView](self, "imageContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[CNVisualIdentityEditablePrimaryAvatarViewController populateViewWithTextEditableProviderItem:imageType:](self, "populateViewWithTextEditableProviderItem:imageType:", v7, objc_msgSend(v4, "imageType"));
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __82__CNVisualIdentityEditablePrimaryAvatarViewController_updateViewWithProviderItem___block_invoke;
    v9[3] = &unk_1E204D958;
    v9[4] = self;
    objc_msgSend(v4, "fullSizeViewWithCompletion:", v9);
  }

}

- (void)populateViewWithTextEditableProviderItem:(id)a3 imageType:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[CNVisualIdentityEditablePrimaryAvatarViewController variantsManager](self, "variantsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avatarBackgrounds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "color");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v22, "itemText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController adjustFontSizeToFitWidthForText:](self, "adjustFontSizeToFitWidthForText:", v15);

  if (a4 == 2)
  {
    +[CNPhotoPickerVariantsManager monogramColorGradientBackground:](CNPhotoPickerVariantsManager, "monogramColorGradientBackground:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "itemText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[CNUIStringUtilities stringIsSingleEmoji:](CNUIStringUtilities, "stringIsSingleEmoji:", v17);

    if (v18)
    {
      -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", 0);

    }
  }
  else
  {
    +[CNPhotoPickerVariantsManager colorGradientBackground:](CNPhotoPickerVariantsManager, "colorGradientBackground:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v16)
  {
    objc_msgSend(v20, "setImage:", v16);
  }
  else
  {
    objc_msgSend(v20, "setImage:", 0);

    -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v8);
  }

}

- (void)setupImageContainerView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[CNVisualIdentityEditablePrimaryAvatarViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[CNVisualIdentityEditablePrimaryAvatarViewController setImageContainerView:](self, "setImageContainerView:", v5);

  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  -[CNVisualIdentityEditablePrimaryAvatarViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  -[CNVisualIdentityEditablePrimaryAvatarViewController setClippingLayer:](self, "setClippingLayer:", v9);

  -[CNVisualIdentityEditablePrimaryAvatarViewController clippingLayer](self, "clippingLayer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMask:", v12);

}

- (void)setupTextField
{
  CNVisualIdentityEditablePrimaryAvatarTextField *v3;
  CNVisualIdentityEditablePrimaryAvatarTextField *v4;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v3 = [CNVisualIdentityEditablePrimaryAvatarTextField alloc];
  v4 = -[CNVisualIdentityEditablePrimaryAvatarTextField initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CNVisualIdentityEditablePrimaryAvatarViewController setTextField:](self, "setTextField:", v4);

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v30 = (void *)MEMORY[0x1E0CB3718];
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v10;
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v16);

  -[CNVisualIdentityEditablePrimaryAvatarViewController desiredFontSize](self, "desiredFontSize");
  -[CNVisualIdentityEditablePrimaryAvatarViewController updateTextFieldFontSize:](self, "updateTextFieldFontSize:");
  +[CNUIColorRepository visualIdentityEditorMonogramTextColor](CNUIColorRepository, "visualIdentityEditorMonogramTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v19);

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setScrollEnabled:", 0);

  +[CNUIColorRepository visualIdentityEditorMonogramTextColor](CNUIColorRepository, "visualIdentityEditorMonogramTextColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTintColor:", v22);

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTextAlignment:", 1);

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAutocapitalizationType:", 3);

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDelegate:", self);

  if (-[CNVisualIdentityEditablePrimaryAvatarViewController isEmojiProviderItemType](self, "isEmojiProviderItemType"))
    v27 = 124;
  else
    v27 = 13;
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setKeyboardType:", v27);

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAutocorrectionType:", 1);

}

- (void)updateTextFieldFontSize:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  v8 = v7;

  if (v8 != a3)
  {
    +[CNUIFontRepository visualIdentityEditorTextFont](CNUIFontRepository, "visualIdentityEditorTextFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontWithSize:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityEditablePrimaryAvatarViewController setOriginalFont:](self, "setOriginalFont:", v10);

    -[CNVisualIdentityEditablePrimaryAvatarViewController originalFont](self, "originalFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    -[CNVisualIdentityEditablePrimaryAvatarViewController setDesiredFontSize:](self, "setDesiredFontSize:", a3);
  }
}

- (BOOL)isEmojiProviderItemType
{
  void *v2;
  BOOL v3;

  -[CNVisualIdentityEditablePrimaryAvatarViewController providerItem](self, "providerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageType") == 4;

  return v3;
}

- (BOOL)isMonogramProviderItemType
{
  void *v2;
  BOOL v3;

  -[CNVisualIdentityEditablePrimaryAvatarViewController providerItem](self, "providerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageType") == 2;

  return v3;
}

- (void)updateContainerViewMask
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  if (v5 >= v8)
    v5 = v8;
  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v11, v14, v5, v5);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v17, "CGPath");
  -[CNVisualIdentityEditablePrimaryAvatarViewController clippingLayer](self, "clippingLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPath:", v15);

}

- (id)updatedProviderItem
{
  void *v3;
  void *v4;
  void *v5;

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityEditablePrimaryAvatarViewController updatedProviderItemWithText:](self, "updatedProviderItemWithText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)updatedProviderItemWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CNVisualIdentityEditablePrimaryAvatarViewController providerItem](self, "providerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE033250))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "updatedProviderItemWithText:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNVisualIdentityEditablePrimaryAvatarViewController providerItem](self, "providerItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "copy");

  }
  return v8;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v22;
  void *v23;
  void *v24;
  int64_t v25;
  BOOL v26;
  void *v27;
  void *v28;
  unsigned __int8 v30;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "_cn_containsCharacterInSet:", v11);

  if ((v12 & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v9, "markedTextRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginningOfDocument");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "start");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v9, "offsetFromPosition:toPosition:", v15, v16);

    objc_msgSend(v14, "start");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "end");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v9, "offsetFromPosition:toPosition:", v18, v19);

    v22 = v17 == location && v20 == length;
    if (!v14 || v22)
    {
      objc_msgSend(v9, "text");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByReplacingCharactersInRange:withString:", location, length, v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[CNVisualIdentityEditablePrimaryAvatarViewController hasValidInputTypeForText:](self, "hasValidInputTypeForText:", v24))
      {
        v30 = 0;
        v25 = +[CNUIStringUtilities composedCharacterCountForString:containsEmoji:](CNUIStringUtilities, "composedCharacterCountForString:containsEmoji:", v24, &v30);
        v26 = -[CNVisualIdentityEditablePrimaryAvatarViewController exceedsMaxCharacterCount:containsEmoji:](self, "exceedsMaxCharacterCount:containsEmoji:", v25, v30);
        v13 = !v26;
        if (v26 && !v30)
          -[CNVisualIdentityEditablePrimaryAvatarViewController trimTextFieldTextIfNeeded:containsEmoji:](self, "trimTextFieldTextIfNeeded:containsEmoji:", v24, 0);
        if (!v26)
        {
          -[CNVisualIdentityEditablePrimaryAvatarViewController adjustFontSizeToFitWidthForText:](self, "adjustFontSizeToFitWidthForText:", v24);
          -[CNVisualIdentityEditablePrimaryAvatarViewController delegate](self, "delegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNVisualIdentityEditablePrimaryAvatarViewController updatedProviderItemWithText:](self, "updatedProviderItemWithText:", v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "editableAvatarViewController:didUpdateWithProviderItem:", self, v28);

        }
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 1;
    }

  }
  return v13;
}

- (void)textViewDidEndEditing:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNVisualIdentityEditablePrimaryAvatarViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNVisualIdentityEditablePrimaryAvatarViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editableAvatarViewControllerDidEndEditing:", self);

  }
}

- (void)adjustFontSizeToFitWidthForText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC3968];
  v5 = a3;
  objc_msgSend(v4, "sharedInputModeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentInputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDefaultRightToLeft");

  v9 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
  objc_msgSend(v9, "setMaximumNumberOfLines:", 1);
  v10 = v8;
  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v40[0] = *MEMORY[0x1E0DC1138];
  -[CNVisualIdentityEditablePrimaryAvatarViewController originalFont](self, "originalFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v16;
  v40[1] = *MEMORY[0x1E0DC1258];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 33, v19, v9, v13, v15);
  v21 = v20;
  v23 = v22;

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentOffset");
  v26 = v25;

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v29 = v28 + -20.0;
  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "zoomScale");
  v32 = (v29 - v23 * v31) * 0.5;

  -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setContentOffset:", v26, -fmax(v32, 0.0));

  -[CNVisualIdentityEditablePrimaryAvatarViewController maxTextFieldSize](self, "maxTextFieldSize");
  if (v21 <= v34)
  {
    -[CNVisualIdentityEditablePrimaryAvatarViewController originalFont](self, "originalFont");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFont:", v35);
  }
  else
  {
    +[CNUIFontRepository visualIdentityEditorTextFont](CNUIFontRepository, "visualIdentityEditorTextFont");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityEditablePrimaryAvatarViewController desiredFontSize](self, "desiredFontSize");
    objc_msgSend(v35, "fontWithSize:", v36 * 0.8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFont:", v37);

  }
}

- (void)trimTextFieldTextIfNeeded:(id)a3
{
  id v4;
  int64_t v5;
  unsigned __int8 v6;

  v4 = a3;
  v6 = 0;
  v5 = +[CNUIStringUtilities composedCharacterCountForString:containsEmoji:](CNUIStringUtilities, "composedCharacterCountForString:containsEmoji:", v4, &v6);
  if (-[CNVisualIdentityEditablePrimaryAvatarViewController exceedsMaxCharacterCount:containsEmoji:](self, "exceedsMaxCharacterCount:containsEmoji:", v5, v6))
  {
    -[CNVisualIdentityEditablePrimaryAvatarViewController trimTextFieldTextIfNeeded:containsEmoji:](self, "trimTextFieldTextIfNeeded:containsEmoji:", v4, v6);
  }

}

- (void)trimTextFieldTextIfNeeded:(id)a3 containsEmoji:(BOOL)a4
{
  void *v5;
  id v6;

  if (!a4)
  {
    objc_msgSend(a3, "_cn_take:", 2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityEditablePrimaryAvatarViewController textField](self, "textField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

  }
}

- (BOOL)hasValidInputTypeForText:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;
  char v7;

  v4 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    v5 = -[CNVisualIdentityEditablePrimaryAvatarViewController isEmojiProviderItemType](self, "isEmojiProviderItemType");
    v6 = +[CNUIStringUtilities stringContainsEmoji:](CNUIStringUtilities, "stringContainsEmoji:", v4);
    v7 = v5 && v6 || !v5 && !v6;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)exceedsMaxCharacterCount:(int64_t)a3 containsEmoji:(BOOL)a4
{
  int64_t v4;

  v4 = 1;
  if (!a4)
    v4 = 2;
  return v4 < a3;
}

- (double)maxTextFieldSize
{
  void *v2;
  double v3;
  double v4;

  -[CNVisualIdentityEditablePrimaryAvatarViewController imageContainerView](self, "imageContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3 + -20.0;

  return v4;
}

- (void)updatePrimaryAvatarForVisualIdentity:(id)a3
{
  CNPhotoPickerProviderItem *v4;
  void *v5;
  CNPhotoPickerProviderItem *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CNVisualIdentityEditablePrimaryAvatarViewController providerItem](self, "providerItem");
  v4 = (CNPhotoPickerProviderItem *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_4;
  objc_msgSend(v10, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [CNPhotoPickerProviderItem alloc];
    objc_msgSend(v10, "imageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "thumbnailImageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fullscreenImageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cropRect");
    v4 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](v6, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v7, v8, v9);

    -[CNVisualIdentityEditablePrimaryAvatarViewController updateWithProviderItem:](self, "updateWithProviderItem:", v4);
LABEL_4:

  }
}

- (BOOL)primaryAvatarShouldDisplay
{
  void *v2;
  BOOL v3;

  -[CNVisualIdentityEditablePrimaryAvatarViewController providerItem](self, "providerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CNVisualIdentityEditablePrimaryAvatarViewControllerDelegate)delegate
{
  return (CNVisualIdentityEditablePrimaryAvatarViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)desiredFontSize
{
  return self->_desiredFontSize;
}

- (void)setDesiredFontSize:(double)a3
{
  self->_desiredFontSize = a3;
}

- (CNPhotoPickerProviderItem)providerItem
{
  return self->_providerItem;
}

- (void)setProviderItem:(id)a3
{
  objc_storeStrong((id *)&self->_providerItem, a3);
}

- (UIImageView)imageContainerView
{
  return self->_imageContainerView;
}

- (void)setImageContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_imageContainerView, a3);
}

- (CNVisualIdentityEditablePrimaryAvatarTextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (UIFont)originalFont
{
  return self->_originalFont;
}

- (void)setOriginalFont:(id)a3
{
  objc_storeStrong((id *)&self->_originalFont, a3);
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_clippingLayer, a3);
}

- (UIView)imageContentView
{
  return self->_imageContentView;
}

- (void)setImageContentView:(id)a3
{
  objc_storeStrong((id *)&self->_imageContentView, a3);
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_imageContentView, 0);
  objc_storeStrong((id *)&self->_clippingLayer, 0);
  objc_storeStrong((id *)&self->_originalFont, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_imageContainerView, 0);
  objc_storeStrong((id *)&self->_providerItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __82__CNVisualIdentityEditablePrimaryAvatarViewController_updateViewWithProviderItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "imageContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
  objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setImageContentView:", v4);
  objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v4, "setFrame:");

  objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v4);

}

@end
