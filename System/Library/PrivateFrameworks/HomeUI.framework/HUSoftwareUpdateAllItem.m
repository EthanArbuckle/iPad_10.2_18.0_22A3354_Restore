@implementation HUSoftwareUpdateAllItem

- (HUSoftwareUpdateAllItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateAllItem.m"), 19, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSoftwareUpdateAllItem init]",
    v5);

  return 0;
}

- (HUSoftwareUpdateAllItem)initWithHome:(id)a3
{
  id v5;
  HUSoftwareUpdateAllItem *v6;
  HUSoftwareUpdateAllItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSoftwareUpdateAllItem;
  v6 = -[HUSoftwareUpdateAllItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_home, a3);

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = objc_alloc(MEMORY[0x1E0D31830]);
  -[HUSoftwareUpdateAllItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithAccessories:", v6);

  v8 = objc_alloc_init(MEMORY[0x1E0D31578]);
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30B78]);

  v13 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D60]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30D58]);
  if (objc_msgSend(v7, "softwareUpdatesInProgress"))
  {
    if (objc_msgSend(v7, "softwareUpdatesInstalling"))
    {
      v22 = objc_msgSend(v7, "softwareUpdatesInstalling");
      HFLocalizedStringWithFormat();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30EA8], v22);
    }
    else
    {
      if (objc_msgSend(v7, "softwareUpdatesDownloading"))
      {
        v23 = objc_msgSend(v7, "softwareUpdatesDownloading");
        HFLocalizedStringWithFormat();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0D31830];
        objc_msgSend(v7, "accessoriesDownloadingSoftwareUpdates", v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "progressForAccessoriesDownloadingSoftwareUpdate:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30EC0]);

      }
      else if (objc_msgSend(v7, "softwareUpdatesRequested"))
      {
        v24 = objc_msgSend(v7, "softwareUpdatesRequested");
        HFLocalizedStringWithFormat();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30BD0], v24);
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30EA8], v21);
    }
  }
  else if (objc_msgSend(v7, "softwareUpdatesReadyToInstall"))
  {
    v21 = objc_msgSend(v7, "softwareUpdatesReadyToInstall");
    HFLocalizedStringWithFormat();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    v14 = 0;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30D18], v21);
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateControlTitle_UpdateAll"), CFSTR("HUSoftwareUpdateControlTitle_UpdateAll"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D30BC0]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30CF0]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateAllItem latestResults](self, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", objc_msgSend(v5, "BOOLValue"), CFSTR("hidden"), 1);

  -[HUSoftwareUpdateAllItem latestResults](self, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v8, CFSTR("title"), 1);

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
