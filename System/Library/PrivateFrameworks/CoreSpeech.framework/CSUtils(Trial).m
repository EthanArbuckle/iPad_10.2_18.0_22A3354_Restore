@implementation CSUtils(Trial)

+ (uint64_t)getAssetTypeForNamespace:()Trial
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  int v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", 322);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", 404);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if (v8)
      v6 = 4;
    else
      v6 = 0;
  }

  return v6;
}

+ (void)getTrialIdsForAssetType:()Trial withCompletion:
{
  void (**v5)(id, uint64_t, void *);
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (a3 == 3)
  {
    v6 = 114;
    v7 = 322;
  }
  else if (a3 == 4)
  {
    v6 = 117;
    v7 = 404;
  }
  else
  {
    v8 = *MEMORY[0x1E0D18F60];
    v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
    v7 = 0;
    v6 = 0;
    if (v9)
    {
      v11 = 136315394;
      v12 = "+[CSUtils(Trial) getTrialIdsForAssetType:withCompletion:]";
      v13 = 2050;
      v14 = a3;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Unknown namespaceId for assetType %{public}lu ", (uint8_t *)&v11, 0x16u);
      v7 = 0;
      v6 = 0;
    }
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6, v10);

  }
}

@end
