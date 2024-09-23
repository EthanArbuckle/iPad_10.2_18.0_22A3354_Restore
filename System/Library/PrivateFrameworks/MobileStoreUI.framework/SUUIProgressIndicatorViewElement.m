@implementation SUUIProgressIndicatorViewElement

- (SUUIProgressIndicatorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIProgressIndicatorViewElement *v9;
  void *v10;
  float v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIProgressIndicatorViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v13, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v9->_value = v11;

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIProgressIndicatorViewElement *v4;
  SUUIProgressIndicatorViewElement *v5;
  SUUIProgressIndicatorViewElement *v6;
  float v7;
  objc_super v9;

  v4 = (SUUIProgressIndicatorViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIProgressIndicatorViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v9, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUIProgressIndicatorViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    -[SUUIProgressIndicatorViewElement value](v4, "value");
    self->_value = v7;
  }

  return v6;
}

- (float)value
{
  return self->_value;
}

@end
