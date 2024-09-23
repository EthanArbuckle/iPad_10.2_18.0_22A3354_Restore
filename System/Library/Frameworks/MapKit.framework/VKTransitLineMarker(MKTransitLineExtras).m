@implementation VKTransitLineMarker(MKTransitLineExtras)

- (MKMapItemIdentifier)mapItemIdentifier
{
  MKMapItemIdentifier *v2;
  void *v3;
  MKMapItemIdentifier *v4;

  v2 = [MKMapItemIdentifier alloc];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MKMapItemIdentifier initWithGEOMapItemIdentifier:](v2, "initWithGEOMapItemIdentifier:", v3);

  return v4;
}

- (uint64_t)artworkSourceType
{
  return 1;
}

- (uint64_t)artworkUseType
{
  return 0;
}

- (uint64_t)iconDataSource
{
  return 0;
}

- (uint64_t)iconFallbackShieldDataSource
{
  return 0;
}

- (uint64_t)textDataSource
{
  return 0;
}

- (uint64_t)hasRoutingIncidentBadge
{
  return 0;
}

- (id)shieldColorString
{
  void *v2;
  float v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "shieldColor");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%.2X"), (float)(v3 * 255.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "shieldColor");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%.2X"), (float)(v6 * 255.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "shieldColor");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%.2X"), (float)(v9 * 255.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "shieldColor");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%.2X"), (float)(v12 * 255.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@"), v4, v7, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
