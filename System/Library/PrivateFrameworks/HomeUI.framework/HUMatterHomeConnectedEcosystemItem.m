@implementation HUMatterHomeConnectedEcosystemItem

- (HUMatterHomeConnectedEcosystemItem)initWithConnectedEcosystem:(id)a3 accessoryUUIDs:(id)a4
{
  id v7;
  id v8;
  HUMatterHomeConnectedEcosystemItem *v9;
  HUMatterHomeConnectedEcosystemItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUMatterHomeConnectedEcosystemItem;
  v9 = -[HUMatterHomeConnectedEcosystemItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectedEcosystem, a3);
    objc_storeStrong((id *)&v10->_accessoryUUIDs, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D30D18];
  -[HUMatterHomeConnectedEcosystemItem connectedEcosystem](self, "connectedEcosystem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  v21[1] = *MEMORY[0x1E0D30BF8];
  -[HUMatterHomeConnectedEcosystemItem accessoryUUIDs](self, "accessoryUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  HULocalizedStringWithFormat(CFSTR("HUNumberOfAccessories"), CFSTR("%lu"), v9, v10, v11, v12, v13, v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "futureWithResult:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (HMCHIPEcosystem)connectedEcosystem
{
  return self->_connectedEcosystem;
}

- (NSSet)accessoryUUIDs
{
  return self->_accessoryUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_connectedEcosystem, 0);
}

@end
