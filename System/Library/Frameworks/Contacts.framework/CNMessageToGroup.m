@implementation CNMessageToGroup

+ (id)os_log
{
  if (os_log_cn_once_token_1_0 != -1)
    dispatch_once(&os_log_cn_once_token_1_0, &__block_literal_global_44);
  return (id)os_log_cn_once_object_1_0;
}

void __26__CNMessageToGroup_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNMessageToGroup");
  v1 = (void *)os_log_cn_once_object_1_0;
  os_log_cn_once_object_1_0 = (uint64_t)v0;

}

+ (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  +[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = CFSTR("emailAddresses");
  v8[2] = CFSTR("phoneNumbers");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNMessageToGroup)init
{
  CNMessageToGroup *v2;
  CNContactFormatter *v3;
  CNContactFormatter *contactFormatter;
  CNMessageToGroup *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNMessageToGroup;
  v2 = -[CNMessageToGroup init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CNContactFormatter);
    contactFormatter = v2->_contactFormatter;
    v2->_contactFormatter = v3;

    -[CNContactFormatter setStyle:](v2->_contactFormatter, "setStyle:", 0);
    v5 = v2;
  }

  return v2;
}

- (id)messageUrlForContacts:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  id v16;
  _QWORD v17[5];

  v3 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42__CNMessageToGroup_messageUrlForContacts___block_invoke;
  v17[3] = &unk_1E29F88F0;
  v17[4] = self;
  objc_msgSend(a3, "_cn_map:", v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_filter:", *MEMORY[0x1E0D13830]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("sms://open?service=iMessage&recipients="));
    v12 = v3;
    v13 = 3221225472;
    v14 = __42__CNMessageToGroup_messageUrlForContacts___block_invoke_8;
    v15 = &unk_1E29F9590;
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v16;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v12);
    objc_msgSend(v6, "_cn_stringByAddingPercentEscapesToEntireURL", v12, v13, v14, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CNMessageToGroup messageUrlForContacts:].cold.1(v10);

    v9 = 0;
  }

  return v9;
}

id __42__CNMessageToGroup_messageUrlForContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *MEMORY[0x1E0D13878];
  objc_msgSend(*(id *)(a1 + 32), "messagingAddressForContact:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __42__CNMessageToGroup_messageUrlForContacts___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);

}

- (id)emailAddressForContact:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "emailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_firstObjectPassingTest:", &__block_literal_global_14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __43__CNMessageToGroup_emailAddressForContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *MEMORY[0x1E0D13850];
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

- (id)messagingAddressForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v4 = a3;
  -[CNMessageToGroup emailAddressForContact:](self, "emailAddressForContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13850] + 16))() & 1) != 0 || v9)
  {
    if (v9)
    {
      v18 = v9;
    }
    else
    {
      -[CNMessageToGroup santizeMessagingAddress:](self, "santizeMessagingAddress:", v5);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v18;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CNMessageToGroup messagingAddressForContact:].cold.1((uint64_t)v4, v10, v11, v12, v13, v14, v15, v16);

    v17 = 0;
  }

  return v17;
}

- (id)santizeMessagingAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend((Class)getECEmailAddressClass[0](), "emailAddressWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddressValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  objc_msgSend(v5, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CNMessageToGroup santizeMessagingAddress:].cold.1((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);

  }
  return v7;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatter, 0);
}

- (void)messageUrlForContacts:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Failed to create message URL", v1, 2u);
}

- (void)messagingAddressForContact:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Failed to create messaging address for contact: %@", a5, a6, a7, a8, 2u);
}

- (void)santizeMessagingAddress:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Failed to sanitize messaging address: %@", a5, a6, a7, a8, 2u);
}

@end
