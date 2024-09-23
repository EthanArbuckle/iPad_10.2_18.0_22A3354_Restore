@implementation HFCharacteristicThresholdRangeEventBuilder

- (HFCharacteristicThresholdRangeEventBuilder)initWithEvent:(id)a3
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  HFCharacteristicThresholdRangeEventBuilder *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicEventBuilder.m"), 241, CFSTR("Event must be characteristic threshold range event: %@"), v5);

    v9 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
    v6 = -[HFCharacteristicEventBuilder _initWithEvent:](&v12, sel__initWithEvent_, v5);
    if (v6)
    {
      objc_msgSend(v5, "thresholdRange");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v6[3];
      v6[3] = v7;

    }
    self = v6;
    v9 = self;
  }

  return v9;
}

- (HFCharacteristicThresholdRangeEventBuilder)initWithCharacteristic:(id)a3 thresholdRange:(id)a4
{
  id v7;
  id *v8;
  HFCharacteristicThresholdRangeEventBuilder *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
  v8 = -[HFCharacteristicEventBuilder _initWithCharacteristic:](&v11, sel__initWithCharacteristic_, a3);
  v9 = (HFCharacteristicThresholdRangeEventBuilder *)v8;
  if (v8)
    objc_storeStrong(v8 + 3, a4);

  return v9;
}

- (BOOL)hf_wouldFireForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[HFCharacteristicThresholdRangeEventBuilder thresholdRange](self, "thresholdRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicEventBuilder characteristic](self, "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "_wouldFireForValue:thresholdRange:characteristic:", v4, v6, v7);

  return (char)v5;
}

- (id)triggeringValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[HFCharacteristicEventBuilder characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "validValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__HFCharacteristicThresholdRangeEventBuilder_triggeringValues__block_invoke;
  v10[3] = &unk_1EA727728;
  v10[4] = self;
  objc_msgSend(v6, "na_filter:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __62__HFCharacteristicThresholdRangeEventBuilder_triggeringValues__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  _BOOL4 v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "thresholdRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "doubleValue");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "thresholdRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v7 > v10;

  }
  else
  {
    v11 = 1;
  }

  objc_msgSend(*(id *)(a1 + 32), "thresholdRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "maxValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v3, "doubleValue");
    v15 = v14;
    objc_msgSend(*(id *)(a1 + 32), "thresholdRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "maxValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v15 < v18;

  }
  else
  {
    v19 = 1;
  }

  return v11 & v19;
}

- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  BOOL v10;

  v6 = a4;
  v7 = a3;
  -[HFCharacteristicEventBuilder characteristic](self, "characteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
    v10 = -[HFCharacteristicThresholdRangeEventBuilder hf_wouldFireForValue:](self, "hf_wouldFireForValue:", v6);
  else
    v10 = 0;

  return v10;
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
  v10.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
  -[HFEventBuilder comparisonKey](&v10, sel_comparisonKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicEventBuilder characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicThresholdRangeEventBuilder thresholdRange](self, "thresholdRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@:%@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)copyValuesFromCharacteristicEventBuilder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  HMNumberRange *v8;
  HMNumberRange *thresholdRange;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
  -[HFCharacteristicEventBuilder copyValuesFromCharacteristicEventBuilder:](&v10, sel_copyValuesFromCharacteristicEventBuilder_, v4);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "thresholdRange");
    v8 = (HMNumberRange *)objc_claimAutoreleasedReturnValue();
    thresholdRange = self->_thresholdRange;
    self->_thresholdRange = v8;

  }
}

- (id)buildNewEventsFromCurrentState
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CBA478]);
  -[HFCharacteristicEventBuilder characteristic](self, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicThresholdRangeEventBuilder thresholdRange](self, "thresholdRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCharacteristic:thresholdRange:", v4, v5);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  -[HFCharacteristicThresholdRangeEventBuilder thresholdRange](self, "thresholdRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_naturalLanguageNameWithOptions:characteristics:triggerValue:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HFCharacteristicThresholdRangeEventBuilder *v5;
  HFCharacteristicThresholdRangeEventBuilder *v6;
  HFCharacteristicThresholdRangeEventBuilder *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  objc_super v25;

  v4 = a3;
  objc_opt_class();
  v5 = (HFCharacteristicThresholdRangeEventBuilder *)v4;
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
    v25.receiver = self;
    v25.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
    v8 = 0;
    if (-[HFCharacteristicEventBuilder isEqual:](&v25, sel_isEqual_, v5) && v7)
    {
      -[HFCharacteristicThresholdRangeEventBuilder thresholdRange](self, "thresholdRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "minValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicThresholdRangeEventBuilder thresholdRange](v7, "thresholdRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "minValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v10;
      v14 = v12;
      v15 = v14;
      if (v13 == v14)
      {
        v8 = 1;
        v17 = v13;
        v18 = v13;
      }
      else
      {
        if (v13)
        {
          v16 = objc_msgSend(v13, "isEqual:", v14);

          if ((v16 & 1) != 0)
          {
            v8 = 1;
LABEL_21:

            goto LABEL_22;
          }
        }
        else
        {

        }
        v24 = v9;
        -[HFCharacteristicThresholdRangeEventBuilder thresholdRange](self, "thresholdRange");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "maxValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCharacteristicThresholdRangeEventBuilder thresholdRange](v7, "thresholdRange");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "maxValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v19;
        v22 = v21;
        if (v17 == v22)
        {
          v8 = 1;
        }
        else if (v17)
        {
          v8 = objc_msgSend(v17, "isEqual:", v22);
        }
        else
        {
          v8 = 0;
        }

        v9 = v24;
      }

      goto LABEL_21;
    }
  }
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
  v3 = -[HFCharacteristicEventBuilder hash](&v7, sel_hash);
  -[HFCharacteristicThresholdRangeEventBuilder thresholdRange](self, "thresholdRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

+ (BOOL)_wouldFireForValue:(id)a3 thresholdRange:(id)a4 characteristic:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;

  v7 = a4;
  if (a3)
  {
    v8 = a3;
    objc_msgSend(a5, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_valueRoundedToNearestStepValue:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "minValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "minValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hf_valueRoundedToNearestStepValue:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "doubleValue");
      v15 = v14;
      objc_msgSend(v13, "doubleValue");
      v17 = v16 + -0.00000011920929;

      if (v15 < v17)
        goto LABEL_8;
    }
    objc_msgSend(v7, "maxValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_6;
    objc_msgSend(v7, "maxValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_valueRoundedToNearestStepValue:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "doubleValue");
    v22 = v21;
    objc_msgSend(v20, "doubleValue");
    v24 = v23 + 0.00000011920929;

    if (v22 > v24)
LABEL_8:
      v25 = 0;
    else
LABEL_6:
      v25 = 1;

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (HMNumberRange)thresholdRange
{
  return self->_thresholdRange;
}

- (void)setThresholdRange:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdRange, 0);
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
  v13.super_class = (Class)HFCharacteristicThresholdRangeEventBuilder;
  -[HFEventBuilder compareToObject:](&v13, sel_compareToObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsCriticalDifference") & 1) == 0)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__HFCharacteristicThresholdRangeEventBuilder_Comparison__compareToObject___block_invoke;
    v11[3] = &unk_1EA72C9C0;
    v11[4] = self;
    v7 = v4;
    v12 = v7;

    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __74__HFCharacteristicThresholdRangeEventBuilder_Comparison__compareToObject___block_invoke_2;
    v9[3] = &unk_1EA72C9C0;
    v9[4] = self;
    v10 = v7;

  }
  return v5;
}

uint64_t __74__HFCharacteristicThresholdRangeEventBuilder_Comparison__compareToObject___block_invoke(uint64_t a1)
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

uint64_t __74__HFCharacteristicThresholdRangeEventBuilder_Comparison__compareToObject___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "thresholdRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "thresholdRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {

    goto LABEL_6;
  }
  if (!v6)
  {
    v10 = 1;
    v11 = v7;
LABEL_13:

    goto LABEL_14;
  }
  v9 = objc_msgSend(v6, "isEqual:", v7);

  if (v9)
  {
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "thresholdRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "minValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "thresholdRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "minValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    v16 = v14;
    if (v15 == v16)
    {
      v10 = 0;
    }
    else if (v15)
    {
      v10 = objc_msgSend(v15, "isEqual:", v16) ^ 1;
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_13;
  }
  v10 = 1;
LABEL_14:

  return v10;
}

@end
