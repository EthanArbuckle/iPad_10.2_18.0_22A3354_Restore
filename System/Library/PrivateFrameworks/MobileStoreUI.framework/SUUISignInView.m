@implementation SUUISignInView

- (SUUISignInView)initWithFrame:(CGRect)a3
{
  SUUISignInView *v3;
  uint64_t v4;
  UIColor *borderColor;
  NSMutableArray *v6;
  NSMutableArray *labels;
  NSMutableArray *v8;
  NSMutableArray *textFields;
  uint64_t v10;
  NSMapTable *viewFontDescriptors;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUUISignInView;
  v3 = -[SUUISignInView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
    v4 = objc_claimAutoreleasedReturnValue();
    borderColor = v3->_borderColor;
    v3->_borderColor = (UIColor *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    labels = v3->_labels;
    v3->_labels = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    textFields = v3->_textFields;
    v3->_textFields = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    viewFontDescriptors = v3->_viewFontDescriptors;
    v3->_viewFontDescriptors = (NSMapTable *)v10;

  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  objc_msgSend(a4, "firstChildForElementType:", 138, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "_fontDescriptorWithViewElement:defaultTextStyle:bold:", v7, *MEMORY[0x24BEBE1E0], 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v8, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_scaledValueForValue:", 50.0);
    v11 = v10 + v10;

  }
  else
  {
    a3 = *MEMORY[0x24BDBF148];
    v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v12 = a3;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  SUUIViewElement *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIColor *v11;
  UIColor *borderColor;
  UIColor *v13;
  UIColor *v14;
  SUUIViewElement *viewElement;
  SUUIViewElement *v16;
  _QWORD v17[5];

  v6 = (SUUIViewElement *)a3;
  -[SUUISignInView _clearFieldsAndLabels](self, "_clearFieldsAndLabels");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __54__SUUISignInView_reloadWithViewElement_width_context___block_invoke;
  v17[3] = &unk_2511F46F8;
  v17[4] = self;
  -[SUUIViewElement enumerateChildrenUsingBlock:](v6, "enumerateChildrenUsingBlock:", v17);
  -[SUUIViewElement style](v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ikBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SUUISignInView setBackgroundColor:](self, "setBackgroundColor:", v9);
  objc_msgSend(v7, "ikBorderColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "color");
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  borderColor = self->_borderColor;
  self->_borderColor = v11;

  if (!self->_borderColor)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
    v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v14 = self->_borderColor;
    self->_borderColor = v13;

  }
  viewElement = self->_viewElement;
  self->_viewElement = v6;
  v16 = v6;

  -[SUUISignInView setNeedsLayout](self, "setNeedsLayout");
}

void __54__SUUISignInView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "elementType");
  if (v3 == 140)
  {
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "count") <= 1)
    {
      v4 = v11;
      objc_msgSend((id)objc_opt_class(), "_textFieldWithViewElement:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "addSubview:", v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "addObject:", v5);
      v6 = (void *)objc_opt_class();
      v7 = *MEMORY[0x24BEBE1E0];
      v8 = v4;
      v9 = 0;
      goto LABEL_7;
    }
  }
  else if (v3 == 138 && (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "count") <= 1)
  {
    v4 = v11;
    objc_msgSend((id)objc_opt_class(), "_labelWithViewElement:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addObject:", v5);
    v6 = (void *)objc_opt_class();
    v7 = *MEMORY[0x24BEBE1E0];
    v8 = v4;
    v9 = 1;
LABEL_7:
    objc_msgSend(v6, "_fontDescriptorWithViewElement:defaultTextStyle:bold:", v8, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setObject:forKey:", v10, v5);
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUISignInView;
  return -[SUUISignInView becomeFirstResponder](&v3, sel_becomeFirstResponder);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_textFields;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isFirstResponder") & 1) != 0)
        {
          v9 = objc_msgSend(v8, "resignFirstResponder");

          return v9;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)SUUISignInView;
  return -[SUUISignInView resignFirstResponder](&v11, sel_resignFirstResponder);
}

- (void)layoutSubviews
{
  SUUIShapeView *v3;
  SUUIShapeView *v4;
  SUUIShapeView *borderView;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  id v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)SUUISignInView;
  -[SUUISignInView layoutSubviews](&v18, sel_layoutSubviews);
  if (!self->_borderView)
  {
    v3 = [SUUIShapeView alloc];
    v4 = -[SUUIShapeView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    borderView = self->_borderView;
    self->_borderView = v4;

    -[SUUIShapeView setUserInteractionEnabled:](self->_borderView, "setUserInteractionEnabled:", 0);
    -[SUUISignInView addSubview:](self, "addSubview:", self->_borderView);
  }
  -[SUUISignInView _layoutLabels](self, "_layoutLabels");
  -[SUUISignInView _layoutTextFieldsOffsetX:](self, "_layoutTextFieldsOffsetX:");
  -[SUUIShapeView layer](self->_borderView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeColor:", -[UIColor CGColor](self->_borderColor, "CGColor"));
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = 1.0 / v9;

  objc_msgSend(v6, "setLineWidth:", v10);
  -[SUUISignInView bounds](self, "bounds");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  v15 = CGRectGetWidth(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v16 = CGRectGetHeight(v20);
  -[SUUIShapeView setFrame:](self->_borderView, "setFrame:", 0.0, 0.0, v15, v16);
  objc_msgSend((id)objc_opt_class(), "_borderPathWithSize:", v15, v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setPath:", objc_msgSend(v17, "CGPath"));

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char v19;
  CGSize result;

  width = a3.width;
  -[NSMutableArray firstObject](self->_labels, "firstObject", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMapTable objectForKey:](self->_viewFontDescriptors, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v6, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_scaledValueForValue:", 50.0);
    v9 = v8 + v8;
    v19 = 0;
    -[SUUIViewElement style](self->_viewElement, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementMarginForStyle(v10, &v19);
    v12 = v11;
    v14 = v13;

    v15 = v12 + v14;
    if (!v19)
      v15 = 0.0;
    v16 = width - v15;

  }
  else
  {
    v16 = *MEMORY[0x24BDBF148];
    v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v17 = v16;
  v18 = v9;
  result.height = v18;
  result.width = v17;
  return result;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v6 = objc_msgSend(a5, "isEqualToString:", CFSTR("\n"), a4.location, a4.length);
  if (v6)
  {
    -[SUUISignInView _accountNameText](self, "_accountNameText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISignInView _applePasswordText](self, "_applePasswordText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      if (objc_msgSend(v8, "length"))
      {
        -[SUUISignInView delegate](self, "delegate");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          -[SUUISignInView delegate](self, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_2571E6200);

          if (v12)
          {
            -[SUUISignInView delegate](self, "delegate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "signInEntryComplete:accountName:password:", self, v7, v8);

          }
        }
      }
    }
    -[SUUISignInView resignFirstResponder](self, "resignFirstResponder");

  }
  return v6 ^ 1;
}

+ (id)_borderPathWithSize:(CGSize)a3
{
  double width;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  CGFloat v10;
  double v12;

  width = a3.width;
  v4 = a3.height * 0.5;
  v5 = a3.height * 0.5 + -1.0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = 1.0 / v7;
  v12 = 1.0 / v7;

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "moveToPoint:", 0.0, v5);
  objc_msgSend(v9, "addLineToPoint:", 0.0, 5.0);
  objc_msgSend(v9, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 5.0, 5.0, 5.0, 3.14159265, 4.71238898);
  objc_msgSend(v9, "addLineToPoint:", width + -5.0, 0.0);
  objc_msgSend(v9, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, width + -5.0, 5.0, 5.0, 4.71238898, 0.0);
  objc_msgSend(v9, "addLineToPoint:", width, v5);
  objc_msgSend(v9, "moveToPoint:", width, v5 + v8);
  v10 = v4 * 2.0 + -5.0;
  objc_msgSend(v9, "addLineToPoint:", width, v10);
  objc_msgSend(v9, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, width + -5.0, v10, 5.0, 0.0, 1.57079633);
  objc_msgSend(v9, "addLineToPoint:", 5.0, v4 + v4);
  objc_msgSend(v9, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 5.0, v10, 5.0, 1.57079633, 3.14159265);
  objc_msgSend(v9, "addLineToPoint:", 0.0, v5 + v8);
  objc_msgSend(v9, "moveToPoint:", v12, v5);
  objc_msgSend(v9, "lineToPoint:", width - v12, v5);
  return v9;
}

+ (id)_fontDescriptorWithViewElement:(id)a3 defaultTextStyle:(id)a4 bold:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (!v7)
    goto LABEL_3;
  objc_msgSend(v7, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fontDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (v5)
    {
      objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", 2);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
  }

  return v11;
}

+ (id)_labelWithViewElement:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x24BEBD708];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v8);

  objc_msgSend(v4, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "ikColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setTextColor:", v11);

  return v6;
}

+ (id)_textFieldWithViewElement:(id)a3
{
  id v3;
  SUUISignInTextView *v4;
  SUUISignInTextView *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = [SUUISignInTextView alloc];
  v5 = -[SUUISignInTextView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = objc_msgSend(v3, "keyboardType");
  if (objc_msgSend(v3, "isSecure"))
    -[SUUISignInTextView setSecureTextEntry:](v5, "setSecureTextEntry:", 1);
  -[SUUISignInTextView setKeyboardType:](v5, "setKeyboardType:", v6);
  objc_msgSend(v3, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ikColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SUUISignInTextView setTextColor:](v5, "setTextColor:", v9);
  objc_msgSend(v3, "placeholderText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v3, "placeholderText");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_2511FF0C8;
  }

  v12 = objc_alloc(MEMORY[0x24BDBCE70]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", v13, *MEMORY[0x24BEBB368], 0);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v11, v14);
  -[SUUISignInTextView setAttributedPlaceholder:](v5, "setAttributedPlaceholder:", v15);

  return v5;
}

- (id)_accountNameText
{
  void *v3;
  void *v4;

  if (-[NSMutableArray count](self->_textFields, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_textFields, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_applePasswordText
{
  void *v3;
  void *v4;

  if ((unint64_t)-[NSMutableArray count](self->_textFields, "count") < 2)
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_textFields, "objectAtIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_clearFieldsAndLabels
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_labels;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_labels, "removeAllObjects");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_textFields;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "removeFromSuperview", (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

  -[NSMutableArray removeAllObjects](self->_textFields, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_viewFontDescriptors, "removeAllObjects");
}

- (double)_layoutLabels
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSMutableArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_labels;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    v6 = 0.0;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_viewFontDescriptors, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v10, 0.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFont:", v11);
        objc_msgSend(v9, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
        v13 = v12;
        v15 = v14;
        objc_msgSend(v11, "_scaledValueForValue:", 29.0);
        v17 = v16;
        objc_msgSend(v9, "_firstBaselineOffsetFromTop");
        objc_msgSend(v9, "setFrame:", 12.0, v7 + v17 - v18, v13, v15);
        objc_msgSend(v11, "_scaledValueForValue:", 50.0);
        v7 = v7 + v19;
        v6 = fmax(v6, v13);

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (void)_layoutTextFieldsOffsetX:(double)a3
{
  double Width;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSMutableArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;

  v29 = *MEMORY[0x24BDAC8D0];
  -[SUUISignInView bounds](self, "bounds");
  Width = CGRectGetWidth(v30);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_textFields;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = Width - a3 + -22.0 + -12.0;
    v9 = *(_QWORD *)v25;
    v10 = a3 + 22.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_viewFontDescriptors, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v14, 0.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFont:", v15);
        objc_msgSend(v13, "_placeholderLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sizeThatFits:", v8, 1.79769313e308);
        v18 = v17;
        objc_msgSend(v15, "_scaledValueForValue:", 29.0);
        v20 = v19;
        objc_msgSend(v16, "_firstBaselineOffsetFromTop");
        objc_msgSend(v13, "setFrame:", v10, v11 + v20 - v21, v8, v18);
        objc_msgSend(v15, "_scaledValueForValue:", 50.0);
        v11 = v11 + v22;

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

}

- (SUUISignInViewDelegate)delegate
{
  return (SUUISignInViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewFontDescriptors, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_textFields, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
