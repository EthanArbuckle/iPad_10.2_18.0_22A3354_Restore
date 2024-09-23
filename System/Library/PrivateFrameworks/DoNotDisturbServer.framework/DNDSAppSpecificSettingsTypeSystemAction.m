@implementation DNDSAppSpecificSettingsTypeSystemAction

+ (NSString)appSpecificSettingsEntity
{
  return (NSString *)CFSTR("SystemAction");
}

+ (Class)appSpecificSettingsClass
{
  return NSClassFromString(CFSTR("DNDSystemAction"));
}

+ (id)appSpecificSettingsForManagedObject:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v28;
  id v29;
  id v30;

  v3 = a3;
  v4 = objc_msgSend(v3, "enabled");
  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = objc_opt_class();
  objc_msgSend(v3, "encodedAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v7, &v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v30;

  if (!v9)
  {
    objc_msgSend(v3, "encodedReverseAction");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v16 = (void *)MEMORY[0x1E0CB3710];
      v17 = objc_opt_class();
      objc_msgSend(v3, "encodedAction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      objc_msgSend(v16, "unarchivedObjectOfClass:fromData:error:", v17, v18, &v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v28;

      if (v14 && (v20 = DNDSLogSettings, os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR)))
      {
        +[DNDSAppSpecificSettingsTypeSystemAction appSpecificSettingsForManagedObject:].cold.1((uint64_t)v14, v20, v21, v22, v23, v24, v25, v26);
        if (v19)
          goto LABEL_9;
      }
      else if (v19)
      {
LABEL_9:
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D768]), "initWithAction:reverseAction:enabled:", v8, v19, v4);

        goto LABEL_12;
      }
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D768]), "initWithAction:enabled:", v8, v4);
    goto LABEL_12;
  }

  objc_msgSend(MEMORY[0x1E0CB3710], "setClass:forClassName:", objc_opt_class(), CFSTR("DNDSSystemAction"));
  v10 = (void *)MEMORY[0x1E0CB3710];
  v11 = objc_opt_class();
  objc_msgSend(v3, "encodedAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v10, "unarchivedObjectOfClass:fromData:error:", v11, v12, &v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v29;

  if (v14)
  {
    v15 = DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_FAULT))
      +[DNDSAppSpecificSettingsTypeSystemAction appSpecificSettingsForManagedObject:].cold.2((uint64_t)v14, v15);
  }
LABEL_12:

  return v13;
}

+ (void)completeManagedObject:(id)a3 forAppSpecificSettings:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v5 = a3;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a4, 1, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (v7)
  {
    v8 = DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
      +[DNDSAppSpecificSettingsTypeSystemAction completeManagedObject:forAppSpecificSettings:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  objc_msgSend(v5, "setEncodedAction:", v6);

}

+ (void)appSpecificSettingsForManagedObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Failed to unarchive settings: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)appSpecificSettingsForManagedObject:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1CB895000, a2, OS_LOG_TYPE_FAULT, "Failed to unarchive settings: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)completeManagedObject:(uint64_t)a3 forAppSpecificSettings:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Failed to archive settings: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
