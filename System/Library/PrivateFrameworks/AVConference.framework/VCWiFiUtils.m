@implementation VCWiFiUtils

+ (BOOL)getInfraChannelNumber:(int *)a3 is5Ghz:(BOOL *)a4
{
  return +[VCWiFiUtils getInfraChannelNumber:is5Ghz:isPresent:](VCWiFiUtils, "getInfraChannelNumber:is5Ghz:isPresent:", a3, a4, 0);
}

+ (BOOL)getInfraChannelNumber:(int *)a3 is5Ghz:(BOOL *)a4 isPresent:(BOOL *)a5
{
  const void *v8;
  int Int32IfPresent;
  BOOL v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v12[0] = 0;
  if (!softLink_WiFiCopyCurrentNetworkInfoEx)
    return 0;
  v8 = (const void *)softLink_WiFiCopyCurrentNetworkInfoEx(0, (uint64_t)v12 + 4);
  if (HIDWORD(v12[0]))
    goto LABEL_13;
  Int32IfPresent = FigCFDictionaryGetInt32IfPresent();
  if (a5)
    *a5 = Int32IfPresent != 0;
  if (!Int32IfPresent)
  {
LABEL_13:
    v10 = 0;
    if (!v8)
      return v10;
    goto LABEL_11;
  }
  if (a3)
    *a3 = v12[0];
  if (a4)
    *a4 = 0;
  v10 = 1;
  if (v8)
LABEL_11:
    CFRelease(v8);
  return v10;
}

+ (BOOL)copyAWDLChannelSequence:(id *)a3 twoPtFourGhzChannelCount:(int *)a4 fiveGhzChannelCount:(int *)a5 dfsChannelCount:(int *)a6 inactiveSlotCount:(int *)a7
{
  return +[VCWiFiUtils copyAWDLChannelSequence:twoPtFourGhzChannelCount:fiveGhzChannelCount:dfsChannelCount:inactiveSlotCount:isPresent:](VCWiFiUtils, "copyAWDLChannelSequence:twoPtFourGhzChannelCount:fiveGhzChannelCount:dfsChannelCount:inactiveSlotCount:isPresent:", a3, a4, a5, a6, a7, 0);
}

+ (BOOL)isWiFiPresent
{
  uint64_t v2;
  const void *v3;
  BOOL v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  HIDWORD(v6[0]) = 0;
  if (!softLink_WiFiCopyCurrentNetworkInfoEx)
    return 0;
  v2 = softLink_WiFiCopyCurrentNetworkInfoEx(0, (uint64_t)v6 + 4);
  v3 = (const void *)v2;
  if (HIDWORD(v6[0]))
  {
    v4 = 0;
    if (!v2)
      return v4;
    goto LABEL_4;
  }
  v4 = FigCFDictionaryGetInt32IfPresent() != 0;
  if (v3)
LABEL_4:
    CFRelease(v3);
  return v4;
}

+ (BOOL)copyAWDLChannelSequence:(id *)a3 twoPtFourGhzChannelCount:(int *)a4 fiveGhzChannelCount:(int *)a5 dfsChannelCount:(int *)a6 inactiveSlotCount:(int *)a7 isPresent:(BOOL *)a8
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  _BOOL4 v16;
  unsigned int (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  CFTypeRef v18;
  uint64_t v19;
  id v20;
  void *v21;
  unint64_t v22;
  int v23;
  unsigned int *v24;
  unsigned int v25;
  void *v26;
  unsigned int v27;
  BOOL v28;
  int *v30;
  CFTypeRef cf;
  _DWORD v35[100];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  cf = 0;
  if (softLink_WiFiManagerCreate)
    v14 = softLink_WiFiManagerSetProperty == 0;
  else
    v14 = 1;
  if (v14 || softLink_WiFiManagerDoApple80211 == 0)
    goto LABEL_42;
  v30 = a7;
  if (!getkWiFiManagerPropertyInterfaceName())
    goto LABEL_42;
  v16 = +[VCWiFiUtils isWiFiPresent](VCWiFiUtils, "isWiFiPresent");
  if (a8)
    *a8 = v16;
  if (!v16
    || ((uint64_t (*)(uint64_t, uint64_t))softLink_WiFiManagerCreate)((uint64_t)&cf, 0)
    || (v17 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLink_WiFiManagerSetProperty,
        v18 = cf,
        v19 = getkWiFiManagerPropertyInterfaceName(),
        v17((uint64_t)v18, v19, 0, (uint64_t)CFSTR("awdl0")))
    || (memset(&v35[1], 0, 396),
        v35[0] = 1,
        ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLink_WiFiManagerDoApple80211)((uint64_t)cf, 1, 129, (uint64_t)v35, 400)))
  {
LABEL_42:
    v28 = 0;
    goto LABEL_37;
  }
  v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v21 = (void *)objc_msgSend(v20, "initWithCapacity:", BYTE1(v35[1]));
  if (BYTE1(v35[1]))
  {
    v22 = 0;
    v23 = 0;
    v24 = &v35[4];
    do
    {
      objc_msgSend(v21, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v24));
      v25 = v24[1];
      v26 = v11;
      if ((v25 & 8) != 0 || (v26 = v12, (v25 & 0x10) != 0))
        objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v24));
      if ((*((_BYTE *)v24 + 5) & 1) != 0)
        objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v24));
      v27 = *v24;
      v24 += 3;
      if (!v27)
        ++v23;
      ++v22;
    }
    while (v22 < BYTE1(v35[1]));
  }
  else
  {
    v23 = 0;
  }
  if (a4)
    *a4 = objc_msgSend(v11, "count");
  if (a5)
    *a5 = objc_msgSend(v12, "count");
  if (a6)
    *a6 = objc_msgSend(v13, "count");
  if (v30)
    *v30 = v23;
  if (a3)
  {
    *a3 = v21;
    v28 = 1;
LABEL_37:
    v21 = 0;
    goto LABEL_39;
  }
  v28 = 1;
LABEL_39:
  if (cf)
    CFRelease(cf);

  return v28;
}

@end
