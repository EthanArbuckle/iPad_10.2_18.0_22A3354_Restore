@implementation ASKMobileGestalt

+ (BOOL)isStandaloneWatch
{
  return 0;
}

void __34__ASKMobileGestalt_mainScreenSize__block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = objc_retainAutorelease((id)MGCopyAnswer());
  v2 = objc_msgSend(v8, "bytes");
  v3 = objc_msgSend(v8, "length");
  if (v3 >= 0x10)
  {
    v4 = (v3 & 0xFFFFFFFFFFFFFFF0) + v2;
    v5 = *(double *)(v4 - 16);
    v6 = *(double *)(v4 - 8);
    objc_msgSend(*(id *)(a1 + 32), "mainScreenScale");
    *(double *)&mainScreenSize_screenSize_0 = v5 / v7;
    *(double *)&mainScreenSize_screenSize_1 = v6 / v7;
  }

}

+ (double)mainScreenScale
{
  if (mainScreenScale_once != -1)
    dispatch_once(&mainScreenScale_once, &__block_literal_global_22);
  return *(double *)&mainScreenScale_scale;
}

+ (CGSize)mainScreenSize
{
  double v2;
  double v3;
  _QWORD block[5];
  CGSize result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ASKMobileGestalt_mainScreenSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mainScreenSize_once != -1)
    dispatch_once(&mainScreenSize_once, block);
  v2 = *(double *)&mainScreenSize_screenSize_0;
  v3 = *(double *)&mainScreenSize_screenSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)hasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  uint64_t i;
  const void *v11;
  const void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = (const void *)*MEMORY[0x1E0C9AE50];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isEqualToString:", &stru_1E9DB4A20, (_QWORD)v15) & 1) == 0)
        {
          v11 = (const void *)(v4 ? _MGCopyAnswerWithMode() : MGCopyAnswer());
          v12 = v11;
          if (v11)
            CFRelease(v11);
          if (v12 != v9)
          {
            v13 = 0;
            goto LABEL_17;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_17:

  return v13;
}

void __35__ASKMobileGestalt_mainScreenScale__block_invoke()
{
  void *v0;
  float v1;
  id v2;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v2 = v0;
    objc_msgSend(v0, "floatValue");
    v0 = v2;
    *(double *)&mainScreenScale_scale = v1;
  }

}

+ (BOOL)hasSystemTelephonyOfAnyKind
{
  return MGGetBoolAnswer();
}

+ (BOOL)hasVenice
{
  return MGGetBoolAnswer();
}

+ (BOOL)wapiCapability
{
  return MGGetBoolAnswer();
}

+ (NSString)deviceClass
{
  return (NSString *)MGGetStringAnswer();
}

+ (NSString)productType
{
  return (NSString *)MGGetStringAnswer();
}

+ (BOOL)hasHEVCDecoding
{
  return MGGetBoolAnswer();
}

+ (BOOL)isCharonSupported
{
  return 0;
}

+ (BOOL)isMandrakeSupported
{
  return 0;
}

+ (BOOL)isChinaSKUDevice
{
  void *v2;
  BOOL v3;

  MGGetStringAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("CH")) == 0;

  return v3;
}

+ (NSString)activePairedSystemVersion
{
  if (activePairedSystemVersion_onceToken[0] != -1)
    dispatch_once(activePairedSystemVersion_onceToken, &__block_literal_global_0);
  return (NSString *)(id)activePairedSystemVersion_systemVersion;
}

void __45__ASKMobileGestalt_activePairedSystemVersion__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getActivePairedDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D51778]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  v3 = (void *)activePairedSystemVersion_systemVersion;
  activePairedSystemVersion_systemVersion = (uint64_t)v2;

}

+ (BOOL)isAppleSiliconMac
{
  return 0;
}

+ (BOOL)hasCapabilities:(id)a3
{
  return +[ASKMobileGestalt hasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:](ASKMobileGestalt, "hasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:", a3, 0);
}

@end
