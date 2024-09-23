@implementation COCondition

- (COCondition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COCondition;
  return -[COCondition init](&v3, sel_init);
}

- (BOOL)active
{
  return 0;
}

- (BOOL)setUp
{
  return 0;
}

+ (id)description
{
  return CFSTR("Default COCondition description");
}

+ (id)profileFriendlyName
{
  return &stru_24E4716F0;
}

+ (id)info
{
  objc_class *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "description");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      +[COCondition info].cold.1((uint64_t)v4);
    v5 = &stru_24E4716F0;
  }
  v10[0] = v4;
  v9[0] = CFSTR("ConditionIdentifierName");
  v9[1] = CFSTR("ConditionUserFriendlyName");
  objc_msgSend(a1, "profileFriendlyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = CFSTR("ConditionDescription");
  v10[1] = v6;
  v10[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)getBoolProperty:(id)a3 fromDict:(id)a4 withDefault:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isNSNumber(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      a5 = objc_msgSend(v10, "BOOLValue");
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[COCondition getBoolProperty:fromDict:withDefault:].cold.2((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[COCondition getBoolProperty:fromDict:withDefault:].cold.1();
  }

  return a5;
}

- (BOOL)getBoolProperty:(id)a3 withDefault:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "infoDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = -[COCondition getBoolProperty:fromDict:withDefault:](self, "getBoolProperty:fromDict:withDefault:", v6, v9, v4);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[COCondition getBoolProperty:withDefault:].cold.1();
  }

  return v4;
}

- (id)getStringProperty:(id)a3 fromDict:(id)a4 withDefault:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v10;
    if (!v11)
    {
      v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      v12 = v9;
      if (v13)
      {
        -[COCondition getStringProperty:fromDict:withDefault:].cold.2((uint64_t)v7);
        v12 = v9;
      }
    }
    v14 = v12;

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[COCondition getBoolProperty:fromDict:withDefault:].cold.1();
    v14 = v9;
  }

  return v14;
}

- (id)getStringProperty:(id)a3 withDefault:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "infoDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[COCondition getStringProperty:fromDict:withDefault:](self, "getStringProperty:fromDict:withDefault:", v6, v10, v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[COCondition getBoolProperty:withDefault:].cold.1();
    v11 = v7;
  }

  return v11;
}

- (BOOL)persistsAfterReboot
{
  return -[COCondition getBoolProperty:withDefault:](self, "getBoolProperty:withDefault:", CFSTR("ConditionPersistsAfterReboot"), 1);
}

- (NSString)identifierName
{
  return (NSString *)-[COCondition getStringProperty:withDefault:](self, "getStringProperty:withDefault:", CFSTR("ConditionIdentifierName"), 0);
}

- (NSString)userFriendlyName
{
  return (NSString *)-[COCondition getStringProperty:withDefault:](self, "getStringProperty:withDefault:", CFSTR("ConditionUserFriendlyName"), 0);
}

- (BOOL)isDestructive
{
  return -[COCondition getBoolProperty:withDefault:](self, "getBoolProperty:withDefault:", CFSTR("ConditionIsDestructive"), 1);
}

- (BOOL)isInternalOnly
{
  return -[COCondition getBoolProperty:withDefault:](self, "getBoolProperty:withDefault:", CFSTR("ConditionIsInternalOnly"), 1);
}

- (BOOL)persistsAfterRebootFromDict:(id)a3
{
  return -[COCondition getBoolProperty:fromDict:withDefault:](self, "getBoolProperty:fromDict:withDefault:", CFSTR("ConditionPersistsAfterReboot"), a3, 1);
}

- (id)identifierNameFromDict:(id)a3
{
  return -[COCondition getStringProperty:fromDict:withDefault:](self, "getStringProperty:fromDict:withDefault:", CFSTR("ConditionIdentifierName"), a3, 0);
}

- (id)userFriendlyNameFromDict:(id)a3
{
  return -[COCondition getStringProperty:fromDict:withDefault:](self, "getStringProperty:fromDict:withDefault:", CFSTR("ConditionUserFriendlyName"), a3, 0);
}

- (BOOL)isDestructiveFromDict:(id)a3
{
  return -[COCondition getBoolProperty:fromDict:withDefault:](self, "getBoolProperty:fromDict:withDefault:", CFSTR("ConditionIsDestructive"), a3, 1);
}

- (BOOL)isInternalOnlyFromDict:(id)a3
{
  return -[COCondition getBoolProperty:fromDict:withDefault:](self, "getBoolProperty:fromDict:withDefault:", CFSTR("ConditionIsInternalOnly"), a3, 1);
}

- (NSArray)additionalArguments
{
  return self->_additionalArguments;
}

- (void)setAdditionalArguments:(id)a3
{
  objc_storeStrong((id *)&self->_additionalArguments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalArguments, 0);
}

+ (void)info
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_fault_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Missing description entry for %@. Please make sure you fill out all entries for your condition class. If you believe this to be an error, please file a radar to the Condition Inducers component", (uint8_t *)&v1, 0xCu);
}

- (void)getBoolProperty:fromDict:withDefault:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (void *)OUTLINED_FUNCTION_3_0();
  v1 = OUTLINED_FUNCTION_2_1(v0);
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "Failed to load info dictionary from %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)getBoolProperty:(uint64_t)a3 fromDict:(uint64_t)a4 withDefault:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Key %@ is not set or an unexpected type", a5, a6, a7, a8, 2u);
}

- (void)getBoolProperty:withDefault:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (void *)OUTLINED_FUNCTION_3_0();
  v1 = OUTLINED_FUNCTION_2_1(v0);
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "No info.plist bundle for %@?", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)getStringProperty:(uint64_t)a1 fromDict:withDefault:.cold.2(uint64_t a1)
{
  id v1;
  int v2;
  uint64_t v3;
  __int16 v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = (id)objc_opt_class();
  v1 = v5;
  _os_log_error_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Expected an NSString from info plist for string %@ but got %@", (uint8_t *)&v2, 0x16u);

  OUTLINED_FUNCTION_2();
}

@end
