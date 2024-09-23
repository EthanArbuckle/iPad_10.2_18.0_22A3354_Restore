@implementation CNAssistantCommandCancelPerson

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
    objc_msgSend_removeUpdatesFromCache(self, v8, v9);
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

- (id)removeUpdatesFromCache
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;

  objc_msgSend_identifier(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_removeUpdatesForAssistantUrl_(CNAssistantCache, v7, (uint64_t)v6) & 1) == 0)
  {
    v8 = (void *)*MEMORY[0x24BE08FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
      sub_216344E64(v8, v6);
  }
  v9 = objc_alloc_init(MEMORY[0x24BE81218]);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
