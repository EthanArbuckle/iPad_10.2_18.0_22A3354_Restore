@implementation NSURL(LSPreferredLocalizations)

- (id)ls_preferredLocalizations
{
  id v3;

  if (!objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
    return 0;
  v3 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v3, CFSTR("com.apple.launchservices.preferredLocalizations"), 0);
  return v3;
}

- (void)ls_setPreferredLocalizations:()LSPreferredLocalizations
{
  id v4;

  v4 = a3;
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
    objc_msgSend(a1, "setTemporaryResourceValue:forKey:", v4, CFSTR("com.apple.launchservices.preferredLocalizations"));

}

@end
