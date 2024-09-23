@implementation SUUIImageDeckViewElement

- (SUUIImageDeckViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIImageDeckViewElement *v9;
  SUUIImageDeckViewElement *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  objc_super v20;

  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SUUIImageDeckViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v20, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    v9->_initialDragLeft = 0.25;
    v9->_initialDragRight = 0.25;
    v9->_additionalDragLeft = 0.33;
    v9->_additionalDragRight = 0.33;
    objc_msgSend(v8, "getAttribute:", CFSTR("initialDragLeft"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("initialDragRight"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("additionalDragLeft"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("additionalDragRight"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && objc_msgSend(v11, "length"))
    {
      objc_msgSend(v11, "floatValue");
      v10->_initialDragLeft = v15;
    }
    if (v12 && objc_msgSend(v12, "length"))
    {
      objc_msgSend(v12, "floatValue");
      v10->_initialDragRight = v16;
    }
    if (v13 && objc_msgSend(v13, "length"))
    {
      objc_msgSend(v13, "floatValue");
      v10->_additionalDragLeft = v17;
    }
    if (v14 && objc_msgSend(v14, "length"))
    {
      objc_msgSend(v14, "floatValue");
      v10->_additionalDragRight = v18;
    }

  }
  return v10;
}

- (double)initialDragLeft
{
  return self->_initialDragLeft;
}

- (double)initialDragRight
{
  return self->_initialDragRight;
}

- (double)additionalDragLeft
{
  return self->_additionalDragLeft;
}

- (double)additionalDragRight
{
  return self->_additionalDragRight;
}

@end
