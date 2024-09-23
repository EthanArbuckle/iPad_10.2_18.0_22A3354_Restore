@implementation SUUIExpandViewElement

- (SUUIExpandViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIExpandViewElement *v9;
  void *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIExpandViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v12, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("open"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_open = objc_msgSend(v10, "BOOLValue");

    v9->_previousIsOpen = v9->_open;
  }

  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIExpandViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SUUIExpandViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIExpandViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_previousIsOpen = self->_open;
    self->_open = -[SUUIExpandViewElement isOpen](v4, "isOpen");
  }
  objc_msgSend(v6, "setPreviousIsOpen:", self->_previousIsOpen);

  return v6;
}

- (int64_t)pageComponentType
{
  return 19;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (BOOL)previousIsOpen
{
  return self->_previousIsOpen;
}

- (void)setPreviousIsOpen:(BOOL)a3
{
  self->_previousIsOpen = a3;
}

@end
