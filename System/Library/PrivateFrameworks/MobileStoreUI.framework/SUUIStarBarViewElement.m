@implementation SUUIStarBarViewElement

- (SUUIStarBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIStarBarViewElement *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIStarBarViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numberOfRatings = objc_msgSend(v10, "integerValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("numStars"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numberOfStars = objc_msgSend(v11, "integerValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v9->_value = v13;

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIStarBarViewElement *v4;
  void *v5;
  void *v6;
  float v7;
  objc_super v9;

  v4 = (SUUIStarBarViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIStarBarViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v9, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_numberOfRatings = -[SUUIStarBarViewElement numberOfRatings](v4, "numberOfRatings");
    self->_numberOfStars = -[SUUIStarBarViewElement numberOfStars](v4, "numberOfStars");
    -[SUUIStarBarViewElement value](v4, "value");
    self->_value = v7;
  }

  return v6;
}

- (int64_t)numberOfRatings
{
  return self->_numberOfRatings;
}

- (int64_t)numberOfStars
{
  return self->_numberOfStars;
}

- (float)value
{
  return self->_value;
}

@end
