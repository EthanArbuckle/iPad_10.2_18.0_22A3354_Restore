@implementation SGSqlEntityStoreCNContactMatcherHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicks, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

id __65__SGSqlEntityStoreCNContactMatcherHelper_prefilterNameMatchTerms__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "lengthOfBytesUsingEncoding:", 4))
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\"\"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("\"%@\"), v4);

  }
  else
  {
    objc_msgSend(v2, "dataUsingEncoding:", 2483028224);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "bytes");
      objc_msgSend(v6, "length");
      _PASBytesToHex();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v11 = v8;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "dropping query token that cannot be encoded as utf-8 (utf-16 LE repr: %{private}@)", buf, 0xCu);

    }
    v5 = 0;
  }

  return v5;
}

- (BOOL)isMe
{
  void *v3;
  void *v4;

  +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGCuratedContactMatcher fetchMeContactFromContactStore:](SGCuratedContactMatcher, "fetchMeContactFromContactStore:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isSameAsOrUnifiedWithContact:", self->_contact);

  return (char)self;
}

id __51__SGSqlEntityStoreCNContactMatcherHelper_emailTags__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D197F0];
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeEmailAddress();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactDetail:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53__SGSqlEntityStoreCNContactMatcherHelper_addressTags__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeCNAddress(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D197F0], "contactDetail:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __51__SGSqlEntityStoreCNContactMatcherHelper_phoneTags__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SGDataDetectorsScanForPhoneLessCarefully(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizePhoneNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D197F0], "contactDetail:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __53__SGSqlEntityStoreCNContactMatcherHelper_addressTags__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "street");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v2, "street"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v5,
        v7))
  {
    objc_msgSend(v2, "street");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStreet:", v8);

  }
  else
  {
    objc_msgSend(v3, "setStreet:", CFSTR("#NOSTREET#"));
  }
  objc_msgSend(v2, "city");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        objc_msgSend(v2, "city"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "length"),
        v11,
        v10,
        v12))
  {
    objc_msgSend(v2, "city");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCity:", v13);

  }
  else
  {
    objc_msgSend(v3, "setCity:", CFSTR("#NOCITY#"));
  }

  return v3;
}

- (NSString)prefilterNameMatchTerms
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSSet *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *context;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1C3BD4F6C](self, a2);
  v3 = (void *)objc_opt_new();
  -[CNContact familyName](self->_contact, "familyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[CNContact familyName](self->_contact, "familyName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGTokenizer ftsTokenize:](SGTokenizer, "ftsTokenize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObjectsFromArray:", v7);
    -[CNContact familyName](self->_contact, "familyName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9 == 1)
    {
      sgMap();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v10);

    }
  }
  -[CNContact givenName](self->_contact, "givenName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[CNContact givenName](self->_contact, "givenName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGTokenizer ftsTokenize:](SGTokenizer, "ftsTokenize:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObjectsFromArray:", v14);
    -[CNContact givenName](self->_contact, "givenName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (v16 == 1)
    {
      sgMap();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v17);

    }
  }
  -[CNContact middleName](self->_contact, "middleName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    -[CNContact middleName](self->_contact, "middleName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGTokenizer ftsTokenize:](SGTokenizer, "ftsTokenize:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v21);

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = self->_nicks;
  v23 = -[NSSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v28 = (void *)MEMORY[0x1C3BD4F6C]();
        if (objc_msgSend(v27, "length"))
        {
          +[SGTokenizer ftsTokenize:](SGTokenizer, "ftsTokenize:", v27);
          v29 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v29);
        }
        else
        {
          sgLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            -[CNContact givenName](self->_contact, "givenName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v41 = v30;
            _os_log_impl(&dword_1C3607000, v29, OS_LOG_TYPE_DEFAULT, "empty string found in nickname data for: %@", buf, 0xCu);

          }
        }

        objc_autoreleasePoolPop(v28);
      }
      v24 = -[NSSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v24);
  }

  objc_msgSend(v3, "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_pas_mappedArrayWithTransform:", &__block_literal_global_5_20273);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "_pas_componentsJoinedByString:", CFSTR(" OR "));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return (NSString *)v33;
}

- (SGSqlEntityStoreCNContactMatcherHelper)initWithCNContact:(id)a3
{
  id v5;
  SGSqlEntityStoreCNContactMatcherHelper *v6;
  SGSqlEntityStoreCNContactMatcherHelper *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *nicks;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SGSqlEntityStoreCNContactMatcherHelper;
  v6 = -[SGSqlEntityStoreCNContactMatcherHelper init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    objc_msgSend(v5, "givenName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      objc_msgSend(v5, "givenName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SGNicknames nicknamesForName:](SGNicknames, "nicknamesForName:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      nicks = v7->_nicks;
      v7->_nicks = (NSSet *)v11;

    }
  }

  return v7;
}

- (NSString)interactionContactIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D197F0];
  -[CNContact identifier](self->_contact, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactionContactIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSArray)socialProfileTags
{
  void *v2;
  void *v3;

  -[CNContact socialProfiles](self->_contact, "socialProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_28_20255);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)phoneTags
{
  void *v2;
  void *v3;

  -[CNContact phoneNumbers](self->_contact, "phoneNumbers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_27);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)emailTags
{
  void *v2;
  void *v3;

  -[CNContact emailAddresses](self->_contact, "emailAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)addressTags
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  -[CNContact postalAddresses](self->_contact, "postalAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SGSqlEntityStoreCNContactMatcherHelper_addressTags__block_invoke_2;
  v5[3] = &unk_1E7DAF630;
  v6 = &__block_literal_global_31_20247;
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)weakNamePatterns
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *context;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1C3BD4F6C](self, a2);
  v44 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v3 = self->_nicks;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v46 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1C3BD4F6C]();
        if (objc_msgSend(v8, "length"))
        {
          v10 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[CNContact familyName](self->_contact, "familyName");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@%%%@%%"), v8, v11);
          objc_msgSend(v44, "addObject:", v12);
        }
        else
        {
          sgLogHandle();
          v11 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            goto LABEL_11;
          -[CNContact givenName](self->_contact, "givenName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v50 = v12;
          _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "empty string found in nickname data for: %@", buf, 0xCu);
        }

LABEL_11:
        objc_autoreleasePoolPop(v9);
      }
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v5);
  }

  -[CNContact familyName](self->_contact, "familyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    -[CNContact givenName](self->_contact, "givenName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      v16 = (void *)MEMORY[0x1C3BD4F6C]();
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[CNContact givenName](self->_contact, "givenName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContact familyName](self->_contact, "familyName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@%%%@"), v18, v19);
      objc_msgSend(v44, "addObject:", v20);

      v21 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[CNContact familyName](self->_contact, "familyName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContact givenName](self->_contact, "givenName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@%%%@"), v22, v23);
      objc_msgSend(v44, "addObject:", v24);

      -[CNContact givenName](self->_contact, "givenName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "substringToIndex:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[CNContact familyName](self->_contact, "familyName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("%@ %@"), v26, v28);
      objc_msgSend(v44, "addObject:", v29);

      v30 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[CNContact familyName](self->_contact, "familyName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("%@. %@"), v26, v31);
      objc_msgSend(v44, "addObject:", v32);

      objc_autoreleasePoolPop(v16);
    }
  }
  else
  {

  }
  -[CNContact givenName](self->_contact, "givenName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "length"))
  {
    -[CNContact middleName](self->_contact, "middleName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "length");

    if (v35)
    {
      v36 = (void *)MEMORY[0x1C3BD4F6C]();
      v37 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[CNContact givenName](self->_contact, "givenName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContact middleName](self->_contact, "middleName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("%@%%%@"), v38, v39);
      objc_msgSend(v44, "addObject:", v40);

      objc_autoreleasePoolPop(v36);
    }
  }
  else
  {

  }
  v41 = (void *)objc_msgSend(v44, "copy");

  objc_autoreleasePoolPop(context);
  return (NSArray *)v41;
}

- (NSArray)strongNamePatterns
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v31 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v3 = self->_nicks;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1C3BD4F6C]();
        if (objc_msgSend(v8, "length"))
        {
          v10 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[CNContact familyName](self->_contact, "familyName");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@ %@"), v8, v11);
          objc_msgSend(v31, "addObject:", v12);
        }
        else
        {
          sgLogHandle();
          v11 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            goto LABEL_11;
          -[CNContact givenName](self->_contact, "givenName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v37 = v12;
          _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "empty string found in nickname data for: %@", buf, 0xCu);
        }

LABEL_11:
        objc_autoreleasePoolPop(v9);
      }
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v5);
  }

  -[CNContact familyName](self->_contact, "familyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    -[CNContact givenName](self->_contact, "givenName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      v16 = (void *)MEMORY[0x1C3BD4F6C]();
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[CNContact givenName](self->_contact, "givenName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContact familyName](self->_contact, "familyName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@ %@"), v18, v19);
      objc_msgSend(v31, "addObject:", v20);

      objc_autoreleasePoolPop(v16);
    }
  }
  else
  {

  }
  -[CNContact givenName](self->_contact, "givenName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "length"))
  {
    -[CNContact middleName](self->_contact, "middleName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (v23)
    {
      v24 = (void *)MEMORY[0x1C3BD4F6C]();
      v25 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[CNContact givenName](self->_contact, "givenName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContact middleName](self->_contact, "middleName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("%@ %@"), v26, v27);
      objc_msgSend(v31, "addObject:", v28);

      objc_autoreleasePoolPop(v24);
    }
  }
  else
  {

  }
  objc_msgSend(v31, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v29;
}

id __59__SGSqlEntityStoreCNContactMatcherHelper_socialProfileTags__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SGSocialProfileDetails *v3;
  void *v4;
  SGSocialProfileDetails *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  v3 = [SGSocialProfileDetails alloc];
  objc_msgSend(v2, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SGSocialProfileDetails initWithCNSocialProfile:](v3, "initWithCNSocialProfile:", v4);
  v6 = (void *)MEMORY[0x1E0D197F0];
  -[SGSocialProfileDetails preferredUniqueIdentifier](v5, "preferredUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeSocialProfile(v7);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactDetail:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __65__SGSqlEntityStoreCNContactMatcherHelper_prefilterNameMatchTerms__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("*"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);

  return v4;
}

@end
