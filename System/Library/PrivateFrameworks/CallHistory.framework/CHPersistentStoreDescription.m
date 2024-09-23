@implementation CHPersistentStoreDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPersistentStoreDescription, 0);
}

+ (id)persistentStoreDescriptionWithURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___CHPersistentStoreDescription;
  objc_msgSendSuper2(&v15, sel_persistentStoreDescriptionWithURL_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOption:forKey:", v5, *MEMORY[0x1E0C97918]);

  objc_msgSend(v3, "setValue:forPragmaNamed:", CFSTR("1"), CFSTR("secure_delete"));
  +[CHProcessHandle processHandle](CHProcessHandle, "processHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasAppProtectionReadEntitlement") & 1) == 0)
  {
    ch_security_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      +[CHPersistentStoreDescription persistentStoreDescriptionWithURL:].cold.2(v7);

  }
  if (objc_msgSend(v6, "hasDataStoreReadWriteEntitlement"))
  {
    v8 = *MEMORY[0x1E0C97998];
    v9 = MEMORY[0x1E0C9AAA0];
  }
  else
  {
    v10 = objc_msgSend(v6, "hasDataStoreReadOnlyEntitlement");
    v8 = *MEMORY[0x1E0C97998];
    if (!v10)
      goto LABEL_10;
    v9 = MEMORY[0x1E0C9AAB0];
  }
  objc_msgSend(v3, "setOption:forKey:", v9, v8);
LABEL_10:
  objc_msgSend(v3, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    ch_security_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      +[CHPersistentStoreDescription persistentStoreDescriptionWithURL:].cold.1(v13);

  }
  return v3;
}

- (CHPersistentStoreDescription)defaultPersistentStoreDescription
{
  return (CHPersistentStoreDescription *)objc_getProperty(self, a2, 40, 1);
}

+ (void)persistentStoreDescriptionWithURL:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  __CFString *v2;
  __int16 v3;
  __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 138412546;
  v2 = CFSTR("com.apple.private.CallHistory.read");
  v3 = 2112;
  v4 = CFSTR("com.apple.private.CallHistory.read-write");
  _os_log_fault_impl(&dword_1B3FA4000, log, OS_LOG_TYPE_FAULT, "Call History access requires BOOLean entitlement %@ or %@. This will be a hard error in the future.", (uint8_t *)&v1, 0x16u);
}

+ (void)persistentStoreDescriptionWithURL:(os_log_t)log .cold.2(os_log_t log)
{
  int v1;
  __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = CFSTR("com.apple.appprotectiond.read.access");
  _os_log_fault_impl(&dword_1B3FA4000, log, OS_LOG_TYPE_FAULT, "Call History access now requires App Protection Entitlement %@", (uint8_t *)&v1, 0xCu);
}

@end
