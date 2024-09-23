@implementation HUPrimaryUserAutomaticItem

- (HUPrimaryUserAutomaticItem)initWithMediaProfileContainer:(id)a3
{
  id v6;
  HUPrimaryUserAutomaticItem *v7;
  HUPrimaryUserAutomaticItem *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPrimaryUserAutomaticItem.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HUPrimaryUserAutomaticItem;
  v7 = -[HUPrimaryUserAutomaticItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_mediaProfileContainer, a3);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HUPrimaryUserAutomaticItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithMediaProfileContainer:", v5);

  objc_msgSend(v6, "copyLatestResultsFromItem:", self);
  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30D70]);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[HUPrimaryUserAutomaticItem mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v7, "isControllable") ^ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30C80]);

  v9 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUPrimaryUserSettingsAutomaticSection_Title"), CFSTR("HUPrimaryUserSettingsAutomaticSection_Title"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D18]);

  -[HUPrimaryUserAutomaticItem mediaProfileContainer](self, "mediaProfileContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hf_preferredMediaUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[HUPrimaryUserAutomaticItem mediaProfileContainer](self, "mediaProfileContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_appleMusicCurrentLoggedInAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v9 = 1;
    else
      v9 = 2;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30E20]);

  -[HUPrimaryUserAutomaticItem mediaProfileContainer](self, "mediaProfileContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hf_dependentHomeKitObjectsForDownstreamItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
