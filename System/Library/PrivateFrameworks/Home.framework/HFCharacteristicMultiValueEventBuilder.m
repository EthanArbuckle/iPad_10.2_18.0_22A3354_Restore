@implementation HFCharacteristicMultiValueEventBuilder

- (HFCharacteristicMultiValueEventBuilder)initWithCharacteristic:(id)a3 values:(id)a4
{
  id v6;
  HFCharacteristicMultiValueEventBuilder *v7;
  uint64_t v8;
  NSSet *triggerValues;
  NSCopying *representativeTargetValue;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFCharacteristicMultiValueEventBuilder;
  v7 = -[HFCharacteristicEventBuilder _initWithCharacteristic:](&v12, sel__initWithCharacteristic_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    triggerValues = v7->_triggerValues;
    v7->_triggerValues = (NSSet *)v8;

    representativeTargetValue = v7->_representativeTargetValue;
    v7->_representativeTargetValue = 0;

  }
  return v7;
}

- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[HFCharacteristicMultiValueEventBuilder triggerValues](self, "triggerValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7;
}

- (id)comparisonKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)HFCharacteristicMultiValueEventBuilder;
  -[HFEventBuilder comparisonKey](&v12, sel_comparisonKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicEventBuilder characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicMultiValueEventBuilder triggerValues](self, "triggerValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@:(%@)"), v4, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)copyValuesFromCharacteristicEventBuilder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSSet *v8;
  NSSet *triggerValues;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFCharacteristicMultiValueEventBuilder;
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
    objc_msgSend(v7, "triggerValues");
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    triggerValues = self->_triggerValues;
    self->_triggerValues = v8;

  }
}

- (id)buildNewEventsFromCurrentState
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HFCharacteristicMultiValueEventBuilder triggerValues](self, "triggerValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__HFCharacteristicMultiValueEventBuilder_buildNewEventsFromCurrentState__block_invoke;
  v6[3] = &unk_1EA727750;
  v6[4] = self;
  objc_msgSend(v3, "na_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __72__HFCharacteristicMultiValueEventBuilder_buildNewEventsFromCurrentState__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CBA468];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCharacteristic:triggerValue:", v6, v4);

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
  -[HFCharacteristicMultiValueEventBuilder hf_representativeTriggerValue](self, "hf_representativeTriggerValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_naturalLanguageNameWithOptions:characteristics:triggerValue:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)hf_representativeTriggerValue
{
  void *v3;
  void *v4;
  void *v5;

  -[HFCharacteristicMultiValueEventBuilder representativeTargetValue](self, "representativeTargetValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFCharacteristicMultiValueEventBuilder representativeTargetValue](self, "representativeTargetValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFCharacteristicMultiValueEventBuilder triggerValues](self, "triggerValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HFCharacteristicMultiValueEventBuilder *v5;
  HFCharacteristicMultiValueEventBuilder *v6;
  HFCharacteristicMultiValueEventBuilder *v7;
  char v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  v5 = (HFCharacteristicMultiValueEventBuilder *)v4;
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
    v12.super_class = (Class)HFCharacteristicMultiValueEventBuilder;
    v8 = 0;
    if (-[HFCharacteristicEventBuilder isEqual:](&v12, sel_isEqual_, v5) && v7)
    {
      -[HFCharacteristicMultiValueEventBuilder triggerValues](self, "triggerValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicMultiValueEventBuilder triggerValues](v7, "triggerValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "isEqualToSet:", v10);

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
  v7.super_class = (Class)HFCharacteristicMultiValueEventBuilder;
  v3 = -[HFCharacteristicEventBuilder hash](&v7, sel_hash);
  -[HFCharacteristicMultiValueEventBuilder triggerValues](self, "triggerValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSSet)triggerValues
{
  return self->_triggerValues;
}

- (void)setTriggerValues:(id)a3
{
  objc_storeStrong((id *)&self->_triggerValues, a3);
}

- (NSCopying)representativeTargetValue
{
  return self->_representativeTargetValue;
}

- (void)setRepresentativeTargetValue:(id)a3
{
  objc_storeStrong((id *)&self->_representativeTargetValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativeTargetValue, 0);
  objc_storeStrong((id *)&self->_triggerValues, 0);
}

@end
