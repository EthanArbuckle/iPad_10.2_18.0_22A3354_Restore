@implementation CNAssistantCommandRetrievePerson

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
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = (void (**)(id, void *))a3;
  objc_msgSend_retrieve(self, v5, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(v10, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v9);

}

- (id)retrieve
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  id v34;
  const char *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  id v46;
  const char *v47;
  const __CFString *v49;
  id v50;
  const char *v51;
  id v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_identifiers(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend_identifiers(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v57, v61, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v58;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v58 != v13)
          objc_enumerationMutation(v9);
        v15 = *(id *)(*((_QWORD *)&v57 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        objc_msgSend_internalGUID(v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend_internalGUID(v15, v19, v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
            goto LABEL_22;
        }
        else
        {
          v24 = (void *)MEMORY[0x24BE19120];
          objc_msgSend_identifier(v15, v19, v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_contactIDFromAssistantID_(v24, v26, (uint64_t)v25);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
LABEL_22:
            v49 = CFSTR("Invalid person identifier");
            goto LABEL_23;
          }
        }
        objc_msgSend_descriptorsForRequiredKeys(MEMORY[0x24BE19118], v21, v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contactStore(self, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0;
        objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(v30, v31, (uint64_t)v23, v27, &v56);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend_addObject_(v55, v33, (uint64_t)v32);
        }
        else
        {
          v34 = objc_alloc(MEMORY[0x24BE811A8]);
          v54 = objc_msgSend_initWithReason_(v34, v35, (uint64_t)CFSTR("Invalid person identifier (person does not exist)"));
        }

        if (!v32)
        {
          v52 = (id)v54;
          v37 = v55;
          goto LABEL_27;
        }
        if (v12 == ++v14)
        {
          v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v36, (uint64_t)&v57, v61, 16);
          if (v12)
            goto LABEL_4;
          goto LABEL_18;
        }
      }
      v49 = CFSTR("Expected SAABPerson for identifier");
LABEL_23:
      v50 = objc_alloc(MEMORY[0x24BE811A8]);
      v52 = (id)objc_msgSend_initWithReason_(v50, v51, (uint64_t)v49);

      v37 = v55;
      goto LABEL_27;
    }
LABEL_18:

    v37 = v55;
    if (objc_msgSend_count(v55, v38, v39))
    {
      objc_msgSend_mapUsingBlock_(v55, v40, (uint64_t)&unk_24D5291D8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)MEMORY[0x24BE19118];
      objc_msgSend_contactStore(self, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_markMeContactInPeople_usingStore_(v41, v45, (uint64_t)v9, v44);

    }
    else
    {
      v9 = 0;
    }
    v52 = objc_alloc_init(MEMORY[0x24BE81230]);
    objc_msgSend_setObjects_(v52, v53, (uint64_t)v9);
LABEL_27:

    return v52;
  }
  else
  {
    v46 = objc_alloc(MEMORY[0x24BE811A8]);
    return (id)objc_msgSend_initWithReason_(v46, v47, (uint64_t)CFSTR("Expected identifiers to be set"));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
