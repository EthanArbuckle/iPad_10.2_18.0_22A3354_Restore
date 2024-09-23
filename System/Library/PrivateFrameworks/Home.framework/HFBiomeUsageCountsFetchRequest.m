@implementation HFBiomeUsageCountsFetchRequest

- (HFBiomeUsageCountsFetchRequest)initWithHome:(id)a3
{
  HFBiomeUsageCountsFetchRequest *v3;
  uint64_t v4;
  NSMapTable *usageCountByAccessoryRepresentable;
  uint64_t v6;
  NSMapTable *accessoryRepresentablesByUniqueIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HFBiomeUsageCountsFetchRequest;
  v3 = -[HFBiomeAbstractFetchRequest initWithHome:](&v9, sel_initWithHome_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    usageCountByAccessoryRepresentable = v3->_usageCountByAccessoryRepresentable;
    v3->_usageCountByAccessoryRepresentable = (NSMapTable *)v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    accessoryRepresentablesByUniqueIdentifier = v3->_accessoryRepresentablesByUniqueIdentifier;
    v3->_accessoryRepresentablesByUniqueIdentifier = (NSMapTable *)v6;

  }
  return v3;
}

- (void)eventHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v4 = a3;
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "serviceGroupUniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      objc_initWeak(&location, self);
      objc_msgSend(v6, "serviceGroupUniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      v22[1] = 3221225472;
      v22[2] = __47__HFBiomeUsageCountsFetchRequest_eventHandler___block_invoke;
      v22[3] = &unk_1EA733460;
      objc_copyWeak(&v23, &location);
      -[HFBiomeUsageCountsFetchRequest _accessoryRepresentableWithUniqueIdentifierString:uniqueIdentifierToAccessoryRepesentableBlock:](self, "_accessoryRepresentableWithUniqueIdentifierString:uniqueIdentifierToAccessoryRepesentableBlock:", v9, v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[HFBiomeUsageCountsFetchRequest _incrementUsageCountForAccessoryRepresentable:](self, "_incrementUsageCountForAccessoryRepresentable:", v10);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    objc_initWeak(&location, self);
    objc_msgSend(v6, "accessoryUniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __47__HFBiomeUsageCountsFetchRequest_eventHandler___block_invoke_2;
    v20[3] = &unk_1EA733460;
    objc_copyWeak(&v21, &location);
    -[HFBiomeUsageCountsFetchRequest _accessoryRepresentableWithUniqueIdentifierString:uniqueIdentifierToAccessoryRepesentableBlock:](self, "_accessoryRepresentableWithUniqueIdentifierString:uniqueIdentifierToAccessoryRepesentableBlock:", v11, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFBiomeUsageCountsFetchRequest _incrementUsageCountForAccessoryRepresentable:](self, "_incrementUsageCountForAccessoryRepresentable:", v12);
    objc_msgSend(v6, "serviceUniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v8;
    v16 = 3221225472;
    v17 = __47__HFBiomeUsageCountsFetchRequest_eventHandler___block_invoke_3;
    v18 = &unk_1EA733460;
    objc_copyWeak(&v19, &location);
    -[HFBiomeUsageCountsFetchRequest _accessoryRepresentableWithUniqueIdentifierString:uniqueIdentifierToAccessoryRepesentableBlock:](self, "_accessoryRepresentableWithUniqueIdentifierString:uniqueIdentifierToAccessoryRepesentableBlock:", v13, &v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFBiomeUsageCountsFetchRequest _incrementUsageCountForAccessoryRepresentable:](self, "_incrementUsageCountForAccessoryRepresentable:", v14, v15, v16, v17, v18);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

id __47__HFBiomeUsageCountsFetchRequest_eventHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unsigned int (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_serviceGroupWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "filter");
  v7 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (((unsigned int (**)(_QWORD, void *))v7)[2](v7, v6))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

id __47__HFBiomeUsageCountsFetchRequest_eventHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unsigned int (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_accessoryWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "filter");
  v7 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (((unsigned int (**)(_QWORD, void *))v7)[2](v7, v6))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

id __47__HFBiomeUsageCountsFetchRequest_eventHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unsigned int (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_serviceWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "filter");
  v7 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (((unsigned int (**)(_QWORD, void *))v7)[2](v7, v6))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (void)_incrementUsageCountForAccessoryRepresentable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    -[HFBiomeUsageCountsFetchRequest usageCountByAccessoryRepresentable](self, "usageCountByAccessoryRepresentable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    -[HFBiomeUsageCountsFetchRequest usageCountByAccessoryRepresentable](self, "usageCountByAccessoryRepresentable");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v4);

  }
}

- (id)_accessoryRepresentableWithUniqueIdentifierString:(id)a3 uniqueIdentifierToAccessoryRepesentableBlock:(id)a4
{
  void (**v6)(id, void *);
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void (**)(id, void *))a4;
  v7 = (objc_class *)MEMORY[0x1E0CB3A28];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithUUIDString:", v8);

  -[HFBiomeUsageCountsFetchRequest accessoryRepresentablesByUniqueIdentifier](self, "accessoryRepresentablesByUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v6[2](v6, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HFBiomeUsageCountsFetchRequest accessoryRepresentablesByUniqueIdentifier](self, "accessoryRepresentablesByUniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v11, v9);

    }
  }

  return v11;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSMapTable)usageCountByAccessoryRepresentable
{
  return (NSMapTable *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUsageCountByAccessoryRepresentable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMapTable)accessoryRepresentablesByUniqueIdentifier
{
  return (NSMapTable *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAccessoryRepresentablesByUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryRepresentablesByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_usageCountByAccessoryRepresentable, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
