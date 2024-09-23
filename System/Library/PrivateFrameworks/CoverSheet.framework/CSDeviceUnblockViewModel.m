@implementation CSDeviceUnblockViewModel

- (CSDeviceUnblockViewModel)initWithUnblockPolicy:(id)a3 blockViewController:(id)a4
{
  id v7;
  id v8;
  CSDeviceUnblockViewModel *v9;
  CSDeviceUnblockViewModel *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSDeviceUnblockViewModel;
  v9 = -[CSDeviceUnblockViewModel init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unblockPolicy, a3);
    objc_storeWeak((id *)&v10->_blockViewController, v8);
  }

  return v10;
}

- (id)_localizedProductName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedProductName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_localizedStringForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E8E30B28, CFSTR("CoverSheet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)iconName
{
  return &stru_1E8E30B28;
}

- (id)titleText
{
  return &stru_1E8E30B28;
}

- (id)bodyTextForTimeout:(id)a3
{
  return &stru_1E8E30B28;
}

- (id)bodySubtitleText
{
  return &stru_1E8E30B28;
}

- (id)cancelButtonText
{
  return &stru_1E8E30B28;
}

- (id)primaryButtonText
{
  return &stru_1E8E30B28;
}

- (id)secondaryButtonText
{
  return &stru_1E8E30B28;
}

- (CSDeviceBlockViewController)blockViewController
{
  return (CSDeviceBlockViewController *)objc_loadWeakRetained((id *)&self->_blockViewController);
}

- (void)setBlockViewController:(id)a3
{
  objc_storeWeak((id *)&self->_blockViewController, a3);
}

- (CSDeviceUnblockPolicy)unblockPolicy
{
  return self->_unblockPolicy;
}

- (void)setUnblockPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_unblockPolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unblockPolicy, 0);
  objc_destroyWeak((id *)&self->_blockViewController);
}

@end
