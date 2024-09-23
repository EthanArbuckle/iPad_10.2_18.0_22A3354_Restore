@implementation SUUIItemViewElement

- (SUUIItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SUUIItemViewElement *v11;
  uint64_t v12;
  uint64_t v13;
  __objc2_class *v14;
  uint64_t v15;
  SUUIViewElementText *itemText;
  void *v17;
  SUUIItemViewElement *v18;
  void *v19;
  SUUIItemViewElement *v20;
  void *v22;
  char isKindOfClass;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SUUIItemViewElement;
  v11 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v24, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (!v11)
    goto LABEL_7;
  v12 = objc_opt_class();
  if (v12 == objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v9, "parent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {

      }
      else
      {
        objc_msgSend(v9, "parent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          goto LABEL_3;
      }
    }
    v14 = SUUIBrowseItemViewElement;
    goto LABEL_13;
  }
LABEL_3:
  v13 = objc_opt_class();
  if (v13 == objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = SUUIStackItemViewElement;
LABEL_13:
      v18 = (SUUIItemViewElement *)objc_msgSend([v14 alloc], "initWithDOMElement:parent:elementFactory:", v8, v9, v10);
      goto LABEL_14;
    }
  }
  +[IKTextParser textWithDOMElement:usingParseBlock:](SUUIViewElementText, "textWithDOMElement:usingParseBlock:", v8, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  itemText = v11->_itemText;
  v11->_itemText = (SUUIViewElementText *)v15;

  objc_msgSend(v8, "getAttribute:", CFSTR("selected"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v11->_selected = objc_msgSend(v17, "BOOLValue");

LABEL_7:
  v18 = v11;
LABEL_14:
  v20 = v18;

  return v20;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIItemViewElement *v4;
  void *v5;
  void *v6;
  SUUIViewElementText *v7;
  SUUIViewElementText *itemText;
  objc_super v10;

  v4 = (SUUIItemViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIItemViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SUUIItemViewElement itemText](v4, "itemText");
    v7 = (SUUIViewElementText *)objc_claimAutoreleasedReturnValue();
    itemText = self->_itemText;
    self->_itemText = v7;

    self->_selected = -[SUUIItemViewElement isSelected](v4, "isSelected");
  }

  return v6;
}

- (SUUIViewElementText)itemText
{
  return self->_itemText;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemText, 0);
}

@end
