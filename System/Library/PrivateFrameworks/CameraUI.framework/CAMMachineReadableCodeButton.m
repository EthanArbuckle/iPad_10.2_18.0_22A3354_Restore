@implementation CAMMachineReadableCodeButton

- (CAMMachineReadableCodeButton)initWithFrame:(CGRect)a3
{
  CAMMachineReadableCodeButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CAMMachineReadableCodeButton;
  v3 = -[CAMMachineReadableCodeButton initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerStyle:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBaseForegroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBaseBackgroundColor:", v6);

    objc_msgSend(v4, "setImagePlacement:", 8);
    objc_msgSend(v4, "setTitleLineBreakMode:", 4);
    objc_initWeak(&location, v3);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __46__CAMMachineReadableCodeButton_initWithFrame___block_invoke;
    v14 = &unk_1EA329730;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v4, "setImageColorTransformer:", &v11);
    -[CAMMachineReadableCodeButton setConfiguration:](v3, "setConfiguration:", v4, v11, v12, v13, v14);
    -[CAMMachineReadableCodeButton titleLabel](v3, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextAlignment:", 1);

    v18[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)-[CAMMachineReadableCodeButton registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v8, v3, sel_setNeedsUpdateConfiguration);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
  return v3;
}

id __46__CAMMachineReadableCodeButton_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isDismissable"))
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "colorWithAlphaComponent:", 0.3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)layoutSubviews
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__CAMMachineReadableCodeButton_layoutSubviews__block_invoke;
  v4[3] = &unk_1EA328868;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
  v3.receiver = self;
  v3.super_class = (Class)CAMMachineReadableCodeButton;
  -[CAMMachineReadableCodeButton layoutSubviews](&v3, sel_layoutSubviews);
}

void __46__CAMMachineReadableCodeButton_layoutSubviews__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "intrinsicContentSize");
  CEKRectWithSize();
  objc_msgSend(v1, "frameForAlignmentRect:");
  CEKRectWithSize();
  objc_msgSend(v1, "setBounds:");

}

- (void)updateConfiguration
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  double v16;
  id v17;

  -[CAMMachineReadableCodeButton configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatedConfigurationForButton:", self);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[CAMMachineReadableCodeButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v5 = -[CAMMachineReadableCodeButton isDismissable](self, "isDismissable");
  v6 = CFSTR("chevron.right");
  if (v4 == 1)
    v6 = CFSTR("chevron.left");
  if (v5)
    v6 = CFSTR("xmark");
  v7 = v6;
  -[CAMMachineReadableCodeButton traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMFont cameraFontForContentSize:](CAMFont, "cameraFontForContentSize:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setImage:", v12);
  -[CAMMachineReadableCodeButton currentAttributedTitle](self, "currentAttributedTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v10, 0, objc_msgSend(v14, "length"));
  objc_msgSend(v17, "setAttributedTitle:", v14);
  v15 = -[CAMMachineReadableCodeButton isDismissable](self, "isDismissable");
  v16 = 4.0;
  if (v15)
    v16 = 10.0;
  objc_msgSend(v17, "setImagePadding:", v16);
  -[CAMMachineReadableCodeButton setConfiguration:](self, "setConfiguration:", v17);

}

- (void)setAttributedTitleWithTitle:(id)a3 image:(id)a4
{
  UIImage *v6;
  char v7;
  UIImage **p_titleImage;
  UIImage *titleImage;
  NSString *v10;
  NSString *title;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;

  v17 = (NSString *)a3;
  v6 = (UIImage *)a4;
  if (self->_title == v17)
  {
    p_titleImage = &self->_titleImage;
    if (self->_titleImage == v6)
      goto LABEL_15;
  }
  else
  {
    v7 = -[NSString isEqual:](v17, "isEqual:");
    p_titleImage = &self->_titleImage;
    titleImage = self->_titleImage;
    if ((v7 & 1) != 0)
    {
      if (titleImage == v6)
        goto LABEL_15;
    }
    else
    {
      v10 = (NSString *)-[NSString copy](v17, "copy");
      title = self->_title;
      self->_title = v10;

      if (titleImage == v6)
        goto LABEL_9;
    }
  }
  objc_storeStrong((id *)p_titleImage, a4);
LABEL_9:
  v12 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendAttributedString:", v14);

    if (v17)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
      objc_msgSend(v12, "appendAttributedString:", v15);

LABEL_13:
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v17);
      objc_msgSend(v12, "appendAttributedString:", v16);

    }
  }
  else if (v17)
  {
    goto LABEL_13;
  }
  -[CAMMachineReadableCodeButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v12, 0);
  -[CAMMachineReadableCodeButton setNeedsLayout](self, "setNeedsLayout");

LABEL_15:
}

- (void)setDismissable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (self->_dismissable != a3)
  {
    v3 = a3;
    self->_dismissable = a3;
    -[CAMMachineReadableCodeButton imageView](self, "imageView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInteractionEnabled:", v3);
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v8, "setHitTestInsets:");
    if (v3)
    {
      objc_msgSend(v8, "gestureRecognizers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (!v6)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__didTapDismiss_);
        objc_msgSend(v8, "addGestureRecognizer:", v7);

      }
    }
    -[CAMMachineReadableCodeButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");

  }
}

- (void)_didTapDismiss:(id)a3
{
  id v4;

  -[CAMMachineReadableCodeButton delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "machineReadableCodeButtonDidTapDismiss:", self);

}

- (BOOL)isDismissable
{
  return self->_dismissable;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (CAMMachineReadableCodeButtonDelegate)delegate
{
  return (CAMMachineReadableCodeButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
