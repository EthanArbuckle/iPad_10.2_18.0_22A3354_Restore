@implementation HUMatterAccessoryConnectedEcosystemItem

- (HUMatterAccessoryConnectedEcosystemItem)initWithConnectedEcosystem:(id)a3 chipAccessoryPairings:(id)a4
{
  id v7;
  id v8;
  HUMatterAccessoryConnectedEcosystemItem *v9;
  HUMatterAccessoryConnectedEcosystemItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUMatterAccessoryConnectedEcosystemItem;
  v9 = -[HUMatterAccessoryConnectedEcosystemItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectedEcosystem, a3);
    objc_storeStrong((id *)&v10->_chipAccessoryPairings, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  -[HUMatterAccessoryConnectedEcosystemItem connectedEcosystem](self, "connectedEcosystem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v5, "isSystemCommissionerVendor");

  v30[0] = *MEMORY[0x1E0D30D18];
  -[HUMatterAccessoryConnectedEcosystemItem connectedEcosystem](self, "connectedEcosystem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "vendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v7;
  v30[1] = *MEMORY[0x1E0D30C08];
  _HULocalizedStringWithDefaultValue(CFSTR("HURemoveTitle"), CFSTR("HURemoveTitle"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v8;
  v30[2] = CFSTR("HUMatterAccessoryConnectedEcosystemItemIsAppleVendor");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HUMatterAccessoryConnectedEcosystemItem connectedEcosystem](self, "connectedEcosystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vendor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithBool:", objc_msgSend(v11, "isAppleVendor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v12;
  v30[3] = CFSTR("HUMatterAccessoryConnectedEcosystemItemIsSystemCommissioner");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v14, "mutableCopy");

  if ((v27 & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    -[HUMatterAccessoryConnectedEcosystemItem chipAccessoryPairings](self, "chipAccessoryPairings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "na_map:", &__block_literal_global_173);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v15, "count"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUMatterConnectedEcosystemHomesSeparator"), CFSTR("HUMatterConnectedEcosystemHomesSeparator"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30BF8]);

  }
  v21 = (void *)MEMORY[0x1E0D519C0];
  v22 = (void *)MEMORY[0x1E0D314B8];
  v23 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v22, "outcomeWithResults:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "futureWithResult:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

id __71__HUMatterAccessoryConnectedEcosystemItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMCHIPEcosystem)connectedEcosystem
{
  return self->_connectedEcosystem;
}

- (NSSet)chipAccessoryPairings
{
  return self->_chipAccessoryPairings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipAccessoryPairings, 0);
  objc_storeStrong((id *)&self->_connectedEcosystem, 0);
}

@end
