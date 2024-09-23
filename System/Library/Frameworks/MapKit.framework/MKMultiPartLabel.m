@implementation MKMultiPartLabel

- (MKMultiPartLabel)initWithFrame:(CGRect)a3
{
  MKMultiPartLabel *v3;
  MKMultiPartLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKMultiPartLabel;
  v3 = -[MKMultiPartLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MKMultiPartLabel _setupTextView](v3, "_setupTextView");
  return v4;
}

- (void)_setupTextView
{
  id v3;
  UITextView *v4;
  UITextView *textView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CEAB18]);
  v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  textView = self->_textView;
  self->_textView = v4;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setScrollEnabled:](self->_textView, "setScrollEnabled:", 0);
  -[UITextView setAdjustsFontForContentSizeCategory:](self->_textView, "setAdjustsFontForContentSizeCategory:", 1);
  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[UITextView setSelectable:](self->_textView, "setSelectable:", 0);
  -[UITextView textContainer](self->_textView, "textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineFragmentPadding:", 0.0);

  -[UITextView textContainer](self->_textView, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWidthTracksTextView:", 1);

  -[UITextView textContainer](self->_textView, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHeightTracksTextView:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v9);

  -[MKMultiPartLabel addSubview:](self, "addSubview:", self->_textView);
  -[MKMultiPartLabel setTextAlignment:](self, "setTextAlignment:", 4);
  -[MKMultiPartLabel setLineBreakMode:](self, "setLineBreakMode:", 0);
  v10 = objc_alloc(MEMORY[0x1E0CEA5F8]);
  v11 = (void *)objc_msgSend(v10, "initForTextStyle:", *MEMORY[0x1E0CEB538]);
  objc_msgSend(MEMORY[0x1E0CEA700], "_defaultAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "scaledFontForFont:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMultiPartLabel setFont:](self, "setFont:", v14);

  objc_msgSend(MEMORY[0x1E0CEA700], "_defaultAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA0A0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKMultiPartLabel setTextColor:](self, "setTextColor:", v16);
  -[MKMultiPartLabel textColor](self, "textColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](self->_textView, "setTextColor:", v17);

  v27 = (void *)MEMORY[0x1E0CB3718];
  -[UITextView topAnchor](self->_textView, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMultiPartLabel topAnchor](self, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v29;
  -[UITextView bottomAnchor](self->_textView, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMultiPartLabel bottomAnchor](self, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v19;
  -[UITextView leadingAnchor](self->_textView, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMultiPartLabel leadingAnchor](self, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v22;
  -[UITextView trailingAnchor](self->_textView, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMultiPartLabel trailingAnchor](self, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v26);

}

- (void)setFont:(id)a3
{
  UIFont *v4;
  UIFont *v5;
  void *v6;
  NSDictionary *cachedTextAttributes;
  UIFont *obj;
  UIFont *obja;

  v4 = (UIFont *)a3;
  if (self->_font != v4)
  {
    obj = v4;
    if ((-[UIFont isEqual:](v4, "isEqual:") & 1) == 0)
    {
      v5 = obj;
      if (!obj)
      {
        objc_msgSend(MEMORY[0x1E0CEA700], "_defaultAttributes");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
        obja = (UIFont *)objc_claimAutoreleasedReturnValue();

        v5 = obja;
      }
      obj = v5;
      objc_storeStrong((id *)&self->_font, v5);
      -[UITextView setFont:](self->_textView, "setFont:", obj);
      cachedTextAttributes = self->_cachedTextAttributes;
      self->_cachedTextAttributes = 0;

      -[MKMultiPartLabel _updateStrings](self, "_updateStrings");
    }
    v4 = obj;
  }

}

- (void)setTextColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;
  void *v6;
  NSDictionary *cachedTextAttributes;
  UIColor *obj;
  UIColor *obja;

  v4 = (UIColor *)a3;
  if (self->_textColor != v4)
  {
    obj = v4;
    if ((-[UIColor isEqual:](v4, "isEqual:") & 1) == 0)
    {
      v5 = obj;
      if (!obj)
      {
        objc_msgSend(MEMORY[0x1E0CEA700], "_defaultAttributes");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA0A0]);
        obja = (UIColor *)objc_claimAutoreleasedReturnValue();

        v5 = obja;
      }
      obj = v5;
      objc_storeStrong((id *)&self->_textColor, v5);
      -[MKMultiPartLabel _updateColorsForCurrentState](self, "_updateColorsForCurrentState");
      cachedTextAttributes = self->_cachedTextAttributes;
      self->_cachedTextAttributes = 0;

      -[MKMultiPartLabel _updateStrings](self, "_updateStrings");
    }
    v4 = obj;
  }

}

- (void)setHighlightedTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  NSDictionary *cachedTextAttributes;
  UIColor *v9;

  v5 = (UIColor *)a3;
  v6 = v5;
  if (self->_highlightedTextColor != v5)
  {
    v9 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:");
    v6 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_highlightedTextColor, a3);
      -[MKMultiPartLabel _updateColorsForCurrentState](self, "_updateColorsForCurrentState");
      cachedTextAttributes = self->_cachedTextAttributes;
      self->_cachedTextAttributes = 0;

      -[MKMultiPartLabel _updateStrings](self, "_updateStrings");
      v6 = v9;
    }
  }

}

- (void)setHighlighted:(BOOL)a3
{
  NSDictionary *cachedTextAttributes;

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[MKMultiPartLabel _updateColorsForCurrentState](self, "_updateColorsForCurrentState");
    cachedTextAttributes = self->_cachedTextAttributes;
    self->_cachedTextAttributes = 0;

    -[MKMultiPartLabel _updateStrings](self, "_updateStrings");
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  MKMultiPartLabel *v7;
  MKMultiPartLabel *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKMultiPartLabel;
  -[MKMultiPartLabel didUpdateFocusInContext:withAnimationCoordinator:](&v11, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "previouslyFocusedView");
  v7 = (MKMultiPartLabel *)objc_claimAutoreleasedReturnValue();
  if (v7 == self
    || (objc_msgSend(v6, "nextFocusedView"), v8 = (MKMultiPartLabel *)objc_claimAutoreleasedReturnValue(), v8 == self))
  {
    objc_msgSend(v6, "previouslyFocusedView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextFocusedView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != self)
    if (v9 != v10)
      -[MKMultiPartLabel _updateColorsForCurrentState](self, "_updateColorsForCurrentState");
  }
  else
  {

  }
}

- (void)_updateColorsForCurrentState
{
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  id v7;

  -[MKMultiPartLabel highlightedTextColor](self, "highlightedTextColor");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  v4 = (void *)v3;
  if (!-[MKMultiPartLabel isHighlighted](self, "isHighlighted"))
  {
    v5 = -[MKMultiPartLabel isFocused](self, "isFocused");

    if ((v5 & 1) != 0)
      goto LABEL_5;
LABEL_6:
    -[MKMultiPartLabel textColor](self, "textColor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

LABEL_5:
  -[MKMultiPartLabel highlightedTextColor](self, "highlightedTextColor");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v7 = (id)v6;
  -[UITextView setTextColor:](self->_textView, "setTextColor:", v6);

}

- (void)setNumberOfLines:(unint64_t)a3
{
  id v4;

  -[UITextView textContainer](self->_textView, "textContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumNumberOfLines:", a3);

}

- (unint64_t)numberOfLines
{
  void *v2;
  unint64_t v3;

  -[UITextView textContainer](self->_textView, "textContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumNumberOfLines");

  return v3;
}

- (void)setLineBreakMode:(int64_t)a3
{
  void *v5;
  NSDictionary *cachedTextAttributes;

  -[UITextView textContainer](self->_textView, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineBreakMode:", a3);

  cachedTextAttributes = self->_cachedTextAttributes;
  self->_cachedTextAttributes = 0;

  -[MKMultiPartLabel _updateStrings](self, "_updateStrings");
}

- (int64_t)lineBreakMode
{
  void *v2;
  int64_t v3;

  -[UITextView textContainer](self->_textView, "textContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lineBreakMode");

  return v3;
}

- (id)_textAttributes
{
  NSDictionary *cachedTextAttributes;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *v12;

  cachedTextAttributes = self->_cachedTextAttributes;
  if (!cachedTextAttributes)
  {
    objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "setAlignment:", -[MKMultiPartLabel textAlignment](self, "textAlignment"));
    objc_msgSend(v5, "setLineBreakMode:", -[MKMultiPartLabel lineBreakMode](self, "lineBreakMode"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v5, *MEMORY[0x1E0CEA0D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView textColor](self->_textView, "textColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UITextView textColor](self->_textView, "textColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CEA0A0]);

    }
    -[MKMultiPartLabel font](self, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[MKMultiPartLabel font](self, "font");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CEA098]);

    }
    v11 = (NSDictionary *)objc_msgSend(v6, "copy");
    v12 = self->_cachedTextAttributes;
    self->_cachedTextAttributes = v11;

    cachedTextAttributes = self->_cachedTextAttributes;
  }
  return cachedTextAttributes;
}

- (NSString)text
{
  return -[UITextView text](self->_textView, "text");
}

- (void)setText:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    +[MKMultiPartAttributedString multiPartAttributedStringWithString:](MKMultiPartAttributedString, "multiPartAttributedStringWithString:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[MKMultiPartLabel setMultiPartString:](self, "setMultiPartString:", v4);

}

- (void)setMultiPartString:(id)a3
{
  id v5;
  MKMultiPartAttributedString *multiPartString;
  id v7;
  void *v8;
  char v9;
  _MKMultiPartLabelMetrics *data;
  unint64_t v11;

  v5 = a3;
  multiPartString = self->_multiPartString;
  v11 = (unint64_t)v5;
  v7 = multiPartString;
  v8 = (void *)v11;
  if (v11 | (unint64_t)v7)
  {
    v9 = objc_msgSend((id)v11, "isEqual:", v7);

    v8 = (void *)v11;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_multiPartString, a3);
      data = self->_data;
      self->_data = 0;

      -[MKMultiPartLabel _updateStrings](self, "_updateStrings");
      v8 = (void *)v11;
    }
  }

}

- (void)_updateStrings
{
  _MKMultiPartLabelMetrics *v3;
  void *v4;
  void *v5;
  id v6;

  -[MKMultiPartLabel _attributedAdjustedMultiPartStringFromString:](self, "_attributedAdjustedMultiPartStringFromString:", self->_multiPartString);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    v3 = -[_MKMultiPartLabelMetrics initWithMultiPartString:]([_MKMultiPartLabelMetrics alloc], "initWithMultiPartString:", v6);
  else
    v3 = 0;
  objc_storeStrong((id *)&self->_data, v3);
  if (v6)

  -[MKMultiPartLabel data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMultiPartLabel _updateTextViewTextAndInvalidateLayout:](self, "_updateTextViewTextAndInvalidateLayout:", v5);

}

- (void)_updateTextViewTextAndInvalidateLayout:(id)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  int v12;
  BOOL v13;
  NSDictionary *v14;
  NSDictionary *lastAppliedNonColorAttributes;
  id v16;

  v16 = a3;
  if (v16)
  {
    -[UITextView attributedText](self->_textView, "attributedText");
    v3 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqual:", v3) & 1) != 0)
    {
LABEL_16:

      goto LABEL_17;
    }
    if (objc_msgSend(v16, "length"))
    {

      goto LABEL_9;
    }
  }
  else if (objc_msgSend(0, "length"))
  {
    goto LABEL_9;
  }
  -[UITextView attributedText](self->_textView, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v16)
  if (v6)
  {
LABEL_9:
    -[UITextView attributedText](self->_textView, "attributedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v16);
    v9 = (void *)-[NSDictionary mutableCopy](self->_cachedTextAttributes, "mutableCopy");
    objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0CEA0A0]);
    objc_msgSend(v16, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v8;
    v11 = v10;
    if (v3 | v11 && (v12 = objc_msgSend((id)v3, "isEqual:", v11), (id)v11, (id)v3, !v12))
    {

    }
    else
    {
      v13 = -[NSDictionary isEqualToDictionary:](self->_lastAppliedNonColorAttributes, "isEqualToDictionary:", v9);

      if (v13)
        goto LABEL_15;
    }
    v14 = (NSDictionary *)objc_msgSend(v9, "copy");
    lastAppliedNonColorAttributes = self->_lastAppliedNonColorAttributes;
    self->_lastAppliedNonColorAttributes = v14;

    -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
    -[MKMultiPartLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:

}

- (id)_attributedAdjustedMultiPartStringFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  MKMultiPartAttributedString *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v5, "components");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          -[MKMultiPartLabel _addDefaultAttributesToAttributedString:](self, "_addDefaultAttributesToAttributedString:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v11);
    }

    v15 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v5, "separators");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v5, "separators", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          -[MKMultiPartLabel _addDefaultAttributesToAttributedString:](self, "_addDefaultAttributesToAttributedString:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v20);
    }

    v24 = -[MKMultiPartAttributedString initWithComponents:separators:]([MKMultiPartAttributedString alloc], "initWithComponents:separators:", v8, v17);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_addDefaultAttributesToAttributedString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v4 = (objc_class *)MEMORY[0x1E0CB3778];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMultiPartLabel _textAttributes](self, "_textAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithString:attributes:", v7, v8);

  v10 = objc_msgSend(v5, "length");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__MKMultiPartLabel__addDefaultAttributesToAttributedString___block_invoke;
  v13[3] = &unk_1E20DC010;
  v11 = v9;
  v14 = v11;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v13);

  return v11;
}

uint64_t __60__MKMultiPartLabel__addDefaultAttributesToAttributedString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

- (void)layoutSubviews
{
  CGRect *p_previousBounds;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  _MKMultiPartLabelCacheKey *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _MKMultiPartLabelCacheKey *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  char v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  objc_super v72;
  CGRect v73;

  p_previousBounds = &self->_previousBounds;
  -[MKMultiPartLabel bounds](self, "bounds");
  v73.origin.x = v4;
  v73.origin.y = v5;
  v73.size.width = v6;
  v73.size.height = v7;
  if (!CGRectEqualToRect(*p_previousBounds, v73))
  {
    -[MKMultiPartLabel bounds](self, "bounds");
    p_previousBounds->origin.x = v8;
    p_previousBounds->origin.y = v9;
    p_previousBounds->size.width = v10;
    p_previousBounds->size.height = v11;
    -[UITextView setAttributedText:](self->_textView, "setAttributedText:", 0);
    -[MKMultiPartLabel data](self, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reset");

    -[MKMultiPartLabel data](self, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attributedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMultiPartLabel _updateTextViewTextAndInvalidateLayout:](self, "_updateTextViewTextAndInvalidateLayout:", v14);

  }
  v72.receiver = self;
  v72.super_class = (Class)MKMultiPartLabel;
  -[MKMultiPartLabel layoutSubviews](&v72, sel_layoutSubviews);
  -[MKMultiPartLabel bounds](self, "bounds");
  if (v15 != 0.0)
  {
    -[MKMultiPartLabel bounds](self, "bounds");
    if (v16 != 0.0 && -[MKMultiPartLabel numberOfLines](self, "numberOfLines") != 1)
    {
      -[MKMultiPartLabel data](self, "data");
      v17 = (_MKMultiPartLabelCacheKey *)objc_claimAutoreleasedReturnValue();
      -[_MKMultiPartLabelCacheKey components](v17, "components");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "count") == 1)
        goto LABEL_27;
      -[MKMultiPartLabel data](self, "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attributedString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");

      if (v21)
      {
        v22 = [_MKMultiPartLabelCacheKey alloc];
        -[_MKMultiPartLabelMetrics originalAttributedString](self->_data, "originalAttributedString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKMultiPartLabel bounds](self, "bounds");
        v17 = -[_MKMultiPartLabelCacheKey initWithAttributedString:size:](v22, "initWithAttributedString:size:", v23, v24, v25);

        objc_msgSend((id)objc_opt_class(), "_formattedStringsCache");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v17);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v26);
          -[MKMultiPartLabel data](self, "data");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "separators");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");
          -[MKMultiPartLabel data](self, "data");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setCurrentSeparatorIndex:", v29);

          goto LABEL_25;
        }
        -[MKMultiPartLabel data](self, "data");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "currentSeparatorIndex");

        -[MKMultiPartLabel data](self, "data");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "separators");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "count");

        if (v32 >= v35)
          goto LABEL_23;
        while (1)
        {
          -[MKMultiPartLabel data](self, "data");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "separators");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", v32);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "range");
          if (v39 && objc_msgSend(v38, "range") != 0x7FFFFFFFFFFFFFFFLL)
          {
            -[UITextView layoutManager](self->_textView, "layoutManager");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "glyphIndexForCharacterAtIndex:", objc_msgSend(v38, "range"));

            -[UITextView layoutManager](self->_textView, "layoutManager");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v38, "range");
            v45 = objc_msgSend(v42, "glyphIndexForCharacterAtIndex:", v44 + v43 - 1);

            if (v41 != 0x7FFFFFFFFFFFFFFFLL && v45 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v70 = 0;
              v71 = 0;
              -[UITextView layoutManager](self->_textView, "layoutManager");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v41, &v70);

              if (v70 != 0x7FFFFFFFFFFFFFFFLL)
              {
                if (v41 == v70)
                {
                  -[MKMultiPartLabel data](self, "data");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  v65 = v64;
                  v66 = &stru_1E20DFC00;
LABEL_31:
                  v67 = objc_msgSend(v64, "replaceSeparatorAtIndex:withString:", v32, v66);

                  if ((v67 & 1) != 0)
                  {
                    -[MKMultiPartLabel data](self, "data");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v68, "attributedString");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MKMultiPartLabel _updateTextViewTextAndInvalidateLayout:](self, "_updateTextViewTextAndInvalidateLayout:", v69);

                  }
                  ++v32;

LABEL_23:
                  -[MKMultiPartLabel data](self, "data");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "setCurrentSeparatorIndex:", v32);

                  -[MKMultiPartLabel data](self, "data");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = objc_msgSend(v59, "currentSeparatorIndex");
                  -[MKMultiPartLabel data](self, "data");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "separators");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v63 = objc_msgSend(v62, "count");

                  v26 = 0;
                  if (v60 >= v63)
                  {
                    -[MKMultiPartLabel data](self, "data");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "attributedString");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "setObject:forKey:", v28, v17);
LABEL_25:

                  }
LABEL_27:

                  return;
                }
                v48 = v70 + v71 - 1;
                if (v45 > v48)
                  goto LABEL_29;
                if (v45 == v48)
                {
                  v49 = objc_msgSend(v38, "range");
                  v51 = v49 + v50;
                  -[MKMultiPartLabel data](self, "data");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "attributedString");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = objc_msgSend(v53, "length");

                  if (v51 < v54)
                  {
LABEL_29:
                    -[MKMultiPartLabel data](self, "data");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    v65 = v64;
                    v66 = CFSTR("\n");
                    goto LABEL_31;
                  }
                }
              }
            }
          }

          ++v32;
          -[MKMultiPartLabel data](self, "data");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "separators");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "count");

          if (v32 >= v57)
            goto LABEL_23;
        }
      }
    }
  }
}

- (UIEdgeInsets)textInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UITextView textContainerInset](self->_textView, "textContainerInset");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setTextInset:(UIEdgeInsets)a3
{
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", a3.top, a3.left, a3.bottom, a3.right);
}

+ (id)_formattedStringsCache
{
  if (qword_1EDFB7B38 != -1)
    dispatch_once(&qword_1EDFB7B38, &__block_literal_global_70);
  return (id)_MergedGlobals_1_9;
}

void __42__MKMultiPartLabel__formattedStringsCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_MergedGlobals_1_9;
  _MergedGlobals_1_9 = (uint64_t)v0;

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UITextView *v5;
  MKMultiPartLabel *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKMultiPartLabel;
  -[MKMultiPartLabel hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UITextView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->_textView)
  {
    v6 = self;

    v5 = (UITextView *)v6;
  }
  return v5;
}

- (void)setContentCompressionResistancePriority:(float)a3 forAxis:(int64_t)a4
{
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKMultiPartLabel;
  -[MKMultiPartLabel setContentCompressionResistancePriority:forAxis:](&v8, sel_setContentCompressionResistancePriority_forAxis_);
  *(float *)&v7 = a3;
  -[UITextView setContentCompressionResistancePriority:forAxis:](self->_textView, "setContentCompressionResistancePriority:forAxis:", a4, v7);
}

- (void)setContentHuggingPriority:(float)a3 forAxis:(int64_t)a4
{
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKMultiPartLabel;
  -[MKMultiPartLabel setContentHuggingPriority:forAxis:](&v8, sel_setContentHuggingPriority_forAxis_);
  *(float *)&v7 = a3;
  -[UITextView setContentHuggingPriority:forAxis:](self->_textView, "setContentHuggingPriority:forAxis:", a4, v7);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  if (self->_multiPartString && self->_data)
  {
    v4.receiver = self;
    v4.super_class = (Class)MKMultiPartLabel;
    -[MKMultiPartLabel intrinsicContentSize](&v4, sel_intrinsicContentSize);
  }
  else
  {
    v2 = *MEMORY[0x1E0C9D820];
    v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)viewForLastBaselineLayout
{
  return self->_textView;
}

- (id)viewForFirstBaselineLayout
{
  return self->_textView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (MKMultiPartAttributedString)multiPartString
{
  return self->_multiPartString;
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (_MKMultiPartLabelMetrics)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_multiPartString, 0);
  objc_storeStrong((id *)&self->_lastAppliedNonColorAttributes, 0);
  objc_storeStrong((id *)&self->_cachedTextAttributes, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
