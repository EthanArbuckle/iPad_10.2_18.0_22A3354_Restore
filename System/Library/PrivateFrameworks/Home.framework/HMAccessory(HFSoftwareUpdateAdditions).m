@implementation HMAccessory(HFSoftwareUpdateAdditions)

- (id)hf_softwareUpdateDependentObjects
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  if ((objc_msgSend(a1, "supportsSoftwareUpdateV2") & 1) == 0)
  {
    objc_msgSend(a1, "softwareUpdateController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "na_safeAddObject:", v3);

    objc_msgSend(a1, "softwareUpdateController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availableUpdate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "na_safeAddObject:", v5);

  }
  return v2;
}

- (uint64_t)hf_isSoftwareUpdateInstalled
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSoftwareUpdateInstalled:", a1);

  return v4;
}

- (uint64_t)hf_isSoftwareUpdateInProgress
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSoftwareUpdateInProgress:", a1);

  return v4;
}

- (uint64_t)hf_isReadyToInstallSoftwareUpdate
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReadyToInstallSoftwareUpdate:", a1);

  return v4;
}

+ (void)hf_softwareUpdateComparator
{
  return &__block_literal_global_154;
}

- (uint64_t)hf_supportsSoftwareUpdate
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "supportsSoftwareUpdateV2") & 1) != 0)
    return 1;
  objc_msgSend(a1, "softwareUpdateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != 0;

  return v2;
}

- (uint64_t)hf_hasValidSoftwareOrFirmwareUpdate
{
  if ((objc_msgSend(a1, "isFirmwareUpdateAvailable") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hf_hasValidSoftwareUpdate");
}

- (uint64_t)hf_hasNewValidSoftwareOrFirmwareUpdate
{
  if ((objc_msgSend(a1, "isFirmwareUpdateAvailable") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hf_hasNewValidSoftwareUpdate");
}

- (uint64_t)hf_hasSoftwareUpdate
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSoftwareUpdate:", a1);

  return v4;
}

- (uint64_t)hf_hasValidSoftwareUpdate
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasValidSoftwareUpdate:", a1);

  return v4;
}

- (uint64_t)hf_hasNewValidSoftwareUpdate
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasNewValidSoftwareUpdate:", a1);

  return v4;
}

- (uint64_t)hf_hasRequestedSoftwareUpdate
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRequestedSoftwareUpdate:", a1);

  return v4;
}

- (uint64_t)hf_isDownloadingSoftwareUpdate
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDownloadingSoftwareUpdate:", a1);

  return v4;
}

- (uint64_t)hf_isInstallingSoftwareUpdate
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInstallingSoftwareUpdate:", a1);

  return v4;
}

- (uint64_t)hf_softwareUpdatePossessesNecessaryDocumentation
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "softwareUpdatePossessesNecessaryDocumentation:", a1);

  return v4;
}

- (id)hf_softwareUpdateDocumentation
{
  void *v2;
  void *v3;
  void *v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareUpdateDocumentation:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_softwareUpdateVersion
{
  void *v2;
  void *v3;
  void *v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareUpdateVersion:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_softwareUpdateDisplayableVersion
{
  void *v2;
  void *v3;
  void *v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareUpdateDisplayableVersion:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_softwareUpdateReleaseDate
{
  void *v2;
  void *v3;
  void *v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareUpdateReleaseDate:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)hf_softwareUpdateDownloadSize
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "softwareUpdateDownloadSize:", a1);

  return v4;
}

- (id)hf_softwareUpdatePortionComplete
{
  void *v2;
  void *v3;
  void *v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareUpdatePortionComplete:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_fetchAvailableSoftwareUpdateWithOptions:()HFSoftwareUpdateAdditions
{
  void *v5;
  void *v6;
  void *v7;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "softwareUpdateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAvailableSoftwareUpdate:options:", a1, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_startSoftwareUpdate
{
  void *v2;
  void *v3;
  void *v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startSoftwareUpdate:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_softwareUpdateHash
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_softwareUpdateVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%@-%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_softwareUpdateDependentClasses
{
  void *v2;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  if ((objc_msgSend(a1, "supportsSoftwareUpdateV2") & 1) == 0)
  {
    v5[0] = objc_opt_class();
    v5[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v3);

  }
  return v2;
}

@end
