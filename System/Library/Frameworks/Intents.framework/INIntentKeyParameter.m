@implementation INIntentKeyParameter

- (INIntentKeyParameter)initWithCodableAttribute:(id)a3 value:(id)a4 image:(id)a5
{
  id v9;
  id v10;
  id v11;
  INIntentKeyParameter *v12;
  INIntentKeyParameter *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)INIntentKeyParameter;
  v12 = -[INIntentKeyParameter init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_codableAttribute, a3);
    objc_storeStrong(&v13->_value, a4);
    objc_storeStrong((id *)&v13->_image, a5);
  }

  return v13;
}

- (INCodableAttribute)codableAttribute
{
  return self->_codableAttribute;
}

- (id)value
{
  return self->_value;
}

- (INImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_codableAttribute, 0);
}

@end
