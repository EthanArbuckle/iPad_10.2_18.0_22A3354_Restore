@implementation NSFileVersion(IC)

+ (uint64_t)ic_addVersionOfItemAtURL:()IC withContentsOfURL:options:error:
{
  return objc_msgSend(a1, "_addVersionOfItemAtURL:withContentsOfURL:options:temporaryStorageIdentifier:error:", a3, a4, a5, 0, a6);
}

@end
