@implementation SUUIGroupViewElement

- (SUUIGroupViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIGroupViewElement *v9;
  uint64_t v10;
  NSString *type;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIGroupViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v13, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v10 = objc_claimAutoreleasedReturnValue();
    type = v9->_type;
    v9->_type = (NSString *)v10;

  }
  return v9;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

@end
