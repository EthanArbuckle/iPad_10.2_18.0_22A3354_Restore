@implementation ACAccount(DMCEnrollment)

- (uint64_t)dmc_isUnremovableRemotelyManagedAccount
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "dmc_remoteManagementAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    goto LABEL_5;
  objc_msgSend(v1, "dmc_managementProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isProfileLocked");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isProvisionallyEnrolled") ^ 1;

  }
  else
  {
LABEL_5:
    v8 = 0;
  }

  return v8;
}

@end
