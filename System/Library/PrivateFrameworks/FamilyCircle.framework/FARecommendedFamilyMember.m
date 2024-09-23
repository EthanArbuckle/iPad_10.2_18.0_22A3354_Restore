@implementation FARecommendedFamilyMember

- (FARecommendedFamilyMember)initWithDisplayName:(id)a3 handle:(id)a4 iMessageHandle:(id)a5 contact:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FARecommendedFamilyMember *v15;
  FARecommendedFamilyMember *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FARecommendedFamilyMember;
  v15 = -[FARecommendedFamilyMember init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayName, a3);
    objc_storeStrong((id *)&v16->_handle, a4);
    objc_storeStrong((id *)&v16->_contact, a6);
    objc_storeStrong((id *)&v16->_iMessageHandle, a5);
  }

  return v16;
}

- (FARecommendedFamilyMember)initWithMegadomeRecommendation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FARecommendedFamilyMember *v13;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "names");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(v4, "phoneNumbers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "contactIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FARecommendedFamilyMember contactFromRecommendationWithIdentifier:](self, "contactFromRecommendationWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FARecommendedFamilyMember initWithDisplayName:handle:iMessageHandle:contact:](self, "initWithDisplayName:handle:iMessageHandle:contact:", v6, v9, 0, v12);

  if (!v8)
  {

  }
  return v13;
}

- (FARecommendedFamilyMember)initWithPeopleSuggesterRecommendation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FARecommendedFamilyMember *v10;

  v4 = a3;
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FARecommendedFamilyMember contactFromRecommendationWithIdentifier:](self, "contactFromRecommendationWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FARecommendedFamilyMember initWithDisplayName:handle:iMessageHandle:contact:](self, "initWithDisplayName:handle:iMessageHandle:contact:", v5, v6, 0, v9);

  return v10;
}

- (id)contactFromRecommendationWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  _QWORD v24[20];

  v24[19] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = *MEMORY[0x1E0C966D0];
    v24[0] = *MEMORY[0x1E0C96790];
    v24[1] = v4;
    v5 = *MEMORY[0x1E0C966C0];
    v24[2] = *MEMORY[0x1E0C96780];
    v24[3] = v5;
    v6 = *MEMORY[0x1E0C96798];
    v24[4] = *MEMORY[0x1E0C96820];
    v24[5] = v6;
    v7 = *MEMORY[0x1E0C967B8];
    v24[6] = *MEMORY[0x1E0C967A0];
    v24[7] = v7;
    v8 = *MEMORY[0x1E0C96758];
    v24[8] = *MEMORY[0x1E0C96698];
    v24[9] = v8;
    v9 = *MEMORY[0x1E0C967E0];
    v24[10] = *MEMORY[0x1E0C967D8];
    v24[11] = v9;
    v10 = *MEMORY[0x1E0C967E8];
    v24[12] = *MEMORY[0x1E0C967D0];
    v24[13] = v10;
    v11 = *MEMORY[0x1E0C967C0];
    v24[14] = *MEMORY[0x1E0C96898];
    v24[15] = v11;
    v12 = *MEMORY[0x1E0C96890];
    v24[16] = *MEMORY[0x1E0C966A8];
    v24[17] = v12;
    v24[18] = *MEMORY[0x1E0C96840];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObject:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v17 = (void *)MEMORY[0x1E0C97200];
    v23 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicateForContactsWithIdentifiers:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "unifiedContactsMatchingPredicate:keysToFetch:error:", v19, v15, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _FALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FARecommendedFamilyMember contactFromRecommendationWithIdentifier:].cold.1(v15);
    v21 = 0;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *displayName;
  id v5;

  displayName = self->_displayName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", displayName, CFSTR("_displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handle, CFSTR("_handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contact, CFSTR("_contact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contact, CFSTR("_iMessageHandle"));

}

- (id)_safeClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

- (FARecommendedFamilyMember)initWithCoder:(id)a3
{
  id v4;
  FARecommendedFamilyMember *v5;
  FARecommendedFamilyMember *v6;
  void *v7;
  uint64_t v8;
  NSString *displayName;
  void *v10;
  uint64_t v11;
  NSString *handle;
  void *v13;
  uint64_t v14;
  CNContact *contact;
  void *v16;
  uint64_t v17;
  NSString *iMessageHandle;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FARecommendedFamilyMember;
  v5 = -[FARecommendedFamilyMember init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    -[FARecommendedFamilyMember _safeClasses](v5, "_safeClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("_displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v6->_displayName;
    v6->_displayName = (NSString *)v8;

    -[FARecommendedFamilyMember _safeClasses](v6, "_safeClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_handle"));
    v11 = objc_claimAutoreleasedReturnValue();
    handle = v6->_handle;
    v6->_handle = (NSString *)v11;

    -[FARecommendedFamilyMember _safeClasses](v6, "_safeClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_contact"));
    v14 = objc_claimAutoreleasedReturnValue();
    contact = v6->_contact;
    v6->_contact = (CNContact *)v14;

    -[FARecommendedFamilyMember _safeClasses](v6, "_safeClasses");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_iMessageHandle"));
    v17 = objc_claimAutoreleasedReturnValue();
    iMessageHandle = v6->_iMessageHandle;
    v6->_iMessageHandle = (NSString *)v17;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  FARecommendedFamilyMember *v4;
  NSString *displayName;
  NSString *v6;
  NSString *v7;
  void *v8;
  char v9;
  NSString *handle;
  NSString *v11;
  NSString *v12;
  void *v13;
  CNContact *contact;
  CNContact *v15;
  CNContact *v16;
  void *v17;
  NSString *iMessageHandle;
  uint64_t v19;
  void *v20;
  NSString *v21;
  void *v22;
  BOOL v23;
  void *v25;
  void *v26;
  void *v27;

  v4 = (FARecommendedFamilyMember *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      displayName = self->_displayName;
      -[FARecommendedFamilyMember displayName](v4, "displayName");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (displayName != v6)
      {
        v7 = self->_displayName;
        -[FARecommendedFamilyMember displayName](v4, "displayName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v7, "isEqualToString:", v8))
        {
          v9 = 0;
          goto LABEL_25;
        }
        v27 = v8;
      }
      handle = self->_handle;
      -[FARecommendedFamilyMember handle](v4, "handle");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (handle != v11)
      {
        v12 = self->_handle;
        -[FARecommendedFamilyMember handle](v4, "handle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v12, "isEqualToString:", v13))
        {
          v9 = 0;
LABEL_23:

LABEL_24:
          v8 = v27;
          if (displayName == v6)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v26 = v13;
      }
      contact = self->_contact;
      -[FARecommendedFamilyMember contact](v4, "contact");
      v15 = (CNContact *)objc_claimAutoreleasedReturnValue();
      if (contact != v15)
      {
        v16 = self->_contact;
        -[FARecommendedFamilyMember contact](v4, "contact");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[CNContact isEqualIgnoringIdentifiers:](v16, "isEqualIgnoringIdentifiers:", v17))
        {
          v9 = 0;
          v13 = v26;
          goto LABEL_21;
        }
        v25 = v17;
      }
      iMessageHandle = self->_iMessageHandle;
      -[FARecommendedFamilyMember iMessageHandle](v4, "iMessageHandle");
      v19 = objc_claimAutoreleasedReturnValue();
      if (iMessageHandle == (NSString *)v19)
      {

        v9 = 1;
      }
      else
      {
        v20 = (void *)v19;
        v21 = self->_iMessageHandle;
        -[FARecommendedFamilyMember iMessageHandle](v4, "iMessageHandle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NSString isEqualToString:](v21, "isEqualToString:", v22);

      }
      v23 = contact == v15;
      v17 = v25;
      v13 = v26;
      if (v23)
      {
LABEL_22:

        if (handle == v11)
          goto LABEL_24;
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    v9 = 0;
  }
LABEL_27:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FARecommendedFamilyMember *v4;

  v4 = -[FARecommendedFamilyMember init](+[FARecommendedFamilyMember allocWithZone:](FARecommendedFamilyMember, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_contact, self->_contact);
  objc_storeStrong((id *)&v4->_displayName, self->_displayName);
  objc_storeStrong((id *)&v4->_handle, self->_handle);
  objc_storeStrong((id *)&v4->_iMessageHandle, self->_iMessageHandle);
  return v4;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)iMessageHandle
{
  return self->_iMessageHandle;
}

- (void)setIMessageHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iMessageHandle, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)contactFromRecommendationWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CAEBA000, log, OS_LOG_TYPE_ERROR, "Identifier for contact was nil. Bailing on getting contact from recommendation.", v1, 2u);
}

@end
