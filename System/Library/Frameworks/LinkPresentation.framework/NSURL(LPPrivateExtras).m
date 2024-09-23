@implementation NSURL(LPPrivateExtras)

- (uint64_t)_lp_hasAllowedNonHTTPScheme
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "_lp_isEqualIgnoringCase:", CFSTR("prefs")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(a1, "_lp_hasWalletRelatedScheme");

  return v3;
}

@end
