@implementation HUDurationWheelControlPanelConfiguration

- (HUControlPanelRule)rule
{
  void *v2;

  +[HUControlPanelFilterRule ruleWithFilter:](HUControlPanelFilterRule, "ruleWithFilter:", &__block_literal_global_157);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPriority:", 100.0);
  return (HUControlPanelRule *)v2;
}

uint64_t __48__HUDurationWheelControlPanelConfiguration_rule__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "controlItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "incrementalCharacteristicType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8A28]);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)setupControlsForCell:(id)a3 item:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HUWheelControlView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v8 = v5;
  v38 = v8;
  if (!v8)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v38;
  else
    v9 = 0;
  v10 = v9;
  v8 = v38;
  v11 = v38;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class());

    v8 = v38;
LABEL_7:
    v11 = 0;
  }

  v14 = objc_opt_class();
  objc_msgSend(v6, "controlItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyObject");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v16;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v14, objc_opt_class());

    goto LABEL_14;
  }
LABEL_15:

  v21 = (void *)MEMORY[0x1E0CB3658];
  objc_msgSend(v18, "incrementalCharacteristicType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "incrementalCharacteristicType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "metadataForCharacteristicType:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hf_valueFormatterForCharacteristicType:withMetadata:options:", v22, v25, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc_init(HUWheelControlView);
  objc_msgSend(v6, "identifierForControlItem:", v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlView setIdentifier:](v27, "setIdentifier:", v28);

  v29 = (void *)objc_opt_class();
  objc_msgSend(v18, "minValue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "maxValue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stepValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_valuesBetweenMinValue:maxValue:stepValue:", v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlView setValues:](v27, "setValues:", v33);

  -[HUWheelControlView setValueFormatter:](v27, "setValueFormatter:", v26);
  -[HUWheelControlView setCanBeHighlighted:](v27, "setCanBeHighlighted:", 1);
  v34 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v18, "latestResults");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "na_setWithSafeObject:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlView setCustomValues:](v27, "setCustomValues:", v37);

  objc_msgSend(v11, "setControlView:", v27);
}

- (BOOL)shouldShowSectionTitleForItem:(id)a3
{
  return 1;
}

- (BOOL)shouldShowSectionFooterForItem:(id)a3
{
  return 1;
}

- (id)sectionTitleForItem:(id)a3 forSourceItem:(id)a4
{
  return _HULocalizedStringWithDefaultValue(CFSTR("HUControlPanelSectionTitleSetDuration"), CFSTR("HUControlPanelSectionTitleSetDuration"), 1);
}

- (id)sectionFooterForItem:(id)a3 forSourceItem:(id)a4
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  objc_msgSend(a4, "service", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceSubtype");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9978]) & 1) != 0)
  {
    v6 = CFSTR("HUControlPanelSectionFooterSetDurationIrrigation");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9980]) & 1) != 0)
  {
    v6 = CFSTR("HUControlPanelSectionFooterSetDurationShower");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9990]) & 1) != 0)
  {
    v6 = CFSTR("HUControlPanelSectionFooterSetDurationFaucet");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9970]))
    {
      v7 = 0;
      goto LABEL_10;
    }
    v6 = CFSTR("HUControlPanelSectionFooterSetDurationGeneric");
  }
  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v7;
}

- (id)_characteristicTypesFromControlPanelItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = a3;
  objc_msgSend(v3, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__HUDurationWheelControlPanelConfiguration__characteristicTypesFromControlPanelItem___block_invoke;
  v9[3] = &unk_1E6F57A40;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "na_each:", v9);

  return v7;
}

void __85__HUDurationWheelControlPanelConfiguration__characteristicTypesFromControlPanelItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCharacteristicTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

+ (id)_valuesBetweenMinValue:(id)a3 maxValue:(id)a4 stepValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  v11 = objc_msgSend(v8, "unsignedIntegerValue");
  v12 = v11 - objc_msgSend(v7, "unsignedIntegerValue");
  if (v12 <= 0x12B)
    v13 = (unsigned __int16)v12 / 5u / v10 * v10;
  else
    v13 = 300;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_largerNumber:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_largerNumber:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  v20 = objc_msgSend(v8, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  while (v19 <= v20)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v22);

    v19 += v16;
  }

  return v21;
}

@end
