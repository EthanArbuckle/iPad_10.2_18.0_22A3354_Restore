@implementation GKShowcaseCellView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (GKShowcaseCellView)initWithFrame:(CGRect)a3
{
  GKShowcaseCellView *v3;
  GKHairlineView *v4;
  GKHairlineView *underlineView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GKShowcaseCellView;
  v3 = -[GKShowcaseCellView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(GKHairlineView);
    underlineView = v3->_underlineView;
    v3->_underlineView = v4;

    -[GKHairlineView setTranslatesAutoresizingMaskIntoConstraints:](v3->_underlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKShowcaseCellView addSubview:](v3, "addSubview:", v3->_underlineView);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_underlineView, 4, 0, v3, 4, 1.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKShowcaseCellView addConstraint:](v3, "addConstraint:", v6);

    v7 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_underlineView"), v3->_underlineView, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(15)-[_underlineView]|"), 0, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKShowcaseCellView addConstraints:](v3, "addConstraints:", v9);

  }
  return v3;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8[4];
  objc_super v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKShowcaseCellView;
  -[GKShowcaseCellView touchesEnded:withEvent:](&v9, sel_touchesEnded_withEvent_, v6, a4);
  if (self->_touchedShowcaseCellAction)
  {
    memset(v8, 0, sizeof(v8));
    if (objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v8, v10, 16))
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_gkSendAction:viaResponder:withObject:", self->_touchedShowcaseCellAction, self, self);

    }
  }

}

- (void)setCell:(id)a3
{
  UICollectionViewCell *v5;
  UICollectionViewCell *cell;
  UICollectionViewCell *v7;

  v5 = (UICollectionViewCell *)a3;
  cell = self->_cell;
  if (cell != v5)
  {
    v7 = v5;
    -[UICollectionViewCell removeFromSuperview](cell, "removeFromSuperview");
    objc_storeStrong((id *)&self->_cell, a3);
    v5 = v7;
    if (v7)
    {
      -[GKShowcaseCellView addSubview:](self, "addSubview:", self->_cell);
      v5 = v7;
    }
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKShowcaseCellView;
  -[GKShowcaseCellView prepareForReuse](&v3, sel_prepareForReuse);
  -[GKShowcaseCellView setCell:](self, "setCell:", 0);
}

- (CGRect)alignmentRectForText
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UICollectionViewCell alignmentRectForText](self->_cell, "alignmentRectForText");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UICollectionViewCell)cell
{
  return self->_cell;
}

- (SEL)touchedShowcaseCellAction
{
  return self->_touchedShowcaseCellAction;
}

- (void)setTouchedShowcaseCellAction:(SEL)a3
{
  self->_touchedShowcaseCellAction = a3;
}

- (GKHairlineView)underlineView
{
  return self->_underlineView;
}

- (void)setUnderlineView:(id)a3
{
  objc_storeStrong((id *)&self->_underlineView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlineView, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
