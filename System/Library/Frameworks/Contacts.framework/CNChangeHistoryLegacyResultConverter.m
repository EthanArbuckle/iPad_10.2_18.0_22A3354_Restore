@implementation CNChangeHistoryLegacyResultConverter

+ (id)os_log
{
  objc_opt_self();
  if (os_log_cn_once_token_0_5 != -1)
    dispatch_once(&os_log_cn_once_token_0_5, &__block_literal_global_32);
  return (id)os_log_cn_once_object_0_5;
}

void __46__CNChangeHistoryLegacyResultConverter_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "fetching");
  v1 = (void *)os_log_cn_once_object_0_5;
  os_log_cn_once_object_0_5 = (uint64_t)v0;

}

- (CNChangeHistoryLegacyResultConverter)initWithContactStore:(id)a3 additionalContactKeyDescriptors:(id)a4
{
  id v7;
  id v8;
  CNChangeHistoryLegacyResultConverter *v9;
  CNChangeHistoryLegacyResultConverter *v10;
  void *v11;
  CNChangeHistoryEventFactory *v12;
  CNChangeHistoryEventFactory *factory;
  CNChangeHistoryLegacyResultConverter *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNChangeHistoryLegacyResultConverter;
  v9 = -[CNChangeHistoryLegacyResultConverter init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    if (v8)
      v11 = v8;
    else
      v11 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v10->_additionalContactKeyDescriptors, v11);
    v12 = objc_alloc_init(CNChangeHistoryEventFactory);
    factory = v10->_factory;
    v10->_factory = v12;

    v14 = v10;
  }

  return v10;
}

- (id)eventsFromResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNChangeHistoryLegacyResultConverter contactEventsFromLegacyResult:]((void **)&self->super.isa, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isSuccess") & 1) != 0)
  {
    -[CNChangeHistoryLegacyResultConverter groupEventsFromLegacyResult:](self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isSuccess") & 1) != 0)
    {
      objc_msgSend(v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      objc_msgSend(v6, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_cn_flatten");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      +[CNChangeHistoryLegacyResultConverter os_log]();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CNChangeHistoryLegacyResultConverter eventsFromResult:].cold.1(v6);

      v15 = (void *)MEMORY[0x1E0D13B60];
      objc_msgSend(v6, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "failureWithError:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (id)v11;

  }
  else
  {
    objc_opt_class();
    +[CNChangeHistoryLegacyResultConverter os_log]();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CNChangeHistoryLegacyResultConverter eventsFromResult:].cold.2(v5);

    v13 = v5;
  }

  return v13;
}

- (void)contactEventsFromLegacyResult:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[CNChangeHistoryLegacyResultConverter keysToFetch](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1, "contactStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v3;
    objc_msgSend(v3, "contactChangesEnumeratorWithKeysToFetch:contactStore:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          +[CNChangeHistoryLegacyResultConverter contactEventForChange:factory:]((uint64_t)CNChangeHistoryLegacyResultConverter, *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12), a1[3]);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v13, "isSuccess"))
          {
            v15 = (void *)MEMORY[0x1E0D13B60];
            objc_msgSend(v13, "error");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "failureWithError:", v16);
            a1 = (void **)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
          objc_msgSend(v13, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", v5);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
LABEL_12:

    v3 = v18;
  }

  return a1;
}

- (id)groupEventsFromLegacyResult:(_QWORD *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v28 = v3;
  if (!a1)
  {
    v26 = 0;
    goto LABEL_20;
  }
  v4 = v3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "contactStore", v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupChangesEnumeratorWithContactStore:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v8)
    goto LABEL_19;
  v9 = v8;
  v10 = *(_QWORD *)v31;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v31 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
      v13 = objc_msgSend(v12, "changeType");
      if (v13 <= 5)
      {
        if (((1 << v13) & 9) != 0)
        {
          v17 = (void *)a1[3];
          objc_msgSend(v12, "group");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addGroupEventWithGroup:containerIdentifier:", v15, 0);
          v16 = objc_claimAutoreleasedReturnValue();
LABEL_12:
          v18 = (void *)v16;
        }
        else
        {
          if (((1 << v13) & 0x12) != 0)
          {
            v14 = (void *)a1[3];
            objc_msgSend(v12, "group");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "updateGroupEventWithGroup:", v15);
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
          v19 = (void *)a1[3];
          objc_msgSend(v12, "groupIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "externalURI");
          v20 = v5;
          v21 = a1;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "externalModificationTag");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "deleteGroupEventWithGroupIdentifier:externalURI:externalModificationTag:", v15, v22, v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          a1 = v21;
          v5 = v20;
        }

        goto LABEL_15;
      }
      v18 = 0;
LABEL_15:
      objc_msgSend(v5, "_cn_addNonNilObject:", v18);

      ++v11;
    }
    while (v9 != v11);
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v9 = v24;
  }
  while (v24);
LABEL_19:

  -[CNChangeHistoryLegacyResultConverter coalesceGroupEvents:](a1, v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v26;
}

- (id)keysToFetch
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[2];

  v1 = a1;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *MEMORY[0x1E0D137F8];
    objc_msgSend(a1, "additionalContactKeyDescriptors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

    if ((_DWORD)v2)
    {
      v8[0] = CFSTR("identifier");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v1, "additionalContactKeyDescriptors", CFSTR("identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_flatten");
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

+ (id)contactEventForChange:(void *)a3 factory:
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  switch(objc_msgSend(v4, "changeType"))
  {
    case 0:
    case 3:
      objc_msgSend(v4, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addContactEventWithContact:containerIdentifier:", v6, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
    case 4:
      objc_msgSend(v4, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imagesChanged");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateContactEventWithContact:imagesChanged:", v6, objc_msgSend(v8, "BOOLValue"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 2:
    case 5:
      objc_msgSend(v4, "contactIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deleteContactEventWithContactIdentifier:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6:
      objc_msgSend(v4, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "linkToPersonUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNContact contactWithIdentifierOnly:](CNContact, "contactWithIdentifierOnly:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "personLinkUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNContact contactWithIdentifierOnly:](CNContact, "contactWithIdentifierOnly:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "linkContactsEventWithFromContact:toContact:unifiedContact:", v6, v11, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    case 7:
      objc_msgSend(v4, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unlinkContactEventWithContact:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 8:
      objc_msgSend(v4, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferredContactForNameEventWithPreferredContact:unifiedContact:", v6, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 9:
      objc_msgSend(v4, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferredContactForImageEventWithPreferredContact:unifiedContact:", v6, 0);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v10 = (void *)v7;
      goto LABEL_14;
    case 10:
      v14 = *MEMORY[0x1E0D13780];
      objc_msgSend(v4, "contactIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "differentMeCardEventWithContactIdentifier:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v10 = (void *)v9;
LABEL_13:

LABEL_14:
      break;
    default:
      v10 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)coalesceGroupEvents:(id)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
    a1 = v3;

  return a1;
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)additionalContactKeyDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (CNChangeHistoryEventFactory)factory
{
  return (CNChangeHistoryEventFactory *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_additionalContactKeyDescriptors, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)eventsFromResult:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Could not fetch groups for change history delta sync: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)eventsFromResult:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Could not fetch contacts for change history delta sync: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
