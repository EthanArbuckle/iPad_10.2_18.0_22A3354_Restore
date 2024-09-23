@implementation CBAnalyticsNightShiftTracker

- (CBAnalyticsNightShiftTracker)init
{
  objc_super v3;
  SEL v4;
  CBAnalyticsNightShiftTracker *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CBAnalyticsNightShiftTracker;
  v5 = -[CBAnalyticsNightShiftTracker init](&v3, sel_init);
  if (v5)
    v5->_modeChangeTimestamp = NAN;
  return v5;
}

- (void)start:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  self->_modeChangeTimestamp = CFAbsoluteTimeGetCurrent();
  self->_isEnabled = v3;
}

- (BOOL)isStarted
{
  return 1;
}

- (void)stop:(int)a3 isEnabled:(BOOL)a4
{
  -[CBAnalyticsNightShiftTracker update:isEnabled:](self, "update:isEnabled:", a3, a4);
  self->_modeChangeTimestamp = NAN;
}

- (void)update:(int)a3 isEnabled:(BOOL)a4
{
  void *context;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  CBAnalyticsNightShiftTracker *v10;
  double v11;
  int v12;
  double v13;
  int v14;
  double Current;
  BOOL v16;
  int v17;
  SEL v18;
  CBAnalyticsNightShiftTracker *v19;
  double modeChangeTimestamp;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  Current = CFAbsoluteTimeGetCurrent();
  modeChangeTimestamp = v19->_modeChangeTimestamp;
  v13 = 0.0;
  v13 = Current - v19->_modeChangeTimestamp;
  v19->_modeChangeTimestamp = Current;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __49__CBAnalyticsNightShiftTracker_update_isEnabled___block_invoke;
  v9 = &unk_1E68E9D60;
  v12 = v17;
  v11 = v13;
  v10 = v19;
  +[CBAnalytics send:withBlock:](CBAnalytics, "send:withBlock:", CFSTR(".NightShift.Usage"), &v5);
  v19->_isEnabled = v16;
  v14 = 0;
  objc_autoreleasePoolPop(context);
}

uint64_t __49__CBAnalyticsNightShiftTracker_update_isEnabled___block_invoke(uint64_t a1)
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("mode");
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(unsigned int *)(a1 + 48));
  v3[1] = CFSTR("time");
  v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40) * 1000.0);
  v3[2] = CFSTR("enabled");
  v4[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) & 1);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
}

@end
