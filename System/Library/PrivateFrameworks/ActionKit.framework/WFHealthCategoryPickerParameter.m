@implementation WFHealthCategoryPickerParameter

- (void)setCategoryType:(id)a3
{
  objc_storeStrong((id *)&self->_categoryType, a3);
  -[WFHealthCategoryPickerParameter updatePossibleStates](self, "updatePossibleStates");
}

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSArray *v21;
  NSArray *v22;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    -[WFHealthCategoryPickerParameter categoryType](self, "categoryType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD2890]);

    if (v6)
    {
      +[WFHealthKitHelper readableCervicalMucusQualityValues](WFHealthKitHelper, "readableCervicalMucusQualityValues");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WFHealthCategoryPickerParameter categoryType](self, "categoryType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD2998]);

      if (v10)
      {
        +[WFHealthKitHelper readableMenstrualFlowValues](WFHealthKitHelper, "readableMenstrualFlowValues");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[WFHealthCategoryPickerParameter categoryType](self, "categoryType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD29C0]);

        if (v13)
        {
          +[WFHealthKitHelper readableOvulationTestResultValues](WFHealthKitHelper, "readableOvulationTestResultValues");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[WFHealthCategoryPickerParameter categoryType](self, "categoryType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDD2A28]);

          if (v16)
          {
            +[WFHealthKitHelper readableSleepAnalysisValues](WFHealthKitHelper, "readableSleepAnalysisValues");
            v7 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[WFHealthCategoryPickerParameter categoryType](self, "categoryType");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDD2A08]);

            if (!v19)
            {
              v20 = 0;
              goto LABEL_13;
            }
            +[WFHealthKitHelper readableSexualActivityValues](WFHealthKitHelper, "readableSexualActivityValues");
            v7 = objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
    v20 = (void *)v7;
LABEL_13:
    objc_msgSend(v20, "if_compactMap:", &__block_literal_global_35810);
    v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v22 = self->_possibleStates;
    self->_possibleStates = v21;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedParameterValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updatePossibleStates
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFHealthCategoryPickerParameter;
  -[WFHealthCategoryPickerParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
}

- (BOOL)isHidden
{
  void *v2;
  BOOL v3;

  -[WFHealthCategoryPickerParameter possibleStates](self, "possibleStates");
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

id __49__WFHealthCategoryPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
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
