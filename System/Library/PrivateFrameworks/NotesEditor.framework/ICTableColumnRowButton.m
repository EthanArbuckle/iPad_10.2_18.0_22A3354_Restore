@implementation ICTableColumnRowButton

- (ICTableColumnRowButton)initWithCoder:(id)a3
{
  return (ICTableColumnRowButton *)-[ICTableColumnRowButton initAsColumn:isLeftToRight:](self, "initAsColumn:isLeftToRight:", 0, 1);
}

- (ICTableColumnRowButton)initWithFrame:(CGRect)a3
{
  return (ICTableColumnRowButton *)-[ICTableColumnRowButton initAsColumn:isLeftToRight:](self, "initAsColumn:isLeftToRight:", 0, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)initAsColumn:(BOOL)a3 isLeftToRight:(BOOL)a4
{
  ICTableColumnRowButton *v6;
  ICTableColumnRowButton *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICTableColumnRowButton;
  v6 = -[ICTableColumnRowButton initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_isColumn = a3;
    v6->_isLTR = a4;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_accessibilityDarkerSystemColorsStatusDidChange_, *MEMORY[0x1E0DC4508], 0);

    -[ICTableColumnRowButton updateConfiguration](v7, "updateConfiguration");
  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICTableColumnRowButton;
  -[ICTableColumnRowButton dealloc](&v4, sel_dealloc);
}

- (void)updateConfiguration
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
  _BOOL4 v12;
  const __CFString *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithFont:scale:", v4, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[ICTableColumnRowButton isSelected](self, "isSelected") & 1) != 0)
  {
    objc_msgSend(v6, "setBaseBackgroundColor:", 0);
  }
  else
  {
    if (UIAccessibilityDarkerSystemColorsEnabled())
      objc_msgSend(MEMORY[0x1E0DC3658], "ICDarkenedTintColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "ICTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBaseBackgroundColor:", v7);

  }
  if ((-[ICTableColumnRowButton isSelected](self, "isSelected") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBaseForegroundColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "background");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  objc_msgSend(v6, "background");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", 0.0);

  if (-[ICTableColumnRowButton isSelected](self, "isSelected"))
  {
    v12 = -[ICTableColumnRowButton isColumn](self, "isColumn");
    if (v12)
      v13 = CFSTR("attachment_table_column_header");
    else
      v13 = CFSTR("attachment_table_row_header");
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", v13, v19, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = !v12;
  }
  else
  {
    v12 = 0;
    v14 = 0;
    v15 = 0;
  }
  objc_msgSend(v6, "background");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v15);

  if (v14)
  if (v12)

  objc_msgSend(v6, "setCornerStyle:", -1);
  if (-[ICTableColumnRowButton isColumn](self, "isColumn"))
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("ellipsis"), v5);
  else
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", CFSTR("ellipsis.vertical"), v19, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v17);

  objc_msgSend(v6, "updatedConfigurationForButton:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableColumnRowButton setConfiguration:](self, "setConfiguration:", v18);

  -[ICTableColumnRowButton setPointerInteractionEnabled:](self, "setPointerInteractionEnabled:", -[ICTableColumnRowButton isSelected](self, "isSelected") ^ 1);
  -[ICTableColumnRowButton setPointerStyleProvider:](self, "setPointerStyleProvider:", &__block_literal_global_7);

}

id __45__ICTableColumnRowButton_updateConfiguration__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double x;
  double y;
  double width;
  double height;
  void *v13;
  void *v14;
  CGRect v16;
  CGRect v17;

  v2 = (objc_class *)MEMORY[0x1E0DC3D90];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithView:", v5);

  objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "frame");
  v17 = CGRectInset(v16, -4.0, -4.0);
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;

  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:", x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v7, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[ICTableColumnRowButton touchRect](self, "touchRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (CGRect)touchRect
{
  CGFloat MidX;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect result;
  CGRect v23;

  -[ICTableColumnRowButton bounds](self, "bounds");
  MidX = CGRectGetMidX(v16);
  -[ICTableColumnRowButton bounds](self, "bounds");
  v18.origin.y = CGRectGetMidY(v17);
  v18.size.width = 0.0;
  v18.size.height = 0.0;
  v18.origin.x = MidX;
  v19 = CGRectInset(v18, -16.0, -16.0);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  if (-[ICTableColumnRowButton isSelected](self, "isSelected"))
  {
    -[ICTableColumnRowButton bounds](self, "bounds");
    v23.origin.x = v8;
    v23.origin.y = v9;
    v23.size.width = v10;
    v23.size.height = v11;
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v21 = CGRectUnion(v20, v23);
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)accessibilityContainer
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICTableColumnRowButton;
  -[ICTableColumnRowButton accessibilityContainer](&v7, sel_accessibilityContainer);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    while (!objc_msgSend(v4, "conformsToProtocol:", &unk_1F04A7230))
    {
      objc_msgSend(v4, "accessibilityContainer");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v5;
      if (!v5)
        goto LABEL_8;
    }
    v4 = v4;

    v3 = v4;
  }
  else
  {
    v4 = 0;
  }
LABEL_8:

  return v3;
}

- (NSArray)columnOrRowIdentifiers
{
  return self->_columnOrRowIdentifiers;
}

- (void)setColumnOrRowIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_columnOrRowIdentifiers, a3);
}

- (BOOL)isColumn
{
  return self->_isColumn;
}

- (BOOL)isLTR
{
  return self->_isLTR;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnOrRowIdentifiers, 0);
}

@end
