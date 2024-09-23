@implementation SUUIDividerViewElement

- (SUUIDividerViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIDividerViewElement *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIDividerViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    +[IKTextParser textWithDOMElement:usingParseBlock:](SUUIViewElementText, "textWithDOMElement:usingParseBlock:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
      objc_storeStrong((id *)&v9->_text, v10);

  }
  return v9;
}

- (BOOL)isEnabled
{
  return self->_button != 0;
}

- (int64_t)pageComponentType
{
  return 4;
}

- (SUUIButtonViewElement)button
{
  return (SUUIButtonViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 12);
}

- (int64_t)dividerType
{
  void *v3;
  void *v4;
  int64_t v5;

  if (!self->_dividerTypeWasInitialized)
  {
    -[SUUIDividerViewElement style](self, "style");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dividerType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if ((objc_msgSend(CFSTR("full"), "isEqualToString:", v4) & 1) != 0)
      {
        v5 = 1;
LABEL_10:
        self->_dividerType = v5;
        self->_dividerTypeWasInitialized = 1;

        return self->_dividerType;
      }
      if ((objc_msgSend(CFSTR("inset"), "isEqualToString:", v4) & 1) != 0)
      {
        v5 = 2;
        goto LABEL_10;
      }
      if ((objc_msgSend(CFSTR("borderless"), "isEqualToString:", v4) & 1) != 0)
      {
        v5 = 3;
        goto LABEL_10;
      }
    }
    v5 = 0;
    goto LABEL_10;
  }
  return self->_dividerType;
}

- (SUUIViewElementText)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
