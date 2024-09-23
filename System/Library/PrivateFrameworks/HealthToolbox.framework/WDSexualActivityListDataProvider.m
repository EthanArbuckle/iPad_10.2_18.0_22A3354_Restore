@implementation WDSexualActivityListDataProvider

- (id)sampleTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A08]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textForObject:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  objc_msgSend(a3, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD31F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "BOOLValue");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 & 1) != 0)
      v8 = CFSTR("PROTECTION_USED");
    else
      v8 = CFSTR("PROTECTION_NOT_USED");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HKLocalizedNoDataString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end
