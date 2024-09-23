@implementation WFFocusModesPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFFocusModesPickerParameter)initWithDefinition:(id)a3
{
  WFFocusModesPickerParameter *v3;
  WFFocusModesPickerParameter *v4;
  WFFocusModesPickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFFocusModesPickerParameter;
  v3 = -[WFFocusModesPickerParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFDynamicEnumerationParameter setDataSource:](v3, "setDataSource:", v3);
    v5 = v4;
  }

  return v4;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "value", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEC3D40], "availableModes", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_13871);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC3D40], "defaultActivity", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDD9EC8]);
    objc_msgSend(v3, "activityIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activityDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithIdentifier:displayString:", v5, v6);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3DF8]), "initWithValue:", v7);
    objc_msgSend(v8, "serializedRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v12 = 136315138;
      v13 = "-[WFFocusModesPickerParameter defaultSerializedRepresentationForEnumeration:]";
      _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_FAULT, "%s Could not get defaultActivity from FocusModesManager.", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

id __60__WFFocusModesPickerParameter_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if ((objc_msgSend(v2, "isPlaceholder") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BDD9EC8]);
    objc_msgSend(v2, "activityIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "activityDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithIdentifier:displayString:", v5, v6);

    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3DF8]), "initWithValue:", v7);
  }

  return v3;
}

@end
