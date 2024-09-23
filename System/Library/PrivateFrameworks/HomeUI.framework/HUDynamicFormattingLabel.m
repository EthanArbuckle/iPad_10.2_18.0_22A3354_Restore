@implementation HUDynamicFormattingLabel

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUDynamicFormattingLabel;
  -[HUDynamicFormattingLabel didMoveToWindow](&v3, sel_didMoveToWindow);
  -[HUDynamicFormattingLabel _updateFormattedValueObservation](self, "_updateFormattedValueObservation");
}

- (void)setDynamicFormattingValue:(id)a3
{
  id v5;
  HFDynamicFormattingValue *v6;
  HFDynamicFormattingValue *v7;
  char v8;
  HFDynamicFormattingValue *v9;

  v5 = a3;
  v6 = self->_dynamicFormattingValue;
  v7 = (HFDynamicFormattingValue *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v6)
    {
      v8 = -[HFDynamicFormattingValue isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_dynamicFormattingValue, a3);
    -[HUDynamicFormattingLabel _updateFormattedValueIncludingFont:](self, "_updateFormattedValueIncludingFont:", 1);
    -[HUDynamicFormattingLabel _updateFormattedValueObservation](self, "_updateFormattedValueObservation");
  }
LABEL_8:

}

- (void)setDefaultAttributes:(id)a3
{
  id v4;
  NSDictionary *v5;
  char v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *defaultAttributes;
  NSDictionary *v10;

  v4 = a3;
  v5 = self->_defaultAttributes;
  v10 = (NSDictionary *)v4;
  if (v5 == v10)
  {

  }
  else
  {
    if (v5)
    {
      v6 = -[NSDictionary isEqual:](v5, "isEqual:", v10);

      v7 = v10;
      if ((v6 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

      v7 = v10;
    }
    v8 = (NSDictionary *)-[NSDictionary copy](v7, "copy");
    defaultAttributes = self->_defaultAttributes;
    self->_defaultAttributes = v8;

    -[HUDynamicFormattingLabel _updateFormattedValueIncludingFont:](self, "_updateFormattedValueIncludingFont:", 1);
  }
  v7 = v10;
LABEL_9:

}

- (void)setPreferredFonts:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *v7;
  char v8;
  NSArray *v9;

  v5 = a3;
  v6 = self->_preferredFonts;
  v7 = (NSArray *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v6)
    {
      v8 = -[NSArray isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_preferredFonts, a3);
    -[HUDynamicFormattingLabel _updatePreferredFontIncludingValue:](self, "_updatePreferredFontIncludingValue:", 1);
  }
LABEL_8:

}

- (void)_updateFormattedValueObservation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  -[HUDynamicFormattingLabel formattedValueObservationCancellationToken](self, "formattedValueObservationCancellationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[HUDynamicFormattingLabel window](self, "window");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[HUDynamicFormattingLabel dynamicFormattingValue](self, "dynamicFormattingValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_initWeak(&location, self);
      -[HUDynamicFormattingLabel dynamicFormattingValue](self, "dynamicFormattingValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __60__HUDynamicFormattingLabel__updateFormattedValueObservation__block_invoke;
      v12 = &unk_1E6F5B468;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v7, "observeFormattedValueChangesWithBlock:", &v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDynamicFormattingLabel setFormattedValueObservationCancellationToken:](self, "setFormattedValueObservationCancellationToken:", v8, v9, v10, v11, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __60__HUDynamicFormattingLabel__updateFormattedValueObservation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFormattedValueIncludingFont:", 1);

}

- (id)_formattedValueWithFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[HUDynamicFormattingLabel defaultAttributes](self, "defaultAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = (void *)MEMORY[0x1E0C9AA70];
  v7 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "na_safeSetObject:forKey:", v4, *MEMORY[0x1E0CEA098]);
  -[HUDynamicFormattingLabel dynamicFormattingValue](self, "dynamicFormattingValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentFormattedValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithAttributes:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_updateFormattedValueIncludingFont:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
    -[HUDynamicFormattingLabel _updatePreferredFontIncludingValue:](self, "_updatePreferredFontIncludingValue:", 0);
  -[HUDynamicFormattingLabel preferredFontForCurrentSize](self, "preferredFontForCurrentSize");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUDynamicFormattingLabel _formattedValueWithFont:](self, "_formattedValueWithFont:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDynamicFormattingLabel setAttributedText:](self, "setAttributedText:", v4);

}

- (void)_updatePreferredFontIncludingValue:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double MaxY;
  id v23;
  id v24;
  id v25;
  void *v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  -[HUDynamicFormattingLabel preferredFonts](self, "preferredFonts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDynamicFormattingLabel bounds](self, "bounds");
  if (v8 != *MEMORY[0x1E0C9D820] || v7 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[HUDynamicFormattingLabel preferredFonts](self, "preferredFonts", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          -[HUDynamicFormattingLabel _formattedValueWithFont:](self, "_formattedValueWithFont:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "boundingRectWithSize:options:context:", 0, 0, 1.79769313e308, 1.79769313e308);
          x = v34.origin.x;
          y = v34.origin.y;
          width = v34.size.width;
          height = v34.size.height;
          MaxX = CGRectGetMaxX(v34);
          -[HUDynamicFormattingLabel bounds](self, "bounds");
          if (MaxX <= CGRectGetMaxX(v35))
          {
            v36.origin.x = x;
            v36.origin.y = y;
            v36.size.width = width;
            v36.size.height = height;
            MaxY = CGRectGetMaxY(v36);
            -[HUDynamicFormattingLabel bounds](self, "bounds");
            if (MaxY <= CGRectGetMaxY(v37))
            {
              v23 = v15;

              v6 = v23;
              goto LABEL_16;
            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_16:

  }
  -[HUDynamicFormattingLabel preferredFontForCurrentSize](self, "preferredFontForCurrentSize");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = v6;
  v26 = v25;
  if (v24 == v25)
  {

  }
  else
  {
    if (v24)
    {
      v27 = objc_msgSend(v24, "isEqual:", v25);

      if ((v27 & 1) != 0)
        goto LABEL_25;
    }
    else
    {

    }
    -[HUDynamicFormattingLabel setPreferredFontForCurrentSize:](self, "setPreferredFontForCurrentSize:", v26);
    if (v3)
      -[HUDynamicFormattingLabel _updateFormattedValueIncludingFont:](self, "_updateFormattedValueIncludingFont:", 0);
  }
LABEL_25:

}

- (void)layoutSubviews
{
  objc_super v3;

  -[HUDynamicFormattingLabel _updatePreferredFontIncludingValue:](self, "_updatePreferredFontIncludingValue:", 1);
  v3.receiver = self;
  v3.super_class = (Class)HUDynamicFormattingLabel;
  -[HUDynamicFormattingLabel layoutSubviews](&v3, sel_layoutSubviews);
}

- (HFDynamicFormattingValue)dynamicFormattingValue
{
  return self->_dynamicFormattingValue;
}

- (NSDictionary)defaultAttributes
{
  return self->_defaultAttributes;
}

- (NSArray)preferredFonts
{
  return self->_preferredFonts;
}

- (NACancelable)formattedValueObservationCancellationToken
{
  return self->_formattedValueObservationCancellationToken;
}

- (void)setFormattedValueObservationCancellationToken:(id)a3
{
  objc_storeStrong((id *)&self->_formattedValueObservationCancellationToken, a3);
}

- (UIFont)preferredFontForCurrentSize
{
  return self->_preferredFontForCurrentSize;
}

- (void)setPreferredFontForCurrentSize:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFontForCurrentSize, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFontForCurrentSize, 0);
  objc_storeStrong((id *)&self->_formattedValueObservationCancellationToken, 0);
  objc_storeStrong((id *)&self->_preferredFonts, 0);
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
  objc_storeStrong((id *)&self->_dynamicFormattingValue, 0);
}

@end
