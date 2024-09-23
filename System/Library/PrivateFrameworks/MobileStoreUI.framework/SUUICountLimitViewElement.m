@implementation SUUICountLimitViewElement

- (SUUICountLimitViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUICountLimitViewElement *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *entityTypeString;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUICountLimitViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_limitValue = objc_msgSend(v10, "integerValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("entityType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v12 = objc_msgSend(v11, "copy");
      entityTypeString = v9->_entityTypeString;
      v9->_entityTypeString = (NSString *)v12;

    }
  }

  return v9;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUICountLimitViewElement *v4;
  SUUICountLimitViewElement *v5;
  SUUICountLimitViewElement *v6;
  void *v7;
  NSString *v8;
  NSString *entityTypeString;
  objc_super v11;

  v4 = (SUUICountLimitViewElement *)a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUICountLimitViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v11, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUICountLimitViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_limitValue = -[SUUICountLimitViewElement limitValue](v4, "limitValue");
    -[SUUICountLimitViewElement entityTypeString](v4, "entityTypeString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    entityTypeString = self->_entityTypeString;
    self->_entityTypeString = v8;

  }
  return v6;
}

- (int64_t)limitValue
{
  return self->_limitValue;
}

- (NSString)entityTypeString
{
  return self->_entityTypeString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityTypeString, 0);
}

@end
