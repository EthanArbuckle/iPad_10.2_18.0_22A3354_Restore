@implementation NSKeyedArchiver(WFTemporaryFileManager)

+ (id)wf_securelyArchivedDataWithRootObject:()WFTemporaryFileManager
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "wf_securelyArchivedDataWithRootObject:fileCoder:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)wf_securelyArchivedDataWithRootObject:()WFTemporaryFileManager deletionResponsibility:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeletionResponsibility:", a4);
  objc_msgSend(a1, "wf_securelyArchivedDataWithRootObject:fileCoder:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
