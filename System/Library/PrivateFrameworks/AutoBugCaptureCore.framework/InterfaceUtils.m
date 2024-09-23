@implementation InterfaceUtils

+ (id)stringForInterfaceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("Other");
  else
    return off_1EA3B4910[a3 - 1];
}

+ (id)stringForExtendedInterfaceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 257) > 4)
    return CFSTR("Other");
  else
    return off_1EA3B4930[a3 - 257];
}

+ (int64_t)interfaceTypeForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WiFi")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WiredEthernet")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Loopback")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)nwInterfaceTypeForExtendedNWInterfaceType:(int64_t)a3
{
  if (a3 == 257)
    return 1;
  else
    return 2 * (a3 == 258);
}

@end
