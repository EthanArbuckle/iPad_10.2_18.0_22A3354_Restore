@implementation EKParticipant

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;

  -[EKParticipant displayNameRaw](self, "displayNameRaw");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKParticipant firstName](self, "firstName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKParticipant lastName](self, "lastName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DisplayNameStringForIdentityWithProperties();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (id)displayNameRaw
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B868]);
}

- (NSString)lastName
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B888]);
}

- (NSString)firstName
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B878]);
}

- (NSString)emailAddress
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B870]);
}

- (NSString)phoneNumber
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B890]);
}

- (NSString)inviterNameString
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B880]);
}

- (NSString)comment
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B858]);
}

- (NSURL)URL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[EKParticipant URLString](self, "URLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[EKParticipant emailAddress](self, "emailAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0C99E98];
      -[EKParticipant emailAddress](self, "emailAddress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringAddingMailto");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EKParticipant phoneNumber](self, "phoneNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
LABEL_8:
        objc_msgSend(MEMORY[0x1E0C99E98], "URLForNoMail");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      v6 = (void *)MEMORY[0x1E0C99E98];
      -[EKParticipant phoneNumber](self, "phoneNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringAddingTel");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v8;
    objc_msgSend(v6, "URLWithString:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_8;
  }
LABEL_9:

  return (NSURL *)v4;
}

- (id)URLString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B850]);
}

+ (EKParticipant)participantWithName:(id)a3 url:(id)a4
{
  return (EKParticipant *)objc_msgSend(a1, "participantWithName:emailAddress:phoneNumber:url:", a3, 0, 0, a4);
}

+ (EKParticipant)participantWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 url:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:emailAddress:phoneNumber:url:", v13, v12, v11, v10);

  return (EKParticipant *)v14;
}

- (EKParticipant)initWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 url:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  EKParticipant *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[EKObject init](self, "init");
  if (!v14)
    goto LABEL_19;
  EKUUIDString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKParticipant setUUID:](v14, "setUUID:", v15);

  v16 = (void *)objc_msgSend(v10, "copy");
  -[EKParticipant setDisplayNameRaw:](v14, "setDisplayNameRaw:", v16);

  if (v13)
  {
    v17 = (void *)objc_msgSend(v13, "copy");
    -[EKParticipant setURL:](v14, "setURL:", v17);
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v11, "length"))
  {
    v18 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v11, "stringAddingMailto");
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v17 = (void *)v19;
    objc_msgSend(v18, "URLWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKParticipant setURL:](v14, "setURL:", v20);

    goto LABEL_9;
  }
  if (objc_msgSend(v12, "length"))
  {
    v18 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v12, "stringAddingTel");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_10:
  if (v11)
  {
    -[EKParticipant setEmailAddress:](v14, "setEmailAddress:", v11);
  }
  else if (objc_msgSend(v13, "cal_hasSchemeMailto"))
  {
    objc_msgSend(v13, "cal_resourceSpecifierNoLeadingSlashes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKParticipant setEmailAddress:](v14, "setEmailAddress:", v21);

  }
  if (v12)
  {
    -[EKParticipant setPhoneNumber:](v14, "setPhoneNumber:", v12);
  }
  else if (objc_msgSend(v13, "cal_hasSchemeTel"))
  {
    objc_msgSend(v13, "cal_resourceSpecifierNoLeadingSlashes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKParticipant setPhoneNumber:](v14, "setPhoneNumber:", v22);

  }
  -[EKObject updatePersistentValueForKeyIfNeeded:](v14, "updatePersistentValueForKeyIfNeeded:", *MEMORY[0x1E0D0B820]);
LABEL_19:

  return v14;
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_4 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_4, &__block_literal_global_30);
  return (id)knownIdentityKeysForComparison_keys_4;
}

void __47__EKParticipant_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B820];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownIdentityKeysForComparison_keys_4;
  knownIdentityKeysForComparison_keys_4 = v0;

}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_2 != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_2, &__block_literal_global_7_0);
  return (id)knownSingleValueKeysForComparison_keys_2;
}

void __50__EKParticipant_knownSingleValueKeysForComparison__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B858];
  v6[0] = *MEMORY[0x1E0D0B850];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0D0B868];
  v6[2] = *MEMORY[0x1E0D0B860];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0D0B878];
  v6[4] = *MEMORY[0x1E0D0B870];
  v6[5] = v2;
  v3 = *MEMORY[0x1E0D0B890];
  v6[6] = *MEMORY[0x1E0D0B888];
  v6[7] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)knownSingleValueKeysForComparison_keys_2;
  knownSingleValueKeysForComparison_keys_2 = v4;

}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_1 != -1)
    dispatch_once(&knownRelationshipWeakKeys_onceToken_1, &__block_literal_global_8_0);
  return (id)knownRelationshipWeakKeys_keys_1;
}

void __42__EKParticipant_knownRelationshipWeakKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B830];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownRelationshipWeakKeys_keys_1;
  knownRelationshipWeakKeys_keys_1 = v0;

}

- (NSString)UUID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (id)nameUsingAddressAsBackup
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[EKParticipant name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[EKParticipant emailAddress](self, "emailAddress");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (!objc_msgSend(v3, "length"))
  {
    -[EKParticipant phoneNumber](self, "phoneNumber");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if (!objc_msgSend(v3, "length"))
  {
    -[EKParticipant URL](self, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

- (void)setDisplayNameRaw:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B868]);
}

- (void)setEmailAddress:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B870]);
}

- (void)setPhoneNumber:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B890]);
}

- (void)setFirstName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B878]);
}

- (void)setLastName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B888]);
}

- (EKParticipantType)participantType
{
  return 0;
}

- (EKParticipantStatus)participantStatus
{
  return 0;
}

- (BOOL)needsResponse
{
  return objc_msgSend((id)objc_opt_class(), "needsResponseForParticipantStatus:", -[EKParticipant participantStatus](self, "participantStatus"));
}

+ (BOOL)needsResponseForParticipantStatus:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (EKParticipantRole)participantRole
{
  return 0;
}

- (void)setComment:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B858]);
}

- (NSDate)commentLastModifiedDate
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B860]);
}

- (BOOL)isCurrentUser
{
  return 0;
}

- (void)setURLString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B850]);
}

- (void)setURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKParticipant setURLString:](self, "setURLString:", v4);

}

- (BOOL)scheduleForceSend
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B8A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setScheduleForceSend:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B8A8]);

}

- (BOOL)isEqualToParticipant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[EKParticipant URLString](self, "URLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKParticipant emailAddress](self, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKParticipant phoneNumber](self, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "doesParticipantURLString:email:andPhoneNumber:matchParticipantURLString:email:andPhoneNumber:", v6, v7, v8, v9, v10, v11);
  return (char)v4;
}

+ (BOOL)doesParticipantURLString:(id)a3 email:(id)a4 andPhoneNumber:(id)a5 matchParticipantURLString:(id)a6 email:(id)a7 andPhoneNumber:(id)a8
{
  return doURLsEmailsPhoneNumbersMatch();
}

+ (BOOL)canonicalizedEqualityTestValue1:(id)a3 value2:(id)a4 key:(id)a5 object1:(id)a6 object2:(id)a7
{
  unint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  unsigned __int8 v17;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v12 = (unint64_t)a3;
  v13 = (unint64_t)a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D0B850]))
  {
    if (v12 | v13 && (objc_msgSend((id)v12, "isEqual:", v13) & 1) == 0)
    {
      if ((v12 == 0) != (v13 == 0))
      {
        v17 = 0;
      }
      else
      {
        v19 = v16;
        v20 = v15;
        v26 = (void *)objc_opt_class();
        objc_msgSend(v20, "emailAddress");
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "phoneNumber");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "emailAddress");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "phoneNumber");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)v21;
        v17 = objc_msgSend(v26, "doesParticipantURLString:email:andPhoneNumber:matchParticipantURLString:email:andPhoneNumber:", v12, v21, v22, v13, v23, v24);

      }
    }
    else
    {
      v17 = 1;
    }
  }
  else
  {
    v27.receiver = a1;
    v27.super_class = (Class)&OBJC_METACLASS___EKParticipant;
    v17 = objc_msgSendSuper2(&v27, sel_canonicalizedEqualityTestValue1_value2_key_object1_object2_, v12, v13, v14, v15, v16);
  }

  return v17;
}

- (id)nameComponents
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D0C360];
  -[EKParticipant name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personNameComponentsFromString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)displayString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[EKParticipant emailAddress](self, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "resemblesEmailAddress") & 1) == 0)
  {

    v3 = 0;
  }
  -[EKParticipant name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKParticipant URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (!v5)
    {
      v6 = 0;
      goto LABEL_9;
    }
    v9 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend(v5, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithString:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" <%@>"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v7);
LABEL_6:

  }
LABEL_9:

  return v6;
}

- (ABRecordRef)ABRecordWithAddressBook:(ABAddressBookRef)addressBook
{
  const void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  if (!addressBook)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  CalendarFoundationPerformBlockOnSharedContactStore();
  v3 = (const void *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __41__EKParticipant_ABRecordWithAddressBook___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-[CNContact predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, MEMORY[0x1E0C9AA60], 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "publicABPersonFromContact:publicAddressBook:", v11, &v12);

  }
}

- (BOOL)isLocationRoom
{
  char isKindOfClass;

  if (-[EKParticipant participantRole](self, "participantRole") == EKParticipantRoleChair
    || -[EKParticipant participantType](self, "participantType") != EKParticipantTypeRoom)
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)setInviterNameString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B880]);
}

- (id)newContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C97200];
  -[EKParticipant name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKParticipant emailAddress](self, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactWithDisplayName:emailOrPhoneNumber:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  -[EKParticipant contactPredicate](self, "contactPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "CalKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unifiedContactsMatchingPredicate:keysToFetch:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)scheduleStatus
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B8B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)isCurrentUserForSharing
{
  return 0;
}

- (BOOL)isCurrentUserForScheduling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[EKParticipant owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selfAttendee");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKParticipant URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  return v9;
}

- (id)generateSemanticIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  -[EKParticipant emailAddress](self, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[EKParticipant phoneNumber](self, "phoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      -[EKParticipant URL](self, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "absoluteString");
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[EKParticipant name](self, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v5 = v10;
        }
        else
        {
          -[EKParticipant firstName](self, "firstName");
          v12 = objc_claimAutoreleasedReturnValue();
          -[EKParticipant lastName](self, "lastName");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v12 | v13)
          {
            objc_msgSend(MEMORY[0x1E0CB37A0], "string");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v12)
              objc_msgSend(v14, "appendFormat:", CFSTR("FIRST=%@;"), v12);
            if (v13)
              objc_msgSend(v15, "appendFormat:", CFSTR("LAST=%@;"), v13);
            v5 = (id)objc_msgSend(v15, "copy");

          }
          else
          {
            v5 = 0;
          }

        }
      }

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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKParticipant name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(name = %@)"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)specialComparisonBlocks
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", &__block_literal_global_28, *MEMORY[0x1E0D0B248]);
}

uint64_t __40__EKParticipant_specialComparisonBlocks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "participantStatus");
  if (v6 == objc_msgSend(v5, "participantStatus"))
  {
    v7 = 1;
  }
  else if (objc_msgSend(v4, "needsResponse"))
  {
    v7 = objc_msgSend(v5, "needsResponse");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (EKCalendarItem)owner
{
  return self->_owner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owner, 0);
}

- (NSPredicate)contactPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  -[EKParticipant emailAddress](self, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C97200];
    -[EKParticipant emailAddress](self, "emailAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-[CNContact predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:", 0, v5, 0, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKParticipant phoneNumber](self, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C97200];
    if (!v8)
    {
      -[EKParticipant name](self, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKParticipant emailAddress](self, "emailAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-[CNContact predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:", v5, v6, 0, v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    v10 = (void *)MEMORY[0x1E0C97398];
    -[EKParticipant phoneNumber](self, "phoneNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "phoneNumberWithStringValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateForContactsMatchingPhoneNumber:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v7;
LABEL_6:

  return (NSPredicate *)v11;
}

@end
