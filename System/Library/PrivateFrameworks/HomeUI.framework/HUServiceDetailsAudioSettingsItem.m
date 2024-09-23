@implementation HUServiceDetailsAudioSettingsItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsAudioSettingsLabel"), CFSTR("HUServiceDetailsAudioSettingsLabel"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30D18]);

  if (-[HUServiceDetailsAbstractItem isMediaAccessoryGroup](self, "isMediaAccessoryGroup")
    && (-[HUServiceDetailsAbstractItem home](self, "home"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hf_currentUserIsAdministrator"),
        v6,
        (v7 & 1) != 0))
  {
    -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30970]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF347468))
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = objc_msgSend(v12, "hf_showsAudioSettings");

    objc_msgSend(v13, "numberWithInt:", v14 ^ 1u);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30C80]);

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  v16 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "futureWithResult:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
