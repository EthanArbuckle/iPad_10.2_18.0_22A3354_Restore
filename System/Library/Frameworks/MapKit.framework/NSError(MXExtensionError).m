@implementation NSError(MXExtensionError)

+ (uint64_t)_errorWithExtensionServiceError:()MXExtensionError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_MXExtensionServiceErrorDomain"), a3, 0);
}

@end
