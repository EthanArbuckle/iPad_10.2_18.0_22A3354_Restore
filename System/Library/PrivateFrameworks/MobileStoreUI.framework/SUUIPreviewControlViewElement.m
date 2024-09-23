@implementation SUUIPreviewControlViewElement

- (SUUIPreviewControlViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIPreviewControlViewElement *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  NSString *mediaURLString;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUIPreviewControlViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v11 = objc_msgSend(v10, "BOOLValue") ^ 1;
    else
      v11 = -1;
    v9->_enabled = v11;
    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      v9->_itemIdentifier = objc_msgSend(v12, "longLongValue");
    objc_msgSend(v8, "getAttribute:", CFSTR("preview-url"));
    v13 = objc_claimAutoreleasedReturnValue();
    mediaURLString = v9->_mediaURLString;
    v9->_mediaURLString = (NSString *)v13;

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIPreviewControlViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *mediaURLString;
  objc_super v10;

  v4 = (SUUIPreviewControlViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIPreviewControlViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_enabled = v4->_enabled;
    self->_itemIdentifier = -[SUUIPreviewControlViewElement itemIdentifier](v4, "itemIdentifier");
    -[SUUIPreviewControlViewElement mediaURLString](v4, "mediaURLString");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    mediaURLString = self->_mediaURLString;
    self->_mediaURLString = v7;

  }
  return v6;
}

- (BOOL)isEnabled
{
  int enabled;
  objc_super v4;

  enabled = self->_enabled;
  if (enabled != 255)
    return enabled != 0;
  v4.receiver = self;
  v4.super_class = (Class)SUUIPreviewControlViewElement;
  return -[SUUIViewElement isEnabled](&v4, sel_isEnabled);
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)mediaURLString
{
  return self->_mediaURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaURLString, 0);
}

@end
