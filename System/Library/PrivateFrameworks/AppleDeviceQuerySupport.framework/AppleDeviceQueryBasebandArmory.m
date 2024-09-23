@implementation AppleDeviceQueryBasebandArmory

+ (id)query:(id)a3 withError:(id *)a4
{
  return 0;
}

+ (BOOL)hasBaseband
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_service_t v5;

  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceNameMatching("baseband");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  v5 = MatchingService;
  if (MatchingService)
    IOObjectRelease(MatchingService);
  return v5 != 0;
}

+ (int64_t)getBasebandClass
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v12;

  objc_msgSend(a1, "getProperty:inPlane:withName:withOption:", "IODeviceTree:/baseband", "IODeviceTree", CFSTR("class"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v2;
  if (!v2)
  {
    v9 = CFSTR("can not find baseband class");
    v10 = 195;
LABEL_10:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "+[AppleDeviceQueryBasebandArmory getBasebandClass]", v10, v9, v3, v4, v5, v12);
    v8 = -1;
    goto LABEL_11;
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "+[AppleDeviceQueryBasebandArmory getBasebandClass]", 198, CFSTR("baseband class: %@"), v3, v4, v5, v2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v6, "integerValue");
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "integerFromData:size:truncate:isSigned:needSwap:", v6, 4, 0, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "integerFromData:size:truncate:isSigned:needSwap:", v6, 8, 0, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_9:
      v9 = CFSTR("baseband class should be an integer");
      v10 = 220;
      goto LABEL_10;
    }
  }
  v8 = objc_msgSend(v7, "integerValue");

LABEL_11:
  return v8;
}

+ (BOOL)isBasebandReady
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v10;

  if (!objc_msgSend(a1, "hasBaseband") || objc_msgSend(a1, "getBasebandClass") < 2)
    return 0;
  v3 = *MEMORY[0x24BDC2AF8];
  v10 = 0;
  +[AppleDeviceQueryBasebandPostponementStatusArmory query:isCachable:withError:](AppleDeviceQueryBasebandPostponementStatusArmory, "query:isCachable:withError:", v3, 0, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "+[AppleDeviceQueryBasebandArmory isBasebandReady]", 234, CFSTR("postponement status %@"), v5, v6, v7, (uint64_t)v4);
  v8 = v4 && !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC2B00]);

  return v8;
}

+ (BOOL)waitUntilBasebandReady:(int)a3 retryInterval:(int)a4
{
  int v6;
  double v7;
  int v8;

  v6 = objc_msgSend(a1, "hasBaseband");
  if (v6)
  {
    LOBYTE(v6) = +[AppleDeviceQueryBasebandArmory isBasebandReady](AppleDeviceQueryBasebandArmory, "isBasebandReady");
    if ((v6 & 1) == 0 && a3 >= 1)
    {
      v7 = (double)a4;
      v8 = 1;
      do
      {
        objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", v7);
        LOBYTE(v6) = +[AppleDeviceQueryBasebandArmory isBasebandReady](AppleDeviceQueryBasebandArmory, "isBasebandReady");
        if ((v6 & 1) != 0)
          break;
      }
      while (v8++ < a3);
    }
  }
  return v6;
}

+ (id)getProperty:(char)a3[512] inPlane:(char)a4[128] withName:(__CFString *)a5 withOption:(unsigned int)a6
{
  io_registry_entry_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  io_object_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v10 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], a3);
  if (v10)
  {
    v14 = v10;
    v15 = (void *)IORegistryEntrySearchCFProperty(v10, a4, a5, (CFAllocatorRef)*MEMORY[0x24BDBD240], a6);
    IOObjectRelease(v14);
    if (!v15)
      ZhuGeLog(256, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "+[AppleDeviceQueryBasebandArmory getProperty:inPlane:withName:withOption:]", 276, CFSTR("can not find property %@ under %s"), v16, v17, v18, (uint64_t)a5);
  }
  else
  {
    ZhuGeLog(256, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "+[AppleDeviceQueryBasebandArmory getProperty:inPlane:withName:withOption:]", 269, CFSTR("can not find entry at %s"), v11, v12, v13, (uint64_t)a3);
    v15 = 0;
  }
  return v15;
}

@end
