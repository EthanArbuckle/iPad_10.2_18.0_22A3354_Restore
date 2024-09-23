@implementation LPApplicationCompatibilityQuirks

+ (BOOL)needsFreshWKUserContentController
{
  return (dyld_program_sdk_at_least() & 1) == 0
      && +[LPApplicationIdentification isCNNMobile](LPApplicationIdentification, "isCNNMobile");
}

+ (BOOL)allowsSkinnyWidthByDefault
{
  return dyld_program_sdk_at_least() ^ 1;
}

+ (BOOL)supportsLPLinkViewAutolayout
{
  return dyld_program_sdk_at_least();
}

@end
