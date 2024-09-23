@implementation SGPostalAddressExtraction

- (SGPostalAddressExtraction)initWithPlainText:(id)a3 components:(id)a4
{
  id v7;
  id v8;
  SGPostalAddressExtraction *v9;
  SGPostalAddressExtraction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGPostalAddressExtraction;
  v9 = -[SGPostalAddressExtraction init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_plainText, a3);
    objc_storeStrong((id *)&v10->_components, a4);
  }

  return v10;
}

- (BOOL)hasExtraction
{
  return self->_plainText || self->_components != 0;
}

- (NSString)plainText
{
  return self->_plainText;
}

- (SGPostalAddressComponents)components
{
  return self->_components;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_plainText, 0);
}

@end
