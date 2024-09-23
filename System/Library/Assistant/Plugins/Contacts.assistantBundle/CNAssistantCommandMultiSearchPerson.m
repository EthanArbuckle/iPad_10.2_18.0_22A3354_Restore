@implementation CNAssistantCommandMultiSearchPerson

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
    objc_msgSend_perform(self, v8, v9);
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
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;

  objc_msgSend_personSearches(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v7 = (void *)v4,
        objc_msgSend_personSearches(self, v5, v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend_count(v8, v9, v10),
        v8,
        v7,
        v11))
  {
    v12 = 0;
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x24BE811A8]);
    v12 = (void *)objc_msgSend_initWithReason_(v13, v14, (uint64_t)CFSTR("Expected personSearches to be set"));
  }
  return v12;
}

- (id)perform
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  CNAssistantCommandSearchPerson *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  id v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  id v44;
  const char *v45;
  _QWORD v47[7];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = sub_2163417B4;
  v60 = sub_2163417C4;
  v4 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend_personSearches(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v5, v6, v7);
  objc_msgSend_arrayWithCapacity_(v4, v9, v8);
  v61 = (id)objc_claimAutoreleasedReturnValue();

  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend_personSearches(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v48, v62, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v49;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v49 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v16);
        v18 = [CNAssistantCommandSearchPerson alloc];
        objc_msgSend_dictionary(v17, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend_initWithDictionary_(v18, v22, (uint64_t)v21);

        objc_msgSend_contactStore(self, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setContactStore_(v23, v27, (uint64_t)v26);

        objc_msgSend_resultsLimit(self, v28, v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32
          && (v33 = v53[3],
              objc_msgSend_resultsLimit(self, v30, v31),
              v34 = (void *)objc_claimAutoreleasedReturnValue(),
              LODWORD(v33) = v33 < objc_msgSend_integerValue(v34, v35, v36),
              v34,
              v32,
              !(_DWORD)v33))
        {
          v37 = objc_alloc_init(MEMORY[0x24BE810A0]);
          objc_msgSend_refId(v17, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRefId_(v37, v41, (uint64_t)v40);

          objc_msgSend_addObject_((void *)v57[5], v42, (uint64_t)v37);
        }
        else
        {
          v47[0] = MEMORY[0x24BDAC760];
          v47[1] = 3221225472;
          v47[2] = sub_2163417CC;
          v47[3] = &unk_24D5291B8;
          v47[4] = v17;
          v47[5] = &v56;
          v47[6] = &v52;
          objc_msgSend_performWithCompletion_(v23, v30, (uint64_t)v47);
        }

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v43, (uint64_t)&v48, v62, 16);
    }
    while (v14);
  }

  v44 = objc_alloc_init(MEMORY[0x24BE81088]);
  objc_msgSend_setPersonSearchCompleteds_(v44, v45, v57[5]);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
