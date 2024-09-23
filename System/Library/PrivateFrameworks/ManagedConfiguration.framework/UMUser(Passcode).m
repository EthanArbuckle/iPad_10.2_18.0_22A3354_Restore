@implementation UMUser(Passcode)

+ (uint64_t)mc_userPasscodeTypeWithUnlockScreenType:()Passcode simplePasscodeType:
{
  uint64_t v4;
  uint64_t v5;

  v4 = 3;
  v5 = 3;
  if (a4 == 1)
    v5 = 1;
  if (!a4)
    v5 = 0;
  if (!a3)
    v4 = v5;
  if (a3 == 1)
    return 2;
  else
    return v4;
}

+ (uint64_t)mc_userPasscodeTypeWithPasscode:()Passcode
{
  uint64_t v4;
  unsigned int v6;

  v6 = 0;
  v4 = +[MCPasscodeUtilities unlockScreenTypeForPasscode:outSimplePasscodeType:](MCPasscodeUtilities, "unlockScreenTypeForPasscode:outSimplePasscodeType:", a3, &v6);
  return objc_msgSend(a1, "mc_userPasscodeTypeWithUnlockScreenType:simplePasscodeType:", v4, v6);
}

@end
