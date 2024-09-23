@implementation HFPlatformCanary

+ (id)tweet
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v5 = 0;
  v6 = 0;
  objc_msgSend(v2, "getRed:green:blue:alpha:", &v7, &v6, &v5, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This is not a mac: red %f green %f blue %f"), v7, v6, v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isiOSBuild
{
  return 1;
}

@end
