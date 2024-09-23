@implementation NSCollectionLayoutGroupCustomItem

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSInteger)zIndex
{
  return self->_zIndex;
}

+ (NSCollectionLayoutGroupCustomItem)customItemWithFrame:(CGRect)frame
{
  return (NSCollectionLayoutGroupCustomItem *)objc_msgSend(a1, "customItemWithFrame:zIndex:", 0, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

+ (NSCollectionLayoutGroupCustomItem)customItemWithFrame:(CGRect)frame zIndex:(NSInteger)zIndex
{
  return (NSCollectionLayoutGroupCustomItem *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:zIndex:", zIndex, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

- (NSCollectionLayoutGroupCustomItem)initWithFrame:(CGRect)a3 zIndex:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSCollectionLayoutGroupCustomItem *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)NSCollectionLayoutGroupCustomItem;
  result = -[NSCollectionLayoutGroupCustomItem init](&v10, sel_init);
  if (result)
  {
    result->_frame.origin.x = x;
    result->_frame.origin.y = y;
    result->_frame.size.width = width;
    result->_frame.size.height = height;
    result->_zIndex = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NSCollectionLayoutGroupCustomItem frame](self, "frame");
  return (id)objc_msgSend(v4, "initWithFrame:zIndex:", -[NSCollectionLayoutGroupCustomItem zIndex](self, "zIndex"), v5, v6, v7, v8);
}

@end
