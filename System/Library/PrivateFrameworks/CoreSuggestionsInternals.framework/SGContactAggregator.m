@implementation SGContactAggregator

- (SGContactAggregator)init
{
  SGContactAggregator *v2;
  uint64_t v3;
  _PASLRUCache *cachedContacts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGContactAggregator;
  v2 = -[SGContactAggregator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 10);
    cachedContacts = v2->_cachedContacts;
    v2->_cachedContacts = (_PASLRUCache *)v3;

  }
  return v2;
}

- (void)clear
{
  SGContactAggregator *obj;

  obj = self;
  objc_sync_enter(obj);
  -[_PASLRUCache removeAllObjects](obj->_cachedContacts, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)clearContactsWithConversationIdentifier:(id)a3
{
  id v4;
  SGContactAggregator *v5;
  void *v6;
  _PASLRUCache *cachedContacts;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_opt_new();
  cachedContacts = v5->_cachedContacts;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__SGContactAggregator_clearContactsWithConversationIdentifier___block_invoke;
  v18[3] = &unk_1E7DB65C0;
  v8 = v4;
  v19 = v8;
  v9 = v6;
  v20 = v9;
  -[_PASLRUCache enumerateKeysAndObjectsUsingBlock:](cachedContacts, "enumerateKeysAndObjectsUsingBlock:", v18);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        -[_PASLRUCache removeObjectForKey:](v5->_cachedContacts, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    }
    while (v11);
  }

  objc_sync_exit(v5);
}

- (void)removeContact:(id)a3
{
  id v4;
  SGContactAggregator *v5;
  void *v6;
  _PASLRUCache *cachedContacts;
  id v8;
  _PASLRUCache *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__31588;
  v20 = __Block_byref_object_dispose__31589;
  v21 = 0;
  +[SGContactAggregator messageIdentifiersGeneratingContact:](SGContactAggregator, "messageIdentifiersGeneratingContact:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  cachedContacts = v5->_cachedContacts;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __37__SGContactAggregator_removeContact___block_invoke;
  v13 = &unk_1E7DB65E8;
  v8 = v6;
  v14 = v8;
  v15 = &v16;
  -[_PASLRUCache enumerateKeysAndObjectsUsingBlock:](cachedContacts, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v9 = v5->_cachedContacts;
  if (v17[5])
    -[_PASLRUCache removeObjectForKey:](v9, "removeObjectForKey:", v10, v11, v12, v13);
  else
    -[_PASLRUCache removeAllObjects](v9, "removeAllObjects", v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  objc_sync_exit(v5);

}

- (id)augmentSuggestedContactWithContact:(id)a3 conversationId:(id)a4 store:(id)a5 handle:(id)a6
{
  unint64_t v10;
  id v11;
  id v12;
  id v13;
  SGContactAggregator *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v24;

  v10 = (unint64_t)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  objc_sync_enter(v14);
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PASLRUCache objectForKey:](v14->_cachedContacts, "objectForKey:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v10 && v16)
  {
    +[SGContactAggregator mergeContact:withContact:](SGContactAggregator, "mergeContact:withContact:", v16, v10);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_21;
  }
  else
  {
    if (!(v16 | v10))
    {
      v18 = 0;
      goto LABEL_21;
    }
    if (v16)
      v19 = (void *)v16;
    else
      v19 = (void *)v10;
    v18 = v19;
  }
  if ((objc_msgSend(v18, "isEqual:", v17) & 1) == 0
    && +[SGSqlEntityStore contactContainsEphemeralId:](SGSqlEntityStore, "contactContainsEphemeralId:", v18))
  {
    if (objc_msgSend(v13, "containsString:", CFSTR("@")))
      objc_msgSend(v12, "suggestContactMatchesByEmailAddress:isMaybe:onlySignificant:", v13, 0, 0);
    else
      objc_msgSend(v12, "suggestContactMatchesByPhoneNumber:isMaybe:onlySignificant:", v13, 0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend((id)objc_opt_class(), "replaceDetailsInContact:onDiskContact:", v18, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v22;
      if (!v22)
        goto LABEL_21;
    }
    else
    {

    }
  }
  -[_PASLRUCache setObject:forKey:](v14->_cachedContacts, "setObject:forKey:", v18, v15);
LABEL_21:

  objc_sync_exit(v14);
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedContacts, 0);
}

void __37__SGContactAggregator_removeContact___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  id v9;

  v9 = a2;
  +[SGContactAggregator messageIdentifiersGeneratingContact:](SGContactAggregator, "messageIdentifiersGeneratingContact:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "intersectsSet:", v8))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __63__SGContactAggregator_clearContactsWithConversationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

+ (id)messageIdentifiersGeneratingContact:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
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
  id v17;
  _QWORD v19[4];
  id v20;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "richness"));
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__SGContactAggregator_messageIdentifiersGeneratingContact___block_invoke;
  v19[3] = &unk_1E7DB6610;
  v5 = v4;
  v20 = v5;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BD5158](v19);
  objc_msgSend(v3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "origin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "externalKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "origin");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "externalKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

  }
  objc_msgSend(v3, "emailAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v13);

  objc_msgSend(v3, "phones");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v14);

  objc_msgSend(v3, "postalAddresses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v15);

  objc_msgSend(v3, "socialProfiles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v16);

  v17 = v5;
  return v17;
}

+ (id)mergeContact:(id)a3 withContact:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;

  v5 = a3;
  v6 = a4;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __48__SGContactAggregator_mergeContact_withContact___block_invoke_3;
  v46[3] = &unk_1E7DB6758;
  v47 = &__block_literal_global_31610;
  v7 = MEMORY[0x1C3BD5158](v46);
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fullName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  objc_msgSend(v6, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fullName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 <= objc_msgSend(v12, "length"))
    v13 = v6;
  else
    v13 = v5;
  objc_msgSend(v13, "name");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "recordId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SGSqlEntityStore isEphemeralIdentifier:](SGSqlEntityStore, "isEphemeralIdentifier:", objc_msgSend(v14, "numericValue")))
  {
    objc_msgSend(v6, "recordId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[SGSqlEntityStore isEphemeralIdentifier:](SGSqlEntityStore, "isEphemeralIdentifier:", objc_msgSend(v15, "numericValue"));

    if (v16)
      v17 = v6;
    else
      v17 = v5;
    if (!v16)
      v5 = v6;
    v6 = v17;
  }
  else
  {

  }
  objc_msgSend(v5, "emailAddresses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emailAddresses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __48__SGContactAggregator_mergeContact_withContact___block_invoke((uint64_t)v19, v18, v19, &__block_literal_global_23);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "phones");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "phones");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __48__SGContactAggregator_mergeContact_withContact___block_invoke((uint64_t)v21, v20, v21, &__block_literal_global_24_31611);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postalAddresses");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postalAddresses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v22, v23);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "socialProfiles");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "socialProfiles");
  v43 = (void *)v7;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  __48__SGContactAggregator_mergeContact_withContact___block_invoke((uint64_t)v25, v24, v25, &__block_literal_global_25_31612);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "birthday");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "birthday");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v26;
  v29 = v28;
  if (v28)
    v30 = v28;
  else
    v30 = v27;
  v31 = v30;

  objc_msgSend(v5, "photoPath");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    v33 = v5;
  else
    v33 = v6;
  objc_msgSend(v33, "photoPath");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D197B0];
  objc_msgSend(v5, "recordId");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "contactWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:birthday:photoPath:", v36, v45, v44, v42, v41, v40, v31, v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "updatedFields"))
    v38 = v5;
  else
    v38 = v6;
  objc_msgSend(v37, "setUpdatedFields:", objc_msgSend(v38, "updatedFields"));

  return v37;
}

+ (id)replaceDetailsInContact:(id)a3 onDiskContact:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  _QWORD v54[4];
  id v55;

  v5 = a3;
  v6 = a4;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_2;
  v54[3] = &unk_1E7DB6758;
  v55 = &__block_literal_global_28_31600;
  v7 = MEMORY[0x1C3BD5158](v54);
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v9;
  v12 = v11;
  if (v10 && v11)
  {
    objc_msgSend(v10, "fullName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(v12, "fullName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {
        objc_msgSend(v10, "fullName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fullName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        v18 = v12;
        if ((v17 & 1) != 0)
          goto LABEL_10;
        goto LABEL_9;
      }

    }
  }
LABEL_9:
  v18 = v10;
LABEL_10:
  v52 = v18;

  objc_msgSend(v5, "emailAddresses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emailAddresses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke((uint64_t)v20, v19, v20, &__block_literal_global_37);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "phones");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "phones");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke((uint64_t)v22, v21, v22, &__block_literal_global_38);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postalAddresses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postalAddresses");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v7;
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v23, v24);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "socialProfiles");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "socialProfiles");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke((uint64_t)v26, v25, v26, &__block_literal_global_39_31601);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "birthday");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "birthday");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27;
  v30 = v28;
  v31 = v30;
  if (!v29 || !v30)
    goto LABEL_16;
  objc_msgSend(v29, "dateComponents");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "month");
  objc_msgSend(v31, "dateComponents");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33 != objc_msgSend(v34, "month"))
  {

    goto LABEL_16;
  }
  objc_msgSend(v29, "dateComponents");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "day");
  objc_msgSend(v31, "dateComponents");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "day");

  v39 = v31;
  if (v36 != v38)
LABEL_16:
    v39 = v29;
  v40 = v39;

  objc_msgSend(v5, "photoPath");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
    v42 = v5;
  else
    v42 = v6;
  objc_msgSend(v42, "photoPath");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)MEMORY[0x1E0D197B0];
  objc_msgSend(v6, "recordId");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "contactWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:birthday:photoPath:", v45, v52, v51, v50, v49, v48, v40, v43);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "setUpdatedFields:", objc_msgSend(v5, "updatedFields"));
  return v46;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "count") || !objc_msgSend(v6, "count"))
  {
    v8 = v5;
    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "count");
  if ((unint64_t)(objc_msgSend(v6, "count") + v7) >= 6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = v8;
    goto LABEL_7;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_5;
  v26[3] = &unk_1E7DB6880;
  v27 = v6;
  v28 = &__block_literal_global_32;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BD5158](v26);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12[2](v12, v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v19)
          v21 = v19;
        else
          v21 = v18;
        objc_msgSend(v11, "addObject:", v21, (_QWORD)v22);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    }
    while (v15);
  }

  v9 = (void *)objc_msgSend(v11, "copy");
LABEL_7:

  return v9;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v6, "count") && objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v10 = (void *)objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v29 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          v8[2](v8, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v13);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v30 = v6;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          ((void (**)(id, void *))v8)[2](v8, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
            v26 = v25;
          else
            v26 = v23;
          objc_msgSend(v9, "addObject:", v26, v29);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v20);
    }

    v27 = (id)objc_msgSend(v9, "copy");
    v7 = v29;
    v6 = v30;
  }
  else
  {
    v27 = v6;
  }

  return v27;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  SGSocialProfileDetails *v3;
  void *v4;

  v2 = a2;
  v3 = -[SGSocialProfileDetails initWithSocialProfile:]([SGSocialProfileDetails alloc], "initWithSocialProfile:", v2);

  -[SGSocialProfileDetails preferredUniqueIdentifier](v3, "preferredUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeSocialProfile(v4);
  objc_claimAutoreleasedReturnValue();

  return v4;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "phoneNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizePhoneNumber();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeEmailAddress();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (((*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40)) & 1) != 0)
        {
          v10 = v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

uint64_t __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = SGPostalAddressesMatchWithParsed(v5, v6, 0, 0, 0, 0, 1);
  return v7;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeAddress(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v6, "count"))
    {
      v7 = objc_msgSend(v5, "count");
      if ((unint64_t)(objc_msgSend(v6, "count") + v7) < 6)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v5, "count"));
        objc_msgSend(v10, "addObjectsFromArray:", v5);
        objc_msgSend(v10, "addObjectsFromArray:", v6);
        +[SGDeduper bucketerWithEqualityTest:](SGDeduper, "bucketerWithEqualityTest:", &__block_literal_global_17_31616);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGDeduper resolveByPairs:](SGDeduper, "resolveByPairs:", &__block_literal_global_18_31617);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGDeduper dedupe:bucketer:resolver:](SGDeduper, "dedupe:bucketer:resolver:", v10, v11, v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v5;
    }
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;
LABEL_9:

  return v9;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v6, "count") && objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v6, "count"));
    objc_msgSend(v9, "addObjectsFromArray:", v6);
    objc_msgSend(v9, "addObjectsFromArray:", v7);
    +[SGDeduper bucketerWithMapping:](SGDeduper, "bucketerWithMapping:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGDeduper resolveByPairs:](SGDeduper, "resolveByPairs:", &__block_literal_global_13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGDeduper dedupe:bucketer:resolver:](SGDeduper, "dedupe:bucketer:resolver:", v9, v10, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v6, "count"))
      v13 = v6;
    else
      v13 = v7;
    v12 = v13;
  }

  return v12;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  SGSocialProfileDetails *v3;
  void *v4;

  v2 = a2;
  v3 = -[SGSocialProfileDetails initWithSocialProfile:]([SGSocialProfileDetails alloc], "initWithSocialProfile:", v2);

  -[SGSocialProfileDetails preferredUniqueIdentifier](v3, "preferredUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeSocialProfile(v4);
  objc_claimAutoreleasedReturnValue();

  return v4;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "phoneNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizePhoneNumber();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeEmailAddress();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_6(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __48__SGContactAggregator_mergeContact_withContact___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = SGPostalAddressesMatchWithParsed(v5, v6, 0, 0, 0, 0, 1);
  return v7;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeAddress(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __59__SGContactAggregator_messageIdentifiersGeneratingContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "origin");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "externalKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = *(void **)(a1 + 32);
          objc_msgSend(v8, "origin");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "externalKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v13);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

@end
