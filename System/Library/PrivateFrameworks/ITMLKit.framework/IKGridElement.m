@implementation IKGridElement

- (IKGridElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  IKGridElement *v9;
  void *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IKGridElement;
  v9 = -[IKCollectionElement initWithDOMElement:parent:elementFactory:](&v12, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("paged"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_paged = objc_msgSend(v10, "ik_attributeBoolValue");

  }
  return v9;
}

- (unint64_t)columnCount
{
  void *v2;
  uint64_t v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "columnCount");

  return v3 & ~(v3 >> 63);
}

- (NSString)rowHeight
{
  void *v2;
  void *v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowHeight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)rowCount
{
  return 0;
}

- (BOOL)isPaged
{
  return self->_paged;
}

@end
