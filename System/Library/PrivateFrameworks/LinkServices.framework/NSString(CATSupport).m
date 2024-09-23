@implementation NSString(CATSupport)

- (id)ln_stringByEscapingForXML
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("&apos;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("&quot;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  return v1;
}

@end
