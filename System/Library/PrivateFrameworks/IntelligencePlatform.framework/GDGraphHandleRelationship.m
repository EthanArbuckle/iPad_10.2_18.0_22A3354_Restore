@implementation GDGraphHandleRelationship

- (GDGraphHandleRelationship)initWithLabelField:(id)a3 emailAddressesField:(id)a4 phoneNumbersField:(id)a5 allLabelField:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  GDGraphHandleRelationship *v15;
  GDGraphHandleRelationship *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GDGraphHandleRelationship;
  v15 = -[GDGraphHandleRelationship init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_label, a3);
    objc_storeStrong((id *)&v16->_emailAddresses, a4);
    objc_storeStrong((id *)&v16->_phoneNumbers, a5);
    objc_storeStrong((id *)&v16->_allLabel, a6);
  }

  return v16;
}

- (NSString)label
{
  return self->_label;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)allLabel
{
  return self->_allLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
