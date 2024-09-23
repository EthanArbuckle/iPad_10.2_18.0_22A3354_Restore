@implementation MOEventBundleMetaDataUtility

+ (void)defineClassCollections
{
  if (defineClassCollections_onceToken != -1)
    dispatch_once(&defineClassCollections_onceToken, &__block_literal_global_4);
}

void __54__MOEventBundleMetaDataUtility_defineClassCollections__block_invoke()
{
  void *v0;
  void *v1;

  v0 = (void *)noSavoringPromptLabels;
  noSavoringPromptLabels = (uint64_t)&unk_1E855DF78;

  v1 = (void *)noReappraisalPromptLabels;
  noReappraisalPromptLabels = (uint64_t)&unk_1E855DF90;

}

+ (id)buildMetaDataForEventBundle:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = 0;
  switch(objc_msgSend(v3, "interfaceType"))
  {
    case 1:
      +[MOEventBundleMetaDataUtility buildActivityMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildActivityMetaDataForEventBundle:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 2:
      +[MOEventBundleMetaDataUtility buildOutingMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildOutingMetaDataForEventBundle:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 4:
      +[MOEventBundleMetaDataUtility buildSignificantContactMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildSignificantContactMetaDataForEventBundle:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 5:
      +[MOEventBundleMetaDataUtility buildMediaPlayMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildMediaPlayMetaDataForEventBundle:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 6:
      +[MOEventBundleMetaDataUtility buildSharedContentMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildSharedContentMetaDataForEventBundle:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 7:
      +[MOEventBundleMetaDataUtility buildTimeAtHomeMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildTimeAtHomeMetaDataForEventBundle:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 9:
      +[MOEventBundleMetaDataUtility buildTrendMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildTrendMetaDataForEventBundle:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 10:
      +[MOEventBundleMetaDataUtility buildPhotoMemoryMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildPhotoMemoryMetaDataForEventBundle:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 11:
      +[MOEventBundleMetaDataUtility buildEvergreenMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildEvergreenMetaDataForEventBundle:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 12:
      if (objc_msgSend(v3, "bundleSubType") == 205 || objc_msgSend(v3, "bundleSubType") == 206)
      {
        +[MOEventBundleMetaDataUtility buildTimeContextTransitMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildTimeContextTransitMetaDataForEventBundle:", v3);
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[MOEventBundleMetaDataUtility buildTimeContextMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildTimeContextMetaDataForEventBundle:", v3);
        v5 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_18;
    case 13:
      +[MOEventBundleMetaDataUtility buildTripMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildTripMetaDataForEventBundle:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 14:
      +[MOEventBundleMetaDataUtility buildStateOfMindMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildStateOfMindMetaDataForEventBundle:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 15:
      +[MOEventBundleMetaDataUtility buildClusteringMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildClusteringMetaDataForEventBundle:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v4 = (void *)v5;
      if (v5)
        +[MOEventBundleMetaDataUtility appendDefaultMetaData:](MOEventBundleMetaDataUtility, "appendDefaultMetaData:", v5);
      break;
    default:
      break;
  }

  return v4;
}

+ (void)appendDefaultMetaData:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[MOEventBundleLabelLocalizer preferredLocalization](MOEventBundleLabelLocalizer, "preferredLocalization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("language"));

}

+ (id)buildActivityMetaDataForEventBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForActivityAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityAction:metaData:", v6, v4);

  }
  objc_msgSend(v3, "concurrentMediaAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "concurrentMediaAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForActivityConcurrentMediaAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityConcurrentMediaAction:metaData:", v8, v4);

  }
  objc_msgSend(v3, "places");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    if (objc_msgSend(v3, "bundleSubType") == 204 || objc_msgSend(v3, "bundleSubType") == 207)
    {

LABEL_9:
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v3, "places", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v16, "placeName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
              +[MOEventBundleMetaDataUtility setMetaDataForActivityPlace:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityPlace:metaData:", v16, v4);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v13);
      }

      goto LABEL_22;
    }
    v18 = objc_msgSend(v3, "bundleSubType");

    if (v18 == 208)
      goto LABEL_9;
  }
  objc_msgSend(v3, "place");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v3, "place");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForActivityPlace:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityPlace:metaData:", v20, v4);

  }
LABEL_22:
  objc_msgSend(v3, "time");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v3, "time");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v22, v23, v24, v4);

  }
  objc_msgSend(v3, "persons");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v3, "persons");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suggestionID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v26, v27, v4);

  }
  return v4;
}

+ (id)buildOutingMetaDataForEventBundle:(id)a3
{
  id v3;
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
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("actionType"), 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "actions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "filteredArrayUsingPredicate:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "actionName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }
  objc_msgSend(v3, "action");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v3, "action");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "actionType") == 9)
    {

    }
    else
    {
      objc_msgSend(v3, "action");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "actionType");

      if (v16 != 10)
        goto LABEL_13;
    }
    objc_msgSend(v3, "action");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionName");
    v18 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v18;
  }
LABEL_13:
  if (v5)
  {
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("action"));

    objc_msgSend((id)objc_opt_class(), "keywordFromString:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("action_type"));

  }
  objc_msgSend(v3, "action");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    objc_msgSend(v3, "action");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "actionType");

    if (v24 == 11)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("flight"), CFSTR("flight"));
  }
  objc_msgSend(v3, "action");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEventBundleMetaDataUtility setMetaDataForDiningAction:metaData:startDate:endDate:](MOEventBundleMetaDataUtility, "setMetaDataForDiningAction:metaData:startDate:endDate:", v25, v4, v26, v27);

  objc_msgSend(v3, "place");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEventBundleMetaDataUtility setMetaDataForPlace:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlace:metaData:", v28, v4);

  objc_msgSend(v3, "persons");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestionID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v29, v30, v4);

  objc_msgSend(v3, "time");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v31, v32, v33, v4);

  return v4;
}

+ (id)buildSharedContentMetaDataForEventBundle:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = [v3 alloc];
  v11 = CFSTR("default_label");
  objc_msgSend(v4, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "actionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithDictionary:", v8);

  return v9;
}

+ (id)buildTimeAtHomeMetaDataForEventBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("default_label"));

  objc_msgSend(v3, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Hosting at Home"));

  if (v9)
    v10 = &unk_1E855DAB8;
  else
    v10 = &unk_1E855DAD0;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("home_activity"));
  objc_msgSend(v3, "persons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "persons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suggestionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v12, v13, v4);

  }
  objc_msgSend(v3, "resources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEventBundleMetaDataUtility setMetaDataForPhotos:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPhotos:metaData:", v14, v4);

  objc_msgSend(v3, "time");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v15, v16, v17, v4);

  return v4;
}

+ (id)buildSignificantContactMetaDataForEventBundle:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v3 = a3;
  objc_msgSend(v3, "action");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "persons");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(v3, "summarizationGranularity");

      if (v8 != 2)
      {
        v9 = (void *)objc_opt_new();
        objc_msgSend(v3, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "persons");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "actionName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          objc_msgSend(v14, "stringByAppendingString:", v13);
          v16 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v16;
        }
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("default_label"));
        objc_msgSend(v10, "actionName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("header"));

        objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("title"));
        objc_msgSend(v10, "actionName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("action"));

        v21 = (void *)objc_opt_class();
        objc_msgSend(v10, "actionName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "keywordFromString:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("action_type"));

        objc_msgSend(v3, "persons");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "suggestionID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v24, v25, v9);

        objc_msgSend(v3, "time");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "startDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "endDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v26, v27, v28, v9);

        goto LABEL_12;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v3, "summarizationGranularity") == 2 && (objc_msgSend(v3, "isAggregatedAndSuppressed") & 1) == 0)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("contact_summary"), CFSTR("summary_type"));
    objc_msgSend(v3, "persons");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suggestionID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v29, v30, v9);

    objc_msgSend(v3, "time");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v10, v13, v15, v9);
LABEL_12:

    goto LABEL_13;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

+ (id)buildMediaPlayMetaDataForEventBundle:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  void *v79;
  char v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  char v86;
  uint64_t v87;
  void *v88;

  v3 = a3;
  objc_msgSend(v3, "action");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "resources");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(v3, "summarizationGranularity");

      if (v8 != 2)
      {
        v84 = MEMORY[0x1D1798EEC]();
        v9 = (void *)objc_opt_new();
        objc_msgSend(v3, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "resources");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "getDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("media_album"));
        v87 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "actionName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: %@"), v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("default_label"));
        objc_msgSend(v10, "actionName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("header"));

        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, CFSTR("title"));

        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "resources");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("media_event_count"));

        objc_msgSend(v12, "getDictionary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v85 = v27;
        if ((objc_msgSend(v27, "isEqual:", MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum) & 1) != 0
          || (objc_msgSend(v27, "isEqual:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist) & 1) != 0
          || objc_msgSend(v27, "isEqual:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum))
        {
          v28 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v3, "events");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("media_event_count"));

        }
        objc_msgSend(v12, "getDictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("media_type"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v32, CFSTR("media_type"));

        objc_msgSend(v9, "setObject:forKeyedSubscript:", v87, CFSTR("media_album"));
        objc_msgSend(v3, "time");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "startDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "endDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v33, v34, v35, v9);

        objc_msgSend(v10, "actionName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v36, "isEqualToString:", CFSTR("songs_on_repeat")) & 1) == 0)
        {
          objc_msgSend(v10, "actionName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v37, "isEqualToString:", CFSTR("song_on_repeat")))
          {
            objc_msgSend(v10, "actionName");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = objc_msgSend(v79, "isEqualToString:", CFSTR("media_on_repeat"));

            if ((v80 & 1) == 0)
              goto LABEL_13;
            goto LABEL_12;
          }

        }
LABEL_12:
        objc_msgSend(v10, "actionName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v38, CFSTR("media_on_repeat"));

LABEL_13:
        objc_msgSend(v10, "actionName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("media_on_repeat_third_party"));

        v41 = (void *)v84;
        if (v40)
        {
          objc_msgSend(v10, "actionName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v42, CFSTR("media_on_repeat_third_party"));

        }
        objc_msgSend(v10, "actionName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("played_media_sessions"));

        if (v44)
        {
          objc_msgSend(v10, "actionName");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v45, CFSTR("played_media_sessions"));

        }
        objc_msgSend(v10, "actionName");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v46, CFSTR("action"));

        v47 = (void *)objc_opt_class();
        objc_msgSend(v10, "actionName");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "keywordFromString:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v49, CFSTR("action_type"));

        objc_msgSend(v12, "getDictionary");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("third_party_dominate_value"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v51, CFSTR("third_party_dominate_value"));

        v52 = (void *)v87;
LABEL_34:

        objc_autoreleasePoolPop(v41);
        goto LABEL_35;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v3, "summarizationGranularity") == 2 && (objc_msgSend(v3, "isAggregatedAndSuppressed") & 1) == 0)
  {
    v41 = (void *)MEMORY[0x1D1798EEC]();
    v9 = (void *)objc_opt_new();
    objc_msgSend(v3, "resources");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("media_summary"), CFSTR("summary_type"));
    v54 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "resources");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "numberWithUnsignedInteger:", objc_msgSend(v55, "count"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v56, CFSTR("media_event_count"));

    objc_msgSend(v3, "resources");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "firstObject");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "getDictionary");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "isEqual:", MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum) & 1) != 0
      || (objc_msgSend(v12, "isEqual:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist) & 1) != 0
      || objc_msgSend(v12, "isEqual:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum))
    {
      v60 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "events");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "numberWithUnsignedInteger:", objc_msgSend(v61, "count"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v62, CFSTR("media_event_count"));

    }
    objc_msgSend(v3, "resources");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "firstObject");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "getDictionary");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("media_type"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v66, CFSTR("media_type"));

    objc_msgSend(v3, "action");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "actionName");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v68, "isEqualToString:", CFSTR("songs_on_repeat")) & 1) == 0)
    {
      objc_msgSend(v3, "action");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "actionName");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v70, "isEqualToString:", CFSTR("song_on_repeat")) & 1) == 0)
      {
        objc_msgSend(v3, "action");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "actionName");
        v88 = v12;
        v82 = v41;
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v83, "isEqualToString:", CFSTR("media_on_repeat"));

        v41 = v82;
        v12 = v88;

        if ((v86 & 1) == 0)
          goto LABEL_31;
        goto LABEL_30;
      }

    }
LABEL_30:
    objc_msgSend(v3, "action");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "actionName");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v72, CFSTR("media_on_repeat"));

LABEL_31:
    objc_msgSend(v3, "action");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "actionName");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "isEqualToString:", CFSTR("media_on_repeat_third_party"));

    if (v75)
    {
      objc_msgSend(v3, "action");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "actionName");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v77, CFSTR("media_on_repeat_third_party"));

    }
    objc_msgSend(v10, "getDictionary");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("third_party_dominate_value"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("third_party_dominate_value"));
    goto LABEL_34;
  }
  v9 = 0;
LABEL_35:

  return v9;
}

+ (id)buildPhotoMemoryMetaDataForEventBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "resources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v4 = (void *)objc_opt_new();
      objc_msgSend(v3, "action");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Memories from Photos"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "actionName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (v9 >= 2)
      {
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("default_label"));
        objc_msgSend(v6, "actionName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

      }
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

+ (id)buildTrendMetaDataForEventBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "category");

  if (v7 == 10)
  {
    objc_msgSend(v3, "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "actionName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("default_label"));
    objc_msgSend(v8, "actionName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("header"));

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("title"));
    objc_msgSend(v8, "actionName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("action"));

    v18 = (void *)objc_opt_class();
    objc_msgSend(v8, "actionName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keywordFromString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("action_type"));

    objc_msgSend(v3, "persons");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suggestionID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v21, v22, v4);

  }
  return v4;
}

+ (id)buildEvergreenMetaDataForEventBundle:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(a3, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v8, "type") == 9)
        {
          v26 = v3;
          v9 = (void *)objc_opt_new();
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", CFSTR("EVERGREEN_LABEL"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("default_label"));

          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("evergreen_type"), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v9;
          +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", CFSTR("evergreen_type"), v13, v14, v9);

          _mo_log_facility_get_os_log(MOLogFacilityFramework);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            +[MOEventBundleMetaDataUtility buildEvergreenMetaDataForEventBundle:].cold.2(v8);

          v16 = objc_msgSend(v8, "promptCount");
          if (v16)
          {
            for (j = 0; j != v16; ++j)
            {
              objc_msgSend(v8, "promptIndexes");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectAtIndex:", j);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("evergreen_slot_"), j);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, v20);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("evergreen_index"), objc_msgSend(v19, "intValue"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "stringValue");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", v20, v21, v22, v27);

              }
            }
          }
          objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1E855DAE8, CFSTR("shuffle_mode"));
          _mo_log_facility_get_os_log(MOLogFacilityFramework);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            +[MOEventBundleMetaDataUtility buildEvergreenMetaDataForEventBundle:].cold.2(v8);

          _mo_log_facility_get_os_log(MOLogFacilityFramework);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            +[MOEventBundleMetaDataUtility buildEvergreenMetaDataForEventBundle:].cold.1(v8, v16, v24);

          v3 = v26;
          goto LABEL_22;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v5)
        continue;
      break;
    }
  }
  v27 = 0;
LABEL_22:

  return v27;
}

+ (id)buildTimeContextMetaDataForEventBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  NSObject *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "actionType");

  objc_msgSend(v3, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == 4)
    +[MOEventBundleMetaDataUtility setMetaDataForActivityAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityAction:metaData:", v7, v4);
  else
    +[MOEventBundleMetaDataUtility setMetaDataForAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForAction:metaData:", v7, v4);

  objc_msgSend(v3, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "actions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForActions:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActions:metaData:", v9, v4);

  }
  objc_msgSend(v3, "place");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v3, "place");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForPlace:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlace:metaData:", v11, v4);

  }
  objc_msgSend(v3, "places");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v3, "places");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForPlaces:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlaces:metaData:", v13, v4);

  }
  objc_msgSend(v3, "time");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v3, "time");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v15, v16, v17, v4);

  }
  objc_msgSend(v3, "persons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v3, "persons");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suggestionID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v19, v20, v4);

  }
  objc_msgSend(v3, "action");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "actionType") != 4)
    goto LABEL_17;
  objc_msgSend(v3, "concurrentMediaAction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v3, "concurrentMediaAction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForActivityConcurrentMediaAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityConcurrentMediaAction:metaData:", v21, v4);
LABEL_17:

  }
  if (objc_msgSend(v3, "bundleSubType") == 202
    && objc_msgSend(v3, "summarizationGranularity") == 2
    && (objc_msgSend(v3, "isAggregatedAndSuppressed") & 1) == 0)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("workout_summary"), CFSTR("summary_type"));
  }
  _mo_log_facility_get_os_log(MOLogFacilitySummarization);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412546;
    v28 = v24;
    v29 = 2112;
    v30 = v25;
    _os_log_impl(&dword_1CAE42000, v23, OS_LOG_TYPE_INFO, "build meta for time context bundle, bundle startDate, %@, metaData, %@", (uint8_t *)&v27, 0x16u);

  }
  return v4;
}

+ (id)buildTimeContextTransitMetaDataForEventBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForActivityAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityAction:metaData:", v6, v4);

  }
  objc_msgSend(v3, "places");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "places");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForPlaces:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlaces:metaData:", v8, v4);

  }
  objc_msgSend(v3, "time");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "time");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v10, v11, v12, v4);

  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("transit_summary"), CFSTR("summary_type"));
  objc_msgSend(v3, "places");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "placeType") == 2 || objc_msgSend(v14, "placeType") == 3)
    && objc_msgSend(v14, "placeType") != 4
    && objc_msgSend(v14, "placeType") != 5
    && objc_msgSend(v14, "proposition") != 4)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("destination_format"));
  }

  return v4;
}

+ (id)buildTripMetaDataForEventBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  __CFString **v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "actionType");

  if (v6 == 2)
  {
    objc_msgSend(v3, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForAction:metaData:", v7, v4);

  }
  objc_msgSend(v3, "place");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "place");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForPlace:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlace:metaData:", v9, v4);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("placeType"), &unk_1E855DFA8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "places");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredArrayUsingPredicate:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "place");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "placeNameConfidence");
    v15 = v14;

    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      v16 = &kMOLabelFormatterMetaKeywordSingleDominantPlace;
      if (v15 < 0.8)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "placeNameConfidence");
        v19 = v18;
        objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "placeNameConfidence");
        v22 = v19 + v21;

        v16 = &kMOLabelFormatterMetaKeywordDoubleDominantPlaces;
        if (v22 < 0.8)
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("many_places"));
          if (v15 >= 0.4)
            v16 = &kMOLabelFormatterMetaKeywordSingleDominantPlace;
        }
      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("YES"), *v16);
      +[MOEventBundleMetaDataUtility setMetaDataForPlaces:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlaces:metaData:", v12, v4);
    }

  }
  objc_msgSend(v3, "time");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v3, "time");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v24, v25, v26, v4);

  }
  objc_msgSend(v3, "persons");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v3, "persons");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suggestionID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v28, v29, v4);

  }
  return v4;
}

+ (id)buildClusteringMetaDataForEventBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "getSubTypeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("cluster_subtype"));

  objc_msgSend(v3, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "actionType");

  objc_msgSend(v3, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 4)
    +[MOEventBundleMetaDataUtility setMetaDataForActivityAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityAction:metaData:", v8, v4);
  else
    +[MOEventBundleMetaDataUtility setMetaDataForAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForAction:metaData:", v8, v4);

  objc_msgSend(v3, "place");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "place");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForPlace:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlace:metaData:", v10, v4);

  }
  objc_msgSend(v3, "time");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "time");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v12, v13, v14, v4);

  }
  return v4;
}

+ (id)buildStateOfMindMetaDataForEventBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  int v44;
  void *v45;
  char v46;
  void *v47;
  char v48;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[MOEventBundleMetaDataUtility defineClassCollections](MOEventBundleMetaDataUtility, "defineClassCollections");
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "time");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v6, v7, v8, v4);

  }
  if (objc_msgSend(v3, "bundleSubType") == 802)
    v9 = CFSTR("momentary_emotion");
  else
    v9 = CFSTR("daily_mood");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("reflective_interval"));
  objc_msgSend(v3, "action");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "actionSubtype");

  v12 = v11 - 1;
  if ((unint64_t)(v11 - 1) <= 6)
  {
    v13 = off_1E8541E78[v12];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", off_1E8541E40[v12], CFSTR("valence_classification_granular"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("valence_classification"));
  }
  objc_msgSend(v3, "action");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionMetaData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataAppName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "action");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionMetaData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataAppName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("state_of_mind_app_name"));

  }
  objc_msgSend(v3, "metaDataForRank");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("StateOfMindLabels"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("state_of_mind_label_count"));

  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "intValue");

    HKUILocalizedStringForStateOfMindLabel();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lowercaseString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("state_of_mind_label_1"));

  }
  if ((unint64_t)objc_msgSend(v21, "count") >= 2)
  {
    objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "intValue");

    HKUILocalizedStringForStateOfMindLabel();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lowercaseString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("state_of_mind_label_2"));

  }
  v31 = v4;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v21;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v52 != v34)
          objc_enumerationMutation(obj);
        v36 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v3, "action");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "actionSubtype") == 2)
        {
          v38 = objc_msgSend((id)noSavoringPromptLabels, "containsObject:", v36);

          if (v38)
            goto LABEL_27;
        }
        else
        {
          objc_msgSend(v3, "action");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v39, "actionSubtype") == 3)
          {
            v40 = objc_msgSend((id)noSavoringPromptLabels, "containsObject:", v36);

            if ((v40 & 1) != 0)
              goto LABEL_27;
          }
          else
          {
            objc_msgSend(v3, "action");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v41, "actionSubtype") == 4)
            {
              v42 = objc_msgSend((id)noSavoringPromptLabels, "containsObject:", v36);

              if ((v42 & 1) == 0)
                goto LABEL_29;
LABEL_27:
              objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("Yes"), CFSTR("no_savoring_prompt"));
              goto LABEL_29;
            }

          }
        }
LABEL_29:
        objc_msgSend(v3, "action");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v43, "actionSubtype") == 5)
        {
          v44 = objc_msgSend((id)noReappraisalPromptLabels, "containsObject:", v36);

          if (v44)
            goto LABEL_37;
        }
        else
        {
          objc_msgSend(v3, "action");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v45, "actionSubtype") == 6)
          {
            v46 = objc_msgSend((id)noReappraisalPromptLabels, "containsObject:", v36);

            if ((v46 & 1) != 0)
              goto LABEL_37;
          }
          else
          {
            objc_msgSend(v3, "action");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v47, "actionSubtype") == 7)
            {
              v48 = objc_msgSend((id)noReappraisalPromptLabels, "containsObject:", v36);

              if ((v48 & 1) == 0)
                continue;
LABEL_37:
              objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("Yes"), CFSTR("no_reappraisal_prompt"));
              continue;
            }

          }
        }
      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v33);
  }

  return v31;
}

+ (void)setMetaDataForAction:(id)a3 metaData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3)
  {
    v5 = a4;
    v6 = a3;
    objc_msgSend(v6, "actionName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("action"));

    v9 = (void *)objc_opt_class();
    objc_msgSend(v6, "actionName");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "keywordFromString:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("action_type"));

  }
}

+ (void)setMetaDataForDiningAction:(id)a3 metaData:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (v21)
  {
    objc_msgSend(v21, "actionName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("action"));

    v14 = (void *)objc_opt_class();
    objc_msgSend(v21, "actionName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keywordFromString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("action_type"));

    if (objc_msgSend(v21, "actionType") == 10)
    {
      v17 = +[MOTime mealtagFromStartDate:endDate:](MOTime, "mealtagFromStartDate:endDate:", v10, v11);
      if (v17 - 2000 <= 2)
      {
        +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("meal_type"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", CFSTR("meal_type"), v19, v20, v9);

        }
      }
    }
  }

}

+ (void)setMetaDataForActions:(id)a3 metaData:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  unsigned int v41;
  id obj;
  uint64_t v43;
  unsigned int v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v46 = (void *)objc_opt_new();
    v7 = objc_opt_new();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v40 = v5;
    obj = v5;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    v45 = (void *)v7;
    v8 = 0;
    if (v47)
    {
      v44 = 0;
      v41 = 0;
      LODWORD(v9) = 0;
      v43 = *(_QWORD *)v51;
      v48 = 1;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v51 != v43)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("action_"), v48 + i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("action_type"), v48 + i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "actionType") == 4)
          {
            objc_msgSend(v11, "actionName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[MOEventBundleMetaDataUtility setActivityNameFromActionName:metaData:keyword:keywordType:](MOEventBundleMetaDataUtility, "setActivityNameFromActionName:metaData:keyword:keywordType:", v14, v6, v12, v13);
          }
          else
          {
            objc_msgSend(v11, "actionName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v12);

            v17 = (void *)objc_opt_class();
            objc_msgSend(v11, "actionName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "keywordFromString:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, v13);

          }
          if (objc_msgSend(v11, "actionType") == 4)
            LODWORD(v9) = v9 + 1;
          v49 = v9;
          if (objc_msgSend(v11, "actionType") == 2)
            v19 = (v8 + 1);
          else
            v19 = v8;
          objc_msgSend(v11, "actionName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v45, "containsObject:", v20);

          if ((v21 & 1) == 0)
          {
            v22 = v6;
            objc_msgSend(v11, "actionName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v23);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("unique_action_"), objc_msgSend(v45, "count"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("unique_action_type"), objc_msgSend(v45, "count"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "actionType") == 4)
            {
              objc_msgSend(v11, "actionName");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              +[MOEventBundleMetaDataUtility setActivityNameFromActionName:metaData:keyword:keywordType:](MOEventBundleMetaDataUtility, "setActivityNameFromActionName:metaData:keyword:keywordType:", v26, v6, v24, v25);

              ++v41;
            }
            else
            {
              objc_msgSend(v11, "actionName");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v24);

              v29 = (void *)objc_opt_class();
              objc_msgSend(v11, "actionName");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "keywordFromString:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v31, v25);

              v6 = v22;
            }

          }
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", objc_msgSend(v11, "actionType"));
          v33 = objc_msgSend(v46, "containsObject:", v32);

          if ((v33 & 1) == 0)
          {
            ++v44;
            v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", objc_msgSend(v11, "actionType"));
            objc_msgSend(v46, "addObject:", v34);

          }
          v8 = v19;
          v9 = v49;
        }
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
        v48 = (v48 + i);
      }
      while (v47);
    }
    else
    {
      v44 = 0;
      v41 = 0;
      v9 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("action_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("activity_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v44);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("unique_action_type_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v41);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, CFSTR("unique_activity_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("visit_count"));

    v5 = v40;
  }

}

+ (void)setActivityNameFromActionName:(id)a3 metaData:(id)a4 keyword:(id)a5 keywordType:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int IsValid;
  void *v16;
  __CFString *v17;
  char v18;
  id v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(a5, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_CapitalizedStringForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v9;
  v14 = objc_msgSend(MEMORY[0x1E0CB6DD0], "_workoutActivityTypeFromString:", v27);
  IsValid = _HKWorkoutActivityTypeIsValid();
  v16 = v27;
  if (IsValid)
  {
    HKUILocalizedWorkoutTypeName();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[MOEventBundleLabelLocalizer _Moments_LowercaseNounForKey:](MOEventBundleLabelLocalizer, "_Moments_LowercaseNounForKey:", v16);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v18 = 1;
  if (v14 > 36)
  {
    v25 = 0;
    switch(v14)
    {
      case '-':
        v19 = v11;
        v20 = v13;
        v25 = 0;
        v21 = CFSTR("surfing");
        goto LABEL_22;
      case '.':
        v19 = v11;
        v20 = v13;
        v25 = 0;
        v21 = CFSTR("swim");
        goto LABEL_22;
      case '/':
      case '0':
      case '2':
      case '3':
        goto LABEL_23;
      case '1':
        v19 = v11;
        v20 = v13;
        v18 = 0;
        v25 = CFSTR("Track and Field");
        v21 = CFSTR("track and field");
        goto LABEL_22;
      case '4':
        v19 = v11;
        v20 = v13;
        v25 = 0;
        v21 = CFSTR("walk");
        goto LABEL_22;
      default:
        if (v14 == 37)
        {
          v19 = v11;
          v20 = v13;
          v25 = 0;
          v21 = CFSTR("run");
        }
        else
        {
          if (v14 != 63)
            goto LABEL_31;
          v19 = v11;
          v20 = v13;
          v25 = 0;
          v21 = CFSTR("HIIT");
        }
        break;
    }
    goto LABEL_22;
  }
  if (v14 > 23)
  {
    if (v14 == 24)
    {
      v19 = v11;
      v20 = v13;
      v25 = 0;
      v21 = CFSTR("hike");
    }
    else
    {
      if (v14 != 29)
      {
LABEL_31:
        v25 = 0;
        goto LABEL_23;
      }
      v19 = v11;
      v20 = v13;
      v18 = 0;
      v25 = CFSTR("Mind and Body Workout");
      v21 = CFSTR("mind and body workout");
    }
    goto LABEL_22;
  }
  v25 = 0;
  if (v14 == 1)
  {
    v19 = v11;
    v20 = v13;
    v21 = CFSTR("American football");
    goto LABEL_22;
  }
  if (v14 == 3)
  {
    v19 = v11;
    v20 = v13;
    v25 = 0;
    v21 = CFSTR("Australian football");
LABEL_22:

    IsValid = 0;
    v17 = (__CFString *)v21;
    v13 = v20;
    v11 = v19;
  }
LABEL_23:
  if ((unint64_t)v14 > 0x4F || v14 == 33)
  {

    v17 = CFSTR("workout");
  }
  else if (IsValid)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v12, v25);
    goto LABEL_30;
  }
  +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v17, v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, v12);

  if ((v18 & 1) == 0)
  {
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, v13);

  }
LABEL_30:
  objc_msgSend((id)objc_opt_class(), "keywordFromString:", v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, v11);

}

+ (void)setMetaDataForActivityAction:(id)a3 metaData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  if (v12)
  {
    objc_msgSend(v12, "actionName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setActivityNameFromActionName:metaData:keyword:keywordType:](MOEventBundleMetaDataUtility, "setActivityNameFromActionName:metaData:keyword:keywordType:", v6, v5, CFSTR("action"), CFSTR("action_type"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "actionSubtype"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("workoutSubtype"));

    objc_msgSend(v12, "actionMetaData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataAppName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v12, "actionMetaData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataAppName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("workout_app_name"));

    }
  }

}

+ (void)setMetaDataForMediaAction:(id)a3 metaData:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (v7 && objc_msgSend(v7, "actionType") == 6)
  {
    objc_msgSend(v7, "actionName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("media"));

  }
}

+ (id)mediaKeywordWithType:(unint64_t)a3
{
  id result;

  switch(a3)
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_title"), CFSTR("media"));
      goto LABEL_8;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_album"), CFSTR("media"));
      goto LABEL_8;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_artist"), CFSTR("media"));
      goto LABEL_8;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_genre"), CFSTR("media"));
      goto LABEL_8;
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_app"), CFSTR("media"));
LABEL_8:
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = CFSTR("media");
      break;
  }
  return result;
}

+ (void)setMetaDataForActivityConcurrentMediaAction:(id)a3 metaData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (v17)
  {
    if (objc_msgSend(v17, "actionType") == 6)
    {
      objc_msgSend(v17, "actionMetaData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v17, "actionName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("media"));

        objc_msgSend(v17, "actionMetaData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataMediaType"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("media_type"));

        objc_msgSend(v17, "actionMetaData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataMediaInfoType"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v17, "actionMetaData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataMediaInfoType"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1, "mediaKeywordWithType:", (int)objc_msgSend(v14, "intValue"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "actionName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", CFSTR("media_name"), v15, v16, v6);

        }
      }
    }
  }

}

+ (void)setMetaDataWithKeyword:(id)a3 extendedKeyword:(id)a4 value:(id)a5 metaData:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v9 && v10 && v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v9, CFSTR("_string"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v9);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v10);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityFramework);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2048;
      v19 = objc_msgSend(v11, "length");
      _os_log_error_impl(&dword_1CAE42000, v13, OS_LOG_TYPE_ERROR, "build meta, keyword, %@, extendedKeyword, %@, value, %lu", buf, 0x20u);
    }
  }

}

+ (void)setMetaDataForTime:(id)a3 startDate:(id)a4 endDate:(id)a5 metaData:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  void *v58;
  id v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  unint64_t v65;
  __int16 v66;
  unint64_t v67;
  __int16 v68;
  unint64_t v69;
  __int16 v70;
  unint64_t v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "timeZoneObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _mo_log_facility_get_os_log(MOLogFacilityFramework);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v61 = v13;
    v62 = 2112;
    v63 = v10;
    v64 = 2112;
    v65 = (unint64_t)v11;
    v66 = 2112;
    v67 = (unint64_t)v9;
    _os_log_impl(&dword_1CAE42000, v14, OS_LOG_TYPE_INFO, "build meta, time zone, %@, startDate, %@, endDate, %@, time, %@", buf, 0x2Au);
  }

  if (v11)
  {
    if ((objc_msgSend(v11, "isBeforeDate:", v10) & 1) != 0)
    {
      v15 = v11;
    }
    else
    {
      objc_msgSend(v11, "snapToTheDay");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "isAfterDate:", v10))
        goto LABEL_14;
      v16 = v15;

      if (v16)
      {
        if (!objc_msgSend(v16, "isBeforeDate:", v10))
        {
          v11 = v16;
          goto LABEL_14;
        }
        _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v61 = v10;
          v62 = 2112;
          v63 = v16;
          _os_log_impl(&dword_1CAE42000, v17, OS_LOG_TYPE_INFO, "setMetaDataForTime, startDate, %@, endDate, %@, the timestamps are inverted after snapping.", buf, 0x16u);
        }

      }
    }
    v11 = 0;
LABEL_14:

  }
  if (v9)
  {
    objc_msgSend(v9, "timeString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v9, "timeString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("time"));

    }
  }
  if (!v10)
  {
    objc_msgSend(v9, "date");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v11 = 0;
  }
  if (!v13)
  {
    v23 = v11;
    v21 = v10;
LABEL_36:
    if (!v21)
    {
      v24 = 0;
      goto LABEL_68;
    }
    if (!v23)
      goto LABEL_42;
    goto LABEL_38;
  }
  if (v10)
  {
    +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v10, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityFramework);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v61 = v13;
      v62 = 2112;
      v63 = v10;
      v64 = 2112;
      v65 = (unint64_t)v21;
      _os_log_impl(&dword_1CAE42000, v22, OS_LOG_TYPE_INFO, "build meta, time zone, %@, startDate, %@, localDate, %@", buf, 0x20u);
    }

    if (!v11)
    {
      v23 = 0;
      v24 = 0;
      if (!v21)
        goto LABEL_68;
      goto LABEL_42;
    }
  }
  else
  {
    v21 = 0;
    v24 = 0;
    v23 = 0;
    if (!v11)
      goto LABEL_68;
  }
  +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v11, v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _mo_log_facility_get_os_log(MOLogFacilityFramework);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v61 = v13;
    v62 = 2112;
    v63 = v11;
    v64 = 2112;
    v65 = (unint64_t)v23;
    _os_log_impl(&dword_1CAE42000, v25, OS_LOG_TYPE_INFO, "build meta, time zone, %@, endDate, %@, localDate, %@", buf, 0x20u);
  }

  if (!v21 || !v23)
    goto LABEL_36;
  if (objc_msgSend(v23, "isBeforeDate:", v21))
  {
    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v61 = v21;
      v62 = 2112;
      v63 = v23;
      _os_log_impl(&dword_1CAE42000, v26, OS_LOG_TYPE_INFO, "setMetaDataForTime, startDate, %@, endDate, %@, the timestamps are inverted after time zone shifting.", buf, 0x16u);
    }
LABEL_41:

    v23 = 0;
    goto LABEL_42;
  }
LABEL_38:
  if (objc_msgSend(v23, "isBeforeDate:", v21))
  {
    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:].cold.1((uint64_t)v21, (uint64_t)v23, v26);
    goto LABEL_41;
  }
LABEL_42:
  _mo_log_facility_get_os_log(MOLogFacilityFramework);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v61 = v13;
    v62 = 2112;
    v63 = v21;
    v64 = 2112;
    v65 = (unint64_t)v23;
    _os_log_impl(&dword_1CAE42000, v27, OS_LOG_TYPE_INFO, "build meta after timezone shift, time zone, %@, startDate, %@, endDate, %@", buf, 0x20u);
  }

  v28 = +[MOTime dateReferenceTagFromStartDate:endDate:](MOTime, "dateReferenceTagFromStartDate:endDate:", v21, v23);
  if (v9)
    objc_msgSend(v9, "setDateReferenceTag:", v28);
  if (v28 >= 2)
  {
    +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v29, CFSTR("date_referece_time_tag"));

  }
  if ((v28 & 0xFFFFFFFFFFFFFFFELL) == 0x64)
  {
    +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("date_reference_"), v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", CFSTR("date_reference"), v32, v31, v12);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "dateByAddingTimeInterval:", -604800.0);
  v34 = objc_claimAutoreleasedReturnValue();

  v57 = (void *)v34;
  if (objc_msgSend(v21, "isAfterDate:", v34))
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E855DAB8, CFSTR("date_referece_recency"));
  v59 = v9;
  v55 = +[MOTime typeOfDayTagFromStartDate:endDate:timeZone:](MOTime, "typeOfDayTagFromStartDate:endDate:timeZone:", v21, v23, 0);
  if (v55 == 10001)
  {
    +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", 10001);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v35, CFSTR("typeOfDay"));

  }
  v58 = v13;
  v36 = +[MOTime dayOfWeekTagFromStartDate:endDate:](MOTime, "dayOfWeekTagFromStartDate:endDate:", v21, v23);
  v37 = v36 - 102;
  if (v36 - 102 <= 6)
  {
    +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("date_reference_"), v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", CFSTR("date_reference_weekday"), v40, v39, v12);

  }
  v56 = v36;
  v41 = v12;
  v42 = +[MOTime timetagFromStartDate:endDate:](MOTime, "timetagFromStartDate:endDate:", v21, v23);
  if (v42 - 2 <= 6)
  {
    +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v44, CFSTR("timeOfDay"));

    objc_msgSend(v12, "objectForKey:", CFSTR("time"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("timeOfDay"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v46, CFSTR("time"));

    }
    if (v37 <= 6)
    {
      +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v56);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v42);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@_%@"), CFSTR("date_reference_"), v47, v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", CFSTR("date_reference_weekday_timeofday"), v50, v49, v41);

    }
  }
  +[MOTime localizedDateStringFromDate:](MOTime, "localizedDateStringFromDate:", v21);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v51, CFSTR("date_string"));

  if (v23 && (objc_msgSend(v23, "isSameDayWithDate:", v21) & 1) == 0)
  {
    +[MOTime localizedDateStringFromDate:](MOTime, "localizedDateStringFromDate:", v23);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v52, CFSTR("end_date_string"));

  }
  _mo_log_facility_get_os_log(MOLogFacilityFramework);
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("date_string"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v61 = v21;
    v62 = 2112;
    v63 = v23;
    v64 = 2048;
    v65 = v28;
    v66 = 2048;
    v67 = v55;
    v68 = 2048;
    v69 = v56;
    v70 = 2048;
    v71 = v42;
    v72 = 2112;
    v73 = v54;
    _os_log_impl(&dword_1CAE42000, v53, OS_LOG_TYPE_INFO, "build meta, startDate, %@, endDate, %@, dateTag, %lu, typeOfDay, %lu, dayOfWeek, %lu, timeOfDay, %lu, dateString, %@", buf, 0x48u);

  }
  v24 = v21;
  v12 = v41;
  v13 = v58;
  v9 = v59;
LABEL_68:

}

+ (void)setMetaDataForTime:(id)a3 metaData:(id)a4
{
  +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", a3, 0, 0, a4);
}

+ (void)setMetaDataForPlace:(id)a3 metaData:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  double v27;
  double v28;
  const __CFString *v29;
  double v30;
  double v31;
  id v32;

  v32 = a3;
  v5 = a4;
  objc_msgSend(v32, "placeName");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(v32, "placeType");

    if (v8)
    {
      if (objc_msgSend(v32, "placeUserType")
        && (objc_msgSend(v32, "placeUserType") == 1 || objc_msgSend(v32, "placeUserType") == 2))
      {
        objc_msgSend(v32, "placeName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lowercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("place"));

        objc_msgSend(v32, "placeName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("Place"));

      }
      else
      {
        objc_msgSend(v32, "placeName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("place"));

        objc_msgSend(v32, "placeName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("Place"));
      }

      objc_msgSend(v32, "enclosingArea");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (objc_msgSend(v32, "placeType") != 101 && objc_msgSend(v32, "placeType") != 102)
        {
          objc_msgSend(v32, "enclosingArea");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("city"));

          objc_msgSend(v32, "placeName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "enclosingArea");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "containsString:", v18);

          if (v19)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Yes"), CFSTR("place_name_overlap_with_city"));
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v32, "placeType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("place_type"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v32, "placeUserType"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("place_user_type"));

      +[MOEventRoutine stringOfPlaceUserType:](MOEventRoutine, "stringOfPlaceUserType:", objc_msgSend(v32, "placeUserType"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "lowercaseString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("place_user_type_tag"));

      }
      if (objc_msgSend(v32, "proposition") == 4)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("flight"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqual:", CFSTR("flight"));

        if ((v26 & 1) == 0)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E855DAB8, CFSTR("vicinity"));
      }
      if (objc_msgSend(v32, "locationMode") == 2)
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E855DAB8, CFSTR("trip"));
      if (objc_msgSend(v32, "placeType") == 3 && (objc_msgSend(v32, "placeNameConfidence"), v27 >= 0.95)
        || objc_msgSend(v32, "placeType") == 2 && (objc_msgSend(v32, "placeNameConfidence"), v28 >= 0.95)
        || objc_msgSend(v32, "placeUserType") && (unint64_t)objc_msgSend(v32, "placeUserType") < 0x64)
      {
        v29 = CFSTR("high");
      }
      else if (objc_msgSend(v32, "placeType") == 3 && (objc_msgSend(v32, "placeNameConfidence"), v30 >= 0.9)
             || objc_msgSend(v32, "placeType") == 2 && (objc_msgSend(v32, "placeNameConfidence"), v31 >= 0.5))
      {
        v29 = CFSTR("medium");
      }
      else
      {
        v29 = CFSTR("low");
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("confidence"));

    }
  }

}

+ (BOOL)isAddressForPlace:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "placeType") > 3;
}

+ (void)setMetaDataForActivityPlace:(id)a3 metaData:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;

  v23 = a3;
  v5 = a4;
  objc_msgSend(v23, "placeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v23, "placeType"))
  {
    v7 = objc_msgSend(v23, "placeUserType");

    if (v7 != 2)
    {
      if (objc_msgSend(v23, "placeUserType") && objc_msgSend(v23, "placeUserType") == 1)
      {
        objc_msgSend(v23, "placeName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lowercaseString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("place"));

        objc_msgSend(v23, "placeName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("Place"));

      }
      else
      {
        objc_msgSend(v23, "placeName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("place"));

        objc_msgSend(v23, "placeName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("Place"));
      }

      objc_msgSend(v23, "enclosingArea");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (objc_msgSend(v23, "placeType") != 101 && objc_msgSend(v23, "placeType") != 102)
        {
          objc_msgSend(v23, "enclosingArea");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("city"));

          objc_msgSend(v23, "placeName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "enclosingArea");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "containsString:", v17);

          if (v18)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Yes"), CFSTR("place_name_overlap_with_city"));
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "placeType"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("place_type"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "placeUserType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("place_user_type"));

      if (objc_msgSend(v23, "proposition") == 4)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("flight"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqual:", CFSTR("flight"));

        if ((v22 & 1) == 0)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E855DAB8, CFSTR("vicinity"));
      }
    }
  }
  else
  {

  }
}

+ (void)setMetaDataForPersons:(id)a3 suggestionId:(id)a4 metaData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id obj;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v60 = a5;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v57 = v7;
    v58 = v8;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "allObjects");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "sortedArrayUsingSelector:", sel_comparePersons_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityFramework);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAE42000, v10, OS_LOG_TYPE_INFO, "After Sorting setMetaDataForPersons", buf, 2u);
    }

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v71 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
          _mo_log_facility_get_os_log(MOLogFacilityFramework);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v77 = v16;
            _os_log_impl(&dword_1CAE42000, v17, OS_LOG_TYPE_INFO, " Person %@", buf, 0xCu);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isMePerson == NO"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredArrayUsingPredicate:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isMePerson == YES"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredArrayUsingPredicate:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setObject:forKeyedSubscript:", v21, CFSTR("me_person"));

      objc_msgSend(v19, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v21) = objc_msgSend(v22, "mePersonIdentified");

      if ((_DWORD)v21)
        objc_msgSend(v60, "setObject:forKeyedSubscript:", CFSTR("Yes"), CFSTR("me_person_identified"));
      if ((unint64_t)objc_msgSend(v19, "count") >= 2)
      {
        _mo_log_facility_get_os_log(MOLogFacilityFramework);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:].cold.1((uint64_t)v19, v23);

      }
    }
    v59 = v11;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isPHPersonTypeImportant == YES"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "filteredArrayUsingPredicate:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v49, "mutableCopy");
    v25 = objc_msgSend(v58, "hash");
    objc_msgSend(v24, "shuffleWithSeed:", v25);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isPHPersonTypeImportant == NO"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "filteredArrayUsingPredicate:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v46, "mutableCopy");
    objc_msgSend(v26, "shuffleWithSeed:", v25);
    v48 = v24;
    v45 = v26;
    objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityFramework);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAE42000, v28, OS_LOG_TYPE_INFO, "all shuffed persons by importance except me Person", buf, 2u);
    }
    v51 = v19;
    v53 = v18;

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v29 = v27;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v67 != v32)
            objc_enumerationMutation(v29);
          v34 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j);
          _mo_log_facility_get_os_log(MOLogFacilityFramework);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v77 = v34;
            _os_log_impl(&dword_1CAE42000, v35, OS_LOG_TYPE_INFO, " Person %@", buf, 0xCu);
          }

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      }
      while (v31);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = v29;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    v37 = v59;
    if (v36)
    {
      v38 = v36;
      v39 = *(_QWORD *)v63;
      v40 = 1;
LABEL_34:
      v41 = 0;
      while (1)
      {
        if (*(_QWORD *)v63 != v39)
          objc_enumerationMutation(obj);
        v42 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v41);
        if (objc_msgSend(v42, "mePersonIdentified"))
          objc_msgSend(v60, "setObject:forKeyedSubscript:", CFSTR("Yes"), CFSTR("me_person_identified"));
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("person_"), v40 + v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "name");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setObject:forKeyedSubscript:", v44, v43);

        v37 = v59;
        if ((unint64_t)((int)v40 + v41 + 1) > 3)
          break;
        if (v38 == ++v41)
        {
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
          v40 = (int)v40 + v41;
          if (v38)
            goto LABEL_34;
          break;
        }
      }
    }

    v7 = v57;
    v8 = v58;
  }

}

+ (void)setMetaDataForPlaces:(id)a3 metaData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t i;
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
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  const __CFString *v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  char v60;
  unsigned int v61;
  id v62;
  void *v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v69 = a4;
  if (!v5 || !objc_msgSend(v5, "count"))
  {
    v52 = 0;
    v64 = 0;
    v53 = 0;
    goto LABEL_55;
  }
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v59 = v5;
  v8 = v5;
  v66 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
  if (!v66)
  {
    v61 = 0;
    v64 = 0;
    v60 = 0;
    goto LABEL_54;
  }
  v61 = 0;
  v64 = 0;
  v60 = 0;
  v65 = *(_QWORD *)v72;
  v67 = 1;
  v9 = 0x1E0CB3000uLL;
  v62 = v8;
  v63 = v6;
  v68 = v7;
  do
  {
    for (i = 0; i != v66; ++i)
    {
      if (*(_QWORD *)v72 != v65)
        objc_enumerationMutation(v8);
      v11 = v67 + i;
      v12 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
      objc_msgSend(*(id *)(v9 + 2368), "stringWithFormat:", CFSTR("%@%d"), CFSTR("place_"), v67 + i);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v9 + 2368), "stringWithFormat:", CFSTR("%@%d"), CFSTR("Place_"), v67 + i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "placeName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (objc_msgSend(v12, "placeUserType") && objc_msgSend(v12, "placeUserType") == 1)
        {
          objc_msgSend(v12, "placeName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lowercaseString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v17, v70);

          v6 = v63;
          objc_msgSend(v12, "placeName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v19, v13);

        }
        else
        {
          objc_msgSend(v12, "placeName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v20, v70);

          objc_msgSend(v12, "placeName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v18, v13);
        }

      }
      objc_msgSend(v12, "enclosingArea");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21 && objc_msgSend(v12, "placeType") != 101 && objc_msgSend(v12, "placeType") != 102)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("city"), v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "enclosingArea");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v23, v22);

        objc_msgSend(v12, "enclosingArea");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v68, "containsObject:", v24);

        if ((v25 & 1) == 0)
        {
          ++v61;
          objc_msgSend(v12, "enclosingArea");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "addObject:", v26);

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("unique_city_"), objc_msgSend(v68, "count"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "enclosingArea");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v28, v27);

        }
        v6 = v63;

        v8 = v62;
      }
      if (objc_msgSend(v12, "proposition") == 4)
      {
        objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("flight"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqual:", CFSTR("flight"));

        if ((v30 & 1) == 0 && (_DWORD)v11 == 1)
          objc_msgSend(v69, "setObject:forKeyedSubscript:", &unk_1E855DAB8, CFSTR("vicinity"));
      }
      objc_msgSend(v12, "placeName");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
        goto LABEL_27;
      v32 = (void *)v31;
      objc_msgSend(v12, "placeName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v6;
      v35 = objc_msgSend(v6, "containsObject:", v33);

      if ((v35 & 1) != 0)
      {
        v6 = v34;
LABEL_27:
        v7 = v68;
        goto LABEL_49;
      }
      objc_msgSend(v12, "placeName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v36);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("unique_place_"), objc_msgSend(v34, "count"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("Unique_place_"), objc_msgSend(v34, "count"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v34;
      if (objc_msgSend(v12, "placeUserType") && objc_msgSend(v12, "placeUserType") == 1)
      {
        objc_msgSend(v12, "placeName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "lowercaseString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v41, v37);

        v8 = v62;
        v6 = v63;
        objc_msgSend(v12, "placeName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v43, v38);

      }
      else
      {
        objc_msgSend(v12, "placeName");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v44, v37);

        objc_msgSend(v12, "placeName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v42, v38);
      }

      if (objc_msgSend(v12, "proposition") == 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("vicinity_"), objc_msgSend(v6, "count"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setObject:forKeyedSubscript:", &unk_1E855DAB8, v45);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("confidence_"), objc_msgSend(v6, "count"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "placeType") == 3 && (objc_msgSend(v12, "placeNameConfidence"), v47 >= 0.95))
      {
        v49 = CFSTR("high");
        v7 = v68;
      }
      else
      {
        v7 = v68;
        if (objc_msgSend(v12, "placeType") == 2 && (objc_msgSend(v12, "placeNameConfidence"), v48 >= 0.95)
          || objc_msgSend(v12, "placeUserType") && (unint64_t)objc_msgSend(v12, "placeUserType") < 0x64)
        {
          v49 = CFSTR("high");
        }
        else if (objc_msgSend(v12, "placeType") == 3 && (objc_msgSend(v12, "placeNameConfidence"), v50 >= 0.9))
        {
          v49 = CFSTR("medium");
        }
        else if (objc_msgSend(v12, "placeType") != 2
               || (objc_msgSend(v12, "placeNameConfidence"), v49 = CFSTR("medium"), v51 < 0.5))
        {
          v60 = 1;
          v49 = CFSTR("low");
        }
      }
      ++v64;
      objc_msgSend(v69, "setObject:forKeyedSubscript:", v49, v46);

LABEL_49:
      v9 = 0x1E0CB3000;

    }
    v66 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    v67 = (v67 + i);
  }
  while (v66);
LABEL_54:

  v53 = v60 & 1;
  v5 = v59;
  v52 = v61;
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v54, CFSTR("include_low_confidence_place_name"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v55, CFSTR("place_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v64);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v56, CFSTR("unique_place_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v52);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v57, CFSTR("unique_city_count"));

  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count") - 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v58, CFSTR("place_count_minus_one"));

  }
}

+ (void)setMetaDataForPhotos:(id)a3 metaData:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "type", (_QWORD)v12) == 2)
          {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("photo_attached"));
            goto LABEL_13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

+ (id)andStringFromArray:(id)a3 propertyPath:(id)a4 maxCount:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = v9 - 1;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "valueForKeyPath:", v8);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v11)
      {
        if (v13 == v12)
        {
          objc_msgSend(v11, "appendFormat:", CFSTR(" and %@"), v15);
        }
        else
        {
          if (v12 >= a5 - 1)
          {
            objc_msgSend(v11, "appendFormat:", CFSTR(", %@ and more"), v15);

            goto LABEL_13;
          }
          objc_msgSend(v11, "appendFormat:", CFSTR(", %@"), v15);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (v10 == ++v12)
        goto LABEL_13;
    }
  }
  v11 = 0;
LABEL_13:
  v17 = (void *)objc_msgSend(v11, "copy");

  return v17;
}

+ (id)keywordFromString:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
}

+ (void)buildEvergreenMetaDataForEventBundle:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v6;
  v9 = 2048;
  v10 = a2;
  v11 = 2112;
  v12 = a1;
  _os_log_debug_impl(&dword_1CAE42000, a3, OS_LOG_TYPE_DEBUG, "build meta, Evergreen, type, %@, count, %lu, resource, %@", (uint8_t *)&v7, 0x20u);

}

+ (void)buildEvergreenMetaDataForEventBundle:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_4(&dword_1CAE42000, v2, v3, "build meta, Evergreen, type, %@, metaData, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_4();
}

+ (void)setMetaDataForTime:(os_log_t)log startDate:endDate:metaData:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "setMetaDataForTime, startDate, %@, endDate, %@, the timestamps are inverted at the end", (uint8_t *)&v3, 0x16u);
}

+ (void)setMetaDataForPersons:(uint64_t)a1 suggestionId:(NSObject *)a2 metaData:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CAE42000, a2, OS_LOG_TYPE_ERROR, "More than one person found : %@", (uint8_t *)&v2, 0xCu);
}

@end
