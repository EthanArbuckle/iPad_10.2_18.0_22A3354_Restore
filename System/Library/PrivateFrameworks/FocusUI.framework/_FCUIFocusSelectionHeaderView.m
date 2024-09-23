@implementation _FCUIFocusSelectionHeaderView

- (void)_layoutLabel:(id)a3 inBounds:(CGRect)a4 measuringOnly:(CGSize *)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat MaxY;
  uint64_t v23;
  id v24;
  CGRect v25;
  CGRect v26;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v24 = a3;
  objc_msgSend(v24, "sizeThatFits:", width, height);
  BSRectWithSize();
  -[_FCUIFocusSelectionHeaderView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v23 = v12;
  UIRectCenteredXInRectScale();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  if (a5)
  {
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v21 = CGRectGetWidth(v25);
    v26.origin.x = v14;
    v26.origin.y = v16;
    v26.size.width = v18;
    v26.size.height = v20;
    MaxY = CGRectGetMaxY(v26);
    a5->width = v21;
    a5->height = MaxY;
  }
  else
  {
    objc_msgSend(v24, "setFrame:", v14, v16, v18, v20, v23);
  }

}

@end
