@implementation RTLocation(MOExtensions)

+ (double)distanceFromlat1:()MOExtensions lon1:tolat2:lon2:
{
  double v4;
  double v5;
  double v6;
  __double2 v7;
  double v8;

  if (a2 < 0.0)
    a2 = a2 + 360.0;
  if (a4 < 0.0)
    a4 = a4 + 360.0;
  v4 = a4 - a2;
  if (v4 <= 180.0)
  {
    if (v4 < -180.0)
      v4 = v4 + 360.0;
  }
  else
  {
    v4 = v4 + -360.0;
  }
  v5 = (a3 - a1) * 0.0174532925;
  v6 = v4 * 0.0174532925;
  v7 = __sincos_stret((a1 + a3) * 0.0174532925 * 0.5);
  v8 = sqrt(v7.__sinval * -0.00669437999 * v7.__sinval + 1.0);
  return sqrt(v7.__cosval * (6378137.0 / v8) * v6 * (v7.__cosval * (6378137.0 / v8) * v6)+ v5 * (6335439.33 / (v8 * (v8 * v8))) * (v5 * (6335439.33 / (v8 * (v8 * v8)))));
}

- (uint64_t)distanceFromLocation:()MOExtensions
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = (void *)MEMORY[0x1E0D183B0];
  v5 = a3;
  objc_msgSend(a1, "latitude");
  v7 = v6;
  objc_msgSend(a1, "longitude");
  v9 = v8;
  objc_msgSend(v5, "latitude");
  v11 = v10;
  objc_msgSend(v5, "longitude");
  v13 = v12;

  return objc_msgSend(v4, "distanceFromlat1:lon1:tolat2:lon2:", v7, v9, v11, v13);
}

- (id)dictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "latitude");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("locationLatitude"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "longitude");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("locationLongitude"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "horizontalUncertainty");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("locationHorizontalUncertainty"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("locationDate"));

  v12 = (void *)objc_msgSend(v2, "copy");
  return v12;
}

+ (id)locationFromDictionary:()MOExtensions
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locationLatitude"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locationLongitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locationHorizontalUncertainty"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locationDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  if (v15 <= 0.0)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithLatitude:longitude:horizontalUncertainty:date:", v16, v6, v9, v12);

  return v17;
}

@end
