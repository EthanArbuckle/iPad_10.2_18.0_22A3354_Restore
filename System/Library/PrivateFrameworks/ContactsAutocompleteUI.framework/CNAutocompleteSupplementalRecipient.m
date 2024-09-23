@implementation CNAutocompleteSupplementalRecipient

- (CNAutocompleteSupplementalRecipient)initWithNameComponents:(id)a3 address:(id)a4 addressType:(int64_t)a5
{
  id v8;
  id v9;
  CNAutocompleteSupplementalRecipient *v10;
  uint64_t v11;
  NSPersonNameComponents *nameComponents;
  uint64_t v13;
  NSString *address;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNAutocompleteSupplementalRecipient;
  v10 = -[CNAutocompleteSupplementalRecipient init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    nameComponents = v10->_nameComponents;
    v10->_nameComponents = (NSPersonNameComponents *)v11;

    v13 = objc_msgSend(v9, "copy");
    address = v10->_address;
    v10->_address = (NSString *)v13;

    v10->_addressType = a5;
  }

  return v10;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)addressType
{
  return self->_addressType;
}

- (NSPersonNameComponents)nameComponents
{
  return (NSPersonNameComponents *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
