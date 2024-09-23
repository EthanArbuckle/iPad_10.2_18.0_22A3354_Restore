@implementation SUUIBrowseViewElement

- (SUUIBrowseViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIBrowseViewElement *v9;
  uint64_t v10;
  NSString *title;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIBrowseViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v13, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v9->_title;
    v9->_title = (NSString *)v10;

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIBrowseViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *title;
  objc_super v10;

  v4 = (SUUIBrowseViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIBrowseViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SUUIBrowseViewElement title](v4, "title");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = self->_title;
    self->_title = v7;

  }
  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
