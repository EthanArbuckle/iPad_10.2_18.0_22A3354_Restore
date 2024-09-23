@implementation WFQuantityTypePickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (NSArray)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[5];

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    WFHealthKitSampleTypeIdentifiers();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_2451);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__WFQuantityTypePickerParameter_possibleStates__block_invoke_2;
    v9[3] = &unk_24F8B0558;
    v9[4] = self;
    objc_msgSend(v5, "sortedArrayUsingComparator:", v9);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_possibleStates;
    self->_possibleStates = v6;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD33A8]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD33A0]))
  {
    WFLocalizedString(CFSTR("Blood Pressure"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "hk_localizedName");
      else
        +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:](WFHealthKitHelper, "readableSampleTypeIdentifierFromSampleTypeIdentifier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "hk_localizedName");
      else
        +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:](WFHealthKitHelper, "readableSampleTypeIdentifierFromSampleTypeIdentifier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (id)accessoryImageForPossibleState:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v4 = (void *)getHKDisplayTypeControllerClass_softClass;
  v24 = getHKDisplayTypeControllerClass_softClass;
  if (!getHKDisplayTypeControllerClass_softClass)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __getHKDisplayTypeControllerClass_block_invoke;
    v20[3] = &unk_24F8BB430;
    v20[4] = &v21;
    __getHKDisplayTypeControllerClass_block_invoke((uint64_t)v20);
    v4 = (void *)v22[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(MEMORY[0x24BDD3C40], "wf_shortcutsAppHealthStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedInstanceForHealthStore:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayTypeForObjectTypeUnifyingBloodPressureTypes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BEC1398]);
  objc_msgSend(v9, "displayCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithPlatformColor:", v12);

  v14 = objc_alloc(MEMORY[0x24BEC14E0]);
  objc_msgSend(v9, "listIcon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithPlatformImage:", v15);
  objc_msgSend(v16, "imageWithRenderingMode:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageWithTintColor:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

uint64_t __47__WFQuantityTypePickerParameter_possibleStates__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "localizedLabelForPossibleState:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedLabelForPossibleState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "localizedStandardCompare:", v8);
  return v9;
}

WFHKSampleTypeSubstitutableState *__47__WFQuantityTypePickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFHKSampleTypeSubstitutableState *v3;
  void *v4;
  void *v5;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD33A0]) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD3DC0], "_typeWithIdentifier:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "sharingAuthorizationAllowed")
      && ((objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v2),
           (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
       || (objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", v2),
           (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
    {
      v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFHKSampleTypeSubstitutableState alloc], "initWithValue:", v5);

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

@end
