@implementation CNInstantMessageAddressContactPredicate

- (CNInstantMessageAddressContactPredicate)initWithInstantMessageAddress:(id)a3
{
  id v4;
  CNInstantMessageAddressContactPredicate *v5;
  uint64_t v6;
  CNInstantMessageAddress *imAddress;
  CNInstantMessageAddressContactPredicate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNInstantMessageAddressContactPredicate;
  v5 = -[CNPredicate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    imAddress = v5->_imAddress;
    v5->_imAddress = (CNInstantMessageAddress *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingInstantMessageAddress:]"));
  -[CNInstantMessageAddressContactPredicate imAddress](self, "imAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("instantMessageAddress"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNInstantMessageAddressContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNInstantMessageAddressContactPredicate *v5;
  void *v6;
  uint64_t v7;
  CNInstantMessageAddress *imAddress;
  CNInstantMessageAddressContactPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNInstantMessageAddressContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imAddress"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    imAddress = v5->_imAddress;
    v5->_imAddress = (CNInstantMessageAddress *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNInstantMessageAddressContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_imAddress, CFSTR("_imAddress"), v5.receiver, v5.super_class);

}

- (CNInstantMessageAddress)imAddress
{
  return self->_imAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imAddress, 0);
}

@end
