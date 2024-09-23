@implementation SADistance(AssistantUIAdditions)

- (id)afui_abbreviatedUnit
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(a1, "unit");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE81B38]))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("FEET_ABBREVIATION");
LABEL_9:
    objc_msgSend(v2, "assistantUILocalizedStringForKey:table:", v4, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE81B50]))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("MILES_ABBREVIATION");
    goto LABEL_9;
  }
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE81B48]))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("METERS_ABBREVIATION");
    goto LABEL_9;
  }
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE81B40]))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("KILOMETERS_ABBREVIATION");
    goto LABEL_9;
  }
  v7 = *MEMORY[0x24BE08FB0];
  v5 = v1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    -[SADistance(AssistantUIAdditions) afui_abbreviatedUnit].cold.1((uint64_t)v1, v7, v8, v9, v10, v11, v12, v13);
    v5 = v1;
  }
LABEL_10:

  return v5;
}

- (id)afui_metersValue
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE81B40];
  v14[0] = *MEMORY[0x24BE81B38];
  v14[1] = v2;
  v15[0] = &unk_24D7B59C8;
  v15[1] = &unk_24D7B59D8;
  v3 = *MEMORY[0x24BE81B50];
  v14[2] = *MEMORY[0x24BE81B48];
  v14[3] = v3;
  v15[2] = &unk_24D7B59E8;
  v15[3] = &unk_24D7B59F8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(a1, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8 * v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (uint64_t)afui_compare:()AssistantUIAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "afui_metersValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "afui_metersValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)afui_abbreviatedUnit
{
  OUTLINED_FUNCTION_0_0(&dword_217514000, a2, a3, "%s Unknown distance unit %{public}@; returning full unit as abbreviation",
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_3();
}

@end
