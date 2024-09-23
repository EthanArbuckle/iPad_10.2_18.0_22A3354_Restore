@implementation CBBlueLightClient

+ (BOOL)supportsBlueLightReduction
{
  return CBU_IsNightShiftSupported() & 1;
}

- (CBBlueLightClient)initWithClientObj:(id)a3
{
  BrightnessSystemClient *v3;
  char v4;
  id v6;
  objc_super v7;
  BrightnessSystemClient *v8;
  SEL v9;
  CBBlueLightClient *v10;

  v10 = self;
  v9 = a2;
  v8 = (BrightnessSystemClient *)a3;
  if (!a3)
    return 0;
  v7.receiver = v10;
  v7.super_class = (Class)CBBlueLightClient;
  v10 = -[CBBlueLightClient init](&v7, sel_init);
  if (v10)
  {
    v10->bsc = v8;
    v3 = v10->bsc;
    v6 = -[BrightnessSystemClient copyPropertyForKey:](v10->bsc, "copyPropertyForKey:", CFSTR("SupportedColorFX"));
    if (v6)
    {
      v4 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("SupportsNightMode")), "BOOLValue");
      v10->_supported = v4 & 1;

    }
    v10->ownsClient = 0;
  }
  return v10;
}

- (CBBlueLightClient)init
{
  BrightnessSystemClient *v2;
  char v3;
  id v5;
  objc_super v6;
  SEL v7;
  CBBlueLightClient *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)CBBlueLightClient;
  v8 = -[CBBlueLightClient init](&v6, sel_init);
  if (!v8)
    return v8;
  v2 = objc_alloc_init(BrightnessSystemClient);
  v8->bsc = v2;
  if (v8->bsc)
  {
    v5 = -[BrightnessSystemClient copyPropertyForKey:](v8->bsc, "copyPropertyForKey:", CFSTR("SupportedColorFX"));
    if (v5)
    {
      v3 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", CFSTR("SupportsNightMode")), "BOOLValue");
      v8->_supported = v3 & 1;

    }
    v8->ownsClient = 1;
    return v8;
  }
  return 0;
}

- (void)dealloc
{
  objc_super v3;
  SEL v4;
  CBBlueLightClient *v5;

  v5 = self;
  v4 = a2;
  objc_sync_enter(self);
  if (v5->bsc)
  {
    if (v5->ownsClient)
      -[BrightnessSystemClient registerNotificationBlock:forProperties:](v5->bsc, "registerNotificationBlock:forProperties:", 0);

  }
  objc_sync_exit(self);
  v3.receiver = v5;
  v3.super_class = (Class)CBBlueLightClient;
  -[CBBlueLightClient dealloc](&v3, sel_dealloc);
}

- (BOOL)setActive:(BOOL)a3
{
  void *v5;
  char v6;
  BOOL v7;

  v7 = a3;
  v6 = 0;
  objc_sync_enter(self);
  if (self->bsc)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v7);
    if (v5)
    {
      v6 = -[BrightnessSystemClient setProperty:forKey:](self->bsc, "setProperty:forKey:", v5, CFSTR("AutoBlueReductionEnabled"));

    }
  }
  objc_sync_exit(self);
  return v6 & 1;
}

- (BOOL)setEnabled:(BOOL)a3 withOption:(int)a4
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v11;

  v11 = a3;
  v9 = 0;
  objc_sync_enter(self);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v11);
  if (v8)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a4);
    if (v7)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("BlueReductionEnabledValue"), v7, CFSTR("BlueReductionEnabledOption"), 0);
      if (v6)
      {
        v9 = -[BrightnessSystemClient setProperty:forKey:](self->bsc, "setProperty:forKey:", v6, CFSTR("BlueReductionEnabled"));

      }
    }

  }
  objc_sync_exit(self);
  return v9 & 1;
}

- (BOOL)setEnabled:(BOOL)a3
{
  return -[CBBlueLightClient setEnabled:withOption:](self, "setEnabled:withOption:", a3, 0);
}

- (BOOL)setMode:(int)a3
{
  _BYTE __b[44];
  id v6;
  char v7;
  unsigned int v8;
  SEL v9;
  CBBlueLightClient *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = 0;
  objc_sync_enter(self);
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v8);
  if (v6)
  {
    v7 = -[BrightnessSystemClient setProperty:forKey:](v10->bsc, "setProperty:forKey:", v6, CFSTR("BlueReductionMode"));

  }
  if ((v7 & 1) != 0 && v8 == 1)
  {
    memset(__b, 0, 0x28uLL);
    v7 = -[CBBlueLightClient getBlueLightStatus:](v10, "getBlueLightStatus:", __b);
    if (v7)
      v7 = __b[2] & 1;
  }
  objc_sync_exit(self);
  return v7 & 1;
}

- (BOOL)setSchedule:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v9 = 0;
  if (a3)
  {
    objc_sync_enter(self);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    if (v8)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var1.var0);
      if (v7)
      {
        objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("DayStartHour"));

      }
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var1.var1);
      if (v6)
      {
        objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("DayStartMinute"));

      }
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var0.var0);
      if (v5)
      {
        objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("NightStartHour"));

      }
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3->var0.var1);
      if (v4)
      {
        objc_msgSend(v8, "setObject:forKey:", v4, CFSTR("NightStartMinute"));

      }
      if (objc_msgSend(v8, "count") == 4)
        v9 = -[BrightnessSystemClient setProperty:forKey:](self->bsc, "setProperty:forKey:", v8, CFSTR("BlueLightReductionSchedule"));

    }
    objc_sync_exit(self);
  }
  return v9;
}

- (BOOL)parseStatusDictionary:(id)a3 intoStruct:(id *)a4
{
  int v5;
  BOOL v6;
  void *v7;
  char v8;

  v8 = 0;
  a4->var0 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AutoBlueReductionEnabled")), "intValue") != 0;
  a4->var6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("BlueReductionAvailable")), "intValue") != 0;
  v6 = 0;
  if (a4->var6)
    v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("BlueReductionEnabled")), "intValue") != 0;
  a4->var1 = v6;
  if (a4->var6)
    v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("BlueReductionMode")), "intValue");
  else
    v5 = 0;
  a4->var3 = v5;
  a4->var2 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("BlueReductionSunScheduleAllowed")), "intValue") != 0;
  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionSchedule"));
  if (v7)
  {
    a4->var4.var0.var0 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("NightStartHour")), "intValue");
    a4->var4.var0.var1 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("NightStartMinute")), "intValue");
    a4->var4.var1.var0 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("DayStartHour")), "intValue");
    a4->var4.var1.var1 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("DayStartMinute")), "intValue");
    v8 = 1;
  }
  a4->var5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("BlueLightReductionDisableFlags")), "unsignedLongValue");
  return v8 & 1;
}

- (BOOL)getBlueLightStatus:(id *)a3
{
  _BYTE __b[44];
  id v6;
  char v7;
  $370FFBF569F04E7BFA4699F08AF8A162 *v8;
  SEL v9;
  CBBlueLightClient *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = 0;
  objc_sync_enter(self);
  if (v8)
  {
    v6 = 0;
    v6 = -[BrightnessSystemClient copyPropertyForKey:](v10->bsc, "copyPropertyForKey:", CFSTR("CBBlueReductionStatus"));
    if (v6)
    {
      memset(__b, 0, 0x28uLL);
      v7 = -[CBBlueLightClient parseStatusDictionary:intoStruct:](v10, "parseStatusDictionary:intoStruct:", v6, __b);

      if ((v7 & 1) != 0)
        memcpy(v8, __b, sizeof($370FFBF569F04E7BFA4699F08AF8A162));
    }
  }
  objc_sync_exit(self);
  return v7 & 1;
}

- (void)disableNotifications
{
  -[BrightnessSystemClient registerNotificationBlock:forProperties:](self->bsc, "registerNotificationBlock:forProperties:", 0, a2);
  self->notificationActive = 0;
}

- (void)enableNotifications
{
  BrightnessSystemClient *bsc;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t, void *, uint64_t);
  void *v7;
  CBBlueLightClient *v8;
  SEL v9;
  CBBlueLightClient *v10;

  v10 = self;
  v9 = a2;
  bsc = self->bsc;
  v3 = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __40__CBBlueLightClient_enableNotifications__block_invoke;
  v7 = &unk_1E68EA2E0;
  v8 = v10;
  -[BrightnessSystemClient registerNotificationBlock:forProperties:](bsc, "registerNotificationBlock:forProperties:", &v3, &unk_1E6917468);
  v10->notificationActive = 1;
}

void __40__CBBlueLightClient_enableNotifications__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  _BYTE v11[40];
  _BYTE __b[40];
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v16 = a1;
  v15 = a2;
  v14 = a3;
  v13 = a1;
  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("CBBlueReductionStatus")) & 1) != 0
    && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 1) != 0
    && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      memset(__b, 0, sizeof(__b));
      objc_msgSend(*(id *)(a1 + 32), "parseStatusDictionary:intoStruct:", v14, __b);
      queue = dispatch_get_global_queue(25, 0);
      v5 = MEMORY[0x1E0C809B0];
      v6 = -1073741824;
      v7 = 0;
      v8 = __40__CBBlueLightClient_enableNotifications__block_invoke_2;
      v9 = &unk_1E68EA2B8;
      v10 = *(_QWORD *)(a1 + 32);
      memcpy(v11, __b, sizeof(v11));
      dispatch_async(queue, &v5);
    }
  }
}

uint64_t __40__CBBlueLightClient_enableNotifications__block_invoke_2(uint64_t a1)
{
  id obj;
  _BYTE __b[40];
  uint64_t v5;
  uint64_t v6;

  v6 = a1;
  v5 = a1;
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  memset(__b, 0, sizeof(__b));
  memcpy(__b, (const void *)(a1 + 40), sizeof(__b));
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
  return objc_sync_exit(obj);
}

- (void)suspendNotifications:(BOOL)a3 force:(BOOL)a4
{
  BOOL v5;
  BOOL v6;

  v6 = a3;
  v5 = a4;
  objc_sync_enter(self);
  if (self->notificationActive)
  {
    if (v6)
    {
      -[CBBlueLightClient disableNotifications](self, "disableNotifications");
    }
    else if (self->clientBlock && v5)
    {
      -[CBBlueLightClient enableNotifications](self, "enableNotifications");
    }
  }
  else if (!v6 && self->clientBlock)
  {
    -[CBBlueLightClient enableNotifications](self, "enableNotifications");
  }
  objc_sync_exit(self);
}

- (void)setStatusNotificationBlock:(id)a3
{
  objc_sync_enter(self);
  if (self->clientBlock)
  {

    self->clientBlock = 0;
  }
  if (a3)
  {
    self->clientBlock = (id)objc_msgSend(a3, "copy");
    -[CBBlueLightClient suspendNotifications:force:](self, "suspendNotifications:force:", 0, 1);
  }
  else
  {
    -[CBBlueLightClient suspendNotifications:force:](self, "suspendNotifications:force:", 1, 1);
  }
  objc_sync_exit(self);
}

- (void)suspendNotifications:(BOOL)a3
{
  -[CBBlueLightClient suspendNotifications:force:](self, "suspendNotifications:force:", a3, 0);
}

- (BOOL)getDefaultCCTRange:(id *)a3
{
  float v3;
  float v4;
  float v5;
  id v7;
  BOOL v8;

  v8 = 0;
  if (self->rangeSet)
  {
    v8 = 1;
  }
  else
  {
    v7 = -[BrightnessSystemClient copyPropertyForKey:](self->bsc, "copyPropertyForKey:", CFSTR("BlueLightReductionCCTRange"));
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "count") == 3)
      {
        objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 0), "floatValue");
        self->defaultCctRange.minCCT = v3;
        objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 1), "floatValue");
        self->defaultCctRange.midCCT = v4;
        objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 2), "floatValue");
        self->defaultCctRange.maxCCT = v5;
        self->rangeSet = 1;
        v8 = 1;
      }

    }
  }
  if (v8)
  {
    if (a3)
    {
      *(_QWORD *)&a3->var0 = *(_QWORD *)&self->defaultCctRange.minCCT;
      a3->var2 = self->defaultCctRange.midCCT;
    }
    if (!self->rangeOverridden)
    {
      *(_QWORD *)&self->cctRange.minCCT = *(_QWORD *)&self->defaultCctRange.minCCT;
      self->cctRange.midCCT = self->defaultCctRange.midCCT;
    }
  }
  return v8;
}

- (BOOL)getCCT:(float *)a3
{
  int v3;
  void *v5;
  id v6;
  BOOL v7;

  v7 = 0;
  v6 = -[BrightnessSystemClient copyPropertyForKey:](self->bsc, "copyPropertyForKey:", CFSTR("BlueLightReductionCCTTargetKey"));
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("BlueLightReductionCCTTargetValue"));
      if (v5)
      {
        objc_msgSend(v5, "floatValue");
        if (a3)
          *(_DWORD *)a3 = v3;
        v7 = 1;
      }
    }

  }
  return v7;
}

- (BOOL)setCCT:(float)a3 commit:(BOOL)a4
{
  double v4;

  LODWORD(v4) = -1.0;
  return -[CBBlueLightClient setCCT:withPeriod:commit:](self, "setCCT:withPeriod:commit:", a4, *(double *)&a3, v4);
}

- (BOOL)setCCT:(float)a3 withPeriod:(float)a4 commit:(BOOL)a5
{
  id v5;
  double v6;
  id v7;
  double v8;
  id v9;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  int v16;
  char v17;
  BOOL v18;
  float v19;
  float v20;
  SEL v21;
  CBBlueLightClient *v22;

  v22 = self;
  v21 = a2;
  v20 = a3;
  v19 = a4;
  v18 = a5;
  v17 = 0;
  v15 = 0;
  v16 = 0;
  v17 = -[CBBlueLightClient getDefaultCCTRange:](self, "getDefaultCCTRange:", &v15);
  if ((v17 & 1) == 0)
    return v17 & 1;
  v20 = fmaxf(v20, *(float *)&v15);
  v20 = fminf(v20, *((float *)&v15 + 1));
  if (v19 < 0.0)
    v19 = -1.0;
  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v6 = v20;
  v14 = (id)objc_msgSend(v5, "initWithFloat:", v6);
  v7 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v8 = v19;
  v13 = (id)objc_msgSend(v7, "initWithFloat:", v8);
  v9 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v12 = (id)objc_msgSend(v9, "initWithInt:", v18);
  if (v14)
  {
    if (v13)
    {
      if (v12)
      {
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
        if (v11)
        {
          objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("BlueLightReductionCCTTargetValue"));
          objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("BlueLightReductionCCTTargetPeriod"));
          objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("BlueLightReductionCCTTargetCommit"));
          v17 = -[BrightnessSystemClient setProperty:forKey:](v22->bsc, "setProperty:forKey:", v11, CFSTR("BlueLightReductionCCTTargetKey"));

        }
      }
    }
  }
  if (v14)

  if (v13)
  if (v12)

  return v17 & 1;
}

- (BOOL)getCCTRange:(id *)a3
{
  if (!self->rangeOverridden)
    return -[CBBlueLightClient getDefaultCCTRange:](self, "getDefaultCCTRange:", a3);
  if (a3)
    *($5D5450AFC9C28DABAF6756483996F5B2 *)a3 = self->cctRange;
  return 1;
}

- (BOOL)setCCTRange:(id *)a3
{
  CBBlueLightClient *v3;
  $E2C29196C7A5C696474C6955C5A9CE06 *v4;
  BOOL v6;
  uint64_t v7;
  int v8;
  $E2C29196C7A5C696474C6955C5A9CE06 *v9;
  SEL v10;
  CBBlueLightClient *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v7 = 0;
  v8 = 0;
  v6 = 0;
  if (!a3)
    return v6;
  v6 = -[CBBlueLightClient getDefaultCCTRange:](v11, "getDefaultCCTRange:", &v7);
  if (v6)
  {
    if (v9->var1 > *((float *)&v7 + 1)
      || v9->var0 < *(float *)&v7
      || v9->var1 <= v9->var0
      || v9->var2 <= v9->var0
      || v9->var2 >= v9->var1)
    {
      return 0;
    }
    v3 = v11;
    v4 = v9;
    *(_QWORD *)&v11->cctRange.minCCT = *(_QWORD *)&v9->var0;
    v3->cctRange.midCCT = v4->var2;
    v11->rangeOverridden = 1;
    return v6;
  }
  return 0;
}

- (BOOL)getStrength:(float *)a3
{
  float v3;
  float v4;
  float v6;
  uint64_t v7;
  float v8;
  float v9;
  char v10;
  float *v11;
  SEL v12;
  CBBlueLightClient *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = 0;
  v9 = 0.0;
  v10 = -[CBBlueLightClient getCCT:](self, "getCCT:", &v9);
  if (!v10)
    return 0;
  v7 = 0;
  v8 = 0.0;
  v10 = -[CBBlueLightClient getCCTRange:](v13, "getCCTRange:", &v7);
  if (!v10)
    return 0;
  if (v9 < v8)
  {
    v4 = 0.5 * (float)(v8 - v9) / (float)(v8 - *(float *)&v7) + 0.5;
    v6 = fminf(v4, 1.0);
  }
  else
  {
    v3 = 0.5 * (float)(*((float *)&v7 + 1) - v9) / (float)(*((float *)&v7 + 1) - v8);
    v6 = fmaxf(v3, 0.0);
  }
  if (v11)
    *v11 = v6;
  return v10 & 1;
}

- (BOOL)setStrength:(float)a3 commit:(BOOL)a4
{
  double v4;

  LODWORD(v4) = -1.0;
  return -[CBBlueLightClient setStrength:withPeriod:commit:](self, "setStrength:withPeriod:commit:", a4, *(double *)&a3, v4);
}

- (BOOL)setStrength:(float)a3 withPeriod:(float)a4 commit:(BOOL)a5
{
  double v5;
  double v6;
  float v7;
  uint64_t v9;
  float v10;
  char v11;
  BOOL v12;
  float v13;
  float v14;
  SEL v15;
  CBBlueLightClient *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  v12 = a5;
  v11 = 0;
  v9 = 0;
  v10 = 0.0;
  v11 = -[CBBlueLightClient getCCTRange:](self, "getCCTRange:", &v9);
  if ((v11 & 1) == 0)
    return v11 & 1;
  v14 = fmaxf(v14, 0.0);
  v14 = fminf(v14, 1.0);
  if (v14 > 0.5)
  {
    v7 = v14 - 0.5;
    v14 = v7;
    v5 = (float)(v10 - *(float *)&v9);
    v6 = v10 - 2.0 * v7 * v5;
  }
  else
  {
    v5 = (float)(*((float *)&v9 + 1) - v10);
    v6 = *((float *)&v9 + 1) - 2.0 * v14 * v5;
  }
  *(float *)&v6 = v6;
  *(float *)&v5 = v13;
  return -[CBBlueLightClient setCCT:withPeriod:commit:](v16, "setCCT:withPeriod:commit:", v12, v6, v5);
}

- (BOOL)getWarningCCT:(float *)a3
{
  int v3;
  id v5;
  BOOL v6;

  v6 = 0;
  v5 = -[BrightnessSystemClient copyPropertyForKey:](self->bsc, "copyPropertyForKey:", CFSTR("BlueLightReductionCCTWarningKey"));
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "floatValue");
      if (a3)
        *(_DWORD *)a3 = v3;
      v6 = 1;
    }

  }
  return v6;
}

- (BOOL)getWarningStrength:(float *)a3
{
  float v3;
  float v4;
  float v6;
  uint64_t v7;
  float v8;
  float v9;
  char v10;
  float *v11;
  SEL v12;
  CBBlueLightClient *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = 0;
  v9 = 0.0;
  if (a3)
    *v11 = 0.5;
  v10 = -[CBBlueLightClient getWarningCCT:](v13, "getWarningCCT:", &v9);
  if (!v10)
    return 0;
  v7 = 0;
  v8 = 0.0;
  v10 = -[CBBlueLightClient getCCTRange:](v13, "getCCTRange:", &v7);
  if (!v10)
    return 0;
  if (v9 < v8)
  {
    v4 = 0.5 * (float)(v8 - v9) / (float)(v8 - *(float *)&v7) + 0.5;
    v6 = fminf(v4, 1.0);
  }
  else
  {
    v3 = 0.5 * (float)(*((float *)&v7 + 1) - v9) / (float)(*((float *)&v7 + 1) - v8);
    v6 = fmaxf(v3, 0.0);
  }
  if (v11)
    *v11 = v6;
  return v10 & 1;
}

- (BOOL)supported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

@end
