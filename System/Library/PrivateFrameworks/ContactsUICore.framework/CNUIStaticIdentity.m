@implementation CNUIStaticIdentity

- (CNUIStaticIdentity)initWithContact:(id)a3
{
  id v5;
  void *v6;
  CNUIStaticIdentity *v7;
  CNUIStaticIdentity *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "findStoreEntryByContact:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && (v10.receiver = self,
          v10.super_class = (Class)CNUIStaticIdentity,
          v7 = -[CNUIStaticIdentity init](&v10, sel_init),
          (self = v7) != 0))
    {
      objc_storeStrong((id *)&v7->_contact, a3);
      objc_storeStrong((id *)&self->_storeEntry, v6);
      self = self;
      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)findStoreEntryByContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v4 = a3;
  objc_msgSend(a1, "ktStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "ktStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v6, "findByContact:error:", v4, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;

    if (!v7)
    {
      +[CNUICoreLogProvider static_identity_os_log](CNUICoreLogProvider, "static_identity_os_log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[CNUIStaticIdentity findStoreEntryByContact:].cold.1();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)ktStore
{
  if (ktStore_onceToken != -1)
    dispatch_once(&ktStore_onceToken, &__block_literal_global_45);
  return (id)ktStore_ktStore;
}

void __29__CNUIStaticIdentity_ktStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DC0938]);
  v1 = (void *)ktStore_ktStore;
  ktStore_ktStore = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeEntry, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (id)verificationCode
{
  void *v2;
  void *v3;
  void *v4;

  -[CNUIStaticIdentity storeEntry](self, "storeEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publicKeyID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publicAccountIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isHandleInStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;

  v4 = a3;
  -[CNUIStaticIdentity storeEntry](self, "storeEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "valid");
  }
  else
  {
    +[CNUICoreLogProvider static_identity_os_log](CNUICoreLogProvider, "static_identity_os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CNUIStaticIdentity isHandleInStore:].cold.1((uint64_t)v4, self, v9);

    v8 = 0;
  }

  return v8;
}

+ (BOOL)isHandleInStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  char v11;
  NSObject *v12;
  id v14;

  v4 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    objc_msgSend(a1, "ktStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1, "ktStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      objc_msgSend(v6, "findKeyByHandle:error:", v4, &v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;

      if (v7)
      {
        objc_msgSend(v7, "handles");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v4);
        v10 = objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = -[NSObject valid](v10, "valid");
LABEL_13:

          goto LABEL_14;
        }
        +[CNUICoreLogProvider static_identity_os_log](CNUICoreLogProvider, "static_identity_os_log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          +[CNUIStaticIdentity isHandleInStore:].cold.2((uint64_t)v4, v12);

      }
      else
      {
        +[CNUICoreLogProvider static_identity_os_log](CNUICoreLogProvider, "static_identity_os_log");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          +[CNUIStaticIdentity isHandleInStore:].cold.1();
      }
      v11 = 0;
      goto LABEL_13;
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
}

+ (id)makeKTPublicIDWithString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "ktStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0DC0930], "ktAccountPublicIDWithString:error:", v4, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (!v5)
    {
      +[CNUICoreLogProvider static_identity_os_log](CNUICoreLogProvider, "static_identity_os_log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[CNUIStaticIdentity makeKTPublicIDWithString:].cold.1();

    }
  }

  return v5;
}

+ (BOOL)isValidStaticKeyString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "ktStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[CNUIStaticIdentity makeKTPublicIDWithString:](CNUIStaticIdentity, "makeKTPublicIDWithString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = v6 != 0;

  }
  return (char)v5;
}

+ (BOOL)addStaticKeyWithPublicIDString:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "ktStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[CNUIStaticIdentity makeKTPublicIDWithString:](CNUIStaticIdentity, "makeKTPublicIDWithString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(a1, "ktStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v11 = objc_msgSend(v10, "updateStaticKeyEntry:contact:error:", v9, v7, &v16);
      v12 = v16;

      if ((v11 & 1) != 0)
      {
        v13 = 1;
      }
      else
      {
        +[CNUICoreLogProvider static_identity_os_log](CNUICoreLogProvider, "static_identity_os_log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          +[CNUIStaticIdentity addStaticKeyWithPublicIDString:contact:].cold.1((uint64_t)v12, v14);

        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
      v12 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)removeAccountKeyFromContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v12;

  v4 = a3;
  objc_msgSend(a1, "findStoreEntryByContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "ktStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "publicKeyID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v8 = objc_msgSend(v6, "removeEntryByKDID:error:", v7, &v12);
    v9 = v12;

    if ((v8 & 1) == 0)
    {
      +[CNUICoreLogProvider static_identity_os_log](CNUICoreLogProvider, "static_identity_os_log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[CNUIStaticIdentity removeAccountKeyFromContact:].cold.1(v4, (uint64_t)v9, v10);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CNContact)contact
{
  return self->_contact;
}

- (KTIDStaticKeyStoreEntry)storeEntry
{
  return self->_storeEntry;
}

- (void)isHandleInStore:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, a3, v6, "Unable to find store handle for handle in contact %@: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2_3();
}

+ (void)isHandleInStore:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, (uint64_t)v0, "Unable to find store entry for handle %@: %@", v1);
  OUTLINED_FUNCTION_2();
}

+ (void)isHandleInStore:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DD140000, a2, OS_LOG_TYPE_DEBUG, "Unable to find store handle for handle %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)findStoreEntryByContact:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, (uint64_t)v0, "Unable to find store entry for contact %@: %@", v1);
  OUTLINED_FUNCTION_2();
}

+ (void)makeKTPublicIDWithString:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1DD140000, v0, (uint64_t)v0, "Error creating public id with verification code %@: %@", v1);
  OUTLINED_FUNCTION_2();
}

+ (void)addStaticKeyWithPublicIDString:(uint64_t)a1 contact:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DD140000, a2, OS_LOG_TYPE_ERROR, "Error saving static id: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)removeAccountKeyFromContact:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_4(&dword_1DD140000, a3, v6, "Error removing verification code from contact %@: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2_3();
}

@end
