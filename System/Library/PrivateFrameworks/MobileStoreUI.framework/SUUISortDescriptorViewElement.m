@implementation SUUISortDescriptorViewElement

- (SUUISortDescriptorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUISortDescriptorViewElement *v9;
  void *v10;
  int v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUISortDescriptorViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("direction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("descending")) ^ 1;
    else
      LOBYTE(v11) = 1;
    v9->_ascending = v11;
    objc_msgSend(v8, "getAttribute:", CFSTR("property"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      objc_storeStrong((id *)&v9->_property, v12);

  }
  return v9;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUISortDescriptorViewElement *v4;
  SUUISortDescriptorViewElement *v5;
  SUUISortDescriptorViewElement *v6;
  NSString *v7;
  NSString *property;
  objc_super v10;

  v4 = (SUUISortDescriptorViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUISortDescriptorViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUISortDescriptorViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_ascending = -[SUUISortDescriptorViewElement isAscending](v4, "isAscending");
    -[SUUISortDescriptorViewElement property](v4, "property");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    property = self->_property;
    self->_property = v7;

  }
  return v6;
}

- (BOOL)isAscending
{
  return self->_ascending;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
}

@end
