@implementation NSTimeZone(CalClassAdditions)

- (uint64_t)isEquivalentTo:()CalClassAdditions
{
  return timezonesAreEquivalent(a1, a3);
}

- (uint64_t)isUTC
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEquivalentTo:", v2);

  return v3;
}

- (id)descriptionForDate:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "abbreviationForDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1, "secondsFromGMTForDate:", v4);
    v8 = objc_msgSend(a1, "isDaylightSavingTimeForDate:", v4);
    v9 = &stru_1E2A86598;
    if (v8)
      v9 = CFSTR(" (Daylight)");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@) offset %ld%@"), v5, v6, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
