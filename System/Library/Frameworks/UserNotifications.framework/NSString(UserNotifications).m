@implementation NSString(UserNotifications)

- (uint64_t)un_isFirstPartyIdentifier
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("com.apple."));
}

- (__CFString)un_logDigest
{
  id v1;
  const char *v2;
  CC_LONG v3;
  __CFString *v4;
  void *v5;
  id v6;
  unsigned __int8 md[20];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  v2 = (const char *)objc_msgSend(v1, "UTF8String");
  if (v2
    || objc_msgSend(v1, "length")
    && (objc_msgSend(v1, "dataUsingEncoding:allowLossyConversion:", 1, 1),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4)),
        v2 = (const char *)objc_msgSend(v6, "UTF8String"),
        v6,
        v5,
        v2))
  {
    v3 = strlen(v2);
    v4 = (__CFString *)CC_SHA1(v2, v3, md);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X%02X-%02X%02X"), md[0], md[1], md[2], md[3]);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = CFSTR("<Unicode conversion error>");
  }
  return v4;
}

@end
