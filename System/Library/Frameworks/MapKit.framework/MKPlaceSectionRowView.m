@implementation MKPlaceSectionRowView

- (void)setSelected:(BOOL)a3
{
  -[MKPlaceSectionRowView setSelected:animated:](self, "setSelected:animated:", a3, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (*(&self->super._fullWidthHairline + 1) != a3)
  {
    *(&self->super._fullWidthHairline + 1) = a3;
    -[MKPlaceSectionRowView _updateBackgroundColor:](self, "_updateBackgroundColor:", a4);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  -[MKPlaceSectionRowView setHighlighted:animated:](self, "setHighlighted:animated:", a3, 0);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (*(&self->super._fullWidthHairline + 2) != a3)
  {
    *(&self->super._fullWidthHairline + 2) = a3;
    -[MKPlaceSectionRowView _updateBackgroundColor:](self, "_updateBackgroundColor:", a4);
  }
}

- (void)_updateBackgroundColor:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v3 = a3;
  if (*(&self->super._fullWidthHairline + 1) || *(&self->super._fullWidthHairline + 2))
  {
    -[UIView mk_theme](self, "mk_theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedRowColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIView mk_theme](self, "mk_theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rowColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  if (v3)
  {
    v8 = (void *)MEMORY[0x1E0CEABB0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__MKPlaceSectionRowView__updateBackgroundColor___block_invoke;
    v9[3] = &unk_1E20D7E58;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "_mapkit_animateWithDuration:animations:completion:", v9, 0, 0.200000003);

  }
  else
  {
    -[UIView _mapkit_setBackgroundColor:](self, "_mapkit_setBackgroundColor:", v7);
  }

}

uint64_t __48__MKPlaceSectionRowView__updateBackgroundColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mapkit_setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isSelected
{
  return *(&self->super._fullWidthHairline + 1);
}

- (BOOL)isHighlighted
{
  return *(&self->super._fullWidthHairline + 2);
}

@end
