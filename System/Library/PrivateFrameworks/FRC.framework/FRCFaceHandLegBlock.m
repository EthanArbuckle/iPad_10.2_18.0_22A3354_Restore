@implementation FRCFaceHandLegBlock

+ (id)faceHandLegBlockWithRect:(CGRect)a3 numberOfBlocks:(unint64_t)a4 category:(unint64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___FRCFaceHandLegBlock;
  v11 = (void *)objc_msgSend(objc_msgSendSuper2(&v15, sel_alloc), "init");
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setCategory:", a5);
    objc_msgSend(v12, "setRect:", x, y, width, height);
    objc_msgSend(v12, "setNumberOfBlocks:", a4);
    v13 = v12;
  }

  return v12;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (unint64_t)numberOfBlocks
{
  return self->_numberOfBlocks;
}

- (void)setNumberOfBlocks:(unint64_t)a3
{
  self->_numberOfBlocks = a3;
}

@end
