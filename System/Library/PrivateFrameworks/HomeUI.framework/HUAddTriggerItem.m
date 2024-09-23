@implementation HUAddTriggerItem

- (HUAddTriggerItem)initWithHome:(id)a3 mode:(unint64_t)a4
{
  id v7;
  HUAddTriggerItem *v8;
  HUAddTriggerItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUAddTriggerItem;
  v8 = -[HUAddTriggerItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    v9->_mode = a4;
  }

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  _BOOL8 v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  objc_class *v8;
  __CFString *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[6];
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v4 = -[HUAddTriggerItem _itemisHidden](self, "_itemisHidden", a3);
  v5 = -[HUAddTriggerItem mode](self, "mode");
  v6 = CFSTR("HUMacToolbarAddMenuAutomation");
  if (!v5)
    v6 = CFSTR("HUTriggerListAddTriggerButtonTitle");
  v7 = (void *)MEMORY[0x1E0D519C0];
  v8 = (objc_class *)MEMORY[0x1E0D314B8];
  v9 = v6;
  v10 = [v8 alloc];
  v11 = *MEMORY[0x1E0D30D20];
  v26[0] = v9;
  v12 = *MEMORY[0x1E0D30D18];
  v25[0] = v11;
  v25[1] = v12;
  _HULocalizedStringWithDefaultValue(v9, v9, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v13;
  v25[2] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D30D50];
  v26[2] = v14;
  v26[3] = MEMORY[0x1E0C9AAB0];
  v16 = *MEMORY[0x1E0D30B80];
  v25[3] = v15;
  v25[4] = v16;
  v17 = (void *)MEMORY[0x1E0C99E60];
  -[HUAddTriggerItem home](self, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v19;
  v25[5] = *MEMORY[0x1E0D30B78];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v10, "initWithResults:", v21);
  objc_msgSend(v7, "futureWithResult:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)_itemisHidden
{
  void *v3;
  char v4;
  unint64_t v5;
  char v6;
  void *v7;
  char v8;

  -[HUAddTriggerItem home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_hasAnyVisibleTriggers");

  v5 = -[HUAddTriggerItem mode](self, "mode");
  v6 = v5 == 0;
  if (!v5 && (v4 & 1) == 0)
    v6 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  -[HUAddTriggerItem home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_userCanCreateTrigger") ^ 1 | v6;

  return v8;
}

- (Class)mapsToViewClass
{
  return (Class)objc_opt_class();
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
}

@end
