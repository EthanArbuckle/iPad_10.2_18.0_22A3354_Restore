@implementation CPAccNavInfoType

+ (id)stringForUpdateClass:(Class)a3 infoType:(unsigned __int16)a4
{
  int v4;
  __CFString *v6;
  uint64_t v7;
  __CFString **v8;

  v4 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    LOWORD(v7) = v4 - 1;
    if ((v4 - 1) >= 3)
    {
      v6 = CFSTR("DisplayComponentID");
      return v6;
    }
    v7 = (__int16)v7;
    v8 = off_24C77D160;
    goto LABEL_10;
  }
  if ((Class)objc_opt_class() == a3)
  {
    LOWORD(v7) = v4 - 1;
    if ((v4 - 1) >= 3)
    {
      v6 = CFSTR("Index");
      return v6;
    }
    v7 = (__int16)v7;
    v8 = off_24C77D178;
LABEL_10:
    v6 = v8[v7];
    return v6;
  }
  if ((Class)objc_opt_class() == a3)
  {
    NSStringFromAccNavManeuverInfoUpdateInfoType(v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if ((Class)objc_opt_class() == a3)
  {
    NSStringFromAccNavRouteGuidanceUpdateInfoType(v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("<ERROR>");
  }
  return v6;
}

@end
