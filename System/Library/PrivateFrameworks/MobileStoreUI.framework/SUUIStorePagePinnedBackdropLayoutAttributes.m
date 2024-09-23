@implementation SUUIStorePagePinnedBackdropLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIStorePagePinnedBackdropLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setBackdropColor:", self->_backdropColor);
  objc_msgSend(v4, "setBackdropGroupName:", self->_backdropGroupName);
  objc_msgSend(v4, "setBackdropStyle:", self->_backdropStyle);
  objc_msgSend(v4, "setHidesBackdropView:", self->_hidesBackdropView);
  objc_msgSend(v4, "setTransitionProgress:", self->_transitionProgress);
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIStorePagePinnedBackdropLayoutAttributes;
  v3 = -[UICollectionViewLayoutAttributes hash](&v8, sel_hash);
  v4 = -[UIColor hash](self->_backdropColor, "hash") ^ v3;
  v5 = -[NSString hash](self->_backdropGroupName, "hash");
  v6 = 10000;
  if (!self->_hidesBackdropView)
    v6 = 0;
  return v4 ^ v5 ^ self->_backdropStyle ^ v6 ^ llround(self->_transitionProgress * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  SUUIStorePagePinnedBackdropLayoutAttributes *v4;
  SUUIStorePagePinnedBackdropLayoutAttributes *v5;
  UIColor *backdropColor;
  NSString *backdropGroupName;
  BOOL v8;
  objc_super v10;

  v4 = (SUUIStorePagePinnedBackdropLayoutAttributes *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v10.receiver = self;
      v10.super_class = (Class)SUUIStorePagePinnedBackdropLayoutAttributes;
      v8 = -[UICollectionViewLayoutAttributes isEqual:](&v10, sel_isEqual_, v5)
        && ((backdropColor = self->_backdropColor, backdropColor == v5->_backdropColor)
         || -[UIColor isEqual:](backdropColor, "isEqual:"))
        && ((backdropGroupName = self->_backdropGroupName, backdropGroupName == v5->_backdropGroupName)
         || -[NSString isEqualToString:](backdropGroupName, "isEqualToString:"))
        && self->_backdropStyle == v5->_backdropStyle
        && self->_hidesBackdropView == v5->_hidesBackdropView
        && self->_transitionProgress != v5->_transitionProgress;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (UIColor)backdropColor
{
  return self->_backdropColor;
}

- (void)setBackdropColor:(id)a3
{
  objc_storeStrong((id *)&self->_backdropColor, a3);
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (void)setBackdropGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (void)setBackdropStyle:(int64_t)a3
{
  self->_backdropStyle = a3;
}

- (BOOL)hidesBackdropView
{
  return self->_hidesBackdropView;
}

- (void)setHidesBackdropView:(BOOL)a3
{
  self->_hidesBackdropView = a3;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (void)setTransitionProgress:(double)a3
{
  self->_transitionProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_backdropColor, 0);
}

@end
