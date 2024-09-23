@implementation HFAggregatedCharacteristicReadPolicy

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  -[HFAggregatedCharacteristicReadPolicy policies](self, "policies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[HFAggregatedCharacteristicReadPolicy policies](self, "policies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 == 1)
    {
      -[HFAggregatedCharacteristicReadPolicy policies](self, "policies");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "evaluateWithCharacteristic:traits:", v6, a4);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 1;
      -[HFAggregatedCharacteristicReadPolicy policies](self, "policies");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __74__HFAggregatedCharacteristicReadPolicy_evaluateWithCharacteristic_traits___block_invoke;
      v17[3] = &unk_1EA733C00;
      v18 = v6;
      v11 = v14;
      v19 = v11;
      v20 = &v21;
      objc_msgSend(v15, "enumerateObjectsWithOptions:usingBlock:", 2, v17);

      if (a4)
        *a4 = (id)objc_msgSend(v11, "copy");
      v13 = v22[3];

      _Block_object_dispose(&v21, 8);
    }

  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = 1;
  }

  return v13;
}

- (NSArray)policies
{
  return self->_policies;
}

void __74__HFAggregatedCharacteristicReadPolicy_evaluateWithCharacteristic_traits___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v4 = objc_msgSend(a2, "evaluateWithCharacteristic:traits:", v3, &v8);
  v5 = v8;
  objc_msgSend(*(id *)(a1 + 40), "unionSet:", v5);
  if (v4 == 2)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(_QWORD *)(v6 + 24);
    if (v7 == 1)
      v7 = 2;
    goto LABEL_8;
  }
  if (!v4)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(_QWORD *)(v6 + 24);
    if (v7 == 1)
      v7 = 0;
LABEL_8:
    *(_QWORD *)(v6 + 24) = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
}

- (HFAggregatedCharacteristicReadPolicy)initWithPolicies:(id)a3
{
  id v5;
  HFAggregatedCharacteristicReadPolicy *v6;
  HFAggregatedCharacteristicReadPolicy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFAggregatedCharacteristicReadPolicy;
  v6 = -[HFAggregatedCharacteristicReadPolicy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_policies, a3);

  return v7;
}

- (HFAggregatedCharacteristicReadPolicy)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithPolicies_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicReadPolicy.m"), 66, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAggregatedCharacteristicReadPolicy init]",
    v5);

  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HFMutableAggregatedCharacteristicReadPolicy *v4;
  void *v5;
  HFMutableAggregatedCharacteristicReadPolicy *v6;

  v4 = [HFMutableAggregatedCharacteristicReadPolicy alloc];
  -[HFAggregatedCharacteristicReadPolicy policies](self, "policies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFAggregatedCharacteristicReadPolicy initWithPolicies:](v4, "initWithPolicies:", v5);

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAggregatedCharacteristicReadPolicy policies](self, "policies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("policies"), 0);

  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

@end
