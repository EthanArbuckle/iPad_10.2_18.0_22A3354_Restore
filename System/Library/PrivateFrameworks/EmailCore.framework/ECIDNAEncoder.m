@implementation ECIDNAEncoder

+ (id)stringByEncodingDomainName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length") && (objc_msgSend(a1, "encodingRequiredForDomainName:", v4) & 1) != 0)
  {
    _stringByApplyingIDNATranslationWithRange(v4, MEMORY[0x1E0DE62C0]);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(v4, "copy");
  }
  v6 = (void *)v5;

  return v6;
}

+ (BOOL)encodingRequiredForDomainName:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "ef_unsafeDomainNameCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v4, 0, 0, objc_msgSend(v3, "length")) != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

@end
