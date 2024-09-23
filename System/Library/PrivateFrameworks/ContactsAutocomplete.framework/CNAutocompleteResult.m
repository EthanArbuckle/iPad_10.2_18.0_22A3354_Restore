@implementation CNAutocompleteResult

- (int64_t)compare:(id)a3 withPriorityComparator:(id)a4
{
  id v6;
  int64_t v7;

  v6 = a3;
  v7 = (*((uint64_t (**)(id, CNAutocompleteResult *, id))a4 + 2))(a4, self, v6);
  if (!v7)
    v7 = -[CNAutocompleteResult compare:](self, "compare:", v6);

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "comparators");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "comparators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intersectOrderedSet:", v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11));
        if (v12)
        {
          v13 = v12;
          CNALoggingContextSorting();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            -[CNAutocompleteResult(Sorting) compare:].cold.1(v13, v14);

          goto LABEL_13;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

+ (id)resultWithDisplayName:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

+ (id)localeForHashing
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
}

- (CNAutocompleteResult)init
{
  CNAutocompleteResult *v2;
  CNAutocompleteResult *v3;
  NSArray *diagnosticLogs;
  CNAutocompleteResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNAutocompleteResult;
  v2 = -[CNAutocompleteResult init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    diagnosticLogs = v2->_diagnosticLogs;
    v2->_diagnosticLogs = (NSArray *)MEMORY[0x1E0C9AA60];

    v5 = v3;
  }

  return v3;
}

- (id)description
{
  CNAutocompleteResult *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void (**v20)(uint64_t, void *);
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  NSString *descriptionMemo;
  id v30;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSString copy](v2->_descriptionMemo, "copy");
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResult identifier](v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("identifier"), v5);

    -[CNAutocompleteResult displayName](v2, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("name"), v7);

    -[CNAutocompleteResult value](v2, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("address"), v10);

    -[CNAutocompleteResult resultTypeDescription](v2, "resultTypeDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("resultType"), v12);

    -[CNAutocompleteResult sourceTypeDescription](v2, "sourceTypeDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("sourceType"), v14);

    -[CNAutocompleteResult lastSendingAddress](v2, "lastSendingAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("lastSendingAddress"), v16);

    -[CNAutocompleteResult stringForHashing](v2, "stringForHashing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("stringForHashing"), v18);

    v20 = (void (**)(uint64_t, void *))CNAutocompleteResultUserInfoDescriptionTransform;
    -[CNAutocompleteResult userInfo](v2, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2]((uint64_t)v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("userInfo"), v22);

    -[CNAutocompleteResult value](v2, "value");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "description");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("resultValue"), v25);

    objc_msgSend(v4, "build");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(v27, "copy");
    descriptionMemo = v2->_descriptionMemo;
    v2->_descriptionMemo = (NSString *)v28;

    v30 = v27;
  }
  else
  {
    v30 = v3;
  }

  objc_sync_exit(v2);
  return v30;
}

- (id)resultTypeDescription
{
  int64_t v2;

  v2 = -[CNAutocompleteResult resultType](self, "resultType");
  if ((unint64_t)(v2 - 1) > 2)
    return CFSTR("contact");
  else
    return off_1E70E03F8[v2 - 1];
}

- (id)sourceTypeDescription
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[CNAutocompleteResult sourceType](self, "sourceType") & 1) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("recent"));
  if ((-[CNAutocompleteResult sourceType](self, "sourceType") & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("contact"));
  if ((-[CNAutocompleteResult sourceType](self, "sourceType") & 4) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("pseudo"));
  if ((-[CNAutocompleteResult sourceType](self, "sourceType") & 0x80) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("maid"));
  if ((-[CNAutocompleteResult sourceType](self, "sourceType") & 0x100) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("extension"));
  if ((-[CNAutocompleteResult sourceType](self, "sourceType") & 8) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("directory server"));
  if ((-[CNAutocompleteResult sourceType](self, "sourceType") & 0x10) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("duet"));
  if ((-[CNAutocompleteResult sourceType](self, "sourceType") & 0x20) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("supplemental"));
  if ((-[CNAutocompleteResult sourceType](self, "sourceType") & 0x200) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("stewie"));
  if (!objc_msgSend(v3, "count"))
    objc_msgSend(v3, "addObject:", CFSTR("unknown"));
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x (%@)"), -[CNAutocompleteResult sourceType](self, "sourceType"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CNAutocompleteResult stringForHashing](self, "stringForHashing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[CNAutocompleteResult stringForHashing](self, "stringForHashing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForHashing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      -[CNAutocompleteResult userInfo](self, "userInfo");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10
        && (v11 = (void *)v10,
            objc_msgSend(v7, "userInfo"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v12,
            v11,
            v12))
      {
        -[CNAutocompleteResult userInfo](self, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

      }
      else
      {
        v15 = 1;
      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)stringForHashing
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[CNAutocompleteResult value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForHashing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0D13848];
  if ((*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v4))
  {

    -[CNAutocompleteResult identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v5 + 16))(v5, v4))
    {

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

+ (unint64_t)category
{
  return 4;
}

+ (id)comparators
{
  if (comparators_cn_once_token_0 != -1)
    dispatch_once(&comparators_cn_once_token_0, &__block_literal_global_29);
  return (id)comparators_cn_once_object_0;
}

void __35__CNAutocompleteResult_comparators__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E40]);
  v1 = _Block_copy(sSortResultsByCategory);
  v8[0] = v1;
  v2 = _Block_copy(sSortResultsByPreferredDomain);
  v8[1] = v2;
  v3 = _Block_copy(sSortResultsByDisplayName);
  v8[2] = v3;
  v4 = _Block_copy(sSortResultsByAddress);
  v8[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v0, "initWithArray:", v5);
  v7 = (void *)comparators_cn_once_object_0;
  comparators_cn_once_object_0 = v6;

}

- (void)updateUsingInformationFromRelatedResult:(id)a3
{
  void *v3;
  id v5;
  char v6;
  uint64_t *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  CNAutocompleteResult *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  int v48;
  CNAutocompleteResult *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CNAutocompleteResult setSourceType:](self, "setSourceType:", objc_msgSend(v5, "sourceType") | -[CNAutocompleteResult sourceType](self, "sourceType"));
  v6 = objc_msgSend(v5, "sourceType");
  v7 = (uint64_t *)MEMORY[0x1E0D13848];
  if ((v6 & 2) != 0
    && (-[CNAutocompleteResult identifier](self, "identifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    CNALoggingContextDebug();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v48 = 138412546;
      v49 = self;
      v50 = 2112;
      v51 = v5;
      _os_log_impl(&dword_1B9950000, v18, OS_LOG_TYPE_DEFAULT, "Result: %@ is absorbing everything from: %@", (uint8_t *)&v48, 0x16u);
    }

    objc_msgSend(v5, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResult setIdentifier:](self, "setIdentifier:", v19);

    objc_msgSend(v5, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResult setValue:](self, "setValue:", v20);

    objc_msgSend(v5, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResult setDisplayName:](self, "setDisplayName:", v21);

    objc_msgSend(v5, "nameComponents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResult setNameComponents:](self, "setNameComponents:", v22);

    objc_msgSend(v5, "contactProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResult setContactProvider:](self, "setContactProvider:", v23);

    -[CNAutocompleteResult membersProvider](self, "membersProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend(v5, "membersProvider");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAutocompleteResult setMembersProvider:](self, "setMembersProvider:", v25);
LABEL_29:

    }
  }
  else
  {
    -[CNAutocompleteResult contactProvider](self, "contactProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

      goto LABEL_30;
    }
    objc_msgSend(v5, "contactProvider");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[CNAutocompleteResult identifier](self, "identifier");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        -[CNAutocompleteResult identifier](self, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 || (objc_msgSend(v5, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[CNAutocompleteResult identifier](self, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if (v14)
          else

          if ((v17 & 1) == 0)
            goto LABEL_30;
          goto LABEL_20;
        }

      }
LABEL_20:
      CNALoggingContextDebug();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v48 = 138412546;
        v49 = self;
        v50 = 2112;
        v51 = v5;
        _os_log_impl(&dword_1B9950000, v26, OS_LOG_TYPE_DEFAULT, "Result: %@ is absorbing contact provider and identifier from: %@", (uint8_t *)&v48, 0x16u);
      }

      objc_msgSend(v5, "contactProvider");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAutocompleteResult setContactProvider:](self, "setContactProvider:", v27);

      objc_msgSend(v5, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAutocompleteResult setIdentifier:](self, "setIdentifier:", v28);

      v29 = *v7;
      -[CNAutocompleteResult displayName](self, "displayName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (((*(uint64_t (**)(uint64_t, void *))(v29 + 16))(v29, v25) & 1) != 0)
      {
        -[CNAutocompleteResult nameComponents](self, "nameComponents");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {

        }
        else
        {
          objc_msgSend(v5, "displayName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (*(uint64_t (**)(uint64_t, void *))(v29 + 16))(v29, v31);

          if ((v32 & 1) != 0)
            goto LABEL_30;
          CNALoggingContextDebug();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v48 = 138412546;
            v49 = self;
            v50 = 2112;
            v51 = v5;
            _os_log_impl(&dword_1B9950000, v33, OS_LOG_TYPE_DEFAULT, "Result: %@ is also taking the display name and name components from: %@", (uint8_t *)&v48, 0x16u);
          }

          objc_msgSend(v5, "displayName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNAutocompleteResult setDisplayName:](self, "setDisplayName:", v34);

          objc_msgSend(v5, "nameComponents");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNAutocompleteResult setNameComponents:](self, "setNameComponents:", v25);
        }
      }
      goto LABEL_29;
    }
  }
LABEL_30:
  objc_msgSend(v5, "userInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[CNAutocompleteResult userInfo](self, "userInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      CNALoggingContextDebug();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        -[CNAutocompleteResult userInfo](self, "userInfo");
        v38 = (CNAutocompleteResult *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "userInfo");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138412546;
        v49 = v38;
        v50 = 2112;
        v51 = v39;
        _os_log_impl(&dword_1B9950000, v37, OS_LOG_TYPE_DEFAULT, "Serious bug: I don't expect dupes with userInfos, dropping %@, keeping only %@", (uint8_t *)&v48, 0x16u);

      }
    }
    objc_msgSend(v5, "userInfo");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResult setUserInfo:](self, "setUserInfo:", v40);

  }
  v41 = *v7;
  objc_msgSend(v5, "lastSendingAddress");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v41 + 16))(v41, v42) & 1) != 0)
    goto LABEL_39;
  -[CNAutocompleteResult lastSendingAddress](self, "lastSendingAddress");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (*(uint64_t (**)(uint64_t, void *))(v41 + 16))(v41, v43);

  if (v44)
  {
    objc_msgSend(v5, "lastSendingAddress");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResult setLastSendingAddress:](self, "setLastSendingAddress:", v42);
LABEL_39:

  }
  if ((objc_msgSend(v5, "sourceType") & 8) != 0)
  {
    v45 = *MEMORY[0x1E0D13850];
    objc_msgSend(v5, "displayName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = (*(uint64_t (**)(uint64_t, void *))(v45 + 16))(v45, v46);

    if ((_DWORD)v45)
    {
      objc_msgSend(v5, "displayName");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAutocompleteResult setDisplayName:](self, "setDisplayName:", v47);

    }
  }

}

+ (id)contactResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = objc_alloc_init((Class)a1);
  v15 = objc_msgSend(v13, "copy");

  v16 = (void *)v14[1];
  v14[1] = v15;

  v17 = (void *)v14[6];
  v14[6] = v10;
  v18 = v10;

  v19 = objc_msgSend(v12, "copy");
  v20 = (void *)v14[4];
  v14[4] = v19;

  v21 = objc_msgSend(v11, "copy");
  v22 = (void *)v14[5];
  v14[5] = v21;

  v14[14] = 0;
  return v14;
}

+ (id)groupResultWithDisplayName:(id)a3 identifier:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "resultWithDisplayName:", a3);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "copy");

  v9 = (void *)v7[5];
  v7[5] = v8;

  v7[14] = 1;
  return v7;
}

- (BOOL)shouldUseGroupNamingForSource
{
  unint64_t v3;

  v3 = -[CNAutocompleteResult sourceType](self, "sourceType");
  if (v3 != 1)
    LOBYTE(v3) = -[CNAutocompleteResult sourceType](self, "sourceType") == 16;
  return v3;
}

- (BOOL)shouldUseGroupNamingForResult
{
  return -[CNAutocompleteResult resultType](self, "resultType") == 1
      && -[CNAutocompleteResult shouldUseGroupNamingForSource](self, "shouldUseGroupNamingForSource");
}

- (id)members:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[CNAutocompleteResult expandMembers](self, "expandMembers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "first");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "second");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v12 = *MEMORY[0x1E0CB3388];
      objc_msgSend(v4, "second");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactAutocompleteErrorDomain"), 3, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a3)
      *a3 = objc_retainAutorelease(v9);

    v6 = 0;
  }

  return v6;
}

- (id)expandMembers
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;

  -[CNAutocompleteResult membersProvider](self, "membersProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v6 = v5;

    -[CNAutocompleteResult membersProvider](self, "membersProvider");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v33 = 0;
    ((void (**)(_QWORD, id *))v7)[2](v7, &v33);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (unint64_t)v33;

    objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timestamp");
    v12 = v11;

    CNALoggingContextDebug();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CNAutocompleteResult expandMembers].cold.3(v13, v12, v6);

    if ((v8 != 0) != (v9 != 0))
      goto LABEL_5;
    if (!(v8 | v9))
    {
      CNALoggingContextTriage();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[CNAutocompleteResult expandMembers].cold.1((uint64_t)self, v18, v19, v20, v21, v22, v23, v24);

      v14 = (void *)MEMORY[0x1E0D13AF8];
      v15 = 0;
      v16 = 0;
      goto LABEL_12;
    }
    if (v8 && v9)
    {
      CNALoggingContextTriage();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[CNAutocompleteResult expandMembers].cold.2((uint64_t)self, v26, v27, v28, v29, v30, v31, v32);

      v14 = (void *)MEMORY[0x1E0D13AF8];
      v15 = 0;
    }
    else
    {
LABEL_5:
      v14 = (void *)MEMORY[0x1E0D13AF8];
      v15 = v8;
    }
    v16 = v9;
LABEL_12:
    objc_msgSend(v14, "pairWithFirst:second:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return v17;
  }
  objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", MEMORY[0x1E0C9AA60], 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  return v17;
}

+ (id)contactStoreForFetchingFullContacts
{
  if (contactStoreForFetchingFullContacts_onceToken != -1)
    dispatch_once(&contactStoreForFetchingFullContacts_onceToken, &__block_literal_global_61);
  return (id)contactStoreForFetchingFullContacts_sharedStore;
}

void __59__CNAutocompleteResult_contactStoreForFetchingFullContacts__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v1 = (void *)contactStoreForFetchingFullContacts_sharedStore;
  contactStoreForFetchingFullContacts_sharedStore = (uint64_t)v0;

}

- (id)contactWithKeysToFetch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  CNAutocompleteResult *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CNAutocompleteResult *v27;
  id v28;
  NSObject *v29;
  id v30;
  uint8_t buf[4];
  CNAutocompleteResult *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CNAutocompleteResult contactProvider](self, "contactProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    CNALoggingContextDebug();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, "Using contact provider to retrieve the contact", buf, 2u);
    }

    -[CNAutocompleteResult contactProvider](self, "contactProvider");
    v9 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id *))(v9 + 16))(v9, v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (-[CNAutocompleteResult resultType](self, "resultType"))
    goto LABEL_6;
  -[CNAutocompleteResult value](self, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "addressType");

  if (v13 == 2)
  {
    v21 = (void *)MEMORY[0x1E0C97200];
    v22 = (void *)MEMORY[0x1E0C97398];
    -[CNAutocompleteResult value](self, "value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "address");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "phoneNumberWithStringValue:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "predicateForContactsMatchingPhoneNumber:", v25);
    v9 = objc_claimAutoreleasedReturnValue();

    CNALoggingContextDebug();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    -[CNAutocompleteResult value](self, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "address");
    v19 = (CNAutocompleteResult *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v19;
    v20 = "Let's do a matching based on phone number: %@";
    goto LABEL_16;
  }
  if (v13 != 1)
  {
LABEL_6:
    CNALoggingContextDebug();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = self;
      _os_log_impl(&dword_1B9950000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "I don't know how to return a contact for %@", buf, 0xCu);
    }
    v10 = 0;
    goto LABEL_9;
  }
  v14 = (void *)MEMORY[0x1E0C97200];
  -[CNAutocompleteResult value](self, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "address");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateForContactsMatchingEmailAddress:", v16);
  v9 = objc_claimAutoreleasedReturnValue();

  CNALoggingContextDebug();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[CNAutocompleteResult value](self, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "address");
    v19 = (CNAutocompleteResult *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v19;
    v20 = "Let's do a matching based on email address: %@";
LABEL_16:
    _os_log_impl(&dword_1B9950000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);

  }
LABEL_17:

  if (!v9)
    goto LABEL_6;
  objc_msgSend((id)objc_opt_class(), "contactStoreForFetchingFullContacts");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v26, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v6, &v30);
  v27 = (CNAutocompleteResult *)objc_claimAutoreleasedReturnValue();
  v28 = v30;
  CNALoggingContextDebug();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v27;
    v33 = 2112;
    v34 = v28;
    _os_log_impl(&dword_1B9950000, v29, OS_LOG_TYPE_DEFAULT, "We received (and returning the first one): %@, error:%@", buf, 0x16u);
  }

  if (v27)
  {
    -[CNAutocompleteResult firstObject](v27, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v28);
  }

LABEL_9:
  return v10;
}

- (void)addDiagnosticLog:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D13A68], "lazyFutureWithBlock:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResult addDiagnosticLogFuture:](self, "addDiagnosticLogFuture:", v4);

}

- (void)addDiagnosticLogFuture:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNAutocompleteResult diagnosticLogs](self, "diagnosticLogs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteResult setDiagnosticLogs:](self, "setDiagnosticLogs:", v5);
}

- (id)diagnosticLog
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Result: %@\n"), self);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CNAutocompleteResult diagnosticLogs](self, "diagnosticLogs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v14 = 0;
        objc_msgSend(v9, "result:", &v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v14;
        v12 = v11;
        if (v10)
          objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v10);
        else
          objc_msgSend(v3, "appendFormat:", CFSTR("Error expanding log: %@\n"), v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)isSourceTypeConsideredSuggestion:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFEFLL) == 4;
}

- (BOOL)hasPreferredDomain
{
  return self->_hasPreferredDomain;
}

- (void)setHasPreferredDomain:(BOOL)a3
{
  self->_hasPreferredDomain = a3;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (CNAutocompleteResultValue)value
{
  return (CNAutocompleteResultValue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CNAutocompleteNameComponents)nameComponents
{
  return (CNAutocompleteNameComponents *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNameComponents:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)membersProvider
{
  return self->_membersProvider;
}

- (void)setMembersProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)contactProvider
{
  return self->_contactProvider;
}

- (void)setContactProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)diagnosticLogs
{
  return self->_diagnosticLogs;
}

- (void)setDiagnosticLogs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (id)ignoreResultBlock
{
  return self->_ignoreResultBlock;
}

- (void)setIgnoreResultBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)lastSendingAddress
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastSendingAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (_PSSuggestion)psSuggestion
{
  return (_PSSuggestion *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPsSuggestion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSNumber)recentsIdentifier
{
  return self->_recentsIdentifier;
}

- (void)setRecentsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recentsIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsIdentifier, 0);
  objc_storeStrong((id *)&self->_psSuggestion, 0);
  objc_storeStrong(&self->_ignoreResultBlock, 0);
  objc_storeStrong((id *)&self->_diagnosticLogs, 0);
  objc_storeStrong(&self->_contactProvider, 0);
  objc_storeStrong(&self->_membersProvider, 0);
  objc_storeStrong((id *)&self->_descriptionMemo, 0);
  objc_storeStrong((id *)&self->_lastSendingAddress, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (id)calDAVResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5 resultType:(int64_t)a6 groupMembersProvider:(id)a7 userInfo:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CNAutocompleteResultValue *v18;
  void *v19;

  v13 = a8;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(CNAutocompleteResultValue);
  -[CNAutocompleteResultValue setAddress:](v18, "setAddress:", v17);

  -[CNAutocompleteResultValue setAddressType:](v18, "setAddressType:", 1);
  +[CNAutocompleteResult resultWithDisplayName:](CNAutocompleteCalendarServerResult, "resultWithDisplayName:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setResultType:", a6);
  objc_msgSend(v19, "setMembersProvider:", v14);

  objc_msgSend(v19, "setValue:", v18);
  objc_msgSend(v19, "setNameComponents:", v15);

  objc_msgSend(v19, "setSourceType:", 32);
  if (v13)
    objc_msgSend(v19, "setUserInfo:", v13);

  return v19;
}

+ (id)messagesResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5 resultType:(int64_t)a6 addressType:(int64_t)a7 identifier:(id)a8 contactProvider:(id)a9 groupMembersProvider:(id)a10 userInfo:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CNAutocompleteResultValue *v23;
  CNAutocompleteResult *v24;

  v16 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = objc_alloc_init(CNAutocompleteResultValue);
  -[CNAutocompleteResultValue setAddress:](v23, "setAddress:", v22);

  -[CNAutocompleteResultValue setAddressType:](v23, "setAddressType:", a7);
  v24 = objc_alloc_init(CNAutocompleteResult);
  -[CNAutocompleteResult setIdentifier:](v24, "setIdentifier:", v19);

  -[CNAutocompleteResult setContactProvider:](v24, "setContactProvider:", v18);
  -[CNAutocompleteResult setDisplayName:](v24, "setDisplayName:", v21);

  -[CNAutocompleteResult setResultType:](v24, "setResultType:", a6);
  -[CNAutocompleteResult setMembersProvider:](v24, "setMembersProvider:", v17);

  -[CNAutocompleteResult setValue:](v24, "setValue:", v23);
  -[CNAutocompleteResult setNameComponents:](v24, "setNameComponents:", v20);

  -[CNAutocompleteResult setSourceType:](v24, "setSourceType:", 32);
  if (v16)
    -[CNAutocompleteResult setUserInfo:](v24, "setUserInfo:", v16);

  return v24;
}

- (id)address
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[CNAutocompleteResult value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "addressType") != 3)
  {

    goto LABEL_5;
  }
  -[CNAutocompleteResult value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instantMessageAddressService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_5:
    -[CNAutocompleteResult value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v6 = objc_alloc(MEMORY[0x1E0C97330]);
  -[CNAutocompleteResult value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResult value](self, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "instantMessageAddressService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithUsername:service:", v8, v10);

LABEL_6:
  return v11;
}

- (int64_t)addressType
{
  void *v2;
  int64_t v3;

  -[CNAutocompleteResult value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "addressType");

  return v3;
}

- (NSArray)userInfos
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[CNAutocompleteResult userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (NSArray *)0;
  -[CNAutocompleteResult userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (id)calDAVResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5
{
  return (id)objc_msgSend(a1, "calDAVResultWithAddress:displayName:nameComponents:resultType:groupMembersProvider:userInfo:", a3, a4, a5, 0, 0, 0);
}

+ (id)calDAVResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5 resultType:(int64_t)a6 groupMembersProvider:(id)a7
{
  return (id)objc_msgSend(a1, "calDAVResultWithAddress:displayName:nameComponents:resultType:groupMembersProvider:userInfo:", a3, a4, a5, a6, a7, 0);
}

+ (id)messagesResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5 resultType:(int64_t)a6 groupMembersProvider:(id)a7 userInfo:(id)a8
{
  return (id)objc_msgSend(a1, "messagesResultWithAddress:displayName:nameComponents:resultType:addressType:identifier:contactProvider:groupMembersProvider:userInfo:", a3, a4, a5, a6, 1, 0, 0, 0, a8);
}

- (void)expandMembers
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", a2 - a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1B9950000, a1, OS_LOG_TYPE_DEBUG, "Time to expand members: %@", (uint8_t *)&v5, 0xCu);

}

@end
