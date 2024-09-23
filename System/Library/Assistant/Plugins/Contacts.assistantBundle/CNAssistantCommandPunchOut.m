@implementation CNAssistantCommandPunchOut

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

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  void (**v6)(id, void *);
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = (void (**)(id, void *))a3;
  objc_msgSend_validate(self, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend_punchOutWithServiceHelper_(self, v9, (uint64_t)v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_dictionary(v11, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v12);

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
  void *v25;
  id v26;
  const char *v27;
  id v28;
  const char *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  id v33;
  const char *v34;

  objc_msgSend_domainItem(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_domainItem(self, v5, v6);
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

        objc_msgSend_contactStore(self, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(v22, v23, (uint64_t)v19, MEMORY[0x24BDBD1A8], 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = 0;
        if (!v24)
        {
          v26 = objc_alloc(MEMORY[0x24BE811A8]);
          v25 = (void *)objc_msgSend_initWithReason_(v26, v27, (uint64_t)CFSTR("Invalid person identifier (person does not exist)"));
        }

        goto LABEL_11;
      }
      v33 = objc_alloc(MEMORY[0x24BE811A8]);
      v32 = objc_msgSend_initWithReason_(v33, v34, (uint64_t)CFSTR("Invalid person identifier"));
    }
    else
    {
      v30 = objc_alloc(MEMORY[0x24BE811A8]);
      v32 = objc_msgSend_initWithReason_(v30, v31, (uint64_t)CFSTR("Expected SAABPerson for domainItem"));
    }
    v25 = (void *)v32;
LABEL_11:

    return v25;
  }
  v28 = objc_alloc(MEMORY[0x24BE811A8]);
  v25 = (void *)objc_msgSend_initWithReason_(v28, v29, (uint64_t)CFSTR("Expected domainItem to be set"));
  return v25;
}

- (CNAssistantCommandPunchOut)punchOutWithServiceHelper:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  id v29;
  id v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;

  v4 = a3;
  objc_msgSend_domainItem(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE19120];
  objc_msgSend_identifier(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contactIDFromAssistantID_(v8, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_contactStore(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(v16, v17, (uint64_t)v13, MEMORY[0x24BDBD1A8], 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_4;
  v21 = (void *)MEMORY[0x24BDBCF48];
  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_identifier(v18, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v22, v24, (uint64_t)CFSTR("addressbook://%@"), v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v21, v26, (uint64_t)v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v25) = objc_msgSend_openSensitiveURL_(v4, v28, (uint64_t)v27);
  if ((_DWORD)v25)
  {
    v29 = objc_alloc_init(MEMORY[0x24BE811B8]);
  }
  else
  {
LABEL_4:
    v30 = objc_alloc(MEMORY[0x24BE811A8]);
    v31 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_absoluteString(0, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v31, v35, (uint64_t)CFSTR("Failed to open url %@"), v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)objc_msgSend_initWithReason_(v30, v37, (uint64_t)v36);

  }
  return (CNAssistantCommandPunchOut *)v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
