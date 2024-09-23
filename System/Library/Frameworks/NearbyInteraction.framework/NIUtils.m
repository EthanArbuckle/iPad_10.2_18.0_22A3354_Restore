@implementation NIUtils

+ (const)NIRelationshipSpecifierToString:(unint64_t)a3
{
  if (a3 > 0xF)
    return "N/A";
  else
    return off_1E4361F00[a3];
}

+ (BOOL)isIntValidRelationshipSpecifier:(int64_t)a3
{
  return (unint64_t)a3 < 0x10;
}

+ (const)AntennaDiversityOverrideToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return "N/A";
  else
    return off_1E4361F80[a3];
}

+ (BOOL)isIntValidAntennaDiversityOverride:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

+ (BOOL)isIntValidNearbyObjectUpdateRate:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

+ (BOOL)nearbyObjectUpdateRate:(int64_t)a3 isGreaterThan:(int64_t)a4
{
  unsigned int v4;
  BOOL v5;
  BOOL v6;

  v4 = (9u >> (a4 & 0xF)) & 1;
  if ((unint64_t)a4 >= 4)
    LOBYTE(v4) = 0;
  v5 = (a4 & 0xF) == 3;
  if ((unint64_t)a4 >= 4)
    v5 = 0;
  if (a3)
    v5 = 0;
  if (a3 == 1)
    v5 = v4;
  v6 = a3 == 2 || v5;
  return a3 != a4 && v6;
}

+ (const)NISessionBackgroundModeToString:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
    +[NIUtils NISessionBackgroundModeToString:].cold.1();
  return off_1E4361F98[a3];
}

+ (const)NINearbyObjectUpdateRateToString:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    +[NIUtils NINearbyObjectUpdateRateToString:].cold.1();
  return off_1E4361FB0[a3];
}

+ (const)NINearbyObjectUpdateRateToShortString:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    +[NIUtils NINearbyObjectUpdateRateToShortString:].cold.1();
  return off_1E4361FD0[a3];
}

+ (id)NISystemResourceAvailabilityToString:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v4 = (void *)MEMORY[0x1A1AF8270](a1, a2);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Unavailable:"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((a3 & 1) != 0)
      objc_msgSend(v5, "appendString:", CFSTR("AirplaneMode|"));
    if ((a3 & 2) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("GeographicalRegion|"));
    if ((a3 & 4) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("RecoveringFromError|"));
    if ((a3 & 8) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("NotReady|"));
    if ((a3 & 0x10) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("Unsupported|"));
    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("Available");
  }
  objc_autoreleasePoolPop(v4);
  return v7;
}

+ (id)NISystemPassiveAccessIntentToString:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v4 = (void *)MEMORY[0x1A1AF8270](a1, a2);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Intent:"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((a3 & 1) != 0)
      objc_msgSend(v5, "appendString:", CFSTR("WristRaise|"));
    if ((a3 & 2) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("GeofenceEntry|"));
    if ((a3 & 4) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("WalletInteraction|"));
    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("NoIntent");
  }
  objc_autoreleasePoolPop(v4);
  return v7;
}

+ (void)NISessionBackgroundModeToString:.cold.1()
{
  __assert_rtn("+[NIUtils NISessionBackgroundModeToString:]", "NIUtils.mm", 169, "false");
}

+ (void)NINearbyObjectUpdateRateToString:.cold.1()
{
  __assert_rtn("+[NIUtils NINearbyObjectUpdateRateToString:]", "NIUtils.mm", 185, "false");
}

+ (void)NINearbyObjectUpdateRateToShortString:.cold.1()
{
  __assert_rtn("+[NIUtils NINearbyObjectUpdateRateToShortString:]", "NIUtils.mm", 201, "false");
}

@end
