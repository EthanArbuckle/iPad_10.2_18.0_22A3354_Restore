@implementation BRLoadUbiquityEntitlements

void ___BRLoadUbiquityEntitlements_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  int v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  __CFString *v12;
  uint64_t (**v13)(_QWORD, _QWORD);
  char v14;
  _QWORD v15[4];
  id v16;
  __CFString *v17;

  v0 = (void *)MEMORY[0x1A1AD841C]();
  v1 = (void *)BRCopyEntitlementsForSelf();
  BREntitledContainerIdentifiers((uint64_t)v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)currentProcessUbiquityContainerEntitlements;
  currentProcessUbiquityContainerEntitlements = v2;

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("com.apple.private.librarian.container-proxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    currentProcessIsContainerProxy = objc_msgSend(v4, "BOOLValue");
    if ((currentProcessIsContainerProxy & 1) != 0)
    {
      v5 = v4;
      goto LABEL_9;
    }
  }
  else
  {
    currentProcessIsContainerProxy = 0;
  }
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("com.apple.private.clouddocs.automation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;
  currentProcessIsContainerProxy = v6;
LABEL_9:
  v7 = v1;
  v8 = FPIsCloudDocsWithFPFSEnabled();
  v9 = CFSTR("group.com.apple.CloudDocs");
  if (v8)
    v9 = CFSTR("group.com.apple.iCloudDrive");
  v10 = v9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __BRIsCurrentProcessHasAccessToGroupContainers_block_invoke;
  v15[3] = &unk_1E3DA54F8;
  v16 = v7;
  v17 = v10;
  v11 = v7;
  v12 = v10;
  v13 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1A1AD85E4](v15);
  if ((((uint64_t (**)(_QWORD, const __CFString *))v13)[2](v13, CFSTR("com.apple.security.application-groups")) & 1) != 0)v14 = 1;
  else
    v14 = ((uint64_t (**)(_QWORD, const __CFString *))v13)[2](v13, CFSTR("com.apple.private.security.restricted-application-groups"));

  currentProcessHasAccessToGroupContainers = v14;
  objc_autoreleasePoolPop(v0);
}

@end
