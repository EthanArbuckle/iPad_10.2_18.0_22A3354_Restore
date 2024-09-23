@implementation HUQuickControlCollectionViewLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlCollectionViewLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setItemSize:", -[HUQuickControlCollectionViewLayoutAttributes itemSize](self, "itemSize"));
  objc_msgSend(v4, "setTitlePosition:", -[HUQuickControlCollectionViewLayoutAttributes titlePosition](self, "titlePosition"));
  return v4;
}

- (unint64_t)itemSize
{
  return self->_itemSize;
}

- (void)setItemSize:(unint64_t)a3
{
  self->_itemSize = a3;
}

- (unint64_t)titlePosition
{
  return self->_titlePosition;
}

- (void)setTitlePosition:(unint64_t)a3
{
  self->_titlePosition = a3;
}

@end
