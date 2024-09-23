@implementation DOCOpenLocationIntent

+ (id)intentFromActivity:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject **v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  objc_msgSend(v3, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", v6))
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  INTypedIntentWithIntent();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (NSObject **)MEMORY[0x24BE2DF90];
    v11 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[DOCOpenLocationIntent(DOCOpenLocationIntentExtensions) intentFromActivity:].cold.1((uint64_t)v3, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

+ (id)intentFromGenericIntent:(id)a3
{
  id v3;
  void *v4;
  NSObject **v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  INTypedIntentWithIntent();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (NSObject **)MEMORY[0x24BE2DF90];
    v6 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[DOCOpenLocationIntent(DOCOpenLocationIntentExtensions) intentFromGenericIntent:].cold.1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
  }

  return v4;
}

@end
