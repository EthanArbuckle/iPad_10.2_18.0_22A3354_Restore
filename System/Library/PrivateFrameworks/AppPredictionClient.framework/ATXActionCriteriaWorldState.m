@implementation ATXActionCriteriaWorldState

- (ATXActionCriteriaWorldState)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXActionCriteriaWorldState;
  return -[ATXActionCriteriaWorldState init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
}

- (id)initFake
{
  ATXActionCriteriaWorldState *v2;
  ATXActionCriteriaWorldState *v3;
  uint64_t v4;
  NSDate *now;

  v2 = -[ATXActionCriteriaWorldState init](self, "init");
  v3 = v2;
  if (v2)
  {
    v2->_fake = 1;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", 0.0);
    now = v3->_now;
    v3->_now = (NSDate *)v4;

  }
  return v3;
}

- (NSDate)now
{
  uint64_t v3;
  id *p_now;
  NSDate *now;

  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 1) != 0)
  {
    p_now = (id *)&self->_now;
  }
  else
  {
    v3 = objc_opt_new();
    now = self->_now;
    p_now = (id *)&self->_now;
    *p_now = (id)v3;

  }
  return (NSDate *)*p_now;
}

- (void)setNow:(id)a3
{
  NSDate *v4;
  NSDate *now;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  now = self->_now;
  self->_now = v4;

  *(_WORD *)((char *)&self->_flags + 1) |= 1u;
}

- (BOOL)doNotDisturb
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  char flags;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_fake && (*(_WORD *)((char *)&self->_flags + 1) & 2) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D80E48], "currentModeSemanticType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v8 = 134217984;
        v9 = objc_msgSend(v3, "integerValue");
        _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "Criteria: focus event type: %lu", (uint8_t *)&v8, 0xCu);
      }

      if (!objc_msgSend(v3, "integerValue"))
      {
        flags = *(_BYTE *)&self->_flags | 1;
LABEL_14:
        *(_BYTE *)&self->_flags = flags;
        *(_WORD *)((char *)&self->_flags + 1) |= 2u;

        return flags & 1;
      }
    }
    else
    {
      if (v5)
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "Criteria: focus event nil", (uint8_t *)&v8, 2u);
      }

    }
    flags = *(_BYTE *)&self->_flags & 0xFE;
    goto LABEL_14;
  }
  flags = (char)self->_flags;
  return flags & 1;
}

- (void)setDoNotDisturb:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
  *(_WORD *)((char *)&self->_flags + 1) |= 2u;
}

- (BOOL)telephonyCapability
{
  int MGBool;
  char v4;

  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 4) != 0)
  {
    return (*(_BYTE *)&self->_flags >> 1) & 1;
  }
  else
  {
    MGBool = getMGBool((uint64_t)CFSTR("telephony"));
    if (MGBool)
      v4 = 2;
    else
      v4 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v4;
    *(_WORD *)((char *)&self->_flags + 1) |= 4u;
  }
  return MGBool;
}

- (void)setTelephonyCapability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
  *(_WORD *)((char *)&self->_flags + 1) |= 4u;
}

- (BOOL)airDropCapability
{
  int MGBool;
  char v4;

  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 8) != 0)
  {
    return (*(_BYTE *)&self->_flags >> 2) & 1;
  }
  else
  {
    MGBool = getMGBool((uint64_t)CFSTR("AirDropCapability"));
    if (MGBool)
      v4 = 4;
    else
      v4 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v4;
    *(_WORD *)((char *)&self->_flags + 1) |= 8u;
  }
  return MGBool;
}

- (void)setAirDropCapability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
  *(_WORD *)((char *)&self->_flags + 1) |= 8u;
}

- (BOOL)airplaneMode
{
  int MGBool;
  char v4;

  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 0x10) != 0)
  {
    return (*(_BYTE *)&self->_flags >> 3) & 1;
  }
  else
  {
    MGBool = getMGBool((uint64_t)CFSTR("AirplaneMode"));
    if (MGBool)
      v4 = 8;
    else
      v4 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v4;
    *(_WORD *)((char *)&self->_flags + 1) |= 0x10u;
  }
  return MGBool;
}

- (void)setAirplaneMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
  *(_WORD *)((char *)&self->_flags + 1) |= 0x10u;
}

- (BOOL)coreRoutineCapability
{
  int MGBool;
  char v4;

  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 0x20) != 0)
  {
    return (*(_BYTE *)&self->_flags >> 4) & 1;
  }
  else
  {
    MGBool = getMGBool((uint64_t)CFSTR("CoreRoutineCapability"));
    if (MGBool)
      v4 = 16;
    else
      v4 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v4;
    *(_WORD *)((char *)&self->_flags + 1) |= 0x20u;
  }
  return MGBool;
}

- (void)setCoreRoutineCapability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
  *(_WORD *)((char *)&self->_flags + 1) |= 0x20u;
}

- (BOOL)greenTeaDeviceCapability
{
  int MGBool;
  char v4;

  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 0x40) != 0)
  {
    return (*(_BYTE *)&self->_flags >> 5) & 1;
  }
  else
  {
    MGBool = getMGBool((uint64_t)CFSTR("green-tea"));
    if (MGBool)
      v4 = 32;
    else
      v4 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v4;
    *(_WORD *)((char *)&self->_flags + 1) |= 0x40u;
  }
  return MGBool;
}

- (void)setGreenTeaDeviceCapability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
  *(_WORD *)((char *)&self->_flags + 1) |= 0x40u;
}

- (BOOL)internalBuild
{
  int MGBool;
  char v4;

  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 0x80) != 0)
  {
    return (*(_BYTE *)&self->_flags >> 6) & 1;
  }
  else
  {
    MGBool = getMGBool((uint64_t)CFSTR("InternalBuild"));
    if (MGBool)
      v4 = 64;
    else
      v4 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v4;
    *(_WORD *)((char *)&self->_flags + 1) |= 0x80u;
  }
  return MGBool;
}

- (void)setInternalBuild:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
  *(_WORD *)((char *)&self->_flags + 1) |= 0x80u;
}

- (BOOL)lockScreen
{
  __int16 v3;
  BOOL result;

  if (self->_fake)
    return *(_BYTE *)&self->_flags < 0;
  v3 = *(_WORD *)((char *)&self->_flags + 1);
  if ((v3 & 0x100) != 0)
    return *(_BYTE *)&self->_flags < 0;
  result = 0;
  *(_BYTE *)&self->_flags &= ~0x80u;
  *(_WORD *)((char *)&self->_flags + 1) = v3 | 0x100;
  return result;
}

- (void)setLockScreen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = v3 & 0x80 | *(_BYTE *)&self->_flags & 0x7F;
  *(_WORD *)((char *)&self->_flags + 1) |= 0x100u;
}

- (id)propertyWhitelist
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("now"), CFSTR("doNotDisturb"), CFSTR("telephonyCapability"), CFSTR("airDropCapability"), CFSTR("airplaneMode"), CFSTR("coreRoutineCapability"), CFSTR("greenTeaDeviceCapability"), CFSTR("internalBuild"), CFSTR("lockScreen"), 0);
}

@end
