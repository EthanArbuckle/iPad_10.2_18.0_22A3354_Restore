@implementation NTKVictoryLabel

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)NTKVictoryLabel;
  -[CLKUIColoringLabel sizeThatFits:](&v11, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[NTKVictoryLabel additionalPaddingInsets](self, "additionalPaddingInsets");
  v9 = v5 + v8;
  v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)sizeToFit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKVictoryLabel;
  -[CLKUIColoringLabel sizeToFit](&v3, sel_sizeToFit);
  -[NTKVictoryLabel _layoutOutlineLabelIfNeeded](self, "_layoutOutlineLabelIfNeeded");
}

- (void)setTextAlignment:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKVictoryLabel;
  -[NTKVictoryLabel setTextAlignment:](&v5, sel_setTextAlignment_);
  -[NTKVictoryLabel setTextAlignment:](self->_outlineLabel, "setTextAlignment:", a3);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKVictoryLabel;
  -[NTKVictoryLabel layoutSubviews](&v3, sel_layoutSubviews);
  -[NTKVictoryLabel _layoutOutlineLabelIfNeeded](self, "_layoutOutlineLabelIfNeeded");
}

- (void)_layoutOutlineLabelIfNeeded
{
  double v3;
  double v4;
  double v5;

  if (self->_outlineLabel)
  {
    -[NTKVictoryLabel bounds](self, "bounds");
    -[CLKUIColoringLabel setBounds:](self->_outlineLabel, "setBounds:");
    -[NTKVictoryLabel bounds](self, "bounds");
    v4 = v3 * 0.5;
    -[NTKVictoryLabel bounds](self, "bounds");
    -[NTKVictoryLabel setCenter:](self->_outlineLabel, "setCenter:", v4, v5 * 0.5);
  }
}

- (void)setDrawingRectOffset:(CGVector)a3
{
  self->_drawingRectOffset = a3;
  -[NTKVictoryLabel setDrawingRectOffset:](self->_outlineLabel, "setDrawingRectOffset:");
}

- (void)setAttributedText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKVictoryLabel;
  -[CLKUIColoringLabel setAttributedText:](&v7, sel_setAttributedText_, v4);
  if (objc_msgSend(v4, "length"))
  {
    -[NTKVictoryLabel outlinedLabelAttributedStringFromAttributedString:](self, "outlinedLabelAttributedStringFromAttributedString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKVictoryLabel setAttributedText:](self->_outlineLabel, "setAttributedText:", v5);

    -[NTKVictoryLabel sizeToFit](self->_outlineLabel, "sizeToFit");
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKVictoryLabel _applyDrawingOffsetForTextIfNeeded:](self, "_applyDrawingOffsetForTextIfNeeded:", v6);

  }
}

- (id)outlinedLabelAttributedStringFromAttributedString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "length");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v5);
  v8 = MEMORY[0x1E0C809B0];
  v9 = *MEMORY[0x1E0DC1138];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__NTKVictoryLabel_outlinedLabelAttributedStringFromAttributedString___block_invoke;
  v23[3] = &unk_1E6BCE5C8;
  v23[4] = self;
  v10 = v7;
  v24 = v10;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v6, 0, v23);

  -[NTKVictoryLabel attributedText](self->_outlineLabel, "attributedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  -[NTKVictoryLabel attributedText](self->_outlineLabel, "attributedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC1140];
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __69__NTKVictoryLabel_outlinedLabelAttributedStringFromAttributedString___block_invoke_2;
  v19[3] = &unk_1E6BDC168;
  v21 = 0;
  v22 = v6;
  v15 = v10;
  v20 = v15;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v14, 0, v12, 0, v19);

  v16 = v20;
  v17 = v15;

  return v17;
}

void __69__NTKVictoryLabel_outlinedLabelAttributedStringFromAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v20;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v20, "fontDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1380]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0DC13D8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0DC13D0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "integerValue"))
        v16 = 1;
      else
        v16 = v13 == 0;
      if (!v16 && objc_msgSend(v13, "integerValue") == 6)
      {
        v17 = (void *)objc_opt_class();
        objc_msgSend(*(id *)(a1 + 32), "font");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "pointSize");
        objc_msgSend(v17, "victoryFontWithSize:style:monospacedNumbers:", 1, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v19, a3, a4);
      }
    }

    v8 = v20;
  }

}

void __69__NTKVictoryLabel_outlinedLabelAttributedStringFromAttributedString___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  NSUInteger length;
  NSRange v8;
  NSUInteger location;
  id v10;
  NSRange v11;

  v10 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11.location = a3;
    v11.length = a4;
    v8 = NSIntersectionRange(v11, *(NSRange *)(a1 + 40));
    length = v8.length;
    location = v8.location;
    if (!v8.length)
    {
      location = *(_QWORD *)(a1 + 40);
      length = *(_QWORD *)(a1 + 48);
    }
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v10, location, length);
  }

}

- (void)setText:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKVictoryLabel;
  v4 = a3;
  -[CLKUIColoringLabel setText:](&v5, sel_setText_, v4);
  -[NTKVictoryLabel setText:](self->_outlineLabel, "setText:", v4, v5.receiver, v5.super_class);
  -[NTKVictoryLabel _applyDrawingOffsetForTextIfNeeded:](self, "_applyDrawingOffsetForTextIfNeeded:", v4);

}

- (void)_applyDrawingOffsetForTextIfNeeded:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  if (self->_drawingRectOffset.dx != 0.0 || self->_drawingRectOffset.dy != 0.0)
  {
    v7 = v4;
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v4, "length") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("7"));

    v4 = v7;
    if (self->_requiresDrawingRectAdjustments != v6)
    {
      self->_requiresDrawingRectAdjustments = v6;
      -[NTKVictoryLabel setNeedsLayout](self, "setNeedsLayout");
      v4 = v7;
    }
  }

}

- (void)setOutlineColor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[NTKVictoryLabel attributedText](self, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  -[NTKVictoryLabel setOutlineColor:inRange:](self, "setOutlineColor:inRange:", v6, 0, v8);
  -[NTKVictoryLabel setHidden:](self->_outlineLabel, "setHidden:", -[NTKVictoryLabel _shouldHideOutlineLabel](self, "_shouldHideOutlineLabel"));
  -[NTKVictoryLabel _layoutOutlineLabelIfNeeded](self, "_layoutOutlineLabelIfNeeded");

}

- (void)setOutlineColor:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v13 = v7;
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[NTKVictoryLabel outlineLabel](self, "outlineLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v9, location, length);
  objc_msgSend(v10, "setAttributedText:", v12);
  objc_msgSend(v10, "setHidden:", -[NTKVictoryLabel _shouldHideOutlineLabel](self, "_shouldHideOutlineLabel"));

}

- (void)setFillColor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[NTKVictoryLabel attributedText](self, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  -[NTKVictoryLabel setFillColor:inRange:](self, "setFillColor:inRange:", v4, 0, v6);
  -[NTKVictoryLabel setHidden:](self->_outlineLabel, "setHidden:", -[NTKVictoryLabel _shouldHideOutlineLabel](self, "_shouldHideOutlineLabel"));
}

- (void)setFillColor:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  id v14;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v14 = v7;
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[NTKVictoryLabel attributedText](self, "attributedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v9, location, length);
  -[NTKVictoryLabel setAttributedText:](self, "setAttributedText:", v11);
  v12 = -[NTKVictoryLabel _shouldHideOutlineLabel](self, "_shouldHideOutlineLabel");
  -[NTKVictoryLabel outlineLabel](self, "outlineLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", v12);

}

- (BOOL)_shouldHideOutlineLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  __int128 v20;

  -[NTKVictoryLabel attributedText](self, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKVictoryLabel outlineLabel](self, "outlineLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "length");
  v20 = 0uLL;
  v7 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v5, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0DC1140], 0, &v20, 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 == __PAIR128__(v6, 0)
    && (objc_msgSend(MEMORY[0x1E0DC3658], "clearColor"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        (v10 & 1) != 0))
  {
    v11 = 1;
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __42__NTKVictoryLabel__shouldHideOutlineLabel__block_invoke;
    v13[3] = &unk_1E6BDC190;
    v14 = v5;
    v15 = &v16;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0, v13);
    v11 = *((_BYTE *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return v11;
}

void __42__NTKVictoryLabel__shouldHideOutlineLabel__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v12 = 0;
    v13 = 0;
    objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1140], a3, &v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqual:", v11) || a3 != v12 || a4 != v13)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a5 = 1;
    }

  }
}

- (void)setAdditionalPaddingInsets:(double)a3
{
  self->_additionalPaddingInsets = a3;
  -[NTKVictoryLabel setAdditionalPaddingInsets:](self->_outlineLabel, "setAdditionalPaddingInsets:");
}

- (double)additionalPaddingInsets
{
  double v2;

  if (self->_requiresDrawingRectAdjustments)
    v2 = -self->_drawingRectOffset.dx;
  else
    v2 = 0.0;
  return self->_additionalPaddingInsets + v2;
}

- (NTKVictoryLabel)outlineLabel
{
  NTKVictoryLabel *outlineLabel;
  NTKVictoryLabel *v4;
  NTKVictoryLabel *v5;
  NTKVictoryLabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  outlineLabel = self->_outlineLabel;
  if (!outlineLabel)
  {
    v4 = [NTKVictoryLabel alloc];
    -[NTKVictoryLabel bounds](self, "bounds");
    v5 = -[CLKUIColoringLabel initWithFrame:](v4, "initWithFrame:");
    v6 = self->_outlineLabel;
    self->_outlineLabel = v5;

    -[NTKVictoryLabel additionalPaddingInsets](self, "additionalPaddingInsets");
    -[NTKVictoryLabel setAdditionalPaddingInsets:](self->_outlineLabel, "setAdditionalPaddingInsets:");
    v7 = (void *)objc_opt_class();
    -[CLKUIColoringLabel font](self, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pointSize");
    objc_msgSend(v7, "victoryFontWithSize:style:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setFont:](self->_outlineLabel, "setFont:", v9);

    -[NTKVictoryLabel setTextAlignment:](self->_outlineLabel, "setTextAlignment:", -[NTKVictoryLabel textAlignment](self, "textAlignment"));
    -[NTKVictoryLabel setDrawingRectOffset:](self->_outlineLabel, "setDrawingRectOffset:", self->_drawingRectOffset.dx, self->_drawingRectOffset.dy);
    -[NTKVictoryLabel text](self, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NTKVictoryLabel text](self, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKVictoryLabel setText:](self->_outlineLabel, "setText:", v11);

    }
    -[NTKVictoryLabel attributedText](self, "attributedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[NTKVictoryLabel attributedText](self, "attributedText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKVictoryLabel outlinedLabelAttributedStringFromAttributedString:](self, "outlinedLabelAttributedStringFromAttributedString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKVictoryLabel setAttributedText:](self->_outlineLabel, "setAttributedText:", v14);

    }
    -[NTKVictoryLabel addSubview:](self, "addSubview:", self->_outlineLabel);
    -[NTKVictoryLabel _layoutOutlineLabelIfNeeded](self, "_layoutOutlineLabelIfNeeded");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKVictoryLabel setOutlineColor:](self, "setOutlineColor:", v15);

    outlineLabel = self->_outlineLabel;
  }
  return outlineLabel;
}

- (void)setOutlineAlpha:(double)a3
{
  void *v5;

  -[NTKVictoryLabel outlineLabel](self, "outlineLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

  -[NTKVictoryLabel _layoutOutlineLabelIfNeeded](self, "_layoutOutlineLabelIfNeeded");
}

+ (id)victoryFontWithSize:(double)a3 style:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "victoryFontWithSize:style:monospacedNumbers:", a4, 0, a3);
}

+ (id)loadFonts:(double)a3 style:(unint64_t)a4 monospacedNumbers:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v5 = a5;
  v24[2] = *MEMORY[0x1E0C80C00];
  if (loadFonts_style_monospacedNumbers__onceToken != -1)
    dispatch_once(&loadFonts_style_monospacedNumbers__onceToken, &__block_literal_global_169);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu-%lu"), a4, (unint64_t)a3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__fontCache, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(a1, "fontDescriptorWithVictoryStyle:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v12 = *MEMORY[0x1E0DC13D0];
      v23[0] = *MEMORY[0x1E0DC13D8];
      v23[1] = v12;
      v24[0] = &unk_1E6CA2658;
      v24[1] = &unk_1E6CA2670;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0DC1380];
      v20 = v13;
      v21 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fontDescriptorByAddingAttributes:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v17;
    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)__fontCache, "setObject:forKey:", v10, v9);
    }
    else
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[NTKVictoryLabel loadFonts:style:monospacedNumbers:].cold.1(a4, v18);

      v10 = 0;
    }

  }
  return v10;
}

void __53__NTKVictoryLabel_loadFonts_style_monospacedNumbers___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)__fontCache;
  __fontCache = (uint64_t)v0;

}

+ (id)fontDescriptorWithVictoryStyle:(unint64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("__VictoryFont2");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    v4 = v3;
  else
    v4 = CFSTR("__VictoryFont1");
  return +[NTKFontLoader fontDescriptorForSectName:](NTKFontLoader, "fontDescriptorForSectName:", v4);
}

- (void)drawTextInRect:(CGRect)a3
{
  objc_super v4;

  if (self->_requiresDrawingRectAdjustments)
    a3 = CGRectOffset(a3, self->_drawingRectOffset.dx, self->_drawingRectOffset.dy);
  v4.receiver = self;
  v4.super_class = (Class)NTKVictoryLabel;
  -[NTKVictoryLabel drawTextInRect:](&v4, sel_drawTextInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGVector)drawingRectOffset
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_drawingRectOffset.dx;
  dy = self->_drawingRectOffset.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (double)outlineAlpha
{
  return self->_outlineAlpha;
}

- (void)setOutlineLabel:(id)a3
{
  objc_storeStrong((id *)&self->_outlineLabel, a3);
}

- (BOOL)requiresDrawingRectAdjustments
{
  return self->_requiresDrawingRectAdjustments;
}

- (void)setRequiresDrawingRectAdjustments:(BOOL)a3
{
  self->_requiresDrawingRectAdjustments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlineLabel, 0);
  objc_storeStrong((id *)&self->_outlineColor, 0);
}

+ (void)loadFonts:(uint64_t)a1 style:(NSObject *)a2 monospacedNumbers:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "+[NTKVictoryLabel loadFonts:style:monospacedNumbers:]";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "%s Unable to load font descriptor for style %lu", (uint8_t *)&v2, 0x16u);
}

@end
