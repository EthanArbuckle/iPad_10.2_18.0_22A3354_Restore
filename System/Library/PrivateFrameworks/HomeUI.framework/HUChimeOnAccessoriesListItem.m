@implementation HUChimeOnAccessoriesListItem

- (HUChimeOnAccessoriesListItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUChimeOnAccessoriesListItem.m"), 20, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUChimeOnAccessoriesListItem init]",
    v5);

  return 0;
}

- (HUChimeOnAccessoriesListItem)initWithHome:(id)a3
{
  id v5;
  HUChimeOnAccessoriesListItem *v6;
  HUChimeOnAccessoriesListItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUChimeOnAccessoriesListItem;
  v6 = -[HUChimeOnAccessoriesListItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v7->_accessoryIsCameraWithDoorbell = 1;
  }

  return v7;
}

- (HUChimeOnAccessoriesListItem)initWithAccessory:(id)a3
{
  id v4;
  void *v5;
  HUChimeOnAccessoriesListItem *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUChimeOnAccessoriesListItem initWithHome:](self, "initWithHome:", v5);

  if (v6)
  {
    if ((objc_msgSend(v4, "hf_isCamera") & 1) != 0)
    {
      objc_msgSend(v4, "hf_serviceOfType:", *MEMORY[0x1E0CB9A08]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_accessoryIsCameraWithDoorbell = v7 != 0;

    }
    else
    {
      v6->_accessoryIsCameraWithDoorbell = 0;
    }
  }

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = (void *)objc_opt_new();
  -[HUChimeOnAccessoriesListItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_allHomePodsOrStereoPairs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[HUChimeOnAccessoriesListItem home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hf_currentUserIsAdministrator")
    && -[HUChimeOnAccessoriesListItem accessoryIsCameraWithDoorbell](self, "accessoryIsCameraWithDoorbell"))
  {

    if (v7)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUDoorbellChimeSetting"), CFSTR("HUDoorbellChimeSetting"), 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30D18]);

      -[HUChimeOnAccessoriesListItem home](self, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hf_allHomePodsOrStereoPairsThatWillChime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      -[HUChimeOnAccessoriesListItem home](self, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hf_allSiriEndPointProfileContainersThatWillChime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count") + v12;

      -[HUChimeOnAccessoriesListItem home](self, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hf_allSiriEndPointProfileContainers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v15)
      {
        if (v15 != v18 + v7)
        {
          v24 = (void *)MEMORY[0x1E0CB37F0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "localizedStringFromNumber:numberStyle:", v25, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
        v19 = CFSTR("HUChimeOnAccessories_ValueAll");
      }
      else
      {
        v19 = CFSTR("HUChimeOnAccessories_ValueOff");
      }
      _HULocalizedStringWithDefaultValue(v19, v19, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30BF8]);
      v26 = (void *)MEMORY[0x1E0C99E20];
      -[HUChimeOnAccessoriesListItem home](self, "home");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "hf_homePods");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setWithArray:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D30B80]);

      v30 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "futureWithResult:", v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  v20 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "futureWithResult:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v22;
}

- (HMHome)home
{
  return self->_home;
}

- (BOOL)accessoryIsCameraWithDoorbell
{
  return self->_accessoryIsCameraWithDoorbell;
}

- (void)setAccessoryIsCameraWithDoorbell:(BOOL)a3
{
  self->_accessoryIsCameraWithDoorbell = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
}

@end
