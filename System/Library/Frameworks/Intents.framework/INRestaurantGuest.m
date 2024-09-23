@implementation INRestaurantGuest

- (INRestaurantGuest)initWithNameComponents:(NSPersonNameComponents *)nameComponents phoneNumber:(NSString *)phoneNumber emailAddress:(NSString *)emailAddress
{
  NSString *v8;
  NSString *v9;
  NSPersonNameComponents *v10;
  INPersonHandle *v11;
  INRestaurantGuest *v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  NSString *v16;
  char v18;
  char v19;
  objc_super v20;

  v8 = phoneNumber;
  v9 = emailAddress;
  v10 = nameComponents;
  v11 = -[INPersonHandle initWithValue:type:]([INPersonHandle alloc], "initWithValue:type:", &stru_1E2295770, 0);
  v20.receiver = self;
  v20.super_class = (Class)INRestaurantGuest;
  v19 = 0;
  v18 = 0;
  v12 = -[INPerson _initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:relationship:aliases:suggestionType:isMe:scoredAlternatives:sourceAppBundleIdentifier:phonemeData:isContactSuggestion:searchProvider:](&v20, sel__initWithUserInput_personHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_relationship_aliases_suggestionType_isMe_scoredAlternatives_sourceAppBundleIdentifier_phonemeData_isContactSuggestion_searchProvider_, 0, v11, v10, 0, 0, 0, 0, 0, 0, 0, v18, 0, 0, 0, v19, 0);

  if (v12)
  {
    v13 = -[NSString copy](v8, "copy");
    v14 = v12->_phoneNumber;
    v12->_phoneNumber = (NSString *)v13;

    v15 = -[NSString copy](v9, "copy");
    v16 = v12->_emailAddress;
    v12->_emailAddress = (NSString *)v15;

  }
  return v12;
}

- (INRestaurantGuest)initWithCoder:(id)a3
{
  id v4;
  INRestaurantGuest *v5;
  uint64_t v6;
  NSString *phoneNumber;
  uint64_t v8;
  NSString *emailAddress;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INRestaurantGuest;
  v5 = -[INPerson initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emailAddress"));
    v8 = objc_claimAutoreleasedReturnValue();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INRestaurantGuest;
  v4 = a3;
  -[INPerson encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phoneNumber"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_emailAddress, CFSTR("emailAddress"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INRestaurantGuest;
  v4 = -[INPerson copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[INRestaurantGuest phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhoneNumber:", v5);

  -[INRestaurantGuest emailAddress](self, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEmailAddress:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  INRestaurantGuest *v5;
  INRestaurantGuest *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  objc_super v17;

  v5 = (INRestaurantGuest *)a3;
  if (v5 == self)
  {
    v11 = 1;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_21;
  }
  v6 = v5;
  -[INRestaurantGuest phoneNumber](v6, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[INRestaurantGuest phoneNumber](self, "phoneNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v10 = 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  -[INRestaurantGuest phoneNumber](v6, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurantGuest phoneNumber](self, "phoneNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v7)
    goto LABEL_10;
LABEL_11:

  -[INRestaurantGuest emailAddress](v6, "emailAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[INRestaurantGuest emailAddress](self, "emailAddress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v15 = 1;
LABEL_16:

      goto LABEL_17;
    }
  }
  -[INRestaurantGuest emailAddress](v6, "emailAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurantGuest emailAddress](self, "emailAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (!v12)
    goto LABEL_16;
LABEL_17:

  if ((v10 & v15) == 1)
  {
    v17.receiver = self;
    v17.super_class = (Class)INRestaurantGuest;
    v11 = -[INPerson isEqual:](&v17, sel_isEqual_, v6);
  }
  else
  {
    v11 = 0;
  }

LABEL_21:
  return v11;
}

- (INRestaurantGuest)initWithPersonHandle:(id)a3 nameComponents:(id)a4 displayName:(id)a5 image:(id)a6 contactIdentifier:(id)a7 customIdentifier:(id)a8 isMe:(BOOL)a9
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  INRestaurantGuest *v16;

  v11 = a3;
  v12 = a4;
  v13 = objc_msgSend(v11, "type");
  if (v13 == 2)
  {
    objc_msgSend(v11, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(v11, "type") == 1)
  {
    objc_msgSend(v11, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[INRestaurantGuest initWithNameComponents:phoneNumber:emailAddress:](self, "initWithNameComponents:phoneNumber:emailAddress:", v12, v14, v15);

  }
  else
  {
    v16 = -[INRestaurantGuest initWithNameComponents:phoneNumber:emailAddress:](self, "initWithNameComponents:phoneNumber:emailAddress:", v12, v14, 0);
  }
  if (v13 == 2)

  return v16;
}

- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 customIdentifier:(id)a9 relationship:(id)a10 aliases:(id)a11 suggestionType:(int64_t)a12 isMe:(BOOL)a13 scoredAlternatives:(id)a14 sourceAppBundleIdentifier:(id)a15 phonemeData:(id)a16
{
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  INRestaurantGuest *v23;

  v18 = a4;
  v19 = a5;
  v20 = objc_msgSend(v18, "type");
  if (v20 == 2)
  {
    objc_msgSend(v18, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  if (objc_msgSend(v18, "type") == 1)
  {
    objc_msgSend(v18, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[INRestaurantGuest initWithNameComponents:phoneNumber:emailAddress:](self, "initWithNameComponents:phoneNumber:emailAddress:", v19, v21, v22);

  }
  else
  {
    v23 = -[INRestaurantGuest initWithNameComponents:phoneNumber:emailAddress:](self, "initWithNameComponents:phoneNumber:emailAddress:", v19, v21, 0);
  }
  if (v20 == 2)

  return v23;
}

- (id)_dictionaryRepresentation
{
  NSString *phoneNumber;
  void *v4;
  NSString *emailAddress;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("phoneNumber");
  phoneNumber = self->_phoneNumber;
  v4 = phoneNumber;
  if (!phoneNumber)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("emailAddress");
  v10[0] = v4;
  emailAddress = self->_emailAddress;
  v6 = emailAddress;
  if (!emailAddress)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!emailAddress)
  {

    if (phoneNumber)
      return v7;
LABEL_9:

    return v7;
  }
  if (!phoneNumber)
    goto LABEL_9;
  return v7;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(NSString *)phoneNumber
{
  objc_setProperty_nonatomic_copy(self, a2, phoneNumber, 136);
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(NSString *)emailAddress
{
  objc_setProperty_nonatomic_copy(self, a2, emailAddress, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
