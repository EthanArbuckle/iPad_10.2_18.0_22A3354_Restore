@implementation NSString(EscapingFromCoreSpotlight)

- (id)_fp_escapedStringForSearchQuery
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "decomposedStringWithCanonicalMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\\\"), 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("\\'"), 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("*"), CFSTR("\\*"), 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

@end
