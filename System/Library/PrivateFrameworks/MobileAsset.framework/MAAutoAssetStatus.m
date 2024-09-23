@implementation MAAutoAssetStatus

- (MAAutoAssetStatus)initWithAssetSelector:(id)a3 withNotifications:(id)a4 withAvailableForUseAttributes:(id)a5 withNewerVersionAttributes:(id)a6 withDownloadUserInitiated:(BOOL)a7 withDownloadProgress:(id)a8 withDownloadedNetworkBytes:(int64_t)a9 withDownloadedFilesystemBytes:(int64_t)a10 withDownloadedAsPatch:(BOOL)a11 withPatchedFromBaseSelector:(id)a12 withPatchedFromBaseFilesystemBytes:(int64_t)a13 withPatchingAttempted:(BOOL)a14 withStagedPriorToAvailable:(BOOL)a15 withStagedFromOSVersion:(id)a16 withStagedFromBuildVersion:(id)a17 withCurrentLockUsage:(id)a18 withAvailableForUseError:(id)a19 withPatchingAttemptError:(id)a20 withNewerVersionError:(id)a21
{
  uint64_t v22;
  uint64_t v23;

  LOWORD(v23) = __PAIR16__(a15, a14);
  LOBYTE(v22) = a11;
  return -[MAAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:](self, "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:", a3, a4, a5, a6, 0, a7, a8, a9, a10, v22, a12, a13, v23,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21);
}

- (MAAutoAssetStatus)initWithAssetSelector:(id)a3 withNotifications:(id)a4 withAvailableForUseAttributes:(id)a5 withNewerVersionAttributes:(id)a6 withNeverBeenLocked:(BOOL)a7 withDownloadUserInitiated:(BOOL)a8 withDownloadProgress:(id)a9 withDownloadedNetworkBytes:(int64_t)a10 withDownloadedFilesystemBytes:(int64_t)a11 withDownloadedAsPatch:(BOOL)a12 withPatchedFromBaseSelector:(id)a13 withPatchedFromBaseFilesystemBytes:(int64_t)a14 withPatchingAttempted:(BOOL)a15 withStagedPriorToAvailable:(BOOL)a16 withStagedFromOSVersion:(id)a17 withStagedFromBuildVersion:(id)a18 withCurrentLockUsage:(id)a19 withAvailableForUseError:(id)a20 withPatchingAttemptError:(id)a21 withNewerVersionError:(id)a22
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  MAAutoAssetStatus *v31;
  MAAutoAssetStatus *v32;
  id v35;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v41 = a3;
  v44 = a4;
  v35 = a5;
  v40 = a5;
  v43 = a6;
  v25 = a9;
  v42 = a13;
  v39 = a17;
  v26 = a18;
  v27 = a19;
  v28 = a20;
  v29 = a21;
  v30 = a22;
  v45.receiver = self;
  v45.super_class = (Class)MAAutoAssetStatus;
  v31 = -[MAAutoAssetStatus init](&v45, sel_init);
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_assetSelector, a3);
    objc_storeStrong((id *)&v32->_notifications, a4);
    objc_storeStrong((id *)&v32->_availableForUseAttributes, v35);
    objc_storeStrong((id *)&v32->_newerVersionAttributes, a6);
    v32->_neverBeenLocked = a7;
    v32->_downloadUserInitiated = a8;
    objc_storeStrong((id *)&v32->_downloadProgress, a9);
    v32->_downloadedNetworkBytes = a10;
    v32->_downloadedFilesystemBytes = a11;
    v32->_downloadedAsPatch = a12;
    objc_storeStrong((id *)&v32->_patchedFromBaseSelector, a13);
    v32->_patchedFromBaseFilesystemBytes = a14;
    v32->_patchingAttempted = a15;
    v32->_stagedPriorToAvailable = a16;
    objc_storeStrong((id *)&v32->_stagedFromOSVersion, a17);
    objc_storeStrong((id *)&v32->_stagedFromBuildVersion, a18);
    objc_storeStrong((id *)&v32->_currentLockUsage, a19);
    objc_storeStrong((id *)&v32->_availableForUseError, a20);
    objc_storeStrong((id *)&v32->_patchingAttemptError, a21);
    objc_storeStrong((id *)&v32->_newerVersionError, a22);
  }

  return v32;
}

- (MAAutoAssetStatus)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetStatus *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MAAutoAssetSelector *assetSelector;
  uint64_t v14;
  MAAutoAssetNotifications *notifications;
  uint64_t v16;
  NSDictionary *availableForUseAttributes;
  uint64_t v18;
  NSDictionary *newerVersionAttributes;
  uint64_t v20;
  MAAutoAssetProgress *downloadProgress;
  uint64_t v22;
  MAAutoAssetSelector *patchedFromBaseSelector;
  uint64_t v24;
  NSString *stagedFromOSVersion;
  uint64_t v26;
  NSString *stagedFromBuildVersion;
  uint64_t v28;
  NSDictionary *currentLockUsage;
  uint64_t v30;
  NSError *availableForUseError;
  uint64_t v32;
  NSError *patchingAttemptError;
  uint64_t v34;
  NSError *newerVersionError;
  objc_super v37;
  _QWORD v38[3];
  _QWORD v39[9];

  v39[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)MAAutoAssetStatus;
  v5 = -[MAAutoAssetStatus init](&v37, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v39[2] = objc_opt_class();
    v39[3] = objc_opt_class();
    v39[4] = objc_opt_class();
    v39[5] = objc_opt_class();
    v39[6] = objc_opt_class();
    v39[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSelector"));
    v12 = objc_claimAutoreleasedReturnValue();
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notifications"));
    v14 = objc_claimAutoreleasedReturnValue();
    notifications = v5->_notifications;
    v5->_notifications = (MAAutoAssetNotifications *)v14;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("availableForUseAttributes"));
    v16 = objc_claimAutoreleasedReturnValue();
    availableForUseAttributes = v5->_availableForUseAttributes;
    v5->_availableForUseAttributes = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("newerVersionAttributes"));
    v18 = objc_claimAutoreleasedReturnValue();
    newerVersionAttributes = v5->_newerVersionAttributes;
    v5->_newerVersionAttributes = (NSDictionary *)v18;

    v5->_neverBeenLocked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("neverBeenLocked"));
    v5->_downloadUserInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadUserInitiated"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadProgress"));
    v20 = objc_claimAutoreleasedReturnValue();
    downloadProgress = v5->_downloadProgress;
    v5->_downloadProgress = (MAAutoAssetProgress *)v20;

    v5->_downloadedNetworkBytes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downloadedNetworkBytes"));
    v5->_downloadedFilesystemBytes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downloadedFilesystemBytes"));
    v5->_downloadedAsPatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadedAsPatch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("patchedFromBaseSelector"));
    v22 = objc_claimAutoreleasedReturnValue();
    patchedFromBaseSelector = v5->_patchedFromBaseSelector;
    v5->_patchedFromBaseSelector = (MAAutoAssetSelector *)v22;

    v5->_patchedFromBaseFilesystemBytes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("patchedFromBaseFilesystemBytes"));
    v5->_patchingAttempted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("patchingAttempted"));
    v5->_stagedPriorToAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("stagedPriorToAvailable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagedFromOSVersion"));
    v24 = objc_claimAutoreleasedReturnValue();
    stagedFromOSVersion = v5->_stagedFromOSVersion;
    v5->_stagedFromOSVersion = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagedFromBuildVersion"));
    v26 = objc_claimAutoreleasedReturnValue();
    stagedFromBuildVersion = v5->_stagedFromBuildVersion;
    v5->_stagedFromBuildVersion = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("currentLockUsage"));
    v28 = objc_claimAutoreleasedReturnValue();
    currentLockUsage = v5->_currentLockUsage;
    v5->_currentLockUsage = (NSDictionary *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availableForUseError"));
    v30 = objc_claimAutoreleasedReturnValue();
    availableForUseError = v5->_availableForUseError;
    v5->_availableForUseError = (NSError *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("patchingAttemptError"));
    v32 = objc_claimAutoreleasedReturnValue();
    patchingAttemptError = v5->_patchingAttemptError;
    v5->_patchingAttemptError = (NSError *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("newerVersionError"));
    v34 = objc_claimAutoreleasedReturnValue();
    newerVersionError = v5->_newerVersionError;
    v5->_newerVersionError = (NSError *)v34;

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
  id v16;

  v4 = a3;
  -[MAAutoAssetStatus assetSelector](self, "assetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("assetSelector"));

  -[MAAutoAssetStatus notifications](self, "notifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("notifications"));

  -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("availableForUseAttributes"));

  -[MAAutoAssetStatus newerVersionAttributes](self, "newerVersionAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("newerVersionAttributes"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetStatus neverBeenLocked](self, "neverBeenLocked"), CFSTR("neverBeenLocked"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetStatus downloadUserInitiated](self, "downloadUserInitiated"), CFSTR("downloadUserInitiated"));
  -[MAAutoAssetStatus downloadProgress](self, "downloadProgress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("downloadProgress"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes"), CFSTR("downloadedNetworkBytes"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes"), CFSTR("downloadedFilesystemBytes"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetStatus downloadedAsPatch](self, "downloadedAsPatch"), CFSTR("downloadedAsPatch"));
  -[MAAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("patchedFromBaseSelector"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetStatus patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes"), CFSTR("patchedFromBaseFilesystemBytes"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetStatus patchingAttempted](self, "patchingAttempted"), CFSTR("patchingAttempted"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetStatus stagedPriorToAvailable](self, "stagedPriorToAvailable"), CFSTR("stagedPriorToAvailable"));
  -[MAAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("stagedFromOSVersion"));

  -[MAAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("stagedFromBuildVersion"));

  -[MAAutoAssetStatus currentLockUsage](self, "currentLockUsage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("currentLockUsage"));

  -[MAAutoAssetStatus availableForUseError](self, "availableForUseError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("availableForUseError"));

  -[MAAutoAssetStatus patchingAttemptError](self, "patchingAttemptError");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("patchingAttemptError"));

  -[MAAutoAssetStatus newerVersionError](self, "newerVersionError");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("newerVersionError"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  BOOL v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int64_t v16;
  BOOL v17;
  int64_t v18;
  int64_t v19;
  _BOOL4 v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MAAutoAssetStatus *v27;
  MAAutoAssetStatus *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v27 = [MAAutoAssetStatus alloc];
  -[MAAutoAssetStatus assetSelector](self, "assetSelector");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v31, "copy");
  -[MAAutoAssetStatus notifications](self, "notifications");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v30, "copy");
  -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetStatus newerVersionAttributes](self, "newerVersionAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MAAutoAssetStatus neverBeenLocked](self, "neverBeenLocked");
  v20 = -[MAAutoAssetStatus downloadUserInitiated](self, "downloadUserInitiated");
  -[MAAutoAssetStatus downloadProgress](self, "downloadProgress");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v29, "copy");
  v19 = -[MAAutoAssetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes");
  v18 = -[MAAutoAssetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  v17 = -[MAAutoAssetStatus downloadedAsPatch](self, "downloadedAsPatch");
  -[MAAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v22, "copy");
  v16 = -[MAAutoAssetStatus patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes");
  v3 = -[MAAutoAssetStatus patchingAttempted](self, "patchingAttempted");
  v4 = -[MAAutoAssetStatus stagedPriorToAvailable](self, "stagedPriorToAvailable");
  -[MAAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetStatus currentLockUsage](self, "currentLockUsage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[MAAutoAssetStatus availableForUseError](self, "availableForUseError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetStatus patchingAttemptError](self, "patchingAttemptError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetStatus newerVersionError](self, "newerVersionError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v13) = v4;
  LOBYTE(v13) = v3;
  LOBYTE(v12) = v17;
  v28 = -[MAAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:](v27, "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:", v26, v25, v24, v23, v21, v20, v32, v19, v18, v12, v15, v16, v13,
          v14,
          v5,
          v7,
          v8,
          v9,
          v10);

  return v28;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
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
  id v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  const __CFString *v32;
  __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  const __CFString *v46;
  void *v47;
  int64_t v48;
  const __CFString *v49;
  int64_t v50;
  int64_t v51;
  void *v52;
  const __CFString *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  __CFString *v63;
  __CFString *v64;
  __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73[2];

  v58 = (void *)MEMORY[0x1E0CB37A0];
  -[MAAutoAssetStatus assetSelector](self, "assetSelector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summary");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetStatus notifications](self, "notifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("N");
  if (v5)
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  v57 = v7;
  -[MAAutoAssetStatus newerVersionAttributes](self, "newerVersionAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  v56 = v9;
  if (-[MAAutoAssetStatus neverBeenLocked](self, "neverBeenLocked"))
    v10 = CFSTR("Y");
  else
    v10 = CFSTR("N");
  v54 = v10;
  if (-[MAAutoAssetStatus downloadUserInitiated](self, "downloadUserInitiated"))
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  v53 = v11;
  -[MAAutoAssetStatus downloadProgress](self, "downloadProgress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[MAAutoAssetStatus downloadProgress](self, "downloadProgress");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "summary");
    v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v65 = CFSTR("N");
  }
  v51 = -[MAAutoAssetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes");
  v50 = -[MAAutoAssetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  if (-[MAAutoAssetStatus downloadedAsPatch](self, "downloadedAsPatch"))
    v13 = CFSTR("Y");
  else
    v13 = CFSTR("N");
  v49 = v13;
  -[MAAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[MAAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "summary");
    v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v64 = CFSTR("N");
  }
  v48 = -[MAAutoAssetStatus patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes");
  if (-[MAAutoAssetStatus patchingAttempted](self, "patchingAttempted"))
    v15 = CFSTR("Y");
  else
    v15 = CFSTR("N");
  v46 = v15;
  if (-[MAAutoAssetStatus stagedPriorToAvailable](self, "stagedPriorToAvailable"))
    v16 = CFSTR("Y");
  else
    v16 = CFSTR("N");
  v45 = v16;
  -[MAAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[MAAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[MAAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[MAAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion");
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v63 = CFSTR("N");
  }
  -[MAAutoAssetStatus currentLockUsage](self, "currentLockUsage");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
    v62 = +[MAAutoAssetStatus newCurrentLockUsageSummary:](MAAutoAssetStatus, "newCurrentLockUsageSummary:", self);
  else
    v62 = CFSTR("N");
  -[MAAutoAssetStatus availableForUseError](self, "availableForUseError");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)v18;
  if (v47)
  {
    -[MAAutoAssetStatus availableForUseError](self, "availableForUseError");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "checkedSummary");
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = CFSTR("N");
  }
  -[MAAutoAssetStatus patchingAttemptError](self, "patchingAttemptError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)v17;
  if (v19)
  {
    -[MAAutoAssetStatus patchingAttemptError](self, "patchingAttemptError");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "checkedSummary");
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v60 = CFSTR("N");
  }
  -[MAAutoAssetStatus newerVersionError](self, "newerVersionError");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[MAAutoAssetStatus newerVersionError](self, "newerVersionError");
    v44 = v8;
    v42 = v5;
    v21 = v4;
    v22 = v3;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "checkedSummary");
    v24 = v14;
    v25 = v12;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "stringWithFormat:", CFSTR("                   assetSelector: %@\n                   notifications: %@\n       availableForUseAttributes: %@\n          newerVersionAttributes: %@\n                 neverBeenLocked: %@\n           downloadUserInitiated: %@\n                downloadProgress: %@\n          downloadedNetworkBytes: %ld\n       downloadedFilesystemBytes: %ld\n               downloadedAsPatch: %@\n         patchedFromBaseSelector: %@\n  patchedFromBaseFilesystemBytes: %ld\n               patchingAttempted: %@\n          stagedPriorToAvailable: %@\n             stagedFromOSVersion: %@\n          stagedFromBuildVersion: %@\n                currentLockUsage: %@\n            availableForUseError: %@\n            patchingAttemptError: %@\n               newerVersionError: %@\n"), v68, v67, v57, v56, v54, v53, v65, v51, v50, v49, v64, v48, v46, v45, v6, v63,
      v62,
      v61,
      v60,
      v26);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v25;
    v14 = v24;

    v3 = v22;
    v4 = v21;
    v5 = v42;
    v8 = v44;
  }
  else
  {
    objc_msgSend(v58, "stringWithFormat:", CFSTR("                   assetSelector: %@\n                   notifications: %@\n       availableForUseAttributes: %@\n          newerVersionAttributes: %@\n                 neverBeenLocked: %@\n           downloadUserInitiated: %@\n                downloadProgress: %@\n          downloadedNetworkBytes: %ld\n       downloadedFilesystemBytes: %ld\n               downloadedAsPatch: %@\n         patchedFromBaseSelector: %@\n  patchedFromBaseFilesystemBytes: %ld\n               patchingAttempted: %@\n          stagedPriorToAvailable: %@\n             stagedFromOSVersion: %@\n          stagedFromBuildVersion: %@\n                currentLockUsage: %@\n            availableForUseError: %@\n            patchingAttemptError: %@\n               newerVersionError: %@\n"), v68, v67, v57, v56, v54, v53, v65, v51, v50, v49, v64, v48, v46, v45, v6, v63,
      v62,
      v61,
      v60,
      CFSTR("N"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v19)
  {

  }
  if (v47)
  {

  }
  if (v66)

  if (v52)
  if (v55)

  if (v14)
  {

  }
  if (v12)
  {

  }
  -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v72 = 0;
    v73[0] = 0;
    v70 = 0;
    v71 = 0;
    v69 = 0;
    -[MAAutoAssetStatus getAvailableForUseAttributesAssetFormat:assetBuild:minOSVersion:maxOSVersion:prerequisiteBuilds:](self, "getAvailableForUseAttributesAssetFormat:assetBuild:minOSVersion:maxOSVersion:prerequisiteBuilds:", v73, &v72, &v71, &v70, &v69);
    v28 = v73[0];
    v29 = (__CFString *)v72;
    v30 = (__CFString *)v71;
    v31 = (__CFString *)v70;
    v32 = (const __CFString *)v69;
    v33 = (__CFString *)v32;
    v34 = CFSTR("Missing");
    if (v29)
      v34 = v29;
    v35 = CFSTR("N");
    if (v30)
      v36 = v30;
    else
      v36 = CFSTR("N");
    if (v31)
      v37 = v31;
    else
      v37 = CFSTR("N");
    if (v32)
      v35 = v32;
    objc_msgSend(v59, "appendFormat:", CFSTR("                     assetFormat: %@\n                      assetBuild: %@\n                    minOSVersion: %@\n                    maxOSVersion: %@\n         prerequisiteAssetBuilds: %@\n"), v28, v34, v36, v37, v35);

  }
  return v59;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
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
  id v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  const __CFString *v32;
  __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  const __CFString *v46;
  void *v47;
  int64_t v48;
  const __CFString *v49;
  int64_t v50;
  int64_t v51;
  void *v52;
  const __CFString *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  __CFString *v63;
  __CFString *v64;
  __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73[2];

  v58 = (void *)MEMORY[0x1E0CB37A0];
  -[MAAutoAssetStatus assetSelector](self, "assetSelector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summary");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetStatus notifications](self, "notifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("N");
  if (v5)
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  v57 = v7;
  -[MAAutoAssetStatus newerVersionAttributes](self, "newerVersionAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  v56 = v9;
  if (-[MAAutoAssetStatus neverBeenLocked](self, "neverBeenLocked"))
    v10 = CFSTR("Y");
  else
    v10 = CFSTR("N");
  v54 = v10;
  if (-[MAAutoAssetStatus downloadUserInitiated](self, "downloadUserInitiated"))
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  v53 = v11;
  -[MAAutoAssetStatus downloadProgress](self, "downloadProgress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[MAAutoAssetStatus downloadProgress](self, "downloadProgress");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "summary");
    v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v65 = CFSTR("N");
  }
  v51 = -[MAAutoAssetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes");
  v50 = -[MAAutoAssetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  if (-[MAAutoAssetStatus downloadedAsPatch](self, "downloadedAsPatch"))
    v13 = CFSTR("Y");
  else
    v13 = CFSTR("N");
  v49 = v13;
  -[MAAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[MAAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "summary");
    v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v64 = CFSTR("N");
  }
  v48 = -[MAAutoAssetStatus patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes");
  if (-[MAAutoAssetStatus patchingAttempted](self, "patchingAttempted"))
    v15 = CFSTR("Y");
  else
    v15 = CFSTR("N");
  v46 = v15;
  if (-[MAAutoAssetStatus stagedPriorToAvailable](self, "stagedPriorToAvailable"))
    v16 = CFSTR("Y");
  else
    v16 = CFSTR("N");
  v45 = v16;
  -[MAAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[MAAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[MAAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[MAAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion");
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v63 = CFSTR("N");
  }
  -[MAAutoAssetStatus currentLockUsage](self, "currentLockUsage");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
    v62 = +[MAAutoAssetStatus newCurrentLockUsageSummary:](MAAutoAssetStatus, "newCurrentLockUsageSummary:", self);
  else
    v62 = CFSTR("N");
  -[MAAutoAssetStatus availableForUseError](self, "availableForUseError");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)v17;
  if (v47)
  {
    -[MAAutoAssetStatus availableForUseError](self, "availableForUseError");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "checkedSummary");
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = CFSTR("N");
  }
  -[MAAutoAssetStatus patchingAttemptError](self, "patchingAttemptError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)v18;
  if (v19)
  {
    -[MAAutoAssetStatus patchingAttemptError](self, "patchingAttemptError");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "checkedSummary");
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v60 = CFSTR("N");
  }
  -[MAAutoAssetStatus newerVersionError](self, "newerVersionError");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[MAAutoAssetStatus newerVersionError](self, "newerVersionError");
    v42 = v14;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "checkedSummary");
    v44 = v12;
    v22 = v8;
    v23 = v5;
    v24 = v4;
    v25 = v3;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "stringWithFormat:", CFSTR("[assetSelector:%@|notifications:%@|availableForUseAttributes:%@|newerVersionAttributes:%@|neverBeenLocked:%@|downloadUserInitiated:%@|downloadProgress:%@|downloadedNetworkBytes:%ld|downloadedFilesystemBytes:%ld|downloadedAsPatch:%@|patchedFromBaseSelector:%@|patchedFromBaseBytes:%ld|patchingAttempted:%@|stagedPriorToAvailable:%@|stagedFromOSVersion:%@|stagedFromBuildVersion:%@|currentLockUsage:%@|availableForUseError:%@|patchingAttemptError:%@|newerVersionError:%@"), v68, v67, v57, v56, v54, v53, v65, v51, v50, v49, v64, v48, v46, v45, v6, v63,
      v62,
      v61,
      v60,
      v26);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v25;
    v4 = v24;
    v5 = v23;
    v8 = v22;
    v12 = v44;

    v14 = v42;
  }
  else
  {
    objc_msgSend(v58, "stringWithFormat:", CFSTR("[assetSelector:%@|notifications:%@|availableForUseAttributes:%@|newerVersionAttributes:%@|neverBeenLocked:%@|downloadUserInitiated:%@|downloadProgress:%@|downloadedNetworkBytes:%ld|downloadedFilesystemBytes:%ld|downloadedAsPatch:%@|patchedFromBaseSelector:%@|patchedFromBaseBytes:%ld|patchingAttempted:%@|stagedPriorToAvailable:%@|stagedFromOSVersion:%@|stagedFromBuildVersion:%@|currentLockUsage:%@|availableForUseError:%@|patchingAttemptError:%@|newerVersionError:%@"), v68, v67, v57, v56, v54, v53, v65, v51, v50, v49, v64, v48, v46, v45, v6, v63,
      v62,
      v61,
      v60,
      CFSTR("N"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v19)
  {

  }
  if (v47)
  {

  }
  if (v66)

  if (v52)
  if (v55)

  if (v14)
  {

  }
  if (v12)
  {

  }
  -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v72 = 0;
    v73[0] = 0;
    v70 = 0;
    v71 = 0;
    v69 = 0;
    -[MAAutoAssetStatus getAvailableForUseAttributesAssetFormat:assetBuild:minOSVersion:maxOSVersion:prerequisiteBuilds:](self, "getAvailableForUseAttributesAssetFormat:assetBuild:minOSVersion:maxOSVersion:prerequisiteBuilds:", v73, &v72, &v71, &v70, &v69);
    v28 = v73[0];
    v29 = (__CFString *)v72;
    v30 = (__CFString *)v71;
    v31 = (__CFString *)v70;
    v32 = (const __CFString *)v69;
    v33 = (__CFString *)v32;
    v34 = CFSTR("Missing");
    if (v29)
      v34 = v29;
    v35 = CFSTR("N");
    if (v30)
      v36 = v30;
    else
      v36 = CFSTR("N");
    if (v31)
      v37 = v31;
    else
      v37 = CFSTR("N");
    if (v32)
      v35 = v32;
    objc_msgSend(v59, "appendFormat:", CFSTR("|assetFormat:%@|assetBuild:%@|minOSVersion:%@|maxOSVersion:%@|prerequisiteAssetBuilds:%@"), v28, v34, v36, v37, v35);

  }
  objc_msgSend(v59, "appendString:", CFSTR("]"));
  return v59;
}

- (void)getAvailableForUseAttributesAssetFormat:(id *)a3 assetBuild:(id *)a4 minOSVersion:(id *)a5 maxOSVersion:(id *)a6 prerequisiteBuilds:(id *)a7
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (a3)
    {
      -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "safeStringForKey:", CFSTR("AssetFormat"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      if (!*a3)
        *a3 = CFSTR("StreamingZip");
    }
    if (a4)
    {
      -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safeStringForKey:", CFSTR("Build"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (a5)
    {
      -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "safeStringForKey:", CFSTR("_MinOSVersion"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (a6)
    {
      -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "safeStringForKey:", CFSTR("_MaxOSVersion"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (a7)
    {
      -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "safeObjectForKey:ofClass:", CFSTR("PrerequisiteAssetBuilds"), objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v21)
        {
          v22 = v21;
          v28 = v19;
          v23 = 0;
          v24 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v30 != v24)
                objc_enumerationMutation(v20);
              v26 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (v23)
                {
                  objc_msgSend(v23, "appendFormat:", CFSTR(",%@"), v26);
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@"), v26);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                }
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          }
          while (v22);

          if (v23)
            v27 = objc_retainAutorelease(v23);
          else
            v27 = 0;
          v19 = v28;
        }
        else
        {

          v27 = 0;
        }
        *a7 = v27;

      }
      else
      {
        *a7 = 0;
      }

    }
  }
}

- (id)newSummaryDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
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
  id v43;
  __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MAAutoAssetStatus assetSelector](self, "assetSelector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newSummaryDictionary");
  objc_msgSend(v3, "setSafeObject:forKey:", v5, CFSTR("assetSelector"));

  -[MAAutoAssetStatus notifications](self, "notifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newSummaryDictionary");
  objc_msgSend(v3, "setSafeObject:forKey:", v7, CFSTR("notifications"));

  -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v9, CFSTR("availableForUseError"));

  -[MAAutoAssetStatus newerVersionAttributes](self, "newerVersionAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v11, CFSTR("newerVersionAttributes"));

  if (-[MAAutoAssetStatus neverBeenLocked](self, "neverBeenLocked"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v12, CFSTR("neverBeenLocked"));
  if (-[MAAutoAssetStatus downloadUserInitiated](self, "downloadUserInitiated"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v13, CFSTR("downloadUserInitiated"));
  -[MAAutoAssetStatus downloadProgress](self, "downloadProgress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[MAAutoAssetStatus downloadProgress](self, "downloadProgress");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "newSummaryDictionary");
    objc_msgSend(v3, "setSafeObject:forKey:", v16, CFSTR("downloadProgress"));

  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    objc_msgSend(v3, "setSafeObject:forKey:", v15, CFSTR("downloadProgress"));
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v17, CFSTR("downloadedNetworkBytes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v18, CFSTR("downloadedFilesystemBytes"));

  if (-[MAAutoAssetStatus downloadedAsPatch](self, "downloadedAsPatch"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v19, CFSTR("downloadedAsPatch"));
  -[MAAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[MAAutoAssetStatus patchedFromBaseSelector](self, "patchedFromBaseSelector");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "newSummaryDictionary");
    objc_msgSend(v3, "setSafeObject:forKey:", v22, CFSTR("patchedFromBaseSelector"));

  }
  else
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    objc_msgSend(v3, "setSafeObject:forKey:", v21, CFSTR("patchedFromBaseSelector"));
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetStatus patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v23, CFSTR("patchedFromBaseFilesystemBytes"));

  if (-[MAAutoAssetStatus patchingAttempted](self, "patchingAttempted"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v24, CFSTR("patchingAttempted"));
  if (-[MAAutoAssetStatus stagedPriorToAvailable](self, "stagedPriorToAvailable"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v25, CFSTR("stagedPriorToAvailable"));
  -[MAAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[MAAutoAssetStatus stagedFromOSVersion](self, "stagedFromOSVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSafeObject:forKey:", v27, CFSTR("stagedFromOSVersion"));

  }
  else
  {
    objc_msgSend(v3, "setSafeObject:forKey:", CFSTR("NO"), CFSTR("stagedFromOSVersion"));
  }

  -[MAAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[MAAutoAssetStatus stagedFromBuildVersion](self, "stagedFromBuildVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSafeObject:forKey:", v29, CFSTR("stagedFromBuildVersion"));

  }
  else
  {
    objc_msgSend(v3, "setSafeObject:forKey:", CFSTR("NO"), CFSTR("stagedFromBuildVersion"));
  }

  -[MAAutoAssetStatus currentLockUsage](self, "currentLockUsage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[MAAutoAssetStatus currentLockUsage](self, "currentLockUsage");
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  }
  v32 = v31;
  objc_msgSend(v3, "setSafeObject:forKey:", v31, CFSTR("currentLockUsage"));

  -[MAAutoAssetStatus availableForUseError](self, "availableForUseError");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    -[MAAutoAssetStatus availableForUseError](self, "availableForUseError");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "checkedSummary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSafeObject:forKey:", v35, CFSTR("availableForUseError"));

  }
  else
  {
    objc_msgSend(v3, "setSafeObject:forKey:", CFSTR("NO"), CFSTR("availableForUseError"));
  }

  -[MAAutoAssetStatus patchingAttemptError](self, "patchingAttemptError");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    -[MAAutoAssetStatus patchingAttemptError](self, "patchingAttemptError");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "checkedSummary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSafeObject:forKey:", v38, CFSTR("patchingAttemptError"));

  }
  else
  {
    objc_msgSend(v3, "setSafeObject:forKey:", CFSTR("NO"), CFSTR("patchingAttemptError"));
  }

  -[MAAutoAssetStatus newerVersionError](self, "newerVersionError");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    -[MAAutoAssetStatus newerVersionError](self, "newerVersionError");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "checkedSummary");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSafeObject:forKey:", v41, CFSTR("newerVersionError"));

  }
  else
  {
    objc_msgSend(v3, "setSafeObject:forKey:", CFSTR("NO"), CFSTR("newerVersionError"));
  }

  -[MAAutoAssetStatus availableForUseAttributes](self, "availableForUseAttributes");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v56 = 0;
    v57 = 0;
    v54 = 0;
    v55 = 0;
    v53 = 0;
    -[MAAutoAssetStatus getAvailableForUseAttributesAssetFormat:assetBuild:minOSVersion:maxOSVersion:prerequisiteBuilds:](self, "getAvailableForUseAttributesAssetFormat:assetBuild:minOSVersion:maxOSVersion:prerequisiteBuilds:", &v57, &v56, &v55, &v54, &v53);
    v43 = v57;
    v44 = (__CFString *)v56;
    v45 = (__CFString *)v55;
    v46 = (__CFString *)v54;
    v47 = (__CFString *)v53;
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("assetFormat"));
    if (v44)
      v48 = v44;
    else
      v48 = CFSTR("VALUE-SHOULD-BE-DEFINED-BUT-MISSING");
    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("assetBuild"));
    if (v45)
      v49 = v45;
    else
      v49 = CFSTR("NO");
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("minOSVersion"));
    if (v46)
      v50 = v46;
    else
      v50 = CFSTR("NO");
    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("maxOSVersion"));
    if (v47)
      v51 = v47;
    else
      v51 = CFSTR("NO");
    objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("prerequisiteAssetBuilds"));

  }
  return v3;
}

+ (id)newCurrentLockUsageSummary:(id)a3
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
  uint64_t v12;
  uint64_t v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "currentLockUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("{"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "currentLockUsage");
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
          objc_msgSend(v3, "currentLockUsage");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "safeIntegerForKey:", v10);

          if ((v8 & 1) == 0)
            objc_msgSend(v4, "appendString:", CFSTR(","));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld"), v10, v12);
          else
            objc_msgSend(v4, "appendFormat:", CFSTR("?:%ld"), v12, v14);
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

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (void)setAssetSelector:(id)a3
{
  objc_storeStrong((id *)&self->_assetSelector, a3);
}

- (MAAutoAssetNotifications)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_notifications, a3);
}

- (NSDictionary)availableForUseAttributes
{
  return self->_availableForUseAttributes;
}

- (void)setAvailableForUseAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_availableForUseAttributes, a3);
}

- (NSDictionary)newerVersionAttributes
{
  return self->_newerVersionAttributes;
}

- (void)setNewerVersionAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_newerVersionAttributes, a3);
}

- (BOOL)neverBeenLocked
{
  return self->_neverBeenLocked;
}

- (void)setNeverBeenLocked:(BOOL)a3
{
  self->_neverBeenLocked = a3;
}

- (BOOL)downloadUserInitiated
{
  return self->_downloadUserInitiated;
}

- (void)setDownloadUserInitiated:(BOOL)a3
{
  self->_downloadUserInitiated = a3;
}

- (MAAutoAssetProgress)downloadProgress
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

- (BOOL)downloadedAsPatch
{
  return self->_downloadedAsPatch;
}

- (void)setDownloadedAsPatch:(BOOL)a3
{
  self->_downloadedAsPatch = a3;
}

- (MAAutoAssetSelector)patchedFromBaseSelector
{
  return self->_patchedFromBaseSelector;
}

- (void)setPatchedFromBaseSelector:(id)a3
{
  objc_storeStrong((id *)&self->_patchedFromBaseSelector, a3);
}

- (int64_t)patchedFromBaseFilesystemBytes
{
  return self->_patchedFromBaseFilesystemBytes;
}

- (void)setPatchedFromBaseFilesystemBytes:(int64_t)a3
{
  self->_patchedFromBaseFilesystemBytes = a3;
}

- (BOOL)patchingAttempted
{
  return self->_patchingAttempted;
}

- (void)setPatchingAttempted:(BOOL)a3
{
  self->_patchingAttempted = a3;
}

- (BOOL)stagedPriorToAvailable
{
  return self->_stagedPriorToAvailable;
}

- (void)setStagedPriorToAvailable:(BOOL)a3
{
  self->_stagedPriorToAvailable = a3;
}

- (NSString)stagedFromOSVersion
{
  return self->_stagedFromOSVersion;
}

- (void)setStagedFromOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_stagedFromOSVersion, a3);
}

- (NSString)stagedFromBuildVersion
{
  return self->_stagedFromBuildVersion;
}

- (void)setStagedFromBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_stagedFromBuildVersion, a3);
}

- (NSDictionary)currentLockUsage
{
  return self->_currentLockUsage;
}

- (void)setCurrentLockUsage:(id)a3
{
  objc_storeStrong((id *)&self->_currentLockUsage, a3);
}

- (NSError)availableForUseError
{
  return self->_availableForUseError;
}

- (void)setAvailableForUseError:(id)a3
{
  objc_storeStrong((id *)&self->_availableForUseError, a3);
}

- (NSError)patchingAttemptError
{
  return self->_patchingAttemptError;
}

- (void)setPatchingAttemptError:(id)a3
{
  objc_storeStrong((id *)&self->_patchingAttemptError, a3);
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
  objc_storeStrong((id *)&self->_patchingAttemptError, 0);
  objc_storeStrong((id *)&self->_availableForUseError, 0);
  objc_storeStrong((id *)&self->_currentLockUsage, 0);
  objc_storeStrong((id *)&self->_stagedFromBuildVersion, 0);
  objc_storeStrong((id *)&self->_stagedFromOSVersion, 0);
  objc_storeStrong((id *)&self->_patchedFromBaseSelector, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_newerVersionAttributes, 0);
  objc_storeStrong((id *)&self->_availableForUseAttributes, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_assetSelector, 0);
}

@end
