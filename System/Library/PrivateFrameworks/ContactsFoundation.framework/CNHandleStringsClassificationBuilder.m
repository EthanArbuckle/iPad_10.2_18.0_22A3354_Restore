@implementation CNHandleStringsClassificationBuilder

- (CNHandleStringsClassificationBuilder)init
{
  CNHandleStringsClassificationBuilder *v2;
  NSMutableArray *v3;
  NSMutableArray *emailAddresses;
  NSMutableArray *v5;
  NSMutableArray *phoneNumbers;
  NSMutableArray *v7;
  NSMutableArray *unknown;
  CNHandleStringsClassificationBuilder *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNHandleStringsClassificationBuilder;
  v2 = -[CNHandleStringsClassificationBuilder init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    emailAddresses = v2->_emailAddresses;
    v2->_emailAddresses = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    phoneNumbers = v2->_phoneNumbers;
    v2->_phoneNumbers = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    unknown = v2->_unknown;
    v2->_unknown = v7;

    v9 = v2;
  }

  return v2;
}

- (id)build
{
  return -[CNHandleStringClassification initWithBuilder:]([CNHandleStringClassification alloc], "initWithBuilder:", self);
}

- (NSMutableArray)unknown
{
  return self->_unknown;
}

- (NSMutableArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSMutableArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)addPhoneNumber:(id)a3
{
  -[NSMutableArray addObject:](self->_phoneNumbers, "addObject:", a3);
}

- (void)addEmailAddress:(id)a3
{
  -[NSMutableArray addObject:](self->_emailAddresses, "addObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknown, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

- (void)addUnknown:(id)a3
{
  -[NSMutableArray addObject:](self->_unknown, "addObject:", a3);
}

- (void)setEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddresses, a3);
}

- (void)setPhoneNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumbers, a3);
}

- (void)setUnknown:(id)a3
{
  objc_storeStrong((id *)&self->_unknown, a3);
}

@end
