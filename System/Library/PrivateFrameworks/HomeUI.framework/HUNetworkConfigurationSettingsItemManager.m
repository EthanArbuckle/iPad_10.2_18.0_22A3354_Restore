@implementation HUNetworkConfigurationSettingsItemManager

- (HUNetworkConfigurationSettingsItemManager)initWithDelegate:(id)a3 networkConfigurationGroupItem:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUNetworkConfigurationSettingsItemManager;
  return -[HFItemManager initWithDelegate:sourceItem:](&v5, sel_initWithDelegate_sourceItem_, a3, a4);
}

- (HUNetworkConfigurationSettingsItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_networkConfigurationGroupItem_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkConfigurationSettingsItemManager.m"), 30, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNetworkConfigurationSettingsItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HUNetworkConfigurationSettingsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_networkConfigurationGroupItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkConfigurationSettingsItemManager.m"), 35, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNetworkConfigurationSettingsItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (id)_buildItemModulesForHome:(id)a3
{
  HUNetworkConfigurationSettingsModule *v4;
  void *v5;
  void *v6;
  HUNetworkConfigurationSettingsModule *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = [HUNetworkConfigurationSettingsModule alloc];
  -[HUNetworkConfigurationSettingsItemManager sourceNetworkConfigurationGroupItem](self, "sourceNetworkConfigurationGroupItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUNetworkConfigurationSettingsModule initWithItemUpdater:group:](v4, "initWithItemUpdater:group:", self, v6);
  -[HUNetworkConfigurationSettingsItemManager setNetworkConfigurationSettingsModule:](self, "setNetworkConfigurationSettingsModule:", v7);

  -[HUNetworkConfigurationSettingsItemManager networkConfigurationSettingsModule](self, "networkConfigurationSettingsModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUNetworkConfigurationSettingsItemManager networkConfigurationSettingsModule](self, "networkConfigurationSettingsModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildSectionsWithDisplayedItems:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObjectsFromArray:", v7);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HFNetworkConfigurationGroupItem)sourceNetworkConfigurationGroupItem
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  return (HFNetworkConfigurationGroupItem *)v6;
}

- (HUNetworkConfigurationSettingsModule)networkConfigurationSettingsModule
{
  return self->_networkConfigurationSettingsModule;
}

- (void)setNetworkConfigurationSettingsModule:(id)a3
{
  objc_storeStrong((id *)&self->_networkConfigurationSettingsModule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConfigurationSettingsModule, 0);
}

@end
