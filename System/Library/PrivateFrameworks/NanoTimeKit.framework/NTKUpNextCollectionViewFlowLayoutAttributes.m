@implementation NTKUpNextCollectionViewFlowLayoutAttributes

- (NTKUpNextCollectionViewFlowLayoutAttributes)init
{
  NTKUpNextCollectionViewFlowLayoutAttributes *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKUpNextCollectionViewFlowLayoutAttributes;
  result = -[UICollectionViewLayoutAttributes init](&v3, sel_init);
  if (result)
    result->_scale = 1.0;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  _BOOL4 v13;
  int v14;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  v16.receiver = self;
  v16.super_class = (Class)NTKUpNextCollectionViewFlowLayoutAttributes;
  if (!-[UICollectionViewLayoutAttributes isEqual:](&v16, sel_isEqual_, v4))
    goto LABEL_7;
  objc_msgSend(v4, "darkeningAlphaUniform");
  if (!CLKFloatEqualsFloat())
    goto LABEL_7;
  objc_msgSend(v4, "unitFrameOnScreen");
  v17.origin.x = v5;
  v17.origin.y = v6;
  v17.size.width = v7;
  v17.size.height = v8;
  if (!CGRectEqualToRect(self->_unitFrameOnScreen, v17))
    goto LABEL_7;
  objc_msgSend(v4, "computedFrame");
  v18.origin.x = v9;
  v18.origin.y = v10;
  v18.size.width = v11;
  v18.size.height = v12;
  if (CGRectEqualToRect(self->_computedFrame, v18))
  {
    v13 = -[NTKUpNextCollectionViewFlowLayoutAttributes notVisibleToUser](self, "notVisibleToUser");
    v14 = v13 ^ objc_msgSend(v4, "notVisibleToUser") ^ 1;
  }
  else
  {
LABEL_7:
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKUpNextCollectionViewFlowLayoutAttributes;
  v3 = -[UICollectionViewLayoutAttributes hash](&v13, sel_hash);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_darkeningAlphaUniform);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_unitFrameOnScreen.origin.x, self->_unitFrameOnScreen.origin.y, self->_unitFrameOnScreen.size.width, self->_unitFrameOnScreen.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_computedFrame.origin.x, self->_computedFrame.origin.y, self->_computedFrame.size.width, self->_computedFrame.size.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NTKUpNextCollectionViewFlowLayoutAttributes notVisibleToUser](self, "notVisibleToUser"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKUpNextCollectionViewFlowLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[NTKUpNextCollectionViewFlowLayoutAttributes darkeningAlphaUniform](self, "darkeningAlphaUniform");
  objc_msgSend(v4, "setDarkeningAlphaUniform:");
  -[NTKUpNextCollectionViewFlowLayoutAttributes unitFrameOnScreen](self, "unitFrameOnScreen");
  objc_msgSend(v4, "setUnitFrameOnScreen:");
  -[NTKUpNextCollectionViewFlowLayoutAttributes computedFrame](self, "computedFrame");
  objc_msgSend(v4, "setComputedFrame:");
  -[NTKUpNextCollectionViewFlowLayoutAttributes scale](self, "scale");
  objc_msgSend(v4, "setScale:");
  -[NTKUpNextCollectionViewFlowLayoutAttributes shadowAlpha](self, "shadowAlpha");
  objc_msgSend(v4, "setShadowAlpha:");
  objc_msgSend(v4, "setLayoutMode:", -[NTKUpNextCollectionViewFlowLayoutAttributes layoutMode](self, "layoutMode"));
  objc_msgSend(v4, "setNotVisibleToUser:", -[NTKUpNextCollectionViewFlowLayoutAttributes notVisibleToUser](self, "notVisibleToUser"));
  objc_msgSend(v4, "setFullyVisibleToUser:", -[NTKUpNextCollectionViewFlowLayoutAttributes fullyVisibleToUser](self, "fullyVisibleToUser"));
  return v4;
}

- (double)darkeningAlphaUniform
{
  return self->_darkeningAlphaUniform;
}

- (void)setDarkeningAlphaUniform:(double)a3
{
  self->_darkeningAlphaUniform = a3;
}

- (CGRect)unitFrameOnScreen
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unitFrameOnScreen.origin.x;
  y = self->_unitFrameOnScreen.origin.y;
  width = self->_unitFrameOnScreen.size.width;
  height = self->_unitFrameOnScreen.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setUnitFrameOnScreen:(CGRect)a3
{
  self->_unitFrameOnScreen = a3;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (void)setShadowAlpha:(double)a3
{
  self->_shadowAlpha = a3;
}

- (CGRect)computedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_computedFrame.origin.x;
  y = self->_computedFrame.origin.y;
  width = self->_computedFrame.size.width;
  height = self->_computedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setComputedFrame:(CGRect)a3
{
  self->_computedFrame = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(int64_t)a3
{
  self->_layoutMode = a3;
}

- (BOOL)notVisibleToUser
{
  return self->_notVisibleToUser;
}

- (void)setNotVisibleToUser:(BOOL)a3
{
  self->_notVisibleToUser = a3;
}

- (BOOL)fullyVisibleToUser
{
  return self->_fullyVisibleToUser;
}

- (void)setFullyVisibleToUser:(BOOL)a3
{
  self->_fullyVisibleToUser = a3;
}

@end
