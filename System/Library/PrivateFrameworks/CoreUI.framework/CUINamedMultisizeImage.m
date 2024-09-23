@implementation CUINamedMultisizeImage

- (id)debugDescription
{
  int64_t v3;
  id v4;
  objc_super v6;
  NSSize v7;

  v3 = -[CUIRenditionKey themeDimension2](-[CUINamedLookup renditionKey](self, "renditionKey"), "themeDimension2");
  v6.receiver = self;
  v6.super_class = (Class)CUINamedMultisizeImage;
  v4 = -[CUINamedMultisizeImage debugDescription](&v6, sel_debugDescription);
  -[CUINamedMultisizeImage nextSizeSmaller](self, "nextSizeSmaller");
  return objc_msgSend(v4, "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\ndimension2 (size index): %d\nnextSizeSmaller: %@"), v3, NSStringFromSize(v7)));
}

- (CGSize)nextSizeSmaller
{
  double width;
  double height;
  CGSize result;

  width = self->_nextSizeSmaller.width;
  height = self->_nextSizeSmaller.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNextSizeSmaller:(CGSize)a3
{
  self->_nextSizeSmaller = a3;
}

@end
