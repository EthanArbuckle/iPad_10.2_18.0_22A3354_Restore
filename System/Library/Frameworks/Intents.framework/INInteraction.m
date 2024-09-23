@implementation INInteraction

- (void)encodeWithCoder:(id)a3
{
  INIntent *intent;
  id v5;

  intent = self->_intent;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", intent, CFSTR("intent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentResponse, CFSTR("intentResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextExtensionUUID, CFSTR("_contextExtensionUUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_direction, CFSTR("direction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("groupIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_intentHandlingStatus, CFSTR("intentHandlingStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_donatedBySiri, CFSTR("_donatedBySiri"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_snippet, CFSTR("_snippet"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (INInteractionDirection)direction
{
  return self->_direction;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithIntent:(id)a3 response:(id)a4
{
  id v7;
  id v8;
  INInteraction *v9;
  INInteraction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INInteraction;
  v9 = -[INInteraction init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[INInteraction _commonInit](v9, "_commonInit");
    objc_storeStrong((id *)&v10->_intent, a3);
    objc_storeStrong((id *)&v10->_intentResponse, a4);
    v10->_intentHandlingStatus = objc_msgSend(v8, "_intentHandlingStatus");
  }

  return v10;
}

- (void)_commonInit
{
  id v3;
  void *v4;
  NSDateInterval *v5;
  NSDateInterval *dateInterval;
  void *v7;
  NSString *v8;
  NSString *identifier;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSDateInterval *)objc_msgSend(v3, "initWithStartDate:duration:", v4, 0.0);
  dateInterval = self->_dateInterval;
  self->_dateInterval = v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v8;

  self->_donatedBySiri = 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_contextExtensionUUID, 0);
  objc_storeStrong((id *)&self->_snippet, 0);
  objc_storeStrong((id *)&self->_intentResponse, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

+ (void)deleteAllInteractionsWithCompletion:(void *)completion
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = completion;
  objc_msgSend(getCSSearchableIndexClass(), "defaultSearchableIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__INInteraction_deleteAllInteractionsWithCompletion___block_invoke;
  v6[3] = &unk_1E228EBA0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "deleteAllInteractionsWithCompletionHandler:", v6);

}

- (INIntent)intent
{
  return self->_intent;
}

void __53__INInteraction_deleteAllInteractionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB3388];
      v10[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 1902, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
    }
  }

}

- (INInteraction)initWithCoder:(id)a3
{
  id v4;
  INInteraction *v5;
  uint64_t v6;
  INIntent *intent;
  uint64_t v8;
  INIntentResponse *intentResponse;
  uint64_t v10;
  NSUUID *contextExtensionUUID;
  uint64_t v12;
  NSDateInterval *dateInterval;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSString *groupIdentifier;
  void *v18;
  id v19;
  uint64_t v20;
  SAUISnippet *snippet;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v5 = -[INInteraction _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
    v6 = objc_claimAutoreleasedReturnValue();
    intent = v5->_intent;
    v5->_intent = (INIntent *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentResponse"));
    v8 = objc_claimAutoreleasedReturnValue();
    intentResponse = v5->_intentResponse;
    v5->_intentResponse = (INIntentResponse *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contextExtensionUUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    contextExtensionUUID = v5->_contextExtensionUUID;
    v5->_contextExtensionUUID = (NSUUID *)v10;

    v5->_direction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("direction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
    v12 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v16;

    v5->_intentHandlingStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("intentHandlingStatus"));
    v5->_donatedBySiri = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_donatedBySiri"));
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v18 = (void *)getSAUISnippetClass_softClass;
    v27 = getSAUISnippetClass_softClass;
    if (!getSAUISnippetClass_softClass)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __getSAUISnippetClass_block_invoke;
      v23[3] = &unk_1E22953C0;
      v23[4] = &v24;
      __getSAUISnippetClass_block_invoke((uint64_t)v23);
      v18 = (void *)v25[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v24, 8);
    if (v19)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, CFSTR("_snippet"));
      v20 = objc_claimAutoreleasedReturnValue();
      snippet = v5->_snippet;
      v5->_snippet = (SAUISnippet *)v20;

    }
  }

  return v5;
}

void __59__INInteraction__donateInteractionWithBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = INSiriLogContextIntents;
  if (v6 && os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v21 = "-[INInteraction _donateInteractionWithBundleId:completion:]_block_invoke";
    v22 = 2112;
    v23 = v14;
    v24 = 2114;
    v25 = v6;
    _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Error injecting image proxies into %{publc}@: %{public}@", buf, 0x20u);
    v7 = INSiriLogContextIntents;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    v21 = "-[INInteraction _donateInteractionWithBundleId:completion:]_block_invoke";
    v22 = 2112;
    v23 = v8;
    v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_INFO, "%s Adding interaction (%@) to searchable index for %{public}@", buf, 0x20u);
  }
  v11 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  v12 = *MEMORY[0x1E0CB2AC0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__INInteraction__donateInteractionWithBundleId_completion___block_invoke_66;
  v15[3] = &unk_1E2289EF0;
  v19 = *(id *)(a1 + 64);
  v16 = v5;
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v13 = v5;
  objc_msgSend(v10, "addInteraction:bundleID:protectionClass:completionHandler:", v13, v11, v12, v15);

}

uint64_t __52__INInteraction__injectProxiesForImages_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_setIntent:", a2);
  return result;
}

uint64_t __52__INInteraction__injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __49__INInteraction_donateInteractionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void **v27;
  uint64_t *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  __CFString *v32;
  uint64_t v33;
  INIntent *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void (**v64)(_QWORD, _QWORD, _QWORD);
  void *v65;
  int isKindOfClass;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t CanDonateIntent;
  void *v82;
  NSObject *v83;
  void *v84;
  __CFString *v85;
  void *v86;
  void *v87;
  __CFString *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  __CFString *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  __CFString *v96;
  _QWORD v97[5];
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint8_t buf[4];
  const char *v110;
  __int16 v111;
  __CFString *v112;
  __int16 v113;
  __CFString *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "intent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_type");

  v4 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if (v3 > 3)
      v5 = 0;
    else
      v5 = off_1E2289F88[v3];
    v6 = *(void **)(a1 + 32);
    v7 = v4;
    objc_msgSend(v6, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_className");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
    v111 = 2114;
    v112 = v5;
    v113 = 2114;
    v114 = v9;
    _os_log_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_INFO, "%s Donate interaction for %{public}@ intent: %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (!*(_QWORD *)(a1 + 40))
      return;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot donate interaction with nil identifier: %@"), *(_QWORD *)(a1 + 32));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_18BEBC000, v23, OS_LOG_TYPE_ERROR, "%s Cannot donate interaction with nil identifier", buf, 0xCu);
    }
    v24 = *(_QWORD *)(a1 + 40);
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v107 = *MEMORY[0x1E0CB2D50];
    v108 = v21;
    v26 = (void *)MEMORY[0x1E0C99D80];
    v27 = &v108;
    v28 = &v107;
LABEL_18:
    objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 1901, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v30);

LABEL_19:
    return;
  }
  if (v3 == 3)
    goto LABEL_39;
  objc_msgSend(*(id *)(a1 + 32), "intent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_validParameterCombinations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    if (v3 == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "intent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_codableDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isDeprecated");

      if (v16)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = *(void **)(a1 + 32);
        objc_msgSend(v18, "intent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_className");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("Cannot donate interaction (%@) because intent (%@) has been deprecated"), v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)INSiriLogContextIntents;
        if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          if (!v21)
            goto LABEL_39;
          goto LABEL_37;
        }
        v86 = *(void **)(a1 + 32);
        v47 = v22;
        objc_msgSend(v86, "intent");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "_className");
        v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
        v111 = 2112;
        v112 = v88;
        _os_log_error_impl(&dword_18BEBC000, v47, OS_LOG_TYPE_ERROR, "%s Cannot donate interaction because intent (%@) has been deprecated", buf, 0x16u);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "intent");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "_hasTitle");

        if ((v44 & 1) != 0)
          goto LABEL_39;
        objc_msgSend(*(id *)(a1 + 32), "intent");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "_nonNilParameters");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "mutableCopy");

        objc_msgSend(*(id *)(a1 + 32), "intent");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_ignoredParameters");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject minusSet:](v47, "minusSet:", v49);

        if (-[NSObject count](v47, "count"))
        {
          -[NSObject allObjects](v47, "allObjects");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "componentsJoinedByString:", CFSTR(", "));
          v51 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v51 = CFSTR("(No Parameters)");
        }
        v52 = (void *)MEMORY[0x1E0CB3940];
        v53 = *(void **)(a1 + 32);
        objc_msgSend(v53, "intent");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "_className");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stringWithFormat:", CFSTR("Cannot donate interaction because intent title is empty: %@ Please make sure that your intent definition includes the following shortcut type for %@: %@."), v53, v55, v51);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = (void *)INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          v89 = *(void **)(a1 + 32);
          v90 = v56;
          objc_msgSend(v89, "intent");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "_className");
          v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
          v111 = 2114;
          v112 = v92;
          v113 = 2112;
          v114 = v51;
          _os_log_error_impl(&dword_18BEBC000, v90, OS_LOG_TYPE_ERROR, "%s Cannot donate interaction (%{public}@) because intent title is empty. Missing parameter combination: %@", buf, 0x20u);

        }
      }

      if (v21)
      {
LABEL_37:
        v24 = *(_QWORD *)(a1 + 40);
        if (!v24)
          goto LABEL_19;
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v103 = *MEMORY[0x1E0CB2D50];
        v104 = v21;
        v26 = (void *)MEMORY[0x1E0C99D80];
        v27 = &v104;
        v28 = &v103;
        goto LABEL_18;
      }
    }
LABEL_39:
    objc_msgSend(*(id *)(a1 + 32), "intent");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "_intents_launchIdForCurrentPlatform");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = 0;
    INExtractAppInfoFromSiriLaunchId(v58, &v100, 0);
    v59 = v100;

    objc_msgSend(*(id *)(a1 + 32), "intent");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "_intentInstanceDescription");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)objc_msgSend(v61, "facadeClass"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __49__INInteraction_donateInteractionWithCompletion___block_invoke_47;
    v97[3] = &unk_1E2289EC8;
    v97[4] = *(_QWORD *)(a1 + 32);
    v63 = v59;
    v98 = v63;
    v99 = *(id *)(a1 + 40);
    v64 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x18D7812C4](v97);
    if ((INThisProcessIsDonatingBySiri() & 1) != 0)
      goto LABEL_44;
    if (INThisProcessIsSystemProcess_onceToken != -1)
      dispatch_once(&INThisProcessIsSystemProcess_onceToken, &__block_literal_global_32_68971);
    if (INThisProcessIsSystemProcess_isSystemProcess
      || INThisProcessHasEntitlement(CFSTR("com.apple.private.corespotlight.internal"), 0))
    {
LABEL_44:
      v64[2](v64, 1, 1);
LABEL_45:

      return;
    }
    if (v62)
    {
      objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend(v65, "bundleType");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "isEqualToString:", *MEMORY[0x1E0CA5808]) & isKindOfClass ^ 1;

      if ((isKindOfClass & 1) != 0)
      {
        v69 = v65;
        v70 = 1;
        objc_msgSend(v69, "objectForInfoDictionaryKey:ofClass:inScope:", *MEMORY[0x1E0D7D480], objc_opt_class(), 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v69, "if_isWatchKitAppExtension") & 1) == 0)
        {
          v70 = v68;
          if (objc_msgSend(v71, "isEqualToString:", CFSTR("com.apple.intents-service")))
          {
            v72 = *(_QWORD *)(a1 + 40);
            if (v72)
              (*(void (**)(uint64_t, _QWORD))(v72 + 16))(v72, 0);

            goto LABEL_45;
          }
        }

        v68 = v70;
      }
      CanDonateIntent = INBundleProxyCanDonateIntent(v65, v62);
      v64[2](v64, CanDonateIntent, v68);
    }
    else
    {
      if (!*(_QWORD *)(a1 + 40))
        goto LABEL_45;
      v73 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "intent");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "_className");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "stringWithFormat:", CFSTR("Donating intent '%@' is not supported."), v75);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v76 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v93 = *(void **)(a1 + 32);
        v94 = v76;
        objc_msgSend(v93, "intent");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "_className");
        v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
        v111 = 2114;
        v112 = v96;
        _os_log_error_impl(&dword_18BEBC000, v94, OS_LOG_TYPE_ERROR, "%s Donating %{public}@ is not supported", buf, 0x16u);

      }
      v77 = *(_QWORD *)(a1 + 40);
      v78 = (void *)MEMORY[0x1E0CB35C8];
      v101 = *MEMORY[0x1E0CB2D50];
      v102 = v65;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 1901, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v77 + 16))(v77, v80);

    }
    goto LABEL_45;
  }
  v31 = INSiriLogContextIntents;
  if (v3 == 1)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v32 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
      v111 = 2112;
      v112 = v32;
      _os_log_impl(&dword_18BEBC000, v31, OS_LOG_TYPE_INFO, "%s Not donating system intent because it does not have any valid parameter combinations: %@", buf, 0x16u);
    }
    v33 = *(_QWORD *)(a1 + 40);
    if (v33)
      (*(void (**)(uint64_t, _QWORD))(v33 + 16))(v33, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v82 = *(void **)(a1 + 32);
      v83 = v31;
      objc_msgSend(v82, "intent");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "_className");
      v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
      v111 = 2114;
      v112 = v85;
      _os_log_error_impl(&dword_18BEBC000, v83, OS_LOG_TYPE_ERROR, "%s Cannot donate interaction with %{public}@ that has no valid shortcut types", buf, 0x16u);

    }
    if (*(_QWORD *)(a1 + 40))
    {
      v21 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      v34 = objc_alloc_init(INIntent);
      objc_msgSend(v21, "_setIntent:", v34);

      v35 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "intent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "description");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("Cannot donate interaction with intent that has no valid shortcut types: %@ for intent %@"), v21, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = *(_QWORD *)(a1 + 40);
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v105 = *MEMORY[0x1E0CB2D50];
      v106 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 1901, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v42);

      goto LABEL_19;
    }
  }
}

- (void)setIntentHandlingStatus:(int64_t)a3
{
  self->_intentHandlingStatus = a3;
}

- (void)setIdentifier:(NSString *)identifier
{
  objc_setProperty_nonatomic_copy(self, a2, identifier, 72);
}

- (void)setGroupIdentifier:(NSString *)groupIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, groupIdentifier, 80);
}

- (void)setDirection:(INInteractionDirection)direction
{
  self->_direction = direction;
}

- (void)setDateInterval:(NSDateInterval *)dateInterval
{
  objc_setProperty_nonatomic_copy(self, a2, dateInterval, 64);
}

- (INIntentResponse)intentResponse
{
  return self->_intentResponse;
}

- (INIntentHandlingStatus)intentHandlingStatus
{
  return self->_intentHandlingStatus;
}

- (INInteraction)initWithIntent:(INIntent *)intent response:(INIntentResponse *)response
{
  INIntent *v6;
  INIntentResponse *v7;
  INInteraction *v8;
  INInteraction *v9;
  uint64_t v10;
  INIntent *v11;
  uint64_t v12;
  INIntentResponse *intentResponse;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  INInteraction *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = intent;
  v7 = response;
  v16.receiver = self;
  v16.super_class = (Class)INInteraction;
  v8 = -[INInteraction init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    -[INInteraction _commonInit](v8, "_commonInit");
    v10 = -[INIntent copy](v6, "copy");
    v11 = v9->_intent;
    v9->_intent = (INIntent *)v10;

    v12 = -[INIntentResponse copy](v7, "copy");
    intentResponse = v9->_intentResponse;
    v9->_intentResponse = (INIntentResponse *)v12;

    v9->_intentHandlingStatus = -[INIntentResponse _intentHandlingStatus](v7, "_intentHandlingStatus");
    if (!v6)
    {
      v14 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[INInteraction initWithIntent:response:]";
        v19 = 2112;
        v20 = v9;
        _os_log_fault_impl(&dword_18BEBC000, v14, OS_LOG_TYPE_FAULT, "%s No intent was provided in the interaction: %@", buf, 0x16u);
      }
    }
  }

  return v9;
}

- (void)donateInteractionWithCompletion:(void *)completion
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = completion;
  if (_INInteractionDonationQueue_onceToken != -1)
    dispatch_once(&_INInteractionDonationQueue_onceToken, &__block_literal_global_4208);
  v5 = _INInteractionDonationQueue_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__INInteraction_donateInteractionWithCompletion___block_invoke;
  v7[3] = &unk_1E2293BE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  _BYTE *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[INInteraction intent](self, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INInteraction intentResponse](self, "intentResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_BYTE *)objc_msgSend(v5, "initWithIntent:response:", v6, v7);

  if (v8)
  {
    -[INInteraction identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", v9);

    -[INInteraction dateInterval](self, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDateInterval:", v10);

    -[INInteraction groupIdentifier](self, "groupIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGroupIdentifier:", v11);

    objc_msgSend(v8, "setDirection:", -[INInteraction direction](self, "direction"));
    objc_msgSend(v8, "setIntentHandlingStatus:", -[INInteraction intentHandlingStatus](self, "intentHandlingStatus"));
    v8[24] = -[INInteraction _donatedBySiri](self, "_donatedBySiri");
    -[INInteraction _contextExtensionUUID](self, "_contextExtensionUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setContextExtensionUUID:", v12);

    -[INInteraction _snippet](self, "_snippet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
    objc_msgSend(v8, "_setSnippet:", v14);

  }
  return v8;
}

- (SAUISnippet)_snippet
{
  return self->_snippet;
}

- (void)_setSnippet:(id)a3
{
  objc_storeStrong((id *)&self->_snippet, a3);
}

- (void)_setIntent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)_setContextExtensionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  INImageProxyInjectionOperation *v16;
  INImageProxyInjectionOperation *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;

  v18 = a3;
  v6 = a4;
  -[INInteraction intent](self, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INInteraction intentResponse](self, "intentResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)-[INInteraction copy](self, "copy");
  v10 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  INImageProxyInjectionQueue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUnderlyingQueue:", v11);

  objc_msgSend(v10, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v10, "setSuspended:", 1);
  v12 = (void *)MEMORY[0x1E0CB34C8];
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52__INInteraction__injectProxiesForImages_completion___block_invoke;
  v22[3] = &unk_1E2293BE8;
  v14 = v6;
  v22[4] = v9;
  v23 = v14;
  objc_msgSend(v12, "blockOperationWithBlock:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v16 = objc_alloc_init(INImageProxyInjectionOperation);
    -[INImageProxyInjectionOperation setInjector:](v16, "setInjector:", v7);
    -[INImageProxyInjectionOperation setImageProxyRequestBlock:](v16, "setImageProxyRequestBlock:", v18);
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __52__INInteraction__injectProxiesForImages_completion___block_invoke_2;
    v21[3] = &unk_1E22924C0;
    v21[4] = v9;
    -[INImageProxyInjectionOperation setCopyReturnBlock:](v16, "setCopyReturnBlock:", v21);
    objc_msgSend(v15, "addDependency:", v16);
    objc_msgSend(v10, "addOperation:", v16);

  }
  if (v8)
  {
    v17 = objc_alloc_init(INImageProxyInjectionOperation);
    -[INImageProxyInjectionOperation setInjector:](v17, "setInjector:", v8);
    -[INImageProxyInjectionOperation setImageProxyRequestBlock:](v17, "setImageProxyRequestBlock:", v18);
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __52__INInteraction__injectProxiesForImages_completion___block_invoke_3;
    v20[3] = &unk_1E22924C0;
    v20[4] = v9;
    -[INImageProxyInjectionOperation setCopyReturnBlock:](v17, "setCopyReturnBlock:", v20);
    objc_msgSend(v15, "addDependency:", v17);
    objc_msgSend(v10, "addOperation:", v17);

  }
  objc_msgSend(v10, "addOperation:", v15, v18);
  objc_msgSend(v10, "setSuspended:", 0);

}

- (id)_init
{
  return -[INInteraction _initWithIntent:response:](self, "_initWithIntent:response:", 0, 0);
}

- (BOOL)_donatedBySiri
{
  return self->_donatedBySiri;
}

- (void)_donateInteractionWithBundleId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  const __CFString *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(getCSSearchableIndexClass(), "defaultSearchableIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_donatedBySiri)
    self->_donatedBySiri = INThisProcessIsDonatingBySiri();
  INInteractionWithTypedInteraction(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "direction"))
  {
    objc_msgSend(v9, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDirection:", objc_msgSend(v10, "_preferredInteractionDirection"));

  }
  objc_msgSend(v9, "intent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_className");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_contextExtensionUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    +[INIntent _sharedExtensionContextUUIDForIntentClassName:](INIntent, "_sharedExtensionContextUUIDForIntentClassName:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setContextExtensionUUID:", v14);

  }
  v15 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    v17 = -[INInteraction _donatedBySiri](self, "_donatedBySiri");
    v18 = CFSTR("NO");
    v34 = "-[INInteraction _donateInteractionWithBundleId:completion:]";
    *(_DWORD *)buf = 136315650;
    if (v17)
      v18 = CFSTR("YES");
    v35 = 2114;
    v36 = v18;
    v37 = 2112;
    v38 = v9;
    _os_log_impl(&dword_18BEBC000, v16, OS_LOG_TYPE_INFO, "%s Donating on behalf of Siri: %{public}@ for %@", buf, 0x20u);

  }
  objc_msgSend(v9, "intent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_intents_preferredScaledImageSize");
  v21 = v20;
  v23 = v22;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __59__INInteraction__donateInteractionWithBundleId_completion___block_invoke;
  v28[3] = &unk_1E2289F18;
  v28[4] = self;
  v29 = v12;
  v30 = v6;
  v31 = v8;
  v32 = v7;
  v24 = v7;
  v25 = v8;
  v26 = v6;
  v27 = v12;
  INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler(v9, 0x15u, 0, 1, 0, v28, v21, v23);

}

- (NSUUID)_contextExtensionUUID
{
  return self->_contextExtensionUUID;
}

- (NSDate)date
{
  void *v2;
  void *v3;

  -[INInteraction dateInterval](self, "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3588];
  v5 = a3;
  v6 = [v4 alloc];
  -[INInteraction dateInterval](self, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "duration");
  v8 = (id)objc_msgSend(v6, "initWithStartDate:duration:", v5);

  -[INInteraction setDateInterval:](self, "setDateInterval:", v8);
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[INInteraction dateInterval](self, "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (void)setDuration:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  -[INInteraction dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v10, a3);
  -[INInteraction setDateInterval:](self, "setDateInterval:", v9);

}

- (void)_setDonatedBySiri:(BOOL)a3
{
  BOOL v5;

  if (INThisProcessIsSystemProcess_onceToken != -1)
    dispatch_once(&INThisProcessIsSystemProcess_onceToken, &__block_literal_global_32_68971);
  if (INThisProcessIsSystemProcess_isSystemProcess)
    v5 = a3;
  else
    v5 = 0;
  self->_donatedBySiri = v5;
}

- (INImage)_keyImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[INInteraction intentResponse](self, "intentResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_keyImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[INInteraction intent](self, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_keyImage");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (INImage *)v6;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_keyImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_keyImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = 1;
    else
      v9 = -1;
  }
  else
  {
    if (v8)
      v10 = -1;
    else
      v10 = 0;
    if (v7)
      v9 = 1;
    else
      v9 = v10;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  INInteraction *v4;
  INInteraction *v5;
  NSString *identifier;
  INIntent *intent;
  INIntentResponse *intentResponse;
  NSDateInterval *dateInterval;
  NSString *groupIdentifier;
  NSUUID *contextExtensionUUID;
  SAUISnippet *snippet;
  BOOL v13;

  v4 = (INInteraction *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v13 = 0;
      if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
      {
        intent = self->_intent;
        if (intent == v5->_intent || -[INIntent isEqual:](intent, "isEqual:"))
        {
          intentResponse = self->_intentResponse;
          if (intentResponse == v5->_intentResponse
            || -[INIntentResponse isEqual:](intentResponse, "isEqual:"))
          {
            dateInterval = self->_dateInterval;
            if (dateInterval == v5->_dateInterval || -[NSDateInterval isEqual:](dateInterval, "isEqual:"))
            {
              groupIdentifier = self->_groupIdentifier;
              if ((groupIdentifier == v5->_groupIdentifier
                 || -[NSString isEqual:](groupIdentifier, "isEqual:"))
                && self->_direction == v5->_direction
                && self->_donatedBySiri == v5->_donatedBySiri)
              {
                contextExtensionUUID = self->_contextExtensionUUID;
                if (contextExtensionUUID == v5->_contextExtensionUUID
                  || -[NSUUID isEqual:](contextExtensionUUID, "isEqual:"))
                {
                  snippet = self->_snippet;
                  if (snippet == v5->_snippet || -[SAUISnippet isEqual:](snippet, "isEqual:"))
                    v13 = 1;
                }
              }
            }
          }
        }
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  v3 = -[INIntent hash](self->_intent, "hash");
  v4 = -[INIntentResponse hash](self->_intentResponse, "hash") ^ v3;
  v5 = -[NSString hash](self->_identifier, "hash");
  v6 = v4 ^ v5 ^ -[NSDateInterval hash](self->_dateInterval, "hash");
  v7 = v6 ^ -[NSString hash](self->_groupIdentifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_direction);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_intentHandlingStatus);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 ^ v9 ^ objc_msgSend(v10, "hash");
  v12 = -[NSUUID hash](self->_contextExtensionUUID, "hash");
  v13 = v12 ^ -[SAUISnippet hash](self->_snippet, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_donatedBySiri);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11 ^ v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (NSString)description
{
  return (NSString *)-[INInteraction descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INInteraction;
  -[INInteraction description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INInteraction _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t intent;
  INIntentResponse *intentResponse;
  uint64_t v5;
  INIntentHandlingStatus v6;
  unint64_t v7;
  __CFString *v8;
  INInteractionDirection v9;
  unint64_t v10;
  __CFString *v11;
  NSDateInterval *dateInterval;
  void *v13;
  NSString *identifier;
  void *v15;
  NSString *groupIdentifier;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  _QWORD v25[7];
  _QWORD v26[9];

  v26[7] = *MEMORY[0x1E0C80C00];
  intent = (uint64_t)self->_intent;
  v24 = intent;
  v25[0] = CFSTR("intent");
  if (!intent)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    intent = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)intent;
  v26[0] = intent;
  v25[1] = CFSTR("intentResponse");
  intentResponse = self->_intentResponse;
  v5 = (uint64_t)intentResponse;
  if (!intentResponse)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v5;
  v26[1] = v5;
  v25[2] = CFSTR("intentHandlingStatus");
  v6 = -[INInteraction intentHandlingStatus](self, "intentHandlingStatus");
  v7 = v6;
  if ((unint64_t)v6 <= INIntentHandlingStatusUserConfirmationRequired)
  {
    v8 = off_1E2289FA8[v6];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v23 = v8;
  v26[2] = v8;
  v25[3] = CFSTR("direction");
  v9 = -[INInteraction direction](self, "direction");
  v10 = v9;
  if ((unint64_t)v9 <= INInteractionDirectionIncoming)
  {
    v11 = off_1E2289FE0[v9];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v11;
  v26[3] = v11;
  v25[4] = CFSTR("dateInterval");
  dateInterval = self->_dateInterval;
  v13 = dateInterval;
  if (!dateInterval)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[4] = v13;
  v25[5] = CFSTR("identifier");
  identifier = self->_identifier;
  v15 = identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[5] = v15;
  v25[6] = CFSTR("groupIdentifier");
  groupIdentifier = self->_groupIdentifier;
  v17 = groupIdentifier;
  if (!groupIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[6] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (groupIdentifier)
  {
    if (identifier)
      goto LABEL_19;
LABEL_30:

    if (dateInterval)
      goto LABEL_20;
    goto LABEL_31;
  }

  if (!identifier)
    goto LABEL_30;
LABEL_19:
  if (dateInterval)
    goto LABEL_20;
LABEL_31:

LABEL_20:
  if (v10 >= 3)

  if (v7 >= 7)
  if (!intentResponse)

  if (!v24)
  return v18;
}

- (CSSearchableItem)_searchableItem
{
  return (CSSearchableItem *)-[INInteraction _searchableItemIncludingData:](self, "_searchableItemIncludingData:", 0);
}

- (id)_searchableItemIncludingData:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  uint64_t v23;
  uint64_t v24;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v3 = a3;
  -[INInteraction intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isGenericIntent") & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = 0;
  }
  else
  {
    -[INInteraction intentResponse](self, "intentResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v7, "_intentResponseCode") - 5) >= 2)
    {
      v28 = 0;
      v29 = &v28;
      v30 = 0x2050000000;
      v8 = (void *)getCSSearchableItemAttributeSetClass_softClass;
      v31 = getCSSearchableItemAttributeSetClass_softClass;
      if (!getCSSearchableItemAttributeSetClass_softClass)
      {
        v23 = MEMORY[0x1E0C809B0];
        v24 = 3221225472;
        v25 = __getCSSearchableItemAttributeSetClass_block_invoke;
        v26 = &unk_1E22953C0;
        v27 = &v28;
        __getCSSearchableItemAttributeSetClass_block_invoke((uint64_t)&v23);
        v8 = (void *)v29[3];
      }
      v9 = objc_retainAutorelease(v8);
      _Block_object_dispose(&v28, 8);
      v10 = [v9 alloc];
      objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithItemContentType:", v11);

      if (objc_msgSend(v5, "configureAttributeSet:includingData:", v12, v3))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setContentCreationDate:", v13);

        -[INInteraction groupIdentifier](self, "groupIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setIdentifier:", v14);

        -[INInteraction dateInterval](self, "dateInterval");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setStartDate:", v16);

        objc_msgSend(v15, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setEndDate:", v17);

        objc_msgSend(v12, "uniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("com.apple.siri.interaction."), "stringByAppendingString:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = 0;
        v29 = &v28;
        v30 = 0x2050000000;
        v20 = (void *)getCSSearchableItemClass_softClass;
        v31 = getCSSearchableItemClass_softClass;
        if (!getCSSearchableItemClass_softClass)
        {
          v23 = MEMORY[0x1E0C809B0];
          v24 = 3221225472;
          v25 = __getCSSearchableItemClass_block_invoke;
          v26 = &unk_1E22953C0;
          v27 = &v28;
          __getCSSearchableItemClass_block_invoke((uint64_t)&v23);
          v20 = (void *)v29[3];
        }
        v21 = objc_retainAutorelease(v20);
        _Block_object_dispose(&v28, 8);
        v6 = (void *)objc_msgSend([v21 alloc], "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v19, CFSTR("com.apple.siri.interactions"), v12);

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (int64_t)_indexingHash
{
  void *v2;
  int64_t v3;

  -[INInteraction intent](self, "intent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_indexingHash");

  return v3;
}

- (id)parameterValueForParameter:(INParameter *)parameter
{
  INParameter *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = parameter;
  -[INParameter parameterClass](v4, "parameterClass");
  -[INInteraction intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INInteraction intentResponse](self, "intentResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[INInteraction intent](self, "intent");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_7:
      v9 = 0;
      goto LABEL_8;
    }
    -[INInteraction intentResponse](self, "intentResponse");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  if (!v7)
    goto LABEL_7;
  -[INParameter _parameterValueForParameterizedObject:](v4, "_parameterValueForParameterizedObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v9;
}

- (void)_setIntentResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

uint64_t __52__INInteraction__injectProxiesForImages_completion___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_setIntentResponse:", a2);
  return result;
}

void __59__INInteraction__donateInteractionWithBundleId_completion___block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
  {
    if (v3)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB3388];
      v23[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 1901, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = *(_QWORD *)(a1 + 56);
    }
    else
    {
      v7 = 0;
    }
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);

  }
  if (v3)
  {
    v8 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v14 = 136315906;
      v15 = "-[INInteraction _donateInteractionWithBundleId:completion:]_block_invoke";
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      v20 = 2114;
      v21 = v3;
      _os_log_error_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_ERROR, "%s Error donating interaction (%{public}@) for %{public}@: %{public}@", (uint8_t *)&v14, 0x2Au);
    }
  }
  else
  {
    if (INIsReservationInteraction(*(void **)(a1 + 32)))
      INValidateReservationInteraction(*(void **)(a1 + 32));
    v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v14 = 136315650;
      v15 = "-[INInteraction _donateInteractionWithBundleId:completion:]_block_invoke";
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_INFO, "%s Successfully donated interaction (%{public}@) for %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  ADClientAddValueForScalarKey();

}

void __49__INInteraction_donateInteractionWithCompletion___block_invoke_47(uint64_t a1, int a2, int a3)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v10 = CFSTR("extension");
      if (a3)
        v10 = CFSTR("app");
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = *(void **)(a1 + 32);
      v13 = v10;
      objc_msgSend(v12, "intent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Donating intent '%@' is not supported by this %@. Please make sure that you declare the intents that your %@ supports by including the NSUserActivityTypes key in its Info.plist or your %@ contains an Intents extension that supports this intent."), v16, v13, CFSTR("app"), CFSTR("app"));
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v24 = *(void **)(a1 + 32);
        v25 = v18;
        objc_msgSend(v24, "intent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "_className");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v34 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
        v35 = 2114;
        v36 = v27;
        v37 = 2114;
        v38 = v28;
        _os_log_error_impl(&dword_18BEBC000, v25, OS_LOG_TYPE_ERROR, "%s Can NOT donate %{public}@ for %{public}@", buf, 0x20u);

      }
      v19 = *(_QWORD *)(a1 + 48);
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 1901, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v22);
    }
    else
    {
      v23 = (void *)INSiriLogContextIntents;
      if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        return;
      v29 = *(void **)(a1 + 32);
      v17 = v23;
      objc_msgSend(v29, "intent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_className");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v34 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
      v35 = 2114;
      v36 = v21;
      v37 = 2114;
      v38 = v30;
      _os_log_error_impl(&dword_18BEBC000, v17, OS_LOG_TYPE_ERROR, "%s Can NOT donate %{public}@ for %{public}@", buf, 0x20u);
    }

    return;
  }
  v4 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_className");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v34 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
    v35 = 2114;
    v36 = v8;
    v37 = 2114;
    v38 = v9;
    _os_log_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_INFO, "%s Can donate %{public}@ for %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_donateInteractionWithBundleId:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (void)deleteInteractionsWithIdentifiers:(NSArray *)identifiers completion:(void *)completion
{
  void *v5;
  NSArray *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = completion;
  v6 = identifiers;
  objc_msgSend(getCSSearchableIndexClass(), "defaultSearchableIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__INInteraction_deleteInteractionsWithIdentifiers_completion___block_invoke;
  v9[3] = &unk_1E228EBA0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "deleteInteractionsWithIdentifiers:completionHandler:", v6, v9);

}

+ (void)deleteInteractionsWithGroupIdentifier:(NSString *)groupIdentifier completion:(void *)completion
{
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = completion;
  v6 = groupIdentifier;
  objc_msgSend(getCSSearchableIndexClass(), "defaultSearchableIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__INInteraction_deleteInteractionsWithGroupIdentifier_completion___block_invoke;
  v10[3] = &unk_1E228EBA0;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v7, "deleteInteractionsWithGroupIdentifiers:completionHandler:", v8, v10);

}

+ (unint64_t)_searchableItemVersion
{
  return 7;
}

void __66__INInteraction_deleteInteractionsWithGroupIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB3388];
      v10[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 1904, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
    }
  }

}

void __62__INInteraction_deleteInteractionsWithIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB3388];
      v10[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 1903, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
    }
  }

}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;

  v6 = a4;
  -[INInteraction intent](self, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6);

  -[INInteraction intentResponse](self, "intentResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v9, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6);

  return v8 | a3;
}

@end
