@implementation CNComposeRecipientShortNamer

+ (id)os_log
{
  if (os_log_cn_once_token_1_0 != -1)
    dispatch_once(&os_log_cn_once_token_1_0, &__block_literal_global_2);
  return (id)os_log_cn_once_object_1_0;
}

void __38__CNComposeRecipientShortNamer_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "composerecipient");
  v1 = (void *)os_log_cn_once_object_1_0;
  os_log_cn_once_object_1_0 = (uint64_t)v0;

}

+ (__CFString)shortNameForComposeRecipient:(uint64_t)a1
{
  id v2;
  void *v3;
  NSObject *v4;
  __CFString *v5;

  v2 = a2;
  v3 = (void *)objc_opt_self();
  if (v2)
  {
    if (objc_msgSend(v2, "isGroup"))
      objc_msgSend(v3, "nameForGroup:", v2);
    else
      objc_msgSend(v3, "nameForPerson:", v2);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientShortNamer shortNameForComposeRecipient:].cold.1(v4);

    v5 = &stru_1E62C0368;
  }

  return v5;
}

+ (id)nameForGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "shortNameFromDisplayStringForGroup:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D13848];
  if ((*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v5))
  {

    objc_msgSend(a1, "buildAdHocNameForGroup:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v5))
    {

      objc_msgSend(v4, "placeholderName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

+ (id)nameForPerson:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "shortNameFromNameComponentsForComposeRecipient:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D13848];
  if ((*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v5))
  {

    objc_msgSend(a1, "shortNameFromDisplayStringForPerson:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v5))
    {

      objc_msgSend(a1, "shortNameFromCompositeNameForComposeRecipient:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v5))
      {

        objc_msgSend(a1, "shortNameFromAddressForComposeRecipient:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v5))
        {

          objc_msgSend(v4, "placeholderName");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }

  return v5;
}

+ (id)buildAdHocNameForGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  CNNameListBuilderBlockDelegate *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  CNNameListBuilder *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __CFString *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v3 = a3;
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc_init(CNNameListBuilderBlockDelegate);
  objc_msgSend(v3, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNNameListBuilderBlockDelegate setCountOfNames:](v6, "setCountOfNames:", objc_msgSend(v7, "count"));

  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__CNComposeRecipientShortNamer_buildAdHocNameForGroup___block_invoke;
  v21[3] = &unk_1E62BF348;
  v9 = v5;
  v22 = v9;
  v10 = v4;
  v23 = v10;
  -[CNNameListBuilderBlockDelegate setNameProviderBlock:](v6, "setNameProviderBlock:", v21);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __55__CNComposeRecipientShortNamer_buildAdHocNameForGroup___block_invoke_2;
  v19[3] = &unk_1E62BF370;
  v11 = v9;
  v20 = v11;
  -[CNNameListBuilderBlockDelegate setLengthValidationBlock:](v6, "setLengthValidationBlock:", v19);
  v12 = -[CNNameListBuilder initWithDelegate:]([CNNameListBuilder alloc], "initWithDelegate:", v6);
  -[CNNameListBuilder setShouldStripEllipses:](v12, "setShouldStripEllipses:", 1);
  -[CNNameListBuilder build](v12, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && objc_msgSend(v13, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientShortNamer buildAdHocNameForGroup:].cold.2();

    v16 = v14;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientShortNamer buildAdHocNameForGroup:].cold.1();

    v16 = &stru_1E62C0368;
  }

  return v16;
}

id __55__CNComposeRecipientShortNamer_buildAdHocNameForGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __55__CNComposeRecipientShortNamer_buildAdHocNameForGroup___block_invoke_2(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 2;
}

+ (id)shortNameFromNameComponentsForComposeRecipient:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(a3, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "shortNameFromNameComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "os_log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientShortNamer shortNameFromNameComponentsForComposeRecipient:].cold.1();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)shortNameFromDisplayStringForGroup:(id)a3
{
  return (id)objc_msgSend(a3, "displayString");
}

+ (id)shortNameFromDisplayStringForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;

  v4 = a3;
  objc_msgSend(v4, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nameComponentsFromDisplayName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "shortNameFromNameComponents:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && -[NSObject length](v7, "length"))
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[CNComposeRecipientShortNamer shortNameFromDisplayStringForPerson:].cold.2();
      goto LABEL_13;
    }

  }
  objc_msgSend(v4, "displayString");
  v10 = objc_claimAutoreleasedReturnValue();
  v9 = v10;
  if (v10 && -[NSObject length](v10, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[CNComposeRecipientShortNamer shortNameFromDisplayStringForPerson:].cold.1();

    v9 = v9;
    v8 = v9;
  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

+ (id)shortNameFromNameComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composeRecipientNameOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "shortNameFormat");
    if (v6 == 2)
    {
      objc_msgSend(v3, "familyName");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6 != 1)
      {
        if (!v6)
        {
          v7 = (void *)objc_opt_new();
          objc_msgSend(v7, "setStyle:", 1);
          objc_msgSend(v7, "stringFromPersonNameComponents:", v3);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_10;
      }
      objc_msgSend(v3, "givenName");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v8;
LABEL_10:

    goto LABEL_11;
  }
  v4 = 0;
LABEL_11:

  return v4;
}

+ (id)nameComponentsFromDisplayName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "personNameComponentsFromString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)shortNameFromCompositeNameForComposeRecipient:(id)a3
{
  void *v3;
  NSObject *v4;

  +[CNComposeRecipientNamer nameForComposeRecipient:]((uint64_t)CNComposeRecipientNamer, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[CNComposeRecipientShortNamer shortNameFromCompositeNameForComposeRecipient:].cold.1();

  return v3;
}

+ (id)shortNameFromAddressForComposeRecipient:(id)a3
{
  void *v3;
  NSObject *v4;

  objc_msgSend(a3, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[CNComposeRecipientShortNamer shortNameFromAddressForComposeRecipient:].cold.1();

  return v3;
}

+ (void)shortNameForComposeRecipient:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B10FF000, log, OS_LOG_TYPE_DEBUG, "recipient is nil, so name is ''", v1, 2u);
}

+ (void)buildAdHocNameForGroup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B10FF000, v0, v1, "Unable to build name for group %{private}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)buildAdHocNameForGroup:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2113;
  v4 = v0;
  _os_log_debug_impl(&dword_1B10FF000, v1, OS_LOG_TYPE_DEBUG, "Using built name '%{private}@' for group %{private}@.", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)shortNameFromNameComponentsForComposeRecipient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B10FF000, v0, v1, "Short name from components: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)shortNameFromDisplayStringForPerson:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B10FF000, v0, v1, "Short name from display string: '%{private}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)shortNameFromDisplayStringForPerson:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B10FF000, v0, v1, "Short name from parsed display string: '%{private}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)shortNameFromCompositeNameForComposeRecipient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B10FF000, v0, v1, "Short name from composite name: '%{private}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)shortNameFromAddressForComposeRecipient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B10FF000, v0, v1, "Short name from full address: '%{private}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
