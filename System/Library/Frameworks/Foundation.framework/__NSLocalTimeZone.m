@implementation __NSLocalTimeZone

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (__NSLocalTimeZone)initWithCoder:(id)a3
{
  char v4;

  v4 = objc_msgSend(a3, "allowsKeyedCoding");

  if ((v4 & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSTimeZone cannot be decoded by non-keyed archivers"), 0));
  return (__NSLocalTimeZone *)(id)objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
}

@end
