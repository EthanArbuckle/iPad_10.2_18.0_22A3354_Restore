@implementation PSSpecifier(MusicSettingsAdditions)

- (char)music_copy
{
  char *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  objc_msgSend((id)objc_opt_class(), "specifierWithSpecifier:", a1);
  v2 = (char *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)&a1[*MEMORY[0x24BE75738]])
  {
    v3 = (int)*MEMORY[0x24BE75768];
    WeakRetained = objc_loadWeakRetained((id *)&a1[v3]);
    if (WeakRetained)
    {
      objc_initWeak(&location, WeakRetained);
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __49__PSSpecifier_MusicSettingsAdditions__music_copy__block_invoke;
      v18 = &unk_24F1339C0;
      objc_copyWeak(&v19, &location);
      v5 = (void *)MEMORY[0x22E2B4820](&v15);
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("__musicTarget"), v15, v16, v17, v18);

      objc_storeWeak((id *)&v2[v3], v2);
      v6 = (int)*MEMORY[0x24BE75750];
      v7 = *(const char **)&a1[v6];
      if (v7)
      {
        NSStringFromSelector(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("__musicGetter"));

        *(_QWORD *)&v2[v6] = sel__music_specifierGetter;
      }
      v9 = (int)*MEMORY[0x24BE75760];
      v10 = *(const char **)&a1[v9];
      if (v10)
      {
        NSStringFromSelector(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("__musicSetter"));

        *(_QWORD *)&v2[v9] = sel__music_specifierSetter_;
      }
      if (objc_msgSend(a1, "buttonAction"))
      {
        NSStringFromSelector((SEL)objc_msgSend(a1, "buttonAction"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("__musicButtonAction"));

        objc_msgSend(v2, "setButtonAction:", sel__music_specifierButtonAction_);
      }
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v2, "music_getValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("__musicCachedValue"));

  }
  return v2;
}

- (id)music_getValue
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&a1[*MEMORY[0x24BE75768]]);
  if (WeakRetained && (v3 = *(_QWORD *)&a1[*MEMORY[0x24BE75750]]) != 0)
  {
    MusicSettingsPerformSelector2(v3, WeakRetained, a1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)music_areDisplayValuesEqual:()MusicSettingsAdditions
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v25;

  v5 = a3;
  if (!v5)
    goto LABEL_6;
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MusicSettingsUtilities.m"), 52, CFSTR("Can only compare display values for the same specifier identifier"));

  }
  objc_msgSend(a1, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v9 == (void *)v10)
  {

LABEL_8:
    if (*(_QWORD *)&a1[*MEMORY[0x24BE75738]])
    {
      objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("__musicCachedValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("__musicCachedValue"));
      v17 = objc_claimAutoreleasedReturnValue();
      if (v16 != (void *)v17 && !objc_msgSend(v16, "isEqual:", v17))
      {
        v15 = 0;
        goto LABEL_16;
      }
      v18 = *MEMORY[0x24BE75AC8];
      objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BE75AC8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19 == v20;
    }
    else
    {
      v21 = *MEMORY[0x24BE75A68];
      objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v23 = objc_claimAutoreleasedReturnValue();
      if (v22 == (void *)v23)
      {
        v15 = 1;
        v16 = v22;
        goto LABEL_17;
      }
      v17 = v23;
      objc_msgSend(a1, "objectForKeyedSubscript:", v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v19, "isEqualToString:", v20);
      v16 = v22;
    }

LABEL_16:
    v22 = (void *)v17;
LABEL_17:

    goto LABEL_18;
  }
  v11 = (void *)v10;
  objc_msgSend(a1, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v14)
    goto LABEL_8;
LABEL_6:
  v15 = 0;
LABEL_18:

  return v15;
}

- (id)_music_specifierGetter
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *v6;
  SEL v7;
  void *v8;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("__musicTarget"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2 && ((*(void (**)(uint64_t))(v2 + 16))(v2), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("__musicGetter"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = NSSelectorFromString(v6);
    MusicSettingsPerformSelector2((uint64_t)v7, v5, a1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_music_specifierSetter:()MusicSettingsAdditions
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSString *v7;
  SEL v8;
  id v9;
  id v10;

  v10 = a3;
  objc_msgSend(a1, "setObject:forKeyedSubscript:");
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("__musicTarget"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("__musicSetter"));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = NSSelectorFromString(v7);
      v9 = MusicSettingsPerformSelector2((uint64_t)v8, v6, v10, a1);

    }
  }

}

- (void)_music_specifierButtonAction:()MusicSettingsAdditions
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSString *v7;
  SEL v8;
  id v9;
  id v10;

  v10 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("__musicTarget"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("__musicButtonAction"));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = NSSelectorFromString(v7);
      v9 = MusicSettingsPerformSelector2((uint64_t)v8, v6, v10, 0);

    }
  }

}

@end
