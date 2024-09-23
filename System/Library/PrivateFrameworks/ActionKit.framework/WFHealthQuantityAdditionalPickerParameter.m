@implementation WFHealthQuantityAdditionalPickerParameter

- (void)setQuantityType:(id)a3
{
  objc_storeStrong((id *)&self->_quantityType, a3);
  -[WFHealthQuantityAdditionalPickerParameter updatePossibleStates](self, "updatePossibleStates");
}

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSArray *v14;
  NSArray *v15;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    -[WFHealthQuantityAdditionalPickerParameter quantityType](self, "quantityType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD35E0]);

    if (v6)
    {
      +[WFHealthKitHelper readableInsulinDeliveryReasonValues](WFHealthKitHelper, "readableInsulinDeliveryReasonValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD36A0]);

    if (v9)
    {
      +[WFHealthKitHelper readableVO2MaxTestTypeValues](WFHealthKitHelper, "readableVO2MaxTestTypeValues");
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD3398]);

    if (v12)
    {
      +[WFHealthKitHelper readableBloodGlucoseMealTimeValues](WFHealthKitHelper, "readableBloodGlucoseMealTimeValues");
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
    }
    objc_msgSend(v7, "if_compactMap:", &__block_literal_global_8790);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v15 = self->_possibleStates;
    self->_possibleStates = v14;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFHealthQuantityAdditionalPickerParameter quantityType](self, "quantityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD3398]);

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BEC40C8];
    WFLocalizedParameterValueMarker(CFSTR("Unspecified"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serializedRepresentationFromValue:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
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
  v4.super_class = (Class)WFHealthQuantityAdditionalPickerParameter;
  -[WFHealthQuantityAdditionalPickerParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
}

- (BOOL)isHidden
{
  void *v2;
  BOOL v3;

  -[WFHealthQuantityAdditionalPickerParameter possibleStates](self, "possibleStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)localizedLabelWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  -[WFHealthQuantityAdditionalPickerParameter quantityType](self, "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD35E0]);

  if (v7)
  {
    v8 = CFSTR("Reason");
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD36A0]);

    if (v10)
    {
      v8 = CFSTR("Test Type");
    }
    else
    {
      objc_msgSend(v5, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD3398]);

      if (!v12)
      {
        v16.receiver = self;
        v16.super_class = (Class)WFHealthQuantityAdditionalPickerParameter;
        -[WFHealthQuantityAdditionalPickerParameter localizedLabelWithContext:](&v16, sel_localizedLabelWithContext_, v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v8 = CFSTR("Meal Time");
    }
  }
  WFLocalizedStringResourceWithKey(v8, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localize:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v14;
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

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v5);
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

- (id)importQuestionBehavior
{
  return (id)*MEMORY[0x24BEC4568];
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __59__WFHealthQuantityAdditionalPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
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
