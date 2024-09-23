@implementation SUUIRedeemTemplateViewElement

- (SUUIRedeemTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIRedeemTemplateViewElement *v9;
  uint64_t v10;
  NSString *initialCode;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIRedeemTemplateViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v13, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("code"));
    v10 = objc_claimAutoreleasedReturnValue();
    initialCode = v9->_initialCode;
    v9->_initialCode = (NSString *)v10;

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIRedeemTemplateViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *initialCode;
  objc_super v10;

  v4 = (SUUIRedeemTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIRedeemTemplateViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SUUIRedeemTemplateViewElement initialCode](v4, "initialCode");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    initialCode = self->_initialCode;
    self->_initialCode = v7;

  }
  return v6;
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialCode, 0);
}

@end
