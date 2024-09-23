@implementation SUUICheckboxInputViewElement

- (SUUICheckboxInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUICheckboxInputViewElement *v9;
  void *v10;
  char v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUICheckboxInputViewElement;
  v9 = -[SUUIInputViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v11 = objc_msgSend(v10, "BOOLValue");
    else
      v11 = -1;
    v9->_disabled = v11;
    objc_msgSend(v8, "getAttribute:", CFSTR("selected"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
      v9->_selected = objc_msgSend(v12, "BOOLValue");

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUICheckboxInputViewElement *v4;
  SUUICheckboxInputViewElement *v5;
  SUUICheckboxInputViewElement *v6;
  objc_super v8;

  v4 = (SUUICheckboxInputViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUICheckboxInputViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUICheckboxInputViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_disabled = v4->_disabled;
    self->_selected = -[SUUICheckboxInputViewElement isSelected](v4, "isSelected");
  }

  return v6;
}

- (unint64_t)elementType
{
  return 18;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

@end
