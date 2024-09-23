@implementation NSAutoLocale

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSAutoLocale should not be encoded directly"), 0));
}

- (NSAutoLocale)initWithCoder:(id)a3
{
  char v4;

  v4 = objc_msgSend(a3, "allowsKeyedCoding");

  if ((v4 & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSLocales cannot be decoded by non-keyed archivers"), 0));
  return (NSAutoLocale *)(id)objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

@end
