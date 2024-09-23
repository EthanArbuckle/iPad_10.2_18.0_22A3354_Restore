@implementation NSError(HSAdditions)

+ (uint64_t)hs_homeSharingErrorWithCode:()HSAdditions userInfo:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HSHomeSharingErrorDomain"), a3, a4);
}

+ (uint64_t)hs_cloudErrorWithCode:()HSAdditions userInfo:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HSCloudErrorDomain"), a3, a4);
}

+ (uint64_t)hs_cloudLibraryUploadErrorWithCode:()HSAdditions userInfo:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HSCloudLibraryUploadErrorDomain"), a3, a4);
}

@end
