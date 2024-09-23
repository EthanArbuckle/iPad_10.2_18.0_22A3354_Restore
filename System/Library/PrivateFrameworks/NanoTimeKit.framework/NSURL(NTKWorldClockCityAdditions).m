@implementation NSURL(NTKWorldClockCityAdditions)

+ (uint64_t)nwcCurrentLocationURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("nwc://curLoc"));
}

+ (id)nwcCurrentLocationURLForLatitude:()NTKWorldClockCityAdditions longitude:
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@"), CFSTR("nwc://curLoc"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)nwcCurrentLocationURLForLocation:()NTKWorldClockCityAdditions
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0C99E98];
  if (v3)
  {
    objc_msgSend(v3, "coordinate");
    v7 = v6;
    objc_msgSend(v4, "coordinate");
    objc_msgSend(v5, "nwcCurrentLocationURLForLatitude:longitude:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "nwcCurrentLocationURL");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
