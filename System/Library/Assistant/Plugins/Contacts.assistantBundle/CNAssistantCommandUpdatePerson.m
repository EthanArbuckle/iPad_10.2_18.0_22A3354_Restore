@implementation CNAssistantCommandUpdatePerson

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
    objc_msgSend_addToUpdatesCache(self, v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v7;
  objc_msgSend_dictionary(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v10);

}

- (id)validateIdentifier
{
  return 0;
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
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  id v34;
  const char *v35;
  id v37;
  const char *v38;
  void *v39;
  id v40;
  const char *v41;
  id v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  id v50;
  const char *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_identifier(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v34 = objc_alloc(MEMORY[0x24BE811A8]);
    return (id)objc_msgSend_initWithReason_(v34, v35, (uint64_t)CFSTR("Expected identifier to be set"));
  }
  objc_msgSend_identifier(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_identifier(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v40 = objc_alloc(MEMORY[0x24BE811A8]);
      v39 = (void *)objc_msgSend_initWithReason_(v40, v41, (uint64_t)CFSTR("Invalid person identifier"));
LABEL_28:

      goto LABEL_29;
    }
    v16 = (void *)MEMORY[0x24BE19120];
    objc_msgSend_identifier(v7, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contactIDFromAssistantID_(v16, v18, (uint64_t)v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v42 = objc_alloc(MEMORY[0x24BE811A8]);
      v39 = (void *)objc_msgSend_initWithReason_(v42, v43, (uint64_t)CFSTR("Invalid person identifier (person does not exist)"));
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend_contactStore(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = *MEMORY[0x24BDBA3F0];
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v23, (uint64_t)v52, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(v22, v25, (uint64_t)v19, v24, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v33 = CFSTR("Invalid person identifier (person does not exist)");
      goto LABEL_24;
    }
    objc_msgSend_setFields(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_setFields(self, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v33 = CFSTR("Expected SAABPerson for setFields");
        v7 = v32;
        goto LABEL_24;
      }
    }
    else
    {
      v32 = v7;
    }
    objc_msgSend_addFields(self, v30, v31);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend_addFields(self, v45, v46);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v33 = CFSTR("Expected SAABPerson for addFields");
        goto LABEL_24;
      }
      v32 = v7;
    }
    objc_msgSend_removeFields(self, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v47)
    {
      v39 = 0;
LABEL_26:

      v7 = v32;
      goto LABEL_27;
    }
    objc_msgSend_removeFields(self, v48, v49);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = 0;
LABEL_25:
      v32 = v7;
      goto LABEL_26;
    }
    v33 = CFSTR("Expected SAABPerson for removeFields");
LABEL_24:
    v50 = objc_alloc(MEMORY[0x24BE811A8]);
    v39 = (void *)objc_msgSend_initWithReason_(v50, v51, (uint64_t)v33);
    goto LABEL_25;
  }
  v37 = objc_alloc(MEMORY[0x24BE811A8]);
  v39 = (void *)objc_msgSend_initWithReason_(v37, v38, (uint64_t)CFSTR("Expected SAABPerson for identifier"));
LABEL_29:

  return v39;
}

- (id)addToUpdatesCache
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;
  const char *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CNAssistantCommandUpdatePerson;
  -[CNAssistantCommandUpdatePerson dictionary](&v23, sel_dictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_addUpdate_forAssistantUrl_(CNAssistantCache, v10, (uint64_t)v3, v9);

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x24BE81240]);
    objc_msgSend_identifier(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIdentifier_(v12, v19, (uint64_t)v18);

  }
  else
  {
    v20 = objc_alloc(MEMORY[0x24BE811A8]);
    v12 = (id)objc_msgSend_initWithReason_(v20, v21, (uint64_t)CFSTR("Failed to cache the update"));
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
