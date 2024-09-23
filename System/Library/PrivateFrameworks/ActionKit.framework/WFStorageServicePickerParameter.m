@implementation WFStorageServicePickerParameter

+ (id)referencedActionResourceClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

- (void)setActionResources:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315906;
      v11 = "WFEnforceClass";
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v5;
      v9 = v15;
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v10, 0x2Au);

    }
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  -[WFStorageServicePickerParameter setICloudDriveAccessResource:](self, "setICloudDriveAccessResource:", v7);
}

- (id)accessoryImageForPossibleState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BEC14E0];
  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workflowKitImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithRenderingMode:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isHidden
{
  void *v2;
  BOOL v3;

  -[WFStorageServicePickerParameter possibleStates](self, "possibleStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") < 2;

  return v3;
}

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    +[WFStorageServiceRegistry sharedRegistry](WFStorageServiceRegistry, "sharedRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storageServices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_map:", &__block_literal_global_26452);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_possibleStates;
    self->_possibleStates = v6;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)defaultSupportedVariableTypes
{
  return 0;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)objc_msgSend(a3, "value");
}

- (id)defaultSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  -[WFStorageServicePickerParameter definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("AlwaysRequiresServiceResource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[WFStorageServicePickerParameter iCloudDriveAccessResource](self, "iCloudDriveAccessResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAvailable");

  if (v6)
  {
LABEL_5:
    v8 = (void *)MEMORY[0x24BEC40C8];
    +[WFDefaultFileStorageService serviceName](WFDefaultFileStorageService, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serializedRepresentationFromValue:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  v7 = 0;
  return v7;
}

- (WFiCloudDriveAccessResource)iCloudDriveAccessResource
{
  return self->_iCloudDriveAccessResource;
}

- (void)setICloudDriveAccessResource:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudDriveAccessResource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudDriveAccessResource, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __49__WFStorageServicePickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = (void *)objc_opt_class();

  objc_msgSend(v5, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithValue:", v6);

  return v7;
}

@end
