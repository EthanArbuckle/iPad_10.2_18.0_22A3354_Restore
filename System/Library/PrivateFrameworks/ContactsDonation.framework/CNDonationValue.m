@implementation CNDonationValue

+ (id)donationValueWithNameComponents:(id)a3 origin:(id)a4
{
  id v5;
  id v6;
  _CNNameComponentsDonationValue *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_CNNameComponentsDonationValue initWithNameComponents:origin:]([_CNNameComponentsDonationValue alloc], "initWithNameComponents:origin:", v6, v5);

  return v7;
}

+ (id)donationValueWithEmailAddress:(id)a3 label:(id)a4 origin:(id)a5
{
  id v7;
  id v8;
  id v9;
  _CNEmailAddressDonationValue *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_CNEmailAddressDonationValue initWithEmailAddress:label:origin:]([_CNEmailAddressDonationValue alloc], "initWithEmailAddress:label:origin:", v9, v8, v7);

  return v10;
}

+ (id)donationValueWithPhoneNumber:(id)a3 label:(id)a4 origin:(id)a5
{
  id v7;
  id v8;
  id v9;
  _CNPhoneNumberDonationValue *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_CNPhoneNumberDonationValue initWithPhoneNumber:label:origin:]([_CNPhoneNumberDonationValue alloc], "initWithPhoneNumber:label:origin:", v9, v8, v7);

  return v10;
}

+ (id)donationValueWithPostalAddress:(id)a3 style:(int64_t)a4 label:(id)a5 origin:(id)a6
{
  id v9;
  id v10;
  id v11;
  _CNPostalAddressDonationValue *v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[_CNPostalAddressDonationValue initWithPostalAddress:style:label:origin:]([_CNPostalAddressDonationValue alloc], "initWithPostalAddress:style:label:origin:", v11, a4, v10, v9);

  return v12;
}

+ (id)donationValueWithImageData:(id)a3 origin:(id)a4
{
  id v5;
  id v6;
  _CNImageDataDonationValue *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_CNImageDataDonationValue initWithImageData:origin:]([_CNImageDataDonationValue alloc], "initWithImageData:origin:", v6, v5);

  return v7;
}

- (CNDonationValue)initWithOrigin:(id)a3
{
  id v4;
  CNDonationValue *v5;
  uint64_t v6;
  CNDonationOrigin *origin;
  CNDonationValue *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNDonationValue;
  v5 = -[CNDonationValue init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    origin = v5->_origin;
    v5->_origin = (CNDonationOrigin *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CNDonationValue *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (unint64_t)hash
{
  CNDonationValue *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)copyWithNewExpirationDate:(id)a3
{
  id v4;
  CNDonationValue *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (CNDonationValue)initWithCoder:(id)a3
{
  id v4;
  CNDonationValue *v5;
  void *v6;
  uint64_t v7;
  CNDonationOrigin *origin;
  CNDonationValue *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNDonationValue;
  v5 = -[CNDonationValue init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_origin"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    origin = v5->_origin;
    v5->_origin = (CNDonationOrigin *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_origin, CFSTR("_origin"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)acceptDonationValueVisitor:(id)a3
{
  id v4;
  CNDonationValue *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (CNDonationValue)initWithPropertyListRepresentation:(id)a3
{
  id v4;
  CNDonationOrigin *v5;
  void *v6;
  CNDonationOrigin *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _CNEmailAddressDonationValue *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _CNPhoneNumberDonationValue *v35;
  _CNPostalAddressDonationValue *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v63;

  v4 = a3;
  v5 = [CNDonationOrigin alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("origin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNDonationOrigin initWithPropertyListRepresentation:](v5, "initWithPropertyListRepresentation:", v6);

  if (!v7)
    goto LABEL_75;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name-components"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("email-address"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("email-address"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
      v9 = v26;

      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v28 = v27;
      else
        v28 = 0;
      v10 = v28;

      v23 = -[_CNEmailAddressDonationValue initWithEmailAddress:label:origin:]([_CNEmailAddressDonationValue alloc], "initWithEmailAddress:label:origin:", v9, v10, v7);
      goto LABEL_38;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phone-number"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phone-number"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
      v32 = v31;

      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
      v10 = v34;

      v35 = [_CNPhoneNumberDonationValue alloc];
      objc_msgSend(MEMORY[0x24BDBAD88], "phoneNumberWithStringValue:", v32);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v23 = -[_CNPhoneNumberDonationValue initWithPhoneNumber:label:origin:](v35, "initWithPhoneNumber:label:origin:", v9, v10, v7);
      goto LABEL_38;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postal-address"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v39 = v38;
      else
        v39 = 0;
      v9 = v39;

      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("donation-style"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v41 = v40;
      else
        v41 = 0;
      v10 = v41;

      v42 = objc_msgSend(v10, "isEqualToString:", CFSTR("donation-address"));
      v43 = 0;
      if ((v42 & 1) == 0)
      {
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("donation-location")))
        {
          v36 = 0;
          goto LABEL_39;
        }
        v43 = 1;
      }
      v63 = v43;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postal-address"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_alloc_init(MEMORY[0x24BDBAD78]);
      objc_opt_class();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("street"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v47 = v46;
      else
        v47 = 0;
      objc_msgSend(v45, "setStreet:", v47);

      objc_opt_class();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("subLocality"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v49 = v48;
      else
        v49 = 0;
      objc_msgSend(v45, "setSubLocality:", v49);

      objc_opt_class();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("city"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v51 = v50;
      else
        v51 = 0;
      objc_msgSend(v45, "setCity:", v51);

      objc_opt_class();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("subAdministrativeArea"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v53 = v52;
      else
        v53 = 0;
      objc_msgSend(v45, "setSubAdministrativeArea:", v53);

      objc_opt_class();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("state"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v55 = v54;
      else
        v55 = 0;
      objc_msgSend(v45, "setState:", v55);

      objc_opt_class();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("postalCode"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v57 = v56;
      else
        v57 = 0;
      objc_msgSend(v45, "setPostalCode:", v57);

      objc_opt_class();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("country"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v59 = v58;
      else
        v59 = 0;
      objc_msgSend(v45, "setCountry:", v59);

      objc_opt_class();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("isoCountryCode"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v61 = v60;
      else
        v61 = 0;
      objc_msgSend(v45, "setISOCountryCode:", v61);

      v36 = -[_CNPostalAddressDonationValue initWithPostalAddress:style:label:origin:]([_CNPostalAddressDonationValue alloc], "initWithPostalAddress:style:label:origin:", v45, v63, v9, v7);
      goto LABEL_39;
    }
LABEL_75:
    v36 = 0;
    goto LABEL_76;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name-components"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BDD1730]);
  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("namePrefix"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  objc_msgSend(v10, "setNamePrefix:", v12);

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("givenName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  objc_msgSend(v10, "setGivenName:", v14);

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("middleName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  objc_msgSend(v10, "setMiddleName:", v16);

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("familyName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  objc_msgSend(v10, "setFamilyName:", v18);

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("nameSuffix"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  objc_msgSend(v10, "setNameSuffix:", v20);

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("nickname"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  objc_msgSend(v10, "setNickname:", v22);

  v23 = -[_CNNameComponentsDonationValue initWithNameComponents:origin:]([_CNNameComponentsDonationValue alloc], "initWithNameComponents:origin:", v10, v7);
LABEL_38:
  v36 = (_CNPostalAddressDonationValue *)v23;
LABEL_39:

LABEL_76:
  return &v36->super;
}

- (id)propertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24C23B960, CFSTR("version"));
  -[CNDonationValue origin](self, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyListRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("origin"));

  -[CNDonationValue updatePropertyListRepresentation:](self, "updatePropertyListRepresentation:", v3);
  return v3;
}

- (CNDonationOrigin)origin
{
  return self->_origin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
}

@end
