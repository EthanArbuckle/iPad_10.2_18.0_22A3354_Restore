@implementation SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost

- (void)setTitleView:(id)a3
{
  id v5;
  UIView **p_titleView;
  UIView *titleView;
  UIView *v8;
  id v9;

  v5 = a3;
  p_titleView = &self->_titleView;
  titleView = self->_titleView;
  v9 = v5;
  if (titleView)
  {
    -[UIView removeFromSuperview](titleView, "removeFromSuperview");
    v8 = *p_titleView;
    *p_titleView = 0;

    v5 = v9;
  }
  if (v5)
  {
    -[SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost addSubview:](self, "addSubview:", v9);
    objc_storeStrong((id *)&self->_titleView, a3);
    v5 = v9;
  }

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGRect rect;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, sel_layoutSubviews);
  -[SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView frame](self->_titleView, "frame");
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  rect.origin.x = v23.origin.x;
  v14 = CGRectGetWidth(v23);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  if (v14 >= CGRectGetWidth(v24))
  {
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    width = CGRectGetWidth(v25);
  }
  v26.origin.x = rect.origin.x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v15 = CGRectGetHeight(v26);
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  v16 = CGRectGetHeight(v27);
  if (v15 >= v16)
  {
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    v16 = CGRectGetHeight(v28);
  }
  -[SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost traitCollection](self, "traitCollection", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayScale");
  v19 = v18;
  if (v18 < 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scale");
    v19 = v21;

  }
  UIRectCenteredXInRectScale();
  UIRectCenteredYInRectScale();
  -[UIView setFrame:](self->_titleView, "setFrame:", *(_QWORD *)&v19);

}

- (UIView)titleView
{
  return self->_titleView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
