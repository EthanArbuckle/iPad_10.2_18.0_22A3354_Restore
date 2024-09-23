@implementation _CDSpotlightQuerier

- (NSMutableArray)requestQuery:(uint64_t)a1
{
  id v3;
  _CDMDSearchQueryDelegate *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSMutableArray *recentMDSearchQueryResults;
  NSMutableArray *v9;
  dispatch_time_t v11;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(_CDMDSearchQueryDelegate);
    v5 = dispatch_semaphore_create(0);
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v4, v5);

    objc_msgSend(v3, "setDelegate:", v4);
    objc_msgSend(v3, "start");
    if (v4)
    {
      v6 = v4->_mdQuerySem;
      v7 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v6, v7);

      objc_msgSend(v3, "cancel");
      recentMDSearchQueryResults = v4->_recentMDSearchQueryResults;
    }
    else
    {
      v11 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(0, v11);
      objc_msgSend(v3, "cancel");
      recentMDSearchQueryResults = 0;
    }
    v9 = recentMDSearchQueryResults;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)querySpotlightForPredicateString:(void *)a3 startDate:(void *)a4 endDate:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _CDSpotlightQuerier *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *MDSearchQueryClass;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = objc_opt_self();
  v10 = objc_alloc_init(_CDSpotlightQuerier);
  +[_CDSpotlightQuerier queryStringWithPredicateStr:userEmails:startDate:endDate:](v9, v8, 0, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDSpotlightQuerier mdSearchableQueryAttributes]();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    getMDSearchQueryOptionFetchAttributes();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA70];
  }
  MDSearchQueryClass = getMDSearchQueryClass();
  if (MDSearchQueryClass)
  {
    v16 = (void *)objc_msgSend([MDSearchQueryClass alloc], "initWithQueryString:options:", v11, v14);
    -[_CDSpotlightQuerier requestQuery:]((uint64_t)v10, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)queryStringWithPredicateStr:(void *)a3 userEmails:(void *)a4 startDate:(void *)a5 endDate:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v38 = a2;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_self();
  v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocale:");
  objc_msgSend(v11, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "stringFromDate:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v11;
  objc_msgSend(v11, "stringFromDate:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("(InRange(kMDItemContentCreationDate, $time.iso(%@), $time.iso(%@)))"), v13, v14);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (objc_msgSend(v15, "length"))
          v22 = CFSTR(" || ");
        else
          v22 = &stru_1E26E9728;
        objc_msgSend(v15, "appendFormat:", CFSTR("%@%@=\"%@\"), v22, 0, v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v24 = v16;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
        if (objc_msgSend(v23, "length"))
          v30 = CFSTR(" || ");
        else
          v30 = &stru_1E26E9728;
        objc_msgSend(v23, "appendFormat:", CFSTR("%@%@=\"%@\"), v30, 0, v29);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v26);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || %@)"), v15, v23);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@ && (%@)"), v35, v38);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v24)
    objc_msgSend(v32, "appendFormat:", CFSTR(" && %@"), v31);

  return v33;
}

+ (id)mdSearchableQueryAttributes
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[18];

  v20[16] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v0 = (void *)mdSearchableQueryAttributes_mdSearchQueryAttributes;
  if (!mdSearchableQueryAttributes_mdSearchQueryAttributes)
  {
    getMDItemContentType();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v19;
    getMDItemContentCreationDate();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v18;
    getMDItemAccountIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v17;
    getMDItemAuthorPersons();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v16;
    getMDItemRecipientEmailAddresses();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[4] = v15;
    getMDItemPrimaryRecipientPersons();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[5] = v14;
    getMDItemRecipients();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v20[6] = v1;
    getMDItemSubject();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v20[7] = v2;
    getMDItemDisplayName();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20[8] = v3;
    getMDItemMailboxes();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20[9] = v4;
    getMDItemEmailHeadersDictionary();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[10] = v5;
    getMDItemPrimaryRecipientPersons();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[11] = v6;
    getMDItemAdditionalRecipientPersons();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[12] = v7;
    getMDItemHiddenAdditionalRecipientPersons();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[13] = v8;
    getMDItemAccountHandles();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[14] = v9;
    getMDItemAccountIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[15] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 16);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)mdSearchableQueryAttributes_mdSearchQueryAttributes;
    mdSearchableQueryAttributes_mdSearchQueryAttributes = v11;

    v0 = (void *)mdSearchableQueryAttributes_mdSearchQueryAttributes;
  }
  return v0;
}

+ (uint64_t)queryStringForMail
{
  objc_opt_self();
  objc_opt_self();
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=com.apple.mail.emlx || %@=public.email-message)"), CFSTR("kMDItemContentType"), CFSTR("kMDItemContentType"));
}

+ (uint64_t)queryStringForMessages
{
  objc_opt_self();
  objc_opt_self();
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=public.message || %@=public.email-message || %@= com.apple.mail.emlx)"), CFSTR("kMDItemContentType"), CFSTR("kMDItemContentType"), CFSTR("kMDItemContentType"));
}

+ (id)orQueryStrings:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" || "));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
