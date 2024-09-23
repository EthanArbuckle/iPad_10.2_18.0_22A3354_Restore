@implementation SUUIStarRatingViewElement

- (SUUIStarRatingViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIStarRatingViewElement *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  objc_super v22;

  v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUUIStarRatingViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v22, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (!v9)
    goto LABEL_20;
  objc_msgSend(v8, "getAttribute:", CFSTR("value"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    *(float *)&v12 = v12 / 5.0;
    v9->_ratingValue = *(float *)&v12;
  }
  objc_msgSend(v8, "getAttribute:", CFSTR("type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_8;
  if ((objc_msgSend(CFSTR("large"), "isEqualToString:", v13) & 1) != 0)
  {
    v14 = 2;
LABEL_9:
    v9->_starType = v14;
    goto LABEL_10;
  }
  if (objc_msgSend(CFSTR("large"), "isEqualToString:", v13))
  {
LABEL_8:
    v14 = 1;
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if ((objc_msgSend(CFSTR("yes"), "isEqualToString:", v15) & 1) != 0)
      LOBYTE(v16) = 0;
    else
      v16 = objc_msgSend(CFSTR("true"), "isEqualToString:", v15) ^ 1;
    v9->_enabled = v16;
  }
  -[SUUIViewElement firstChildForElementType:](v9, "firstChildForElementType:", 138);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[IKTextParser textWithDOMElement:usingParseBlock:](SUUIViewElementText, "textWithDOMElement:usingParseBlock:", v8, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
      objc_storeStrong((id *)&v9->_text, v18);

  }
LABEL_20:

  return v9;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (SUUIViewElementText)text
{
  SUUIViewElementText *text;
  SUUIViewElementText *v3;
  void *v4;

  text = self->_text;
  if (text)
  {
    v3 = text;
  }
  else
  {
    -[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 138);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v3 = (SUUIViewElementText *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIStarRatingViewElement *v4;
  void *v5;
  void *v6;
  float v7;
  objc_super v9;

  v4 = (SUUIStarRatingViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIStarRatingViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v9, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SUUIStarRatingViewElement ratingValue](v4, "ratingValue");
    self->_ratingValue = v7;
    objc_storeStrong((id *)&self->_text, v4->_text);
  }

  return v6;
}

- (int64_t)starType
{
  return self->_starType;
}

- (float)ratingValue
{
  return self->_ratingValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
