@implementation HUBridgeListItem

- (HUBridgeListItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUBridgeListItem.m"), 18, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUBridgeListItem init]",
    v5);

  return 0;
}

- (HUBridgeListItem)initWithHome:(id)a3
{
  id v5;
  HUBridgeListItem *v6;
  HUBridgeListItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUBridgeListItem;
  v6 = -[HUBridgeListItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_home, a3);

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;

  v4 = (void *)objc_opt_new();
  _HULocalizedStringWithDefaultValue(CFSTR("HUBridgeAndResidentListItemTitle"), CFSTR("HUBridgeAndResidentListItemTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.HomeSettings.HubsAndBridges"), *MEMORY[0x1E0D30BA0]);
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationPreferringMulticolor");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v6;
  objc_msgSend(v7, "configurationByApplyingConfiguration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D317C8], "iconDescriptorForAccessoryCategoryOrServiceType:", *MEMORY[0x1E0CB7A28]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "imageIconDescriptorWithUpdatedImageSymbolConfiguration:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30C60]);

  -[HUBridgeListItem home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "na_filter:", &__block_literal_global_126);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  -[HUBridgeListItem home](self, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "residentDevices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20 + v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%lu"), v20 + v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30BF8]);

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  -[HUBridgeListItem home](self, "home");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hf_currentUserIsAdministrator");

  if ((v23 & 1) == 0)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  v24 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "futureWithResult:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t __48__HUBridgeListItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleAsBridge");
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
