@implementation CLLocation(schema)

- (id)schema
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "coordinate");
  if (v3 != 0.0 || (objc_msgSend(a1, "coordinate"), v4 != 0.0))
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/GeoCoordinates"), CFSTR("@type"));
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "coordinate");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("latitude"));

    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "coordinate");
    objc_msgSend(v7, "numberWithDouble:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("longitude"));

  }
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
    v10 = 0;
  else
    v10 = v2;

  return v10;
}

+ (id)fromSchema:()schema
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  id v13;
  double v14;
  double v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("longitude"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("latitude")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("latitude"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("longitude"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;

    v13 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    v14 = v9;
    v15 = v12;
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    v14 = 0.0;
    v15 = 0.0;
  }
  v16 = (void *)objc_msgSend(v13, "initWithLatitude:longitude:", v14, v15);

  return v16;
}

@end
