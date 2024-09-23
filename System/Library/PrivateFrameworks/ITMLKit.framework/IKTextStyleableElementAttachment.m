@implementation IKTextStyleableElementAttachment

- (IKTextStyleableElementAttachment)initWithTextElement:(id)a3
{
  id v4;
  IKTextStyleableElementAttachment *v5;
  IKTextStyleableElementAttachment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKTextStyleableElementAttachment;
  v5 = -[IKTextStyleableElementAttachment init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_textElement, v4);

  return v6;
}

- (IKTextElement)textElement
{
  return (IKTextElement *)objc_loadWeakRetained((id *)&self->_textElement);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textElement);
}

@end
