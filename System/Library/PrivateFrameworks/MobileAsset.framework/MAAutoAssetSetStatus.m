@implementation MAAutoAssetSetStatus

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withAtomicInstancesDownloaded:(id)a5 withNewerAtomicInstanceDiscovered:(id)a6 withNewerDiscoveredAtomicEntries:(id)a7 withLatestDownloadedAtomicInstance:(id)a8 withLatestDowloadedAtomicInstanceEntries:(id)a9 withAllDownloadedAtomicInstanceEntries:(id)a10 withCurrentNotifications:(id)a11 withCurrentNeedPolicy:(id)a12 withSchedulerPolicy:(id)a13 withStagerPolicy:(id)a14 withDownloadUserInitiated:(BOOL)a15 withDownloadProgress:(id)a16 withDownloadedNetworkBytes:(int64_t)a17 withDownloadedFilesystemBytes:(int64_t)a18 withCurrentLockUsage:(id)a19 withSelectorsForStaging:(id)a20 withAvailableForUseError:(id)a21 withNewerVersionError:(id)a22
{
  uint64_t v23;

  LOBYTE(v23) = a15;
  return -[MAAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:](self, "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:", a3, a4, 0, a5, 0, 0, 0, 0, a6, a7,
           a8,
           a9,
           0,
           0,
           0,
           0,
           a11,
           a12,
           a13,
           a14,
           v23,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22);
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withNewerAtomicInstanceDiscovered:(id)a7 withNewerDiscoveredAtomicEntries:(id)a8 withLatestDownloadedAtomicInstance:(id)a9 withLatestDowloadedAtomicInstanceEntries:(id)a10 withAllDownloadedAtomicInstanceEntries:(id)a11 withCurrentNotifications:(id)a12 withCurrentNeedPolicy:(id)a13 withSchedulerPolicy:(id)a14 withStagerPolicy:(id)a15 withDownloadUserInitiated:(BOOL)a16 withDownloadProgress:(id)a17 withDownloadedNetworkBytes:(int64_t)a18 withDownloadedFilesystemBytes:(int64_t)a19 withCurrentLockUsage:(id)a20 withSelectorsForStaging:(id)a21 withAvailableForUseError:(id)a22 withNewerVersionError:(id)a23
{
  uint64_t v24;

  LOBYTE(v24) = a16;
  return -[MAAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:](self, "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:", a3, a4, 0, a6, 0, 0, 0, 0, a7, a8,
           a9,
           a10,
           0,
           0,
           0,
           0,
           a12,
           a13,
           a14,
           a15,
           v24,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23);
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withCurrentNotifications:(id)a15 withCurrentNeedPolicy:(id)a16 withSchedulerPolicy:(id)a17 withStagerPolicy:(id)a18 withDownloadUserInitiated:(BOOL)a19 withDownloadProgress:(id)a20 withDownloadedNetworkBytes:(int64_t)a21 withDownloadedFilesystemBytes:(int64_t)a22 withCurrentLockUsage:(id)a23 withSelectorsForStaging:(id)a24 withAvailableForUseError:(id)a25 withNewerVersionError:(id)a26
{
  uint64_t v27;

  LOBYTE(v27) = a19;
  return -[MAAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:](self, "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           a14,
           0,
           0,
           0,
           0,
           a15,
           a16,
           a17,
           a18,
           v27,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 withDownloadUserInitiated:(BOOL)a23 withDownloadProgress:(id)a24 withDownloadedNetworkBytes:(int64_t)a25 withDownloadedFilesystemBytes:(int64_t)a26 withCurrentLockUsage:(id)a27 withSelectorsForStaging:(id)a28 withAvailableForUseError:(id)a29 withNewerVersionError:(id)a30
{
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  MAAutoAssetSetStatus *v42;
  MAAutoAssetSetStatus *v43;
  id v46;
  id v47;
  id v48;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  objc_super v68;

  v67 = a3;
  v46 = a4;
  v66 = a4;
  v47 = a5;
  v65 = a5;
  v64 = a6;
  v63 = a7;
  v48 = a8;
  v62 = a8;
  v61 = a9;
  v60 = a10;
  v59 = a11;
  v58 = a12;
  v57 = a13;
  v56 = a14;
  v55 = a15;
  v54 = a16;
  v53 = a17;
  v35 = a18;
  v36 = a19;
  v37 = a20;
  v38 = a21;
  v39 = a22;
  v40 = a24;
  v41 = a27;
  v52 = a28;
  v51 = a29;
  v50 = a30;
  v68.receiver = self;
  v68.super_class = (Class)MAAutoAssetSetStatus;
  v42 = -[MAAutoAssetSetStatus init](&v68, sel_init);
  v43 = v42;
  if (v42)
  {
    objc_storeStrong((id *)&v42->_clientDomainName, a3);
    objc_storeStrong((id *)&v43->_assetSetIdentifier, v46);
    objc_storeStrong((id *)&v43->_configuredAssetEntries, v47);
    objc_storeStrong((id *)&v43->_atomicInstancesDownloaded, a6);
    objc_storeStrong((id *)&v43->_catalogCachedAssetSetID, a7);
    objc_storeStrong((id *)&v43->_catalogDownloadedFromLive, v48);
    objc_storeStrong((id *)&v43->_catalogLastTimeChecked, a9);
    objc_storeStrong((id *)&v43->_catalogPostedDate, a10);
    objc_storeStrong((id *)&v43->_newerAtomicInstanceDiscovered, a11);
    objc_storeStrong((id *)&v43->_newerDiscoveredAtomicEntries, a12);
    objc_storeStrong((id *)&v43->_latestDownloadedAtomicInstance, a13);
    objc_storeStrong((id *)&v43->_latestDowloadedAtomicInstanceEntries, a14);
    objc_storeStrong((id *)&v43->_downloadedCatalogCachedAssetSetID, a15);
    objc_storeStrong((id *)&v43->_downloadedCatalogDownloadedFromLive, a16);
    objc_storeStrong((id *)&v43->_downloadedCatalogLastTimeChecked, a17);
    objc_storeStrong((id *)&v43->_downloadedCatalogPostedDate, a18);
    objc_storeStrong((id *)&v43->_currentNotifications, a19);
    objc_storeStrong((id *)&v43->_currentNeedPolicy, a20);
    objc_storeStrong((id *)&v43->_schedulerPolicy, a21);
    objc_storeStrong((id *)&v43->_stagerPolicy, a22);
    v43->_downloadUserInitiated = a23;
    objc_storeStrong((id *)&v43->_downloadProgress, a24);
    v43->_downloadedNetworkBytes = a25;
    v43->_downloadedFilesystemBytes = a26;
    objc_storeStrong((id *)&v43->_currentLockUsage, a27);
    objc_storeStrong((id *)&v43->_selectorsForStaging, a28);
    objc_storeStrong((id *)&v43->_availableForUseError, a29);
    objc_storeStrong((id *)&v43->_newerVersionError, a30);
  }

  return v43;
}

- (MAAutoAssetSetStatus)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetStatus *v5;
  void *v6;
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
  uint64_t v18;
  NSString *clientDomainName;
  uint64_t v20;
  NSString *assetSetIdentifier;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *configuredAssetEntries;
  uint64_t v27;
  NSArray *atomicInstancesDownloaded;
  uint64_t v29;
  NSString *catalogCachedAssetSetID;
  uint64_t v31;
  NSURL *catalogDownloadedFromLive;
  uint64_t v33;
  NSDate *catalogLastTimeChecked;
  uint64_t v35;
  NSDate *catalogPostedDate;
  uint64_t v37;
  NSString *newerAtomicInstanceDiscovered;
  uint64_t v39;
  NSArray *newerDiscoveredAtomicEntries;
  uint64_t v41;
  NSString *latestDownloadedAtomicInstance;
  uint64_t v43;
  NSArray *latestDowloadedAtomicInstanceEntries;
  uint64_t v45;
  NSString *downloadedCatalogCachedAssetSetID;
  uint64_t v47;
  NSURL *downloadedCatalogDownloadedFromLive;
  uint64_t v49;
  NSDate *downloadedCatalogLastTimeChecked;
  uint64_t v51;
  NSDate *downloadedCatalogPostedDate;
  uint64_t v53;
  MAAutoAssetSetNotifications *currentNotifications;
  uint64_t v55;
  MAAutoAssetSetPolicy *currentNeedPolicy;
  uint64_t v57;
  MAAutoAssetSetPolicy *schedulerPolicy;
  uint64_t v59;
  MAAutoAssetSetPolicy *stagerPolicy;
  uint64_t v61;
  MAAutoAssetSetProgress *downloadProgress;
  uint64_t v63;
  NSDictionary *currentLockUsage;
  uint64_t v65;
  NSDictionary *selectorsForStaging;
  uint64_t v67;
  NSError *availableForUseError;
  uint64_t v69;
  NSError *newerVersionError;
  objc_super v72;
  _QWORD v73[3];
  _QWORD v74[4];
  _QWORD v75[3];
  _QWORD v76[2];
  _QWORD v77[3];

  v77[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)MAAutoAssetSetStatus;
  v5 = -[MAAutoAssetSetStatus init](&v72, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v77[0] = objc_opt_class();
    v77[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99E60];
    v76[0] = objc_opt_class();
    v76[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0C99E60];
    v75[0] = objc_opt_class();
    v75[1] = objc_opt_class();
    v75[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0C99E60];
    v74[0] = objc_opt_class();
    v74[1] = objc_opt_class();
    v74[2] = objc_opt_class();
    v74[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDomainName"));
    v18 = objc_claimAutoreleasedReturnValue();
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSetIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v20;

    v22 = objc_alloc(MEMORY[0x1E0C99E60]);
    v73[0] = objc_opt_class();
    v73[1] = objc_opt_class();
    v73[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithArray:", v23);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("configuredAssetEntries"));
    v25 = objc_claimAutoreleasedReturnValue();
    configuredAssetEntries = v5->_configuredAssetEntries;
    v5->_configuredAssetEntries = (NSArray *)v25;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("atomicInstancesDownloaded"));
    v27 = objc_claimAutoreleasedReturnValue();
    atomicInstancesDownloaded = v5->_atomicInstancesDownloaded;
    v5->_atomicInstancesDownloaded = (NSArray *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("catalogCachedAssetSetID"));
    v29 = objc_claimAutoreleasedReturnValue();
    catalogCachedAssetSetID = v5->_catalogCachedAssetSetID;
    v5->_catalogCachedAssetSetID = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("catalogDownloadedFromLive"));
    v31 = objc_claimAutoreleasedReturnValue();
    catalogDownloadedFromLive = v5->_catalogDownloadedFromLive;
    v5->_catalogDownloadedFromLive = (NSURL *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("catalogLastTimeChecked"));
    v33 = objc_claimAutoreleasedReturnValue();
    catalogLastTimeChecked = v5->_catalogLastTimeChecked;
    v5->_catalogLastTimeChecked = (NSDate *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("catalogPostedDate"));
    v35 = objc_claimAutoreleasedReturnValue();
    catalogPostedDate = v5->_catalogPostedDate;
    v5->_catalogPostedDate = (NSDate *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("newerAtomicInstanceDiscovered"));
    v37 = objc_claimAutoreleasedReturnValue();
    newerAtomicInstanceDiscovered = v5->_newerAtomicInstanceDiscovered;
    v5->_newerAtomicInstanceDiscovered = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("newerDiscoveredAtomicEntries"));
    v39 = objc_claimAutoreleasedReturnValue();
    newerDiscoveredAtomicEntries = v5->_newerDiscoveredAtomicEntries;
    v5->_newerDiscoveredAtomicEntries = (NSArray *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latestDownloadedAtomicInstance"));
    v41 = objc_claimAutoreleasedReturnValue();
    latestDownloadedAtomicInstance = v5->_latestDownloadedAtomicInstance;
    v5->_latestDownloadedAtomicInstance = (NSString *)v41;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("latestDowloadedAtomicInstanceEntries"));
    v43 = objc_claimAutoreleasedReturnValue();
    latestDowloadedAtomicInstanceEntries = v5->_latestDowloadedAtomicInstanceEntries;
    v5->_latestDowloadedAtomicInstanceEntries = (NSArray *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadedCatalogCachedAssetSetID"));
    v45 = objc_claimAutoreleasedReturnValue();
    downloadedCatalogCachedAssetSetID = v5->_downloadedCatalogCachedAssetSetID;
    v5->_downloadedCatalogCachedAssetSetID = (NSString *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadedCatalogDownloadedFromLive"));
    v47 = objc_claimAutoreleasedReturnValue();
    downloadedCatalogDownloadedFromLive = v5->_downloadedCatalogDownloadedFromLive;
    v5->_downloadedCatalogDownloadedFromLive = (NSURL *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadedCatalogLastTimeChecked"));
    v49 = objc_claimAutoreleasedReturnValue();
    downloadedCatalogLastTimeChecked = v5->_downloadedCatalogLastTimeChecked;
    v5->_downloadedCatalogLastTimeChecked = (NSDate *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadedCatalogPostedDate"));
    v51 = objc_claimAutoreleasedReturnValue();
    downloadedCatalogPostedDate = v5->_downloadedCatalogPostedDate;
    v5->_downloadedCatalogPostedDate = (NSDate *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentNotifications"));
    v53 = objc_claimAutoreleasedReturnValue();
    currentNotifications = v5->_currentNotifications;
    v5->_currentNotifications = (MAAutoAssetSetNotifications *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentNeedPolicy"));
    v55 = objc_claimAutoreleasedReturnValue();
    currentNeedPolicy = v5->_currentNeedPolicy;
    v5->_currentNeedPolicy = (MAAutoAssetSetPolicy *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schedulerPolicy"));
    v57 = objc_claimAutoreleasedReturnValue();
    schedulerPolicy = v5->_schedulerPolicy;
    v5->_schedulerPolicy = (MAAutoAssetSetPolicy *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagerPolicy"));
    v59 = objc_claimAutoreleasedReturnValue();
    stagerPolicy = v5->_stagerPolicy;
    v5->_stagerPolicy = (MAAutoAssetSetPolicy *)v59;

    v5->_downloadUserInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadUserInitiated"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadProgress"));
    v61 = objc_claimAutoreleasedReturnValue();
    downloadProgress = v5->_downloadProgress;
    v5->_downloadProgress = (MAAutoAssetSetProgress *)v61;

    v5->_downloadedNetworkBytes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downloadedNetworkBytes"));
    v5->_downloadedFilesystemBytes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downloadedFilesystemBytes"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("currentLockUsage"));
    v63 = objc_claimAutoreleasedReturnValue();
    currentLockUsage = v5->_currentLockUsage;
    v5->_currentLockUsage = (NSDictionary *)v63;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("selectorsForStaging"));
    v65 = objc_claimAutoreleasedReturnValue();
    selectorsForStaging = v5->_selectorsForStaging;
    v5->_selectorsForStaging = (NSDictionary *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availableForUseError"));
    v67 = objc_claimAutoreleasedReturnValue();
    availableForUseError = v5->_availableForUseError;
    v5->_availableForUseError = (NSError *)v67;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("newerVersionError"));
    v69 = objc_claimAutoreleasedReturnValue();
    newerVersionError = v5->_newerVersionError;
    v5->_newerVersionError = (NSError *)v69;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  id v29;

  v4 = a3;
  -[MAAutoAssetSetStatus clientDomainName](self, "clientDomainName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("clientDomainName"));

  -[MAAutoAssetSetStatus assetSetIdentifier](self, "assetSetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetSetIdentifier"));

  -[MAAutoAssetSetStatus configuredAssetEntries](self, "configuredAssetEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("configuredAssetEntries"));

  -[MAAutoAssetSetStatus atomicInstancesDownloaded](self, "atomicInstancesDownloaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("atomicInstancesDownloaded"));

  -[MAAutoAssetSetStatus catalogCachedAssetSetID](self, "catalogCachedAssetSetID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("catalogCachedAssetSetID"));

  -[MAAutoAssetSetStatus catalogDownloadedFromLive](self, "catalogDownloadedFromLive");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("catalogDownloadedFromLive"));

  -[MAAutoAssetSetStatus catalogLastTimeChecked](self, "catalogLastTimeChecked");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("catalogLastTimeChecked"));

  -[MAAutoAssetSetStatus catalogPostedDate](self, "catalogPostedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("catalogPostedDate"));

  -[MAAutoAssetSetStatus newerAtomicInstanceDiscovered](self, "newerAtomicInstanceDiscovered");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("newerAtomicInstanceDiscovered"));

  -[MAAutoAssetSetStatus newerDiscoveredAtomicEntries](self, "newerDiscoveredAtomicEntries");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("newerDiscoveredAtomicEntries"));

  -[MAAutoAssetSetStatus latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("latestDownloadedAtomicInstance"));

  -[MAAutoAssetSetStatus latestDowloadedAtomicInstanceEntries](self, "latestDowloadedAtomicInstanceEntries");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("latestDowloadedAtomicInstanceEntries"));

  -[MAAutoAssetSetStatus downloadedCatalogCachedAssetSetID](self, "downloadedCatalogCachedAssetSetID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("downloadedCatalogCachedAssetSetID"));

  -[MAAutoAssetSetStatus downloadedCatalogDownloadedFromLive](self, "downloadedCatalogDownloadedFromLive");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("downloadedCatalogDownloadedFromLive"));

  -[MAAutoAssetSetStatus downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("downloadedCatalogLastTimeChecked"));

  -[MAAutoAssetSetStatus downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("downloadedCatalogPostedDate"));

  -[MAAutoAssetSetStatus currentNotifications](self, "currentNotifications");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("currentNotifications"));

  -[MAAutoAssetSetStatus currentNeedPolicy](self, "currentNeedPolicy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("currentNeedPolicy"));

  -[MAAutoAssetSetStatus schedulerPolicy](self, "schedulerPolicy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("schedulerPolicy"));

  -[MAAutoAssetSetStatus stagerPolicy](self, "stagerPolicy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("stagerPolicy"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetStatus downloadUserInitiated](self, "downloadUserInitiated"), CFSTR("downloadUserInitiated"));
  -[MAAutoAssetSetStatus downloadProgress](self, "downloadProgress");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("downloadProgress"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes"), CFSTR("downloadedNetworkBytes"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes"), CFSTR("downloadedFilesystemBytes"));
  -[MAAutoAssetSetStatus currentLockUsage](self, "currentLockUsage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("currentLockUsage"));

  -[MAAutoAssetSetStatus selectorsForStaging](self, "selectorsForStaging");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("selectorsForStaging"));

  -[MAAutoAssetSetStatus availableForUseError](self, "availableForUseError");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("availableForUseError"));

  -[MAAutoAssetSetStatus newerVersionError](self, "newerVersionError");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("newerVersionError"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  BOOL v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
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
  MAAutoAssetSetStatus *v25;
  id v26;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v25 = [MAAutoAssetSetStatus alloc];
  -[MAAutoAssetSetStatus clientDomainName](self, "clientDomainName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus assetSetIdentifier](self, "assetSetIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus configuredAssetEntries](self, "configuredAssetEntries");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v31, "copy");
  -[MAAutoAssetSetStatus atomicInstancesDownloaded](self, "atomicInstancesDownloaded");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v30, "copy");
  -[MAAutoAssetSetStatus catalogCachedAssetSetID](self, "catalogCachedAssetSetID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus catalogDownloadedFromLive](self, "catalogDownloadedFromLive");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus catalogLastTimeChecked](self, "catalogLastTimeChecked");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus catalogPostedDate](self, "catalogPostedDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus newerAtomicInstanceDiscovered](self, "newerAtomicInstanceDiscovered");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus newerDiscoveredAtomicEntries](self, "newerDiscoveredAtomicEntries");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v29, "copy");
  -[MAAutoAssetSetStatus latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v28, "copy");
  -[MAAutoAssetSetStatus latestDowloadedAtomicInstanceEntries](self, "latestDowloadedAtomicInstanceEntries");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v27, "copy");
  -[MAAutoAssetSetStatus downloadedCatalogCachedAssetSetID](self, "downloadedCatalogCachedAssetSetID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus downloadedCatalogDownloadedFromLive](self, "downloadedCatalogDownloadedFromLive");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus currentNotifications](self, "currentNotifications");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v24, "copy");
  -[MAAutoAssetSetStatus currentNeedPolicy](self, "currentNeedPolicy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v23, "copy");
  -[MAAutoAssetSetStatus schedulerPolicy](self, "schedulerPolicy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v22, "copy");
  -[MAAutoAssetSetStatus stagerPolicy](self, "stagerPolicy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v20, "copy");
  v3 = -[MAAutoAssetSetStatus downloadUserInitiated](self, "downloadUserInitiated");
  -[MAAutoAssetSetStatus downloadProgress](self, "downloadProgress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v17, "copy");
  v5 = -[MAAutoAssetSetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes");
  v6 = -[MAAutoAssetSetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  -[MAAutoAssetSetStatus currentLockUsage](self, "currentLockUsage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus selectorsForStaging](self, "selectorsForStaging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus availableForUseError](self, "availableForUseError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus newerVersionError](self, "newerVersionError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = v3;
  v26 = -[MAAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:](v25, "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:", v44, v43, v42, v41, v40, v38, v39, v37, v36, v35, v34,
          v32,
          v21,
          v33,
          v19,
          v18,
          v16,
          v15,
          v14,
          v13,
          v12,
          v4,
          v5,
          v6,
          v7,
          v8,
          v9,
          v10);

  return v26;
}

- (id)description
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  __CFString *v12;
  _BOOL4 v13;
  const __CFString *v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  int64_t v28;
  int64_t v29;
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
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
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
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  __CFString *v63;
  __CFString *v64;
  __CFString *v65;
  __CFString *v66;
  __CFString *v67;
  __CFString *v68;
  __CFString *v69;
  __CFString *v70;
  __CFString *v71;
  __CFString *v72;
  __CFString *v73;
  __CFString *v74;
  __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd_HH:mm:ss"));
  v47 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetStatus clientDomainName](self, "clientDomainName");
  v4 = objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus assetSetIdentifier](self, "assetSetIdentifier");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus configuredAssetEntries](self, "configuredAssetEntries");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSetStatus configuredAssetEntries](self, "configuredAssetEntries");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (__CFString *)objc_msgSend(v5, "initWithFormat:", CFSTR("%ld"), objc_msgSend(v42, "count"));
  }
  else
  {
    v75 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus atomicInstancesDownloaded](self, "atomicInstancesDownloaded");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSetStatus atomicInstancesDownloaded](self, "atomicInstancesDownloaded");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (__CFString *)objc_msgSend(v6, "initWithFormat:", CFSTR("%ld"), objc_msgSend(v41, "count"));
  }
  else
  {
    v74 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus catalogCachedAssetSetID](self, "catalogCachedAssetSetID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    -[MAAutoAssetSetStatus catalogCachedAssetSetID](self, "catalogCachedAssetSetID");
    v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v73 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus catalogDownloadedFromLive](self, "catalogDownloadedFromLive");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    -[MAAutoAssetSetStatus catalogDownloadedFromLive](self, "catalogDownloadedFromLive");
    v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v72 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus catalogLastTimeChecked](self, "catalogLastTimeChecked");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetSetStatus catalogLastTimeChecked](self, "catalogLastTimeChecked");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:");
    v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v71 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus catalogPostedDate](self, "catalogPostedDate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[MAAutoAssetSetStatus catalogPostedDate](self, "catalogPostedDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:");
    v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v70 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus newerAtomicInstanceDiscovered](self, "newerAtomicInstanceDiscovered");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MAAutoAssetSetStatus newerAtomicInstanceDiscovered](self, "newerAtomicInstanceDiscovered");
    v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v69 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus newerDiscoveredAtomicEntries](self, "newerDiscoveredAtomicEntries");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSetStatus newerDiscoveredAtomicEntries](self, "newerDiscoveredAtomicEntries");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (__CFString *)objc_msgSend(v10, "initWithFormat:", CFSTR("%ld"), objc_msgSend(v38, "count"));
  }
  else
  {
    v68 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {
    -[MAAutoAssetSetStatus latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
    v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v67 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus latestDowloadedAtomicInstanceEntries](self, "latestDowloadedAtomicInstanceEntries");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSetStatus latestDowloadedAtomicInstanceEntries](self, "latestDowloadedAtomicInstanceEntries");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (__CFString *)objc_msgSend(v11, "initWithFormat:", CFSTR("%ld"), objc_msgSend(v37, "count"));
  }
  else
  {
    v66 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus downloadedCatalogCachedAssetSetID](self, "downloadedCatalogCachedAssetSetID");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    -[MAAutoAssetSetStatus downloadedCatalogCachedAssetSetID](self, "downloadedCatalogCachedAssetSetID");
    v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v65 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus downloadedCatalogDownloadedFromLive](self, "downloadedCatalogDownloadedFromLive");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    -[MAAutoAssetSetStatus downloadedCatalogDownloadedFromLive](self, "downloadedCatalogDownloadedFromLive");
    v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v64 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    -[MAAutoAssetSetStatus downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:");
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v63 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    -[MAAutoAssetSetStatus downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:");
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v62 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus currentNotifications](self, "currentNotifications");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "summary");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus currentNeedPolicy](self, "currentNeedPolicy");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    -[MAAutoAssetSetStatus currentNeedPolicy](self, "currentNeedPolicy");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "summary");
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus schedulerPolicy](self, "schedulerPolicy");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v7;
  if (v76)
  {
    -[MAAutoAssetSetStatus schedulerPolicy](self, "schedulerPolicy");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "summary");
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v60 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus stagerPolicy](self, "stagerPolicy");
  v12 = CFSTR("N");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    -[MAAutoAssetSetStatus stagerPolicy](self, "stagerPolicy");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "summary");
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = CFSTR("N");
  }
  v13 = -[MAAutoAssetSetStatus downloadUserInitiated](self, "downloadUserInitiated");
  v14 = CFSTR("Y");
  if (!v13)
    v14 = CFSTR("N");
  v43 = v14;
  -[MAAutoAssetSetStatus downloadProgress](self, "downloadProgress");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)v4;
  v56 = v3;
  if (v44)
  {
    -[MAAutoAssetSetStatus downloadProgress](self, "downloadProgress");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "description");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v15 = -[MAAutoAssetSetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes");
  v16 = -[MAAutoAssetSetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  -[MAAutoAssetSetStatus currentLockUsage](self, "currentLockUsage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v58 = +[MAAutoAssetSetStatus newCurrentLockUsageSummary:](MAAutoAssetSetStatus, "newCurrentLockUsageSummary:", self);
  else
    v58 = CFSTR("N");
  -[MAAutoAssetSetStatus selectorsForStaging](self, "selectorsForStaging");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v57 = +[MAAutoAssetSetStatus newSelectorsForStagingSummary:](MAAutoAssetSetStatus, "newSelectorsForStagingSummary:", self);
  else
    v57 = CFSTR("N");
  v48 = (void *)v9;
  -[MAAutoAssetSetStatus availableForUseError](self, "availableForUseError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v8;
  if (v19)
  {
    -[MAAutoAssetSetStatus availableForUseError](self, "availableForUseError");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "checkedSummary");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus newerVersionError](self, "newerVersionError");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[MAAutoAssetSetStatus newerVersionError](self, "newerVersionError");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "checkedSummary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v15;
    v24 = v55;
    objc_msgSend(v47, "stringWithFormat:", CFSTR("                      clientDomainName: %@\n                    assetSetIdentifier: %@\n                configuredAssetEntries: %@\n             atomicInstancesDownloaded: %@\n               catalogCachedAssetSetID: %@\n             catalogDownloadedFromLive: %@\n                catalogLastTimeChecked: %@\n                     catalogPostedDate: %@\n         newerAtomicInstanceDiscovered: %@\n          newerDiscoveredAtomicEntries: %@\n              latestDownloadedInstance: %@\n        latestDowloadedInstanceEntries: %@\n     downloadedCatalogCachedAssetSetID: %@\n   downloadedCatalogDownloadedFromLive: %@\n      downloadedCatalogLastTimeChecked: %@\n           downloadedCatalogPostedDate: %@\n                  currentNotifications: %@\n                     currentNeedPolicy: %@\n                       schedulerPolicy: %@\n                          stagerPolicy: %@\n                 downloadUserInitiated: %@\n                      downloadProgress:\n%@\n                downloadedNetworkBytes: %ld\n             downloadedFilesystemBytes: %ld\n                      currentLockUsage: %@\n                   selectorsForStaging: %@\n                  availableForUseError: %@\n                     newerVersionError: %@\n"), v55, v86, v75, v74, v73, v72, v71, v70, v69, v68, v67, v66, v65, v64, v63, v62,
      v78,
      v61,
      v60,
      v59,
      v43,
      v12,
      v28,
      v16,
      v58,
      v57,
      v20,
      v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = v15;
    v24 = v55;
    objc_msgSend(v47, "stringWithFormat:", CFSTR("                      clientDomainName: %@\n                    assetSetIdentifier: %@\n                configuredAssetEntries: %@\n             atomicInstancesDownloaded: %@\n               catalogCachedAssetSetID: %@\n             catalogDownloadedFromLive: %@\n                catalogLastTimeChecked: %@\n                     catalogPostedDate: %@\n         newerAtomicInstanceDiscovered: %@\n          newerDiscoveredAtomicEntries: %@\n              latestDownloadedInstance: %@\n        latestDowloadedInstanceEntries: %@\n     downloadedCatalogCachedAssetSetID: %@\n   downloadedCatalogDownloadedFromLive: %@\n      downloadedCatalogLastTimeChecked: %@\n           downloadedCatalogPostedDate: %@\n                  currentNotifications: %@\n                     currentNeedPolicy: %@\n                       schedulerPolicy: %@\n                          stagerPolicy: %@\n                 downloadUserInitiated: %@\n                      downloadProgress:\n%@\n                downloadedNetworkBytes: %ld\n             downloadedFilesystemBytes: %ld\n                      currentLockUsage: %@\n                   selectorsForStaging: %@\n                  availableForUseError: %@\n                     newerVersionError: %@\n"), v55, v86, v75, v74, v73, v72, v71, v70, v69, v68, v67, v66, v65, v64, v63, v62,
      v78,
      v61,
      v60,
      v59,
      v43,
      v12,
      v29,
      v16,
      v58,
      v57,
      v20,
      CFSTR("N"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v19)
  {

  }
  if (v18)

  if (v17)
  if (v44)
  {

  }
  if (v45)
  {

  }
  if (v76)
  {

  }
  if (v77)
  {

  }
  if (v79)
  {

  }
  if (v80)
  {

  }
  if (v81)

  if (v82)
  if (v83)
  {

  }
  if (v84)

  if (v85)
  {

  }
  if (v48)

  if (v49)
  {

  }
  if (v50)
  {

  }
  if (v51)

  if (v52)
  if (v53)
  {

  }
  if (v54)
  {

  }
  v26 = v25;

  return v26;
}

- (id)summary
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;

  v25 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetStatus clientDomainName](self, "clientDomainName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus assetSetIdentifier](self, "assetSetIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetStatus configuredAssetEntries](self, "configuredAssetEntries");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v28, "count");
  -[MAAutoAssetSetStatus atomicInstancesDownloaded](self, "atomicInstancesDownloaded");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v27, "count");
  -[MAAutoAssetSetStatus newerAtomicInstanceDiscovered](self, "newerAtomicInstanceDiscovered");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MAAutoAssetSetStatus newerAtomicInstanceDiscovered](self, "newerAtomicInstanceDiscovered");
    v26 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus newerDiscoveredAtomicEntries](self, "newerDiscoveredAtomicEntries");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v24, "count");
  -[MAAutoAssetSetStatus latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v4;
  if (v7)
  {
    -[MAAutoAssetSetStatus latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("N");
  }
  -[MAAutoAssetSetStatus latestDowloadedAtomicInstanceEntries](self, "latestDowloadedAtomicInstanceEntries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (-[MAAutoAssetSetStatus downloadUserInitiated](self, "downloadUserInitiated"))
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  -[MAAutoAssetSetStatus currentLockUsage](self, "currentLockUsage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = +[MAAutoAssetSetStatus newCurrentLockUsageSummary:](MAAutoAssetSetStatus, "newCurrentLockUsageSummary:", self);
    v20 = v10;
    v18 = v6;
    v14 = (__CFString *)v26;
    v15 = v29;
    objc_msgSend(v25, "stringWithFormat:", CFSTR("[domain:%@|setID:%@|config:%ld|AIs:%ld(newer:%@[%ld])(latest:%@[%ld])|user:%@|locks:%@]"), v3, v29, v23, v22, v26, v18, v8, v20, v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = v10;
    v19 = v6;
    v14 = (__CFString *)v26;
    v15 = v29;
    objc_msgSend(v25, "stringWithFormat:", CFSTR("[domain:%@|setID:%@|config:%ld|AIs:%ld(newer:%@[%ld])(latest:%@[%ld])|user:%@|locks:%@]"), v3, v29, v23, v22, v26, v19, v8, v21, v11, CFSTR("N"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  if (v5)

  return v16;
}

+ (id)newCurrentLockUsageSummary:(id)a3
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  id obj;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "currentLockUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("{"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v3, "currentLockUsage");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v22)
    {
      v20 = *(_QWORD *)v29;
      v21 = v3;
      v5 = 1;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(obj);
          v23 = v6;
          v7 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v6);
          objc_msgSend(v3, "currentLockUsage");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "safeObjectForKey:ofClass:", v7, objc_opt_class());
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v25;
            v14 = v5;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v10);
                v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
                v17 = objc_msgSend(v10, "safeIntegerForKey:", v16);
                if ((v14 & 1) == 0)
                  objc_msgSend(v4, "appendString:", CFSTR(","));
                objc_msgSend(v4, "appendFormat:", CFSTR("[lockReason:%@ atomicInstance:%@ lockCount:%ld]"), v7, v16, v17);
                v14 = 0;
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              v14 = 0;
              v5 = 0;
            }
            while (v12);
          }

          v6 = v23 + 1;
          v3 = v21;
        }
        while (v23 + 1 != v22);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v22);
    }

    objc_msgSend(v4, "appendString:", CFSTR("}"));
  }

  return v4;
}

+ (id)newCurrentLockUsageDetailed:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "currentLockUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "currentLockUsage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@"), v7);

  }
  return v4;
}

+ (id)newSelectorsForStagingSummary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "selectorsForStaging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("{"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "selectorsForStaging");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      v8 = 1;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
          objc_msgSend(v3, "selectorsForStaging");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "safeObjectForKey:ofClass:", v10, objc_opt_class());
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_msgSend(v12, "count");
          if ((v8 & 1) == 0)
            objc_msgSend(v4, "appendString:", CFSTR(","));
          objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld"), v10, v13);

          v8 = 0;
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v8 = 0;
      }
      while (v6);
    }

    objc_msgSend(v4, "appendString:", CFSTR("}"));
  }

  return v4;
}

+ (id)shortTermLockFilename:(id)a3 forAssetSetIdentifier:(id)a4 forSetAtomicInstance:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  +[MAAutoAssetSetStatus _shortTermLockFilenameNormalizedComponent:](MAAutoAssetSetStatus, "_shortTermLockFilenameNormalizedComponent:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetStatus _shortTermLockFilenameNormalizedComponent:](MAAutoAssetSetStatus, "_shortTermLockFilenameNormalizedComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11 = CFSTR("specific");
    if ((objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v7, CFSTR("specific")) & 1) == 0)
      v11 = (__CFString *)v7;
  }
  else
  {
    v11 = CFSTR("latest");
  }
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  getRepositoryPath(CFSTR("/private/var/MobileAsset/AssetsV2/locks"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@/%@/%@/%@/%@_%@.%@"), v13, v9, v10, CFSTR("shared_locks"), CFSTR("atomic_instance"), v11, CFSTR("locker"));

  return v14;
}

+ (id)_shortTermLockFilenameNormalizedComponent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3500];
    v4 = a3;
    objc_msgSend(v3, "characterSetWithCharactersInString:", CFSTR(":;,/\\?~%*|\"<>[](){}"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("_"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (NSArray)configuredAssetEntries
{
  return self->_configuredAssetEntries;
}

- (void)setConfiguredAssetEntries:(id)a3
{
  objc_storeStrong((id *)&self->_configuredAssetEntries, a3);
}

- (NSArray)atomicInstancesDownloaded
{
  return self->_atomicInstancesDownloaded;
}

- (void)setAtomicInstancesDownloaded:(id)a3
{
  objc_storeStrong((id *)&self->_atomicInstancesDownloaded, a3);
}

- (NSString)catalogCachedAssetSetID
{
  return self->_catalogCachedAssetSetID;
}

- (void)setCatalogCachedAssetSetID:(id)a3
{
  objc_storeStrong((id *)&self->_catalogCachedAssetSetID, a3);
}

- (NSURL)catalogDownloadedFromLive
{
  return self->_catalogDownloadedFromLive;
}

- (void)setCatalogDownloadedFromLive:(id)a3
{
  objc_storeStrong((id *)&self->_catalogDownloadedFromLive, a3);
}

- (NSDate)catalogLastTimeChecked
{
  return self->_catalogLastTimeChecked;
}

- (void)setCatalogLastTimeChecked:(id)a3
{
  objc_storeStrong((id *)&self->_catalogLastTimeChecked, a3);
}

- (NSDate)catalogPostedDate
{
  return self->_catalogPostedDate;
}

- (void)setCatalogPostedDate:(id)a3
{
  objc_storeStrong((id *)&self->_catalogPostedDate, a3);
}

- (NSString)newerAtomicInstanceDiscovered
{
  return self->_newerAtomicInstanceDiscovered;
}

- (void)setNewerAtomicInstanceDiscovered:(id)a3
{
  objc_storeStrong((id *)&self->_newerAtomicInstanceDiscovered, a3);
}

- (NSArray)newerDiscoveredAtomicEntries
{
  return self->_newerDiscoveredAtomicEntries;
}

- (void)setNewerDiscoveredAtomicEntries:(id)a3
{
  objc_storeStrong((id *)&self->_newerDiscoveredAtomicEntries, a3);
}

- (NSString)latestDownloadedAtomicInstance
{
  return self->_latestDownloadedAtomicInstance;
}

- (void)setLatestDownloadedAtomicInstance:(id)a3
{
  objc_storeStrong((id *)&self->_latestDownloadedAtomicInstance, a3);
}

- (NSArray)latestDowloadedAtomicInstanceEntries
{
  return self->_latestDowloadedAtomicInstanceEntries;
}

- (void)setLatestDowloadedAtomicInstanceEntries:(id)a3
{
  objc_storeStrong((id *)&self->_latestDowloadedAtomicInstanceEntries, a3);
}

- (NSDictionary)allDownloadedAtomicInstanceEntries
{
  return self->_allDownloadedAtomicInstanceEntries;
}

- (void)setAllDownloadedAtomicInstanceEntries:(id)a3
{
  objc_storeStrong((id *)&self->_allDownloadedAtomicInstanceEntries, a3);
}

- (NSString)downloadedCatalogCachedAssetSetID
{
  return self->_downloadedCatalogCachedAssetSetID;
}

- (void)setDownloadedCatalogCachedAssetSetID:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedCatalogCachedAssetSetID, a3);
}

- (NSURL)downloadedCatalogDownloadedFromLive
{
  return self->_downloadedCatalogDownloadedFromLive;
}

- (void)setDownloadedCatalogDownloadedFromLive:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedCatalogDownloadedFromLive, a3);
}

- (NSDate)downloadedCatalogLastTimeChecked
{
  return self->_downloadedCatalogLastTimeChecked;
}

- (void)setDownloadedCatalogLastTimeChecked:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedCatalogLastTimeChecked, a3);
}

- (NSDate)downloadedCatalogPostedDate
{
  return self->_downloadedCatalogPostedDate;
}

- (void)setDownloadedCatalogPostedDate:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedCatalogPostedDate, a3);
}

- (MAAutoAssetSetNotifications)currentNotifications
{
  return self->_currentNotifications;
}

- (void)setCurrentNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_currentNotifications, a3);
}

- (MAAutoAssetSetPolicy)currentNeedPolicy
{
  return self->_currentNeedPolicy;
}

- (void)setCurrentNeedPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_currentNeedPolicy, a3);
}

- (MAAutoAssetSetPolicy)schedulerPolicy
{
  return self->_schedulerPolicy;
}

- (void)setSchedulerPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_schedulerPolicy, a3);
}

- (MAAutoAssetSetPolicy)stagerPolicy
{
  return self->_stagerPolicy;
}

- (void)setStagerPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_stagerPolicy, a3);
}

- (BOOL)downloadUserInitiated
{
  return self->_downloadUserInitiated;
}

- (void)setDownloadUserInitiated:(BOOL)a3
{
  self->_downloadUserInitiated = a3;
}

- (MAAutoAssetSetProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgress, a3);
}

- (int64_t)downloadedNetworkBytes
{
  return self->_downloadedNetworkBytes;
}

- (void)setDownloadedNetworkBytes:(int64_t)a3
{
  self->_downloadedNetworkBytes = a3;
}

- (int64_t)downloadedFilesystemBytes
{
  return self->_downloadedFilesystemBytes;
}

- (void)setDownloadedFilesystemBytes:(int64_t)a3
{
  self->_downloadedFilesystemBytes = a3;
}

- (NSDictionary)currentLockUsage
{
  return self->_currentLockUsage;
}

- (void)setCurrentLockUsage:(id)a3
{
  objc_storeStrong((id *)&self->_currentLockUsage, a3);
}

- (NSDictionary)selectorsForStaging
{
  return self->_selectorsForStaging;
}

- (void)setSelectorsForStaging:(id)a3
{
  objc_storeStrong((id *)&self->_selectorsForStaging, a3);
}

- (NSError)availableForUseError
{
  return self->_availableForUseError;
}

- (void)setAvailableForUseError:(id)a3
{
  objc_storeStrong((id *)&self->_availableForUseError, a3);
}

- (NSError)newerVersionError
{
  return self->_newerVersionError;
}

- (void)setNewerVersionError:(id)a3
{
  objc_storeStrong((id *)&self->_newerVersionError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newerVersionError, 0);
  objc_storeStrong((id *)&self->_availableForUseError, 0);
  objc_storeStrong((id *)&self->_selectorsForStaging, 0);
  objc_storeStrong((id *)&self->_currentLockUsage, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_stagerPolicy, 0);
  objc_storeStrong((id *)&self->_schedulerPolicy, 0);
  objc_storeStrong((id *)&self->_currentNeedPolicy, 0);
  objc_storeStrong((id *)&self->_currentNotifications, 0);
  objc_storeStrong((id *)&self->_downloadedCatalogPostedDate, 0);
  objc_storeStrong((id *)&self->_downloadedCatalogLastTimeChecked, 0);
  objc_storeStrong((id *)&self->_downloadedCatalogDownloadedFromLive, 0);
  objc_storeStrong((id *)&self->_downloadedCatalogCachedAssetSetID, 0);
  objc_storeStrong((id *)&self->_allDownloadedAtomicInstanceEntries, 0);
  objc_storeStrong((id *)&self->_latestDowloadedAtomicInstanceEntries, 0);
  objc_storeStrong((id *)&self->_latestDownloadedAtomicInstance, 0);
  objc_storeStrong((id *)&self->_newerDiscoveredAtomicEntries, 0);
  objc_storeStrong((id *)&self->_newerAtomicInstanceDiscovered, 0);
  objc_storeStrong((id *)&self->_catalogPostedDate, 0);
  objc_storeStrong((id *)&self->_catalogLastTimeChecked, 0);
  objc_storeStrong((id *)&self->_catalogDownloadedFromLive, 0);
  objc_storeStrong((id *)&self->_catalogCachedAssetSetID, 0);
  objc_storeStrong((id *)&self->_atomicInstancesDownloaded, 0);
  objc_storeStrong((id *)&self->_configuredAssetEntries, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
  objc_storeStrong((id *)&self->_clientDomainName, 0);
}

@end
