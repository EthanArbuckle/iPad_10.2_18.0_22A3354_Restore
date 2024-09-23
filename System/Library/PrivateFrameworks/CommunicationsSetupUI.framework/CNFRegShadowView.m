@implementation CNFRegShadowView

- (CNFRegShadowView)initWithFrame:(CGRect)a3 shadowImage:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CNFRegShadowView *v10;
  CNFRegShadowView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNFRegShadowView;
  v10 = -[CNFRegShadowView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[CNFRegShadowView setShadowImage:](v10, "setShadowImage:", v9);
    -[CNFRegShadowView setOpaque:](v11, "setOpaque:", 0);
  }

  return v11;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;
  CGRect v21;

  -[CNFRegShadowView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CNFRegShadowView cachedBounds](self, "cachedBounds");
  v21.origin.x = v12;
  v21.origin.y = v13;
  v21.size.width = v14;
  v21.size.height = v15;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  if (!CGRectEqualToRect(v20, v21))
    -[CNFRegShadowView setCachedPath:](self, "setCachedPath:", 0);
  -[CNFRegShadowView cachedPath](self, "cachedPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[CNFRegShadowView setCachedBounds:](self, "setCachedBounds:", v5, v7, v9, v11);
    objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, v5, v7, v9, v11, 10.0, 10.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegShadowView setCachedPath:](self, "setCachedPath:", v17);

  }
  -[CNFRegShadowView cachedPath](self, "cachedPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addClip");

  -[CNFRegShadowView shadowImage](self, "shadowImage");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFRegShadowView bounds](self, "bounds");
  objc_msgSend(v19, "drawInRect:");

}

- (CGRect)cachedBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedBounds.origin.x;
  y = self->_cachedBounds.origin.y;
  width = self->_cachedBounds.size.width;
  height = self->_cachedBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedBounds:(CGRect)a3
{
  self->_cachedBounds = a3;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (void)setShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->_shadowImage, a3);
}

- (UIBezierPath)cachedPath
{
  return self->_cachedPath;
}

- (void)setCachedPath:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_cachedPath, 0);
}

@end
