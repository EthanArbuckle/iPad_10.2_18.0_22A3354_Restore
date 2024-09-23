@implementation SUUIPreviewTemplateViewElement

- (SUUIPreviewTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIPreviewTemplateViewElement *v9;
  void *v10;
  uint64_t v11;
  NSString *previewURLString;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIPreviewTemplateViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v9->_itemIdentifier = objc_msgSend(v10, "longLongValue");
    objc_msgSend(v8, "getAttribute:", CFSTR("preview-url"));
    v11 = objc_claimAutoreleasedReturnValue();
    previewURLString = v9->_previewURLString;
    v9->_previewURLString = (NSString *)v11;

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIPreviewTemplateViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *previewURLString;
  objc_super v10;

  v4 = (SUUIPreviewTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIPreviewTemplateViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_itemIdentifier = -[SUUIPreviewTemplateViewElement itemIdentifier](v4, "itemIdentifier");
    -[SUUIPreviewTemplateViewElement previewURLString](v4, "previewURLString");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    previewURLString = self->_previewURLString;
    self->_previewURLString = v7;

  }
  return v6;
}

- (SUUILockupViewElement)previewLockup
{
  return (SUUILockupViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 66);
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)previewURLString
{
  return self->_previewURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewURLString, 0);
}

@end
