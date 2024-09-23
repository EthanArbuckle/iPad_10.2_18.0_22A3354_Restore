@implementation WFHealthCategoryAdditionalPickerParameter

- (void)setCategoryType:(id)a3
{
  objc_storeStrong((id *)&self->_categoryType, a3);
  -[WFHealthCategoryAdditionalPickerParameter updatePossibleStates](self, "updatePossibleStates");
}

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    -[WFHealthCategoryAdditionalPickerParameter categoryType](self, "categoryType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD2998]);

    if (v6)
    {
      +[WFHealthKitHelper readableMenstrualFlowIsStartOfCycleValues](WFHealthKitHelper, "readableMenstrualFlowIsStartOfCycleValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v7, "if_compactMap:", &__block_literal_global_38725);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_possibleStates;
    self->_possibleStates = v8;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("Start of Cycle"), CFSTR("Start of Cycle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "sampleTypeIdentifierFromReadableTypeIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "hk_localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedParameterValue(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)updatePossibleStates
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFHealthCategoryAdditionalPickerParameter;
  -[WFHealthCategoryAdditionalPickerParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
}

- (BOOL)isHidden
{
  void *v2;
  BOOL v3;

  -[WFHealthCategoryAdditionalPickerParameter possibleStates](self, "possibleStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (HKCategoryType)categoryType
{
  return self->_categoryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __59__WFHealthCategoryAdditionalPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
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
