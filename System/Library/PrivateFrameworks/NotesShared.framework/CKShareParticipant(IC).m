@implementation CKShareParticipant(IC)

+ (id)ic_mentionableNamesCache
{
  if (ic_mentionableNamesCache_token != -1)
    dispatch_once(&ic_mentionableNamesCache_token, &__block_literal_global_50);
  return (id)ic_mentionableNamesCache_sMentionableNamesCache;
}

- (id)ic_participantName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "userIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "ic_localizedNameWithDefaultFormattingStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_trimmedString");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      if (v5)
        goto LABEL_10;
    }
    else
    {

    }
  }
  objc_msgSend(a1, "ic_emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    v5 = v6;
  else
    v5 = 0;

LABEL_10:
  return v5;
}

- (id)ic_shortParticipantName
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "userIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "nameComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v2, 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_trimmedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v5 = v4;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)ic_emailAddress
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "userIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lookupInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_trimmedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)ic_phoneNumber
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "userIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lookupInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_trimmedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (id)ic_participantFallbackNameForUserRecordName:()IC note:
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  const __CFString *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(a4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userRecordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "ic_isCaseInsensitiveEqualToString:", v7);

  if ((v8 & 1) != 0)
    v9 = CFSTR("Me");
  else
    v9 = CFSTR("Somebody");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v9, v9, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ic_participantNameOrFallbackForUserRecordName:()IC note:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "participantForUserID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_participantName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C95130], "ic_participantFallbackNameForUserRecordName:note:", v5, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (id)ic_shortParticipantNameOrFallbackForUserRecordName:()IC note:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "participantForUserID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_shortParticipantName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C95130], "ic_participantFallbackNameForUserRecordName:note:", v5, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (id)ic_displayableNames:()IC maximumNamesCount:
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ic_participantsWithDisplayableNames:maximumNamesCount:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_compactMap:", &__block_literal_global_18);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)ic_participantsWithDisplayableNames:()IC maximumNamesCount:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
      if (objc_msgSend(v6, "count", (_QWORD)v16) >= a4)
        break;
      if ((objc_msgSend(v12, "isCurrentUser") & 1) == 0)
      {
        objc_msgSend(v12, "ic_participantName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v6, "ic_addNonNilObject:", v12);
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  v14 = (void *)objc_msgSend(v6, "copy");
  return v14;
}

+ (uint64_t)ic_nonCurrentUserParticipants:()IC
{
  return objc_msgSend(a3, "ic_objectsPassingTest:", &__block_literal_global_48);
}

+ (uint64_t)ic_mentionTokensPerParticipant
{
  return 4;
}

- (id)ic_mentionTokens
{
  void *v2;
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
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend((id)objc_opt_class(), "ic_mentionTokensPerParticipant"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_tokenSafeText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "ic_addNonEmptyString:", v6);
  objc_msgSend(a1, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nameComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_tokenSafeText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "ic_addNonEmptyString:", v10);
  objc_msgSend(a1, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nameComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v12, 4, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "ic_containsWhitespaceCharacters") & 1) == 0)
    {
      objc_msgSend(v13, "ic_tokenSafeText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "ic_addNonEmptyString:", v14);

    }
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v12, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "ic_tokenSafeText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ic_addNonEmptyString:", v16);

  }
  v17 = (void *)objc_msgSend(v2, "copy");

  return v17;
}

- (id)ic_mentionTokensFromContacts
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ic_mentionableNamesFromContacts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_compactMap:", &__block_literal_global_53);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ic_mentionableNamesFromContacts
{
  void *v2;
  ICShareParticipantCacheEntry *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  ICShareParticipantCacheEntry *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  id obj;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  id v60;
  uint8_t v61[128];
  uint8_t buf[4];
  id v63;
  _QWORD v64[9];

  v64[6] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "![NSThread isMainThread]", "-[CKShareParticipant(IC) ic_mentionableNamesFromContacts]", 1, 0, CFSTR("Unexpected call from main thread"));
  objc_msgSend((id)objc_opt_class(), "ic_mentionableNamesCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", a1);
  v3 = (ICShareParticipantCacheEntry *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v3 = objc_alloc_init(ICShareParticipantCacheEntry);
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(a1, "ic_emailAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v8 = *MEMORY[0x1E0C966D0];
    v64[0] = *MEMORY[0x1E0C96898];
    v64[1] = v8;
    v9 = *MEMORY[0x1E0C967A0];
    v64[2] = *MEMORY[0x1E0C966C0];
    v64[3] = v9;
    v10 = *MEMORY[0x1E0C967C0];
    v64[4] = *MEMORY[0x1E0C967B8];
    v64[5] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 6);
    v11 = objc_claimAutoreleasedReturnValue();
    v48 = v7;
    v49 = a1;
    v46 = v6;
    v47 = (void *)v11;
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0;
      objc_msgSend(v7, "unifiedContactsMatchingPredicate:keysToFetch:error:", v12, v11, &v60);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v60;
      if (v50)
      {
        v14 = os_log_create("com.apple.notes", "Mentions");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v50;
          _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "Error fetching contacts via email: %@", buf, 0xCu);
        }

      }
      a1 = v49;
    }
    else
    {
      v50 = 0;
      v13 = 0;
    }
    if (!objc_msgSend(v13, "count"))
    {
      objc_msgSend(a1, "ic_phoneNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        v16 = (void *)MEMORY[0x1E0C97200];
        objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "predicateForContactsMatchingPhoneNumber:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = v50;
        objc_msgSend(v48, "unifiedContactsMatchingPredicate:keysToFetch:error:", v18, v47, &v59);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v59;

        if (v20)
        {
          v21 = os_log_create("com.apple.notes", "Mentions");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v63 = v20;
            _os_log_impl(&dword_1BD918000, v21, OS_LOG_TYPE_INFO, "Error fetching contacts via phone number: %@", buf, 0xCu);
          }

        }
        v13 = (void *)v19;
        v50 = v20;
      }

    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v13;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (!v22)
    {
LABEL_46:

      objc_msgSend((id)objc_opt_class(), "ic_mentionableNamesCache");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setObject:forKey:", v3, v49);

      v4 = (void *)objc_msgSend(v5, "copy");
      goto LABEL_47;
    }
    v23 = v22;
    v24 = *(_QWORD *)v56;
    v25 = 0x1E0CB3000uLL;
    v51 = *(_QWORD *)v56;
LABEL_23:
    v26 = 0;
    v52 = v23;
    while (1)
    {
      if (*(_QWORD *)v56 != v24)
        objc_enumerationMutation(obj);
      v27 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v26);
      v28 = objc_msgSend(v27, "contactType");
      if (v28 == 1)
        break;
      if (!v28)
      {
        objc_msgSend(v27, "givenName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "ic_trimmedString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v30, "length"))
        {
          objc_msgSend(v5, "addObject:", v30);
          -[ICShareParticipantCacheEntry setGivenName:](v3, "setGivenName:", v30);
        }
        objc_msgSend(v27, "familyName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "ic_trimmedString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v32, "length"))
        {
          objc_msgSend(v5, "addObject:", v32);
          -[ICShareParticipantCacheEntry setFamilyName:](v3, "setFamilyName:", v32);
        }
        objc_msgSend(v27, "nickname");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "ic_trimmedString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v34, "length"))
        {
          objc_msgSend(v5, "addObject:", v34);
          -[ICShareParticipantCacheEntry setNickname:](v3, "setNickname:", v34);
        }
        v54 = v34;
        v35 = objc_alloc_init(MEMORY[0x1E0CB3850]);
        objc_msgSend(v35, "setGivenName:", v30);
        objc_msgSend(v35, "setFamilyName:", v32);
        objc_msgSend(v35, "ic_localizedNameWithDefaultFormattingStyle");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "ic_trimmedString");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v37, "length"))
        {
          objc_msgSend(v5, "addObject:", v37);
          -[ICShareParticipantCacheEntry setDisplayName:](v3, "setDisplayName:", v37);
        }
        objc_msgSend(*(id *)(v25 + 2136), "localizedStringFromPersonNameComponents:style:options:", v35, 4, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v38, "length"))
        {
          objc_msgSend(v5, "addObject:", v38);
          -[ICShareParticipantCacheEntry setInitials:](v3, "setInitials:", v38);
        }
        v39 = v5;
        objc_msgSend(*(id *)(v25 + 2136), "localizedStringFromPersonNameComponents:style:options:", v35, 1, 0);
        v40 = v3;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "ic_trimmedString");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = v40;
        if (objc_msgSend(v42, "length"))
          -[ICShareParticipantCacheEntry setActivityStreamDisplayName:](v40, "setActivityStreamDisplayName:", v42);

        v5 = v39;
        v24 = v51;
        v23 = v52;
        v25 = 0x1E0CB3000;
LABEL_43:

      }
      if (v23 == ++v26)
      {
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
        if (!v23)
          goto LABEL_46;
        goto LABEL_23;
      }
    }
    objc_msgSend(v27, "organizationName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "ic_trimmedString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v30, "length"))
    {
      objc_msgSend(v5, "addObject:", v30);
      -[ICShareParticipantCacheEntry setDisplayName:](v3, "setDisplayName:", v30);
    }
    goto LABEL_43;
  }
  -[ICShareParticipantCacheEntry names](v3, "names");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((names) != nil)", "-[CKShareParticipant(IC) ic_mentionableNamesFromContacts]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "names");
LABEL_47:

  return v4;
}

- (id)ic_cachedDisplayNameFromContacts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "ic_mentionableNamesCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ic_participantNameMatchingString:()IC returnFullName:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void (**v25)(void *, void *);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void (**v55)(void *, void *);
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void (**v61)(void *, void *, void *, void *, void *);
  void *v63;
  _QWORD v64[4];
  id v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD aBlock[4];
  id v72;
  uint64_t *v73;
  char v74;
  uint64_t v75;
  id *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;

  v5 = a3;
  v75 = 0;
  v76 = (id *)&v75;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__11;
  v79 = __Block_byref_object_dispose__11;
  v80 = 0;
  objc_msgSend((id)objc_opt_class(), "ic_mentionableNamesCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ic_tokenSafeText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(a1, "userIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nameComponents");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "userIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nameComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "givenName");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "userIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nameComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "familyName");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = (void *)v10;
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v10, 0, 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__CKShareParticipant_IC__ic_participantNameMatchingString_returnFullName___block_invoke;
    aBlock[3] = &unk_1E76C96B8;
    v15 = v8;
    v74 = a4;
    v72 = v15;
    v73 = &v75;
    v61 = (void (**)(void *, void *, void *, void *, void *))_Block_copy(aBlock);
    if (v7)
    {
      v16 = v8;
      v17 = v5;
      objc_msgSend(v7, "initials");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "givenName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "familyName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v61[2](v61, v18, v19, v20, v21);

      v5 = v17;
      v8 = v16;
    }
    if (!v76[5])
    {
      objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v58, 4, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v61[2](v61, v22, v60, v59, v63);

      if (!v76[5])
      {
        v57 = v8;
        v67 = 0;
        v68 = &v67;
        v69 = 0x2020000000;
        v70 = 0;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v5;
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __74__CKShareParticipant_IC__ic_participantNameMatchingString_returnFullName___block_invoke_2;
        v64[3] = &unk_1E76C96E0;
        v24 = v23;
        v65 = v24;
        v66 = &v67;
        v25 = (void (**)(void *, void *))_Block_copy(v64);
        objc_msgSend(v7, "givenName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2](v25, v26);

        objc_msgSend(v7, "familyName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2](v25, v27);

        objc_msgSend(v7, "nickname");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2](v25, v28);

        objc_msgSend(v7, "displayName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2](v25, v29);

        objc_msgSend(v24, "ic_addNonNilObject:", v60);
        objc_msgSend(a1, "userIdentity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "nameComponents");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "familyName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "ic_addNonNilObject:", v32);

        objc_msgSend(v24, "ic_addNonNilObject:", v63);
        v55 = v25;
        v33 = 0;
        v34 = 0;
        while (v33 < objc_msgSend(v24, "count"))
        {
          if (v33 >= v68[3])
          {
            v35 = v63;
          }
          else
          {
            objc_msgSend(v7, "displayName");
            v35 = (id)objc_claimAutoreleasedReturnValue();
          }
          v36 = v35;
          objc_msgSend(v24, "objectAtIndexedSubscript:", v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "ic_tokenSafeText");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isEqualToString:", v15);

          if ((v39 & 1) != 0)
          {
            if (a4)
              v43 = v36;
            else
              v43 = v37;
            objc_storeStrong(v76 + 5, v43);

            break;
          }
          if (!v34)
          {
            objc_msgSend(v37, "ic_tokenSafeText");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "hasPrefix:", v15);

            if (v41)
            {
              if (a4)
                v42 = v36;
              else
                v42 = v37;
              v34 = v42;
            }
            else
            {
              v34 = 0;
            }
          }

          ++v33;
        }
        if (!v76[5])
          objc_storeStrong(v76 + 5, v34);

        _Block_object_dispose(&v67, 8);
        v5 = v56;
        v8 = v57;
      }
    }

  }
  v44 = v76[5];
  if (!v44 || !objc_msgSend(v44, "length"))
  {
    objc_msgSend(a1, "ic_shortParticipantName");
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = v76[5];
    v76[5] = (id)v45;

    objc_msgSend(v7, "givenName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "length");

    if (v48)
    {
      v49 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "givenName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "familyName");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "ic_shortNameFromGivenName:familyName:", v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v52, "length"))
        objc_storeStrong(v76 + 5, v52);

    }
  }
  v53 = v76[5];

  _Block_object_dispose(&v75, 8);
  return v53;
}

- (id)ic_activityStreamDisplayName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "ic_mentionableNamesCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "activityStreamDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "ic_shortParticipantName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Somebody"), CFSTR("Somebody"), 0, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v10;

  }
  return v7;
}

- (id)ic_userRecordNameInNote:()IC
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userRecordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C94730]))
  {
    objc_msgSend(v4, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userRecordName");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

@end
