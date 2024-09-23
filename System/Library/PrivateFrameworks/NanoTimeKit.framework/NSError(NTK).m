@implementation NSError(NTK)

+ (uint64_t)ntk_errorWithCode:()NTK
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit"), a3, 0);
}

@end
