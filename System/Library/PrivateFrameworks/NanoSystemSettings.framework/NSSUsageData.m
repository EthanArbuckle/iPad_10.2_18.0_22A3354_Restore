@implementation NSSUsageData

- (NSSUsageData)initWithUsed:(unint64_t)a3 available:(unint64_t)a4 usageTimeInSeconds:(float)a5 standbyTimeInSeconds:(float)a6 trusted:(BOOL)a7 partiallyCharged:(BOOL)a8 appBundleUsage:(id)a9 categories:(id)a10
{
  id v19;
  id v20;
  NSSUsageData *v21;
  NSSUsageData *v22;
  objc_super v24;

  v19 = a9;
  v20 = a10;
  v24.receiver = self;
  v24.super_class = (Class)NSSUsageData;
  v21 = -[NSSUsageData init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_usedStorageInBytes = a3;
    v21->_availableStorageInBytes = a4;
    v21->_usageTimeInSeconds = a5;
    v21->_standbyTimeInSeconds = a6;
    v21->_trusted = a7;
    v21->_partiallyCharged = a8;
    objc_storeStrong((id *)&v21->_appBundleUsage, a9);
    objc_storeStrong((id *)&v22->_categories, a10);
  }

  return v22;
}

- (NSSUsageData)initWithCapacity:(unint64_t)a3 usedStorageInBytes:(unint64_t)a4 available:(unint64_t)a5 usageTimeInSeconds:(float)a6 standbyTimeInSeconds:(float)a7 trusted:(BOOL)a8 partiallyCharged:(BOOL)a9 appBundleUsage:(id)a10 categories:(id)a11
{
  id v20;
  id v21;
  NSSUsageData *v22;
  NSSUsageData *v23;
  objc_super v25;

  v20 = a10;
  v21 = a11;
  v25.receiver = self;
  v25.super_class = (Class)NSSUsageData;
  v22 = -[NSSUsageData init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_capacityInBytes = a3;
    v22->_usedStorageInBytes = a4;
    v22->_availableStorageInBytes = a5;
    v22->_usageTimeInSeconds = a6;
    v22->_standbyTimeInSeconds = a7;
    v22->_trusted = a8;
    v22->_partiallyCharged = a9;
    objc_storeStrong((id *)&v22->_appBundleUsage, a10);
    objc_storeStrong((id *)&v23->_categories, a11);
  }

  return v23;
}

+ (id)createNSSUsageBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  objc_msgSend(v3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIdentifier:", v6);

  v7 = objc_msgSend(v3, "supportsManualPurge");
  objc_msgSend(v4, "setPurgeable:", v7);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCategories:", v8);

  return v4;
}

+ (id)createNSSUsageApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  objc_msgSend(v3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIdentifier:", v6);

  objc_msgSend(v3, "bundleVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleVersion:", v7);

  objc_msgSend(v3, "size");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStaticSize:", objc_msgSend(v8, "fixed"));

  objc_msgSend(v3, "size");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDynamicSize:", objc_msgSend(v9, "docsAndData"));
  return v4;
}

+ (id)createLegacyUsageDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
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
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _QWORD v51[8];
  _QWORD v52[8];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.NanoMailUsageBundle"), CFSTR("com.apple.NanoCalendarUsage"), CFSTR("com.apple.ContactsUsageBundle"), CFSTR("com.apple.NanoPhoneUsageBundle"), CFSTR("com.apple.NanoHealthUsage"), CFSTR("com.apple.NanoPassbookUsageBundle"), CFSTR("com.apple.SoftwareUpdateUsage"), CFSTR("com.apple.NanoBooks.Usage"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.NanoPhotos"), CFSTR("com.apple.NanoMusic"), CFSTR("com.apple.podcasts"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v40 = v3;
  objc_msgSend(v3, "appBundleUsage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v12, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "containsObject:", v13) & 1) == 0)
        {
          if (objc_msgSend(v5, "containsObject:", v13))
          {
            +[NSSUsageData createNSSUsageBundle:](NSSUsageData, "createNSSUsageBundle:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v4;
          }
          else
          {
            +[NSSUsageData createNSSUsageApp:](NSSUsageData, "createNSSUsageApp:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v41;
          }
          objc_msgSend(v15, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v9);
  }

  v51[0] = CFSTR("Apps");
  v51[1] = CFSTR("Bundles");
  v52[0] = v41;
  v52[1] = v4;
  v51[2] = CFSTR("UsedStorage");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v40, "usedStorageInBytes"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v38;
  v51[3] = CFSTR("AvailableStorage");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v40, "availableStorageInBytes"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v37;
  v51[4] = CFSTR("Usage");
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v40, "usageTimeInSeconds");
  objc_msgSend(v16, "numberWithFloat:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v36;
  v51[5] = CFSTR("Standby");
  v17 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v40, "standbyTimeInSeconds");
  objc_msgSend(v17, "numberWithFloat:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v18;
  v51[6] = CFSTR("Trusted");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v40, "trusted"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v19;
  v51[7] = CFSTR("Partially");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v40, "partiallyCharged"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v21, "mutableCopy");

  v22 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v40, "categories");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v40, "categories");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        objc_msgSend(v30, "categoryIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setValue:forKey:", v30, v31);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v27);
  }

  objc_msgSend(v24, "valueForKey:", CFSTR("CAT_MEDIA"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  addCategoryToDict(v39, CFSTR("Songs"), v32);

  objc_msgSend(v39, "setValue:forKey:", CFSTR("com.apple.NanoMusic"), CFSTR("MusicAppId"));
  objc_msgSend(v24, "valueForKey:", CFSTR("CAT_PHOTOS"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  addCategoryToDict(v39, CFSTR("PhotoLibrary"), v33);

  objc_msgSend(v39, "setValue:forKey:", CFSTR("com.apple.NanoPhotos"), CFSTR("PhotosAppId"));
  objc_msgSend(v24, "valueForKey:", CFSTR("CAT_BOOKS"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  addCategoryToDict(v39, CFSTR("Audiobooks"), v34);

  objc_msgSend(v39, "setValue:forKey:", CFSTR("com.apple.podcasts"), CFSTR("PodcastsAppId"));
  return v39;
}

- (unint64_t)capacityInBytes
{
  return self->_capacityInBytes;
}

- (unint64_t)usedStorageInBytes
{
  return self->_usedStorageInBytes;
}

- (unint64_t)availableStorageInBytes
{
  return self->_availableStorageInBytes;
}

- (float)usageTimeInSeconds
{
  return self->_usageTimeInSeconds;
}

- (float)standbyTimeInSeconds
{
  return self->_standbyTimeInSeconds;
}

- (BOOL)trusted
{
  return self->_trusted;
}

- (BOOL)partiallyCharged
{
  return self->_partiallyCharged;
}

- (NSArray)appBundleUsage
{
  return self->_appBundleUsage;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_appBundleUsage, 0);
}

+ (id)newAppBundleFromAppBundleMsg:(id)a3
{
  id v4;
  NSSUsageDataAppBundle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSSUsageDataAppBundle *v13;

  v4 = a3;
  v5 = [NSSUsageDataAppBundle alloc];
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vendor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(a1, "newSizeFromMsg:", v10);
  v12 = objc_msgSend(v4, "supportsManualPurge");

  v13 = -[NSSUsageDataAppBundle initWithName:bundleIdentifier:bundleVersion:vendor:size:supportsPurge:](v5, "initWithName:bundleIdentifier:bundleVersion:vendor:size:supportsPurge:", v6, v7, v8, v9, v11, v12);
  return v13;
}

+ (id)newAppBundleFromBundleUsageMsg:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSSUsageDataAppBundle *v10;
  void *v11;
  void *v12;
  void *v13;
  NSSUsageDataAppBundle *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "categories", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "usageInBytes");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v10 = [NSSUsageDataAppBundle alloc];
  objc_msgSend(v3, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSSizeVector docsAndData:](NSSSizeVector, "docsAndData:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NSSUsageDataAppBundle initWithName:bundleIdentifier:bundleVersion:vendor:size:supportsPurge:](v10, "initWithName:bundleIdentifier:bundleVersion:vendor:size:supportsPurge:", v11, v12, 0, 0, v13, objc_msgSend(v3, "purgeable"));

  return v14;
}

+ (id)newAppBundleFromAppUsageMsg:(id)a3
{
  id v3;
  NSSUsageDataAppBundle *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSSUsageDataAppBundle *v11;

  v3 = a3;
  v4 = [NSSUsageDataAppBundle alloc];
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "staticSizeInBytes");
  v9 = objc_msgSend(v3, "dynamicSizeInBytes");

  +[NSSSizeVector fixed:docsAndData:](NSSSizeVector, "fixed:docsAndData:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSSUsageDataAppBundle initWithName:bundleIdentifier:bundleVersion:vendor:size:supportsPurge:](v4, "initWithName:bundleIdentifier:bundleVersion:vendor:size:supportsPurge:", v5, v6, v7, 0, v10, 0);

  return v11;
}

+ (id)newSizeFromMsg:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "fixed");
  v5 = objc_msgSend(v3, "docsAndData");
  v6 = objc_msgSend(v3, "purgeable");

  +[NSSSizeVector fixed:docsAndData:purgeable:](NSSSizeVector, "fixed:docsAndData:purgeable:", v4, v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dedupeBundles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "bundleIdentifier", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mergeWith:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)newUsageDataFromUsageRespMsg:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  __CFString *v29;
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
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  int v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  uint64_t v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  _QWORD v84[4];
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "appBundleUsages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  v7 = v4;
  v83 = (void *)objc_opt_new();
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  objc_msgSend(v4, "appBundleUsages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v100 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(a1, "newAppBundleFromAppBundleMsg:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i));
        objc_msgSend(v83, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
    }
    while (v10);
  }

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v80 = v7;
  objc_msgSend(v7, "appUsages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v96;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v96 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(a1, "newAppBundleFromAppUsageMsg:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * j));
        objc_msgSend(v83, "addObject:", v19);
        objc_msgSend(v19, "size");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        addToCategory(v82, CFSTR("CAT_APPS"), objc_msgSend(v20, "userTotal"));

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
    }
    while (v16);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  objc_msgSend(v80, "bundleUsages");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v92;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v92 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v25);
        v27 = (void *)objc_msgSend(a1, "newAppBundleFromBundleUsageMsg:", v26);
        objc_msgSend(v83, "addObject:", v27);
        objc_msgSend(v26, "bundleIdentifier");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        if (legacyUsageBundleIdToCategory_onceToken != -1)
          dispatch_once(&legacyUsageBundleIdToCategory_onceToken, &__block_literal_global_1);
        objc_msgSend((id)legacyUsageBundleIdToCategory_legacyBundleIdToNewBundleIdMap, "objectForKey:", v28);
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v29)
          v29 = CFSTR("CAT_APPS");

        objc_msgSend(v27, "size");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        addToCategory(v82, v29, objc_msgSend(v30, "userTotal"));

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
    }
    while (v23);
  }

  if ((objc_msgSend(v80, "hasCameralRollUsage") & 1) != 0
    || (objc_msgSend(v80, "hasPhotoLibraryUsage") & 1) != 0
    || objc_msgSend(v80, "hasPhotoStreamUsage"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("PHOTO"), &stru_24CB9FCF0, CFSTR("Localization-shared"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    newFakeAppBundleFromLegacyData(v32, CFSTR("com.apple.NanoPhotos"), objc_msgSend(v80, "photoLibraryUsage")+ objc_msgSend(v80, "cameralRollUsage")+ objc_msgSend(v80, "photoStreamUsage"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v83, "addObject:", v33);
  }
  if ((objc_msgSend(v80, "hasSongsUsage") & 1) != 0
    || (objc_msgSend(v80, "hasAudiobooksUsage") & 1) != 0
    || objc_msgSend(v80, "hasAudioCoursesUsage"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("MUSIC"), &stru_24CB9FCF0, CFSTR("Localization-shared"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    newFakeAppBundleFromLegacyData(v35, CFSTR("com.apple.NanoMusic"), objc_msgSend(v80, "audiobooksUsage") + objc_msgSend(v80, "songsUsage") + objc_msgSend(v80, "audioCoursesUsage"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v83, "addObject:", v36);
  }
  if (objc_msgSend(v80, "hasAudioPodcastsUsage"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("PODCASTS"), &stru_24CB9FCF0, CFSTR("Localization-shared"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    newFakeAppBundleFromLegacyData(v38, CFSTR("com.apple.podcasts"), objc_msgSend(v80, "audioPodcastsUsage"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v83, "addObject:", v39);
  }
  addToCategory(v82, CFSTR("CAT_MEDIA"), objc_msgSend(v80, "moviesUsage"));
  addToCategory(v82, CFSTR("CAT_MEDIA"), objc_msgSend(v80, "movieRentalsUsage"));
  addToCategory(v82, CFSTR("CAT_MEDIA"), objc_msgSend(v80, "tvShowsUsage"));
  addToCategory(v82, CFSTR("CAT_MEDIA"), objc_msgSend(v80, "audioCoursesUsage"));
  addToCategory(v82, CFSTR("CAT_MEDIA"), objc_msgSend(v80, "videoCoursesUsage"));
  addToCategory(v82, CFSTR("CAT_MEDIA"), objc_msgSend(v80, "musicVideosUsage"));
  addToCategory(v82, CFSTR("CAT_MEDIA"), objc_msgSend(v80, "audioPodcastsUsage"));
  addToCategory(v82, CFSTR("CAT_MEDIA"), objc_msgSend(v80, "videoPodcastsUsage"));
  addToCategory(v82, CFSTR("CAT_MEDIA"), objc_msgSend(v80, "songsUsage"));
  addToCategory(v82, CFSTR("CAT_BOOKS"), objc_msgSend(v80, "audiobooksUsage"));
  addToCategory(v82, CFSTR("CAT_MEDIA"), objc_msgSend(v80, "homeVideosUsage"));
  addToCategory(v82, CFSTR("CAT_PHOTOS"), objc_msgSend(v80, "cameralRollUsage"));
  addToCategory(v82, CFSTR("CAT_PHOTOS"), objc_msgSend(v80, "photoLibraryUsage"));
  addToCategory(v82, CFSTR("CAT_PHOTOS"), objc_msgSend(v80, "photoStreamUsage"));
  v40 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v80, "categories");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v40, "initWithCapacity:", objc_msgSend(v41, "count"));

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend(v80, "categories");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v88;
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v88 != v46)
          objc_enumerationMutation(v43);
        v48 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * k);
        objc_msgSend(v48, "categoryIdentifier");
        v49 = objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          v50 = (void *)v49;
          objc_msgSend(v48, "size");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
          {
            objc_msgSend(v48, "categoryIdentifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "size");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = (void *)objc_msgSend(a1, "newSizeFromMsg:", v53);
            addUsageSizeToCategory(v82, v52, v54);

          }
        }
        objc_msgSend(v48, "categoryIdentifier");
        v55 = objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          v56 = (void *)v55;
          objc_msgSend(v48, "name");
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (v57)
          {
            objc_msgSend(v48, "name");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "categoryIdentifier");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setObject:forKeyedSubscript:", v58, v59);

          }
        }
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
    }
    while (v45);
  }

  v60 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v84[0] = MEMORY[0x24BDAC760];
  v84[1] = 3221225472;
  v84[2] = __52__NSSUsageData_Proto__newUsageDataFromUsageRespMsg___block_invoke;
  v84[3] = &unk_24CB9F870;
  v85 = v60;
  v86 = v42;
  v81 = v42;
  v79 = v60;
  objc_msgSend(v82, "enumerateKeysAndObjectsUsingBlock:", v84);
  v61 = objc_msgSend(v80, "capacityInBytes");
  if ((objc_msgSend(v80, "hasCapacityInBytes") & 1) != 0)
  {
    v62 = 0x24CB9E000;
    v78 = v61;
  }
  else
  {
    v63 = objc_msgSend(v80, "availableStorageInBytes");
    v78 = objc_msgSend(v80, "usedStorageInBytes") + v63;
    v62 = 0x24CB9E000uLL;
  }
  v64 = objc_alloc(*(Class *)(v62 + 3160));
  v65 = objc_msgSend(v80, "usedStorageInBytes");
  v66 = objc_msgSend(v80, "availableStorageInBytes");
  objc_msgSend(v80, "usageTimeInSeconds");
  v68 = v67;
  objc_msgSend(v80, "standbyTimeInSeconds");
  v70 = v69;
  v71 = objc_msgSend(v80, "trusted");
  v72 = objc_msgSend(v80, "partiallyCharged");
  objc_msgSend(a1, "dedupeBundles:", v83);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v74) = v68;
  LODWORD(v75) = v70;
  v76 = (void *)objc_msgSend(v64, "initWithCapacity:usedStorageInBytes:available:usageTimeInSeconds:standbyTimeInSeconds:trusted:partiallyCharged:appBundleUsage:categories:", v78, v65, v66, v71, v72, v73, v74, v75, v79);

  return v76;
}

void __52__NSSUsageData_Proto__newUsageDataFromUsageRespMsg___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  NSSUsageDataSizeCategory *v8;
  NSSUsageDataSizeCategory *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = [NSSUsageDataSizeCategory alloc];
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = -[NSSUsageDataSizeCategory initWithIdentifier:size:name:](v8, "initWithIdentifier:size:name:", v7, v6, v10);

  objc_msgSend(v5, "addObject:", v9);
}

+ (id)newMsgFromSize:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "docsAndData"))
  {
    v5 = objc_msgSend(v3, "docsAndData");
    objc_msgSend(v4, "setDocsAndData:", v5 & ~(v5 >> 63));
  }
  if (objc_msgSend(v3, "fixed"))
  {
    v6 = objc_msgSend(v3, "fixed");
    objc_msgSend(v4, "setFixed:", v6 & ~(v6 >> 63));
  }
  if (objc_msgSend(v3, "purgeable"))
  {
    v7 = objc_msgSend(v3, "purgeable");
    objc_msgSend(v4, "setPurgeable:", v7 & ~(v7 >> 63));
  }

  return v4;
}

+ (id)newSizeCategoryMsgFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "categoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCategoryIdentifier:", v6);

  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v7);

  objc_msgSend(v4, "size");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(a1, "newMsgFromSize:", v8);
  objc_msgSend(v5, "setSize:", v9);

  return v5;
}

+ (id)newAppBundleMsgFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleIdentifier:", v6);

  objc_msgSend(v4, "bundleVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleVersion:", v7);

  objc_msgSend(v5, "setSupportsManualPurge:", objc_msgSend(v4, "supportsManualPurge"));
  objc_msgSend(v4, "size");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "newMsgFromSize:", v8);
  objc_msgSend(v5, "setSize:", v9);

  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setName:", v10);
  return v5;
}

+ (id)newUsageRespMsgFrom:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = +[NSSUsageData setUsageRespMsgFrom:usageRespMsg:](NSSUsageData, "setUsageRespMsgFrom:usageRespMsg:", v3, v4);

  return v4;
}

+ (id)setUsageRespMsgFrom:(id)a3 usageRespMsg:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "setCapacityInBytes:", objc_msgSend(v6, "capacityInBytes"));
  objc_msgSend(v7, "setUsedStorageInBytes:", objc_msgSend(v6, "usedStorageInBytes"));
  objc_msgSend(v7, "setAvailableStorageInBytes:", objc_msgSend(v6, "availableStorageInBytes"));
  objc_msgSend(v6, "usageTimeInSeconds");
  objc_msgSend(v7, "setUsageTimeInSeconds:");
  objc_msgSend(v6, "standbyTimeInSeconds");
  objc_msgSend(v7, "setStandbyTimeInSeconds:");
  objc_msgSend(v7, "setTrusted:", objc_msgSend(v6, "trusted"));
  objc_msgSend(v7, "setPartiallyCharged:", objc_msgSend(v6, "partiallyCharged"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v6, "categories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(a1, "newSizeCategoryMsgFrom:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13));
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  objc_msgSend(v7, "setCategories:", v8);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v6, "appBundleUsage", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(a1, "newAppBundleMsgFrom:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20));
        objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  objc_msgSend(v7, "setAppBundleUsages:", v15);
  return v7;
}

@end
