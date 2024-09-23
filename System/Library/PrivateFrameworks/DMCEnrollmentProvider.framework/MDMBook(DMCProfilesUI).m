@implementation MDMBook(DMCProfilesUI)

- (id)managedBookConfigurationInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((objc_msgSend(a1, "_hasManagedRestrictions") & 1) != 0)
  {
    v2 = (void *)objc_opt_new();
    if (objc_msgSend(a1, "_isUninstalledOnMDMRemoval"))
    {
      DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_BOOK_WILL_BE_REMOVED"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v3);

    }
    if (objc_msgSend(a1, "_isExcludedFromBackup"))
    {
      DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_BOOK_CANNOT_BACKUP"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

    }
    if (objc_msgSend(a1, "_isUnableToExportToUnmanaged"))
    {
      DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_BOOK_CANNOT_EXPORT_DATA_TO_UNMANAGED"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

    }
    if (objc_msgSend(a1, "_isExcludedFromCloudSync"))
    {
      DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_BOOK_CANNOT_CLOUD_SYNC"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v6);

    }
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_BOOK_HAS_NO_RESTRICTIONS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (uint64_t)_hasManagedRestrictions
{
  if ((objc_msgSend(a1, "_isUninstalledOnMDMRemoval") & 1) != 0
    || (objc_msgSend(a1, "_isExcludedFromBackup") & 1) != 0
    || (objc_msgSend(a1, "_isExcludedFromCloudSync") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "_isUnableToExportToUnmanaged");
  }
}

- (BOOL)_isEnterpriseBook
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "iTunesStoreID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 == 0;

  return v2;
}

- (BOOL)_isExcludedFromBackup
{
  void *v1;
  _BOOL8 v2;

  if (!objc_msgSend(a1, "_isEnterpriseBook"))
    return 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63900]) == 2;

  return v2;
}

- (BOOL)_isExcludedFromCloudSync
{
  void *v1;
  _BOOL8 v2;

  if (!objc_msgSend(a1, "_isEnterpriseBook"))
    return 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63908]) == 2;

  return v2;
}

- (BOOL)_isUnableToExportToUnmanaged
{
  void *v1;
  _BOOL8 v2;

  if (!objc_msgSend(a1, "_isEnterpriseBook"))
    return 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63A28]) == 2;

  return v2;
}

@end
