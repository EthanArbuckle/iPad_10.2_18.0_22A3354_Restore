@implementation INPerson

- (NSString)firstName
{
  void *v2;
  void *v3;

  -[INPerson nameComponents](self, "nameComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)lastName
{
  void *v2;
  void *v3;

  -[INPerson nameComponents](self, "nameComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)userName
{
  void *v2;
  void *v3;

  -[INPerson personHandle](self, "personHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)userIdentifier
{
  void *v2;
  void *v3;

  -[INPerson personHandle](self, "personHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)userURIString
{
  void *v2;
  void *v3;

  -[INPerson personHandle](self, "personHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_intents_cacheableObjects
{
  void *v2;
  void *v3;

  -[INPerson image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[INPerson image](self, "image");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[INPerson image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cacheableObjectForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[INPerson image](self, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cacheableObjectForIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[INPerson image](self, "image");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_imageSize");
        objc_msgSend(v12, "_setImageSize:");

      }
    }
  }

}

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  v5 = a3;
  -[INPerson personHandle](self, "personHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 != 2)
    goto LABEL_12;
  -[INPerson displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPerson personHandle](self, "personHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 2048, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "numberOfMatchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));

    if (v13 != 1)
    {

LABEL_12:
      -[INPerson displayName](self, "displayName");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  objc_msgSend(v5, "locale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "regionCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lowercaseString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v16 = (void *)CPPhoneNumberCopyNetworkCountryCode();
    if (!v16)
      v16 = (void *)CPPhoneNumberCopyHomeCountryCode();
  }
  -[INPerson personHandle](self, "personHandle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v18 = (void *)PNCreateFormattedStringWithCountry();

  if (objc_msgSend(v18, "length"))
  {
    v19 = v18;
  }
  else
  {
    -[INPerson personHandle](self, "personHandle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "value");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v19;
}

- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier isMe:(BOOL)isMe
{
  INPersonHandle *v15;
  NSPersonNameComponents *v16;
  NSString *v17;
  INImage *v18;
  NSString *v19;
  NSString *v20;
  INPerson *v21;
  uint64_t v22;
  INPersonHandle *v23;
  uint64_t v24;
  NSPersonNameComponents *v25;
  uint64_t v26;
  NSString *v27;
  uint64_t v28;
  INImage *v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  NSString *v33;
  objc_super v35;

  v15 = personHandle;
  v16 = nameComponents;
  v17 = displayName;
  v18 = image;
  v19 = contactIdentifier;
  v20 = customIdentifier;
  v35.receiver = self;
  v35.super_class = (Class)INPerson;
  v21 = -[INPerson init](&v35, sel_init);
  if (v21)
  {
    v22 = -[INPersonHandle copy](v15, "copy");
    v23 = v21->_personHandle;
    v21->_personHandle = (INPersonHandle *)v22;

    v24 = -[NSPersonNameComponents copy](v16, "copy");
    v25 = v21->_nameComponents;
    v21->_nameComponents = (NSPersonNameComponents *)v24;

    v26 = -[NSString copy](v17, "copy");
    v27 = v21->_displayName;
    v21->_displayName = (NSString *)v26;

    v28 = -[INImage copy](v18, "copy");
    v29 = v21->_image;
    v21->_image = (INImage *)v28;

    v30 = -[NSString copy](v19, "copy");
    v31 = v21->_contactIdentifier;
    v21->_contactIdentifier = (NSString *)v30;

    v32 = -[NSString copy](v20, "copy");
    v33 = v21->_customIdentifier;
    v21->_customIdentifier = (NSString *)v32;

    v21->_isMe = isMe;
    v21->_suggestionType = 0;
    v21->_contactSuggestion = 0;
    v21->_searchProvider = 0;
  }

  return v21;
}

- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:](self, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:", personHandle, nameComponents, displayName, image, contactIdentifier, customIdentifier, v9);
}

- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier relationship:(INPersonRelationship)relationship
{
  NSString *v16;
  INPerson *v17;
  uint64_t v18;
  NSString *v19;
  INPerson *v20;
  uint64_t v22;

  v16 = relationship;
  LOBYTE(v22) = 0;
  v17 = -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:](self, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:", personHandle, nameComponents, displayName, image, contactIdentifier, customIdentifier, v22);
  if (v17)
  {
    v18 = -[NSString copy](v16, "copy");
    v19 = v17->_relationship;
    v17->_relationship = (NSString *)v18;

    v20 = v17;
  }

  return v17;
}

- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier isContactSuggestion:(BOOL)isContactSuggestion suggestionType:(INPersonSuggestionType)suggestionType
{
  INPerson *v10;
  INPerson *v11;
  INPerson *v12;
  uint64_t v14;

  LOBYTE(v14) = 0;
  v10 = -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:](self, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:", personHandle, nameComponents, displayName, image, contactIdentifier, customIdentifier, v14);
  v11 = v10;
  if (v10)
  {
    v10->_contactSuggestion = isContactSuggestion;
    v10->_suggestionType = suggestionType;
    v12 = v10;
  }

  return v11;
}

- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier isMe:(BOOL)isMe suggestionType:(INPersonSuggestionType)suggestionType
{
  INPerson *v10;
  INPerson *v11;
  INPerson *v12;
  uint64_t v14;

  LOBYTE(v14) = isMe;
  v10 = -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:](self, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:", personHandle, nameComponents, displayName, image, contactIdentifier, customIdentifier, v14);
  v11 = v10;
  if (v10)
  {
    v10->_suggestionType = suggestionType;
    v12 = v10;
  }

  return v11;
}

- (INPerson)initWithHandle:(NSString *)handle nameComponents:(NSPersonNameComponents *)nameComponents contactIdentifier:(NSString *)contactIdentifier
{
  return -[INPerson initWithHandle:nameComponents:displayName:image:contactIdentifier:](self, "initWithHandle:nameComponents:displayName:image:contactIdentifier:", handle, nameComponents, 0, 0, contactIdentifier);
}

- (INPerson)initWithHandle:(NSString *)handle displayName:(NSString *)displayName contactIdentifier:(NSString *)contactIdentifier
{
  return -[INPerson initWithHandle:nameComponents:displayName:image:contactIdentifier:](self, "initWithHandle:nameComponents:displayName:image:contactIdentifier:", handle, 0, displayName, 0, contactIdentifier);
}

- (INPerson)initWithHandle:(NSString *)handle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier
{
  NSString *v12;
  INImage *v13;
  NSString *v14;
  NSPersonNameComponents *v15;
  NSString *v16;
  INPersonHandle *v17;
  INPerson *v18;

  v12 = contactIdentifier;
  v13 = image;
  v14 = displayName;
  v15 = nameComponents;
  v16 = handle;
  v17 = -[INPersonHandle initWithValue:type:]([INPersonHandle alloc], "initWithValue:type:", v16, 0);

  v18 = -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:](self, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v17, v15, v14, v13, v12, 0);
  return v18;
}

- (NSString)handle
{
  void *v2;
  void *v3;

  -[INPerson personHandle](self, "personHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setHandle:(id)a3
{
  id v4;
  INPersonHandle *v5;

  v4 = a3;
  v5 = -[INPersonHandle initWithValue:type:]([INPersonHandle alloc], "initWithValue:type:", v4, 0);

  -[INPerson setPersonHandle:](self, "setPersonHandle:", v5);
}

- (NSString)displayName
{
  NSString *v3;
  NSPersonNameComponents *nameComponents;
  void *v5;
  NSPersonNameComponents *v6;
  uint64_t v7;
  INPersonHandleType v8;
  INPersonHandle *personHandle;
  NSString *v10;
  __CFString *v11;
  NSString *v12;

  v3 = self->_displayName;
  if (!-[NSString length](v3, "length"))
  {
    nameComponents = self->_nameComponents;
    if (nameComponents)
    {
      v5 = (void *)MEMORY[0x1E0CB3858];
      v6 = nameComponents;
      objc_msgSend(v5, "localizedStringFromPersonNameComponents:style:options:", v6, 0, 0);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (NSString *)v7;
    }
  }
  if (!-[NSString length](v3, "length"))
  {
    v8 = -[INPersonHandle type](self->_personHandle, "type");
    personHandle = self->_personHandle;
    if (v8 == INPersonHandleTypePhoneNumber)
    {
      -[INPersonHandle value](personHandle, "value");
      v10 = (NSString *)PNCreateFormattedStringWithCountry();

      if (-[NSString length](v10, "length"))
      {
        v3 = v10;
        goto LABEL_11;
      }
      personHandle = self->_personHandle;
    }
    else
    {
      v10 = v3;
    }
    -[INPersonHandle value](personHandle, "value");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_11:
  if (v3)
    v11 = (__CFString *)v3;
  else
    v11 = &stru_1E2295770;
  v12 = v11;

  return v12;
}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  displayName = self->_displayName;
  self->_displayName = v4;

}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  NSString *displayName;
  void *v20;

  v3 = -[INPersonHandle hash](self->_personHandle, "hash");
  v4 = -[NSPersonNameComponents hash](self->_nameComponents, "hash") ^ v3;
  v5 = -[INImage hash](self->_image, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_contactIdentifier, "hash");
  v7 = -[NSString hash](self->_customIdentifier, "hash");
  v8 = v6 ^ v7 ^ -[NSArray hash](self->_aliases, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_suggestionType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMe);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ v10 ^ objc_msgSend(v11, "hash");
  v13 = -[NSArray hash](self->_scoredAlternatives, "hash");
  v14 = v13 ^ -[NSString hash](self->_phonemeData, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_contactSuggestion);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_searchProvider);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12 ^ v16 ^ objc_msgSend(v17, "hash");

  displayName = self->_displayName;
  -[INPersonHandle value](self->_personHandle, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(displayName) = -[NSString isEqualToString:](displayName, "isEqualToString:", v20);

  if ((displayName & 1) == 0)
    v18 ^= -[NSString hash](self->_displayName, "hash");
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  INPersonHandle *v6;
  BOOL v7;
  NSString *userInput;
  INPersonHandle *personHandle;
  NSPersonNameComponents *nameComponents;
  NSString *displayName;
  INImage *image;
  NSString *contactIdentifier;
  NSString *customIdentifier;
  NSArray *aliases;
  NSArray *scoredAlternatives;
  NSString *phonemeData;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    if (-[NSString length](self->_contactIdentifier, "length")
      && objc_msgSend(*((id *)v5 + 12), "length")
      && -[NSString isEqual:](self->_contactIdentifier, "isEqual:", *((_QWORD *)v5 + 12))
      && (v6 = self->_personHandle) != 0
      && *((_QWORD *)v5 + 10)
      && -[INPersonHandle isEqual:](v6, "isEqual:"))
    {
      v7 = 1;
    }
    else
    {
      userInput = self->_userInput;
      if (userInput != *((NSString **)v5 + 3) && !-[NSString isEqual:](userInput, "isEqual:"))
        goto LABEL_34;
      personHandle = self->_personHandle;
      if (personHandle != *((INPersonHandle **)v5 + 10) && !-[INPersonHandle isEqual:](personHandle, "isEqual:"))
        goto LABEL_34;
      nameComponents = self->_nameComponents;
      if (nameComponents != *((NSPersonNameComponents **)v5 + 2)
        && !-[NSPersonNameComponents isEqual:](nameComponents, "isEqual:"))
      {
        goto LABEL_34;
      }
      if (((displayName = self->_displayName, displayName == *((NSString **)v5 + 1))
         || -[NSString isEqual:](displayName, "isEqual:"))
        && ((image = self->_image, image == *((INImage **)v5 + 11)) || -[INImage isEqual:](image, "isEqual:"))
        && ((contactIdentifier = self->_contactIdentifier, contactIdentifier == *((NSString **)v5 + 12))
         || -[NSString isEqual:](contactIdentifier, "isEqual:"))
        && ((customIdentifier = self->_customIdentifier, customIdentifier == *((NSString **)v5 + 13))
         || -[NSString isEqual:](customIdentifier, "isEqual:"))
        && ((aliases = self->_aliases, aliases == *((NSArray **)v5 + 4))
         || -[NSArray isEqual:](aliases, "isEqual:"))
        && self->_suggestionType == *((_QWORD *)v5 + 5)
        && self->_isMe == v5[56]
        && ((scoredAlternatives = self->_scoredAlternatives, scoredAlternatives == *((NSArray **)v5 + 6))
         || -[NSArray isEqual:](scoredAlternatives, "isEqual:"))
        && ((phonemeData = self->_phonemeData, phonemeData == *((NSString **)v5 + 15))
         || -[NSString isEqual:](phonemeData, "isEqual:"))
        && self->_contactSuggestion == v5[72])
      {
        v7 = self->_searchProvider == *((_QWORD *)v5 + 16);
      }
      else
      {
LABEL_34:
        v7 = 0;
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  BOOL isMe;
  int64_t suggestionType;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v22 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v17 = (void *)-[NSString copyWithZone:](self->_userInput, "copyWithZone:", a3);
  v5 = -[INPersonHandle copyWithZone:](self->_personHandle, "copyWithZone:", a3);
  v21 = (void *)-[NSPersonNameComponents copyWithZone:](self->_nameComponents, "copyWithZone:", a3);
  v20 = (void *)-[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v19 = -[INImage copyWithZone:](self->_image, "copyWithZone:", a3);
  v18 = (void *)-[NSString copyWithZone:](self->_contactIdentifier, "copyWithZone:", a3);
  v16 = (void *)-[NSString copyWithZone:](self->_customIdentifier, "copyWithZone:", a3);
  v15 = (void *)-[NSString copyWithZone:](self->_relationship, "copyWithZone:", a3);
  v6 = (void *)-[NSArray copyWithZone:](self->_aliases, "copyWithZone:", a3);
  isMe = self->_isMe;
  suggestionType = self->_suggestionType;
  v9 = (void *)-[NSArray copyWithZone:](self->_scoredAlternatives, "copyWithZone:", a3);
  v10 = (void *)-[NSString copyWithZone:](self->_sourceAppBundleIdentifier, "copyWithZone:", a3);
  v11 = (void *)-[NSString copyWithZone:](self->_phonemeData, "copyWithZone:", a3);
  LOBYTE(v14) = self->_contactSuggestion;
  LOBYTE(v13) = isMe;
  v23 = (void *)objc_msgSend(v22, "_initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:relationship:aliases:suggestionType:isMe:scoredAlternatives:sourceAppBundleIdentifier:phonemeData:isContactSuggestion:searchProvider:", v17, v5, v21, v20, v19, v18, v16, v15, v6, suggestionType, v13, v9, v10, v11, v14,
                  self->_searchProvider);

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *userInput;
  id v5;

  userInput = self->_userInput;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userInput, CFSTR("_userInput"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personHandle, CFSTR("personHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameComponents, CFSTR("nameComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customIdentifier, CFSTR("customIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relationship, CFSTR("relationship"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_aliases, CFSTR("aliases"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_suggestionType, CFSTR("suggestionType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMe, CFSTR("isMe"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scoredAlternatives, CFSTR("scoredAlternatives"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_contactSuggestion, CFSTR("contactSuggestion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_searchProvider, CFSTR("searchProvider"));

}

- (INPerson)initWithCoder:(id)a3
{
  id v4;
  INPerson *v5;
  uint64_t v6;
  NSString *userInput;
  uint64_t v8;
  INPersonHandle *personHandle;
  uint64_t v10;
  NSPersonNameComponents *nameComponents;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *displayName;
  uint64_t v17;
  INImage *image;
  uint64_t v19;
  NSString *contactIdentifier;
  uint64_t v21;
  NSString *customIdentifier;
  uint64_t v23;
  NSString *relationship;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSArray *aliases;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *scoredAlternatives;
  objc_super v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)INPerson;
  v5 = -[INPerson init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userInput"));
    v6 = objc_claimAutoreleasedReturnValue();
    userInput = v5->_userInput;
    v5->_userInput = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personHandle"));
    v8 = objc_claimAutoreleasedReturnValue();
    personHandle = v5->_personHandle;
    v5->_personHandle = (INPersonHandle *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nameComponents"));
    v10 = objc_claimAutoreleasedReturnValue();
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("displayName"));
    v15 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v17 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (INImage *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    customIdentifier = v5->_customIdentifier;
    v5->_customIdentifier = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relationship"));
    v23 = objc_claimAutoreleasedReturnValue();
    relationship = v5->_relationship;
    v5->_relationship = (NSString *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("aliases"));
    v28 = objc_claimAutoreleasedReturnValue();
    aliases = v5->_aliases;
    v5->_aliases = (NSArray *)v28;

    v5->_suggestionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suggestionType"));
    v5->_isMe = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMe"));
    v30 = (void *)MEMORY[0x1E0C99E60];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("scoredAlternatives"));
    v33 = objc_claimAutoreleasedReturnValue();
    scoredAlternatives = v5->_scoredAlternatives;
    v5->_scoredAlternatives = (NSArray *)v33;

    v5->_contactSuggestion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("contactSuggestion"));
    v5->_searchProvider = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("searchProvider"));
  }

  return v5;
}

- (id)_displayName
{
  return self->_displayName;
}

- (id)_userInput
{
  return self->_userInput;
}

- (id)_aliases
{
  return self->_aliases;
}

- (NSArray)alternatives
{
  return (NSArray *)-[NSArray valueForKey:](self->_scoredAlternatives, "valueForKey:", CFSTR("person"));
}

- (void)setAlternatives:(id)a3
{
  NSArray *v4;
  NSArray *scoredAlternatives;

  +[INPerson toNilScoredPersons:](INPerson, "toNilScoredPersons:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  scoredAlternatives = self->_scoredAlternatives;
  self->_scoredAlternatives = v4;

}

- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 customIdentifier:(id)a9 relationship:(id)a10 aliases:(id)a11 suggestionType:(int64_t)a12 isMe:(BOOL)a13 alternatives:(id)a14 sourceAppBundleIdentifier:(id)a15 phonemeData:(id)a16 isContactSuggestion:(BOOL)a17
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v32;
  id v33;
  id v35;
  void *v37;
  id v39;

  v35 = a16;
  v33 = a15;
  v30 = a11;
  v20 = a10;
  v28 = a9;
  v29 = a8;
  v21 = a7;
  v22 = a6;
  v32 = a5;
  v23 = a4;
  v24 = a3;
  +[INPerson toNilScoredPersons:](INPerson, "toNilScoredPersons:", a14);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = a17;
  LOBYTE(v26) = a13;
  v39 = -[INPerson _initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:relationship:aliases:suggestionType:isMe:scoredAlternatives:sourceAppBundleIdentifier:phonemeData:isContactSuggestion:searchProvider:](self, "_initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:relationship:aliases:suggestionType:isMe:scoredAlternatives:sourceAppBundleIdentifier:phonemeData:isContactSuggestion:searchProvider:", v24, v23, v32, v22, v21, v29, v28, v20, v30, a12, v26, v37, v33, v35, v27, 0);

  return v39;
}

- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 customIdentifier:(id)a9 relationship:(id)a10 aliases:(id)a11 suggestionType:(int64_t)a12 isMe:(BOOL)a13 scoredAlternatives:(id)a14 sourceAppBundleIdentifier:(id)a15 phonemeData:(id)a16 isContactSuggestion:(BOOL)a17 searchProvider:(int64_t)a18
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  INPerson *v32;
  uint64_t v33;
  NSString *userInput;
  uint64_t v35;
  INPersonHandle *personHandle;
  uint64_t v37;
  NSPersonNameComponents *nameComponents;
  uint64_t v39;
  NSString *displayName;
  uint64_t v41;
  INImage *image;
  uint64_t v43;
  NSString *contactIdentifier;
  uint64_t v45;
  NSString *customIdentifier;
  uint64_t v47;
  NSString *relationship;
  uint64_t v49;
  NSArray *aliases;
  uint64_t v51;
  NSArray *scoredAlternatives;
  uint64_t v53;
  NSString *phonemeData;
  id v57;
  id v58;
  id v59;
  objc_super v60;

  v23 = a3;
  v24 = a4;
  v59 = a5;
  v58 = a6;
  v57 = a7;
  v25 = a8;
  v26 = a9;
  v27 = a10;
  v28 = a11;
  v29 = a14;
  v30 = a15;
  v31 = a16;
  v60.receiver = self;
  v60.super_class = (Class)INPerson;
  v32 = -[INPerson init](&v60, sel_init);
  if (v32)
  {
    v33 = objc_msgSend(v23, "copy");
    userInput = v32->_userInput;
    v32->_userInput = (NSString *)v33;

    v35 = objc_msgSend(v24, "copy");
    personHandle = v32->_personHandle;
    v32->_personHandle = (INPersonHandle *)v35;

    v37 = objc_msgSend(v59, "copy");
    nameComponents = v32->_nameComponents;
    v32->_nameComponents = (NSPersonNameComponents *)v37;

    v39 = objc_msgSend(v58, "copy");
    displayName = v32->_displayName;
    v32->_displayName = (NSString *)v39;

    v41 = objc_msgSend(v57, "copy");
    image = v32->_image;
    v32->_image = (INImage *)v41;

    v43 = objc_msgSend(v25, "copy");
    contactIdentifier = v32->_contactIdentifier;
    v32->_contactIdentifier = (NSString *)v43;

    v45 = objc_msgSend(v26, "copy");
    customIdentifier = v32->_customIdentifier;
    v32->_customIdentifier = (NSString *)v45;

    v47 = objc_msgSend(v27, "copy");
    relationship = v32->_relationship;
    v32->_relationship = (NSString *)v47;

    v49 = objc_msgSend(v28, "copy");
    aliases = v32->_aliases;
    v32->_aliases = (NSArray *)v49;

    v32->_suggestionType = a12;
    v32->_isMe = a13;
    v51 = objc_msgSend(v29, "copy");
    scoredAlternatives = v32->_scoredAlternatives;
    v32->_scoredAlternatives = (NSArray *)v51;

    objc_storeStrong((id *)&v32->_sourceAppBundleIdentifier, a15);
    v53 = objc_msgSend(v31, "copy");
    phonemeData = v32->_phonemeData;
    v32->_phonemeData = (NSString *)v53;

    v32->_contactSuggestion = a17;
    v32->_searchProvider = a18;
  }

  return v32;
}

- (INPerson)initWithContact:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  INPersonHandle *v11;
  void *v12;
  void *v13;
  void *v14;
  INPersonHandle *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  INPersonHandle *v23;
  void *v24;
  void *v25;
  INPersonHandle *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  id *v31;
  void *v32;
  id v33;
  _QWORD *v34;
  void *v35;
  int v36;
  void *v37;
  INPerson *v38;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  objc_msgSend(MEMORY[0x1E0CB3850], "componentsForContact:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getCNContactPhoneNumbersKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v42, "isKeyAvailable:", v4);

  if (v5)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v42, "phoneNumbers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v48 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v11 = [INPersonHandle alloc];
          objc_msgSend(v10, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          INPersonHandleLabelForCNLabeledValue(v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[INPersonHandle initWithValue:type:label:](v11, "initWithValue:type:label:", v13, 2, v14);

          objc_msgSend(v3, "addObject:", v15);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v7);
    }

  }
  getCNContactEmailAddressesKey();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v42, "isKeyAvailable:", v16);

  if (v17)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v42, "emailAddresses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v44 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          v23 = [INPersonHandle alloc];
          objc_msgSend(v22, "value");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          INPersonHandleLabelForCNLabeledValue(v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[INPersonHandle initWithValue:type:label:](v23, "initWithValue:type:label:", v24, 1, v25);

          objc_msgSend(v3, "addObject:", v26);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      }
      while (v19);
    }

  }
  objc_msgSend(v3, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {

    v3 = 0;
  }
  else
  {
    objc_msgSend(v3, "removeObjectAtIndex:", 0);
  }
  getCNContactIdentifierKey();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v42, "isKeyAvailable:", v28);

  if (v29)
  {
    objc_msgSend(v42, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v31 = (id *)getCNContactImageDataAvailableKeySymbolLoc_ptr;
  v54 = getCNContactImageDataAvailableKeySymbolLoc_ptr;
  if (!getCNContactImageDataAvailableKeySymbolLoc_ptr)
  {
    v32 = (void *)ContactsLibrary_30915();
    v31 = (id *)dlsym(v32, "CNContactImageDataAvailableKey");
    v52[3] = (uint64_t)v31;
    getCNContactImageDataAvailableKeySymbolLoc_ptr = (uint64_t)v31;
  }
  _Block_object_dispose(&v51, 8);
  if (!v31)
    goto LABEL_39;
  v33 = *v31;
  if (!objc_msgSend(v42, "isKeyAvailable:", v33))
  {
    v37 = 0;
    goto LABEL_36;
  }
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v34 = (_QWORD *)getCNContactImageDataKeySymbolLoc_ptr;
  v54 = getCNContactImageDataKeySymbolLoc_ptr;
  if (!getCNContactImageDataKeySymbolLoc_ptr)
  {
    v35 = (void *)ContactsLibrary_30915();
    v34 = dlsym(v35, "CNContactImageDataKey");
    v52[3] = (uint64_t)v34;
    getCNContactImageDataKeySymbolLoc_ptr = (uint64_t)v34;
  }
  _Block_object_dispose(&v51, 8);
  if (!v34)
  {
LABEL_39:
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v36 = objc_msgSend(v42, "isKeyAvailable:", *v34);

  if (!v36 || !objc_msgSend(v42, "imageDataAvailable"))
  {
    v37 = 0;
    goto LABEL_38;
  }
  objc_msgSend(v42, "imageData");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  +[INImage imageWithImageData:](INImage, "imageWithImageData:", v33);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:

LABEL_38:
  v38 = -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:aliases:suggestionType:](self, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:aliases:suggestionType:", v27, v41, 0, v37, v30, 0, v3, 0);

  return v38;
}

- (id)_dictionaryRepresentation
{
  uint64_t personHandle;
  uint64_t nameComponents;
  NSString *displayName;
  uint64_t v6;
  INImage *image;
  uint64_t v8;
  NSString *contactIdentifier;
  uint64_t v10;
  NSString *customIdentifier;
  void *v12;
  NSString *relationship;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[8];
  _QWORD v27[10];

  v27[8] = *MEMORY[0x1E0C80C00];
  personHandle = (uint64_t)self->_personHandle;
  v25 = personHandle;
  v26[0] = CFSTR("personHandle");
  if (!personHandle)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    personHandle = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)personHandle;
  v27[0] = personHandle;
  v26[1] = CFSTR("nameComponents");
  nameComponents = (uint64_t)self->_nameComponents;
  v24 = nameComponents;
  if (!nameComponents)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    nameComponents = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)nameComponents;
  v27[1] = nameComponents;
  v26[2] = CFSTR("displayName");
  displayName = self->_displayName;
  v6 = (uint64_t)displayName;
  if (!displayName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v6;
  v27[2] = v6;
  v26[3] = CFSTR("image");
  image = self->_image;
  v8 = (uint64_t)image;
  if (!image)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v8;
  v27[3] = v8;
  v26[4] = CFSTR("contactIdentifier");
  contactIdentifier = self->_contactIdentifier;
  v10 = (uint64_t)contactIdentifier;
  if (!contactIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v10;
  v27[4] = v10;
  v26[5] = CFSTR("customIdentifier");
  customIdentifier = self->_customIdentifier;
  v12 = customIdentifier;
  if (!customIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[5] = v12;
  v26[6] = CFSTR("relationship");
  relationship = self->_relationship;
  v14 = relationship;
  if (!relationship)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[6] = v14;
  v26[7] = CFSTR("siriMatches");
  -[INPerson siriMatches](self, "siriMatches");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[7] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)

  if (relationship)
  {
    if (customIdentifier)
      goto LABEL_21;
  }
  else
  {

    if (customIdentifier)
    {
LABEL_21:
      if (contactIdentifier)
        goto LABEL_22;
      goto LABEL_31;
    }
  }

  if (contactIdentifier)
  {
LABEL_22:
    if (image)
      goto LABEL_23;
LABEL_32:

    if (displayName)
      goto LABEL_24;
    goto LABEL_33;
  }
LABEL_31:

  if (!image)
    goto LABEL_32;
LABEL_23:
  if (displayName)
    goto LABEL_24;
LABEL_33:

LABEL_24:
  if (!v24)

  if (!v25)
  return v17;
}

- (INPersonHandle)personHandle
{
  return self->_personHandle;
}

- (void)setPersonHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (INImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (void)setCustomIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (INPersonRelationship)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)isContactSuggestion
{
  return self->_contactSuggestion;
}

- (NSArray)aliases
{
  return self->_aliases;
}

- (void)setAliases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (INPersonSuggestionType)suggestionType
{
  return self->_suggestionType;
}

- (void)setSuggestionType:(int64_t)a3
{
  self->_suggestionType = a3;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (NSArray)scoredAlternatives
{
  return self->_scoredAlternatives;
}

- (void)setScoredAlternatives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)phonemeData
{
  return self->_phonemeData;
}

- (void)setPhonemeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)sourceAppBundleIdentifier
{
  return self->_sourceAppBundleIdentifier;
}

- (void)setSourceAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)searchProvider
{
  return self->_searchProvider;
}

- (void)setSearchProvider:(int64_t)a3
{
  self->_searchProvider = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phonemeData, 0);
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_personHandle, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_scoredAlternatives, 0);
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)expectedCNContactKeys
{
  id *v2;
  void *v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  id *v11;
  void *v12;
  id v13;
  id *v14;
  void *v15;
  id v16;
  id *v17;
  void *v18;
  id v19;
  id *v20;
  void *v21;
  id v22;
  id *v23;
  void *v24;
  id v25;
  id *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[8];
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v2 = (id *)getCNContactNamePrefixKeySymbolLoc_ptr;
  v42 = getCNContactNamePrefixKeySymbolLoc_ptr;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr)
  {
    v3 = (void *)ContactsLibrary_30915();
    v2 = (id *)dlsym(v3, "CNContactNamePrefixKey");
    v40[3] = (uint64_t)v2;
    getCNContactNamePrefixKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v39, 8);
  if (!v2)
    goto LABEL_29;
  v4 = *v2;
  v43[0] = v4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v5 = (id *)getCNContactGivenNameKeySymbolLoc_ptr;
  v42 = getCNContactGivenNameKeySymbolLoc_ptr;
  if (!getCNContactGivenNameKeySymbolLoc_ptr)
  {
    v6 = (void *)ContactsLibrary_30915();
    v5 = (id *)dlsym(v6, "CNContactGivenNameKey");
    v40[3] = (uint64_t)v5;
    getCNContactGivenNameKeySymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v39, 8);
  if (!v5)
    goto LABEL_29;
  v7 = *v5;
  v43[1] = v7;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v8 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr;
  v42 = getCNContactMiddleNameKeySymbolLoc_ptr;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr)
  {
    v9 = (void *)ContactsLibrary_30915();
    v8 = (id *)dlsym(v9, "CNContactMiddleNameKey");
    v40[3] = (uint64_t)v8;
    getCNContactMiddleNameKeySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v39, 8);
  if (!v8)
    goto LABEL_29;
  v10 = *v8;
  v43[2] = v10;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v11 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr;
  v42 = getCNContactFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr)
  {
    v12 = (void *)ContactsLibrary_30915();
    v11 = (id *)dlsym(v12, "CNContactFamilyNameKey");
    v40[3] = (uint64_t)v11;
    getCNContactFamilyNameKeySymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v39, 8);
  if (!v11)
    goto LABEL_29;
  v13 = *v11;
  v43[3] = v13;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v14 = (id *)getCNContactNameSuffixKeySymbolLoc_ptr;
  v42 = getCNContactNameSuffixKeySymbolLoc_ptr;
  if (!getCNContactNameSuffixKeySymbolLoc_ptr)
  {
    v15 = (void *)ContactsLibrary_30915();
    v14 = (id *)dlsym(v15, "CNContactNameSuffixKey");
    v40[3] = (uint64_t)v14;
    getCNContactNameSuffixKeySymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v39, 8);
  if (!v14)
    goto LABEL_29;
  v16 = *v14;
  v43[4] = v16;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v17 = (id *)getCNContactNicknameKeySymbolLoc_ptr;
  v42 = getCNContactNicknameKeySymbolLoc_ptr;
  if (!getCNContactNicknameKeySymbolLoc_ptr)
  {
    v18 = (void *)ContactsLibrary_30915();
    v17 = (id *)dlsym(v18, "CNContactNicknameKey");
    v40[3] = (uint64_t)v17;
    getCNContactNicknameKeySymbolLoc_ptr = (uint64_t)v17;
  }
  _Block_object_dispose(&v39, 8);
  if (!v17)
    goto LABEL_29;
  v19 = *v17;
  v43[5] = v19;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v20 = (id *)getCNContactPhoneticGivenNameKeySymbolLoc_ptr;
  v42 = getCNContactPhoneticGivenNameKeySymbolLoc_ptr;
  if (!getCNContactPhoneticGivenNameKeySymbolLoc_ptr)
  {
    v21 = (void *)ContactsLibrary_30915();
    v20 = (id *)dlsym(v21, "CNContactPhoneticGivenNameKey");
    v40[3] = (uint64_t)v20;
    getCNContactPhoneticGivenNameKeySymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v39, 8);
  if (!v20)
    goto LABEL_29;
  v22 = *v20;
  v43[6] = v22;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v23 = (id *)getCNContactPhoneticMiddleNameKeySymbolLoc_ptr;
  v42 = getCNContactPhoneticMiddleNameKeySymbolLoc_ptr;
  if (!getCNContactPhoneticMiddleNameKeySymbolLoc_ptr)
  {
    v24 = (void *)ContactsLibrary_30915();
    v23 = (id *)dlsym(v24, "CNContactPhoneticMiddleNameKey");
    v40[3] = (uint64_t)v23;
    getCNContactPhoneticMiddleNameKeySymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(&v39, 8);
  if (!v23)
    goto LABEL_29;
  v25 = *v23;
  v43[7] = v25;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v26 = (id *)getCNContactPhoneticFamilyNameKeySymbolLoc_ptr;
  v42 = getCNContactPhoneticFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactPhoneticFamilyNameKeySymbolLoc_ptr)
  {
    v27 = (void *)ContactsLibrary_30915();
    v26 = (id *)dlsym(v27, "CNContactPhoneticFamilyNameKey");
    v40[3] = (uint64_t)v26;
    getCNContactPhoneticFamilyNameKeySymbolLoc_ptr = (uint64_t)v26;
  }
  _Block_object_dispose(&v39, 8);
  if (!v26)
  {
LABEL_29:
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v28 = v4;
  v29 = v16;
  v37 = v7;
  v38 = v10;
  v36 = v28;
  v44 = *v26;
  v30 = v44;
  getCNContactPhoneNumbersKey();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v31;
  getCNContactEmailAddressesKey();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v32;
  getCNContactIdentifierKey();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 12);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (id)toNilScoredPersons:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  INScoredPerson *v11;
  INScoredPerson *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v11 = [INScoredPerson alloc];
          v12 = -[INScoredPerson initWithPerson:score:](v11, "initWithPerson:score:", v10, 0, (_QWORD)v15);
          objc_msgSend(v4, "addObject:", v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    v13 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier aliases:(NSArray *)aliases suggestionType:(INPersonSuggestionType)suggestionType
{
  uint64_t v11;
  uint64_t v12;

  LOBYTE(v12) = 0;
  LOBYTE(v11) = 0;
  return (INPerson *)-[INPerson _initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:relationship:aliases:suggestionType:isMe:alternatives:sourceAppBundleIdentifier:phonemeData:isContactSuggestion:](self, "_initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:relationship:aliases:suggestionType:isMe:alternatives:sourceAppBundleIdentifier:phonemeData:isContactSuggestion:", 0, personHandle, nameComponents, displayName, image, contactIdentifier, customIdentifier, 0, aliases, suggestionType, v11, 0, 0, 0, v12);
}

- (NSString)description
{
  return (NSString *)-[INPerson descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INPerson;
  -[INPerson description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPerson _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_intents_compareValue:(id)a3 relation:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t (**v9)(_QWORD);
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  BOOL v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  INPerson *v36;
  INPerson *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v52;
  void *v53;
  _QWORD v54[5];
  id v55;

  v6 = a3;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __80__INPerson_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke;
  v54[3] = &unk_1E228C6C0;
  v54[4] = self;
  v7 = v6;
  v55 = v7;
  v8 = MEMORY[0x18D7812C4](v54);
  v9 = (uint64_t (**)(_QWORD))v8;
  switch(a4)
  {
    case 1uLL:
      LOBYTE(self) = 1;
      break;
    case 2uLL:
      LOBYTE(self) = (*(uint64_t (**)(uint64_t))(v8 + 16))(v8);
      break;
    case 3uLL:
      LODWORD(self) = (*(uint64_t (**)(uint64_t))(v8 + 16))(v8) ^ 1;
      break;
    case 4uLL:
      -[INPerson displayName](self, "displayName");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v7;
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v24 = v12;

      objc_msgSend(v24, "displayName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v10, "compare:", v25) == 1;
      goto LABEL_44;
    case 5uLL:
      -[INPerson displayName](self, "displayName");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v7;
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v27 = v14;

      objc_msgSend(v27, "displayName");
      v28 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "compare:", v28) == 1)
        goto LABEL_38;
      goto LABEL_50;
    case 6uLL:
      -[INPerson displayName](self, "displayName");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v7;
      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
      }
      else
      {
        v16 = 0;
      }
      v30 = v16;

      objc_msgSend(v30, "displayName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v10, "compare:", v25) == -1;
LABEL_44:
      LOBYTE(self) = v26;

      goto LABEL_78;
    case 7uLL:
      -[INPerson displayName](self, "displayName");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v7;
      if (v17)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
      }
      else
      {
        v18 = 0;
      }
      v31 = v18;

      objc_msgSend(v31, "displayName");
      v28 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "compare:", v28) == -1)
LABEL_38:
        LOBYTE(self) = 1;
      else
LABEL_50:
        LOBYTE(self) = v9[2](v9);
      goto LABEL_77;
    case 8uLL:
      v19 = v7;
      if (v19)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;
      }
      else
      {
        v20 = 0;
      }
      v10 = v20;

      objc_msgSend(v10, "if_flatMap:", &__block_literal_global_37459);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      -[INPerson contactIdentifier](self, "contactIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "containsObject:", v29) & 1) != 0)
        goto LABEL_59;
      v32 = v19;
      if (v19)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v33 = v32;
        else
          v33 = 0;
      }
      else
      {
        v33 = 0;
      }
      v40 = v33;

      objc_msgSend(v40, "if_flatMap:", &__block_literal_global_3);
      v41 = objc_claimAutoreleasedReturnValue();
      -[INPerson customIdentifier](self, "customIdentifier");
      v42 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v41;
      v43 = (void *)v41;
      v44 = (void *)v42;
      if ((objc_msgSend(v43, "containsObject:", v42) & 1) != 0)
      {
        LOBYTE(self) = 1;
      }
      else
      {
        v45 = v32;
        v52 = v40;
        if (v19)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v46 = v45;
          else
            v46 = 0;
        }
        else
        {
          v46 = 0;
        }
        v47 = v46;

        objc_msgSend(v47, "if_flatMap:", &__block_literal_global_4_37460);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        -[INPerson personHandle](self, "personHandle");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "value");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(self) = objc_msgSend(v48, "containsObject:", v50);

        v40 = v52;
      }

      goto LABEL_76;
    case 9uLL:
      -[INPerson displayName](self, "displayName");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v21 = v7;
      if (v21)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
      }
      else
      {
        v22 = 0;
      }
      v28 = v22;

      objc_msgSend(v28, "displayName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "containsString:", v29) & 1) != 0)
        goto LABEL_59;
      goto LABEL_60;
    case 0xAuLL:
      -[INPerson displayName](self, "displayName");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v21 = v7;
      if (v21)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v21;
        else
          v23 = 0;
      }
      else
      {
        v23 = 0;
      }
      v28 = v23;

      objc_msgSend(v28, "displayName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "containsString:", v29))
      {
LABEL_60:
        -[INPerson personHandle](self, "personHandle");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "value");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        self = (INPerson *)v21;
        if (v21)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v36 = self;
          else
            v36 = 0;
        }
        else
        {
          v36 = 0;
        }
        v37 = v36;

        -[INPerson personHandle](v37, "personHandle");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "value");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(self) = objc_msgSend(v35, "containsString:", v39);

      }
      else
      {
LABEL_59:
        LOBYTE(self) = 1;
      }
LABEL_76:

LABEL_77:
LABEL_78:

      break;
    default:
      LOBYTE(self) = 0;
      break;
  }

  return (char)self;
}

uint64_t __80__INPerson_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;
  void *v27;

  objc_msgSend(*(id *)(a1 + 32), "contactIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 40);
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "customIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(id *)(a1 + 40);
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    objc_msgSend(v11, "customIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v12) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "customIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(id *)(a1 + 40);
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      v16 = v15;

      objc_msgSend(v16, "customIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", v17) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "personHandle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "value");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(id *)(a1 + 40);
        v26 = v16;
        v27 = v13;
        if (v18)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v19 = v18;
          else
            v19 = 0;
        }
        else
        {
          v19 = 0;
        }
        v20 = v19;

        objc_msgSend(v20, "personHandle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "value");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v24, "isEqualToString:", v22);

        v16 = v26;
        v13 = v27;
      }

    }
  }

  return v7;
}

id __80__INPerson_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(a2, "personHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_arrayWithObjectIfNonNil:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __80__INPerson_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(a2, "customIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_arrayWithObjectIfNonNil:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __80__INPerson_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(a2, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_arrayWithObjectIfNonNil:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD *);
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = (void (**)(id, void *, _QWORD *))a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)-[INPerson copy](self, "copy");
    -[INPerson image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __70__INPerson_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      v10[3] = &unk_1E2292618;
      v10[4] = v8;
      v11 = v7;
      v6[2](v6, v9, v10);

    }
    else
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }

  }
}

uint64_t __70__INPerson_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setImage:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_intents_indexingRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[INPerson contactIdentifier](self, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v9 = CFSTR("contactIdentifier");
    -[INPerson contactIdentifier](self, "contactIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[INPerson _dictionaryRepresentation](self, "_dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_intents_indexingRepresentation");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)spokenPhrases
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPerson spokenPhrase](self, "spokenPhrase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[INPerson nameComponents](self, "nameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INPerson nameComponents](self, "nameComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "givenName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  -[INPerson nameComponents](self, "nameComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "familyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[INPerson nameComponents](self, "nameComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "familyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  -[INPerson nameComponents](self, "nameComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nickname");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[INPerson nameComponents](self, "nameComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "nickname");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

  }
  return v3;
}

@end
