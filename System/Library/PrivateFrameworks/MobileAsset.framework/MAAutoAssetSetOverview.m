@implementation MAAutoAssetSetOverview

- (MAAutoAssetSetOverview)initWithDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withLatestDownloadedAtomicInstance:(id)a6 withDownloadedAtomicInstances:(id)a7 withDiscoveredAtomicInstance:(id)a8 withActiveClientCount:(int64_t)a9 withActiveMonitorCount:(int64_t)a10 withMaximumClientCount:(int64_t)a11 withTotalClientCount:(int64_t)a12
{
  id v19;
  id v20;
  id v21;
  MAAutoAssetSetOverview *v22;
  MAAutoAssetSetOverview *v23;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v19 = a3;
  v20 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v21 = a8;
  v28.receiver = self;
  v28.super_class = (Class)MAAutoAssetSetOverview;
  v22 = -[MAAutoAssetSetOverview init](&v28, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_clientDomainName, a3);
    objc_storeStrong((id *)&v23->_assetSetIdentifier, a4);
    objc_storeStrong((id *)&v23->_configuredAssetEntries, a5);
    objc_storeStrong((id *)&v23->_latestDownloadedAtomicInstance, a6);
    objc_storeStrong((id *)&v23->_downloadedAtomicInstances, a7);
    objc_storeStrong((id *)&v23->_discoveredAtomicInstance, a8);
    v23->_activeClientCount = a9;
    v23->_activeMonitorCount = a10;
    v23->_maximumClientCount = a11;
    v23->_totalClientCount = a12;
  }

  return v23;
}

- (MAAutoAssetSetOverview)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetOverview *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *clientDomainName;
  uint64_t v11;
  NSString *assetSetIdentifier;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *configuredAssetEntries;
  uint64_t v18;
  NSString *latestDownloadedAtomicInstance;
  uint64_t v20;
  NSArray *downloadedAtomicInstances;
  uint64_t v22;
  NSString *discoveredAtomicInstance;
  objc_super v25;
  _QWORD v26[3];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MAAutoAssetSetOverview;
  v5 = -[MAAutoAssetSetOverview init](&v25, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDomainName"));
    v9 = objc_claimAutoreleasedReturnValue();
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSetIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v11;

    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("configuredAssetEntries"));
    v16 = objc_claimAutoreleasedReturnValue();
    configuredAssetEntries = v5->_configuredAssetEntries;
    v5->_configuredAssetEntries = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latestDownloadedAtomicInstance"));
    v18 = objc_claimAutoreleasedReturnValue();
    latestDownloadedAtomicInstance = v5->_latestDownloadedAtomicInstance;
    v5->_latestDownloadedAtomicInstance = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("downloadedAtomicInstances"));
    v20 = objc_claimAutoreleasedReturnValue();
    downloadedAtomicInstances = v5->_downloadedAtomicInstances;
    v5->_downloadedAtomicInstances = (NSArray *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("discoveredAtomicInstance"));
    v22 = objc_claimAutoreleasedReturnValue();
    discoveredAtomicInstance = v5->_discoveredAtomicInstance;
    v5->_discoveredAtomicInstance = (NSString *)v22;

    v5->_activeClientCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeClientCount"));
    v5->_activeMonitorCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeMonitorCount"));
    v5->_maximumClientCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumClientCount"));
    v5->_totalClientCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalClientCount"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[MAAutoAssetSetOverview clientDomainName](self, "clientDomainName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("clientDomainName"));

  -[MAAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("assetSetIdentifier"));

  -[MAAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("configuredAssetEntries"));

  -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("latestDownloadedAtomicInstance"));

  -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("downloadedAtomicInstances"));

  -[MAAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("discoveredAtomicInstance"));

  objc_msgSend(v10, "encodeInteger:forKey:", -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"), CFSTR("activeClientCount"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"), CFSTR("activeMonitorCount"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[MAAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"), CFSTR("maximumClientCount"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount"), CFSTR("totalClientCount"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return -[MAAutoAssetSetOverview description:](self, "description:", 0);
}

- (id)description:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  uint64_t v28;
  __CFString *v29;

  v3 = a3;
  -[MAAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@"), v10);

      goto LABEL_10;
    }
    v18 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@"), CFSTR("NONE"), v28);
  }
  else
  {
    v12 = objc_msgSend(v5, "count");

    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSetOverview _entry_string_to_use:](self, "_entry_string_to_use:", (int)v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%d %@"), v12, v14);

    -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    else
    {
      v17 = 0;
    }

    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSetOverview _entry_string_to_use:](self, "_entry_string_to_use:", (int)v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "initWithFormat:", CFSTR("%d %@"), v17, v9);
  }
  v11 = (void *)v18;
LABEL_10:

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetOverview clientDomainName](self, "clientDomainName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = CFSTR("NONE");
  }
  -[MAAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[MAAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = CFSTR("NONE");
  }
  objc_msgSend(v20, "stringWithFormat:", CFSTR(">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n          configuredAssetEntries: %@\n  latestDownloadedAtomicInstance: %@\n        discoveredAtomicInstance: %@\n       downloadedAtomicInstances: %@\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n<<<]"), v21, v22, v7, v29, v25, v11, -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"), -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"), -[MAAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"), -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)

  if (v23)
  return v26;
}

- (id)_entry_string_to_use:(int64_t)a3
{
  if (a3 >= 2)
    return CFSTR("entries");
  else
    return CFSTR("entry");
}

- (id)summary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetOverview clientDomainName](self, "clientDomainName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v17, "count");
  -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("NONE");
  }
  -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
  }
  else
  {
    v13 = 0;
  }
  -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("NONE");
  }
  v9 = (void *)v4;
  objc_msgSend(v15, "stringWithFormat:", CFSTR("clientDomain:%@|assetIdentifier:%@|numConfiguredEntries:%ld|latestDownloadedEntry:%@|numDownloadedEntries:%ld|discoveredEntry:%@|clients:%lld|monitors:%lld|maxClients:%lld|totalClients:%lld"), v3, v4, v14, v16, v13, v8, -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"), -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"), -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"), -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)

  if (v6)
  if (v5)

  return v10;
}

- (void)overviewBuildMaxColumnStrings:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;

  v52 = a3;
  -[MAAutoAssetSetOverview clientDomainName](self, "clientDomainName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%lld"), objc_msgSend(v6, "count"));

  -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("NONE");
  }

  -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (__CFString *)objc_msgSend(v10, "initWithFormat:", CFSTR("%lld"), objc_msgSend(v11, "count"));

  }
  else
  {
    v12 = CFSTR("NONE");
  }

  -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[MAAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("NONE");
  }

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"));
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"));
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount"));
  v49 = v4;
  v19 = objc_msgSend(v4, "length");
  objc_msgSend(v52, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v19 > v21)
    objc_msgSend(v52, "setSafeObject:forKey:", v49, CFSTR("assetSetIdentifier"));
  v22 = objc_msgSend(v51, "length");
  objc_msgSend(v52, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v22 > v24)
    objc_msgSend(v52, "setSafeObject:forKey:", v51, CFSTR("assetSetIdentifier"));
  v25 = objc_msgSend(v50, "length");
  objc_msgSend(v52, "safeStringForKey:", CFSTR("configuredAssetEntries"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v25 > v27)
    objc_msgSend(v52, "setSafeObject:forKey:", v50, CFSTR("configuredAssetEntries"));
  v28 = -[__CFString length](v8, "length");
  objc_msgSend(v52, "safeStringForKey:", CFSTR("latestDownloadedAtomicInstance"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  if (v28 > v30)
    objc_msgSend(v52, "setSafeObject:forKey:", v8, CFSTR("latestDownloadedAtomicInstance"));
  v31 = -[__CFString length](v12, "length");
  objc_msgSend(v52, "safeStringForKey:", CFSTR("downloadedAtomicInstances"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");

  if (v31 > v33)
    objc_msgSend(v52, "setSafeObject:forKey:", v12, CFSTR("downloadedAtomicInstances"));
  v34 = -[__CFString length](v14, "length");
  objc_msgSend(v52, "safeStringForKey:", CFSTR("discoveredAtomicInstance"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "length");

  if (v34 > v36)
    objc_msgSend(v52, "setSafeObject:forKey:", v14, CFSTR("discoveredAtomicInstance"));
  v37 = objc_msgSend(v15, "length");
  objc_msgSend(v52, "safeStringForKey:", CFSTR("activeClientCount"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "length");

  if (v37 > v39)
    objc_msgSend(v52, "setSafeObject:forKey:", v15, CFSTR("activeClientCount"));
  v40 = objc_msgSend(v16, "length");
  objc_msgSend(v52, "safeStringForKey:", CFSTR("activeMonitorCount"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "length");

  if (v40 > v42)
    objc_msgSend(v52, "setSafeObject:forKey:", v16, CFSTR("activeMonitorCount"));
  v43 = objc_msgSend(v17, "length");
  objc_msgSend(v52, "safeStringForKey:", CFSTR("maximumClientCount"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "length");

  if (v43 > v45)
    objc_msgSend(v52, "setSafeObject:forKey:", v17, CFSTR("maximumClientCount"));
  v46 = objc_msgSend(v18, "length");
  objc_msgSend(v52, "safeStringForKey:", CFSTR("totalClientCount"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "length");

  if (v46 > v48)
    objc_msgSend(v52, "setSafeObject:forKey:", v18, CFSTR("totalClientCount"));

}

- (id)overviewPadded:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  id v32;
  id v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;

  v4 = a3;
  -[MAAutoAssetSetOverview clientDomainName](self, "clientDomainName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%lld"), objc_msgSend(v6, "count"));

  -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = CFSTR("NONE");
  }

  -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (__CFString *)objc_msgSend(v9, "initWithFormat:", CFSTR("%lld"), objc_msgSend(v10, "count"));

  }
  else
  {
    v42 = CFSTR("NONE");
  }

  -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[MAAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance");
    v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("NONE");
  }

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"));
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"));
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"));
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount"));
  v32 = (id)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "safeStringForKey:", CFSTR("clientDomainName"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v44, v37, CFSTR(" "), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v45, v36, CFSTR(" "), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("configuredAssetEntries"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v43, v35, CFSTR(" "), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("latestDownloadedAtomicInstance"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v39, v31, CFSTR(" "), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("downloadedAtomicInstances"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v42, v28, CFSTR(" "), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("discoveredAtomicInstance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (__CFString *)v12;
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v12, v26, CFSTR(" "), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("activeClientCount"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v30, v24, CFSTR(" "), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("activeMonitorCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v41, v22, CFSTR(" "), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("maximumClientCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v40, v15, CFSTR(" "), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("totalClientCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v38, v17, CFSTR(" "), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@|%@"), v29, v27, v21, v25, v23, v20, v13, v14, v16, v18);
  v33 = (id)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (id)overviewNewMaxColumnStrings
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("clientDomainName"), CFSTR("clientDomainName"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("assetSetIdentifier"), CFSTR("assetSetIdentifier"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("configuredAssetEntries"), CFSTR("configuredAssetEntries"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("latestDownloadedAtomicInstance"), CFSTR("latestDownloadedAtomicInstance"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("downloadedAtomicInstances"), CFSTR("downloadedAtomicInstances"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("discoveredAtomicInstance"), CFSTR("discoveredAtomicInstance"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("activeClientCount"), CFSTR("activeClientCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("activeMonitorCount"), CFSTR("activeMonitorCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("maximumClientCount"), CFSTR("maximumClientCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("totalClientCount"), CFSTR("totalClientCount"));
  return v2;
}

+ (id)overviewPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  v13 = objc_msgSend(v12, "length");
  v14 = v12;
  if (v13 < objc_msgSend(v10, "length"))
  {
    v15 = objc_msgSend(v10, "length");
    v16 = v15 - objc_msgSend(v12, "length");
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByPaddingToLength:withString:startingAtIndex:", v16, v11, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v6)
      v20 = objc_msgSend(v19, "initWithFormat:", CFSTR("%@%@"), v18, v12);
    else
      v20 = objc_msgSend(v19, "initWithFormat:", CFSTR("%@%@"), v12, v18);
    v14 = (void *)v20;

  }
  return v14;
}

+ (id)overviewPaddedHeader:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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

  v20 = (void *)MEMORY[0x1E0CB3940];
  v3 = a3;
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientDomainName"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("clientDomainName"), v24, CFSTR(" "), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("assetSetIdentifier"), v23, CFSTR(" "), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("configuredAssetEntries"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("configuredAssetEntries"), v22, CFSTR(" "), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("latestDownloadedAtomicInstance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("latestDownloadedAtomicInstance"), v19, CFSTR(" "), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("downloadedAtomicInstances"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("downloadedAtomicInstances"), v18, CFSTR(" "), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("discoveredAtomicInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("discoveredAtomicInstance"), v17, CFSTR(" "), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeClientCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("activeClientCount"), v14, CFSTR(" "), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeMonitorCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("activeMonitorCount"), v12, CFSTR(" "), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("maximumClientCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("maximumClientCount"), v6, CFSTR(" "), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("totalClientCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("totalClientCount"), v8, CFSTR(" "), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@|%@"), v26, v25, v16, v15, v13, v11, v4, v5, v7, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)overviewPaddedBanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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

  v21 = (void *)MEMORY[0x1E0CB3940];
  v3 = a3;
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientDomainName"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v25, CFSTR("="), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v24, CFSTR("="), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("configuredAssetEntries"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v23, CFSTR("="), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("latestDownloadedAtomicInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v20, CFSTR("="), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("downloadedAtomicInstances"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v19, CFSTR("="), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("discoveredAtomicInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v17, CFSTR("="), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeClientCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v14, CFSTR("="), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeMonitorCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v13, CFSTR("="), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("maximumClientCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v6, CFSTR("="), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("totalClientCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetOverview, "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v8, CFSTR("="), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@|%@"), v26, v18, v16, v15, v11, v12, v4, v5, v7, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (void)setClientDomainName:(id)a3
{
  objc_storeStrong((id *)&self->_clientDomainName, a3);
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (void)setAssetSetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetSetIdentifier, a3);
}

- (NSArray)configuredAssetEntries
{
  return self->_configuredAssetEntries;
}

- (void)setConfiguredAssetEntries:(id)a3
{
  objc_storeStrong((id *)&self->_configuredAssetEntries, a3);
}

- (NSString)latestDownloadedAtomicInstance
{
  return self->_latestDownloadedAtomicInstance;
}

- (void)setLatestDownloadedAtomicInstance:(id)a3
{
  objc_storeStrong((id *)&self->_latestDownloadedAtomicInstance, a3);
}

- (NSArray)downloadedAtomicInstances
{
  return self->_downloadedAtomicInstances;
}

- (void)setDownloadedAtomicInstances:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedAtomicInstances, a3);
}

- (NSString)discoveredAtomicInstance
{
  return self->_discoveredAtomicInstance;
}

- (int64_t)activeClientCount
{
  return self->_activeClientCount;
}

- (void)setActiveClientCount:(int64_t)a3
{
  self->_activeClientCount = a3;
}

- (int64_t)activeMonitorCount
{
  return self->_activeMonitorCount;
}

- (void)setActiveMonitorCount:(int64_t)a3
{
  self->_activeMonitorCount = a3;
}

- (int64_t)maximumClientCount
{
  return self->_maximumClientCount;
}

- (void)setMaximumClientCount:(int64_t)a3
{
  self->_maximumClientCount = a3;
}

- (int64_t)totalClientCount
{
  return self->_totalClientCount;
}

- (void)setTotalClientCount:(int64_t)a3
{
  self->_totalClientCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredAtomicInstance, 0);
  objc_storeStrong((id *)&self->_downloadedAtomicInstances, 0);
  objc_storeStrong((id *)&self->_latestDownloadedAtomicInstance, 0);
  objc_storeStrong((id *)&self->_configuredAssetEntries, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
  objc_storeStrong((id *)&self->_clientDomainName, 0);
}

@end
