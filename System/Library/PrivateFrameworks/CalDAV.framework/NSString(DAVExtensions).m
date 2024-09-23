@implementation NSString(DAVExtensions)

- (id)stringByXMLUnquoting
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&amp;"),
    CFSTR("&"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&lt;"),
    CFSTR("<"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&gt;"),
    CFSTR(">"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&quot;"),
    CFSTR("\"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&apos;"),
    CFSTR("'"),
    0,
    0,
    objc_msgSend(v1, "length"));
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

- (id)stringByURLQuotingPaths
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (stringByURLQuotingPaths_onceToken != -1)
    dispatch_once(&stringByURLQuotingPaths_onceToken, &__block_literal_global_1);
  objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", stringByURLQuotingPaths_allowedCharacterSet);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (void *)v2;
  else
    v4 = a1;
  v5 = v4;

  return v5;
}

- (id)stringByURLQuoting
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (stringByURLQuoting_onceToken != -1)
    dispatch_once(&stringByURLQuoting_onceToken, &__block_literal_global_26);
  objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", stringByURLQuoting_allowedCharacterSet);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (void *)v2;
  else
    v4 = a1;
  v5 = v4;

  return v5;
}

- (__CFString)stringByURLUnquoting
{
  __CFString *v2;

  v2 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, originalString, &stru_24C1FD208);
  if (!v2)
    v2 = originalString;
  return v2;
}

@end
