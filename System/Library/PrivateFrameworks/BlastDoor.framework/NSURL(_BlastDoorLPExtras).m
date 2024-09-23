@implementation NSURL(_BlastDoorLPExtras)

- (BOOL)_bd_lp_isHTTPFamilyURL
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "compare:options:", CFSTR("http"), 3))
    v2 = objc_msgSend(v1, "compare:options:", CFSTR("https"), 3) == 0;
  else
    v2 = 1;

  return v2;
}

- (BOOL)_bd_lp_hasAllowedNonHTTPScheme
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = !objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("shoebox"))
      || !objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("wallet"))
      || objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("prefs")) == 0;
  else
    v3 = 0;

  return v3;
}

@end
