@implementation HFIncrementalStateCharacteristicActionSuggestionVendor

- (HFIncrementalStateCharacteristicActionSuggestionVendor)initWithCharacteristicType:(id)a3
{
  id v5;
  HFIncrementalStateCharacteristicActionSuggestionVendor *v6;
  HFIncrementalStateCharacteristicActionSuggestionVendor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFIncrementalStateCharacteristicActionSuggestionVendor;
  v6 = -[HFIncrementalStateCharacteristicActionSuggestionVendor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_characteristicType, a3);

  return v7;
}

- (id)suggestedActionForCharacteristic:(id)a3 candidateActions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HFCustomCharacteristicActionSuggestionResult *v15;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "na_map:", &__block_literal_global_178);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_normalizedValueForValue:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __108__HFIncrementalStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_2;
    v17[3] = &unk_1EA73B220;
    v18 = v12;
    v13 = v12;
    objc_msgSend(v6, "na_filter:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HFCustomCharacteristicActionSuggestionResult initWithCharacteristic:targetValue:matchingActions:]([HFCustomCharacteristicActionSuggestionResult alloc], "initWithCharacteristic:targetValue:matchingActions:", v5, v13, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __108__HFIncrementalStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  objc_msgSend(v2, "targetValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

BOOL __108__HFIncrementalStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _BOOL8 v7;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "targetValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    v7 = objc_msgSend(v6, "compare:", *(_QWORD *)(a1 + 32)) != -1;
  else
    v7 = 0;

  return v7;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end
