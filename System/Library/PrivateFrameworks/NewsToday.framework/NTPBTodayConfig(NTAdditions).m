@implementation NTPBTodayConfig(NTAdditions)

- (id)configByResolvingWithTag:()NTAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v5, "todayQueueConfigs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
  {
    objc_msgSend(v5, "todayQueueConfigs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "todaySectionConfigs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 == 1)
    {
      objc_msgSend(v9, "todaySectionConfigs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "sectionType") == 6)
      {
        objc_msgSend(v13, "tagTodaySectionConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTagID:", v15);

        objc_msgSend(v4, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "nameCompact");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setName:", v16);
        objc_msgSend(v13, "setCompactName:", v17);
        objc_msgSend(v4, "groupTitleColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "hex");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setNameColorLight:", v19);

        objc_msgSend(v4, "groupDarkStyleTitleColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "hex");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setNameColorDark:", v21);

        objc_msgSend(v4, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("f8+"), "stringByAppendingString:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPersonalizationFeatureID:", v23);

        if (v17)
          v24 = v17;
        else
          v24 = v16;
        objc_msgSend(v13, "setReferralBarName:", v24);
        objc_msgSend(v13, "setShownInFavoritesOnlyMode:", 1);
        v25 = v5;

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

@end
