@implementation MAAutoAssetSetInstanceDescriptor

- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withAtomicInstanceEntries:(id)a5 withFullyDownloaded:(BOOL)a6 withNeverBeenLocked:(BOOL)a7 withDownloadUserInitiated:(BOOL)a8 withDownloadedNetworkBytes:(int64_t)a9 withDownloadedFilesystemBytes:(int64_t)a10 withStagedPriorToAvailable:(BOOL)a11
{
  id v18;
  id v19;
  id v20;
  MAAutoAssetSetInstanceDescriptor *v21;
  MAAutoAssetSetInstanceDescriptor *v22;
  objc_super v24;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MAAutoAssetSetInstanceDescriptor;
  v21 = -[MAAutoAssetSetInstanceDescriptor init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_clientDomainName, a3);
    objc_storeStrong((id *)&v22->_assetSetIdentifier, a4);
    objc_storeStrong((id *)&v22->_atomicInstanceEntries, a5);
    v22->_isFullyDownloaded = a6;
    v22->_neverBeenLocked = a7;
    v22->_downloadUserInitiated = a8;
    v22->_downloadedNetworkBytes = a9;
    v22->_downloadedFilesystemBytes = a10;
    v22->_stagedPriorToAvailable = a11;
  }

  return v22;
}

- (MAAutoAssetSetInstanceDescriptor)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetInstanceDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *clientDomainName;
  uint64_t v11;
  NSString *assetSetIdentifier;
  uint64_t v13;
  NSArray *atomicInstanceEntries;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MAAutoAssetSetInstanceDescriptor;
  v5 = -[MAAutoAssetSetInstanceDescriptor init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
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

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("atomicInstanceEntries"));
    v13 = objc_claimAutoreleasedReturnValue();
    atomicInstanceEntries = v5->_atomicInstanceEntries;
    v5->_atomicInstanceEntries = (NSArray *)v13;

    v5->_isFullyDownloaded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFullyDownloaded"));
    v5->_neverBeenLocked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("neverBeenLocked"));
    v5->_downloadUserInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadUserInitiated"));
    v5->_downloadedNetworkBytes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downloadedNetworkBytes"));
    v5->_downloadedFilesystemBytes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downloadedFilesystemBytes"));
    v5->_stagedPriorToAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("stagedPriorToAvailable"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MAAutoAssetSetInstanceDescriptor clientDomainName](self, "clientDomainName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("clientDomainName"));

  -[MAAutoAssetSetInstanceDescriptor assetSetIdentifier](self, "assetSetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("assetSetIdentifier"));

  -[MAAutoAssetSetInstanceDescriptor atomicInstanceEntries](self, "atomicInstanceEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("atomicInstanceEntries"));

  objc_msgSend(v7, "encodeBool:forKey:", -[MAAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded"), CFSTR("isFullyDownloaded"));
  objc_msgSend(v7, "encodeBool:forKey:", -[MAAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked"), CFSTR("neverBeenLocked"));
  objc_msgSend(v7, "encodeBool:forKey:", -[MAAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated"), CFSTR("downloadUserInitiated"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"), CFSTR("downloadedNetworkBytes"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"), CFSTR("downloadedFilesystemBytes"));
  objc_msgSend(v7, "encodeBool:forKey:", -[MAAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable"), CFSTR("stagedPriorToAvailable"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return -[MAAutoAssetSetInstanceDescriptor description:](self, "description:", 0);
}

- (id)description:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int64_t v14;
  int64_t v15;
  const __CFString *v16;
  void *v17;
  void *v19;
  void *v20;

  v3 = a3;
  -[MAAutoAssetSetInstanceDescriptor atomicInstanceEntries](self, "atomicInstanceEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = objc_msgSend(v5, "count");

    if ((int)v7 >= 2)
      v8 = CFSTR("entries");
    else
      v8 = CFSTR("entry");
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d %@"), v7, v8);
  }
  v19 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetInstanceDescriptor clientDomainName](self, "clientDomainName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInstanceDescriptor assetSetIdentifier](self, "assetSetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MAAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded"))
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  if (-[MAAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked"))
    v12 = CFSTR("Y");
  else
    v12 = CFSTR("N");
  if (-[MAAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated"))
    v13 = CFSTR("Y");
  else
    v13 = CFSTR("N");
  v14 = -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes");
  v15 = -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  if (-[MAAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable"))
    v16 = CFSTR("Y");
  else
    v16 = CFSTR("N");
  objc_msgSend(v19, "stringWithFormat:", CFSTR(">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n           atomicInstanceEntries: %@\n                 fullyDownloaded: %@\n                 neverBeenLocked: %@\n                   userInitiated: %@\n          downloadedNetworkBytes: %ld\n       downloadedFilesystemBytes: %ld\n          stagedPriorToAvailable: %@\n<<<]"), v9, v10, v20, v11, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)summary
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  int64_t v8;
  int64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetInstanceDescriptor clientDomainName](self, "clientDomainName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInstanceDescriptor assetSetIdentifier](self, "assetSetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInstanceDescriptor atomicInstanceEntries](self, "atomicInstanceEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "count");
  if (-[MAAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded"))
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  if (-[MAAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked"))
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  if (-[MAAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated"))
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  v8 = -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes");
  v9 = -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  if (-[MAAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable"))
    v10 = CFSTR("Y");
  else
    v10 = CFSTR("N");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("[clientDomainName:%@, assetSetIdentifier:%@, numAtomicInstanceEntries:%ld, fullyDownloaded:%@, neverBeenLocked:%@, userInitiated:%@, networkBytes:%ld, fsBytes:%ld, stagedPrior:%@]"), v14, v3, v13, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)buildMaxColumnStrings:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
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
  __CFString *v43;
  __CFString *v44;
  id v45;

  v45 = a3;
  -[MAAutoAssetSetInstanceDescriptor clientDomainName](self, "clientDomainName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInstanceDescriptor assetSetIdentifier](self, "assetSetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInstanceDescriptor atomicInstanceEntries](self, "atomicInstanceEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MAAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  if (-[MAAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v43 = v10;
  if (-[MAAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v44 = v11;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"));
  if (-[MAAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v15 = v14;
  v16 = objc_msgSend(v4, "length");
  objc_msgSend(v45, "safeStringForKey:", CFSTR("clientDomainName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v16 > v18)
    objc_msgSend(v45, "setSafeObject:forKey:", v4, CFSTR("clientDomainName"));
  v19 = objc_msgSend(v5, "length");
  objc_msgSend(v45, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v19 > v21)
    objc_msgSend(v45, "setSafeObject:forKey:", v5, CFSTR("assetSetIdentifier"));
  v22 = objc_msgSend(v7, "length");
  objc_msgSend(v45, "safeStringForKey:", CFSTR("atomicInstanceEntries"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v22 > v24)
    objc_msgSend(v45, "setSafeObject:forKey:", v7, CFSTR("atomicInstanceEntries"));
  v25 = -[__CFString length](v9, "length");
  objc_msgSend(v45, "safeStringForKey:", CFSTR("isFullyDownloaded"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v25 > v27)
    objc_msgSend(v45, "setSafeObject:forKey:", v9, CFSTR("isFullyDownloaded"));
  v28 = -[__CFString length](v43, "length");
  objc_msgSend(v45, "safeStringForKey:", CFSTR("neverBeenLocked"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  if (v28 > v30)
    objc_msgSend(v45, "setSafeObject:forKey:", v43, CFSTR("neverBeenLocked"));
  v31 = -[__CFString length](v44, "length");
  objc_msgSend(v45, "safeStringForKey:", CFSTR("downloadUserInitiated"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");

  if (v31 > v33)
    objc_msgSend(v45, "setSafeObject:forKey:", v44, CFSTR("downloadUserInitiated"));
  v34 = objc_msgSend(v12, "length");
  objc_msgSend(v45, "safeStringForKey:", CFSTR("downloadedNetworkBytes"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "length");

  if (v34 > v36)
    objc_msgSend(v45, "setSafeObject:forKey:", v12, CFSTR("downloadedNetworkBytes"));
  v37 = objc_msgSend(v13, "length");
  objc_msgSend(v45, "safeStringForKey:", CFSTR("downloadedFilesystemBytes"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "length");

  if (v37 > v39)
    objc_msgSend(v45, "setSafeObject:forKey:", v13, CFSTR("downloadedFilesystemBytes"));
  v40 = -[__CFString length](v15, "length");
  objc_msgSend(v45, "safeStringForKey:", CFSTR("stagedPriorToAvailable"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "length");

  if (v40 > v42)
    objc_msgSend(v45, "setSafeObject:forKey:", v15, CFSTR("stagedPriorToAvailable"));

}

- (id)padded:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  objc_class *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;

  v4 = a3;
  -[MAAutoAssetSetInstanceDescriptor clientDomainName](self, "clientDomainName");
  v5 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v5;
  -[MAAutoAssetSetInstanceDescriptor assetSetIdentifier](self, "assetSetIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v6;
  -[MAAutoAssetSetInstanceDescriptor atomicInstanceEntries](self, "atomicInstanceEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MAAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v41 = v8;
  if (-[MAAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v40 = v9;
  if (-[MAAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = (objc_class *)MEMORY[0x1E0CB3940];
  v39 = v10;
  v38 = (void *)objc_msgSend([v11 alloc], "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"));
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"));
  if (-[MAAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v29 = (id)MEMORY[0x1E0CB3940];
  v27 = v12;
  objc_msgSend(v4, "safeStringForKey:", CFSTR("clientDomainName"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v5, v33, CFSTR(" "), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v6, v32, CFSTR(" "), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("atomicInstanceEntries"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v42, v31, CFSTR(" "), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("isFullyDownloaded"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v41, v28, CFSTR(" "), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("neverBeenLocked"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v40, v25, CFSTR(" "), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("downloadUserInitiated"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v39, v23, CFSTR(" "), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("downloadedNetworkBytes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v38, v21, CFSTR(" "), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("downloadedFilesystemBytes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v37, v16, CFSTR(" "), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("stagedPriorToAvailable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v27, v18, CFSTR(" "), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@"), v36, v26, v24, v22, v13, v14, v15, v17, v19);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (id)newMaxColumnStrings
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("clientDomainName"), CFSTR("clientDomainName"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("assetSetIdentifier"), CFSTR("assetSetIdentifier"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("atomicInstanceEntries"), CFSTR("atomicInstanceEntries"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("isFullyDownloaded"), CFSTR("isFullyDownloaded"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("neverBeenLocked"), CFSTR("neverBeenLocked"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("downloadUserInitiated"), CFSTR("downloadUserInitiated"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("downloadedNetworkBytes"), CFSTR("downloadedNetworkBytes"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("downloadedFilesystemBytes"), CFSTR("downloadedFilesystemBytes"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("stagedPriorToAvailable"), CFSTR("stagedPriorToAvailable"));
  return v2;
}

+ (id)paddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6
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

+ (id)paddedHeader:(id)a3
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

  v19 = (void *)MEMORY[0x1E0CB3940];
  v3 = a3;
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientDomainName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("clientDomainName"), v23, CFSTR(" "), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("assetSetIdentifier"), v22, CFSTR(" "), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("atomicInstanceEntries"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("atomicInstanceEntries"), v21, CFSTR(" "), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("isFullyDownloaded"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("isFullyDownloaded"), v18, CFSTR(" "), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("neverBeenLocked"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("neverBeenLocked"), v16, CFSTR(" "), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("downloadUserInitiated"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("downloadUserInitiated"), v14, CFSTR(" "), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("downloadedNetworkBytes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("downloadedNetworkBytes"), v12, CFSTR(" "), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("downloadedFilesystemBytes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("downloadedFilesystemBytes"), v6, CFSTR(" "), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("stagedPriorToAvailable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("stagedPriorToAvailable"), v8, CFSTR(" "), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@"), v24, v17, v15, v13, v11, v4, v5, v7, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)paddedBanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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

  v19 = (void *)MEMORY[0x1E0CB3940];
  v3 = a3;
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientDomainName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v23, CFSTR("="), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v22, CFSTR("="), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("atomicInstanceEntries"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v21, CFSTR("="), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("isFullyDownloaded"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v18, CFSTR("="), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("neverBeenLocked"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v16, CFSTR("="), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("downloadUserInitiated"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v14, CFSTR("="), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("downloadedNetworkBytes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v12, CFSTR("="), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("downloadedFilesystemBytes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v7, CFSTR("="), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("stagedPriorToAvailable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetInstanceDescriptor, "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v9, CFSTR("="), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@"), v24, v17, v15, v13, v4, v5, v6, v8, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (NSArray)atomicInstanceEntries
{
  return self->_atomicInstanceEntries;
}

- (BOOL)isFullyDownloaded
{
  return self->_isFullyDownloaded;
}

- (BOOL)neverBeenLocked
{
  return self->_neverBeenLocked;
}

- (BOOL)downloadUserInitiated
{
  return self->_downloadUserInitiated;
}

- (int64_t)downloadedNetworkBytes
{
  return self->_downloadedNetworkBytes;
}

- (int64_t)downloadedFilesystemBytes
{
  return self->_downloadedFilesystemBytes;
}

- (BOOL)stagedPriorToAvailable
{
  return self->_stagedPriorToAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atomicInstanceEntries, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
  objc_storeStrong((id *)&self->_clientDomainName, 0);
}

@end
