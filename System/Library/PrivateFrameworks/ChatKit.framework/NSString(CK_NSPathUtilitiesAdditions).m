@implementation NSString(CK_NSPathUtilitiesAdditions)

- (id)__ck_stringByExpandingTildeInPath
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "hasPrefix:", CFSTR("~")))
  {
    v2 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v2, "replaceCharactersInRange:withString:", 0, 1, CFSTR("/var/mobile/"));
    v3 = (void *)objc_msgSend(v2, "copy");

  }
  else
  {
    objc_msgSend(a1, "stringByExpandingTildeInPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
