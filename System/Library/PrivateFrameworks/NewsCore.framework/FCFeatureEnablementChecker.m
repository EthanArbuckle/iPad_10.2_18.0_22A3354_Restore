@implementation FCFeatureEnablementChecker

+ (BOOL)enabledForCurrentLevel:(unint64_t)a3
{
  int v5;

  v5 = a3 & NFInternalBuild();
  if (NFSeedBuild() && (v5 & 1) == 0)
    LOBYTE(v5) = (objc_msgSend(a1, "currentSeedTestBit") & a3) != 0;
  if ((NFInternalBuild() & 1) == 0 && (NFSeedBuild() & 1) == 0)
    LOBYTE(v5) = (a3 & 2) != 0;
  return v5;
}

+ (BOOL)enabledInConfig:(id)a3 forKey:(id)a4 withDefaultLevel:(unint64_t)a5
{
  return objc_msgSend(a1, "enabledForCurrentLevel:", FCAppConfigurationIntegerValue(a3, (uint64_t)a4, a5));
}

+ (unint64_t)currentSeedTestBit
{
  return 64;
}

@end
