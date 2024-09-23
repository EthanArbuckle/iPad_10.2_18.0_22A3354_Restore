@implementation DNDModeConfigurationAppForegroundTrigger(Record)

+ (uint64_t)newWithDictionaryRepresentation:()Record context:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "bs_safeDictionaryForKey:", CFSTR("applicationIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0D1D598], "newWithDictionaryRepresentation:context:", v7, v5);
    objc_msgSend(v5, "applicationIdentifierMapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationIdentifierForFileWithSourceApplicationIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("bundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", v8, 0);
  }

  objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("enabledSetting"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "unsignedIntegerValue");
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D658]), "initWithApplicationIdentifier:enabledSetting:", v10, v12);

  return v13;
}

- (id)dictionaryRepresentationWithContext:()Record
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "destination");
  if (v5)
  {
    if (v5 != 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "applicationIdentifierMapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "applicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationIdentifierForFileWithSourceApplicationIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "applicationIdentifierMapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "applicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationIdentifierForSyncWithSourceApplicationIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

LABEL_7:
  v15[0] = CFSTR("DNDModeConfigurationAppForegroundTrigger");
  v14[0] = CFSTR("class");
  v14[1] = CFSTR("applicationIdentifier");
  objc_msgSend(v9, "dictionaryRepresentationWithContext:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  v14[2] = CFSTR("enabledSetting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "enabledSetting"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
