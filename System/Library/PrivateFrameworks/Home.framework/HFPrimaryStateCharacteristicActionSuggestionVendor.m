@implementation HFPrimaryStateCharacteristicActionSuggestionVendor

- (HFPrimaryStateCharacteristicActionSuggestionVendor)initWithCharacteristicType:(id)a3 normalStateValue:(id)a4
{
  return -[HFPrimaryStateCharacteristicActionSuggestionVendor initWithCharacteristicType:normalStateValue:bucketingPolicy:](self, "initWithCharacteristicType:normalStateValue:bucketingPolicy:", a3, a4, 0);
}

- (HFPrimaryStateCharacteristicActionSuggestionVendor)initWithCharacteristicType:(id)a3 normalStateValue:(id)a4 bucketingPolicy:(unint64_t)a5
{
  id v9;
  id v10;
  HFPrimaryStateCharacteristicActionSuggestionVendor *v11;
  HFPrimaryStateCharacteristicActionSuggestionVendor *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFPrimaryStateCharacteristicActionSuggestionVendor;
  v11 = -[HFPrimaryStateCharacteristicActionSuggestionVendor init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_characteristicType, a3);
    objc_storeStrong(&v12->_normalStateValue, a4);
    v12->_bucketingPolicy = a5;
  }

  return v12;
}

- (id)suggestedActionForCharacteristic:(id)a3 candidateActions:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  HFPrimaryStateCharacteristicActionSuggestionVendor *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  HFPrimaryStateCharacteristicActionSuggestionVendor *v32;
  _QWORD v33[7];
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0CB3550]);
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke;
  v36[3] = &unk_1EA73B140;
  v36[4] = self;
  objc_msgSend(v9, "na_map:", v36);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithArray:", v11);

  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v10;
  v34[1] = 3221225472;
  v34[2] = __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_2;
  v34[3] = &unk_1EA727F78;
  v14 = v12;
  v35 = v14;
  objc_msgSend(v13, "sortedArrayUsingComparator:", v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "firstObject");
  v33[0] = v10;
  v33[1] = 3221225472;
  v33[2] = __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_3;
  v33[3] = &unk_1EA73B168;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v33[4] = v16;
  v17 = v14;
  v33[5] = v17;
  v18 = v15;
  v33[6] = v18;
  if (__104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_3((uint64_t)v33))
  {
    v30[0] = v10;
    v30[1] = 3221225472;
    v30[2] = __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_4;
    v30[3] = &unk_1EA73B190;
    v19 = v16;
    v31 = v19;
    v32 = self;
    objc_msgSend(v7, "na_filter:", v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      v25[0] = v10;
      v25[1] = 3221225472;
      v25[2] = __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_5;
      v25[3] = &unk_1EA73B1B8;
      v21 = v19;
      v26 = v21;
      v27 = self;
      v28 = v6;
      v29 = v20;
      __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_5((uint64_t)v25);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFPrimaryStateCharacteristicActionSuggestionVendor normalStateValue](self, "normalStateValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setIsMutuallyExclusiveAction:", objc_msgSend(v21, "isEqual:", v23));

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

uint64_t __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bucketingValueForAction:", a2);
}

uint64_t __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "countForObject:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

uint64_t __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_3(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (!*(_QWORD *)(a1 + 32) || !objc_msgSend(*(id *)(a1 + 40), "countForObject:"))
    return 0;
  if (objc_msgSend(*(id *)(a1 + 48), "count") == 1)
    return 1;
  v3 = objc_msgSend(*(id *)(a1 + 40), "countForObject:", *(_QWORD *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != objc_msgSend(v4, "countForObject:", v5);

  return v2;
}

uint64_t __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_bucketingValueForAction:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

HFCustomCharacteristicActionSuggestionResult *__104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  HFCustomCharacteristicActionSuggestionResult *v4;
  HFIncrementalStateCharacteristicActionSuggestionVendor *v5;
  void *v6;
  HFIncrementalStateCharacteristicActionSuggestionVendor *v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v5 = [HFIncrementalStateCharacteristicActionSuggestionVendor alloc];
    objc_msgSend(*(id *)(a1 + 40), "characteristicType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HFIncrementalStateCharacteristicActionSuggestionVendor initWithCharacteristicType:](v5, "initWithCharacteristicType:", v6);
    -[HFIncrementalStateCharacteristicActionSuggestionVendor suggestedActionForCharacteristic:candidateActions:](v7, "suggestedActionForCharacteristic:candidateActions:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v4 = (HFCustomCharacteristicActionSuggestionResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = -[HFCustomCharacteristicActionSuggestionResult initWithCharacteristic:targetValue:matchingActions:]([HFCustomCharacteristicActionSuggestionResult alloc], "initWithCharacteristic:targetValue:matchingActions:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  }
  return v4;
}

- (id)_bucketingValueForAction:(id)a3
{
  void *v3;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = -[HFPrimaryStateCharacteristicActionSuggestionVendor bucketingPolicy](self, "bucketingPolicy");
  if (v6 == 1)
  {
    objc_msgSend(v5, "targetValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPrimaryStateCharacteristicActionSuggestionVendor normalStateValue](self, "normalStateValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
      objc_msgSend(v5, "targetValue");
    else
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (!v6)
  {
    objc_msgSend(v5, "targetValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (id)normalStateValue
{
  return self->_normalStateValue;
}

- (unint64_t)bucketingPolicy
{
  return self->_bucketingPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_normalStateValue, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end
