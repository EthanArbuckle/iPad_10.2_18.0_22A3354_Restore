@implementation AXSettings(HPSAdditions)

- (uint64_t)hps_touchAccomodationsTapActivationMethodString
{
  return objc_msgSend(MEMORY[0x24BE006C0], "hps_stringFromTapActivationMethod:", objc_msgSend(a1, "touchAccommodationsTapActivationMethod"));
}

+ (__CFString)hps_stringFromTapActivationMethod:()HPSAdditions
{
  if (a3 > 2)
    return 0;
  else
    return off_24F9AF988[a3];
}

+ (uint64_t)hps_tapActivationMethodFromString:()HPSAdditions
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("off")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("useInitialTouchLocation")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("useFinalTouchLocation")))
  {
    v4 = 2;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

@end
