@implementation NSTimeZone(MPAdditions)

- (id)ISO8601TimeZoneOffsetFromUTC
{
  uint64_t v1;
  double v2;
  double v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v2 = (double)objc_msgSend(a1, "secondsFromGMT") / 3600.0;
  v3 = fabs(v2);
  LODWORD(v1) = vcvtmd_s64_f64(v3);
  v4 = (int)(fmod(v3, 1.0) * 60.0);
  v5 = CFSTR("-");
  if (v2 >= 0.0)
    v5 = CFSTR("+");
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = v5;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%02d"), v1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":%02d"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v4)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v7, v8, v9);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, v8, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
