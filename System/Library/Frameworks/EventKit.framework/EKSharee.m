@implementation EKSharee

- (NSPredicate)contactPredicate
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[EKSharee owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFacebookSource");

  if (v5)
  {
    -[EKSharee address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-[CNContact predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C97200];
  -[EKSharee name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSharee emailAddress](self, "emailAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:", v10, v11, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v12;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_9 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_9, &__block_literal_global_67);
  return (id)knownIdentityKeysForComparison_keys_9;
}

void __42__EKSharee_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B820];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownIdentityKeysForComparison_keys_9;
  knownIdentityKeysForComparison_keys_9 = v0;

}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_8 != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_8, &__block_literal_global_7_2);
  return (id)knownSingleValueKeysForComparison_keys_8;
}

void __45__EKSharee_knownSingleValueKeysForComparison__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B988];
  v5[0] = *MEMORY[0x1E0D0B980];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0D0B998];
  v5[2] = *MEMORY[0x1E0D0B990];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0D0B9A8];
  v5[4] = *MEMORY[0x1E0D0B978];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)knownSingleValueKeysForComparison_keys_8;
  knownSingleValueKeysForComparison_keys_8 = v3;

}

+ (id)shareeWithName:(id)a3 emailAddress:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = a3;
  objc_msgSend(a4, "stringAddingMailto");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "shareeWithName:url:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)shareeWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(a1, "_urlForEmailAddress:andPhoneNumber:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:url:", v8, v9);

  return v10;
}

+ (id)shareeWithName:(id)a3 phoneNumber:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = a3;
  objc_msgSend(a4, "stringAddingTel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "shareeWithName:url:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)shareeWithName:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:url:", v7, v6);

  return v8;
}

+ (id)shareeWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 externalID:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a6;
  v11 = a3;
  objc_msgSend(a1, "_urlForEmailAddress:andPhoneNumber:", a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:url:externalID:", v11, v12, v10);

  return v13;
}

+ (id)_urlForEmailAddress:(id)a3 andPhoneNumber:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v5, "stringAddingMailto");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "stringAddingTel");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  objc_msgSend(v8, "URLWithString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v11;
}

+ (id)shareeWithUUID:(id)a3 name:(id)a4 emailAddress:(id)a5 phoneNumber:(id)a6
{
  id v10;
  void *v11;

  v10 = a3;
  objc_msgSend(a1, "shareeWithName:emailAddress:phoneNumber:", a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUUID:", v10);

  return v11;
}

- (EKSharee)init
{
  EKSharee *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKSharee;
  v2 = -[EKObject init](&v5, sel_init);
  if (v2)
  {
    EKUUIDString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSharee setUUID:](v2, "setUUID:", v3);

  }
  return v2;
}

- (EKSharee)initWithName:(id)a3 url:(id)a4
{
  return -[EKSharee initWithName:url:externalID:](self, "initWithName:url:externalID:", a3, a4, 0);
}

- (EKSharee)initWithName:(id)a3 url:(id)a4 externalID:(id)a5
{
  id v8;
  id v9;
  id v10;
  EKSharee *v11;
  EKSharee *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[EKSharee init](self, "init");
  v12 = v11;
  if (v11)
  {
    -[EKSharee setName:](v11, "setName:", v8);
    objc_msgSend(v9, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSharee setAddress:](v12, "setAddress:", v13);

    -[EKSharee setExternalID:](v12, "setExternalID:", v10);
    -[EKSharee setShareeStatus:](v12, "setShareeStatus:", 5);
    -[EKSharee setShareeAccessLevel:](v12, "setShareeAccessLevel:", 2);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKSharee *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  if (objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E30901FFFFFFFFLL))
  {
    v10.receiver = self;
    v10.super_class = (Class)EKSharee;
    return -[EKObject copyWithZone:](&v10, sel_copyWithZone_, a3);
  }
  else
  {
    v5 = objc_alloc_init(EKSharee);
    if (v5)
    {
      -[EKSharee name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKSharee setName:](v5, "setName:", v6);

      -[EKSharee address](self, "address");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKSharee setAddress:](v5, "setAddress:", v7);

      -[EKSharee externalID](self, "externalID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKSharee setExternalID:](v5, "setExternalID:", v8);

      -[EKSharee setShareeStatusRaw:](v5, "setShareeStatusRaw:", -[EKSharee shareeStatusRaw](self, "shareeStatusRaw"));
      -[EKSharee setShareeAccessLevelRaw:](v5, "setShareeAccessLevelRaw:", -[EKSharee shareeAccessLevelRaw](self, "shareeAccessLevelRaw"));
    }
  }
  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKSharee UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSharee name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSharee emailAddress](self, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {UUID = %@; name = %@; email = %@; status = %lu; accessLevel = %lu;}"),
    v4,
    self,
    v5,
    v6,
    v7,
    -[EKSharee shareeStatus](self, "shareeStatus"),
    -[EKSharee shareeAccessLevel](self, "shareeAccessLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (EKCalendar)owner
{
  return (EKCalendar *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", CFSTR("owner"));
}

+ (unint64_t)_ekShareeStatusFromCalShareeStatus:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  if (a3 < 6)
    return a3;
  v5 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    +[EKSharee _ekShareeStatusFromCalShareeStatus:].cold.1(v3, v5, v6, v7, v8, v9, v10, v11);
  return 0;
}

+ (int)_calShareeStatusFromEKShareeStatus:(unint64_t)a3
{
  int result;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 < 7)
    return dword_1A244A6E4[a3];
  v5 = EKLogHandle;
  result = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR);
  if (result)
  {
    +[EKSharee _calShareeStatusFromEKShareeStatus:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);
    return 0;
  }
  return result;
}

+ (unint64_t)_ekShareeAccessLevelFromCalShareeAccessLevel:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  if (a3 < 4)
    return a3;
  v5 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    +[EKSharee _ekShareeAccessLevelFromCalShareeAccessLevel:].cold.1(v3, v5, v6, v7, v8, v9, v10, v11);
  return 0;
}

+ (int)_calShareeAccessLevelFromEKShareeAccessLevel:(unint64_t)a3
{
  unint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if (a3 >= 4)
  {
    v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      +[EKSharee _calShareeAccessLevelFromEKShareeAccessLevel:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    LODWORD(v3) = 0;
  }
  return v3;
}

- (NSString)UUID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (id)displayName
{
  void *v3;
  void *v4;
  void *v5;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B988]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKSharee firstName](self, "firstName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSharee lastName](self, "lastName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DisplayNameStringForIdentityWithProperties();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setDisplayName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B988]);
}

- (NSString)address
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B980]);
}

- (void)setAddress:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B980]);
}

- (id)URL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[EKSharee address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)emailAddress
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[EKSharee address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasMailto");

  if (v4)
  {
    -[EKSharee address](self, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringRemovingMailto");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setEmailAddress:(id)a3
{
  id v4;

  objc_msgSend(a3, "stringAddingMailto");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKSharee setAddress:](self, "setAddress:", v4);

}

- (NSString)phoneNumber
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[EKSharee address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTel");

  if (v4)
  {
    -[EKSharee address](self, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringRemovingTel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setPhoneNumber:(id)a3
{
  id v4;

  objc_msgSend(a3, "stringAddingTel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKSharee setAddress:](self, "setAddress:", v4);

}

- (NSString)firstName
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B990]);
}

- (void)setFirstName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B990]);
}

- (NSString)lastName
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B998]);
}

- (void)setLastName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B998]);
}

- (NSString)externalID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (int)shareeStatusRaw
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B9A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShareeStatusRaw:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B9A8]);

}

- (unint64_t)shareeStatus
{
  return objc_msgSend((id)objc_opt_class(), "_ekShareeStatusFromCalShareeStatus:", -[EKSharee shareeStatusRaw](self, "shareeStatusRaw"));
}

- (void)setShareeStatus:(unint64_t)a3
{
  -[EKSharee setShareeStatusRaw:](self, "setShareeStatusRaw:", objc_msgSend((id)objc_opt_class(), "_calShareeStatusFromEKShareeStatus:", a3));
}

- (int)shareeAccessLevelRaw
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B978]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setShareeAccessLevelRaw:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B978]);

}

- (unint64_t)shareeAccessLevel
{
  return objc_msgSend((id)objc_opt_class(), "_ekShareeAccessLevelFromCalShareeAccessLevel:", -[EKSharee shareeAccessLevelRaw](self, "shareeAccessLevelRaw"));
}

- (void)setShareeAccessLevel:(unint64_t)a3
{
  -[EKSharee setShareeAccessLevelRaw:](self, "setShareeAccessLevelRaw:", objc_msgSend((id)objc_opt_class(), "_calShareeAccessLevelFromEKShareeAccessLevel:", a3));
}

- (BOOL)shareeMuteRemoval
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B9A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShareeMuteRemoval:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B9A0]);

}

- (id)existingContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSharee contactPredicate](self, "contactPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "CalKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unifiedContactsMatchingPredicate:keysToFetch:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isCurrentUserForSharing
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EKSharee owner](self, "owner", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedOwnerAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[EKSharee address](self, "address");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v9, "isEqualToString:", v10);

        if ((v9 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isCurrentUserForScheduling
{
  return 0;
}

- (BOOL)isEqualToSharee:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  -[EKSharee emailAddress](self, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSharee familyEmailAddressAliases](self, "familyEmailAddressAliases");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[EKSharee familyEmailAddressAliases](self, "familyEmailAddressAliases");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v11);

    }
    -[EKSharee emailAddress](self, "emailAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[EKSharee emailAddress](self, "emailAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v13);

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "familyEmailAddressAliases");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "familyEmailAddressAliases");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v16);

    }
    objc_msgSend(v4, "emailAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v4, "emailAddress");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v18);

    }
    v8 = objc_msgSend(v9, "intersectsSet:", v14);

  }
  return v8;
}

+ (unint64_t)statusEnumFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("invite-accepted")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("invite-declined")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("invite-deleted")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("invite-invalid")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("invite-noresponse")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)statusStringFromEnum:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return off_1E4787BC8[a3 - 1];
}

- (NSArray)familyEmailAddressAliases
{
  return self->_familyEmailAddressAliases;
}

- (void)setFamilyEmailAddressAliases:(id)a3
{
  objc_storeStrong((id *)&self->_familyEmailAddressAliases, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyEmailAddressAliases, 0);
}

+ (void)_ekShareeStatusFromCalShareeStatus:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Unexpected CalShareeStatus: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)_calShareeStatusFromEKShareeStatus:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Unexpected EKShareeStatus: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)_ekShareeAccessLevelFromCalShareeAccessLevel:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Unexpected CalShareeAccessLevel: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)_calShareeAccessLevelFromEKShareeAccessLevel:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Unexpected EKShareeAccessLevel: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
