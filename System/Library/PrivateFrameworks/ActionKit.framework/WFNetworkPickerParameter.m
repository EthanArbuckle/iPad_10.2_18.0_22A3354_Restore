@implementation WFNetworkPickerParameter

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v11[0] = CFSTR("Wi-Fi");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "capabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "containsObject:", *MEMORY[0x24BEC1848]))
    {
      objc_msgSend(v4, "arrayByAddingObject:", CFSTR("Cellular"));
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_39807);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_possibleStates;
    self->_possibleStates = v8;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Wi-Fi")) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedWiFiDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("Cellular"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)defaultSerializedRepresentation
{
  return (id)objc_msgSend(MEMORY[0x24BEC40C8], "serializedRepresentationFromValue:", CFSTR("Wi-Fi"));
}

- (id)possibleStatesForLocalization
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC40C8]), "initWithValue:", CFSTR("Wi-Fi"));
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC40C8]), "initWithValue:", CFSTR("Cellular"));
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __42__WFNetworkPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

@end
