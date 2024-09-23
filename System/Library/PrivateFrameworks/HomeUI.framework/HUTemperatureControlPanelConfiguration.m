@implementation HUTemperatureControlPanelConfiguration

+ (id)_temperatureFormatter
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D313F0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temperatureFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HUControlPanelRule)rule
{
  void *v2;

  +[HUControlPanelFilterRule ruleWithFilter:](HUControlPanelFilterRule, "ruleWithFilter:", &__block_literal_global_148_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPriority:", 100.0);
  return (HUControlPanelRule *)v2;
}

uint64_t __46__HUTemperatureControlPanelConfiguration_rule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "controlItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    objc_msgSend(v2, "controlItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "incrementalCharacteristicType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB8B08]);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
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
  HUStepperControlView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v8 = v5;
  v29 = v8;
  if (!v8)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v29;
  else
    v9 = 0;
  v10 = v9;
  v8 = v29;
  v11 = v29;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class());

    v8 = v29;
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

  v21 = objc_alloc_init(HUStepperControlView);
  objc_msgSend(v6, "identifierForControlItem:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView setIdentifier:](v21, "setIdentifier:", v22);

  objc_msgSend(v18, "minValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  -[HUStepperControlView setMinValue:](v21, "setMinValue:");

  objc_msgSend(v18, "maxValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  -[HUStepperControlView setMaxValue:](v21, "setMaxValue:");

  objc_msgSend(v18, "stepValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  -[HUStepperControlView setStepValue:](v21, "setStepValue:");

  objc_msgSend((id)objc_opt_class(), "_temperatureFormatter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView setValueFormatter:](v21, "setValueFormatter:", v26);

  objc_msgSend(v11, "setControlView:", v21);
  objc_msgSend(v6, "latestResults");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setControlTitle:", v28);

}

- (BOOL)shouldShowSectionTitleForItem:(id)a3
{
  return 0;
}

@end
