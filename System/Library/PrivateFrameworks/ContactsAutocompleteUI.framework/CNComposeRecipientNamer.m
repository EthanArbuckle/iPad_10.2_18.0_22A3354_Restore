@implementation CNComposeRecipientNamer

+ (id)os_log
{
  if (os_log_cn_once_token_1_1 != -1)
    dispatch_once(&os_log_cn_once_token_1_1, &__block_literal_global_9);
  return (id)os_log_cn_once_object_1_1;
}

void __33__CNComposeRecipientNamer_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "compose-recipient-namer");
  v1 = (void *)os_log_cn_once_object_1_1;
  os_log_cn_once_object_1_1 = (uint64_t)v0;

}

+ (id)nameForComposeRecipient:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  v3 = objc_opt_self();
  +[CNComposeRecipientNamer nameForComposeRecipient:sources:](v3, v2, 0xFFFFFFFFLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (__CFString)nameForComposeRecipient:(uint64_t)a3 sources:
{
  id v4;
  void *v5;
  NSObject *v6;
  __CFString *v7;

  v4 = a2;
  v5 = (void *)objc_opt_self();
  if (v4)
  {
    if (objc_msgSend(v4, "isGroup"))
      objc_msgSend(v5, "nameForGroup:sources:", v4, a3);
    else
      objc_msgSend(v5, "nameForPerson:sources:", v4, a3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientShortNamer shortNameForComposeRecipient:].cold.1(v6);

    v7 = &stru_1E62C0368;
  }

  return v7;
}

+ (id)nameForGroup:(id)a3 sources:(unsigned int)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;

  v6 = a3;
  if ((a4 & 1) != 0)
  {
    objc_msgSend(a1, "nicknameForRecipient:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      goto LABEL_17;

  }
  if ((a4 & 2) != 0)
  {
    objc_msgSend(a1, "displayStringForRecipient:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      goto LABEL_17;

  }
  if ((a4 & 4) != 0)
  {
    objc_msgSend(a1, "buildAdHocNameForGroup:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      goto LABEL_17;

  }
  if ((a4 & 0x80000000) != 0)
  {
    objc_msgSend(v6, "placeholderName");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientNamer nameForGroup:sources:].cold.2();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientNamer nameForGroup:sources:].cold.1();
    v7 = &stru_1E62C0368;
  }

LABEL_17:
  return v7;
}

+ (id)nicknameForRecipient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shortNameFormatPrefersNicknames"))
  {
    objc_msgSend(v3, "nameComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nickname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "length"))
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        +[CNComposeRecipientNamer nicknameForRecipient:].cold.2();
      goto LABEL_10;
    }

  }
  objc_msgSend((id)objc_opt_class(), "os_log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[CNComposeRecipientNamer nicknameForRecipient:].cold.1();
  v6 = 0;
LABEL_10:

  return v6;
}

+ (id)displayStringForRecipient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  id v10;

  v3 = a3;
  objc_msgSend(v3, "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientNamer displayStringForRecipient:].cold.1();
    goto LABEL_10;
  }
  objc_msgSend((id)objc_opt_class(), "os_log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[CNComposeRecipientNamer displayStringForRecipient:].cold.4((uint64_t)v5, v6);

  v7 = objc_msgSend(v5, "_cn_hasPrefix:", CFSTR("\u200E"));
  objc_msgSend((id)objc_opt_class(), "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CNComposeRecipientNamer displayStringForRecipient:].cold.2((uint64_t)v5, (uint64_t)v3, v9);
LABEL_10:

    v10 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[CNComposeRecipientNamer displayStringForRecipient:].cold.3();

  v10 = v5;
LABEL_11:

  return v10;
}

+ (id)buildAdHocNameForGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNNameListBuilderBlockDelegate *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  CNNameListBuilder *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;

  v4 = a3;
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = objc_alloc_init(CNNameListBuilderBlockDelegate);
  objc_msgSend(v4, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNNameListBuilderBlockDelegate setCountOfNames:](v7, "setCountOfNames:", objc_msgSend(v8, "count"));

  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __50__CNComposeRecipientNamer_buildAdHocNameForGroup___block_invoke;
  v23[3] = &unk_1E62BFA40;
  v10 = v6;
  v24 = v10;
  v11 = v5;
  v25 = v11;
  v27 = a1;
  v12 = v4;
  v26 = v12;
  -[CNNameListBuilderBlockDelegate setNameProviderBlock:](v7, "setNameProviderBlock:", v23);
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __50__CNComposeRecipientNamer_buildAdHocNameForGroup___block_invoke_9;
  v21[3] = &unk_1E62BF370;
  v13 = v10;
  v22 = v13;
  -[CNNameListBuilderBlockDelegate setLengthValidationBlock:](v7, "setLengthValidationBlock:", v21);
  v14 = -[CNNameListBuilder initWithDelegate:]([CNNameListBuilder alloc], "initWithDelegate:", v7);
  -[CNNameListBuilder setShouldStripEllipses:](v14, "setShouldStripEllipses:", 1);
  -[CNNameListBuilder build](v14, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && objc_msgSend(v15, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientNamer buildAdHocNameForGroup:].cold.2();

    v18 = v16;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[CNComposeRecipientNamer buildAdHocNameForGroup:].cold.1();

    v18 = 0;
  }

  return v18;
}

id __50__CNComposeRecipientNamer_buildAdHocNameForGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compositeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "os_log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544387;
    v14 = v9;
    v15 = 2048;
    v16 = v10;
    v17 = 2114;
    v18 = v12;
    v19 = 2048;
    v20 = v4;
    v21 = 2113;
    v22 = v5;
    _os_log_debug_impl(&dword_1B10FF000, v6, OS_LOG_TYPE_DEBUG, "Group %{public}@ %p contains member %{public}@ %p: %{private}@", (uint8_t *)&v13, 0x34u);

  }
  return v5;
}

BOOL __50__CNComposeRecipientNamer_buildAdHocNameForGroup___block_invoke_9(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 2;
}

+ (id)nameForPerson:(id)a3 sources:(unsigned int)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;

  v6 = a3;
  if ((a4 & 1) != 0)
  {
    objc_msgSend(a1, "nicknameForRecipient:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      goto LABEL_23;

  }
  if ((a4 & 2) != 0)
  {
    objc_msgSend(a1, "displayStringForRecipient:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      goto LABEL_23;

  }
  if ((a4 & 8) != 0)
  {
    objc_msgSend(a1, "nameFromComponentsForPerson:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      goto LABEL_23;

  }
  if ((a4 & 0x10) != 0)
  {
    objc_msgSend(a1, "nameFromContactForPerson:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      goto LABEL_23;

  }
  if ((a4 & 0x20) != 0)
  {
    objc_msgSend(a1, "nameFromAddressForPerson:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      goto LABEL_23;

  }
  if ((a4 & 0x80000000) != 0)
  {
    objc_msgSend(v6, "placeholderName");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientNamer nameForPerson:sources:].cold.2();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientNamer nameForPerson:sources:].cold.1();
    v7 = &stru_1E62C0368;
  }

LABEL_23:
  return v7;
}

+ (id)nameFromComponentsForPerson:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3858]);
    -[NSObject setStyle:](v5, "setStyle:", 3);
    -[NSObject stringFromPersonNameComponents:](v5, "stringFromPersonNameComponents:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "length"))
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        +[CNComposeRecipientNamer nameFromComponentsForPerson:].cold.2();

      v9 = v7;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientNamer nameFromComponentsForPerson:].cold.1();
    v9 = 0;
  }

  return v9;
}

+ (id)nameFromContactForPerson:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;

  v3 = a3;
  objc_msgSend(v3, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientNamer nameFromContactForPerson:].cold.1();

    v8 = v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)nameFromAddressForPerson:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "kind") && objc_msgSend(v4, "kind") != 2)
  {
    objc_msgSend(v4, "address");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "nameFromEmailAddressForPerson:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

+ (id)nameFromEmailAddressForPerson:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;

  v3 = a3;
  objc_msgSend(v3, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "ea_addressComment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        +[CNComposeRecipientNamer nameFromEmailAddressForPerson:].cold.3();

      v10 = v6;
    }
    else
    {
      objc_msgSend(v3, "uncommentedAddress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && objc_msgSend(v7, "length"))
      {
        objc_msgSend((id)objc_opt_class(), "os_log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          +[CNComposeRecipientNamer nameFromEmailAddressForPerson:].cold.2();
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "os_log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          +[CNComposeRecipientNamer nameFromEmailAddressForPerson:].cold.1();
      }

      v10 = v4;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)nameForGroup:sources:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1B10FF000, v2, v3, "Cannot determine a display name for group %{public}@ %p, and no placeholder value was requested.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

+ (void)nameForGroup:sources:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  v0 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B10FF000, v2, v3, "Cannot determine a display name for group %{public}@ %p. Continuing with placeholder: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

+ (void)nicknameForRecipient:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1B10FF000, v2, v3, "No nickname from components for %{public}@ %p", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

+ (void)nicknameForRecipient:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  v0 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B10FF000, v2, v3, "Using nickname from components for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

+ (void)displayStringForRecipient:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1B10FF000, v2, v3, "No display name for %{public}@ %p", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

+ (void)displayStringForRecipient:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138478083;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  OUTLINED_FUNCTION_10(&dword_1B10FF000, a3, (uint64_t)a3, "Provided display name (%{private}@) for %p looks like it might be invalid; ignoring",
    (uint8_t *)&v3);
}

+ (void)displayStringForRecipient:.cold.3()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  v0 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B10FF000, v2, v3, "Using display name for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

+ (void)displayStringForRecipient:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_1B10FF000, a2, OS_LOG_TYPE_DEBUG, "Group’s display name: '%{private}@'", (uint8_t *)&v2, 0xCu);
}

+ (void)buildAdHocNameForGroup:.cold.1()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9();
  v1 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_1B10FF000, v0, v3, "Unable to build name for group %{public}@ %p", v4);

  OUTLINED_FUNCTION_6();
}

+ (void)buildAdHocNameForGroup:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  v0 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B10FF000, v2, v3, "Using built name for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

+ (void)nameForPerson:sources:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1B10FF000, v2, v3, "Cannot determine a display name for %{public}@ %p, and no placeholder value was requested.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

+ (void)nameForPerson:sources:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  v0 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B10FF000, v2, v3, "Cannot determine a display name for %{public}@ %p. Continuing with placeholder: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

+ (void)nameFromComponentsForPerson:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1B10FF000, v2, v3, "No name components available for %{public}@ %p", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

+ (void)nameFromComponentsForPerson:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  v0 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B10FF000, v2, v3, "Using recipient’s name constructed from components for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

+ (void)nameFromContactForPerson:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  v0 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B10FF000, v2, v3, "Using recipient’s name constructed from contact for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

+ (void)nameFromEmailAddressForPerson:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  v0 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B10FF000, v2, v3, "Using possibly commented address for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

+ (void)nameFromEmailAddressForPerson:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  v0 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B10FF000, v2, v3, "Using possibly commented address anyway for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

+ (void)nameFromEmailAddressForPerson:.cold.3()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  v0 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B10FF000, v2, v3, "Using comment from address for %{public}@ %p: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
