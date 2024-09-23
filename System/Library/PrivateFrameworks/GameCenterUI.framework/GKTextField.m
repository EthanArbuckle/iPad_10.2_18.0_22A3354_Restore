@implementation GKTextField

- (void)replayAndApplyStyleWithSystemContentChange:(BOOL)a3
{
  _BOOL8 v3;
  GKTextStyle *v5;
  GKTextStyle *appliedStyle;
  uint64_t v7;
  GKTextStyle *v8;
  GKTextStyle *v9;

  v3 = a3;
  v5 = self->_baseStyle;
  appliedStyle = self->_appliedStyle;
  if (appliedStyle)
  {
    v8 = v5;
    -[GKTextStyle replayOnBaseStyle:systemContentSizeDidChange:](appliedStyle, "replayOnBaseStyle:systemContentSizeDidChange:", self->_baseStyle, v3);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (GKTextStyle *)v7;
  }
  if (v5)
  {
    v9 = v5;
    -[GKTextStyle applyToEditField:](v5, "applyToEditField:", self);
    v5 = v9;
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
    -[GKTextField replayAndApplyStyleWithSystemContentChange:](self, "replayAndApplyStyleWithSystemContentChange:", 0);
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

- (GKTextField)initWithFrame:(CGRect)a3
{
  GKTextField *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  objc_class *v7;
  GKTextStyle *v8;
  GKTextStyle *baseStyle;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GKTextField;
  v3 = -[GKTextField initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != 1 || (*MEMORY[0x1E0D253F8] ? (v6 = *MEMORY[0x1E0D25B68] == 0) : (v6 = 0), v6))
      v7 = (objc_class *)MEMORY[0x1E0D25B38];
    else
      v7 = (objc_class *)MEMORY[0x1E0D25B30];
    v8 = (GKTextStyle *)objc_alloc_init(v7);
    baseStyle = v3->_baseStyle;
    v3->_baseStyle = v8;

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
    -[GKTextField replayAndApplyStyleWithSystemContentChange:](self, "replayAndApplyStyleWithSystemContentChange:", 0);

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
