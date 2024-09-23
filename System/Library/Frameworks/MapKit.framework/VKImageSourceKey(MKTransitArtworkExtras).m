@implementation VKImageSourceKey(MKTransitArtworkExtras)

- (uint64_t)artworkSourceType
{
  int v1;

  v1 = objc_msgSend(a1, "keyType");
  if (v1 == 1)
    return 1;
  else
    return 2 * (v1 == 2);
}

- (uint64_t)artworkUseType
{
  return 0;
}

- (id)shieldDataSource
{
  void *v2;

  if (objc_msgSend(a1, "keyType") == 1)
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)iconDataSource
{
  void *v2;

  if (objc_msgSend(a1, "keyType") == 2)
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (uint64_t)iconFallbackShieldDataSource
{
  return 0;
}

- (id)shieldColorString
{
  float v1;
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "transitLineColor");
  v2 = v1;
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2X"), (float)(v7 * 255.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2X"), (float)(v2 * 255.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2X"), (float)(v4 * 255.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2X"), (float)(v6 * 255.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@"), v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (uint64_t)iconType
{
  return 1;
}

- (uint64_t)hasRoutingIncidentBadge
{
  return 0;
}

- (uint64_t)textDataSource
{
  return 0;
}

@end
