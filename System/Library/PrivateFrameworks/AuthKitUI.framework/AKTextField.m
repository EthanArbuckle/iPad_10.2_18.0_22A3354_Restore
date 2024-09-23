@implementation AKTextField

- (AKTextField)initWithFrame:(CGRect)a3
{
  AKTextField *v3;
  AKTextField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKTextField;
  v3 = -[AKTextField initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AKTextField _commonInit](v3, "_commonInit");
  return v4;
}

- (AKTextField)initWithCoder:(id)a3
{
  AKTextField *v3;
  AKTextField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKTextField;
  v3 = -[AKTextField initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AKTextField _commonInit](v3, "_commonInit");
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB3F0], 0);

  v4.receiver = self;
  v4.super_class = (Class)AKTextField;
  -[AKTextField dealloc](&v4, sel_dealloc);
}

- (void)_commonInit
{
  id v3;

  -[AKTextField _setupInlineEntryStyleViews](self, "_setupInlineEntryStyleViews");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateFonts_, *MEMORY[0x1E0CEB3F0], 0);

}

- (void)setEnabled:(BOOL)a3
{
  id v4;

  -[UITextField setEnabled:](self->_entryField, "setEnabled:", a3);
  -[AKTextField _fieldTextColor](self, "_fieldTextColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextColor:](self->_entryField, "setTextColor:", v4);

}

- (BOOL)isEnabled
{
  return -[UITextField isEnabled](self->_entryField, "isEnabled");
}

- (id)_setupBackgroundViewConstriants
{
  void *v3;
  void *v4;
  uint64_t v5;
  UIImageView *v6;
  UIImageView *backgroundImageView;
  UIImageView *v8;
  void *v9;
  void *v10;
  UIVisualEffectView *v11;
  UIVisualEffectView *visualEffectView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIVisualEffectView *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __46__AKTextField__setupBackgroundViewConstriants__block_invoke;
  v22[3] = &unk_1E76790C8;
  v22[4] = self;
  -[AKTextField cachedImageUsingBlock:](self, "cachedImageUsingBlock:", v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AKTextField usesVibrancy](self, "usesVibrancy"))
  {
    objc_msgSend(v4, "imageWithRenderingMode:", 2);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v4);
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = v6;

  v8 = v6;
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (-[AKTextField usesVibrancy](self, "usesVibrancy"))
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", -[AKTextField blurEffectStyle](self, "blurEffectStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v10);
    visualEffectView = self->_visualEffectView;
    self->_visualEffectView = v11;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_visualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_backgroundImageView);

    _NSDictionaryOfVariableBindings(CFSTR("_backgroundImageView"), self->_backgroundImageView, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_backgroundImageView]|"), 0, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_backgroundImageView]|"), 0, 0, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v15);
    objc_msgSend(v3, "addObjectsFromArray:", v16);
    v17 = self->_visualEffectView;

    v8 = (UIImageView *)v17;
  }
  -[AKTextField insertSubview:atIndex:](self, "insertSubview:atIndex:", v8, 0);
  _NSDictionaryOfVariableBindings(CFSTR("backgroundView"), v8, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[backgroundView]|"), 0, 0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[backgroundView]|"), 0, 0, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v19);
  objc_msgSend(v3, "addObjectsFromArray:", v20);

  return v3;
}

uint64_t __46__AKTextField__setupBackgroundViewConstriants__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backgroundImage");
}

- (void)_updateFonts:(id)a3
{
  -[AKTextField _setupLabelAndFieldStyles](self, "_setupLabelAndFieldStyles", a3);
  -[AKTextField setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (id)_fieldTextColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[AKTextField entryFieldTextColor](self, "entryFieldTextColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)_setupLabelAndFieldStyles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB558], 0, 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v8, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextField _fieldTextColor](self, "_fieldTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextColor:](self->_entryField, "setTextColor:", v4);

  -[UITextField setFont:](self->_entryField, "setFont:", v3);
  -[UITextField _placeholderLabel](self->_entryField, "_placeholderLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "placeholderTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField _placeholderLabel](self->_entryField, "_placeholderLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[UITextField setKeyboardAppearance:](self->_entryField, "setKeyboardAppearance:", 0);
}

- (void)_setupInlineEntryStyleViews
{
  UIImageView *backgroundImageView;
  UIVisualEffectView *visualEffectView;
  NSMutableArray *v5;
  NSMutableArray *constraints;
  AKTextField *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  UITextField *entryField;
  id v15;
  UITextField *v16;
  UITextField *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableArray *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  -[UIImageView removeFromSuperview](self->_backgroundImageView, "removeFromSuperview");
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = 0;

  -[UIVisualEffectView removeFromSuperview](self->_visualEffectView, "removeFromSuperview");
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = 0;

  -[UITextField removeFromSuperview](self->_entryField, "removeFromSuperview");
  if (self->_constraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  constraints = self->_constraints;
  self->_constraints = v5;

  v7 = self;
  -[AKTextField setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v8) = 1144750080;
  -[AKTextField setContentCompressionResistancePriority:forAxis:](v7, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  LODWORD(v9) = 1144750080;
  -[AKTextField setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 1, v9);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 8, 0, 0, 8, 1.0, 44.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1148846080;
  objc_msgSend(v10, "setPriority:", v11);
  v32 = v10;
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v10);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, 0, 0, 7, 1.0, 288.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1148846080;
  objc_msgSend(v12, "setPriority:", v13);
  v31 = v12;
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v12);
  entryField = self->_entryField;
  if (!entryField)
  {
    v15 = objc_alloc(MEMORY[0x1E0CEAAD0]);
    v16 = (UITextField *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v17 = self->_entryField;
    self->_entryField = v16;

    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_entryField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v18) = 1132068864;
    -[UITextField setContentHuggingPriority:forAxis:](self->_entryField, "setContentHuggingPriority:forAxis:", 0, v18);
    entryField = self->_entryField;
  }
  -[AKTextField addSubview:](v7, "addSubview:", entryField);
  -[AKTextField _setupLabelAndFieldStyles](v7, "_setupLabelAndFieldStyles");
  -[UITextField leadingAnchor](self->_entryField, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextField leadingAnchor](v7, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 16.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v19;
  -[UITextField trailingAnchor](self->_entryField, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextField trailingAnchor](v7, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -16.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v22;
  -[UITextField centerYAnchor](self->_entryField, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextField centerYAnchor](v7, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObjectsFromArray:](self->_constraints, "addObjectsFromArray:", v26);
  v27 = self->_constraints;
  -[AKTextField _setupBackgroundViewConstriants](v7, "_setupBackgroundViewConstriants");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v27, "addObjectsFromArray:", v28);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
}

- (void)setUsesVibrancy:(BOOL)a3
{
  self->_usesVibrancy = a3;
  -[AKTextField _commonInit](self, "_commonInit");
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  self->_blurEffectStyle = a3;
  -[AKTextField _commonInit](self, "_commonInit");
}

- (void)setFieldBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_fieldBackgroundColor, a3);
  -[AKTextField _commonInit](self, "_commonInit");
}

- (void)setRowIdentifier:(int64_t)a3
{
  UIImageView *backgroundImageView;
  void *v5;
  id v6;

  self->_rowIdentifier = a3;
  -[UIImageView removeFromSuperview](self->_backgroundImageView, "removeFromSuperview");
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = 0;

  v5 = (void *)MEMORY[0x1E0CB3718];
  -[AKTextField _setupBackgroundViewConstriants](self, "_setupBackgroundViewConstriants");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateConstraints:", v6);

}

- (id)backgroundImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  CGSize v20;

  v3 = 35.0;
  v4 = 0.0;
  v20.width = 35.0;
  v20.height = 35.0;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  switch(self->_rowIdentifier)
  {
    case 0:
      UIRectInset();
      v4 = v7;
      v3 = v8;
      v9 = 13;
      v10 = 3;
      break;
    case 1:
      UIRectInset();
      v4 = v11;
      v3 = v12;
      v9 = 16;
      v10 = 12;
      break;
    case 2:
      UIRectInset();
      v4 = v13;
      v3 = v14;
      v10 = 0;
      v9 = 13;
      break;
    case 3:
      UIRectInset();
      v4 = v15;
      v3 = v16;
      v9 = 16;
      v10 = -1;
      break;
    default:
      v10 = 0;
      v9 = 16;
      v6 = 35.0;
      v5 = 0.0;
      break;
  }
  -[AKTextField _drawBackgroundForPathRect:roundedCorners:cornerRadius:pathSegments:](self, "_drawBackgroundForPathRect:roundedCorners:cornerRadius:pathSegments:", v10, v9, v5, v4, v6, v3, 10.5);
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v17, "resizableImageWithCapInsets:", 17.0, 17.0, 17.0, 17.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_drawBackgroundForPathRect:(CGRect)a3 roundedCorners:(unint64_t)a4 cornerRadius:(double)a5 pathSegments:(int)a6
{
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;

  v6 = *(_QWORD *)&a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_blurEffectStyle == 4 && self->_fieldBackgroundColor)
  {
    if (self->_usesVibrancy)
      -[AKTextField drawFillForPathRect:roundedCorners:cornerRadius:](self, "drawFillForPathRect:roundedCorners:cornerRadius:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
    -[AKTextField drawStrokeForPathRect:roundedCorners:cornerRadius:pathSegments:](self, "drawStrokeForPathRect:roundedCorners:cornerRadius:pathSegments:", a4, v6, x, y, width, height, a5);
  }
  else
  {
    -[AKTextField drawStrokeForPathRect:roundedCorners:cornerRadius:pathSegments:](self, "drawStrokeForPathRect:roundedCorners:cornerRadius:pathSegments:", a4, *(_QWORD *)&a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
    if (self->_usesVibrancy)
      -[AKTextField drawFillForPathRect:roundedCorners:cornerRadius:](self, "drawFillForPathRect:roundedCorners:cornerRadius:", a4, x, y, width, height, a5);
  }
}

- (void)drawStrokeForPathRect:(CGRect)a3 roundedCorners:(unint64_t)a4 cornerRadius:(double)a5 pathSegments:(int)a6
{
  void *v6;
  double v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CEA390], "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", a4, *(_QWORD *)&a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v9, "setLineWidth:", 1.5 / v7);

  objc_msgSend(v9, "setUsesEvenOddFillRule:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "opaqueSeparatorColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "set");

  objc_msgSend(v9, "stroke");
}

- (void)drawFillForPathRect:(CGRect)a3 roundedCorners:(unint64_t)a4 cornerRadius:(double)a5
{
  void *v6;
  double v7;
  UIColor *fieldBackgroundColor;
  UIColor *v9;
  UIColor *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CEA390], "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", a4, 16, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v11, "setLineWidth:", 1.0 / v7);

  objc_msgSend(v11, "setUsesEvenOddFillRule:", 1);
  fieldBackgroundColor = self->_fieldBackgroundColor;
  if (fieldBackgroundColor)
  {
    v9 = fieldBackgroundColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  -[UIColor set](v9, "set");
  objc_msgSend(v11, "fill");

}

- (id)cachedImageUsingBlock:(id)a3
{
  void *v4;
  int64_t rowIdentifier;
  int64_t blurEffectStyle;
  _BOOL8 usesVibrancy;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v16)(id, int64_t, int64_t);

  v16 = (void (**)(id, int64_t, int64_t))a3;
  if (cachedImageUsingBlock__onceToken != -1)
    dispatch_once(&cachedImageUsingBlock__onceToken, &__block_literal_global_3);
  v4 = (void *)MEMORY[0x1E0CB3940];
  rowIdentifier = self->_rowIdentifier;
  blurEffectStyle = self->_blurEffectStyle;
  usesVibrancy = self->_usesVibrancy;
  -[AKTextField traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceStyle");
  -[UIColor description](self->_fieldBackgroundColor, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%llu-%llu-%llu-%llu-%@"), rowIdentifier, blurEffectStyle, usesVibrancy, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)cachedImageUsingBlock__imageCache, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v16[2](v16, self->_rowIdentifier, self->_blurEffectStyle);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)cachedImageUsingBlock__imageCache, "setObject:forKeyedSubscript:", v13, v11);

  }
  objc_msgSend((id)cachedImageUsingBlock__imageCache, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __37__AKTextField_cachedImageUsingBlock___block_invoke()
{
  id v0;
  void *v1;
  NSObject *object;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)cachedImageUsingBlock__imageCache;
  cachedImageUsingBlock__imageCache = (uint64_t)v0;

  object = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 4uLL, MEMORY[0x1E0C80D38]);
  dispatch_source_set_event_handler(object, &__block_literal_global_33);
  dispatch_resume(object);

}

uint64_t __37__AKTextField_cachedImageUsingBlock___block_invoke_2()
{
  return objc_msgSend((id)cachedImageUsingBlock__imageCache, "removeAllObjects");
}

- (UITextField)entryField
{
  return self->_entryField;
}

- (int64_t)rowIdentifier
{
  return self->_rowIdentifier;
}

- (BOOL)usesVibrancy
{
  return self->_usesVibrancy;
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (UIColor)fieldBackgroundColor
{
  return self->_fieldBackgroundColor;
}

- (UIColor)entryDescriptionTextColor
{
  return self->_entryDescriptionTextColor;
}

- (void)setEntryDescriptionTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_entryDescriptionTextColor, a3);
}

- (UIColor)entryFieldTextColor
{
  return self->_entryFieldTextColor;
}

- (void)setEntryFieldTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_entryFieldTextColor, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageView, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_entryFieldTextColor, 0);
  objc_storeStrong((id *)&self->_entryDescriptionTextColor, 0);
  objc_storeStrong((id *)&self->_fieldBackgroundColor, 0);
  objc_storeStrong((id *)&self->_entryField, 0);
}

@end
