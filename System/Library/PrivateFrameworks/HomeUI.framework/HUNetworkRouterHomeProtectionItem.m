@implementation HUNetworkRouterHomeProtectionItem

- (HUNetworkRouterHomeProtectionItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkRouterHomeProtectionItem.m"), 19, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNetworkRouterHomeProtectionItem init]",
    v5);

  return 0;
}

- (HUNetworkRouterHomeProtectionItem)initWithHome:(id)a3
{
  id v5;
  HUNetworkRouterHomeProtectionItem *v6;
  HUNetworkRouterHomeProtectionItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUNetworkRouterHomeProtectionItem;
  v6 = -[HUNetworkRouterHomeProtectionItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_home, a3);

  return v7;
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

  v4 = (void *)objc_opt_new();
  _HULocalizedStringWithDefaultValue(CFSTR("HUNetworkRouterHomeProtectionItemTitle"), CFSTR("HUNetworkRouterHomeProtectionItemTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30D18]);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[HUNetworkRouterHomeProtectionItem home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_isNetworkProtectionEnabled");
  objc_msgSend(v6, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30E20]);

  v9 = (void *)MEMORY[0x1E0C99E60];
  -[HUNetworkRouterHomeProtectionItem home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30B80]);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[HUNetworkRouterHomeProtectionItem home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "hf_isNetworkProtectionSupportedForHome") ^ 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30C80]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30CF0]);
  -[HUNetworkRouterHomeProtectionItem home](self, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_localizedDescriptionForNetworkProtectionSupport");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("HFResultNetworkRouterHomeProtectionDescriptionKey"));

  v17 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "futureWithResult:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
}

@end
