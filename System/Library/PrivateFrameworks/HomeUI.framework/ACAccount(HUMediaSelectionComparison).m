@implementation ACAccount(HUMediaSelectionComparison)

- (uint64_t)hasSameAppleMusicServiceAltDSID:()HUMediaSelectionComparison
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(a1, "ams_altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  return v10;
}

@end
