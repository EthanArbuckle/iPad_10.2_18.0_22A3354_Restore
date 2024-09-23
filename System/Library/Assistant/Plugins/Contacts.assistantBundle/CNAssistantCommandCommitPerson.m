@implementation CNAssistantCommandCommitPerson

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x24BDBACF8]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = (void (**)(id, void *))a3;
  objc_msgSend_validate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_commitFromUpdatesCache(self, v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v7;
  objc_msgSend_dictionary(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v10);

}

- (id)validate
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  id v28;
  const char *v29;
  id v30;
  const char *v31;
  id v33;
  const char *v34;
  id v35;
  const char *v36;
  id v37;
  const char *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_identifier(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_identifier(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_identifier(v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v16 = (void *)MEMORY[0x24BE19120];
        objc_msgSend_identifier(v7, v14, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contactIDFromAssistantID_(v16, v18, (uint64_t)v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend_contactStore(self, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = *MEMORY[0x24BDBA3F0];
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v23, (uint64_t)v39, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(v22, v25, (uint64_t)v19, v24, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = 0;
          if (!v26)
          {
            v28 = objc_alloc(MEMORY[0x24BE811A8]);
            v27 = (void *)objc_msgSend_initWithReason_(v28, v29, (uint64_t)CFSTR("Invalid person identifier (person does not exist)"));
          }

        }
        else
        {
          v37 = objc_alloc(MEMORY[0x24BE811A8]);
          v27 = (void *)objc_msgSend_initWithReason_(v37, v38, (uint64_t)CFSTR("Invalid person identifier (person does not exist)"));
        }

      }
      else
      {
        v35 = objc_alloc(MEMORY[0x24BE811A8]);
        v27 = (void *)objc_msgSend_initWithReason_(v35, v36, (uint64_t)CFSTR("Invalid person identifier"));
      }

    }
    else
    {
      v33 = objc_alloc(MEMORY[0x24BE811A8]);
      v27 = (void *)objc_msgSend_initWithReason_(v33, v34, (uint64_t)CFSTR("Expected SAABPerson for identifier"));
    }

    return v27;
  }
  else
  {
    v30 = objc_alloc(MEMORY[0x24BE811A8]);
    return (id)objc_msgSend_initWithReason_(v30, v31, (uint64_t)CFSTR("Expected identifier to be set"));
  }
}

- (id)commitFromUpdatesCache
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  int v35;
  id v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  void *v50;
  uint64_t v51;
  void *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_identifier(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatesForAssistantUrl_(CNAssistantCache, v8, (uint64_t)v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_11;
  v52 = v4;
  v12 = objc_alloc_init(MEMORY[0x24BDBADA8]);
  v51 = (uint64_t)v7;
  objc_msgSend_contactIDFromAssistantID_(MEMORY[0x24BE19120], v13, (uint64_t)v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v50 = v11;
  obj = v11;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v54, v58, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v55;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v55 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v19);
        v21 = objc_alloc(MEMORY[0x24BE81238]);
        v23 = (void *)objc_msgSend_initWithDictionary_(v21, v22, v20);
        v24 = (void *)MEMORY[0x24BE19118];
        objc_msgSend_contactStore(self, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyUpdate_toContactWithIdentifier_usingStore_saveRequest_(v24, v28, (uint64_t)v23, v14, v27, v12);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v54, v58, 16);
    }
    while (v17);
  }

  v7 = (void *)v51;
  objc_msgSend_removeUpdatesForAssistantUrl_(CNAssistantCache, v30, v51);
  objc_msgSend_contactStore(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_executeSaveRequest_error_(v33, v34, (uint64_t)v12, 0);

  v4 = v52;
  v11 = v50;
  if (v35)
  {
    v36 = objc_alloc_init(MEMORY[0x24BE81220]);
    objc_msgSend_identifier(self, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIdentifier_(v36, v43, (uint64_t)v42);

  }
  else
  {
LABEL_11:
    v44 = objc_msgSend_code(0, v9, v10, v50);
    v45 = *MEMORY[0x24BE819F8];
    v46 = objc_alloc(MEMORY[0x24BE811A8]);
    if (v44 == v45)
      v48 = objc_msgSend_initWithErrorCode_(v46, v47, v44);
    else
      v48 = objc_msgSend_initWithReason_(v46, v47, (uint64_t)CFSTR("Failed to update the AB person"));
    v36 = (id)v48;
  }

  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
