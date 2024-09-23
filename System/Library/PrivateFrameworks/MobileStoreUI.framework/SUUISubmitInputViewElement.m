@implementation SUUISubmitInputViewElement

- (SUUISubmitInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUISubmitInputViewElement *v9;
  void *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUISubmitInputViewElement;
  v9 = -[SUUIInputViewElement initWithDOMElement:parent:elementFactory:](&v12, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_storeStrong((id *)&v9->_label, v10);

  }
  return v9;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
