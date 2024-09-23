@implementation IKJSRestrictions

- (id)asPrivateIKJSRestrictions
{
  IKJSRestrictions *v3;

  if (-[IKJSRestrictions conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01E8470))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

+ (id)restrictionsDidChangeNotificationName
{
  return (id)*MEMORY[0x1E0D46EC8];
}

- (int64_t)maxAppRank
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveValueForSetting:", *MEMORY[0x1E0D470B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

- (int64_t)maxMovieRank
{
  void *v2;
  void *v3;
  uint64_t v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveValueForSetting:", *MEMORY[0x1E0D470C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  if (v4)
    v5 = v4;
  else
    v5 = -1;

  return v5;
}

- (int64_t)maxTVShowRank
{
  void *v2;
  void *v3;
  uint64_t v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveValueForSetting:", *MEMORY[0x1E0D470C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  if (v4)
    v5 = v4;
  else
    v5 = -1;

  return v5;
}

- (NSString)maxAppRating
{
  return (NSString *)-[IKJSRestrictions _ratingForSetting:domain:countryCode:](self, "_ratingForSetting:domain:countryCode:", *MEMORY[0x1E0D470B0], CFSTR("ratingApps"), 0);
}

- (BOOL)appInstallationAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOnDeviceAppInstallationAllowed");

  return v3;
}

- (BOOL)appAnalyticsAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppAnalyticsAllowed");

  return v3;
}

- (id)maxMovieRatingForCountry:(id)a3
{
  return -[IKJSRestrictions _ratingForSetting:domain:countryCode:](self, "_ratingForSetting:domain:countryCode:", *MEMORY[0x1E0D470C0], CFSTR("ratingMovies"), a3);
}

- (id)maxTVShowRatingForCountry:(id)a3
{
  return -[IKJSRestrictions _ratingForSetting:domain:countryCode:](self, "_ratingForSetting:domain:countryCode:", *MEMORY[0x1E0D470C8], CFSTR("ratingTVShows"), a3);
}

- (BOOL)allowArtistActivity
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D470D8]);

  return v3 != 2;
}

- (BOOL)allowsErotica
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F80]);

  return v3 != 2;
}

- (BOOL)allowsExplicit
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FF8]);

  return v3 != 2;
}

- (BOOL)allowsMusicVideos
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D470E8]);

  return v3 != 2;
}

- (BOOL)allowsITunes
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47080]);

  return v3 != 2;
}

- (BOOL)allowsShowingUndownloadedTVShows
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47178]);

  return v3 != 2;
}

- (BOOL)allowsShowingUndownloadedMovies
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47170]);

  return v3 != 2;
}

- (id)_ratingForSetting:(id)a3 domain:(id)a4 countryCode:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D47230];
  v11 = a3;
  objc_msgSend(v10, "sharedConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "effectiveValueForSetting:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isUndefined") & 1) != 0 || (objc_msgSend(v9, "isNull") & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v9, "toString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v14, "length"))
  {
    -[IKJSRestrictions _contentRestrictionsCountryCode](self, "_contentRestrictionsCountryCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    v14 = v17;
  }
  +[IKRestrictionsUtilities ratingForRestrictionRanking:inDomain:countryCode:](IKRestrictionsUtilities, "ratingForRestrictionRanking:inDomain:countryCode:", v13, v8, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_contentRestrictionsCountryCode
{
  return (id)CRCopyCountryCode();
}

@end
