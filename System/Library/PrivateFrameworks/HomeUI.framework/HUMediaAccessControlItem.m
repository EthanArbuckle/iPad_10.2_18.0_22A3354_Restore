@implementation HUMediaAccessControlItem

- (HUMediaAccessControlItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMediaAccessControlItem.m"), 24, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUMediaAccessControlItem init]",
    v5);

  return 0;
}

- (HUMediaAccessControlItem)initWithHome:(id)a3
{
  id v5;
  HUMediaAccessControlItem *v6;
  HUMediaAccessControlItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUMediaAccessControlItem;
  v6 = -[HUMediaAccessControlItem init](&v9, sel_init);
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
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;

  v4 = (void *)objc_opt_new();
  -[HUMediaAccessControlItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_accessControlDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31530], "mediaContainerSymbolConfiguration");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v7;
  objc_msgSend(v8, "configurationByApplyingConfiguration:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:", CFSTR("tv.and.hifispeaker.fill.fill"));
  objc_opt_class();
  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "imageIconDescriptorWithUpdatedImageSymbolConfiguration:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30C60]);

  -[HUMediaAccessControlItem home](self, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessories");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "na_any:", &__block_literal_global_129);

  if (v6
    && v17
    && (-[HUMediaAccessControlItem home](self, "home"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "hf_currentUserIsAdministrator"),
        v18,
        (v19 & 1) != 0))
  {
    HFLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.HomeSettings.SpeakersAndTV"), *MEMORY[0x1E0D30BA0]);
    objc_msgSend(v6, "access");
    NSLocalizedStringFromHFMediaAccessControlClassification();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30BF8]);

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D50]);
  v22 = (void *)MEMORY[0x1E0C99E60];
  -[HUMediaAccessControlItem home](self, "home");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithObject:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

BOOL __56__HUMediaAccessControlItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_mediaAccessControlCapabilities") != 0;
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
