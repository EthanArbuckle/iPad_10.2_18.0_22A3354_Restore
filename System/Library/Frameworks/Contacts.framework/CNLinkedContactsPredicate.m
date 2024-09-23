@implementation CNLinkedContactsPredicate

- (CNLinkedContactsPredicate)initWithContact:(id)a3
{
  id v4;
  CNLinkedContactsPredicate *v5;
  uint64_t v6;
  CNContact *contact;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNLinkedContactsPredicate;
  v5 = -[CNPredicate init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;

  }
  return v5;
}

- (CNLinkedContactsPredicate)initWithContactIdentifier:(id)a3
{
  id v4;
  CNLinkedContactsPredicate *v5;
  uint64_t v6;
  NSString *contactIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNLinkedContactsPredicate;
  v5 = -[CNPredicate init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNLinkedContactsPredicate)initWithCoder:(id)a3
{
  id v4;
  CNLinkedContactsPredicate *v5;
  void *v6;
  uint64_t v7;
  CNContact *contact;
  void *v9;
  uint64_t v10;
  NSString *contactIdentifier;
  CNLinkedContactsPredicate *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNLinkedContactsPredicate;
  v5 = -[CNPredicate initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contact"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    contact = v5->_contact;
    v5->_contact = (CNContact *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contactIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNLinkedContactsPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("_contactIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contact, CFSTR("_contact"));

}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsLinkedToContact:]"));
  -[CNLinkedContactsPredicate contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contact"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
