@implementation WFSetWiFiAction

- (id)appResource
{
  return 0;
}

- (id)localizedNameWithContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BEC1440];
  v4 = a3;
  objc_msgSend(v3, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCapability:", *MEMORY[0x24BEC1888]);

  if (v6)
    v7 = CFSTR("Set WLAN");
  else
    v7 = CFSTR("Set Wi-Fi");
  WFLocalizedStringResourceWithKey(v7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localize:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BEC1440];
  v4 = a3;
  objc_msgSend(v3, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCapability:", *MEMORY[0x24BEC1888]);

  if (v6)
    v7 = CFSTR("Sets the device’s WLAN to on or off.");
  else
    v7 = CFSTR("Sets the device’s Wi-Fi to on or off.");
  WFLocalizedStringResourceWithKey(v7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localize:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedAttributionWithContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BEC1440];
  v4 = a3;
  objc_msgSend(v3, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCapability:", *MEMORY[0x24BEC1888]);

  if (v6)
  {
    v7 = CFSTR("WLAN");
    v8 = CFSTR("WLAN");
  }
  else
  {
    v7 = CFSTR("Wi-Fi (Action)");
    v8 = CFSTR("Wi-Fi");
  }
  WFLocalizedStringResourceWithKey(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localize:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)parameterSummary
{
  void *v2;
  int v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCapability:", *MEMORY[0x24BEC1888]);

  v4 = objc_alloc(MEMORY[0x24BEC3A50]);
  v5 = objc_alloc(MEMORY[0x24BEC3A58]);
  if (v3)
  {
    WFLocalizedStringResourceWithKey(CFSTR("${operation} WLAN ${OnValue}"), CFSTR("${operation} WLAN ${OnValue}"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithKey:summaryString:", CFSTR("OnValue,operation"), v6);
    v17[0] = v7;
    v8 = objc_alloc(MEMORY[0x24BEC3A58]);
    WFLocalizedStringResourceWithKey(CFSTR("${operation} WLAN"), CFSTR("${operation} WLAN"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithKey:summaryString:", CFSTR("operation"), v9);
    v17[1] = v10;
    v11 = v17;
  }
  else
  {
    WFLocalizedStringResourceWithKey(CFSTR("${operation} Wi-Fi ${OnValue}"), CFSTR("${operation} Wi-Fi ${OnValue}"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithKey:summaryString:", CFSTR("OnValue,operation"), v6);
    v16[0] = v7;
    v12 = objc_alloc(MEMORY[0x24BEC3A58]);
    WFLocalizedStringResourceWithKey(CFSTR("${operation} Wi-Fi"), CFSTR("${operation} Wi-Fi"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v12, "initWithKey:summaryString:", CFSTR("operation"), v9);
    v16[1] = v10;
    v11 = v16;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "initWithValues:", v13);

  return v14;
}

@end
