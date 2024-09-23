@implementation CLHeading(MapKitAdditions)

- (uint64_t)heading
{
  double v2;

  objc_msgSend(a1, "trueHeading");
  if (v2 >= 0.0)
    return objc_msgSend(a1, "trueHeading");
  else
    return objc_msgSend(a1, "magneticHeading");
}

- (uint64_t)initWithHeading:()MapKitAdditions accuracy:
{
  _OWORD v4[2];
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  memset(v4, 0, sizeof(v4));
  v7 = 0u;
  v8 = 0u;
  v9 = 0;
  v5 = a2;
  v6 = a3;
  return objc_msgSend(a1, "initWithClientHeading:", v4);
}

- (BOOL)hasGeomagneticVector
{
  double v2;
  double v3;
  double v5;

  objc_msgSend(a1, "x");
  if (v2 != 0.0)
    return 1;
  objc_msgSend(a1, "y");
  if (v3 != 0.0)
    return 1;
  objc_msgSend(a1, "z");
  return v5 != 0.0;
}

- (id)compactDescription
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((objc_msgSend(a1, "hasGeomagneticVector") & 1) != 0)
  {
    objc_msgSend(a1, "shortDescription");
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "heading");
    v4 = v3;
    objc_msgSend(a1, "headingAccuracy");
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%+.1f ±%.0f°"), v4, v5);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
