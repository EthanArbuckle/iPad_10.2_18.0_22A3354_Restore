@implementation SUUIActivityIndicatorViewElement

- (SUUIActivityIndicatorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIActivityIndicatorViewElement *v9;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIActivityIndicatorViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("period"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "doubleValue");
    else
      v12 = -1.0;
    v9->_period = v12;

  }
  return v9;
}

- (SUUIImageViewElement)image
{
  return (SUUIImageViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
}

- (double)period
{
  return self->_period;
}

- (SUUILabelViewElement)text
{
  return (SUUILabelViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 138);
}

- (BOOL)isDisabled
{
  return 1;
}

- (int64_t)pageComponentType
{
  return 24;
}

@end
