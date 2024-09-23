@implementation NSString(MFStringUtils)

+ (id)mf_stringWithData:()MFStringUtils encoding:
{
  if (a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", a3, a4);
  else
    return 0;
}

- (uint64_t)mf_caseInsensitiveCompareExcludingXDash:()MFStringUtils
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  if (a1 == a3)
    return 0;
  if (!a3)
    return 1;
  v5 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("x-"), 9);
  v7 = v6;
  v8 = objc_msgSend(a3, "rangeOfString:options:", CFSTR("x-"), 9);
  if ((v7 != 0) == (v9 != 0))
    return objc_msgSend(a1, "compare:options:", a3, 1);
  if (v7)
    return objc_msgSend(a1, "compare:options:range:", a3, 9, v5 + v7, objc_msgSend(a1, "length") - (v5 + v7));
  result = objc_msgSend(a3, "compare:options:range:", a1, 9, v8 + v9, objc_msgSend(a3, "length") - (v8 + v9));
  if (result == -1)
    return 1;
  if (result == 1)
    return -1;
  return result;
}

- (uint64_t)mf_dataUsingEncoding:()MFStringUtils
{
  return objc_msgSend(a1, "mf_dataUsingEncoding:allowLossyConversion:", a3, 0);
}

- (void)mf_dataUsingEncoding:()MFStringUtils allowLossyConversion:
{
  CFIndex v7;
  CFStringEncoding v8;
  char v9;
  UInt8 v10;
  void *v11;
  id v12;
  void *v13;
  UInt8 *v14;
  id v15;
  NSObject *v16;
  CFIndex v18;
  uint8_t buf[4];
  unint64_t v20;
  uint64_t v21;
  CFRange v22;
  CFRange v23;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = -[__CFString length](a1, "length");
  v18 = 0xAAAAAAAAAAAAAAAALL;
  v8 = CFStringConvertNSStringEncodingToEncoding(a3);
  if (!CFStringIsEncodingAvailable(v8))
  {
    v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = a3;
      _os_log_impl(&dword_1ABB13000, v16, OS_LOG_TYPE_DEFAULT, "#Warning Unknown encoding %lu", buf, 0xCu);
    }
    return 0;
  }
  if (a3 == 1)
    v9 = -1;
  else
    v9 = 63;
  if (a4)
    v10 = v9;
  else
    v10 = 0;
  v22.location = 0;
  v22.length = v7;
  v11 = 0;
  if (MFStringGetBytes(a1, v22, v8, v10, 1u, 0, 0, &v18) == v7)
  {
    v12 = objc_allocWithZone((Class)MFMutableData);
    v13 = (void *)objc_msgSend(v12, "initWithLength:", v18);
    v11 = v13;
    if (!v18)
    {
LABEL_12:
      v15 = v11;
      return v11;
    }
    v14 = (UInt8 *)objc_msgSend(v13, "mutableBytes");
    v23.location = 0;
    v23.length = v7;
    if (MFStringGetBytes(a1, v23, v8, v10, 1u, v14, v18, &v18) == v7)
    {
      objc_msgSend(v11, "setLength:", v18);
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@: didn't convert all characters"), _NSMethodExceptionProem());

    return 0;
  }
  return v11;
}

- (uint64_t)mf_copyDisplayStringInRange:()MFStringUtils
{
  void *v7;
  uint64_t v8;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0)
    return objc_msgSend(a1, "copy");
  v7 = (void *)objc_msgSend(a1, "substringWithRange:");
  v8 = objc_msgSend(v7, "_lp_userVisibleHost");
  if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0)
    return objc_msgSend(a1, "copy");
  else
    return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), objc_msgSend(a1, "substringWithRange:", 0, a3), v8);
}

- (uint64_t)mf_copyDisplayString
{
  return objc_msgSend(a1, "mf_copyDisplayStringInRange:", 0, objc_msgSend(a1, "length"));
}

@end
