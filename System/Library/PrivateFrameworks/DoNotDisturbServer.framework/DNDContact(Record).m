@implementation DNDContact(Record)

+ (id)contactForRecord:()Record
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (objc_class *)MEMORY[0x1E0D1D6E8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithContactIdentifier:", v6);

  objc_msgSend(v4, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFirstName:", v8);

  objc_msgSend(v4, "middleName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMiddleName:", v9);

  objc_msgSend(v4, "lastName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLastName:", v10);

  objc_msgSend(v4, "nickName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNickName:", v11);

  objc_msgSend(v4, "organizationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOrganizationName:", v12);

  objc_msgSend(v4, "phoneNumbers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPhoneNumbers:", v13);

  objc_msgSend(v4, "emailAddresses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setEmailAddresses:", v14);
  return v7;
}

- (DNDSMutableContactRecord)makeRecord
{
  DNDSMutableContactRecord *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(DNDSMutableContactRecord);
  objc_msgSend(a1, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableContactRecord setContactIdentifier:](v2, "setContactIdentifier:", v3);

  objc_msgSend(a1, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableContactRecord setFirstName:](v2, "setFirstName:", v4);

  objc_msgSend(a1, "middleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableContactRecord setMiddleName:](v2, "setMiddleName:", v5);

  objc_msgSend(a1, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableContactRecord setLastName:](v2, "setLastName:", v6);

  objc_msgSend(a1, "nickName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableContactRecord setNickName:](v2, "setNickName:", v7);

  objc_msgSend(a1, "organizationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableContactRecord setOrganizationName:](v2, "setOrganizationName:", v8);

  objc_msgSend(a1, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableContactRecord setPhoneNumbers:](v2, "setPhoneNumbers:", v9);

  objc_msgSend(a1, "emailAddresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableContactRecord setEmailAddresses:](v2, "setEmailAddresses:", v10);

  return v2;
}

@end
