@implementation CBAnalytics

+ (void)send:(id)a3 withBlock:(id)a4
{
  void *context;

  context = (void *)MEMORY[0x1B5E4A8B0]();
  objc_msgSend(CFSTR("com.apple.CoreBrightness"), "stringByAppendingString:", a3);
  AnalyticsSendEventLazy();
  objc_autoreleasePoolPop(context);
}

+ (void)sendInt:(id)a3 withField:(const char *)a4 andValue:(int64_t)a5
{
  void *context;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  const char *v11;
  int64_t v12;
  int64_t v13;
  const char *v14;
  id v15;
  SEL v16;
  id v17;

  v17 = a1;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v13 = a5;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __42__CBAnalytics_sendInt_withField_andValue___block_invoke;
  v10 = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v11 = v14;
  v12 = v13;
  objc_msgSend(v17, "send:withBlock:", v15, &v6);
  objc_autoreleasePoolPop(context);
}

uint64_t __42__CBAnalytics_sendInt_withField_andValue___block_invoke(uint64_t a1)
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 32));
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
}

+ (void)sendBool:(id)a3 withField:(const char *)a4 andValue:(BOOL)a5
{
  void *context;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  const char *v11;
  BOOL v12;
  BOOL v13;
  const char *v14;
  id v15;
  SEL v16;
  id v17;

  v17 = a1;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v13 = a5;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __43__CBAnalytics_sendBool_withField_andValue___block_invoke;
  v10 = &__block_descriptor_41_e19___NSDictionary_8__0l;
  v11 = v14;
  v12 = v13;
  objc_msgSend(v17, "send:withBlock:", v15, &v6);
  objc_autoreleasePoolPop(context);
}

uint64_t __43__CBAnalytics_sendBool_withField_andValue___block_invoke(uint64_t a1)
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 32));
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(a1 + 40) & 1);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
}

+ (void)sendSparseBins:(const double *)a3 count:(int64_t)a4 withName:(id)a5
{
  void *context;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  int64_t v11;
  const double *v12;
  int64_t i;
  id v14;
  int64_t v15;
  const double *v16;
  SEL v17;
  id v18;

  v18 = a1;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14 = a5;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  for (i = 0; i < v15; ++i)
  {
    if (v16[i] != 0.0)
    {
      v6 = MEMORY[0x1E0C809B0];
      v7 = -1073741824;
      v8 = 0;
      v9 = __45__CBAnalytics_sendSparseBins_count_withName___block_invoke;
      v10 = &__block_descriptor_48_e19___NSDictionary_8__0l;
      v11 = i;
      v12 = v16;
      objc_msgSend(v18, "send:withBlock:", v14, &v6);
    }
  }
  objc_autoreleasePoolPop(context);
}

uint64_t __45__CBAnalytics_sendSparseBins_count_withName___block_invoke(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("bin");
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v3[1] = CFSTR("time");
  v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 32)) * 1000.0);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

+ (void)alsSelectionSwaps:(unint64_t)a3
{
  unint64_t v3;

  if (a3 <= 0x7FFFFFFFFFFFFFFFLL)
    v3 = a3;
  else
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(a1, "sendInt:withField:andValue:", CFSTR(".ALS.Swaps"), "swaps", v3);
}

+ (void)alsSelectionTimes:(const double *)a3 count:(unint64_t)a4
{
  void *context;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  unint64_t v10;
  const double *v11;
  unint64_t i;
  unint64_t v13;
  const double *v14;
  SEL v15;
  id v16;

  v16 = a1;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  for (i = 0; i < v13; ++i)
  {
    if (v14[i] > 0.0)
    {
      v5 = MEMORY[0x1E0C809B0];
      v6 = -1073741824;
      v7 = 0;
      v8 = __39__CBAnalytics_alsSelectionTimes_count___block_invoke;
      v9 = &__block_descriptor_48_e19___NSDictionary_8__0l;
      v10 = i;
      v11 = v14;
      objc_msgSend(v16, "send:withBlock:", CFSTR(".ALS.Times"), &v5);
    }
  }
  objc_autoreleasePoolPop(context);
}

uint64_t __39__CBAnalytics_alsSelectionTimes_count___block_invoke(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("index");
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v3[1] = CFSTR("time");
  v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 32)) * 1000.0);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

+ (void)alsSelectionDeltas:(const double *)a3 count:(unint64_t)a4
{
  uint64_t v4;
  void *context;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  const double *v17;
  void *v18;
  unint64_t v19;
  const double *v20;
  SEL v21;
  id v22;

  v22 = a1;
  v21 = a2;
  v20 = a3;
  v19 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v18 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v12 = MEMORY[0x1E0C809B0];
  v13 = -1073741824;
  v14 = 0;
  v15 = __40__CBAnalytics_alsSelectionDeltas_count___block_invoke;
  v16 = &__block_descriptor_40_e18___NSNumber_16__0Q8l;
  v17 = v20;
  v18 = dumpCArrayIntoDictionary(v19, (uint64_t)&v12);
  v6 = v4;
  v7 = -1073741824;
  v8 = 0;
  v9 = __40__CBAnalytics_alsSelectionDeltas_count___block_invoke_2;
  v10 = &unk_1E68E9B98;
  v11 = v18;
  objc_msgSend(v22, "send:withBlock:", CFSTR(".ALS.Deltas"), &v6);
  objc_autoreleasePoolPop(context);
}

uint64_t __40__CBAnalytics_alsSelectionDeltas_count___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 8 * a2) * 1000.0);
}

uint64_t __40__CBAnalytics_alsSelectionDeltas_count___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

+ (void)autoBrightnessEnabled:(BOOL)a3 byUser:(BOOL)a4
{
  void *context;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  SEL v14;
  id v15;

  v15 = a1;
  v14 = a2;
  v13 = a3;
  v12 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __44__CBAnalytics_autoBrightnessEnabled_byUser___block_invoke;
  v9 = &__block_descriptor_34_e19___NSDictionary_8__0l;
  v10 = v13;
  v11 = v12;
  objc_msgSend(v15, "send:withBlock:", CFSTR(".Auto.Enabled"), &v5);
  objc_autoreleasePoolPop(context);
}

uint64_t __44__CBAnalytics_autoBrightnessEnabled_byUser___block_invoke(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("enabled");
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(a1 + 32) & 1);
  v3[1] = CFSTR("userChange");
  v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(a1 + 33) & 1);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

+ (void)hdrSession:(BOOL)a3
{
  void *context;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  BOOL v9;
  BOOL v10;
  SEL v11;
  id v12;

  v12 = a1;
  v11 = a2;
  v10 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __26__CBAnalytics_hdrSession___block_invoke;
  v8 = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v9 = v10;
  objc_msgSend(v12, "send:withBlock:", CFSTR(".HDR.CPMSConstrained"), &v4);
  objc_autoreleasePoolPop(context);
}

uint64_t __26__CBAnalytics_hdrSession___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("constrained");
  v3[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(a1 + 32) & 1);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
}

+ (void)autoBrightnessUserChange:(BOOL)a3 lowPower:(BOOL)a4
{
  void *context;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  SEL v14;
  id v15;

  v15 = a1;
  v14 = a2;
  v13 = a3;
  v12 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __49__CBAnalytics_autoBrightnessUserChange_lowPower___block_invoke;
  v9 = &__block_descriptor_34_e19___NSDictionary_8__0l;
  v10 = v13;
  v11 = v12;
  objc_msgSend(v15, "send:withBlock:", CFSTR(".Auto.UserChange"), &v5);
  objc_autoreleasePoolPop(context);
}

uint64_t __49__CBAnalytics_autoBrightnessUserChange_lowPower___block_invoke(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("isBrighter");
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(a1 + 32) & 1);
  v3[1] = CFSTR("lowPowerModeEnabled");
  v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(a1 + 33) & 1);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

+ (void)deviceColor:(int64_t)a3
{
  objc_msgSend(a1, "sendInt:withField:andValue:", CFSTR(".DeviceColor"), "color", a3);
}

+ (void)cuveLevel:(int64_t)a3
{
  objc_msgSend(a1, "sendInt:withField:andValue:", CFSTR(".Curve.Level"), "level", a3);
}

+ (void)nightShiftEnabled:(BOOL)a3 withOption:(int)a4
{
  void *context;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  int v10;
  BOOL v11;
  int v12;
  BOOL v13;
  SEL v14;
  id v15;

  v15 = a1;
  v14 = a2;
  v13 = a3;
  v12 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __44__CBAnalytics_nightShiftEnabled_withOption___block_invoke;
  v9 = &__block_descriptor_37_e19___NSDictionary_8__0l;
  v11 = v13;
  v10 = v12;
  objc_msgSend(v15, "send:withBlock:", CFSTR(".NightShift.Enabled"), &v5);
  objc_autoreleasePoolPop(context);
}

uint64_t __44__CBAnalytics_nightShiftEnabled_withOption___block_invoke(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("enabled");
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(a1 + 36) & 1);
  v3[1] = CFSTR("option");
  v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(unsigned int *)(a1 + 32));
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

+ (void)nightShiftCCT:(int64_t)a3
{
  objc_msgSend(a1, "sendInt:withField:andValue:", CFSTR(".NightShift.CCT"), "CCT", a3);
}

+ (void)nightShiftSunSchedulePermitted:(BOOL)a3
{
  objc_msgSend(a1, "sendBool:withField:andValue:", CFSTR(".NightShift.SunSchedule"), "permitted", a3);
}

+ (void)harmonyColor:(const ColorReport *)a3
{
  _BYTE v3[992];
  const ColorReport *v4;
  SEL v5;
  id v6;

  v6 = a1;
  v5 = a2;
  v4 = a3;
  bzero(v3, 0x200uLL);
  memcpy(v3, v4, sizeof(v3));
  objc_msgSend(v6, "sendSparseBins:count:withName:", &v3[848], 10, CFSTR(".Harmony.Strength"));
  objc_msgSend(v6, "sendSparseBins:count:withName:", &v3[432], 46, CFSTR(".Harmony.Ambient"));
  objc_msgSend(v6, "sendSparseBins:count:withName:", &v3[216], 17, CFSTR(".Harmony.Display"));
}

+ (void)harmonyEnabled:(BOOL)a3 byUser:(BOOL)a4
{
  void *context;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  SEL v14;
  id v15;

  v15 = a1;
  v14 = a2;
  v13 = a3;
  v12 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __37__CBAnalytics_harmonyEnabled_byUser___block_invoke;
  v9 = &__block_descriptor_34_e19___NSDictionary_8__0l;
  v10 = v13;
  v11 = v12;
  objc_msgSend(v15, "send:withBlock:", CFSTR(".Harmony.Enabled"), &v5);
  objc_autoreleasePoolPop(context);
}

uint64_t __37__CBAnalytics_harmonyEnabled_byUser___block_invoke(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("enabled");
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(a1 + 32) & 1);
  v3[1] = CFSTR("userChange");
  v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(a1 + 33) & 1);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

+ (void)autoDimLeave:(double)a3
{
  void *context;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  double v9;
  double v10;
  SEL v11;
  id v12;

  v12 = a1;
  v11 = a2;
  v10 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __28__CBAnalytics_autoDimLeave___block_invoke;
  v8 = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v9 = v10;
  objc_msgSend(v12, "send:withBlock:", CFSTR(".AutoDim.Leave"), &v4);
  objc_autoreleasePoolPop(context);
}

uint64_t __28__CBAnalytics_autoDimLeave___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("duration");
  v3[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
}

+ (void)sbimMitigationTriggeredWithBrightness:(float)a3
{
  void *context;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, double);
  void *v8;
  float v9;
  float v10;
  SEL v11;
  id v12;

  v12 = a1;
  v11 = a2;
  v10 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __53__CBAnalytics_sbimMitigationTriggeredWithBrightness___block_invoke;
  v8 = &__block_descriptor_36_e19___NSDictionary_8__0l;
  v9 = v10;
  objc_msgSend(v12, "send:withBlock:", CFSTR(".SBIM.CapsHeadroom"), &v4);
  objc_autoreleasePoolPop(context);
}

uint64_t __53__CBAnalytics_sbimMitigationTriggeredWithBrightness___block_invoke(uint64_t a1, double a2)
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("sdrBrightness");
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
}

+ (void)cltmBudgetUpdated:(float)a3 currentSDRBrightness:(float)a4
{
  void *context;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t, double);
  void *v9;
  float v10;
  float v11;
  float v12;
  float v13;
  SEL v14;
  id v15;

  v15 = a1;
  v14 = a2;
  v13 = a3;
  v12 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __54__CBAnalytics_cltmBudgetUpdated_currentSDRBrightness___block_invoke;
  v9 = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v10 = v12;
  v11 = v13;
  objc_msgSend(v15, "send:withBlock:", CFSTR(".cltm.capsBrightness"), &v5);
  objc_autoreleasePoolPop(context);
}

uint64_t __54__CBAnalytics_cltmBudgetUpdated_currentSDRBrightness___block_invoke(uint64_t a1, double a2)
{
  double v2;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("brightnessDrop");
  *(float *)&a2 = *(float *)(a1 + 32) - *(float *)(a1 + 36);
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v5[1] = CFSTR("nitsBeforeCap");
  LODWORD(v2) = *(_DWORD *)(a1 + 32);
  v6[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
}

+ (void)illuminanceHistogram:(id)a3
{
  void *context;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, void *);
  void *v8;
  id v9;
  id v10;
  SEL v11;
  id v12;

  v12 = a1;
  v11 = a2;
  v10 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __36__CBAnalytics_illuminanceHistogram___block_invoke;
  v8 = &unk_1E68E9C88;
  v9 = v12;
  objc_msgSend(v10, "enumerateBinsUsingBlock:", &v4);
  objc_autoreleasePoolPop(context);
}

uint64_t __36__CBAnalytics_illuminanceHistogram___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result;
  double v5;
  void *v6;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = a1;
  v19 = a2;
  v18 = a3;
  v17 = a4;
  v16 = a1;
  result = objc_msgSend(a4, "doubleValue");
  if (v5 != 0.0)
  {
    v6 = *(void **)(a1 + 32);
    v8 = MEMORY[0x1E0C809B0];
    v9 = -1073741824;
    v10 = 0;
    v11 = __36__CBAnalytics_illuminanceHistogram___block_invoke_2;
    v12 = &unk_1E68E9C60;
    v15 = v19;
    v13 = v18;
    v14 = v17;
    return objc_msgSend(v6, "send:withBlock:", CFSTR(".Illuminance"), &v8);
  }
  return result;
}

uint64_t __36__CBAnalytics_illuminanceHistogram___block_invoke_2(uint64_t a1)
{
  double v1;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("index");
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v5[1] = CFSTR("edge");
  v6[1] = *(_QWORD *)(a1 + 32);
  v5[2] = CFSTR("value");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "doubleValue");
  v6[2] = objc_msgSend(v4, "numberWithDouble:", v1 * 1000.0);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
}

+ (void)rtplcTriggeredWithLength:(unint64_t)a3 maxAPCE:(float)a4 durationInSeconds:(float)a5 sdrBrightness:(float)a6 referenceModeEnabled:(BOOL)a7
{
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  unint64_t v12;
  float v13;
  float v14;
  float v15;
  BOOL v16;
  BOOL v17;
  float v18;
  float v19;
  float v20;
  unint64_t v21;
  SEL v22;
  id v23;

  v23 = a1;
  v22 = a2;
  v21 = a3;
  v20 = a4;
  v19 = a5;
  v18 = a6;
  v17 = a7;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __101__CBAnalytics_rtplcTriggeredWithLength_maxAPCE_durationInSeconds_sdrBrightness_referenceModeEnabled___block_invoke;
  v11 = &__block_descriptor_53_e19___NSDictionary_8__0l;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(a1, "send:withBlock:", CFSTR(".rtplc.Burst"), &v7);
}

uint64_t __101__CBAnalytics_rtplcTriggeredWithLength_maxAPCE_durationInSeconds_sdrBrightness_referenceModeEnabled___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("frameCount");
  v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v6[1] = CFSTR("maxApce");
  LODWORD(v1) = *(_DWORD *)(a1 + 40);
  v7[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1);
  v6[2] = CFSTR("durationInSeconds");
  LODWORD(v2) = *(_DWORD *)(a1 + 44);
  v7[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v6[3] = CFSTR("brightness");
  LODWORD(v3) = *(_DWORD *)(a1 + 48);
  v7[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v6[4] = CFSTR("referenceModeEnabled");
  v7[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(a1 + 52) & 1);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
}

+ (void)luminanceHistogram:(id)a3 withName:(id)a4
{
  void *context;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, void *);
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  SEL v14;
  id v15;

  v15 = a1;
  v14 = a2;
  v13 = a3;
  v12 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __43__CBAnalytics_luminanceHistogram_withName___block_invoke;
  v9 = &unk_1E68E9CF8;
  v10 = v15;
  v11 = v12;
  objc_msgSend(v13, "enumerateBinsUsingBlock:", &v5);
  objc_autoreleasePoolPop(context);
}

uint64_t __43__CBAnalytics_luminanceHistogram_withName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result;
  double v5;
  void *v6;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = a1;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v17 = a1;
  result = objc_msgSend(a4, "doubleValue");
  if (v5 != 0.0)
  {
    v6 = *(void **)(a1 + 32);
    v8 = MEMORY[0x1E0C809B0];
    v9 = -1073741824;
    v10 = 0;
    v11 = __43__CBAnalytics_luminanceHistogram_withName___block_invoke_2;
    v12 = &unk_1E68E9CD0;
    v13 = *(_QWORD *)(a1 + 40);
    v16 = v20;
    v14 = v19;
    v15 = v18;
    return objc_msgSend(v6, "send:withBlock:", CFSTR(".Luminance"), &v8);
  }
  return result;
}

uint64_t __43__CBAnalytics_luminanceHistogram_withName___block_invoke_2(uint64_t a1)
{
  double v1;
  void *v4;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("name");
  v6[0] = *(_QWORD *)(a1 + 32);
  v5[1] = CFSTR("index");
  v6[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v5[2] = CFSTR("edge");
  v6[2] = *(_QWORD *)(a1 + 40);
  v5[3] = CFSTR("value");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "doubleValue");
  v6[3] = objc_msgSend(v4, "numberWithDouble:", v1 * 1000.0);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
}

+ (void)displayMaxCurrent:(float)a3
{
  objc_msgSend(a1, "sendInt:withField:andValue:", CFSTR(".Display.CurrentMax"), "I", (uint64_t)(float)(a3 * 1000.0));
}

+ (void)userSliderCommit:(const CBSliderCommitInfo *)a3
{
  void *context;
  uint64_t v4;
  int v5;
  int v6;
  void *(*v7)(uint64_t);
  void *v8;
  const CBSliderCommitInfo *v9;
  const CBSliderCommitInfo *v10;
  SEL v11;
  id v12;

  v12 = a1;
  v11 = a2;
  v10 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __32__CBAnalytics_userSliderCommit___block_invoke;
  v8 = &__block_descriptor_40_e26___NSMutableDictionary_8__0l;
  v9 = v10;
  objc_msgSend(v12, "send:withBlock:", CFSTR(".UserSliderCommit_v4"), &v4);
  objc_autoreleasePoolPop(context);
}

void *__32__CBAnalytics_userSliderCommit___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v34;
  void *v36;
  _QWORD v37[46];
  _QWORD v38[47];

  v38[46] = *MEMORY[0x1E0C80C00];
  v34 = (void *)MEMORY[0x1E0C99E08];
  v37[0] = CFSTR("aabParamsUpdateOnly");
  v38[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 140) & 1);
  v37[1] = CFSTR("autoBrightnessEnabled");
  v38[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) & 1);
  v37[2] = CFSTR("apce");
  LODWORD(v1) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v38[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1);
  v37[3] = CFSTR("colorAdaptationMode");
  v38[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 200));
  v37[4] = CFSTR("colorAdaptationStrength");
  *(float *)&v2 = *(float *)(*(_QWORD *)(a1 + 32) + 196) * 100.0;
  v38[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v37[5] = CFSTR("darkAppearanceApplied");
  v38[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 204) & 1);
  v37[6] = CFSTR("delayedAPCE");
  LODWORD(v3) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
  v38[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v37[7] = CFSTR("delayedAPCEStatus");
  v38[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 48));
  v37[8] = CFSTR("e0a");
  LODWORD(v4) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 60);
  v38[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v37[9] = CFSTR("e0b");
  LODWORD(v5) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 64);
  v38[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v37[10] = CFSTR("e1");
  LODWORD(v6) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 68);
  v38[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v37[11] = CFSTR("e2");
  LODWORD(v7) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v38[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v37[12] = CFSTR("ecoModeFactor");
  *(float *)&v8 = *(float *)(*(_QWORD *)(a1 + 32) + 56) * 100.0;
  v38[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v37[13] = CFSTR("EDRHeadroom");
  LODWORD(v9) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 192);
  v38[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v37[14] = CFSTR("frontLux");
  LODWORD(v10) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20);
  v38[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v37[15] = CFSTR("l0a");
  LODWORD(v11) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 76);
  v38[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v37[16] = CFSTR("l0b");
  LODWORD(v12) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v38[16] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v37[17] = CFSTR("l1");
  LODWORD(v13) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84);
  v38[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v37[18] = CFSTR("l2");
  LODWORD(v14) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88);
  v38[18] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v37[19] = CFSTR("landscapeOrientation");
  v38[19] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 205) & 1);
  v37[20] = CFSTR("nits");
  LODWORD(v15) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v38[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v37[21] = CFSTR("slider");
  LODWORD(v16) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
  v38[21] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v37[22] = CFSTR("outdoorBrightnessBoostFactor");
  LODWORD(v17) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 188);
  v38[22] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v37[23] = CFSTR("proxMitigationTriggered");
  v38[23] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 186) & 1);
  v37[24] = CFSTR("rearLux");
  LODWORD(v18) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v38[24] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v37[25] = CFSTR("rearLuxInUse");
  v38[25] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) & 1);
  v37[26] = CFSTR("thermalMitigationLimitingBrightness");
  v38[26] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 184) & 1);
  v37[27] = CFSTR("thirdSlope");
  LODWORD(v19) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 92);
  v38[27] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v37[28] = CFSTR("timestamp");
  v38[28] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v37[29] = CFSTR("touchMitigationTriggered");
  v38[29] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 185) & 1);
  v37[30] = CFSTR("trustedLux");
  v38[30] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));
  v37[31] = CFSTR("alternativeE0a");
  LODWORD(v20) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 100);
  v38[31] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v37[32] = CFSTR("alternativeE0b");
  LODWORD(v21) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 104);
  v38[32] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v37[33] = CFSTR("alternativeE1");
  LODWORD(v22) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 108);
  v38[33] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v37[34] = CFSTR("alternativeE2");
  LODWORD(v23) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 112);
  v38[34] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v37[35] = CFSTR("alternativeL0a");
  LODWORD(v24) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 116);
  v38[35] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v37[36] = CFSTR("alternativeL0b");
  LODWORD(v25) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 120);
  v38[36] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
  v37[37] = CFSTR("alternativeL1");
  LODWORD(v26) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 124);
  v38[37] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  v37[38] = CFSTR("alternativeL2");
  LODWORD(v27) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 128);
  v38[38] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v37[39] = CFSTR("alternativeThirdSlope");
  LODWORD(v28) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 132);
  v38[39] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  v37[40] = CFSTR("aabParamsUpdateReason");
  v38[40] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 144));
  v37[41] = CFSTR("nitsDelta");
  LODWORD(v29) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 148);
  v38[41] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
  v37[42] = CFSTR("nitsDeltaAlternative");
  LODWORD(v30) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 152);
  v38[42] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
  v37[43] = CFSTR("restoreTimeTarget");
  v38[43] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
  v37[44] = CFSTR("inactiveLength");
  LODWORD(v31) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168);
  v38[44] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
  v37[45] = CFSTR("inactiveStart");
  v38[45] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  v32 = (void *)objc_msgSend(v34, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 46));
  v36 = v32;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224))
  {
    objc_msgSend(v32, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 216)), CFSTR("trialDeploymentId"));
    objc_msgSend(v36, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), CFSTR("trialExperimentId"));
    objc_msgSend(v36, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), CFSTR("trialTreatmentId"));
  }
  return v36;
}

+ (void)alsOcclusionsByProx:(int64_t)a3 andByTouch:(int64_t)a4 touchProx:(int64_t)a5 none:(int64_t)a6
{
  void *context;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(_QWORD *);
  void *v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  SEL v20;
  id v21;

  v21 = a1;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v17 = a5;
  v16 = a6;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __61__CBAnalytics_alsOcclusionsByProx_andByTouch_touchProx_none___block_invoke;
  v11 = &__block_descriptor_64_e19___NSDictionary_8__0l;
  v12 = v19;
  v13 = v18;
  v14 = v17;
  v15 = v16;
  objc_msgSend(v21, "send:withBlock:", CFSTR(".ALSOcclusion"), &v7);
  objc_autoreleasePoolPop(context);
}

uint64_t __61__CBAnalytics_alsOcclusionsByProx_andByTouch_touchProx_none___block_invoke(_QWORD *a1)
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("prox");
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[4]);
  v3[1] = CFSTR("touch");
  v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[5]);
  v3[2] = CFSTR("touchProx");
  v4[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v3[3] = CFSTR("none");
  v4[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
}

+ (void)touchOcclusionElapsedDelay:(float)a3
{
  void *context;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, double);
  void *v8;
  float v9;
  float v10;
  SEL v11;
  id v12;

  v12 = a1;
  v11 = a2;
  v10 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __42__CBAnalytics_touchOcclusionElapsedDelay___block_invoke;
  v8 = &__block_descriptor_36_e19___NSDictionary_8__0l;
  v9 = v10;
  objc_msgSend(v12, "send:withBlock:", CFSTR(".TouchOcclusionDelay"), &v4);
  objc_autoreleasePoolPop(context);
}

uint64_t __42__CBAnalytics_touchOcclusionElapsedDelay___block_invoke(uint64_t a1, double a2)
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("time");
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
}

@end
