@implementation SUUIPhysicalCircleItemViewElement

- (SUUIPhysicalCircleItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIPhysicalCircleItemViewElement *v9;
  void *v10;
  uint64_t v11;
  NSString *itemIdentifier;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIPhysicalCircleItemViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("size"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_circleSize = objc_msgSend(v10, "integerValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v11 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v9->_itemIdentifier;
    v9->_itemIdentifier = (NSString *)v11;

  }
  return v9;
}

- (SUUIImageViewElement)imageElement
{
  return (SUUIImageViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
}

- (SUUILabelViewElement)titleElement
{
  return (SUUILabelViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 138);
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIPhysicalCircleItemViewElement *v4;
  SUUIPhysicalCircleItemViewElement *v5;
  SUUIPhysicalCircleItemViewElement *v6;
  NSString *v7;
  NSString *itemIdentifier;
  objc_super v10;

  v4 = (SUUIPhysicalCircleItemViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIPhysicalCircleItemViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUIPhysicalCircleItemViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_circleSize = -[SUUIPhysicalCircleItemViewElement circleSize](v4, "circleSize");
    -[SUUIPhysicalCircleItemViewElement itemIdentifier](v4, "itemIdentifier");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    itemIdentifier = self->_itemIdentifier;
    self->_itemIdentifier = v7;

  }
  return v6;
}

- (int64_t)circleSize
{
  return self->_circleSize;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
