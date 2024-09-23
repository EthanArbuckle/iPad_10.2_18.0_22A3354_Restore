@implementation HUMatterConnectedHomeItem

- (HUMatterConnectedHomeItem)initWithConnectedHome:(id)a3 accessoryPairing:(id)a4
{
  id v7;
  id v8;
  HUMatterConnectedHomeItem *v9;
  HUMatterConnectedHomeItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUMatterConnectedHomeItem;
  v9 = -[HUMatterConnectedHomeItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectedHome, a3);
    objc_storeStrong((id *)&v10->_chipAccessoryPairing, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0D30BF8];
  -[HUMatterConnectedHomeItem connectedHome](self, "connectedHome", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMCHIPHome)connectedHome
{
  return self->_connectedHome;
}

- (HMCHIPAccessoryPairing)chipAccessoryPairing
{
  return self->_chipAccessoryPairing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipAccessoryPairing, 0);
  objc_storeStrong((id *)&self->_connectedHome, 0);
}

@end
