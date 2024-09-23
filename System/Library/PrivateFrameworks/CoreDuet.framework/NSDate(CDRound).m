@implementation NSDate(CDRound)

- (uint64_t)cd_dateWithFloorForAlignment:()CDRound
{
  void *v3;
  double v4;

  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  return objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:", (double)((uint64_t)v4 / (unint64_t)a2 * (unint64_t)a2));
}

- (uint64_t)cd_dateWithCeilingForAlignment:()CDRound
{
  void *v3;
  double v4;
  unint64_t v5;
  unint64_t v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v5 = (uint64_t)v4 % (unint64_t)a2;
  v6 = (unint64_t)a2 - v5;
  if (!v5)
    v6 = 0;
  return objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:", (double)(v6 + (uint64_t)v4));
}

- (uint64_t)cd_dateWithFloorForAlignment:()CDRound withOffset:inTimeZone:
{
  double v8;
  void *v9;
  double v10;

  v8 = (double)objc_msgSend(a5, "secondsFromGMT");
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  return objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:", (double)(v10 - fmod(v10 + v8 - a3, a2)));
}

- (uint64_t)cd_dateWithCeilingForAlignment:()CDRound withOffset:inTimeZone:
{
  double v8;
  void *v9;
  double v10;
  double v11;
  long double v12;
  double v13;
  BOOL v14;
  double v15;

  v8 = (double)objc_msgSend(a5, "secondsFromGMT");
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v11 = v10;
  v12 = fmod(v10 + v8 - a3, a2);
  v13 = a2 - v12;
  v14 = v12 == 0.0;
  v15 = -0.0;
  if (!v14)
    v15 = v13;
  return objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:", v11 + v15);
}

@end
