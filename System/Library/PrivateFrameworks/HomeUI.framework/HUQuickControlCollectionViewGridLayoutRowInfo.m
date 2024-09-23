@implementation HUQuickControlCollectionViewGridLayoutRowInfo

- (unint64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (void)setNumberOfItems:(unint64_t)a3
{
  self->_numberOfItems = a3;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (CGPoint)rowOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_rowOrigin.x;
  y = self->_rowOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRowOrigin:(CGPoint)a3
{
  self->_rowOrigin = a3;
}

- (NSArray)itemLayouts
{
  return self->_itemLayouts;
}

- (void)setItemLayouts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemLayouts, 0);
}

@end
