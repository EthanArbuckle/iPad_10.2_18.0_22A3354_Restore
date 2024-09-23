@implementation CUIPlaceholder_CUIMultisizeImageSetSizeAndIndex

- (CUIPlaceholder_CUIMultisizeImageSetSizeAndIndex)initWithSize:(CGSize)a3 index:(unsigned int)a4 idiom:(int64_t)a5 subtype:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  CUIPlaceholder_CUIMultisizeImageSetSizeAndIndex *result;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)CUIPlaceholder_CUIMultisizeImageSetSizeAndIndex;
  result = -[CUIPlaceholder_CUIMultisizeImageSetSizeAndIndex init](&v12, sel_init);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_index = a4;
    result->_idiom = a5;
    result->_subtype = a6;
  }
  return result;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPlaceholder_CUIMultisizeImageSetSizeAndIndex;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ size: (%d, %d) index: %d idiom: %d subtype: %d"), -[CUIPlaceholder_CUIMultisizeImageSetSizeAndIndex description](&v3, sel_description), (int)self->_size.width, (int)self->_size.height, self->_index, self->_idiom, self->_subtype);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (void)setIdiom:(int64_t)a3
{
  self->_idiom = a3;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unint64_t)a3
{
  self->_subtype = a3;
}

@end
