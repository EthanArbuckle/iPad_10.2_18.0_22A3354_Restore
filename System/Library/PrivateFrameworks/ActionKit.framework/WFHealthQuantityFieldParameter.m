@implementation WFHealthQuantityFieldParameter

- (void)setAction:(id)a3
{
  WFAction **p_action;
  id WeakRetained;
  id v6;
  id obj;

  p_action = &self->_action;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_action);
  objc_msgSend(WeakRetained, "removeEventObserver:", self);

  v6 = objc_storeWeak((id *)p_action, obj);
  objc_msgSend(obj, "addEventObserver:", self);

  -[WFHealthQuantityFieldParameter attributesDidChange](self, "attributesDidChange");
  -[WFHealthQuantityFieldParameter updatePossibleUnits](self, "updatePossibleUnits");

}

- (void)wasAddedToWorkflow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFHealthQuantityFieldParameter;
  -[WFHealthQuantityFieldParameter wasAddedToWorkflow](&v4, sel_wasAddedToWorkflow);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_updatePossibleUnits, *MEMORY[0x24BDD3838], 0);

}

- (void)wasRemovedFromWorkflow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFHealthQuantityFieldParameter;
  -[WFHealthQuantityFieldParameter wasRemovedFromWorkflow](&v4, sel_wasRemovedFromWorkflow);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDD3838], 0);

}

- (HKQuantityType)quantityType
{
  HKQuantityType *quantityType;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  HKQuantityType *v9;
  HKQuantityType *v10;
  void *v11;
  void *v12;
  void *v13;
  HKQuantityType *v14;
  HKQuantityType *v15;

  quantityType = self->_quantityType;
  if (!quantityType)
  {
    -[WFHealthQuantityFieldParameter action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHealthQuantityFieldParameter definition](self, "definition");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "objectForKey:", CFSTR("QuantityTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterStateForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v5) = objc_opt_isKindOfClass();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v7, "value");
      v9 = (HKQuantityType *)objc_claimAutoreleasedReturnValue();
      v10 = self->_quantityType;
      self->_quantityType = v9;

    }
    quantityType = self->_quantityType;
    if (!quantityType)
    {
      -[WFHealthQuantityFieldParameter definition](self, "definition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("QuantityType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "sampleTypeIdentifierFromReadableTypeIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v13);
      v14 = (HKQuantityType *)objc_claimAutoreleasedReturnValue();
      v15 = self->_quantityType;
      self->_quantityType = v14;

      quantityType = self->_quantityType;
    }
  }
  return quantityType;
}

- (void)updatePossibleUnits
{
  void *v3;
  void *v4;
  NSArray *possibleUnits;
  _QWORD v6[4];
  id v7;
  WFHealthQuantityFieldParameter *v8;

  -[WFHealthQuantityFieldParameter quantityType](self, "quantityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__WFHealthQuantityFieldParameter_updatePossibleUnits__block_invoke;
    v6[3] = &unk_24F8BA8A0;
    v7 = v3;
    v8 = self;
    +[WFHealthKitHelper validUnitsForQuantityType:completion:](WFHealthKitHelper, "validUnitsForQuantityType:completion:", v7, v6);

  }
  else
  {
    possibleUnits = self->_possibleUnits;
    self->_possibleUnits = 0;

    -[WFHealthQuantityFieldParameter attributesDidChange](self, "attributesDidChange");
  }

}

- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD4048], "wf_safeUnitFromString:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHealthQuantityFieldParameter quantityType](self, "quantityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFHealthKitHelper localizedDisplayNameForUnit:quantityTypeIdentifier:](WFHealthKitHelper, "localizedDisplayNameForUnit:quantityTypeIdentifier:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)attributesDidChange
{
  HKQuantityType *quantityType;
  objc_super v4;

  quantityType = self->_quantityType;
  self->_quantityType = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFHealthQuantityFieldParameter;
  -[WFHealthQuantityFieldParameter attributesDidChange](&v4, sel_attributesDidChange);
}

- (id)localizedLabelWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  -[WFHealthQuantityFieldParameter quantityType](self, "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD33A8]))
  {

  }
  else
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD33A0]);

    if (!v8)
    {
      v12.receiver = self;
      v12.super_class = (Class)WFHealthQuantityFieldParameter;
      -[WFHealthQuantityFieldParameter localizedLabelWithContext:](&v12, sel_localizedLabelWithContext_, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  WFLocalizedStringResourceWithKey(CFSTR("Systolic"), CFSTR("Systolic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localize:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v10;
}

- (id)localizedPrompt
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFHealthQuantityFieldParameter quantityType](self, "quantityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "hk_localizedName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:](WFHealthKitHelper, "readableSampleTypeIdentifierFromSampleTypeIdentifier:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("What’s the value for %@?"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isHidden
{
  void *v2;
  BOOL v3;

  -[WFHealthQuantityFieldParameter quantityType](self, "quantityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a4;
  -[WFHealthQuantityFieldParameter definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("QuantityTypeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    -[WFHealthQuantityFieldParameter attributesDidChange](self, "attributesDidChange");
    -[WFHealthQuantityFieldParameter updatePossibleUnits](self, "updatePossibleUnits");
  }
}

- (id)possibleUnits
{
  return self->_possibleUnits;
}

- (void)setPossibleUnits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_possibleUnits, 0);
}

void __53__WFHealthQuantityFieldParameter_updatePossibleUnits__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__WFHealthQuantityFieldParameter_updatePossibleUnits__block_invoke_2;
  block[3] = &unk_24F8BB0A0;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __53__WFHealthQuantityFieldParameter_updatePossibleUnits__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "quantityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "if_map:", &__block_literal_global_46326);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 184);
    *(_QWORD *)(v5 + 184) = v4;

    objc_msgSend(*(id *)(a1 + 40), "attributesDidChange");
  }
}

uint64_t __53__WFHealthQuantityFieldParameter_updatePossibleUnits__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unitString");
}

@end
