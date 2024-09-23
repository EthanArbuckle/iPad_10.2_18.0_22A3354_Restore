@implementation HFCharacteristicValueEventBuilder

- (HFCharacteristicValueEventBuilder)initWithEvent:(id)a3
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  HFCharacteristicValueEventBuilder *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicEventBuilder.m"), 153, CFSTR("Event must be characteristic event: %@"), v5);

    v9 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HFCharacteristicValueEventBuilder;
    v6 = -[HFCharacteristicEventBuilder _initWithEvent:](&v12, sel__initWithEvent_, v5);
    if (v6)
    {
      objc_msgSend(v5, "triggerValue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v6[3];
      v6[3] = v7;

    }
    self = v6;
    v9 = self;
  }

  return v9;
}

- (HFCharacteristicValueEventBuilder)initWithCharacteristic:(id)a3 triggerValue:(id)a4
{
  id v7;
  id *v8;
  HFCharacteristicValueEventBuilder *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFCharacteristicValueEventBuilder;
  v8 = -[HFCharacteristicEventBuilder _initWithCharacteristic:](&v11, sel__initWithCharacteristic_, a3);
  v9 = (HFCharacteristicValueEventBuilder *)v8;
  if (v8)
    objc_storeStrong(v8 + 3, a4);

  return v9;
}

- (id)comparisonKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)HFCharacteristicValueEventBuilder;
  -[HFEventBuilder comparisonKey](&v10, sel_comparisonKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicEventBuilder characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueEventBuilder triggerValue](self, "triggerValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@:%@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)triggeringValues
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFCharacteristicValueEventBuilder triggerValue](self, "triggerValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[HFCharacteristicValueEventBuilder triggerValue](self, "triggerValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (void)copyValuesFromCharacteristicEventBuilder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFCharacteristicValueEventBuilder;
  -[HFCharacteristicEventBuilder copyValuesFromCharacteristicEventBuilder:](&v9, sel_copyValuesFromCharacteristicEventBuilder_, v4);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "triggerValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueEventBuilder setTriggerValue:](self, "setTriggerValue:", v8);

  }
}

- (id)buildNewEventsFromCurrentState
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_alloc(MEMORY[0x1E0CBA468]);
  -[HFCharacteristicEventBuilder characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueEventBuilder triggerValue](self, "triggerValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithCharacteristic:triggerValue:", v5, v6);
  objc_msgSend(v3, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CBA4D0];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  -[HFCharacteristicEventBuilder characteristic](self, "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicValueEventBuilder triggerValue](self, "triggerValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_naturalLanguageNameWithOptions:characteristics:triggerValue:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HFCharacteristicValueEventBuilder *v5;
  HFCharacteristicValueEventBuilder *v6;
  HFCharacteristicValueEventBuilder *v7;
  char v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  v5 = (HFCharacteristicValueEventBuilder *)v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v5 == self)
  {
    v8 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HFCharacteristicValueEventBuilder;
    v8 = 0;
    if (-[HFCharacteristicEventBuilder isEqual:](&v12, sel_isEqual_, v5) && v7)
    {
      -[HFCharacteristicValueEventBuilder triggerValue](self, "triggerValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicValueEventBuilder triggerValue](v7, "triggerValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "isEqual:", v10);

    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFCharacteristicValueEventBuilder;
  v3 = -[HFCharacteristicEventBuilder hash](&v7, sel_hash);
  -[HFCharacteristicValueEventBuilder triggerValue](self, "triggerValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSCopying)triggerValue
{
  return self->_triggerValue;
}

- (void)setTriggerValue:(id)a3
{
  objc_storeStrong((id *)&self->_triggerValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerValue, 0);
}

- (id)compareToObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFCharacteristicValueEventBuilder;
  -[HFEventBuilder compareToObject:](&v13, sel_compareToObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsCriticalDifference") & 1) == 0)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__HFCharacteristicValueEventBuilder_Comparison__compareToObject___block_invoke;
    v11[3] = &unk_1EA72C9C0;
    v11[4] = self;
    v7 = v4;
    v12 = v7;

    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __65__HFCharacteristicValueEventBuilder_Comparison__compareToObject___block_invoke_2;
    v9[3] = &unk_1EA72C9C0;
    v9[4] = self;
    v10 = v7;

  }
  return v5;
}

uint64_t __65__HFCharacteristicValueEventBuilder_Comparison__compareToObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3) ^ 1;

  return v4;
}

uint64_t __65__HFCharacteristicValueEventBuilder_Comparison__compareToObject___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "triggerValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "triggerValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3) ^ 1;

  return v4;
}

@end
