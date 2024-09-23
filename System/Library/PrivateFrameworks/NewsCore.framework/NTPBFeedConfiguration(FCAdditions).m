@implementation NTPBFeedConfiguration(FCAdditions)

+ (id)feedConfigurationFromDict:()FCAdditions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D626C8]);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("limitOnePerHourFeedID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFreeAFeedID:", v5);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("limitTwelvePerHourFeedID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFreeBFeedID:", v6);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("everythingFeedID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFreeCFeedID:", v7);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("paidLimitOnePerHourFeedID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPaidAFeedID:", v8);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("paidLimitTwelvePerHourFeedID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPaidBFeedID:", v9);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("paidEverythingFeedID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPaidCFeedID:", v10);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)feedConfigurationFromJSON:()FCAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionaryFromJSON:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "feedConfigurationFromDict:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)feedIDForBin:()FCAdditions paid:
{
  void *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't get feed ID for unknown bin"));
        v10 = 136315906;
        v11 = "-[NTPBFeedConfiguration(FCAdditions) feedIDForBin:paid:]";
        v12 = 2080;
        v13 = "NTPBFeedConfiguration+FCAdditions.m";
        v14 = 1024;
        v15 = 56;
        v16 = 2114;
        v17 = v7;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

      }
      goto LABEL_16;
    case 1:
      if ((a4 & 1) != 0)
      {
        objc_msgSend(a1, "paidAFeedID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          return v8;
      }
      else
      {
        objc_msgSend(a1, "freeAFeedID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          return v8;
      }
      goto LABEL_16;
    case 2:
      if ((a4 & 1) != 0)
      {
        objc_msgSend(a1, "paidBFeedID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          return v8;
      }
      else
      {
        objc_msgSend(a1, "freeBFeedID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          return v8;
      }
LABEL_16:
      objc_msgSend(a1, "feedIDForBin:paid:", FCNextHigherVolumeFeedBin(a3), a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    case 3:
      if ((a4 & 1) != 0)
        objc_msgSend(a1, "paidCFeedID");
      else
        objc_msgSend(a1, "freeCFeedID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    default:
      goto LABEL_16;
  }
}

@end
