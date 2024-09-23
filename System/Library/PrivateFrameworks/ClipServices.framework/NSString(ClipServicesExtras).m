@implementation NSString(ClipServicesExtras)

- (id)cps_sha256
{
  unsigned __int8 *v2;
  id v3;
  void *v4;

  v2 = (unsigned __int8 *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA256((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), v2);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", v2, 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cps_sha256String
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t i;

  objc_msgSend(a1, "cps_sha256");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = objc_msgSend(v1, "bytes");

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 64);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v2 + i));
  return v3;
}

- (__CFString)cps_privacyPreservingDescription
{
  unint64_t v1;
  __CFString *v2;

  v1 = objc_msgSend(a1, "length");
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("about %lu characters"), 5 * (unint64_t)((double)v1 / 5.0));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("empty");
  }
  return v2;
}

- (id)cps_stringByRemovingPrefix:()ClipServicesExtras
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "hasPrefix:", v4) & 1) != 0)
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v4, "length"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  v6 = v5;

  return v6;
}

- (BOOL)cps_isAlphaNumeric
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v3) == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (uint64_t)cps_looksLikeUUIDOrWebClipIdentifier
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    v3 = result;
    return (objc_msgSend(a1, "hasPrefix:", CFSTR("com.apple.appclip-")) & 1) != 0
        || (objc_msgSend(a1, "hasPrefix:", CFSTR("com.apple.webapp-")) & 1) != 0
        || v3 == 32 && (objc_msgSend(a1, "cps_isAlphaNumeric") & 1) != 0;
  }
  return result;
}

- (uint64_t)cps_isAMSPlaceholderBundleIdentifier
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.ams.ac"));
}

@end
