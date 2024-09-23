@implementation _HKClinicalContact(HDCodingSupport)

- (HDCodableClinicalContact)codableRepresentationForSync
{
  HDCodableClinicalContact *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init(HDCodableClinicalContact);
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableClinicalContact setName:](v2, "setName:", v3);

  objc_msgSend(a1, "nameContactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableClinicalContact setNameContactIdentifier:](v2, "setNameContactIdentifier:", v4);

  objc_msgSend(a1, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableClinicalContact setPhoneNumber:](v2, "setPhoneNumber:", v5);

  objc_msgSend(a1, "phoneNumberContactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableClinicalContact setPhoneNumberContactIdentifier:](v2, "setPhoneNumberContactIdentifier:", v6);

  objc_msgSend(a1, "phoneNumberLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableClinicalContact setPhoneNumberLabel:](v2, "setPhoneNumberLabel:", v7);

  objc_msgSend(a1, "relationship");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableClinicalContact setRelationship:](v2, "setRelationship:", v8);

  return v2;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB6F28];
    v5 = v3;
    v6 = objc_alloc_init(v4);
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v7);

    objc_msgSend(v5, "nameContactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNameContactIdentifier:", v8);

    objc_msgSend(v5, "phoneNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPhoneNumber:", v9);

    objc_msgSend(v5, "phoneNumberContactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPhoneNumberContactIdentifier:", v10);

    objc_msgSend(v5, "phoneNumberLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPhoneNumberLabel:", v11);

    objc_msgSend(v5, "relationship");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setRelationship:", v12);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
