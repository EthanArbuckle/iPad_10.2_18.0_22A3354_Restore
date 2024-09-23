@implementation CNContactVCardSerialization

+ (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DDCAF0], "optionsFromPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactVCardSerialization descriptorForRequiredKeys]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptorForRequiredKeysWithOptions:description:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)summaryOfVCard:(id)a3 error:(id *)a4
{
  id v5;
  CNContactVCardSummary *v6;

  v5 = a3;
  v6 = -[CNContactVCardSummary initWithData:error:]([CNContactVCardSummary alloc], "initWithData:error:", v5, a4);

  return v6;
}

+ (id)summaryOfLocationVCard:(id)a3 error:(id *)a4
{
  id v5;
  CNContactLocationVCardSummary *v6;

  v5 = a3;
  v6 = -[CNContactLocationVCardSummary initWithData:error:]([CNContactLocationVCardSummary alloc], "initWithData:error:", v5, a4);

  return v6;
}

+ (id)descriptorForRequiredKeysWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithUTF8String:", "+[CNContactVCardSerialization descriptorForRequiredKeysWithOptions:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptorForRequiredKeysWithOptions:description:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)descriptorForRequiredKeysWithOptions:(id)a3 description:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[CNContactVCardWritingAdapter descriptorForAllSupportedKeysWithOptions:](CNContactVCardWritingAdapter, "descriptorForAllSupportedKeysWithOptions:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (NSData)dataWithContacts:(NSArray *)contacts error:(NSError *)error
{
  void *v6;
  NSArray *v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0DDCAF0];
  v7 = contacts;
  objc_msgSend(v6, "optionsFromPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataWithContacts:options:error:", v7, v8, error);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v9;
}

+ (id)dataWithContacts:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataWithContacts:options:error:environment:", v9, v8, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)dataWithContacts:(id)a3 options:(id)a4 error:(id *)a5 environment:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v10 = a4;
  v11 = a3;
  objc_msgSend(a6, "loggerProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "regulatoryLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "logWritingContactsToVCard:options:logger:", v11, v10, v13);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__CNContactVCardSerialization_dataWithContacts_options_error_environment___block_invoke;
  v18[3] = &unk_1E29FD928;
  v19 = v10;
  v14 = v10;
  objc_msgSend(v11, "_cn_map:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DDCAE8], "dataWithPeople:options:error:", v15, v14, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

CNContactVCardWritingAdapter *__74__CNContactVCardSerialization_dataWithContacts_options_error_environment___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNContactVCardWritingAdapter adapterWithContact:options:](CNContactVCardWritingAdapter, "adapterWithContact:options:", a2, *(_QWORD *)(a1 + 32));
}

+ (void)logWritingContactsToVCard:(id)a3 options:(id)a4 logger:(id)a5
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a5;
  if ((objc_msgSend(a4, "shouldSuppressRegulatoryLogging") & 1) == 0
    && objc_msgSend(v8, "_cn_any:", &__block_literal_global_121))
  {
    objc_msgSend(v7, "readAndTransmittingContactsData");
  }

}

uint64_t __72__CNContactVCardSerialization_logWritingContactsToVCard_options_logger___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasBeenPersisted");
}

+ (NSArray)contactsWithData:(NSData *)data error:(NSError *)error
{
  objc_class *v6;
  NSData *v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0DDCAE0];
  v7 = data;
  v8 = objc_alloc_init(v6);
  objc_msgSend(a1, "contactsWithData:options:error:", v7, v8, error);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

+ (id)contactsWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CNContactVCardParsedResultBuilderFactory *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  if (v6)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_8 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_41_2);
  v8 = CNGuardOSLog_cn_once_object_0_8;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT))
  {
    +[CNContactVCardSerialization contactsWithData:options:error:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
    if (v7)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v7)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_8 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_41_2);
  v16 = CNGuardOSLog_cn_once_object_0_8;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT))
    +[CNContactVCardSerialization contactsWithData:options:error:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_10:
  v24 = objc_alloc_init(CNContactVCardParsedResultBuilderFactory);
  objc_msgSend(MEMORY[0x1E0DDCAD0], "parseData:options:resultFactory:", v6, v7, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (void)contactsWithData:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0D13B68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "globalAsyncScheduler");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contactsWithData:scheduler:completionHandler:", v8, v9, v7);

}

+ (void)contactsWithData:(id)a3 scheduler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__CNContactVCardSerialization_contactsWithData_scheduler_completionHandler___block_invoke;
    v10[3] = &unk_1E29FD950;
    v13 = a1;
    v11 = v8;
    v12 = v9;
    objc_msgSend(a4, "performBlock:", v10);

  }
}

void __76__CNContactVCardSerialization_contactsWithData_scheduler_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)a1[6];
  v3 = a1[4];
  v6 = 0;
  objc_msgSend(v2, "contactsWithData:error:", v3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  (*(void (**)(void))(a1[5] + 16))();

}

+ (void)dataWithContacts:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = (void *)MEMORY[0x1E0D13B68];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "globalAsyncScheduler");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataWithContacts:options:scheduler:completionHandler:", v11, v10, v12, v9);

}

+ (void)dataWithContacts:(id)a3 options:(id)a4 scheduler:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v9 = a3;
  v10 = a6;
  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __84__CNContactVCardSerialization_dataWithContacts_options_scheduler_completionHandler___block_invoke;
    v11[3] = &unk_1E29FD950;
    v14 = a1;
    v12 = v9;
    v13 = v10;
    objc_msgSend(a5, "performBlock:", v11);

  }
}

void __84__CNContactVCardSerialization_dataWithContacts_options_scheduler_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)a1[6];
  v3 = a1[4];
  v6 = 0;
  objc_msgSend(v2, "dataWithContacts:error:", v3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  (*(void (**)(void))(a1[5] + 16))();

}

+ (id)contactsWithMECARDString:(id)a3 error:(id *)a4
{
  id v5;
  CNContactVCardParsedResultBuilderFactory *v6;
  void *v7;

  v5 = a3;
  v6 = objc_alloc_init(CNContactVCardParsedResultBuilderFactory);
  objc_msgSend(MEMORY[0x1E0DDCAC8], "parseString:resultFactory:error:", v5, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)contactsWithData:(uint64_t)a3 options:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F8BD000, a1, a3, "parameter ‘options’ must be nonnull", a5, a6, a7, a8, 0);
}

+ (void)contactsWithData:(uint64_t)a3 options:(uint64_t)a4 error:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F8BD000, a1, a3, "parameter ‘data’ must be nonnull", a5, a6, a7, a8, 0);
}

@end
