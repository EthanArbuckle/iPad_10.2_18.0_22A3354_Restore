@implementation CWFNetworkProfile(Strings)

- (id)dictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isCaptiveStateDetermined"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("wifi_is_captive_state_determined"));

  if (objc_msgSend(a1, "isCaptiveStateDetermined"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isCaptive"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("wifi_is_captive"));

  }
  objc_msgSend(a1, "__descriptionForHiddenState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "__descriptionForHiddenState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v6, CFSTR("wifi_hidden_state"));

  }
  objc_msgSend(a1, "__descriptionForLowDataMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "__descriptionForLowDataMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v8, CFSTR("wifi_low_data_mode"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isPersonalHotspot"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v9, CFSTR("wifi_is_personal_hotspot"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (const)__descriptionForHiddenState
{
  uint64_t v1;
  const __CFString *v2;

  v1 = objc_msgSend(a1, "hiddenState");
  v2 = CFSTR("None");
  if (v1 == 2)
    v2 = CFSTR("Broadcast");
  if (v1 == 1)
    return CFSTR("Hidden");
  else
    return v2;
}

- (const)__descriptionForLowDataMode
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "lowDataMode");
  if (v1 > 3)
    return CFSTR("Unknown");
  else
    return off_24C990F28[v1];
}

@end
