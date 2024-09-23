@implementation SFCapsuleURLField

- (SFCapsuleURLField)initWithTextField:(id)a3
{
  id v5;
  SFCapsuleURLField *v6;
  uint64_t v7;
  _SFDimmingButton *clearTextButton;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *p_textField;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *textFieldTrailingConstraint;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  _SFDimmingButton *voiceSearchButton;
  _SFDimmingButton *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *voiceSearchToClearButtonConstraint;
  void *v36;
  void *v37;
  uint64_t v38;
  NSLayoutConstraint *voiceSearchToCapsuleConstraint;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSArray *voiceSearchButtonConstraints;
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
  SFCapsuleURLField *v60;
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
  id obj;
  void *v73;
  void *v74;
  objc_super v75;
  _QWORD v76[4];
  _QWORD v77[4];
  _QWORD v78[6];

  v78[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v75.receiver = self;
  v75.super_class = (Class)SFCapsuleURLField;
  v6 = -[SFCapsuleURLField initWithFrame:](&v75, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v6)
  {
    obj = a3;
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v6, sel__tap_);
    -[SFCapsuleURLField addGestureRecognizer:](v6, "addGestureRecognizer:");
    v7 = -[SFCapsuleURLField _newDimmingButtonWithSystemImageNamed:action:accessibilityIdentifier:](v6, "_newDimmingButtonWithSystemImageNamed:action:accessibilityIdentifier:", CFSTR("xmark.circle.fill"), sel__clearTextButtonTapped_, CFSTR("ClearTextButton"));
    clearTextButton = v6->_clearTextButton;
    v6->_clearTextButton = (_SFDimmingButton *)v7;

    if (-[UIView _sf_usesLeftToRightLayout](v6, "_sf_usesLeftToRightLayout"))
      v10 = 0.0;
    else
      v10 = 8.0;
    -[_SFDimmingButton setImageEdgeInsets:](v6->_clearTextButton, "setImageEdgeInsets:", 0.0, v10);
    -[_SFDimmingButton setPointerInteractionEnabled:](v6->_clearTextButton, "setPointerInteractionEnabled:", 1);
    -[_SFDimmingButton setPointerStyleProvider:](v6->_clearTextButton, "setPointerStyleProvider:", &__block_literal_global_41);
    -[SFCapsuleURLField addSubview:](v6, "addSubview:", v6->_clearTextButton);
    v62 = (void *)MEMORY[0x1E0CB3718];
    -[_SFDimmingButton trailingAnchor](v6->_clearTextButton, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleURLField trailingAnchor](v6, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v66);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v64;
    -[_SFDimmingButton topAnchor](v6->_clearTextButton, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleURLField topAnchor](v6, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v12;
    -[_SFDimmingButton bottomAnchor](v6->_clearTextButton, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleURLField bottomAnchor](v6, "bottomAnchor");
    v74 = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = v15;
    -[_SFDimmingButton widthAnchor](v6->_clearTextButton, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", 44.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v78[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "activateConstraints:", v18);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v74, "setPreserveSelectionOnResignFirstResponder:", 1);
    p_textField = (id *)&v6->_textField;
    objc_storeStrong((id *)&v6->_textField, obj);
    -[UITextField setAutocapitalizationType:](v6->_textField, "setAutocapitalizationType:", 0);
    -[UITextField setAutocorrectionType:](v6->_textField, "setAutocorrectionType:", 1);
    -[UITextField setClearButtonMode:](v6->_textField, "setClearButtonMode:", 0);
    -[UITextField setKeyboardType:](v6->_textField, "setKeyboardType:", 10);
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setPlaceholder:](v6->_textField, "setPlaceholder:", v20);

    -[UITextField setSemanticContentAttribute:](v6->_textField, "setSemanticContentAttribute:", 3);
    -[UITextField setSmartDashesType:](v6->_textField, "setSmartDashesType:", 1);
    -[UITextField setSmartQuotesType:](v6->_textField, "setSmartQuotesType:", 1);
    -[UITextField setTintAdjustmentMode:](v6->_textField, "setTintAdjustmentMode:", 1);
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v6->_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField trailingAnchor](v6->_textField, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton leadingAnchor](v6->_clearTextButton, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    textFieldTrailingConstraint = v6->_textFieldTrailingConstraint;
    v6->_textFieldTrailingConstraint = (NSLayoutConstraint *)v23;

    -[UITextField setAdjustsFontForContentSizeCategory:](v6->_textField, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v6->_textField, "setFont:", v25);

    objc_msgSend(v74, "addTarget:action:forControlEvents:", v6, sel_textFieldDidChange_, 0x20000);
    -[SFCapsuleURLField addSubview:](v6, "addSubview:", v6->_textField);
    if (-[UIView _sf_usesLeftToRightLayout](v6, "_sf_usesLeftToRightLayout"))
      v26 = 12.0;
    else
      v26 = 4.0;
    _SFAccessibilityIdentifierForBarItem(4uLL);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[SFCapsuleURLField _newDimmingButtonWithSystemImageNamed:action:accessibilityIdentifier:](v6, "_newDimmingButtonWithSystemImageNamed:action:accessibilityIdentifier:", CFSTR("mic.fill"), sel__voiceSearchButtonTapped_, v27);
    voiceSearchButton = v6->_voiceSearchButton;
    v6->_voiceSearchButton = (_SFDimmingButton *)v28;

    -[_SFDimmingButton _setDisableDictationTouchCancellation:](v6->_voiceSearchButton, "_setDisableDictationTouchCancellation:", 1);
    -[UIView sf_configureLargeContentViewerForBarItem:](v6->_voiceSearchButton, "sf_configureLargeContentViewerForBarItem:", 4);
    v30 = v6->_voiceSearchButton;
    v31 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[_SFDimmingButton addInteraction:](v30, "addInteraction:", v31);

    -[_SFDimmingButton trailingAnchor](v6->_voiceSearchButton, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton leadingAnchor](v6->_clearTextButton, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    voiceSearchToClearButtonConstraint = v6->_voiceSearchToClearButtonConstraint;
    v6->_voiceSearchToClearButtonConstraint = (NSLayoutConstraint *)v34;

    -[_SFDimmingButton trailingAnchor](v6->_voiceSearchButton, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleURLField trailingAnchor](v6, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -2.0);
    v38 = objc_claimAutoreleasedReturnValue();
    voiceSearchToCapsuleConstraint = v6->_voiceSearchToCapsuleConstraint;
    v6->_voiceSearchToCapsuleConstraint = (NSLayoutConstraint *)v38;

    -[_SFDimmingButton topAnchor](v6->_voiceSearchButton, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleURLField topAnchor](v6, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v67);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v65;
    -[_SFDimmingButton bottomAnchor](v6->_voiceSearchButton, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleURLField bottomAnchor](v6, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v42;
    -[_SFDimmingButton widthAnchor](v6->_voiceSearchButton, "widthAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToConstant:", 44.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v44;
    -[_SFDimmingButton leadingAnchor](v6->_voiceSearchButton, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_textField, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v77[3] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 4);
    v48 = objc_claimAutoreleasedReturnValue();
    voiceSearchButtonConstraints = v6->_voiceSearchButtonConstraints;
    v6->_voiceSearchButtonConstraints = (NSArray *)v48;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObserver:selector:name:object:", v6, sel__voiceSearchAvailabilityDidChange_, CFSTR("SFVoiceSearchAvailabilityDidChangeNotification"), 0);

    -[SFCapsuleURLField _voiceSearchAvailabilityDidChange:](v6, "_voiceSearchAvailabilityDidChange:", 0);
    v68 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(*p_textField, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleURLField leadingAnchor](v6, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v51, v26);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v52;
    v76[1] = v6->_textFieldTrailingConstraint;
    objc_msgSend(*p_textField, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleURLField topAnchor](v6, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v76[2] = v55;
    objc_msgSend(*p_textField, "centerYAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleURLField centerYAnchor](v6, "centerYAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v76[3] = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 4);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "activateConstraints:", v59);

    v5 = v74;
    v6->_nonKeyContentAlpha = 1.0;
    v60 = v6;

  }
  return v6;
}

id __39__SFCapsuleURLField_initWithTextField___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double x;
  double y;
  double width;
  double height;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v2 = a2;
  objc_msgSend(v2, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "convertRect:fromView:", v3);
  v25 = CGRectInset(v24, 1.0, 1.0);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v8 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", x, y, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowPath:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v2, v8);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:fromView:", v2, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:", v14, v16, v18, v20, CGRectGetHeight(v26) * 0.5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v11, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SFCapsuleURLField;
  -[SFCapsuleURLField dealloc](&v4, sel_dealloc);
}

- (id)_newDimmingButtonWithSystemImageNamed:(id)a3 action:(SEL)a4 accessibilityIdentifier:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = (void *)MEMORY[0x1E0DC3520];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "plainButtonConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "background");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  objc_msgSend(v11, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setImage:", v14);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreferredSymbolConfigurationForImage:", v15);

  +[_SFDimmingButton buttonWithConfiguration:primaryAction:](_SFDimmingButton, "buttonWithConfiguration:primaryAction:", v11, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v16, "setNormalImageAlpha:", 1.0);
  objc_msgSend(v16, "setHighlightedImageAlpha:", 0.2);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTintColor:", v17);

  objc_msgSend(v16, "setAccessibilityIdentifier:", v9);
  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, a4, 64);
  objc_msgSend(v16, "sf_applyContentSizeCategoryLimitsForToolbarButton");

  return v16;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleURLField;
  -[SFCapsuleURLField layoutSubviews](&v3, sel_layoutSubviews);
  -[SFCapsuleURLField _updatePlaceholderText](self, "_updatePlaceholderText");
}

- (void)prepareForDeferredRemoval
{
  -[UITextField resignFirstResponder](self->_textField, "resignFirstResponder");
}

- (CGRect)keyContentRect
{
  _NSRange *p_rangeOfKeyText;
  NSUInteger v4;
  void *v5;
  void *v6;
  uint64_t length;
  NSUInteger location;
  UITextField *textField;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  UITextField *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect result;

  p_rangeOfKeyText = &self->_rangeOfKeyText;
  v4 = self->_rangeOfKeyText.length + self->_rangeOfKeyText.location;
  -[UITextField text](self->_textField, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 <= objc_msgSend(v5, "length"))
  {
    location = p_rangeOfKeyText->location;
    length = p_rangeOfKeyText->length;
  }
  else
  {
    -[UITextField text](self->_textField, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    length = objc_msgSend(v6, "length");

    location = 0;
  }

  textField = self->_textField;
  -[UITextField beginningOfDocument](textField, "beginningOfDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField positionFromPosition:offset:](textField, "positionFromPosition:offset:", v10, location);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextField positionFromPosition:offset:](self->_textField, "positionFromPosition:offset:", v11, length);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField textRangeFromPosition:toPosition:](self->_textField, "textRangeFromPosition:toPosition:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField firstRectForRange:](self->_textField, "firstRectForRange:", v13);
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;
  if (CGRectIsNull(v31))
  {
    v18 = self->_textField;
    -[UITextField bounds](v18, "bounds");
    -[UITextField textRectForBounds:](v18, "textRectForBounds:");
    x = v19;
    y = v20;
    width = v21;
    height = v22;
  }
  -[UITextField ss_untransformedFrame](self->_textField, "ss_untransformedFrame");
  v24 = x + v23;
  v26 = y + v25;

  v27 = v24;
  v28 = v26;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)setKeyContentTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_keyContentTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  CGAffineTransform t2;
  CGAffineTransform t1;

  p_keyContentTransform = &self->_keyContentTransform;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_keyContentTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_keyContentTransform.a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_keyContentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_keyContentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_keyContentTransform->tx = v9;
    *(_OWORD *)&p_keyContentTransform->a = v8;
    v10 = *(_OWORD *)&a3->c;
    v11[0] = *(_OWORD *)&a3->a;
    v11[1] = v10;
    v11[2] = *(_OWORD *)&a3->tx;
    -[UITextField setTransform:](self->_textField, "setTransform:", v11);
  }
}

- (void)setNonKeyContentAlpha:(double)a3
{
  if (self->_nonKeyContentAlpha != a3)
  {
    self->_nonKeyContentAlpha = a3;
    -[_SFDimmingButton setAlpha:](self->_voiceSearchButton, "setAlpha:");
    -[SFCapsuleURLField _updateClearButtonVisibility](self, "_updateClearButtonVisibility");
  }
}

- (NSNumber)microphoneContentOriginX
{
  void *v3;
  void *v4;
  void *v5;
  CGRect v7;

  -[_SFDimmingButton imageView](self->_voiceSearchButton, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SFCapsuleURLField showsVoiceSearchButton](self, "showsVoiceSearchButton"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "frame");
    -[SFCapsuleURLField convertRect:fromView:](self, "convertRect:fromView:", self->_voiceSearchButton);
    objc_msgSend(v4, "numberWithDouble:", CGRectGetMinX(v7));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (void)setMicrophoneContentTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_microphoneContentTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  CGAffineTransform t2;
  CGAffineTransform t1;

  p_microphoneContentTransform = &self->_microphoneContentTransform;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_microphoneContentTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_microphoneContentTransform.a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_microphoneContentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_microphoneContentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_microphoneContentTransform->tx = v9;
    *(_OWORD *)&p_microphoneContentTransform->a = v8;
    v10 = *(_OWORD *)&a3->c;
    v11[0] = *(_OWORD *)&a3->a;
    v11[1] = v10;
    v11[2] = *(_OWORD *)&a3->tx;
    -[_SFDimmingButton setTransform:](self->_voiceSearchButton, "setTransform:", v11);
  }
}

- (id)buttonPointerStyleProvider
{
  return (id)-[_SFDimmingButton pointerStyleProvider](self->_voiceSearchButton, "pointerStyleProvider");
}

- (void)setButtonPointerStyleProvider:(id)a3
{
  -[_SFDimmingButton setPointerStyleProvider:](self->_voiceSearchButton, "setPointerStyleProvider:", a3);
}

- (BOOL)showsVoiceSearchButton
{
  void *v2;
  BOOL v3;

  -[_SFDimmingButton superview](self->_voiceSearchButton, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setShowsVoiceSearchButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;

  v3 = a3;
  -[_SFDimmingButton superview](self->_voiceSearchButton, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (v5 == 0) ^ v3;

  if ((v6 & 1) == 0)
  {
    if (v3)
      -[SFCapsuleURLField addSubview:](self, "addSubview:", self->_voiceSearchButton);
    else
      -[_SFDimmingButton removeFromSuperview](self->_voiceSearchButton, "removeFromSuperview");
    -[SFCapsuleURLField setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateConstraints
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFCapsuleURLField;
  -[SFCapsuleURLField updateConstraints](&v6, sel_updateConstraints);
  -[_SFDimmingButton superview](self->_voiceSearchButton, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;
  v5 = v3 == 0;

  -[NSLayoutConstraint setActive:](self->_textFieldTrailingConstraint, "setActive:", v5);
  objc_msgSend(MEMORY[0x1E0CB3718], "sf_setConstraints:active:", self->_voiceSearchButtonConstraints, v4);
  -[SFCapsuleURLField _updateClearButtonVisibility](self, "_updateClearButtonVisibility");
}

- (void)_voiceSearchAvailabilityDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  +[SFVoiceSearchManager sharedManager](SFVoiceSearchManager, "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "availability");

  -[SFCapsuleURLField setShowsVoiceSearchButton:](self, "setShowsVoiceSearchButton:", v5 != 0);
  -[_SFDimmingButton setEnabled:](self->_voiceSearchButton, "setEnabled:", v5 == 1);
  if (v5 == 1)
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton setTintColor:](self->_voiceSearchButton, "setTintColor:", v6);

}

- (void)_tap:(id)a3
{
  -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder", a3);
}

- (void)_updateClearButtonVisibility
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;

  -[UITextField text](self->_textField, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\uFFFC"), &stru_1E21FE780);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  -[_SFDimmingButton superview](self->_voiceSearchButton, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = 1;
    v8 = 1.0;
  }
  else
  {
    v7 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout") ^ 1;
    v8 = 0.2;
  }
  -[_SFDimmingButton setHidden:](self->_clearTextButton, "setHidden:", v7 ^ 1);
  -[_SFDimmingButton setAlpha:](self->_clearTextButton, "setAlpha:", v8 * self->_nonKeyContentAlpha);
  -[_SFDimmingButton setUserInteractionEnabled:](self->_clearTextButton, "setUserInteractionEnabled:", v5 != 0);
  if (v6)
  {
    -[NSLayoutConstraint setActive:](self->_voiceSearchToClearButtonConstraint, "setActive:", v7);
    -[NSLayoutConstraint setActive:](self->_voiceSearchToCapsuleConstraint, "setActive:", v7 ^ 1);
  }
}

- (void)_updatePlaceholderText
{
  UITextField *textField;
  CGFloat Width;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];
  CGRect v16;

  v15[1] = *MEMORY[0x1E0C80C00];
  textField = self->_textField;
  -[UITextField bounds](textField, "bounds");
  -[UITextField placeholderRectForBounds:](textField, "placeholderRectForBounds:");
  Width = CGRectGetWidth(v16);
  if (Width != self->_lastPlaceholderWidth)
  {
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0DC1138];
    -[UITextField _placeholderLabel](self->_textField, "_placeholderLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sizeWithAttributes:", v8);
    v10 = v9;

    if (v10 <= Width)
    {
      -[UITextField setPlaceholder:](self->_textField, "setPlaceholder:", v5);
    }
    else
    {
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField setPlaceholder:](self->_textField, "setPlaceholder:", v11);

    }
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField _placeholderLabel](self->_textField, "_placeholderLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v12);

    self->_lastPlaceholderWidth = Width;
  }
}

- (void)_clearTextButtonTapped:(id)a3
{
  -[UITextField setText:](self->_textField, "setText:", &stru_1E21FE780);
  -[UITextField sendActionsForControlEvents:](self->_textField, "sendActionsForControlEvents:", 0x20000);
}

- (void)_voiceSearchButtonTapped:(id)a3
{
  void (**voiceSearchTappedAction)(void);

  voiceSearchTappedAction = (void (**)(void))self->_voiceSearchTappedAction;
  if (voiceSearchTappedAction)
    voiceSearchTappedAction[2]();
}

- (CGAffineTransform)keyContentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].c;
  return self;
}

- (CGAffineTransform)microphoneContentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[12].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[11].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[12].c;
  return self;
}

- (double)nonKeyContentAlpha
{
  return self->_nonKeyContentAlpha;
}

- (UITextField)textField
{
  return self->_textField;
}

- (id)voiceSearchTappedAction
{
  return self->_voiceSearchTappedAction;
}

- (void)setVoiceSearchTappedAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (_NSRange)rangeOfKeyText
{
  _NSRange *p_rangeOfKeyText;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_rangeOfKeyText = &self->_rangeOfKeyText;
  location = self->_rangeOfKeyText.location;
  length = p_rangeOfKeyText->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeOfKeyText:(_NSRange)a3
{
  self->_rangeOfKeyText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_voiceSearchTappedAction, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_voiceSearchButtonConstraints, 0);
  objc_storeStrong((id *)&self->_voiceSearchButton, 0);
  objc_storeStrong((id *)&self->_voiceSearchToCapsuleConstraint, 0);
  objc_storeStrong((id *)&self->_voiceSearchToClearButtonConstraint, 0);
  objc_storeStrong((id *)&self->_clearTextButton, 0);
  objc_storeStrong((id *)&self->_textFieldTrailingConstraint, 0);
}

@end
