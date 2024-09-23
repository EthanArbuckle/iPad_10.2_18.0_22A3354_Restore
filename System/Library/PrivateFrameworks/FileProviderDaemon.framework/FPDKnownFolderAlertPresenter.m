@implementation FPDKnownFolderAlertPresenter

- (FPDKnownFolderAlertPresenter)initWithProviderDomain:(id)a3
{
  id v4;
  FPDKnownFolderAlertPresenter *v5;
  uint64_t v6;
  NSString *providerDisplayName;
  uint64_t v8;
  NSString *providerBundleIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPDKnownFolderAlertPresenter;
  v5 = -[FPDKnownFolderAlertPresenter init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "domainFullDisplayName");
    v6 = objc_claimAutoreleasedReturnValue();
    providerDisplayName = v5->_providerDisplayName;
    v5->_providerDisplayName = (NSString *)v6;

    objc_msgSend(v4, "topLevelBundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v8;

    v5->_isiCloudDriveProvider = objc_msgSend(v4, "isiCloudDriveProvider");
  }

  return v5;
}

- (id)getIconURLWithCautionBadge:(BOOL)a3
{
  return 0;
}

- (BOOL)presentAlertWithUserAprovalToContinue
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alert should be implemented by subclass"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDKnownFolderAlertPresenter presentAlertWithUserAprovalToContinue]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDKnownFolderAlertPresenter.m", 101, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
}

- (NSString)providerDisplayName
{
  return self->_providerDisplayName;
}

- (BOOL)isiCloudDriveProvider
{
  return self->_isiCloudDriveProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerDisplayName, 0);
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
}

@end
