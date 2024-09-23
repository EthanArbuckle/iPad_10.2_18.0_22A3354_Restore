@implementation CKSubscription(HMBCloudExtensions)

- (uint64_t)hmbEncodeForStorageLocation:()HMBCloudExtensions error:
{
  return objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, a4);
}

+ (uint64_t)hmbDecodeData:()HMBCloudExtensions fromStorageLocation:error:
{
  return objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, a3);
}

@end
