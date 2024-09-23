@implementation CHHapticEvent

- (CHHapticEvent)initWithEventType:(CHHapticEventType)type parameters:(NSArray *)eventParams relativeTime:(NSTimeInterval)time
{
  return -[CHHapticEvent initWithEventType:parameters:relativeTime:duration:](self, "initWithEventType:parameters:relativeTime:duration:", type, eventParams, time, 0.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventParams, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (CHHapticEventType)type
{
  return (CHHapticEventType)objc_getProperty(self, a2, 8, 1);
}

- (NSTimeInterval)relativeTime
{
  return self->_time;
}

- (double)fullDuration
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  float v13;
  float v14;
  float v15;
  BOOL v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_type == CHHapticEventTypeHapticTransient)
  {
    v15 = 0.0;
    return self->_duration + v15;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self->_eventParams;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v4)
  {

    v6 = 0.0;
LABEL_23:
    v15 = v6;
    return self->_duration + v15;
  }
  v5 = *(_QWORD *)v19;
  v6 = 0.0;
  v17 = 1;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v19 != v5)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_msgSend(v8, "parameterID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CHHapticEventParameterIDReleaseTime);

      if (v10)
      {
        if (-[NSString isEqualToString:](self->_type, "isEqualToString:", CHHapticEventTypeHapticContinuous)
          || -[NSString isEqualToString:](self->_type, "isEqualToString:", CHHapticEventTypeAudioContinuous)
          || -[NSString isEqualToString:](self->_type, "isEqualToString:", CHHapticEventTypeAudioResourceIndex)
          || -[NSString isEqualToString:](self->_type, "isEqualToString:", CHHapticEventTypeAudioCustom))
        {
          objc_msgSend(v8, "value");
          v6 = exp2(v14 * 8.0) * 0.02;
        }
        v6 = v6 + -0.04;
      }
      else
      {
        objc_msgSend(v8, "parameterID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CHHapticEventParameterIDSustained);

        if (v12)
        {
          objc_msgSend(v8, "value");
          v17 = v13 != 0.0;
        }
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v4);

  v15 = 0.0;
  if (v17)
    goto LABEL_23;
  return self->_duration + v15;
}

- (NSArray)eventParameters
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (CHHapticEvent)initWithEventType:(CHHapticEventType)type parameters:(NSArray *)eventParams relativeTime:(NSTimeInterval)time duration:(NSTimeInterval)duration
{
  NSString *v11;
  NSArray *v12;
  CHHapticEvent *v13;
  CHHapticEvent *v14;
  uint64_t v15;
  NSArray *v16;
  objc_super v18;

  v11 = type;
  v12 = eventParams;
  v18.receiver = self;
  v18.super_class = (Class)CHHapticEvent;
  v13 = -[CHHapticEvent init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_type, type);
    v14->_audioResID = -1;
    v15 = -[NSArray copy](v12, "copy");
    v16 = v14->_eventParams;
    v14->_eventParams = (NSArray *)v15;

    v14->_time = time;
    v14->_duration = duration;
  }

  return v14;
}

+ (BOOL)parameterValuesFromLegacyEventType:(unint64_t)a3 sharpness:(float *)a4 fullness:(float *)a5 error:(id *)a6
{
  double v6;
  float v8;
  BOOL result;
  id v10;

  LODWORD(v6) = -1.0;
  if ((uint64_t)a3 > 20308)
  {
    if ((uint64_t)a3 <= 26452)
    {
      if ((uint64_t)a3 <= 23380)
      {
        if (a3 != 20309)
        {
          if (a3 == 20310)
          {
            LODWORD(v6) = 0;
          }
          else
          {
            if (a3 != 20311)
              goto LABEL_56;
            LODWORD(v6) = 1.0;
          }
        }
        v8 = 0.14286;
        goto LABEL_55;
      }
      if (a3 != 23381)
      {
        if (a3 == 23382)
        {
          LODWORD(v6) = 0;
        }
        else
        {
          if (a3 != 23383)
            goto LABEL_56;
          LODWORD(v6) = 1.0;
        }
      }
      v8 = 0.42857;
      goto LABEL_55;
    }
    if ((uint64_t)a3 <= 29524)
    {
      if (a3 != 26453)
      {
        if (a3 == 26454)
        {
          LODWORD(v6) = 0;
        }
        else
        {
          if (a3 != 26455)
            goto LABEL_56;
          LODWORD(v6) = 1.0;
        }
      }
      v8 = 0.71429;
      goto LABEL_55;
    }
    if (a3 == 29525 || a3 == 29526)
    {
      LODWORD(v6) = 0;
      v8 = 1.0;
    }
    else
    {
      if (a3 != 29527)
        goto LABEL_56;
      v8 = 1.0;
      LODWORD(v6) = 1.0;
    }
LABEL_55:
    *a4 = v8;
    *a5 = *(float *)&v6;
    return 1;
  }
  if ((uint64_t)a3 > 14164)
  {
    if ((uint64_t)a3 <= 17236)
    {
      if (a3 != 14165)
      {
        if (a3 == 14166)
        {
          LODWORD(v6) = 0;
        }
        else
        {
          if (a3 != 14167)
            goto LABEL_56;
          LODWORD(v6) = 1.0;
        }
      }
      v8 = -0.42857;
      goto LABEL_55;
    }
    if (a3 != 17237)
    {
      if (a3 == 17238)
      {
        LODWORD(v6) = 0;
      }
      else
      {
        if (a3 != 17239)
          goto LABEL_56;
        LODWORD(v6) = 1.0;
      }
    }
    v8 = -0.14286;
    goto LABEL_55;
  }
  if ((uint64_t)a3 > 11092)
  {
    if (a3 != 11093)
    {
      if (a3 == 11094)
      {
        LODWORD(v6) = 0;
      }
      else
      {
        if (a3 != 11095)
          goto LABEL_56;
        LODWORD(v6) = 1.0;
      }
    }
    v8 = -0.71429;
    goto LABEL_55;
  }
  switch(a3)
  {
    case 0x1F55uLL:
LABEL_42:
      v8 = -1.0;
      goto LABEL_55;
    case 0x1F56uLL:
      LODWORD(v6) = 0;
      goto LABEL_42;
    case 0x1F57uLL:
      LODWORD(v6) = 1.0;
      goto LABEL_42;
  }
LABEL_56:
  if (!a6)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4820, 0, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a6 = v10;
  return result;
}

- (CHHapticEvent)init
{

  return 0;
}

- (CHHapticEvent)initWithAudioResourceID:(CHHapticAudioResourceID)resID parameters:(NSArray *)eventParams relativeTime:(NSTimeInterval)time
{
  NSArray *v8;
  CHHapticEvent *v9;
  CHHapticEvent *v10;
  uint64_t v11;
  NSArray *v12;
  objc_super v14;

  v8 = eventParams;
  v14.receiver = self;
  v14.super_class = (Class)CHHapticEvent;
  v9 = -[CHHapticEvent init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, CHHapticEventTypeAudioCustom);
    v10->_audioResID = resID;
    v11 = -[NSArray copy](v8, "copy");
    v12 = v10->_eventParams;
    v10->_eventParams = (NSArray *)v11;

    v10->_time = time;
    v10->_duration = 0.0;
  }

  return v10;
}

- (CHHapticEvent)initWithAudioResourceID:(CHHapticAudioResourceID)resID parameters:(NSArray *)eventParams relativeTime:(NSTimeInterval)time duration:(NSTimeInterval)duration
{
  NSArray *v10;
  CHHapticEvent *v11;
  CHHapticEvent *v12;
  uint64_t v13;
  NSArray *v14;
  objc_super v16;

  v10 = eventParams;
  v16.receiver = self;
  v16.super_class = (Class)CHHapticEvent;
  v11 = -[CHHapticEvent init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_type, CHHapticEventTypeAudioCustom);
    v12->_audioResID = resID;
    v13 = -[NSArray copy](v10, "copy");
    v14 = v12->_eventParams;
    v12->_eventParams = (NSArray *)v13;

    v12->_time = time;
    v12->_duration = duration;
  }

  return v12;
}

- (id)getType
{
  return self->_type;
}

- (NSArray)events
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self);
}

- (NSArray)parameters
{
  return 0;
}

- (NSArray)parameterCurves
{
  return 0;
}

- (NSString)patternID
{
  return 0;
}

- (NSString)locality
{
  return 0;
}

- (NSString)priority
{
  return (NSString *)CFSTR("LowPriority");
}

- (NSString)hapticPowerUsage
{
  return (NSString *)CFSTR("LowPower");
}

- (NSString)audioPowerUsage
{
  return (NSString *)CFSTR("LowPower");
}

- (NSString)usageCategory
{
  return 0;
}

- (id)resolveExternalResources:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99D20];
  -[CHHapticEvent events](self, "events", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setRelativeTime:(NSTimeInterval)relativeTime
{
  self->_time = relativeTime;
}

- (void)setDuration:(NSTimeInterval)duration
{
  self->_duration = duration;
}

- (CHHapticEvent)initWithAudioResourceIndex:(unint64_t)a3 parameters:(id)a4 time:(double)a5 duration:(double)a6
{
  id v11;
  CHHapticEvent *v12;
  CHHapticEvent *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CHHapticEvent;
  v12 = -[CHHapticEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_type, CHHapticEventTypeAudioResourceIndex);
    v13->_audioResID = a3;
    objc_storeStrong((id *)&v13->_eventParams, a4);
    v13->_time = a5;
    v13->_duration = a6;
  }

  return v13;
}

- (unint64_t)audioResID
{
  return self->_audioResID;
}

@end
