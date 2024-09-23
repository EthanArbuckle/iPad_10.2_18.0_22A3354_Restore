@implementation SUUIInputViewElement

- (SUUIInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  SUUIInputViewElement *v12;
  void *v13;
  __objc2_class *v14;
  objc_super v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("checkbox")))
    {
      v14 = SUUICheckboxInputViewElement;
    }
    else if (+[SUUITextInputViewElement isTextInputType:](SUUITextInputViewElement, "isTextInputType:", v13))
    {
      v14 = SUUITextInputViewElement;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("search")))
    {
      v14 = SUUISearchBarViewElement;
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("submit")))
      {
        v16.receiver = self;
        v16.super_class = (Class)SUUIInputViewElement;
        v12 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
        goto LABEL_12;
      }
      v14 = SUUISubmitInputViewElement;
    }
    v12 = (SUUIInputViewElement *)objc_msgSend([v14 alloc], "initWithDOMElement:parent:elementFactory:", v8, v9, v10);

LABEL_12:
    goto LABEL_13;
  }
  v17.receiver = self;
  v17.super_class = (Class)SUUIInputViewElement;
  v12 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v17, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
LABEL_13:

  return v12;
}

@end
