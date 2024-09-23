@implementation GKButton

- (void)replayAndApplyStyleWithSystemContentChange:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  GKTextStyle *v10;
  GKTextStyle *appliedStyle;
  uint64_t v12;
  void *v13;
  objc_super v14;

  if (self->_baseStyle)
  {
    v3 = a3;
    for (i = 0; i != 4; ++i)
    {
      v6 = replayAndApplyStyleWithSystemContentChange__states[i];
      v7 = (void *)MEMORY[0x1E0D25B28];
      -[GKButton attributedTitleForState:](self, "attributedTitleForState:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "attributedString:byReplayingFromBaseStyle:systemContentSizeDidChange:", v8, self->_baseStyle, v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v14.receiver = self;
      v14.super_class = (Class)GKButton;
      -[GKButton setAttributedTitle:forState:](&v14, sel_setAttributedTitle_forState_, v9, v6);

    }
    v10 = self->_baseStyle;
    appliedStyle = self->_appliedStyle;
    if (appliedStyle)
    {
      -[GKTextStyle replayOnBaseStyle:systemContentSizeDidChange:](appliedStyle, "replayOnBaseStyle:systemContentSizeDidChange:", self->_baseStyle, v3);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (GKTextStyle *)v12;
    }
    if (v10)
    {
      -[GKButton titleLabel](self, "titleLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTextStyle applyToLabel:](v10, "applyToLabel:", v13);

    }
  }
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
    -[GKButton replayAndApplyStyleWithSystemContentChange:](self, "replayAndApplyStyleWithSystemContentChange:", 0);
    v5 = v6;
  }

}

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appearanceWhenContainedInInstancesOfClasses:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0D25B38]);
  objc_msgSend(v4, "setBaseStyle:", v5);

}

- (GKButton)initWithFrame:(CGRect)a3
{
  GKButton *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  Class *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKButton;
  v3 = -[GKButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
    -[GKButton replayAndApplyStyleWithSystemContentChange:](self, "replayAndApplyStyleWithSystemContentChange:", 0);

}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKButton;
  -[GKButton setAttributedTitle:forState:](&v5, sel_setAttributedTitle_forState_, a3, a4);
  -[GKButton replayAndApplyStyleWithSystemContentChange:](self, "replayAndApplyStyleWithSystemContentChange:", 0);
}

- (void)applyButtonStyle:(id)a3
{
  GKButtonStyle **p_appliedButtonStyle;
  id v6;

  p_appliedButtonStyle = &self->_appliedButtonStyle;
  objc_storeStrong((id *)&self->_appliedButtonStyle, a3);
  v6 = a3;
  -[GKButtonStyle applyToButton:](*p_appliedButtonStyle, "applyToButton:", self);

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
  v16.super_class = (Class)GKButton;
  -[GKButton intrinsicContentSize](&v16, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[GKButton titleEdgeInsets](self, "titleEdgeInsets");
  v8 = v7;
  -[GKButton titleEdgeInsets](self, "titleEdgeInsets");
  v10 = v4 + v8 + v9;
  -[GKButton titleEdgeInsets](self, "titleEdgeInsets");
  v12 = v11;
  -[GKButton titleEdgeInsets](self, "titleEdgeInsets");
  v14 = v6 + v12 + v13;
  v15 = v10;
  result.height = v14;
  result.width = v15;
  return result;
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
  objc_storeStrong((id *)&self->_appliedButtonStyle, 0);
  objc_storeStrong((id *)&self->_appliedStyle, 0);
  objc_storeStrong((id *)&self->_baseStyle, 0);
}

@end
