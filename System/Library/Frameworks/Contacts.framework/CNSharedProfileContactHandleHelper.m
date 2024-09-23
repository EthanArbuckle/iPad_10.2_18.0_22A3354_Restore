@implementation CNSharedProfileContactHandleHelper

+ (id)log
{
  if (log_cn_once_token_0_9 != -1)
    dispatch_once(&log_cn_once_token_0_9, &__block_literal_global_100);
  return (id)log_cn_once_object_0_9;
}

void __41__CNSharedProfileContactHandleHelper_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNSharedProfileContactHandleHelper");
  v1 = (void *)log_cn_once_object_0_9;
  log_cn_once_object_0_9 = (uint64_t)v0;

}

- (CNSharedProfileContactHandleHelper)init
{
  CNSharedProfileContactHandleHelper *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNSharedProfileContactHandleHelper;
  v2 = -[CNSharedProfileContactHandleHelper init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13A70]), "initWithClassificationQuality:", 0);
    v2 = -[CNSharedProfileContactHandleHelper initWithHandleStringClassifier:](v2, "initWithHandleStringClassifier:", v3);

  }
  return v2;
}

- (CNSharedProfileContactHandleHelper)initWithHandleStringClassifier:(id)a3
{
  id v5;
  CNSharedProfileContactHandleHelper *v6;
  CNSharedProfileContactHandleHelper *v7;
  CNSharedProfileContactHandleHelper *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNSharedProfileContactHandleHelper;
  v6 = -[CNSharedProfileContactHandleHelper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_classifier, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)contact:(id)a3 containsHandleString:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isKeyAvailable:", CFSTR("emailAddresses"))
    || (objc_msgSend(v6, "isKeyAvailable:", CFSTR("phoneNumbers")) & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CNSharedProfileContactHandleHelper contact:containsHandleString:].cold.1(v8);

  }
  -[CNSharedProfileContactHandleHelper classifier](self, "classifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "typeOfHandleString:", v7);

  if (v10)
  {
    if (v10 != 2)
    {
      if (v10 != 1)
      {
        v12 = 0;
        goto LABEL_15;
      }
      v11 = -[CNSharedProfileContactHandleHelper contact:containsEmailHandleString:](self, "contact:containsEmailHandleString:", v6, v7);
      goto LABEL_13;
    }
LABEL_12:
    v11 = -[CNSharedProfileContactHandleHelper contact:containsPhoneHandleString:](self, "contact:containsPhoneHandleString:", v6, v7);
LABEL_13:
    v12 = v11;
    goto LABEL_15;
  }
  if (!-[CNSharedProfileContactHandleHelper contact:containsEmailHandleString:](self, "contact:containsEmailHandleString:", v6, v7))goto LABEL_12;
  v12 = 1;
LABEL_15:

  return v12;
}

- (BOOL)contact:(id)a3 containsEmailHandleString:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a3, "emailAddresses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = *MEMORY[0x1E0D13768];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "value");
        v12 = objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v12) = objc_msgSend(v13, "isEqualToString:", v5);
        if ((v12 & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)contact:(id)a3 containsPhoneHandleString:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "phoneNumbers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "value");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v10, "unformattedInternationalStringValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v10) = objc_msgSend(v11, "isEqualToString:", v5);
        if ((v10 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (CNHandleStringClassifier)classifier
{
  return self->_classifier;
}

- (void)setClassifier:(id)a3
{
  objc_storeStrong((id *)&self->_classifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifier, 0);
}

- (void)contact:(os_log_t)log containsHandleString:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Contact must have already have CNContactEmailAddressesKey and CNContactPhoneNumbersKey available", v1, 2u);
}

@end
