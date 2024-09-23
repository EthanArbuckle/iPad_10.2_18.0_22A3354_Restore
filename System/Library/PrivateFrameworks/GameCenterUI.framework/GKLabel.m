@implementation GKLabel

- (void)replayAndApplyStyleUnlessInhibited
{
  if (!-[GKLabel shouldInhibitReplay](self, "shouldInhibitReplay"))
    -[GKLabel replayAndApplyStyleWithSystemContentChange:](self, "replayAndApplyStyleWithSystemContentChange:", 0);
}

- (void)replayAndApplyStyleWithSystemContentChange:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  GKTextStyle *baseStyle;
  GKTextStyle *v7;
  GKTextStyle *v8;
  GKTextStyle *appliedStyle;
  uint64_t v10;
  void *v11;
  double v12;
  objc_super v13;

  v3 = a3;
  v5 = -[GKLabel usingAttributedText](self, "usingAttributedText");
  baseStyle = self->_baseStyle;
  if (v5)
  {
    if (!baseStyle)
      return;
    -[GKLabel attributedText](self, "attributedText");
    v7 = (GKTextStyle *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D25B28], "attributedString:byReplayingFromBaseStyle:systemContentSizeDidChange:", v7, self->_baseStyle, v3);
    v8 = (GKTextStyle *)objc_claimAutoreleasedReturnValue();
    if (v8 != v7)
    {
      v13.receiver = self;
      v13.super_class = (Class)GKLabel;
      -[GKLabel setAttributedText:](&v13, sel_setAttributedText_, v8);
    }
  }
  else
  {
    v7 = baseStyle;
    appliedStyle = self->_appliedStyle;
    if (appliedStyle)
    {
      -[GKTextStyle replayOnBaseStyle:systemContentSizeDidChange:](appliedStyle, "replayOnBaseStyle:systemContentSizeDidChange:", self->_baseStyle, v3);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (GKTextStyle *)v10;
    }
    if (!v7)
      goto LABEL_10;
    v12 = 0.0;
    -[GKTextStyle resolveFontAndLineSpacing:](v7, "resolveFontAndLineSpacing:", &v12);
    v8 = (GKTextStyle *)objc_claimAutoreleasedReturnValue();
    -[GKLabel setFont:](self, "setFont:", v8);
    -[GKTextStyle color](v7, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLabel setTextColor:](self, "setTextColor:", v11);

    -[GKLabel setLineBreakMode:](self, "setLineBreakMode:", -[GKTextStyle lineBreakMode](v7, "lineBreakMode"));
    -[GKLabel setTextAlignment:](self, "setTextAlignment:", -[GKTextStyle textAlignment](v7, "textAlignment"));
    -[GKLabel setLineSpacing:](self, "setLineSpacing:", (uint64_t)v12);
  }

LABEL_10:
}

- (GKTextStyle)baseStyle
{
  return self->_baseStyle;
}

- (void)setBaseStyle:(id)a3
{
  GKTextStyle *v5;
  GKTextStyle *v6;

  v5 = (GKTextStyle *)a3;
  if (self->_baseStyle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_baseStyle, a3);
    -[GKLabel replayAndApplyStyleWithSystemContentChange:](self, "replayAndApplyStyleWithSystemContentChange:", 0);
    v5 = v6;
  }

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  v16.receiver = self;
  v16.super_class = (Class)GKLabel;
  -[GKLabel intrinsicContentSize](&v16, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[GKLabel titleEdgeInsets](self, "titleEdgeInsets");
  v8 = v7;
  -[GKLabel titleEdgeInsets](self, "titleEdgeInsets");
  v10 = v4 + v8 + v9;
  -[GKLabel titleEdgeInsets](self, "titleEdgeInsets");
  v12 = v11;
  -[GKLabel titleEdgeInsets](self, "titleEdgeInsets");
  v14 = v6 + v12 + v13;
  v15 = v10;
  result.height = v14;
  result.width = v15;
  return result;
}

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  v21[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appearanceWhenContainedInInstancesOfClasses:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0D25B38]);
  objc_msgSend(v4, "setBaseStyle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceIdiom:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3E88];
  v20[0] = v6;
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollectionWithTraitsFromCollections:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "appearanceForTraitCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0D25B38]);
  objc_msgSend(v11, "setBaseStyle:", v12);

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3E88];
  v19[0] = v6;
  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "traitCollectionWithTraitsFromCollections:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "appearanceForTraitCollection:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x1E0D25B30]);
  objc_msgSend(v17, "setBaseStyle:", v18);

}

- (GKLabel)initWithFrame:(CGRect)a3
{
  GKLabel *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  Class *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKLabel;
  v3 = -[GKLabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != 1 || (*MEMORY[0x1E0D253F8] ? (v6 = *MEMORY[0x1E0D25B68] == 0) : (v6 = 0), v6))
      v7 = (Class *)0x1E0D25B38;
    else
      v7 = (Class *)0x1E0D25B30;
    v8 = objc_alloc_init(*v7);
    objc_storeStrong((id *)&v3->_baseStyle, v8);

  }
  return v3;
}

- (void)setAttributedText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKLabel;
  -[GKLabel setAttributedText:](&v4, sel_setAttributedText_, a3);
  self->_usingAttributedText = 1;
  -[GKLabel replayAndApplyStyleUnlessInhibited](self, "replayAndApplyStyleUnlessInhibited");
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKLabel;
  -[GKLabel setText:](&v4, sel_setText_, a3);
  self->_usingAttributedText = 0;
}

- (void)applyTextStyle:(id)a3
{
  GKTextStyle **p_appliedStyle;
  GKTextStyle *v6;
  GKTextStyle *v7;

  p_appliedStyle = &self->_appliedStyle;
  v6 = (GKTextStyle *)a3;
  v7 = v6;
  if (*p_appliedStyle != v6)
  {
    objc_storeStrong((id *)&self->_appliedStyle, a3);
    v6 = *p_appliedStyle;
  }
  if (v6)
    -[GKLabel replayAndApplyStyleWithSystemContentChange:](self, "replayAndApplyStyleWithSystemContentChange:", 0);

}

- (double)actualFontShrinkageFactor
{
  double result;

  result = self->_actualFontShrinkageFactor;
  if (result == 0.0)
    return 1.0;
  return result;
}

- (void)shrinkFontToFitWidth
{
  -[GKLabel shrinkFontToFitSize:](self, "shrinkFontToFitSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (CGSize)shrinkFontToFitSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _QWORD v40[2];
  _QWORD v41[3];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v41[2] = *MEMORY[0x1E0C80C00];
  -[GKLabel replayAndApplyStyleUnlessInhibited](self, "replayAndApplyStyleUnlessInhibited");
  if (width == 0.0 || (v39 = height, v6 = width, height == 0.0))
  {
    -[GKLabel frame](self, "frame");
    v39 = v8;
    if (v7 == 0.0)
    {
      v28 = height;
      v27 = width;
      goto LABEL_30;
    }
    v6 = v7;
  }
  -[GKLabel text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GKLabel numberOfLines](self, "numberOfLines") == 1)
  {
    v10 = 0;
    v11 = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v13, "count") < 2)
    {
      v10 = 0;
      v11 = 2;
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
    }

  }
  -[GKLabel font](self, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pointSize");
  v16 = v15;
  -[GKLabel minimumScaleFactor](self, "minimumScaleFactor");
  v18 = v16 * v17;
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_msgSend(v20, "setLineBreakMode:", v11);
  LODWORD(v21) = *(_DWORD *)"333?";
  objc_msgSend(v20, "setHyphenationFactor:", v21);
  v38 = v16;
  if (v16 >= v18)
  {
    v22 = *MEMORY[0x1E0DC1138];
    v23 = *MEMORY[0x1E0DC1178];
    while (1)
    {
      v40[0] = v22;
      v40[1] = v23;
      v41[0] = v14;
      v41[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v24, 0, v6, 1.79769313e308);
      v27 = v26;
      v28 = v25;
      if (v26 < v6 && v25 < v39)
      {
        if (!v10)
          break;
        objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v24, 0, 1.79769313e308, v25);
        if (v30 < v6)
          break;
      }
      v16 = v16 + -0.5;
      objc_msgSend(v14, "fontWithSize:", v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      width = v27;
      height = v28;
      v14 = v31;
      if (v16 < v18)
        goto LABEL_24;
    }

  }
  v31 = v14;
  v28 = height;
  v27 = width;
LABEL_24:
  if (v16 != v38)
  {
    -[GKLabel setFont:](self, "setFont:", v31);
    -[GKLabel attributedText](self, "attributedText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[GKLabel attributedText](self, "attributedText");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "attributesAtIndex:effectiveRange:", 0, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("GKRecorderAttribute"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v35, "setFontSize:rebaseSelector:", 0, v16);

    }
  }
  -[GKLabel setActualFontShrinkageFactor:](self, "setActualFontShrinkageFactor:", v16 / v38);

LABEL_30:
  v36 = v27;
  v37 = v28;
  result.height = v37;
  result.width = v36;
  return result;
}

- (void)updateConstraints
{
  double Width;
  double v4;
  objc_super v5;
  CGRect v6;

  if (-[GKLabel shouldEnforcePreferredWidth](self, "shouldEnforcePreferredWidth"))
  {
    -[GKLabel bounds](self, "bounds");
    Width = CGRectGetWidth(v6);
    -[GKLabel preferredMaxLayoutWidth](self, "preferredMaxLayoutWidth");
    if (v4 != Width)
      -[GKLabel setPreferredMaxLayoutWidth:](self, "setPreferredMaxLayoutWidth:", Width);
  }
  v5.receiver = self;
  v5.super_class = (Class)GKLabel;
  -[GKLabel updateConstraints](&v5, sel_updateConstraints);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[GKLabel shouldEnforcePreferredWidth](self, "shouldEnforcePreferredWidth"))
  {
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    v8 = CGRectGetWidth(v10);
    -[GKLabel bounds](self, "bounds");
    if (v8 != CGRectGetWidth(v11))
      -[GKLabel setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
  v9.receiver = self;
  v9.super_class = (Class)GKLabel;
  -[GKLabel setBounds:](&v9, sel_setBounds_, x, y, width, height);
}

- (BOOL)shouldEnforcePreferredWidth
{
  return self->_shouldEnforcePreferredWidth;
}

- (void)setShouldEnforcePreferredWidth:(BOOL)a3
{
  self->_shouldEnforcePreferredWidth = a3;
}

- (BOOL)usingAttributedText
{
  return self->_usingAttributedText;
}

- (BOOL)shouldInhibitReplay
{
  return self->_shouldInhibitReplay;
}

- (void)setShouldInhibitReplay:(BOOL)a3
{
  self->_shouldInhibitReplay = a3;
}

- (void)setActualFontShrinkageFactor:(double)a3
{
  self->_actualFontShrinkageFactor = a3;
}

- (UIEdgeInsets)titleEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_titleEdgeInsets.top;
  left = self->_titleEdgeInsets.left;
  bottom = self->_titleEdgeInsets.bottom;
  right = self->_titleEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)a3
{
  self->_titleEdgeInsets = a3;
}

- (GKTextStyle)appliedStyle
{
  return self->_appliedStyle;
}

- (void)setAppliedStyle:(id)a3
{
  objc_storeStrong((id *)&self->_appliedStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appliedStyle, 0);
  objc_storeStrong((id *)&self->_baseStyle, 0);
}

@end
