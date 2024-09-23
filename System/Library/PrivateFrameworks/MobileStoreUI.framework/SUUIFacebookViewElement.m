@implementation SUUIFacebookViewElement

- (SUUIFacebookViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIFacebookViewElement *v9;
  void *v10;
  uint64_t v11;
  NSString *urlString;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIFacebookViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_facebookType = objc_msgSend(v10, "isEqualToString:", CFSTR("large"));

    objc_msgSend(v8, "getAttribute:", CFSTR("url"));
    v11 = objc_claimAutoreleasedReturnValue();
    urlString = v9->_urlString;
    v9->_urlString = (NSString *)v11;

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIFacebookViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *urlString;
  objc_super v10;

  v4 = (SUUIFacebookViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIFacebookViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_facebookType = -[SUUIFacebookViewElement facebookType](v4, "facebookType");
    -[SUUIFacebookViewElement URLString](v4, "URLString");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    urlString = self->_urlString;
    self->_urlString = v7;

  }
  return v6;
}

- (int64_t)pageComponentType
{
  return 20;
}

- (int64_t)facebookType
{
  return self->_facebookType;
}

- (NSString)URLString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
