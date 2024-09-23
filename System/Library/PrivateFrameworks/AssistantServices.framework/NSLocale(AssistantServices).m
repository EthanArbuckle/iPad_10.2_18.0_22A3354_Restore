@implementation NSLocale(AssistantServices)

- (id)af_aceTemperatureUnit
{
  void *v2;
  char v3;
  id *v4;
  id *v5;
  id v6;
  id *v7;
  void *v8;
  int v9;
  id *v10;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0C99828]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C99830]);
  v4 = (id *)MEMORY[0x1E0D88618];
  v5 = (id *)MEMORY[0x1E0D88618];
  if ((v3 & 1) != 0)
  {
LABEL_4:
    v6 = *v5;
    if (v6)
      goto LABEL_9;
    goto LABEL_5;
  }
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C99838]))
  {
    v5 = (id *)MEMORY[0x1E0D88620];
    goto LABEL_4;
  }
LABEL_5:
  v7 = (id *)MEMORY[0x1E0D88620];
  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0C99840]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
    v10 = v4;
  else
    v10 = v7;
  v6 = *v10;
LABEL_9:

  return v6;
}

+ (id)af_temperatureUnitForAceTemperatureUnit:()AssistantServices
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D88618]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0C99830];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D88620]))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = (id *)MEMORY[0x1E0C99838];
  }
  v5 = *v4;
LABEL_7:

  return v5;
}

+ (void)af_setAceTemperatureUnit:()AssistantServices
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "af_temperatureUnitForAceTemperatureUnit:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(a1, "_setPreferredTemperatureUnit:", v2);
    v2 = v3;
  }

}

@end
