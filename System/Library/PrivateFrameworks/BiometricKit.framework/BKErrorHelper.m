@implementation BKErrorHelper

+ (id)errorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.BiometricKit"), a3, 0);
}

+ (id)errorWithOSStatus:(int)a3
{
  return (id)objc_msgSend(a1, "errorWithCode:", 1);
}

@end
