@implementation INRideDriver

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
    v8 = (void *)-[INRideDriver copy](self, "copy");
    -[INPerson image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __74__INRideDriver_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
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

uint64_t __74__INRideDriver_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setImage:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSString)phoneNumber
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[INPerson personHandle](self, "personHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[INPerson personHandle](self, "personHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");

    if (v7 == 2)
    {
      -[INPerson personHandle](self, "personHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
LABEL_16:
      objc_msgSend(v8, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  else
  {

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[INPerson aliases](self, "aliases", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "value");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          v16 = objc_msgSend(v13, "type");

          if (v16 == 2)
          {
            v8 = v13;
            goto LABEL_16;
          }
        }
      }
      v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_17:

  return (NSString *)v10;
}

- (INRideDriver)initWithPhoneNumber:(NSString *)phoneNumber nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image rating:(NSString *)rating
{
  NSString *v12;
  INImage *v13;
  NSString *v14;
  NSPersonNameComponents *v15;
  NSString *v16;
  INPersonHandle *v17;
  INRideDriver *v18;
  uint64_t v19;
  NSString *v20;
  char v22;
  char v23;
  objc_super v24;

  v12 = rating;
  v13 = image;
  v14 = displayName;
  v15 = nameComponents;
  v16 = phoneNumber;
  v17 = -[INPersonHandle initWithValue:type:]([INPersonHandle alloc], "initWithValue:type:", v16, 2);

  v24.receiver = self;
  v24.super_class = (Class)INRideDriver;
  v23 = 0;
  v22 = 0;
  v18 = -[INPerson _initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:relationship:aliases:suggestionType:isMe:scoredAlternatives:sourceAppBundleIdentifier:phonemeData:isContactSuggestion:searchProvider:](&v24, sel__initWithUserInput_personHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_relationship_aliases_suggestionType_isMe_scoredAlternatives_sourceAppBundleIdentifier_phonemeData_isContactSuggestion_searchProvider_, 0, v17, v15, v14, v13, 0, 0, 0, 0, 0, v22, 0, 0, 0, v23, 0);

  if (v18)
  {
    v19 = -[NSString copy](v12, "copy");
    v20 = v18->_rating;
    v18->_rating = (NSString *)v19;

  }
  return v18;
}

- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 rating:(id)a9 aliases:(id)a10
{
  id v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  char v22;
  char v23;
  objc_super v24;

  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)INRideDriver;
  v23 = 0;
  v22 = 0;
  v18 = -[INPerson _initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:relationship:aliases:suggestionType:isMe:scoredAlternatives:sourceAppBundleIdentifier:phonemeData:isContactSuggestion:searchProvider:](&v24, sel__initWithUserInput_personHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_relationship_aliases_suggestionType_isMe_scoredAlternatives_sourceAppBundleIdentifier_phonemeData_isContactSuggestion_searchProvider_, a3, a4, a5, a6, a7, a8, 0, 0, a10, 0, v22, 0, 0, 0, v23, 0);
  if (v18)
  {
    v19 = objc_msgSend(v17, "copy");
    v20 = (void *)v18[17];
    v18[17] = v19;

  }
  return v18;
}

- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 rating:(id)a9 phoneNumber:(id)a10
{
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  INPersonHandle *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v17 = a10;
  v18 = v17;
  if (v17)
  {
    v39 = v17;
    v19 = a9;
    v20 = a8;
    v21 = a7;
    v22 = a6;
    v23 = a5;
    v24 = a4;
    v25 = a3;
    v26 = -[INPersonHandle initWithValue:type:]([INPersonHandle alloc], "initWithValue:type:", v39, 2);
    v40[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[INRideDriver _initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:rating:aliases:](self, "_initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:rating:aliases:", v25, v24, v23, v22, v21, v20, v19, v27);

    v29 = v28;
    v18 = v39;
  }
  else
  {
    v30 = a9;
    v31 = a8;
    v32 = a7;
    v33 = a6;
    v34 = a5;
    v35 = a4;
    v36 = a3;
    v37 = -[INRideDriver _initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:rating:aliases:](self, "_initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:rating:aliases:", v36, v35, v34, v33, v32, v31, v30, 0);

    v29 = v37;
  }

  return v29;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INRideDriver;
  v3 = -[INPerson hash](&v5, sel_hash);
  return -[NSString hash](self->_rating, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *rating;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)INRideDriver,
        -[INPerson isEqual:](&v9, sel_isEqual_, v4)))
  {
    v5 = v4;
    rating = self->_rating;
    v7 = rating == (NSString *)v5[17] || -[NSString isEqual:](rating, "isEqual:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (INRideDriver)initWithCoder:(id)a3
{
  id v4;
  INRideDriver *v5;
  uint64_t v6;
  NSString *rating;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INRideDriver;
  v5 = -[INPerson initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rating"));
    v6 = objc_claimAutoreleasedReturnValue();
    rating = v5->_rating;
    v5->_rating = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INRideDriver;
  v4 = a3;
  -[INPerson encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_rating, CFSTR("rating"), v5.receiver, v5.super_class);

}

- (INRideDriver)initWithPersonHandle:(id)a3 nameComponents:(id)a4 displayName:(id)a5 image:(id)a6 contactIdentifier:(id)a7 customIdentifier:(id)a8 isMe:(BOOL)a9
{
  return (INRideDriver *)-[INRideDriver _initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:rating:aliases:](self, "_initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:rating:aliases:", 0, a3, a4, a5, a6, a7, 0, 0);
}

- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 customIdentifier:(id)a9 relationship:(id)a10 aliases:(id)a11 suggestionType:(int64_t)a12 isMe:(BOOL)a13 scoredAlternatives:(id)a14 sourceAppBundleIdentifier:(id)a15 phonemeData:(id)a16
{
  return -[INRideDriver _initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:rating:aliases:](self, "_initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:rating:aliases:", a3, a4, a5, a6, a7, a8);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSString *rating;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v12.receiver = self;
  v12.super_class = (Class)INRideDriver;
  -[INPerson _dictionaryRepresentation](&v12, sel__dictionaryRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = CFSTR("rating");
  rating = self->_rating;
  v7 = rating;
  if (!rating)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = CFSTR("phoneNumber");
  v14[0] = v7;
  -[INRideDriver phoneNumber](self, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v10);

  if (!v8)
  if (!rating)

  return v5;
}

- (NSString)rating
{
  return self->_rating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rating, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INRideDriver)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image rating:(NSString *)rating phoneNumber:(NSString *)phoneNumber
{
  return (INRideDriver *)-[INRideDriver _initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:rating:phoneNumber:](self, "_initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:rating:phoneNumber:", 0, personHandle, nameComponents, displayName, image, 0, rating, phoneNumber);
}

- (INRideDriver)initWithHandle:(NSString *)handle displayName:(NSString *)displayName image:(INImage *)image rating:(NSString *)rating phoneNumber:(NSString *)phoneNumber
{
  NSString *v12;
  NSString *v13;
  INImage *v14;
  NSString *v15;
  NSString *v16;
  INPersonHandle *v17;
  INRideDriver *v18;

  v12 = phoneNumber;
  v13 = rating;
  v14 = image;
  v15 = displayName;
  v16 = handle;
  v17 = -[INPersonHandle initWithValue:type:]([INPersonHandle alloc], "initWithValue:type:", v16, 0);

  v18 = -[INRideDriver initWithPersonHandle:nameComponents:displayName:image:rating:phoneNumber:](self, "initWithPersonHandle:nameComponents:displayName:image:rating:phoneNumber:", v17, 0, v15, v14, v13, v12);
  return v18;
}

- (INRideDriver)initWithHandle:(NSString *)handle nameComponents:(NSPersonNameComponents *)nameComponents image:(INImage *)image rating:(NSString *)rating phoneNumber:(NSString *)phoneNumber
{
  NSString *v12;
  NSString *v13;
  INImage *v14;
  NSPersonNameComponents *v15;
  NSString *v16;
  INPersonHandle *v17;
  INRideDriver *v18;

  v12 = phoneNumber;
  v13 = rating;
  v14 = image;
  v15 = nameComponents;
  v16 = handle;
  v17 = -[INPersonHandle initWithValue:type:]([INPersonHandle alloc], "initWithValue:type:", v16, 0);

  v18 = -[INRideDriver initWithPersonHandle:nameComponents:displayName:image:rating:phoneNumber:](self, "initWithPersonHandle:nameComponents:displayName:image:rating:phoneNumber:", v17, v15, 0, v14, v13, v12);
  return v18;
}

@end
