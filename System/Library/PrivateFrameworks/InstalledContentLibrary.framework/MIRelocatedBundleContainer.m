@implementation MIRelocatedBundleContainer

- (BOOL)makeContainerLiveWithError:(id *)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v8;

  _CreateAndLogError((uint64_t)"-[MIRelocatedBundleContainer makeContainerLiveWithError:]", 24, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("There is nothing to be made live"), v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
    *a3 = objc_retainAutorelease(v5);

  return 0;
}

- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6
{
  uint64_t v6;
  void *v8;
  void *v9;
  uint64_t v11;

  _CreateAndLogError((uint64_t)"-[MIRelocatedBundleContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 33, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("There is nothing to be replaced"), v6, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a6)
    *a6 = objc_retainAutorelease(v8);

  return 0;
}

- (BOOL)purgeContentWithError:(id *)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v8;

  _CreateAndLogError((uint64_t)"-[MIRelocatedBundleContainer purgeContentWithError:]", 42, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("There is nothing to purge"), v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
    *a3 = objc_retainAutorelease(v5);

  return 0;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v8;

  _CreateAndLogError((uint64_t)"-[MIRelocatedBundleContainer regenerateDirectoryUUIDWithError:]", 51, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("There is nothing to generate UUID"), v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
    *a3 = objc_retainAutorelease(v5);

  return 0;
}

- (unint64_t)diskUsage
{
  void *v3;
  void *v4;
  unint64_t v5;

  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIContainer containerURL](self, "containerURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "diskUsageForURL:", v4);

  return v5;
}

- (BOOL)shouldHaveCorrespondingDataContainer
{
  return 0;
}

@end
