@implementation NSString(DAExtensions)

- (CFStringRef)da_stringByAddingPercentEscapesForUsername
{
  return (id)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], originalString, &stru_1E7B93480, CFSTR("@?/:"), 0x8000100u);
}

- (CFStringRef)da_stringByRemovingPercentEscapesForUsername
{
  return (id)CFURLCreateStringByReplacingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], originalString, &stru_1E7B93480);
}

- (id)da_removeSlashIfNeeded
{
  id v2;

  if ((objc_msgSend(a1, "hasSuffix:", CFSTR("/")) & 1) != 0)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)da_appendSlashIfNeeded
{
  id v2;

  if (objc_msgSend(a1, "hasSuffix:", CFSTR("/")))
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByAppendingString:", CFSTR("/"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (__CFString)da_stringByURLEscapingPathComponent
{
  CFStringRef v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v2 = CFURLCreateStringByAddingPercentEscapes(0, originalString, &stru_1E7B93480, CFSTR("@?/"), 0x8000100u);
  v3 = (__CFString *)v2;
  if (v2)
    v4 = (__CFString *)v2;
  else
    v4 = originalString;
  v5 = v4;

  return v5;
}

- (BOOL)da_hasPrefixCaseInsensitive:()DAExtensions
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)da_trimWhiteSpace
{
  __CFString *v1;
  void *v2;

  v1 = (__CFString *)objc_msgSend(a1, "mutableCopy");
  CFStringTrimWhitespace(v1);
  v2 = (void *)-[__CFString copy](v1, "copy");

  return v2;
}

+ (__CFString)da_newGUID
{
  const __CFUUID *v0;
  __CFString *v1;

  v0 = CFUUIDCreate(0);
  v1 = (__CFString *)CFUUIDCreateString(0, v0);
  if (v0)
    CFRelease(v0);
  return v1;
}

+ (id)da_new64ByteGUID
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "da_newGUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("-"), &stru_1E7B93480, 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%0.%lud"), 64 - objc_msgSend(v1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingFormat:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
