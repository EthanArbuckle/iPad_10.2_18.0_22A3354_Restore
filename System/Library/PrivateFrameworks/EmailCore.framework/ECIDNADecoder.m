@implementation ECIDNADecoder

+ (id)stringByDecodingDomainName:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4
    && (objc_msgSend(MEMORY[0x1E0C99DC8], "ef_posixLocale"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v3, "rangeOfString:options:range:locale:", CFSTR("xn--"), 1, 0, v4, v5),
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    _stringByApplyingIDNATranslationWithRange(v3, MEMORY[0x1E0DE62D0]);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_msgSend(v3, "copy");
  }
  v8 = (void *)v7;

  return v8;
}

@end
