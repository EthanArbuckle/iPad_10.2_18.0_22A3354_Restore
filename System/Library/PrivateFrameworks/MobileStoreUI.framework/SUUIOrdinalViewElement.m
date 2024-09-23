@implementation SUUIOrdinalViewElement

- (SUUIOrdinalViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIOrdinalViewElement *v9;
  uint64_t v10;
  SUUIViewElementText *text;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIOrdinalViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v13, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    +[IKTextParser textWithDOMElement:usingParseBlock:](SUUIViewElementText, "textWithDOMElement:usingParseBlock:", v8, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    text = v9->_text;
    v9->_text = (SUUIViewElementText *)v10;

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIOrdinalViewElement *v4;
  void *v5;
  void *v6;
  SUUIViewElementText *v7;
  SUUIViewElementText *text;
  objc_super v10;

  v4 = (SUUIOrdinalViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIOrdinalViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SUUIOrdinalViewElement text](v4, "text");
    v7 = (SUUIViewElementText *)objc_claimAutoreleasedReturnValue();
    text = self->_text;
    self->_text = v7;

  }
  return v6;
}

- (SUUIViewElementText)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
