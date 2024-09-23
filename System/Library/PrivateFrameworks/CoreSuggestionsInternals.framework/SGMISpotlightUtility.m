@implementation SGMISpotlightUtility

+ (id)defaultCSSearchQueryContextFetchAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[18];

  v10[17] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA68D8];
  v10[0] = *MEMORY[0x1E0CA60D0];
  v10[1] = v2;
  v3 = *MEMORY[0x1E0CA6708];
  v10[2] = *MEMORY[0x1E0CA6040];
  v10[3] = v3;
  v4 = *MEMORY[0x1E0CA6048];
  v10[4] = *MEMORY[0x1E0CA5F68];
  v10[5] = v4;
  v5 = *MEMORY[0x1E0CA67D8];
  v10[6] = *MEMORY[0x1E0CA6030];
  v10[7] = v5;
  v6 = *MEMORY[0x1E0CA6710];
  v10[8] = *MEMORY[0x1E0CA67D0];
  v10[9] = v6;
  v7 = *MEMORY[0x1E0CA5F58];
  v10[10] = *MEMORY[0x1E0CA66F8];
  v10[11] = v7;
  v8 = *MEMORY[0x1E0CA69F8];
  v10[12] = *MEMORY[0x1E0CA6480];
  v10[13] = v8;
  v10[14] = CFSTR("com_apple_mail_repliedTo");
  v10[15] = CFSTR("com_apple_mail_messageID");
  v10[16] = CFSTR("com_apple_mail_conversationID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 17);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)nicknameCSSearchQueryContextFetchAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[12];

  v8[11] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA68D8];
  v8[0] = *MEMORY[0x1E0CA60D0];
  v8[1] = v2;
  v3 = *MEMORY[0x1E0CA5F68];
  v8[2] = *MEMORY[0x1E0CA6708];
  v8[3] = v3;
  v4 = *MEMORY[0x1E0CA67D0];
  v8[4] = *MEMORY[0x1E0CA67D8];
  v8[5] = v4;
  v5 = *MEMORY[0x1E0CA66F8];
  v8[6] = *MEMORY[0x1E0CA6710];
  v8[7] = v5;
  v6 = *MEMORY[0x1E0CA6480];
  v8[8] = *MEMORY[0x1E0CA5F58];
  v8[9] = v6;
  v8[10] = *MEMORY[0x1E0CA68B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)queryFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 withError:(id *)a6 handler:(id)a7
{
  return objc_msgSend(a1, "queryFromDaysAgo:throughDaysAgo:limit:withError:simulatedCSSIs:handler:", a3, a4, a5, a6, 0, a7);
}

+ (BOOL)queryFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 withError:(id *)a6 simulatedCSSIs:(id)a7 handler:(id)a8
{
  id v13;
  void (**v14)(id, _QWORD, uint64_t);
  id v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v21;
  dispatch_semaphore_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  uint8_t buf[16];
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD v42[4];
  void (**v43)(id, _QWORD, uint64_t);
  uint64_t *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v14 = (void (**)(id, _QWORD, uint64_t))a8;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  if (v13)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v46;
      v18 = 1;
LABEL_4:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v17)
          objc_enumerationMutation(v15);
        v14[2](v14, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v19), (uint64_t)(v50 + 3));
        if (*((_BYTE *)v50 + 24))
          break;
        if (v16 == ++v19)
        {
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          if (v16)
            goto LABEL_4;
          goto LABEL_25;
        }
      }
    }
    v18 = 1;
  }
  else
  {
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("contentType == \"public.email-message\" && InRange(kMDItemContentCreationDate, $time.now(-%lu), $time.now(-%lu))"), 86400 * a3, 86400 * a4);
    v20 = (void *)objc_opt_new();
    +[SGMISpotlightUtility defaultCSSearchQueryContextFetchAttributes](SGMISpotlightUtility, "defaultCSSearchQueryContextFetchAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFetchAttributes:", v21);

    objc_msgSend(v20, "setLowPriority:", 1);
    objc_msgSend(v20, "setReason:", CFSTR("reason:MailIntelligence-1; code:1"));
    v22 = dispatch_semaphore_create(0);
    objc_msgSend(v20, "setMaxCount:", a5);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v15, v20);
    v53 = *MEMORY[0x1E0D19A28];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBundleIDs:", v24);

    v25 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __95__SGMISpotlightUtility_queryFromDaysAgo_throughDaysAgo_limit_withError_simulatedCSSIs_handler___block_invoke;
    v42[3] = &unk_1E7DB12B8;
    v43 = v14;
    v44 = &v49;
    objc_msgSend(v23, "setFoundItemsHandler:", v42);
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__24786;
    v40 = __Block_byref_object_dispose__24787;
    v41 = 0;
    v33[0] = v25;
    v33[1] = 3221225472;
    v33[2] = __95__SGMISpotlightUtility_queryFromDaysAgo_throughDaysAgo_limit_withError_simulatedCSSIs_handler___block_invoke_14;
    v33[3] = &unk_1E7DB12E0;
    v26 = v22;
    v34 = v26;
    v35 = &v36;
    objc_msgSend(v23, "setCompletionHandler:", v33);
    objc_msgSend(v23, "start");
    v27 = 601;
    while (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v26, 1.0) == 1)
    {
      if (*((_BYTE *)v50 + 24))
      {
        sgMailIntelligenceLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v29 = "SGMISpotlightUtility got signal to exit";
LABEL_27:
          _os_log_debug_impl(&dword_1C3607000, v28, OS_LOG_TYPE_DEBUG, v29, buf, 2u);
        }
LABEL_22:

        objc_msgSend(v23, "cancel");
        goto LABEL_23;
      }
      if (!--v27)
      {
        sgMailIntelligenceLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v29 = "SGMISpotlightUtility Query by time range timed out";
          goto LABEL_27;
        }
        goto LABEL_22;
      }
    }
    if (a6)
    {
      v30 = (void *)v37[5];
      if (v30)
      {
        v18 = 0;
        *a6 = objc_retainAutorelease(v30);
        goto LABEL_24;
      }
    }
LABEL_23:
    v18 = 1;
LABEL_24:

    _Block_object_dispose(&v36, 8);
  }
LABEL_25:

  _Block_object_dispose(&v49, 8);
  return v18;
}

+ (void)querySentMailsForNicknameMatchingFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 handler:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  unsigned int v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint8_t buf[8];
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("contentType == \"public.email-message\" && InRange(kMDItemContentCreationDate, $time.now(-%lu), $time.now(-%lu)) && kMDItemMailboxes == \"mailbox.sent\"), 86400 * a3, 86400 * a4);
  v11 = (void *)objc_opt_new();
  +[SGMISpotlightUtility nicknameCSSearchQueryContextFetchAttributes](SGMISpotlightUtility, "nicknameCSSearchQueryContextFetchAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFetchAttributes:", v12);

  objc_msgSend(v11, "setLowPriority:", 1);
  objc_msgSend(v11, "setReason:", CFSTR("reason:MailIntelligence-2; code:1"));
  v13 = dispatch_semaphore_create(0);
  objc_msgSend(v11, "setMaxCount:", a5);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v10, v11);
  v36[0] = *MEMORY[0x1E0D19A28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBundleIDs:", v15);

  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __98__SGMISpotlightUtility_querySentMailsForNicknameMatchingFromDaysAgo_throughDaysAgo_limit_handler___block_invoke;
  v29[3] = &unk_1E7DB12B8;
  v17 = v9;
  v30 = v17;
  v31 = &v32;
  objc_msgSend(v14, "setFoundItemsHandler:", v29);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__24786;
  v27[4] = __Block_byref_object_dispose__24787;
  v28 = 0;
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __98__SGMISpotlightUtility_querySentMailsForNicknameMatchingFromDaysAgo_throughDaysAgo_limit_handler___block_invoke_2;
  v24[3] = &unk_1E7DB12E0;
  v18 = v13;
  v25 = v18;
  v26 = v27;
  objc_msgSend(v14, "setCompletionHandler:", v24);
  objc_msgSend(v14, "start");
  v19 = 0;
  while (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v18, 1.0) == 1)
  {
    if (*((_BYTE *)v33 + 24))
    {
      sgMailIntelligenceLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v21 = v20;
        v22 = "SGMISpotlightUtility got signal to exit";
LABEL_9:
        _os_log_debug_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEBUG, v22, buf, 2u);
      }
    }
    else
    {
      if (v19 < 0x258)
        goto LABEL_11;
      sgMailIntelligenceLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v21 = v20;
        v22 = "SGMISpotlightUtility Query by time range timed out";
        goto LABEL_9;
      }
    }

    objc_msgSend(v14, "cancel");
LABEL_11:
    ++v19;
  }

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v32, 8);

}

+ (id)itemWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  +[SGMISpotlightUtility defaultCSSearchQueryContextFetchAttributes](SGMISpotlightUtility, "defaultCSSearchQueryContextFetchAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchAttributes:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("_kMDItemExternalID == \"%@\"), v5);
  objc_msgSend(v6, "setFilterQuery:", v8);

  objc_msgSend(v6, "setLowPriority:", 1);
  objc_msgSend(v6, "setReason:", CFSTR("reason:MailIntelligence-3; code:1"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", CFSTR("contentType == 'public.email-message'"), v6);
  v42[0] = *MEMORY[0x1E0D19A28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBundleIDs:", v10);

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__24786;
  v38 = __Block_byref_object_dispose__24787;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __55__SGMISpotlightUtility_itemWithUniqueIdentifier_error___block_invoke;
  v29[3] = &unk_1E7DB1308;
  v29[4] = &v30;
  v29[5] = &v34;
  objc_msgSend(v9, "setFoundItemsHandler:", v29);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__24786;
  v27 = __Block_byref_object_dispose__24787;
  v28 = 0;
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __55__SGMISpotlightUtility_itemWithUniqueIdentifier_error___block_invoke_2;
  v20[3] = &unk_1E7DB12E0;
  v12 = dispatch_semaphore_create(0);
  v21 = v12;
  v22 = &v23;
  objc_msgSend(v9, "setCompletionHandler:", v20);
  objc_msgSend(v9, "start");
  v13 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    sgMailIntelligenceLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "SGMISpotlightUtility: Query by item timed out.", buf, 2u);
    }

    objc_msgSend(v9, "cancel");
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
  sgMailIntelligenceLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v31[3];
    *(_DWORD *)buf = 134217984;
    v41 = v16;
    _os_log_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEFAULT, "SGMISpotlightUtility: Found item count was %lu", buf, 0xCu);
  }

  if (a4)
  {
    v17 = (void *)v24[5];
    if (v17)
      *a4 = objc_retainAutorelease(v17);
  }
  v18 = (id)v35[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

+ (id)findDeletedEmailAddresses:(id)a3 mdSearchableItemAttribute:(id)a4 fromDaysAgo:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  dispatch_semaphore_t v21;
  NSObject *v22;
  id v23;
  dispatch_time_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  uint8_t *v35;
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint8_t v45[4];
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];

  v48[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  sgMailIntelligenceLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_INFO, "SGMISpotlightUtility: Finding email addresses to delete", buf, 2u);
  }

  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v48[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFetchAttributes:", v14);

  objc_msgSend(v12, "setMaxCount:", 10000);
  objc_msgSend(v12, "setLowPriority:", 1);
  objc_msgSend(v12, "setReason:", CFSTR("reason:MailIntelligence-4; code:1"));
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ == * && InRange(kMDItemContentCreationDate, $time.now(-%lu), $time.now)"), v10, a5);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v15, v12);
  v47 = *MEMORY[0x1E0D19A28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBundleIDs:", v17);

  v18 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __94__SGMISpotlightUtility_findDeletedEmailAddresses_mdSearchableItemAttribute_fromDaysAgo_error___block_invoke;
  v42[3] = &unk_1E7DB1330;
  v19 = v10;
  v43 = v19;
  v20 = v13;
  v44 = v20;
  objc_msgSend(v16, "setFoundItemsHandler:", v42);
  v21 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  v37 = buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__24786;
  v40 = __Block_byref_object_dispose__24787;
  v41 = 0;
  v32[0] = v18;
  v32[1] = 3221225472;
  v32[2] = __94__SGMISpotlightUtility_findDeletedEmailAddresses_mdSearchableItemAttribute_fromDaysAgo_error___block_invoke_2;
  v32[3] = &unk_1E7DB1358;
  v22 = v21;
  v33 = v22;
  v23 = v19;
  v34 = v23;
  v35 = buf;
  objc_msgSend(v16, "setCompletionHandler:", v32);
  objc_msgSend(v16, "start");
  v24 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v22, v24))
  {
    sgMailIntelligenceLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v45 = 138412290;
      v46 = (uint64_t)v23;
      _os_log_error_impl(&dword_1C3607000, v25, OS_LOG_TYPE_ERROR, "SGMISpotlightUtility: Query existence as %@ timed out.", v45, 0xCu);
    }

    objc_msgSend(v16, "cancel");
    dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a6)
  {
    v26 = (void *)*((_QWORD *)v37 + 5);
    if (v26)
      *a6 = objc_retainAutorelease(v26);
  }
  sgMailIntelligenceLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = objc_msgSend(v20, "count");
    *(_DWORD *)v45 = 134217984;
    v46 = v28;
    _os_log_impl(&dword_1C3607000, v27, OS_LOG_TYPE_INFO, "SGMISpotlightUtility: Addresses found in Spotlight: %lu", v45, 0xCu);
  }

  v29 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v20, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "removeObjectsInArray:", v30);

  _Block_object_dispose(buf, 8);
  return v29;
}

+ (id)queryEmailsFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 fetchAttributes:(id)a5 filterQuery:(id)a6 queryString:(id)a7 bundleIds:(id)a8 spotlightTimeOut:(unint64_t)a9 withError:(id *)a10
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  dispatch_time_t v21;
  NSObject *v22;
  id v23;
  uint8_t buf[16];
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setFetchAttributes:", v13);
  objc_msgSend(v17, "setFilterQuery:", v14);
  objc_msgSend(v17, "setLowPriority:", 1);
  objc_msgSend(v17, "setReason:", CFSTR("reason:MailIntelligence-5; code:1"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v15, v17);
  objc_msgSend(v18, "setBundleIDs:", v16);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__24786;
  v36 = __Block_byref_object_dispose__24787;
  v19 = MEMORY[0x1E0C809B0];
  v37 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __139__SGMISpotlightUtility_queryEmailsFromDaysAgo_throughDaysAgo_fetchAttributes_filterQuery_queryString_bundleIds_spotlightTimeOut_withError___block_invoke;
  v31[3] = &unk_1E7DB1380;
  v31[4] = &v32;
  objc_msgSend(v18, "setFoundItemsHandler:", v31);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__24786;
  v29[4] = __Block_byref_object_dispose__24787;
  v30 = 0;
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __139__SGMISpotlightUtility_queryEmailsFromDaysAgo_throughDaysAgo_fetchAttributes_filterQuery_queryString_bundleIds_spotlightTimeOut_withError___block_invoke_2;
  v26[3] = &unk_1E7DB12E0;
  v20 = dispatch_semaphore_create(0);
  v27 = v20;
  v28 = v29;
  objc_msgSend(v18, "setCompletionHandler:", v26);
  objc_msgSend(v18, "start");
  if (a9)
  {
    if (a9 <= 0x225C17D04)
      v21 = dispatch_time(0, (uint64_t)((double)a9 * 1000000000.0));
    else
      v21 = -1;
  }
  else
  {
    v21 = 0;
  }
  if (dispatch_semaphore_wait(v20, v21))
  {
    sgMailIntelligenceLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v22, OS_LOG_TYPE_DEBUG, "SGMISpotlightUtility: Query by item timed out.", buf, 2u);
    }

    objc_msgSend(v18, "cancel");
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  }
  v23 = (id)v33[5];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v32, 8);

  return v23;
}

void __139__SGMISpotlightUtility_queryEmailsFromDaysAgo_throughDaysAgo_fetchAttributes_filterQuery_queryString_bundleIds_spotlightTimeOut_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __139__SGMISpotlightUtility_queryEmailsFromDaysAgo_throughDaysAgo_fetchAttributes_filterQuery_queryString_bundleIds_spotlightTimeOut_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v4)
  {
    sgMailIntelligenceLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "SGMISpotlightUtility got an error from Spotlight: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __94__SGMISpotlightUtility_findDeletedEmailAddresses_mdSearchableItemAttribute_fromDaysAgo_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v6);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v7, "attributeSet");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "attributeForKey:", *(_QWORD *)(a1 + 32));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v18;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(a1 + 40);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "lowercaseString");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v15);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v11);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v4);
  }

}

void __94__SGMISpotlightUtility_findDeletedEmailAddresses_mdSearchableItemAttribute_fromDaysAgo_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v4)
  {
    sgMailIntelligenceLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "SGMISpotlightUtility got an error from Spotlight while querying existence as %@: %@", (uint8_t *)&v7, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

void __55__SGMISpotlightUtility_itemWithUniqueIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "count");
  objc_msgSend(v3, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __55__SGMISpotlightUtility_itemWithUniqueIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v4)
  {
    sgMailIntelligenceLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "SGMISpotlightUtility got an error from Spotlight: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __98__SGMISpotlightUtility_querySentMailsForNicknameMatchingFromDaysAgo_throughDaysAgo_limit_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "standardizeCSPersons");
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __98__SGMISpotlightUtility_querySentMailsForNicknameMatchingFromDaysAgo_throughDaysAgo_limit_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v4)
  {
    sgMailIntelligenceLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "SGMISpotlightUtility got an error from Spotlight: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __95__SGMISpotlightUtility_queryFromDaysAgo_throughDaysAgo_limit_withError_simulatedCSSIs_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "standardizeCSPersons");
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __95__SGMISpotlightUtility_queryFromDaysAgo_throughDaysAgo_limit_withError_simulatedCSSIs_handler___block_invoke_14(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v4)
  {
    sgMailIntelligenceLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "SGMISpotlightUtility got an error from Spotlight: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

@end
