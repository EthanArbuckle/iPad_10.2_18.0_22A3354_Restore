@implementation HUIncludedContextItem

- (HUIncludedContextItem)initWithHomeKitObject:(id)a3 contextType:(unint64_t)a4 home:(id)a5
{
  id v9;
  id v10;
  HUIncludedContextItem *v11;
  HUIncludedContextItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUIncludedContextItem;
  v11 = -[HUIncludedContextItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_contextType = a4;
    objc_storeStrong((id *)&v11->_homeKitObject, a3);
    objc_storeStrong((id *)&v12->_home, a5);
  }

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUIncludedContextItem contextType](self, "contextType");
  v6 = (_QWORD *)MEMORY[0x1E0D30D20];
  switch(v5)
  {
    case 0uLL:
      NSLog(CFSTR("Should not be using HUIncludedContextItem for HFIncludedContextTypeLegacyFavorite"));
      break;
    case 1uLL:
      v7 = *MEMORY[0x1E0D30D20];
      v8 = CFSTR("HUStatusAndNotificationsIncludeInStatusTitle");
      goto LABEL_6;
    case 2uLL:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUServiceDetailsFavoriteSwitch"), *MEMORY[0x1E0D30D20]);
      v7 = *MEMORY[0x1E0D30BA0];
      v8 = CFSTR("AccessoryDetails.Favorite");
      goto LABEL_6;
    case 3uLL:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUShowInHomeDashboardTitle"), *MEMORY[0x1E0D30D20]);
      v7 = *MEMORY[0x1E0D30BA0];
      v8 = CFSTR("AccessoryDetails.ShowInHome");
LABEL_6:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v7);
      break;
    default:
      break;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v9, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D18]);

  -[HUIncludedContextItem homeKitObject](self, "homeKitObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0C99E60];
    -[HUIncludedContextItem homeKitObject](self, "homeKitObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30B80]);

  }
  -[HUIncludedContextItem homeKitObject](self, "homeKitObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "conformsToProtocol:", &unk_1EF329B40);

  v17 = (_QWORD *)MEMORY[0x1E0D30E20];
  if (v16)
  {
    -[HUIncludedContextItem homeKitObject](self, "homeKitObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "hf_shouldBeOnForContextType:", -[HUIncludedContextItem contextType](self, "contextType")))v19 = &unk_1E7040DB0;
    else
      v19 = &unk_1E7040DC8;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, *v17);
    v20 = objc_msgSend(v18, "hf_shouldHideForContextType:", -[HUIncludedContextItem contextType](self, "contextType"));

  }
  else
  {
    v20 = 1;
  }
  -[HUIncludedContextItem overrideHiddenState](self, "overrideHiddenState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[HUIncludedContextItem overrideHiddenState](self, "overrideHiddenState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v22, "BOOLValue");

  }
  if (_os_feature_enabled_impl())
  {
    -[HUIncludedContextItem home](self, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v23, "hf_currentUserIsRestrictedGuest") | v20;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D30D70]);

  -[HUIncludedContextItem overridePrimaryState](self, "overridePrimaryState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[HUIncludedContextItem overridePrimaryState](self, "overridePrimaryState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, *v17);

  }
  v27 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "futureWithResult:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (NSNumber)overrideHiddenState
{
  return self->_overrideHiddenState;
}

- (void)setOverrideHiddenState:(id)a3
{
  objc_storeStrong((id *)&self->_overrideHiddenState, a3);
}

- (NSNumber)overridePrimaryState
{
  return self->_overridePrimaryState;
}

- (void)setOverridePrimaryState:(id)a3
{
  objc_storeStrong((id *)&self->_overridePrimaryState, a3);
}

- (unint64_t)contextType
{
  return self->_contextType;
}

- (HFHomeKitObject)homeKitObject
{
  return self->_homeKitObject;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_homeKitObject, 0);
  objc_storeStrong((id *)&self->_overridePrimaryState, 0);
  objc_storeStrong((id *)&self->_overrideHiddenState, 0);
}

@end
