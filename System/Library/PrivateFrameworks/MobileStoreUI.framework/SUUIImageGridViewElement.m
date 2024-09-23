@implementation SUUIImageGridViewElement

- (SUUIImageGridViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIImageGridViewElement *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIImageGridViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("height"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("width"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length") && objc_msgSend(v11, "length"))
    {
      objc_msgSend(v10, "doubleValue");
      v9->_size.height = v12;
      objc_msgSend(v11, "doubleValue");
      v9->_size.width = v13;
    }

  }
  return v9;
}

- (int64_t)columnCount
{
  void *v2;
  int64_t v3;

  -[SUUIImageGridViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "columnCount");

  if (v3 <= 1)
    return 1;
  else
    return v3;
}

- (UIEdgeInsets)contentInset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[SUUIImageGridViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementPadding");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
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

@end
