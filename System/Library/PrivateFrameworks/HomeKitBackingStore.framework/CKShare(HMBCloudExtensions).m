@implementation CKShare(HMBCloudExtensions)

- (uint64_t)hmbEncodeForStorageLocation:()HMBCloudExtensions error:
{
  return objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, a4);
}

+ (id)hmbDecodeData:()HMBCloudExtensions fromStorageLocation:error:
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a3;
  objc_msgSend(v8, "setWithObject:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
