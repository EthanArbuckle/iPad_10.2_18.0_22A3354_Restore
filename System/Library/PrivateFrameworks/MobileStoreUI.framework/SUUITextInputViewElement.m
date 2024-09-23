@implementation SUUITextInputViewElement

- (SUUITextInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUITextInputViewElement *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUITextInputViewElement;
  v9 = -[SUUIInputViewElement initWithDOMElement:parent:elementFactory:](&v18, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (!v9)
    goto LABEL_17;
  objc_msgSend(v8, "getAttribute:", CFSTR("type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("email")))
  {
    v11 = 7;
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("number")))
    {
      v9->_keyboardType = 0;
      goto LABEL_8;
    }
    v11 = 4;
  }
  v9->_keyboardType = v11;
LABEL_8:
  objc_msgSend(v8, "getAttribute:", CFSTR("maxlength"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v9->_maximumLength = objc_msgSend(v12, "integerValue");
  objc_msgSend(v8, "getAttribute:", CFSTR("secure"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v9->_secure = objc_msgSend(v14, "BOOLValue");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("password")))
  {
    v9->_secure = 1;
  }
  objc_msgSend(v8, "getAttribute:", CFSTR("placeholdertext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_storeStrong((id *)&v9->_placeholderText, v16);

LABEL_17:
  return v9;
}

+ (BOOL)isTextInputType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("number")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("email")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("password")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("text"));
  }

  return v4;
}

- (SUUIAnimatorDOMFeature)animationInterface
{
  return (SUUIAnimatorDOMFeature *)-[SUUIViewElement featureWithName:](self, "featureWithName:", 0x25120FC68);
}

+ (id)supportedFeatures
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0x25120FC68;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUITextInputViewElement *v4;
  SUUITextInputViewElement *v5;
  SUUITextInputViewElement *v6;
  objc_super v8;

  v4 = (SUUITextInputViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUITextInputViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUITextInputViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_keyboardType = -[SUUITextInputViewElement keyboardType](v4, "keyboardType");
    self->_maximumLength = -[SUUITextInputViewElement maximumLength](v4, "maximumLength");
  }

  return v6;
}

- (unint64_t)elementType
{
  return 140;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (int64_t)maximumLength
{
  return self->_maximumLength;
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderText, 0);
}

@end
