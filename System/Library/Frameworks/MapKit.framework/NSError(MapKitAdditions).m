@implementation NSError(MapKitAdditions)

- (uint64_t)_mapkit_isCLDenied
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(a1, "code") != 1)
    return 0;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C9E488]);

  return v3;
}

- (uint64_t)_mapkit_isCLLocationUnknown
{
  void *v3;
  uint64_t v4;

  if (objc_msgSend(a1, "code"))
    return 0;
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C9E488]);

  return v4;
}

- (uint64_t)_mapkit_isCLHeadingFailure
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(a1, "code") != 3)
    return 0;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C9E488]);

  return v3;
}

- (uint64_t)_mapkit_isCLErrorNetwork
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(a1, "code") != 2)
    return 0;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C9E488]);

  return v3;
}

- (id)_mapkit_locationErrorSettingsURL
{
  void *v2;
  int v3;
  unint64_t v4;
  void *v5;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", MKLocationErrorDomain);

  if (v3 && (v4 = objc_msgSend(a1, "code"), v4 <= 6) && ((0x5Fu >> v4) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", off_1E20DB270[v4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
