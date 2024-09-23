@implementation CEKLightingNameBadge

- (CEKLightingNameBadge)initWithFrame:(CGRect)a3
{
  CEKLightingNameBadge *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CEKLightingNameBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingNameBadge setTintColor:](v3, "setTintColor:", v4);

    v3->_lightingType = 1;
    -[CEKLightingNameBadge _updateText](v3, "_updateText");
    -[CEKLightingNameBadge _updateColorsAnimated:](v3, "_updateColorsAnimated:", 0);
  }
  return v3;
}

- (void)setLightingType:(int64_t)a3
{
  if (self->_lightingType != a3)
  {
    self->_lightingType = a3;
    -[CEKLightingNameBadge _updateText](self, "_updateText");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  -[CEKLightingNameBadge setHighlighted:animated:](self, "setHighlighted:animated:", a3, 0);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[CEKLightingNameBadge _updateColorsAnimated:](self, "_updateColorsAnimated:", a4);
  }
}

- (void)_updateText
{
  id v3;

  +[CEKLightingEffectManager displayNameForLightingType:](CEKLightingEffectManager, "displayNameForLightingType:", -[CEKLightingNameBadge lightingType](self, "lightingType"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _setText:](self, "_setText:", v3);

}

- (void)_updateColorsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  CEKLightingNameBadge *v16;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  if (-[CEKLightingNameBadge isHighlighted](self, "isHighlighted"))
  {
    -[CEKLightingNameBadge tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CEKBadgeView _setContentColor:](self, "_setContentColor:", v6);
  -[CEKBadgeView _setFillColor:](self, "_setFillColor:", v5);
  if (v3)
  {
    -[CEKLightingNameBadge snapshotViewAfterScreenUpdates:](self, "snapshotViewAfterScreenUpdates:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKLightingNameBadge bounds](self, "bounds");
    objc_msgSend(v9, "setFrame:");
    -[CEKLightingNameBadge addSubview:](self, "addSubview:", v9);
    -[CEKLightingNameBadge _setSnapshotView:](self, "_setSnapshotView:", v9);
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__CEKLightingNameBadge__updateColorsAnimated___block_invoke;
    v17[3] = &unk_1E70A4B18;
    v18 = v9;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __46__CEKLightingNameBadge__updateColorsAnimated___block_invoke_2;
    v14[3] = &unk_1E70A4BD0;
    v15 = v18;
    v16 = self;
    v12 = v18;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v17, v14, 0.17);

  }
  else
  {
    -[CEKLightingNameBadge _snapshotView](self, "_snapshotView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");

    -[CEKLightingNameBadge _setSnapshotView:](self, "_setSnapshotView:", 0);
  }

}

uint64_t __46__CEKLightingNameBadge__updateColorsAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __46__CEKLightingNameBadge__updateColorsAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "_snapshotView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "_setSnapshotView:", 0);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CEKLightingNameBadge;
  -[CEKLightingNameBadge tintColorDidChange](&v3, sel_tintColorDidChange);
  -[CEKLightingNameBadge _updateColorsAnimated:](self, "_updateColorsAnimated:", 0);
}

- (int64_t)lightingType
{
  return self->_lightingType;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIView)_snapshotView
{
  return self->__snapshotView;
}

- (void)_setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->__snapshotView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__snapshotView, 0);
}

@end
