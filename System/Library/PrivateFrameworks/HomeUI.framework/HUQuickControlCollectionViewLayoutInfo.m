@implementation HUQuickControlCollectionViewLayoutInfo

- (CGRect)availableContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_availableContentFrame.origin.x;
  y = self->_availableContentFrame.origin.y;
  width = self->_availableContentFrame.size.width;
  height = self->_availableContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAvailableContentFrame:(CGRect)a3
{
  self->_availableContentFrame = a3;
}

- (CGSize)collectionViewContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_collectionViewContentSize.width;
  height = self->_collectionViewContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCollectionViewContentSize:(CGSize)a3
{
  self->_collectionViewContentSize = a3;
}

- (NSMutableArray)layoutDetailsArray
{
  return self->_layoutDetailsArray;
}

- (void)setLayoutDetailsArray:(id)a3
{
  objc_storeStrong((id *)&self->_layoutDetailsArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutDetailsArray, 0);
}

@end
