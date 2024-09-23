@implementation SUUIPINInputControl

- (SUUIPINInputControl)initWithFrame:(CGRect)a3
{
  SUUIPINInputControl *v3;
  uint64_t v4;
  UIColor *boxBackgroundColor;
  uint64_t v6;
  UIColor *boxBorderColor;
  uint64_t v8;
  UIFont *font;
  uint64_t v10;
  UIColor *textColor;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUUIPINInputControl;
  v3 = -[SUUIPINInputControl initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v4 = objc_claimAutoreleasedReturnValue();
    boxBackgroundColor = v3->_boxBackgroundColor;
    v3->_boxBackgroundColor = (UIColor *)v4;

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
    v6 = objc_claimAutoreleasedReturnValue();
    boxBorderColor = v3->_boxBorderColor;
    v3->_boxBorderColor = (UIColor *)v6;

    objc_msgSend(MEMORY[0x24BEBB520], "_lightSystemFontOfSize:", 28.0);
    v8 = objc_claimAutoreleasedReturnValue();
    font = v3->_font;
    v3->_font = (UIFont *)v8;

    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v10 = objc_claimAutoreleasedReturnValue();
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v10;

    v3->_numberOfCharacters = 4;
    -[SUUIPINInputControl _reloadLabelSubviews](v3, "_reloadLabelSubviews");
  }
  return v3;
}

- (void)setBoxBackgroundColor:(id)a3
{
  UIColor *v4;
  UIColor *boxBackgroundColor;

  if (self->_boxBackgroundColor != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    boxBackgroundColor = self->_boxBackgroundColor;
    self->_boxBackgroundColor = v4;

    -[SUUIPINInputControl _setNeedsReloadLayout](self, "_setNeedsReloadLayout");
  }
}

- (void)setBoxBorderColor:(id)a3
{
  UIColor *v4;
  UIColor *boxBorderColor;

  if (self->_boxBorderColor != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    boxBorderColor = self->_boxBorderColor;
    self->_boxBorderColor = v4;

    -[SUUIPINInputControl _setNeedsReloadLayout](self, "_setNeedsReloadLayout");
  }
}

- (void)setFont:(id)a3
{
  UIFont *v4;
  UIFont *font;

  if (self->_font != a3)
  {
    v4 = (UIFont *)objc_msgSend(a3, "copy");
    font = self->_font;
    self->_font = v4;

    -[SUUIPINInputControl _setNeedsReloadLayout](self, "_setNeedsReloadLayout");
  }
}

- (void)setNumberOfCharacters:(int64_t)a3
{
  if (self->_numberOfCharacters != a3)
  {
    self->_numberOfCharacters = a3;
    -[SUUIPINInputControl _setNeedsReloadLayout](self, "_setNeedsReloadLayout");
  }
}

- (void)setText:(id)a3
{
  NSMutableString *v4;
  NSMutableString *text;

  if (self->_text != a3)
  {
    v4 = (NSMutableString *)objc_msgSend(a3, "mutableCopy");
    text = self->_text;
    self->_text = v4;

    -[SUUIPINInputControl _setNeedsReloadLayout](self, "_setNeedsReloadLayout");
  }
}

- (void)setTextColor:(id)a3
{
  UIColor *v4;
  UIColor *textColor;

  if (self->_textColor != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    textColor = self->_textColor;
    self->_textColor = v4;

    -[SUUIPINInputControl _setNeedsReloadLayout](self, "_setNeedsReloadLayout");
  }
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
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  objc_msgSend(a4, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "_lightSystemFontOfSize:", 28.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "_defaultBoxSizeForFont:", v8);
  v10 = v9;

  v11 = a3;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  SUUIViewElement *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SUUIViewElement *viewElement;
  id v15;

  v6 = (SUUIViewElement *)a3;
  -[SUUIViewElement style](v6, "style");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ikBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SUUIPINInputControl setBoxBackgroundColor:](self, "setBoxBackgroundColor:", v8);
  objc_msgSend(v15, "ikBorderColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SUUIPINInputControl setBoxBorderColor:](self, "setBoxBorderColor:", v10);
  objc_msgSend(v15, "ikColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SUUIPINInputControl setTextColor:](self, "setTextColor:", v12);
  SUUIViewElementFontWithStyle(v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "_lightSystemFontOfSize:", 28.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SUUIPINInputControl setFont:](self, "setFont:", v13);
  -[SUUIPINInputControl setKeyboardType:](self, "setKeyboardType:", -[SUUIViewElement keyboardType](v6, "keyboardType"));
  -[SUUIPINInputControl setNumberOfCharacters:](self, "setNumberOfCharacters:", -[SUUIViewElement maximumLength](v6, "maximumLength"));
  -[SUUIPINInputControl setSecureTextEntry:](self, "setSecureTextEntry:", -[SUUIViewElement isSecure](v6, "isSecure"));
  viewElement = self->_viewElement;
  self->_viewElement = v6;

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

- (void)deleteBackward
{
  uint64_t v3;

  v3 = -[NSMutableString length](self->_text, "length");
  if (v3 >= 1)
  {
    -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", v3 - 1, 1);
    -[SUUIPINInputControl _setNeedsReloadLayout](self, "_setNeedsReloadLayout");
    -[SUUIPINInputControl _sendValueChangeEvents](self, "_sendValueChangeEvents");
  }
}

- (BOOL)hasText
{
  return -[NSMutableString length](self->_text, "length") != 0;
}

- (void)insertText:(id)a3
{
  NSMutableString *text;
  NSMutableString *v5;
  NSMutableString *v6;
  id v7;

  v7 = a3;
  if ((unint64_t)-[NSMutableString length](self->_text, "length") < self->_numberOfCharacters
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("\n")) & 1) == 0)
  {
    text = self->_text;
    if (!text)
    {
      v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
      v6 = self->_text;
      self->_text = v5;

      text = self->_text;
    }
    -[NSMutableString appendString:](text, "appendString:", v7);
    -[SUUIPINInputControl _setNeedsReloadLayout](self, "_setNeedsReloadLayout");
    -[SUUIPINInputControl _sendValueChangeEvents](self, "_sendValueChangeEvents");
  }

}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIPINInputControl;
  v3 = -[SUUIPINInputControl becomeFirstResponder](&v5, sel_becomeFirstResponder);
  if (v3)
    -[SUUIPINInputControl _reloadLabelSubviews](self, "_reloadLabelSubviews");
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIPINInputControl;
  v3 = -[SUUIPINInputControl resignFirstResponder](&v5, sel_resignFirstResponder);
  if (v3)
    -[SUUIPINInputControl _reloadLabelSubviews](self, "_reloadLabelSubviews");
  return v3;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  if (self->_secureTextEntry != a3)
  {
    self->_secureTextEntry = a3;
    -[SUUIPINInputControl _setNeedsReloadLayout](self, "_setNeedsReloadLayout");
  }
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  float v20;
  double v21;
  double v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  double v27;
  float v28;
  double v29;
  uint64_t v30;
  uint64_t j;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;

  v42 = *MEMORY[0x24BDAC8D0];
  -[SUUIPINInputControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  if (self->_needsLabelReload)
  {
    -[SUUIPINInputControl _reloadLabelSubviews](self, "_reloadLabelSubviews");
    self->_needsLabelReload = 0;
  }
  objc_msgSend((id)objc_opt_class(), "_defaultBoxSizeForFont:", self->_font);
  v8 = v7;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = self->_labels;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
    v13 = v8;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "sizeThatFits:", v4, v6);
        if (v8 < v16)
          v8 = v16;
        if (v13 < v15)
          v13 = v15;
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v11);
  }
  else
  {
    v13 = v8;
  }

  v17 = -[NSMutableArray count](self->_labels, "count");
  v18 = v13 * (double)v17;
  v19 = (double)(v17 - 1);
  v20 = (v4 - v18) / v19;
  v21 = floorf(v20);
  if (v21 <= 10.0)
    v22 = v21;
  else
    v22 = 10.0;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v23 = self->_labels;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = (v6 - v8) * 0.5;
    v27 = floorf(v26);
    v28 = (v4 - (v18 + v22 * v19)) * 0.5;
    v29 = floorf(v28);
    v30 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "setFrame:", v29, v27, v13, v8, (_QWORD)v32);
        v43.origin.x = v29;
        v43.origin.y = v27;
        v43.size.width = v13;
        v43.size.height = v8;
        v29 = v22 + CGRectGetMaxX(v43);
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v25);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v24 = *MEMORY[0x24BDAC8D0];
  if (self->_needsLabelReload)
  {
    -[SUUIPINInputControl _reloadLabelSubviews](self, "_reloadLabelSubviews");
    self->_needsLabelReload = 0;
  }
  objc_msgSend((id)objc_opt_class(), "_defaultBoxSizeForFont:", self->_font);
  v7 = v6;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_labels;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    v12 = v7;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "sizeThatFits:", width, height, (_QWORD)v19);
        if (v7 < v15)
          v7 = v15;
        if (v12 < v14)
          v12 = v14;
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  else
  {
    v12 = v7;
  }

  v16 = -[NSMutableArray count](self->_labels, "count");
  v17 = (double)(v16 - 1) * 10.0 + v12 * (double)v16;
  v18 = v7;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIPINInputControl;
  -[SUUIPINInputControl tintColorDidChange](&v3, sel_tintColorDidChange);
  -[SUUIPINInputControl _reloadLabelSubviews](self, "_reloadLabelSubviews");
}

+ (double)_defaultBoxSizeForFont:(id)a3
{
  double v3;

  objc_msgSend(a3, "pointSize");
  return fmax(v3 + 16.0, 44.0);
}

- (void)_reloadLabelSubviews
{
  NSMutableArray *v3;
  NSMutableArray *labels;
  void *v5;
  double v6;
  double v7;
  int v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  double v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  int64_t v22;
  int64_t v23;
  void *v24;
  _BOOL4 v25;
  CGColor *v26;

  if (!self->_labels)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    labels = self->_labels;
    self->_labels = v3;

  }
  v26 = -[UIColor CGColor](self->_boxBorderColor, "CGColor");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  v8 = -[SUUIPINInputControl isFirstResponder](self, "isFirstResponder");
  v25 = -[SUUIPINInputControl isSecureTextEntry](self, "isSecureTextEntry");
  v9 = -[NSMutableString length](self->_text, "length");
  if (self->_numberOfCharacters >= 1)
  {
    v10 = v9;
    v11 = 0;
    v12 = 1.0 / v7;
    do
    {
      if (v11 >= (unint64_t)-[NSMutableArray count](self->_labels, "count"))
      {
        v13 = objc_alloc_init(MEMORY[0x24BEBD708]);
        objc_msgSend(v13, "setTextAlignment:", 1);
        objc_msgSend(v13, "setUserInteractionEnabled:", 0);
        -[NSMutableArray addObject:](self->_labels, "addObject:", v13);
        -[SUUIPINInputControl addSubview:](self, "addSubview:", v13);
      }
      else
      {
        -[NSMutableArray objectAtIndex:](self->_labels, "objectAtIndex:", v11);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v10 == v11)
        v16 = v8;
      else
        v16 = 0;
      if (v16 == 1)
      {
        -[SUUIPINInputControl tintColor](self, "tintColor");
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v15, "setBorderColor:", objc_msgSend(v17, "CGColor"));

        v18 = 1.0;
      }
      else
      {
        objc_msgSend(v14, "setBorderColor:", v26);
        v18 = v12;
      }
      objc_msgSend(v15, "setBorderWidth:", v18);
      objc_msgSend(v13, "setBackgroundColor:", self->_boxBackgroundColor);
      objc_msgSend(v13, "setFont:", self->_font);
      objc_msgSend(v13, "setTextColor:", self->_textColor);
      if (v11 >= v10)
      {
        v19 = v13;
        v20 = 0;
      }
      else
      {
        if (!v25)
        {
          -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v11, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setText:", v21);

          goto LABEL_20;
        }
        v19 = v13;
        v20 = CFSTR("•");
      }
      objc_msgSend(v19, "setText:", v20);
LABEL_20:

      ++v11;
    }
    while (v11 < self->_numberOfCharacters);
  }
  v22 = -[NSMutableArray count](self->_labels, "count");
  if (v22 > self->_numberOfCharacters)
  {
    v23 = v22 - 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_labels, "objectAtIndex:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeFromSuperview");
      -[NSMutableArray removeObjectAtIndex:](self->_labels, "removeObjectAtIndex:", v23);

      ++v23;
    }
    while (v23 >= self->_numberOfCharacters);
  }
}

- (void)_sendValueChangeEvents
{
  void *v3;

  if (self->_viewElement)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", self->_text, CFSTR("term"), 0);
    -[SUUIViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_viewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 1, v3, 0);

  }
  -[SUUIPINInputControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)_setNeedsReloadLayout
{
  self->_needsLabelReload = 1;
  -[SUUIPINInputControl setNeedsLayout](self, "setNeedsLayout");
}

- (UIColor)boxBackgroundColor
{
  return self->_boxBackgroundColor;
}

- (UIColor)boxBorderColor
{
  return self->_boxBorderColor;
}

- (UIFont)font
{
  return self->_font;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)numberOfCharacters
{
  return self->_numberOfCharacters;
}

- (BOOL)isSecureTextEntry
{
  return self->_secureTextEntry;
}

- (NSString)text
{
  return &self->_text->super;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_boxBorderColor, 0);
  objc_storeStrong((id *)&self->_boxBackgroundColor, 0);
}

@end
