@implementation CompletionArrowView

- (void)setUsesDownBackwardCompletionArrow:(BOOL)a3
{
  _BOOL4 v3;
  UIButtonConfiguration *v5;
  UIButtonConfiguration *buttonConfiguration;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v3 = a3;
  if (!self->_buttonConfiguration || self->_usesDownBackwardCompletionArrow != a3)
  {
    self->_usesDownBackwardCompletionArrow = a3;
    if (!self->_buttonConfiguration)
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
      v5 = (UIButtonConfiguration *)objc_claimAutoreleasedReturnValue();
      buttonConfiguration = self->_buttonConfiguration;
      self->_buttonConfiguration = v5;

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButtonConfiguration background](self->_buttonConfiguration, "background");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v7);

      -[UIButtonConfiguration setContentInsets:](self->_buttonConfiguration, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0DC3888];
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configurationWithHierarchicalColor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "configurationByApplyingConfiguration:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIButtonConfiguration setPreferredSymbolConfigurationForImage:](self->_buttonConfiguration, "setPreferredSymbolConfigurationForImage:", v13);
    }
    if (v3)
      v14 = CFSTR("arrow.down.backward.circle");
    else
      v14 = CFSTR("arrow.up.backward.circle");
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButtonConfiguration setImage:](self->_buttonConfiguration, "setImage:", v15);

    -[CompletionArrowView setConfiguration:](self, "setConfiguration:", self->_buttonConfiguration);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double width;
  CGFloat height;
  id WeakRetained;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  int v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double MaxX;
  double v33;
  double MinX;
  double v35;
  BOOL v36;
  double v38;
  CGPoint v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  y = a3.y;
  x = a3.x;
  -[CompletionArrowView bounds](self, "bounds", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CompletionArrowView bounds](self, "bounds");
  v15 = fmax(44.0 - CGRectGetWidth(v40), 0.0) * -0.5;
  v41.origin.x = v8;
  v41.origin.y = v10;
  v41.size.width = v12;
  v41.size.height = v14;
  v42 = CGRectInset(v41, v15, 0.0);
  v16 = v42.origin.x;
  v17 = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentCell);
  if (WeakRetained
    && -[CompletionArrowView isDescendantOfView:](self, "isDescendantOfView:", WeakRetained))
  {
    objc_msgSend(WeakRetained, "bounds");
    -[CompletionArrowView convertRect:fromView:](self, "convertRect:fromView:", WeakRetained);
    v22 = v21;
    v17 = v23;
    v25 = v24;
    height = v26;
    v27 = -[CompletionArrowView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
    v38 = y;
    v28 = v16;
    v29 = v17;
    v30 = width;
    v31 = height;
    if (v27)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v28);
      v43.origin.x = v22;
      v43.origin.y = v17;
      v43.size.width = v25;
      v43.size.height = height;
      if (MaxX < CGRectGetMaxX(v43))
      {
        v44.origin.x = v22;
        v44.origin.y = v17;
        v44.size.width = v25;
        v44.size.height = height;
        v33 = CGRectGetMaxX(v44);
        v45.origin.x = v16;
        v45.origin.y = v17;
        v45.size.width = width;
        v45.size.height = height;
        width = width + v33 - CGRectGetMaxX(v45);
      }
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v28);
      v46.origin.x = v22;
      v46.origin.y = v17;
      v46.size.width = v25;
      v46.size.height = height;
      if (MinX > CGRectGetMinX(v46))
      {
        v47.origin.x = v16;
        v47.origin.y = v17;
        v47.size.width = width;
        v47.size.height = height;
        v35 = CGRectGetMinX(v47);
        v48.origin.x = v22;
        v48.origin.y = v17;
        v48.size.width = v25;
        v48.size.height = height;
        width = width + v35 - CGRectGetMinX(v48);
        v49.origin.x = v22;
        v49.origin.y = v17;
        v49.size.width = v25;
        v49.size.height = height;
        v16 = CGRectGetMinX(v49);
      }
    }
    y = v38;
  }
  v50.origin.x = v16;
  v50.origin.y = v17;
  v50.size.width = width;
  v50.size.height = height;
  v39.x = x;
  v39.y = y;
  v36 = CGRectContainsPoint(v50, v39);

  return v36;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  CompletionArrowView *v8;
  CompletionArrowView *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CompletionArrowView;
  -[CompletionArrowView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  v8 = (CompletionArrowView *)objc_claimAutoreleasedReturnValue();
  if (v8 || !-[CompletionArrowView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
    self = v8;
  v9 = self;

  return v9;
}

- (id)accessibilityIdentifier
{
  return CFSTR("SearchSuggestionCompletionArrowView");
}

- (UITableViewCell)parentCell
{
  return (UITableViewCell *)objc_loadWeakRetained((id *)&self->_parentCell);
}

- (void)setParentCell:(id)a3
{
  objc_storeWeak((id *)&self->_parentCell, a3);
}

- (BOOL)usesDownBackwardCompletionArrow
{
  return self->_usesDownBackwardCompletionArrow;
}

- (UIButtonConfiguration)buttonConfiguration
{
  return self->_buttonConfiguration;
}

- (void)setButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_buttonConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonConfiguration, 0);
  objc_destroyWeak((id *)&self->_parentCell);
}

@end
