@implementation NSString(CSBundles)

- (uint64_t)isMail
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.mobilemail"));
}

- (uint64_t)isPhotos
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));
}

- (BOOL)isPommes
{
  return (objc_msgSend(a1, "isMail") & 1) != 0
      || (objc_msgSend(a1, "isPhotos") & 1) != 0
      || (objc_msgSend(a1, "cs_isPommesCtl") & 1) != 0
      || objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.mobilesafari"))
      && (_os_feature_enabled_impl() & 1) != 0;
}

- (uint64_t)cs_isPommesCtl
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.pommesctl"));
}

@end
