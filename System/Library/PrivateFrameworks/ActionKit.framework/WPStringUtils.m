@implementation WPStringUtils

+ (id)unescapedStringWithString:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&quot;"),
      CFSTR("\"),
      2,
      0,
      objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&#x27;"),
      CFSTR("'"),
      2,
      0,
      objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&#x39;"),
      CFSTR("'"),
      2,
      0,
      objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&#x92;"),
      CFSTR("'"),
      2,
      0,
      objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&#x96;"),
      CFSTR("'"),
      2,
      0,
      objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&gt;"),
      CFSTR(">"),
      2,
      0,
      objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&lt;"),
      CFSTR("<"),
      2,
      0,
      objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&amp;"),
      CFSTR("&"),
      2,
      0,
      objc_msgSend(v3, "length"));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)escapedStringWithString:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&#38;"),
      2,
      0,
      objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&#62;"),
      2,
      0,
      objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&#60;"),
      2,
      0,
      objc_msgSend(v3, "length"));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
