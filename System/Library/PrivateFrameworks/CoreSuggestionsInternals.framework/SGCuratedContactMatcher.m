@implementation SGCuratedContactMatcher

+ (id)fetchMeContactFromContactStore:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  SGMeContact *v11;
  void *v12;
  id v14;
  _QWORD block[5];

  v4 = a3;
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SGCuratedContactMatcher_fetchMeContactFromContactStore___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (fetchMeContactFromContactStore__onceToken != -1)
      dispatch_once(&fetchMeContactFromContactStore__onceToken, block);
    v5 = a1;
    objc_sync_enter(v5);
    if (_meContact)
    {
      v6 = (id)_meContact;
      objc_sync_exit(v5);
      v7 = v5;
    }
    else
    {
      objc_sync_exit(v5);

      +[SGMeContact keysToFetch](SGMeContact, "keysToFetch");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      +[SGContactsInterface unifiedMeContactWithKeysToFetch:usingContactStore:error:](SGContactsInterface, "unifiedMeContactWithKeysToFetch:usingContactStore:error:", v8, v4, &v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v14;

      v6 = 0;
      if (v9 && !v7)
      {
        v10 = v5;
        objc_sync_enter(v10);
        v11 = -[SGMeContact initWithContact:]([SGMeContact alloc], "initWithContact:", v9);
        v12 = (void *)_meContact;
        _meContact = (uint64_t)v11;

        v6 = (id)_meContact;
        objc_sync_exit(v10);

      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)clearMeContactCache
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)_meContact;
  _meContact = 0;

  objc_sync_exit(obj);
}

+ (BOOL)_isMeContact:(id)a3 withContactStore:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  SGSocialProfileDetails *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  const char *v50;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = 0;
  if (v6 && a4)
  {
    objc_msgSend(a1, "fetchMeContactFromContactStore:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v7 = 0;
LABEL_47:

      goto LABEL_48;
    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v54 = v6;
    objc_msgSend(v6, "emailAddresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v68;
LABEL_6:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v68 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v13);
        objc_msgSend(v8, "emailAddresses");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "emailAddress");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        SGNormalizeEmailAddress();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "containsObject:", v17);

        if (v18)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
          if (v11)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      sgLogHandle();
      v41 = (SGSocialProfileDetails *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v41->super, OS_LOG_TYPE_DEBUG))
        goto LABEL_45;
      objc_msgSend(v14, "emailAddress");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v75 = v49;
      v50 = "Extracted pseudo-contact email address matches \"me\" contact: %@";
    }
    else
    {
LABEL_12:

      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      objc_msgSend(v54, "phones");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v64;
LABEL_14:
        v22 = 0;
        while (1)
        {
          if (*(_QWORD *)v64 != v21)
            objc_enumerationMutation(v9);
          v23 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v22);
          objc_msgSend(v8, "phoneNumbers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "phoneNumber");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          SGNormalizePhoneNumber();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v24, "containsObject:", v26);

          if (v27)
            break;
          if (v20 == ++v22)
          {
            v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
            if (v20)
              goto LABEL_14;
            goto LABEL_20;
          }
        }
        sgLogHandle();
        v41 = (SGSocialProfileDetails *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v41->super, OS_LOG_TYPE_DEBUG))
          goto LABEL_45;
        objc_msgSend(v23, "phoneNumber");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v75 = v49;
        v50 = "Extracted pseudo-contact phone number matches \"me\" contact: %@";
      }
      else
      {
LABEL_20:

        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        objc_msgSend(v54, "postalAddresses");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
        if (!v28)
        {
LABEL_28:

          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v6 = v54;
          objc_msgSend(v54, "socialProfiles");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          if (v37)
          {
            v38 = v37;
            v53 = *(_QWORD *)v56;
            while (2)
            {
              for (i = 0; i != v38; ++i)
              {
                if (*(_QWORD *)v56 != v53)
                  objc_enumerationMutation(v9);
                v40 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
                v41 = -[SGSocialProfileDetails initWithSocialProfile:]([SGSocialProfileDetails alloc], "initWithSocialProfile:", v40);
                objc_msgSend(v8, "socialProfileIdentifiers");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[SGSocialProfileDetails preferredUniqueIdentifier](v41, "preferredUniqueIdentifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = objc_msgSend(v42, "containsObject:", v43);

                if (v44)
                {
                  sgLogHandle();
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v75 = v40;
                    _os_log_debug_impl(&dword_1C3607000, v52, OS_LOG_TYPE_DEBUG, "Extracted pseudo-contact social profile matches \"me\" contact: %@", buf, 0xCu);
                  }

                  v7 = 1;
                  goto LABEL_46;
                }

              }
              v38 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
              if (v38)
                continue;
              break;
            }
          }

          objc_msgSend(v8, "formattedName");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          SGNormalizeName((uint64_t)v45);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v54, "name");
          v41 = (SGSocialProfileDetails *)objc_claimAutoreleasedReturnValue();
          -[SGSocialProfileDetails fullName](v41, "fullName");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          SGNormalizeName((uint64_t)v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGNames nameSimilarity:and:](SGNames, "nameSimilarity:and:", v47, v9);
          v7 = v48 > 4.0;

LABEL_46:
          goto LABEL_47;
        }
        v29 = v28;
        v30 = *(_QWORD *)v60;
LABEL_22:
        v31 = 0;
        while (1)
        {
          if (*(_QWORD *)v60 != v30)
            objc_enumerationMutation(v9);
          v32 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v31);
          objc_msgSend(v8, "postalAddresses");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "address");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          SGNormalizeAddress(v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v33, "containsObject:", v35);

          if (v36)
            break;
          if (v29 == ++v31)
          {
            v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
            if (v29)
              goto LABEL_22;
            goto LABEL_28;
          }
        }
        sgLogHandle();
        v41 = (SGSocialProfileDetails *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v41->super, OS_LOG_TYPE_DEBUG))
          goto LABEL_45;
        objc_msgSend(v32, "address");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v75 = v49;
        v50 = "Extracted pseudo-contact postal address matches \"me\" contact: %@";
      }
    }
    _os_log_debug_impl(&dword_1C3607000, &v41->super, OS_LOG_TYPE_DEBUG, v50, buf, 0xCu);

LABEL_45:
    v7 = 1;
    v6 = v54;
    goto LABEL_46;
  }
LABEL_48:

  return v7;
}

+ (id)_getPeopleWithNameToken:(id)a3 fromContactStore:(id)a4 withKeysToFetch:(id)a5 ifMatchingPredicate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "length"))
  {
    if (objc_msgSend(v9, "length") != 1
      || (v13 = 0, objc_msgSend(v9, "characterAtIndex:", 0) >> 7 >= 0x5D))
    {
      v14 = (void *)objc_opt_new();
      v22 = 0;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __104__SGCuratedContactMatcher__getPeopleWithNameToken_fromContactStore_withKeysToFetch_ifMatchingPredicate___block_invoke;
      v19[3] = &unk_1E7DB1FF0;
      v21 = v12;
      v15 = v14;
      v20 = v15;
      +[SGContactsInterface enumerateContactsMatchingName:withKeysToFetch:usingContactStore:error:usingBlock:](SGContactsInterface, "enumerateContactsMatchingName:withKeysToFetch:usingContactStore:error:usingBlock:", v9, v11, v10, &v22, v19);
      v16 = v22;
      v17 = v20;
      v13 = v15;

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_findFuzzyNameCandidatesMatchingPseudoContact:(id)a3 withName:(id)a4 andFeatures:(id *)a5 fromContactStore:(id)a6 withKeysToFetch:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *context;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsSeparatedByCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v15);
  v18 = (void *)objc_opt_new();
  if (objc_msgSend(v17, "count"))
  {
    v37 = v12;
    v38 = v11;
    context = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_getPeopleWithNameToken:fromContactStore:withKeysToFetch:ifMatchingPredicate:", v19, v13, v14, &__block_literal_global_27288);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unionOrderedSet:", v20);

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v36 = v17;
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGNicknames nicknamesForName:](SGNicknames, "nicknamesForName:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v42;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v42 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(a1, "_getPeopleWithNameToken:fromContactStore:withKeysToFetch:ifMatchingPredicate:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v26), v13, v14, &__block_literal_global_12_27290);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "unionOrderedSet:", v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v24);
    }

    objc_autoreleasePoolPop(context);
    v12 = v37;
    v11 = v38;
    v17 = v36;
  }
  +[SGNames sketchesForName:](SGNames, "sketchesForName:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v17, "count") >= 2)
  {
    v29 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v17, "count") - 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __127__SGCuratedContactMatcher__findFuzzyNameCandidatesMatchingPseudoContact_withName_andFeatures_fromContactStore_withKeysToFetch___block_invoke_3;
    v39[3] = &unk_1E7DB2078;
    v40 = v28;
    objc_msgSend(a1, "_getPeopleWithNameToken:fromContactStore:withKeysToFetch:ifMatchingPredicate:", v30, v13, v14, v39);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "unionOrderedSet:", v31);
    objc_autoreleasePoolPop(v29);
  }
  v32 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v18, "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v32);

  return v33;
}

+ (id)_lookupContact:(id)a3 andFeatures:(id *)a4 fromContactStore:(id)a5 withKeysToFetch:(id)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  $5CBE0FA55CE56056C0A804A94671DA65 *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v42 = a1;
  v43 = a4;
  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v47 = a5;
  v9 = a6;
  v44 = (void *)objc_opt_new();
  v45 = v8;
  v46 = (void *)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v8, "phones");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v59 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1C3BD4F6C]();
        v17 = (void *)MEMORY[0x1E0C97398];
        objc_msgSend(v15, "phoneNumber");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "phoneNumberWithStringValue:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = 0;
          +[SGContactsInterface unifiedContactsMatchingPredicate:keysToFetch:usingContactStore:error:](SGContactsInterface, "unifiedContactsMatchingPredicate:keysToFetch:usingContactStore:error:", v20, v9, v47, &v57);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "count"))
            objc_msgSend(v46, "addObjectsFromArray:", v21);

        }
        objc_autoreleasePoolPop(v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v12);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v8, "emailAddresses");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v54 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
        v28 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v27, "emailAddress");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactMatchingEmailAddress:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 0;
          +[SGContactsInterface unifiedContactsMatchingPredicate:keysToFetch:usingContactStore:error:](SGContactsInterface, "unifiedContactsMatchingPredicate:keysToFetch:usingContactStore:error:", v30, v9, v47, &v52);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "count"))
            objc_msgSend(v46, "addObjectsFromArray:", v31);

        }
        objc_autoreleasePoolPop(v28);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v24);
  }

  objc_msgSend(v42, "_filterCandidates:withUniqueDetailMatchesToContact:andFeatures:", v46, v45, v43);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v49 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
        objc_msgSend(v37, "identifier", v42, v43);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v37, v38);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    }
    while (v34);
  }

  v39 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v44, "allValues");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v39);

  return v40;
}

+ (id)_filterCandidates:(id)a3 withUniqueDetailMatchesToContact:(id)a4 andFeatures:(id *)a5
{
  id v6;
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  id k;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  void *v40;
  int v41;
  uint64_t n;
  uint64_t v43;
  void *v44;
  SGSocialProfileDetails *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t ii;
  void *v54;
  SGSocialProfileDetails *v55;
  void *v56;
  SGSocialProfileDetails *v57;
  void *v58;
  void *v59;
  int v60;
  void *v63;
  id obj;
  id obja;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  void *v138;
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v79 = v6;
  v72 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v95 = (void *)objc_opt_new();
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v63 = v7;
  objc_msgSend(v7, "phones");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v141, 16);
  if (v69)
  {
    v66 = *(id *)v129;
    do
    {
      for (i = 0; i != v69; ++i)
      {
        if (*(id *)v129 != v66)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v9, "phoneNumber");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SGNormalizePhoneNumberCached();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v13 = v79;
        v86 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v124, v140, 16);
        if (!v86)
          goto LABEL_27;
        v80 = v13;
        v73 = v10;
        v76 = i;
        v13 = 0;
        v83 = *(id *)v125;
        do
        {
          v14 = 0;
          do
          {
            if (*(id *)v125 != v83)
              objc_enumerationMutation(v80);
            v15 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v14);
            v120 = 0u;
            v121 = 0u;
            v122 = 0u;
            v123 = 0u;
            v89 = v14;
            v92 = v15;
            objc_msgSend(v15, "phoneNumbers");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v120, v139, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v121;
              while (2)
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v121 != v19)
                    objc_enumerationMutation(v16);
                  objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * j), "value");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "stringValue");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v138 = v12;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v138, 1);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = SGPhoneNumberMatchInSet(v95, v22, v23);

                  if (v24)
                  {
                    if (v13)
                    {

                      v13 = 0;
                      goto LABEL_23;
                    }
                    v13 = v92;
                  }
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v120, v139, 16);
                if (v18)
                  continue;
                break;
              }
            }
LABEL_23:

            v14 = v89 + 1;
          }
          while (v89 + 1 != v86);
          v86 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v124, v140, 16);
        }
        while (v86);

        v10 = v73;
        i = v76;
        if (v13)
        {
          objc_msgSend(v72, "addObject:", v13);
LABEL_27:

        }
        objc_autoreleasePoolPop(v10);
      }
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v141, 16);
    }
    while (v69);
  }

  v25 = objc_msgSend(v72, "count");
  a5->var1 = v25;
  a5->var3 = v25;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  objc_msgSend(v63, "emailAddresses");
  v67 = (id)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v116, v137, 16);
  if (!v74)
    goto LABEL_59;
  v70 = *(_QWORD *)v117;
  do
  {
    for (k = 0; k != (id)v74; k = (char *)k + 1)
    {
      if (*(_QWORD *)v117 != v70)
        objc_enumerationMutation(v67);
      v27 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)k);
      v28 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v27, "emailAddress");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      SGNormalizeEmailAddress();
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v31 = v79;
      v90 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v112, v136, 16);
      if (!v90)
        goto LABEL_56;
      v81 = k;
      v84 = v31;
      v77 = v28;
      v31 = 0;
      v87 = *(_QWORD *)v113;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v113 != v87)
            objc_enumerationMutation(v84);
          v93 = v32;
          v33 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v32);
          v108 = 0u;
          v109 = 0u;
          v110 = 0u;
          v111 = 0u;
          objc_msgSend(v33, "emailAddresses");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v108, v135, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v109;
            while (2)
            {
              for (m = 0; m != v36; ++m)
              {
                if (*(_QWORD *)v109 != v37)
                  objc_enumerationMutation(v34);
                objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * m), "value");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                SGNormalizeEmailAddress();
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v30, "isEqualToString:", v40);

                if (v41)
                {
                  if (v31)
                  {

                    v31 = 0;
                    goto LABEL_52;
                  }
                  v31 = v33;
                }
              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v108, v135, 16);
              if (v36)
                continue;
              break;
            }
          }
LABEL_52:

          v32 = v93 + 1;
        }
        while (v93 + 1 != v90);
        v90 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v112, v136, 16);
      }
      while (v90);

      k = v81;
      v28 = v77;
      if (v31)
      {
        objc_msgSend(v72, "addObject:", v31);
LABEL_56:

      }
      objc_autoreleasePoolPop(v28);
    }
    v74 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v116, v137, 16);
  }
  while (v74);
LABEL_59:

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  objc_msgSend(v63, "socialProfiles");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v104, v134, 16);
  if (v71)
  {
    v68 = *(id *)v105;
    do
    {
      for (n = 0; n != v71; ++n)
      {
        if (*(id *)v105 != v68)
          objc_enumerationMutation(obja);
        v43 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * n);
        v44 = (void *)MEMORY[0x1C3BD4F6C]();
        v45 = -[SGSocialProfileDetails initWithSocialProfile:]([SGSocialProfileDetails alloc], "initWithSocialProfile:", v43);
        v100 = 0u;
        v101 = 0u;
        v102 = 0u;
        v103 = 0u;
        v46 = v79;
        v88 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v100, v133, 16);
        if (!v88)
          goto LABEL_85;
        v82 = v46;
        v75 = v44;
        v78 = n;
        v46 = 0;
        v85 = *(id *)v101;
        do
        {
          v47 = 0;
          do
          {
            if (*(id *)v101 != v85)
              objc_enumerationMutation(v82);
            v48 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v47);
            v96 = 0u;
            v97 = 0u;
            v98 = 0u;
            v99 = 0u;
            v91 = v47;
            v94 = v48;
            objc_msgSend(v48, "socialProfiles");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v96, v132, 16);
            if (v50)
            {
              v51 = v50;
              v52 = *(_QWORD *)v97;
              while (2)
              {
                for (ii = 0; ii != v51; ++ii)
                {
                  if (*(_QWORD *)v97 != v52)
                    objc_enumerationMutation(v49);
                  v54 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * ii);
                  v55 = [SGSocialProfileDetails alloc];
                  objc_msgSend(v54, "value");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = -[SGSocialProfileDetails initWithCNSocialProfile:](v55, "initWithCNSocialProfile:", v56);

                  -[SGSocialProfileDetails preferredUniqueIdentifier](v57, "preferredUniqueIdentifier");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SGSocialProfileDetails preferredUniqueIdentifier](v45, "preferredUniqueIdentifier");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = objc_msgSend(v58, "isEqual:", v59);

                  if (v60)
                  {
                    if (v46)
                    {

                      v46 = 0;
                      goto LABEL_81;
                    }
                    v46 = v94;
                  }

                }
                v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v96, v132, 16);
                if (v51)
                  continue;
                break;
              }
            }
LABEL_81:

            v47 = v91 + 1;
          }
          while (v91 + 1 != v88);
          v88 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v100, v133, 16);
        }
        while (v88);

        v44 = v75;
        n = v78;
        if (v46)
        {
          objc_msgSend(v72, "addObject:", v46);
LABEL_85:

        }
        objc_autoreleasePoolPop(v44);
      }
      v71 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v104, v134, 16);
    }
    while (v71);
  }

  return v72;
}

+ (id)filterCandidates:(id)a3 withDetailSubsetOfCNContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SGCuratedContactMatcher_filterCandidates_withDetailSubsetOfCNContact___block_invoke;
  v10[3] = &unk_1E7DB20A0;
  v11 = v6;
  v12 = a1;
  v7 = v6;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)compareContact:(id)a3 cnContact:(id)a4 newDetails:(id *)a5 matchedDetails:(id *)a6 matchPreference:(int64_t)a7
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  objc_msgSend(a1, "_compareContact:cnContact:newDetails:matchedDetails:matchPreference:stopOnNewDetail:stopOnMatchedDetail:", a3, a4, a5, a6, a7, 0, v7);
}

+ (BOOL)compareContact:(id)a3 cnContact:(id)a4 stopOnNewDetail:(BOOL)a5 stopOnMatchedDetail:(BOOL)a6 matchPreference:(int64_t)a7
{
  uint64_t v8;

  LOBYTE(v8) = a6;
  return objc_msgSend(a1, "_compareContact:cnContact:newDetails:matchedDetails:matchPreference:stopOnNewDetail:stopOnMatchedDetail:", a3, a4, 0, 0, a7, a5, v8);
}

+ (BOOL)_compareContact:(id)a3 cnContact:(id)a4 newDetails:(id *)a5 matchedDetails:(id *)a6 matchPreference:(int64_t)a7 stopOnNewDetail:(BOOL)a8 stopOnMatchedDetail:(BOOL)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t m;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  char v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  double v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t n;
  void *v77;
  SGSocialProfileDetails *v78;
  void *v79;
  SGSocialProfileDetails *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t ii;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t jj;
  void *v91;
  uint64_t v92;
  SGSocialProfileDetails *v93;
  void *v94;
  int v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  BOOL v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v118;
  void *v119;
  id *v120;
  void *v121;
  void *v122;
  void *v123;
  id *v124;
  uint64_t v125;
  uint64_t v126;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  BOOL v136;
  id obj;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  _QWORD v172[4];
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  uint64_t v186;

  v9 = a8;
  v186 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v136 = v9;
  v124 = a6;
  if ((((unint64_t)a5 | (unint64_t)a6) != 0) == (v9 || a9))
  {
    v118 = v16;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGCuratedContactMatcher.m"), 417, CFSTR("Asking to stopOnNewDetail or stopOnMatchedDetail does not make sense alonside providing newDetails or matchedDetails"));

    v16 = v118;
  }
  v128 = v16;
  objc_msgSend(v16, "emailAddresses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_pas_mappedArrayWithTransform:", &__block_literal_global_25_27275);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    v135 = (void *)objc_opt_new();
  else
    v135 = 0;
  if (v124)
    v134 = (void *)objc_opt_new();
  else
    v134 = 0;
  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  objc_msgSend(v15, "emailAddresses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v174, v185, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v175;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v175 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * i);
        objc_msgSend(v22, "emailAddress");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        SGNormalizeEmailAddress();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v138, "containsObject:", v24);

        if (v25)
        {
          objc_msgSend(v134, "addObject:", v22);
          if (a9)
            goto LABEL_22;
        }
        else
        {
          objc_msgSend(v135, "addObject:", v22);
          if (v136)
          {
LABEL_22:
            v28 = 1;
            goto LABEL_136;
          }
        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v174, v185, 16);
    }
    while (v19);
  }

  v26 = (void *)objc_opt_new();
  objc_msgSend(v128, "phoneNumbers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v172[0] = MEMORY[0x1E0C809B0];
  v172[1] = 3221225472;
  v172[2] = __131__SGCuratedContactMatcher__compareContact_cnContact_newDetails_matchedDetails_matchPreference_stopOnNewDetail_stopOnMatchedDetail___block_invoke_2;
  v172[3] = &unk_1E7DB2108;
  obj = v26;
  v173 = obj;
  objc_msgSend(v27, "_pas_mappedArrayWithTransform:", v172);
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    v130 = (void *)objc_opt_new();
  else
    v130 = 0;
  if (v124)
    v129 = (void *)objc_opt_new();
  else
    v129 = 0;
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  objc_msgSend(v15, "phones");
  v132 = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v168, v184, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v169;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v169 != v31)
          objc_enumerationMutation(v132);
        v33 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * j);
        v34 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v33, "phoneNumber");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = SGPhoneNumberMatchInSet(obj, v35, v133);

        if (v36)
        {
          objc_msgSend(v129, "addObject:", v33);
          if (a9)
            goto LABEL_40;
        }
        else
        {
          objc_msgSend(v130, "addObject:", v33);
          if (v136)
          {
LABEL_40:
            objc_autoreleasePoolPop(v34);
            v28 = 1;
            goto LABEL_135;
          }
        }
        objc_autoreleasePoolPop(v34);
      }
      v30 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v168, v184, 16);
    }
    while (v30);
  }

  objc_msgSend(v128, "postalAddresses");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "_pas_mappedArrayWithTransform:", &__block_literal_global_26_27277);
  v132 = (id)objc_claimAutoreleasedReturnValue();

  if (a5)
    v122 = (void *)objc_opt_new();
  else
    v122 = 0;
  v120 = a5;
  if (v124)
    v121 = (void *)objc_opt_new();
  else
    v121 = 0;
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  objc_msgSend(v15, "postalAddresses");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v15;
  v126 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v164, v183, 16);
  if (!v126)
    goto LABEL_85;
  v125 = *(_QWORD *)v165;
  while (2)
  {
    v39 = 0;
    do
    {
      if (*(_QWORD *)v165 != v125)
        objc_enumerationMutation(v38);
      v131 = v39;
      v40 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * v39);
      objc_msgSend(v40, "address");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      SGNormalizeAddress(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v140 = v40;
      objc_msgSend(v40, "address");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      SGPostalAddressParse(v43);
      v141 = (void *)objc_claimAutoreleasedReturnValue();

      v162 = 0u;
      v163 = 0u;
      v160 = 0u;
      v161 = 0u;
      v44 = v132;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v160, v182, 16);
      v142 = v42;
      if (!v45)
      {

        if (a7 == 2)
        {
LABEL_64:
          v158 = 0u;
          v159 = 0u;
          v156 = 0u;
          v157 = 0u;
          objc_msgSend(v128, "postalAddresses");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v156, v181, 16);
          if (v58)
          {
            v59 = v58;
            v60 = *(_QWORD *)v157;
            while (2)
            {
              for (k = 0; k != v59; ++k)
              {
                if (*(_QWORD *)v157 != v60)
                  objc_enumerationMutation(v57);
                v62 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * k);
                objc_msgSend(v62, "value");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "street");
                v64 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v62, "value");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                SGNormalizeCNAddress(v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();

                v42 = v142;
                if (v64 && objc_msgSend(v142, "rangeOfString:", v64) != 0x7FFFFFFFFFFFFFFFLL)
                {

LABEL_81:
                  goto LABEL_82;
                }
                v67 = (double)+[SGLevenshtein distanceBetweenStrings:and:](SGLevenshtein, "distanceBetweenStrings:and:", v142, v66);
                v68 = objc_msgSend(v142, "length");
                v69 = objc_msgSend(v66, "length");
                if (v68 <= v69)
                  v70 = v69;
                else
                  v70 = v68;
                v71 = 1.0 - v67 / (double)v70;

                if (v71 > 0.8)
                  goto LABEL_81;
              }
              v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v156, v181, 16);
              if (v59)
                continue;
              break;
            }
          }

        }
LABEL_78:
        objc_msgSend(v122, "addObject:", v140);
        if (v136)
          goto LABEL_101;
        goto LABEL_83;
      }
      v46 = v45;
      v47 = *(_QWORD *)v161;
      v48 = 1;
      v139 = v44;
      do
      {
        for (m = 0; m != v46; ++m)
        {
          if (*(_QWORD *)v161 != v47)
            objc_enumerationMutation(v139);
          v50 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * m);
          objc_msgSend(v140, "address");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "first");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "first");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "second");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = SGPostalAddressesMatchWithParsed(v51, v52, v142, v53, v141, v54, (unint64_t)(a7 - 1) < 2);

          v48 &= v55 ^ 1;
        }
        v46 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v160, v182, 16);
      }
      while (v46);

      if (a7 == 2)
        v56 = v48;
      else
        v56 = 0;
      v15 = v123;
      v42 = v142;
      if ((v56 & 1) != 0)
        goto LABEL_64;
      if ((v48 & 1) != 0)
        goto LABEL_78;
LABEL_82:
      objc_msgSend(v121, "addObject:", v140);
      if (a9)
      {
LABEL_101:
        v28 = 1;
        goto LABEL_134;
      }
LABEL_83:

      v39 = v131 + 1;
    }
    while (v131 + 1 != v126);
    v126 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v164, v183, 16);
    if (v126)
      continue;
    break;
  }
LABEL_85:

  v38 = (void *)objc_opt_new();
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  objc_msgSend(v128, "socialProfiles");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v152, v180, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v153;
    do
    {
      for (n = 0; n != v74; ++n)
      {
        if (*(_QWORD *)v153 != v75)
          objc_enumerationMutation(v72);
        v77 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * n);
        v78 = [SGSocialProfileDetails alloc];
        objc_msgSend(v77, "value");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = -[SGSocialProfileDetails initWithCNSocialProfile:](v78, "initWithCNSocialProfile:", v79);

        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        -[SGSocialProfileDetails uniqueIdentifiers](v80, "uniqueIdentifiers");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v148, v179, 16);
        if (v82)
        {
          v83 = v82;
          v84 = *(_QWORD *)v149;
          do
          {
            for (ii = 0; ii != v83; ++ii)
            {
              if (*(_QWORD *)v149 != v84)
                objc_enumerationMutation(v81);
              objc_msgSend(v38, "addObject:", *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * ii));
            }
            v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v148, v179, 16);
          }
          while (v83);
        }

      }
      v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v152, v180, 16);
    }
    while (v74);
  }

  if (v120)
    v42 = (void *)objc_opt_new();
  else
    v42 = 0;
  if (v124)
    v141 = (void *)objc_opt_new();
  else
    v141 = 0;
  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  objc_msgSend(v123, "socialProfiles");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v144, v178, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v145;
    do
    {
      for (jj = 0; jj != v88; ++jj)
      {
        v91 = v42;
        if (*(_QWORD *)v145 != v89)
          objc_enumerationMutation(v86);
        v92 = *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * jj);
        v93 = -[SGSocialProfileDetails initWithSocialProfile:]([SGSocialProfileDetails alloc], "initWithSocialProfile:", v92);
        -[SGSocialProfileDetails preferredUniqueIdentifier](v93, "preferredUniqueIdentifier");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v38, "containsObject:", v94);

        if (v95)
        {
          objc_msgSend(v141, "addObject:", v92);
          v42 = v91;
          if (a9)
            goto LABEL_132;
        }
        else
        {
          v42 = v91;
          objc_msgSend(v91, "addObject:", v92);
          if (v136)
            goto LABEL_132;
        }

      }
      v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v144, v178, 16);
    }
    while (v88);
  }

  objc_msgSend(v123, "birthday");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "dateComponents");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v143 = v42;
  if (!v97)
  {
LABEL_125:
    v86 = 0;
    v93 = 0;
    goto LABEL_126;
  }
  objc_msgSend(v128, "birthday");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v98, "day");
  objc_msgSend(v123, "birthday");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "dateComponents");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v99 != objc_msgSend(v101, "day"))
  {

    goto LABEL_124;
  }
  objc_msgSend(v128, "birthday");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v102, "month");
  objc_msgSend(v123, "birthday");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "dateComponents");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v105, "month");

  v107 = v103 == v106;
  v42 = v143;
  if (v107)
  {
    objc_msgSend(v123, "birthday");
    v93 = (SGSocialProfileDetails *)objc_claimAutoreleasedReturnValue();
    v86 = 0;
    if (a9)
      goto LABEL_132;
    goto LABEL_126;
  }
LABEL_124:
  objc_msgSend(v128, "birthday");
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
    goto LABEL_125;
  objc_msgSend(v123, "birthday");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0;
  if (!v136)
  {
LABEL_126:
    if (v120)
    {
      v109 = (void *)MEMORY[0x1E0D197B0];
      objc_msgSend(v123, "recordId");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "name");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "photoPath");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "contactWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:birthday:photoPath:", v110, v111, v135, v130, v122, v143, v86, v112);
      *v120 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v124)
    {
      v113 = (void *)MEMORY[0x1E0D197B0];
      objc_msgSend(v123, "recordId");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "name");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "photoPath");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "contactWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:birthday:photoPath:", v114, v115, v134, v129, v121, v141, v93, v116);
      *v124 = (id)objc_claimAutoreleasedReturnValue();

    }
    v28 = 0;
    v42 = v143;
    goto LABEL_133;
  }
LABEL_132:
  v28 = 1;
LABEL_133:

  v15 = v123;
LABEL_134:

LABEL_135:
LABEL_136:

  return v28;
}

+ (id)_filterCandidates:(id)a3 similarToName:(id)a4 exceedingThreshold:(double)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27 = a4;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v13, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
        {
          SGNormalizeName(v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGNames nameSimilarity:and:](SGNames, "nameSimilarity:and:", v27, v17);
          v19 = v18;

          if (v19 > a5)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v20, v13);

            if ((unint64_t)objc_msgSend(v26, "count") >= 0x65)
            {

              objc_autoreleasePoolPop(v14);
              goto LABEL_13;
            }
          }
        }

        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  v21 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v26, "keysSortedByValueUsingSelector:", sel_compare_);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reverseObjectEnumerator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v21);
  return v24;
}

+ (id)_findContactsMatchingPseudoContact:(id)a3 withName:(id)a4 andFeatures:(id *)a5 fromContactStore:(id)a6 withKeysToFetch:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  id obj;
  void *v55;
  id v56;
  void *context;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v13, "length"))
  {
LABEL_2:
    objc_msgSend(a1, "_findFuzzyNameCandidatesMatchingPseudoContact:withName:andFeatures:fromContactStore:withKeysToFetch:", v12, v13, a5, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_filterCandidates:withUniqueDetailMatchesToContact:andFeatures:", v16, v12, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      v18 = v15;
      objc_msgSend(v17, "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -INFINITY;
      v21 = a1;
      v22 = v19;
    }
    else
    {
      objc_msgSend(a1, "_lookupContact:andFeatures:fromContactStore:withKeysToFetch:", v12, a5, v14, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count"))
        goto LABEL_27;
      v18 = v15;
      v20 = 4.0;
      v21 = a1;
      v22 = v16;
    }
    objc_msgSend(v21, "_filterCandidates:similarToName:exceedingThreshold:", v22, v13, v20);
    v23 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v23;
    v15 = v18;
LABEL_27:

    goto LABEL_28;
  }
  objc_msgSend(v12, "socialProfiles");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v24, "count"))
  {

    goto LABEL_2;
  }
  objc_msgSend(v12, "phones");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (!v26)
    goto LABEL_2;
  v48 = v13;
  v27 = (void *)objc_opt_new();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v49 = v12;
  objc_msgSend(v12, "phones");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v64;
    v31 = 0x1E0C97000uLL;
    v51 = v15;
    v52 = v14;
    v50 = *(_QWORD *)v64;
    do
    {
      v32 = 0;
      v53 = v29;
      do
      {
        if (*(_QWORD *)v64 != v30)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v32);
        context = (void *)MEMORY[0x1C3BD4F6C]();
        v34 = *(void **)(v31 + 920);
        objc_msgSend(v33, "phoneNumber");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "phoneNumberWithStringValue:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = 0;
          +[SGContactsInterface unifiedContactsMatchingPredicate:keysToFetch:usingContactStore:error:](SGContactsInterface, "unifiedContactsMatchingPredicate:keysToFetch:usingContactStore:error:", v37, v15, v14, &v62);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v62;
          if (objc_msgSend(v38, "count"))
          {
            v55 = v37;
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v39 = v38;
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
            if (v40)
            {
              v41 = v40;
              v42 = *(_QWORD *)v59;
              do
              {
                for (i = 0; i != v41; ++i)
                {
                  if (*(_QWORD *)v59 != v42)
                    objc_enumerationMutation(v39);
                  v44 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                  objc_msgSend(v44, "identifier", v48);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "setObject:forKeyedSubscript:", v44, v45);

                }
                v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
              }
              while (v41);
            }

            v15 = v51;
            v14 = v52;
            v30 = v50;
            v31 = 0x1E0C97000;
            v29 = v53;
            v37 = v55;
          }

        }
        objc_autoreleasePoolPop(context);
        ++v32;
      }
      while (v32 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v29);
  }

  v46 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v27, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v46);

  v13 = v48;
  v12 = v49;
LABEL_28:

  return v19;
}

+ (id)_realtimeContactFromPseudoContact:(id)a3 andFeatures:(id *)a4 assimilatingMatchingCuratedContacts:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a5, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = 0;
  objc_msgSend(a1, "compareContact:cnContact:newDetails:matchedDetails:matchPreference:", v8, v9, &v32, &v31, 2);
  v10 = v32;
  v11 = v31;
  objc_msgSend(v9, "postalAddresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
    a4->var8 = 1;
  objc_msgSend(v11, "emailAddresses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
    a4->var6 = 1;
  objc_msgSend(v11, "phones");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
    a4->var4 = 1;
  objc_msgSend(v11, "postalAddresses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
    a4->var9 = 1.0;
  objc_msgSend(v11, "socialProfiles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
    a4->var7 = 1;
  objc_msgSend(v10, "emailAddresses");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  a4->var11 = objc_msgSend(v22, "count");

  objc_msgSend(v10, "socialProfiles");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  a4->var12 = objc_msgSend(v23, "count");

  objc_msgSend(v10, "phones");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  a4->var10 = objc_msgSend(v24, "count");

  objc_msgSend(v10, "postalAddresses");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  a4->var13 = objc_msgSend(v25, "count");

  sgLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v10;
    _os_log_debug_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEBUG, "Filtered contact: %@", buf, 0xCu);
  }

  objc_msgSend(v10, "setUpdatedFields:", objc_msgSend(v8, "updatedFields"));
  v27 = (void *)MEMORY[0x1E0D198F8];
  objc_msgSend(v9, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "realtimeContactForFields:updatedFields:addedToCuratedContact:", v10, 0, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)stripBirthdayFromSGContact:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0D197B0];
  v4 = a3;
  objc_msgSend(v4, "recordId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phones");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postalAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "socialProfiles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "contactWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:birthday:photoPath:", v5, v6, v7, v8, v9, v10, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)stripStaleBirthdayFromSGContact:(id)a3 withEntity:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99D48];
  v8 = a4;
  objc_msgSend(v7, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "components:fromDate:", 28, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "creationTimestamp");
  v13 = v12;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v13);
  objc_msgSend(v9, "components:fromDate:", 28, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "isEqual:", v11))
  {
    sgLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "_birthdayDateFormatter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateFromComponents:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromDate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v19;
      _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEFAULT, "Detected birthday matches today's date %@. Returning contact information", (uint8_t *)&v23, 0xCu);

    }
    v20 = v6;
  }
  else
  {
    +[SGCuratedContactMatcher stripBirthdayFromSGContact:](SGCuratedContactMatcher, "stripBirthdayFromSGContact:", v6);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  return v21;
}

+ (id)_birthdayDateFormatter
{
  if (_birthdayDateFormatter_onceToken != -1)
    dispatch_once(&_birthdayDateFormatter_onceToken, &__block_literal_global_36_27257);
  return (id)_birthdayDateFormatter_birthdayDateFormatter;
}

+ (id)_realtimeContactWithContactStore:(id)a3 forPseudoContact:(id)a4 fromEntity:(id)a5 normalizedName:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BYTE v35[56];
  uint8_t buf[4];
  uint64_t v37;
  _QWORD v38[7];

  v38[6] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = 0;
  if (v11 && v12)
  {
    if (objc_msgSend(a1, "_isMeContact:withContactStore:", v12, v11))
    {
      sgLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v35 = 0;
        _os_log_debug_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEBUG, "Extracted pseudo-contact matches \"me\" contact, Suggestion suppressed", v35, 2u);
      }

      v15 = 0;
    }
    else
    {
      memset(&v35[4], 0, 48);
      *(_DWORD *)v35 = 130815;
      objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0, *(_QWORD *)v35, 0, *(_QWORD *)&v35[16], 0, *(_QWORD *)&v35[32], 0, *(_QWORD *)&v35[48]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x1E0C966A8];
      v38[0] = v17;
      v38[1] = v18;
      v19 = *MEMORY[0x1E0C967F0];
      v38[2] = *MEMORY[0x1E0C967C0];
      v38[3] = v19;
      v20 = *MEMORY[0x1E0C96670];
      v38[4] = *MEMORY[0x1E0C96868];
      v38[5] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_findContactsMatchingPseudoContact:withName:andFeatures:fromContactStore:withKeysToFetch:", v12, v14, v35, v11, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(v22, "count");
        *(_DWORD *)buf = 134217984;
        v37 = v24;
        _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "Found %lu curated contacts for pseudo-contact", buf, 0xCu);
      }

      if (v13)
      {
        +[SGCuratedContactMatcher stripStaleBirthdayFromSGContact:withEntity:](SGCuratedContactMatcher, "stripStaleBirthdayFromSGContact:withEntity:", v12, v13);
        v25 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v25;
      }
      if (objc_msgSend(v22, "count"))
      {
        objc_msgSend(a1, "_realtimeContactFromPseudoContact:andFeatures:assimilatingMatchingCuratedContacts:", v12, v35, v22);
      }
      else
      {
        objc_msgSend(v12, "phones");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)&v35[28] = objc_msgSend(v26, "count");

        objc_msgSend(v12, "emailAddresses");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)&v35[32] = objc_msgSend(v27, "count");

        objc_msgSend(v12, "postalAddresses");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)&v35[40] = objc_msgSend(v28, "count");

        objc_msgSend(v12, "socialProfiles");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)&v35[36] = objc_msgSend(v29, "count");

        objc_msgSend(MEMORY[0x1E0D198F8], "realtimeContactForNewContact:", v12);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v12, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "fullName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)&v35[44] = objc_msgSend(v31, "length");

        objc_msgSend(v12, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "fullName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v35[48] = objc_msgSend(v33, "rangeOfString:options:", CFSTR("@"), 2) != 0x7FFFFFFFFFFFFFFFLL;

      }
      SGFeatureVectorLog((uint64_t)v35);

    }
  }

  return v15;
}

+ (id)realtimeContactWithContactStore:(id)a3 forPseudoContact:(id)a4 fromEntity:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fullName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeName((uint64_t)v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_realtimeContactWithContactStore:forPseudoContact:fromEntity:normalizedName:error:", v12, v11, v10, v15, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)realtimeContactWithContactStore:(id)a3 forPseudoContact:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fullName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeName((uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_realtimeContactWithContactStore:forPseudoContact:fromEntity:normalizedName:error:", v9, v8, 0, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)curatedContactsFromContactStore:(id)a3 matchingPseudoContact:(id)a4 error:(id *)a5
{
  void *v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[8];

  v5 = 0;
  v24[7] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
    v20 = 130815;
    v8 = (void *)MEMORY[0x1E0C97218];
    v9 = a4;
    v10 = a3;
    objc_msgSend(v8, "descriptorForRequiredKeysForStyle:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0C966D0];
    v24[0] = v11;
    v24[1] = v12;
    v13 = *MEMORY[0x1E0C966C0];
    v24[2] = *MEMORY[0x1E0C96780];
    v24[3] = v13;
    v14 = *MEMORY[0x1E0C967C0];
    v24[4] = *MEMORY[0x1E0C966A8];
    v24[5] = v14;
    v24[6] = *MEMORY[0x1E0C96868];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fullName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizeName((uint64_t)v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_findContactsMatchingPseudoContact:withName:andFeatures:fromContactStore:withKeysToFetch:", v9, v18, &v20, v10, v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __49__SGCuratedContactMatcher__birthdayDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_birthdayDateFormatter_birthdayDateFormatter;
  _birthdayDateFormatter_birthdayDateFormatter = v0;

  objc_msgSend((id)_birthdayDateFormatter_birthdayDateFormatter, "setDateStyle:", 1);
  return objc_msgSend((id)_birthdayDateFormatter_birthdayDateFormatter, "setTimeStyle:", 0);
}

id __131__SGCuratedContactMatcher__compareContact_cnContact_newDetails_matchedDetails_matchPreference_stopOnNewDetail_stopOnMatchedDetail___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizePhoneNumberCached();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __131__SGCuratedContactMatcher__compareContact_cnContact_newDetails_matchedDetails_matchPreference_stopOnNewDetail_stopOnMatchedDetail___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0D81638];
  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeCNAddress(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SGPostalAddressParseCNPostalAddress(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tupleWithFirst:second:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __131__SGCuratedContactMatcher__compareContact_cnContact_newDetails_matchedDetails_matchPreference_stopOnNewDetail_stopOnMatchedDetail___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeEmailAddress();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __72__SGCuratedContactMatcher_filterCandidates_withDetailSubsetOfCNContact___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "compareContact:cnContact:stopOnNewDetail:stopOnMatchedDetail:matchPreference:", a2, *(_QWORD *)(a1 + 32), 1, 0, 0) ^ 1;
}

BOOL __127__SGCuratedContactMatcher__findFuzzyNameCandidatesMatchingPseudoContact_withName_andFeatures_fromContactStore_withKeysToFetch___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGNames sketchesForName:](SGNames, "sketchesForName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "firstObjectCommonWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  objc_autoreleasePoolPop(v6);
  return v8;
}

uint64_t __127__SGCuratedContactMatcher__findFuzzyNameCandidatesMatchingPseudoContact_withName_andFeatures_fromContactStore_withKeysToFetch___block_invoke_2()
{
  return 1;
}

uint64_t __127__SGCuratedContactMatcher__findFuzzyNameCandidatesMatchingPseudoContact_withName_andFeatures_fromContactStore_withKeysToFetch___block_invoke()
{
  return 1;
}

void __104__SGCuratedContactMatcher__getPeopleWithNameToken_fromContactStore_withKeysToFetch_ifMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1C3BD4F6C]();
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v3);
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __58__SGCuratedContactMatcher_fetchMeContactFromContactStore___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C96878];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SGCuratedContactMatcher_fetchMeContactFromContactStore___block_invoke_2;
  v5[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = (id)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", v3, 0, 0, v5);

}

void __58__SGCuratedContactMatcher_fetchMeContactFromContactStore___block_invoke_2(uint64_t a1)
{
  void *v1;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v1 = (void *)_meContact;
  _meContact = 0;

  objc_sync_exit(obj);
}

@end
