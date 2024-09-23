@implementation NSLocale(NSLocale)

- (uint64_t)initWithCoder:()NSLocale
{
  uint64_t v5;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSLocales cannot be decoded by non-keyed archivers"), 0));
  }
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.identifier"));
  if ((_NSIsNSString() & 1) != 0)
    return objc_msgSend(a1, "initWithLocaleIdentifier:", v5);
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, 0));

  return 0;
}

+ (uint64_t)autoupdatingCurrentLocale
{
  return objc_msgSend(MEMORY[0x1E0C99DC8], "_autoupdatingCurrent");
}

- (NSString)debugDescription
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = a1;
  v2.super_class = (Class)NSLocale_0;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ '%@'}"), objc_msgSendSuper2(&v2, sel_debugDescription), objc_msgSend(a1, "localeIdentifier"));
}

- (uint64_t)encodeWithCoder:()NSLocale
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSLocales cannot be encoded by non-keyed archivers"), 0));
  return objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "localeIdentifier"), CFSTR("NS.identifier"));
}

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

@end
