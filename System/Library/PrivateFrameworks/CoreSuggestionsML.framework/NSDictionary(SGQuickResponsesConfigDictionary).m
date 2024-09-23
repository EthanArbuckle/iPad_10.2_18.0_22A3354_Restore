@implementation NSDictionary(SGQuickResponsesConfigDictionary)

- (id)objectAssertedForKey:()SGQuickResponsesConfigDictionary
{
  id v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: Object for key %@ not found in dictionary.", (uint8_t *)&v7, 0xCu);
  }

  return v5;
}

- (id)numberAssertedForKey:()SGQuickResponsesConfigDictionary
{
  id v4;
  void *v5;
  id v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: Object for key %@ is not a number.", (uint8_t *)&v8, 0xCu);
    }
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (id)stringAssertedForKey:()SGQuickResponsesConfigDictionary
{
  id v4;
  void *v5;
  id v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: Object for key %@ is not a string.", (uint8_t *)&v8, 0xCu);
    }
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (id)arrayAssertedForKey:()SGQuickResponsesConfigDictionary
{
  id v4;
  void *v5;
  id v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: Object for key %@ is not an array.", (uint8_t *)&v8, 0xCu);
    }
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (id)dictAssertedForKey:()SGQuickResponsesConfigDictionary
{
  id v4;
  void *v5;
  id v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: Object for key %@ is not a dictionary.", (uint8_t *)&v8, 0xCu);
    }
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

@end
