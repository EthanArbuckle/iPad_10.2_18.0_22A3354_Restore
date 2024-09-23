@implementation CBIndicatorAnalyticsModule

- (CBIndicatorAnalyticsModule)initWithQueue:(id)a3 andIndicatorModule:(id)a4
{
  void *context;
  CBIndicatorAnalyticsModule *v6;

  context = (void *)MEMORY[0x1B5E4A8B0]();
  v6 = -[CBIndicatorAnalyticsModule initWithQueue:andIndicatorModule:andDDFactorMapping:andLuxMapping:andDDFactorEdges:andLuxEdges:andTimerIntervalMs:](self, "initWithQueue:andIndicatorModule:andDDFactorMapping:andLuxMapping:andDDFactorEdges:andLuxEdges:andTimerIntervalMs:", a3, a4, &unk_1E6917790, &unk_1E69177B8, &unk_1E6917618, &unk_1E6917630, 16.6666667);
  objc_autoreleasePoolPop(context);
  return v6;
}

- (CBIndicatorAnalyticsModule)initWithQueue:(id)a3 andIndicatorModule:(id)a4 andDDFactorMapping:(id)a5 andLuxMapping:(id)a6 andDDFactorEdges:(id)a7 andLuxEdges:(id)a8 andTimerIntervalMs:(double)a9
{
  id v9;
  id v10;
  id v11;
  CBHistogramBuilder2D *v12;
  uint64_t v13;
  dispatch_source_t v14;
  NSObject *v15;
  NSObject *log;
  os_log_type_t v18;
  uint64_t inited;
  NSObject *v20;
  uint8_t v21[15];
  os_log_type_t type;
  os_log_t oslog;
  uint64_t handler;
  int v25;
  int v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  objc_super v30;
  double v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  SEL v38;
  id v39;

  v39 = self;
  v38 = a2;
  v37 = a3;
  v36 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v32 = a8;
  v31 = a9;
  v30.receiver = self;
  v30.super_class = (Class)CBIndicatorAnalyticsModule;
  v39 = -[CBModule initWithQueue:](&v30, sel_initWithQueue_, a3);
  if (!v39)
    return (CBIndicatorAnalyticsModule *)v39;
  if (v36)
  {
    v9 = v36;
    *((_QWORD *)v39 + 5) = v9;
    v10 = v35;
    *((_QWORD *)v39 + 7) = v10;
    v11 = v34;
    *((_QWORD *)v39 + 8) = v11;
    v12 = [CBHistogramBuilder2D alloc];
    v13 = -[CBHistogramBuilder2D initWithFirstDim:andSecondDim:](v12, "initWithFirstDim:andSecondDim:", v32, v33);
    *((_QWORD *)v39 + 4) = v13;
    if (*((_QWORD *)v39 + 4))
    {
      v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v39 + 3));
      *((_QWORD *)v39 + 6) = v14;
      if (*((_QWORD *)v39 + 6))
      {
        *((double *)v39 + 10) = v31;
        dispatch_source_set_timer(*((dispatch_source_t *)v39 + 6), 0, (unint64_t)(*((double *)v39 + 10) * 1000000.0), 0);
        v15 = *((_QWORD *)v39 + 6);
        handler = MEMORY[0x1E0C809B0];
        v25 = -1073741824;
        v26 = 0;
        v27 = __144__CBIndicatorAnalyticsModule_initWithQueue_andIndicatorModule_andDDFactorMapping_andLuxMapping_andDDFactorEdges_andLuxEdges_andTimerIntervalMs___block_invoke;
        v28 = &unk_1E68E9E60;
        v29 = v39;
        dispatch_source_set_event_handler(v15, &handler);
        *((_BYTE *)v39 + 72) = 1;
        *((_DWORD *)v39 + 23) = 0;
        *((_DWORD *)v39 + 22) = 0;
        *((_DWORD *)v39 + 24) = 2143289344;
        return (CBIndicatorAnalyticsModule *)v39;
      }
    }
  }
  oslog = 0;
  if (*((_QWORD *)v39 + 2))
  {
    v20 = *((_QWORD *)v39 + 2);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v20 = inited;
  }
  oslog = v20;
  type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    v18 = type;
    __os_log_helper_16_0_0(v21);
    _os_log_error_impl(&dword_1B5291000, log, v18, "Failed to create CBIndicatorAnalyticsModule", v21, 2u);
  }

  v39 = 0;
  return 0;
}

uint64_t __144__CBIndicatorAnalyticsModule_initWithQueue_andIndicatorModule_andDDFactorMapping_andLuxMapping_andDDFactorEdges_andLuxEdges_andTimerIntervalMs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "indicatorStatsTimerCallback", a1, a1);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBIndicatorAnalyticsModule *v4;

  v4 = self;
  v3 = a2;

  dispatch_source_cancel((dispatch_source_t)v4->_timer);
  if (v4->_timerIsSuspended)
    dispatch_resume((dispatch_object_t)v4->_timer);
  dispatch_release((dispatch_object_t)v4->_timer);
  v2.receiver = v4;
  v2.super_class = (Class)CBIndicatorAnalyticsModule;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (void)indicatorStatsTimerCallback
{
  double v2;
  double v3;

  -[CBIndicatorBrightnessModule currentDigitalDimmingFactor](self->_indicatorModule, "currentDigitalDimmingFactor");
  *(float *)&v2 = self->_trustedLux;
  -[CBHistogramBuilder2D pushNumberWeighted:withWeight:forFirstDimValue:](self->_stats, "pushNumberWeighted:withWeight:forFirstDimValue:", v3, self->_timerIntervalMs, v2);
}

- (void)startTimer
{
  if (self->_timerIsSuspended)
  {
    self->_sessionStart = mach_time_now_in_milliseconds();
    dispatch_resume((dispatch_object_t)self->_timer);
    self->_timerIsSuspended = 0;
  }
}

- (void)stopTimer
{
  if (!self->_timerIsSuspended)
  {
    dispatch_suspend((dispatch_object_t)self->_timer);
    self->_timerIsSuspended = 1;
    self->_lastSessionDuration = mach_time_now_in_milliseconds() - self->_sessionStart;
    -[CBIndicatorAnalyticsModule submit](self, "submit");
  }
}

- (void)submit
{
  CBHistogramBuilder2D *stats;
  void *context;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v8;
  CBIndicatorAnalyticsModule *v9;
  uint64_t v10;
  uint64_t v11;
  SEL v12;
  CBIndicatorAnalyticsModule *v13;

  v13 = self;
  v12 = a2;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  stats = v13->_stats;
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __36__CBIndicatorAnalyticsModule_submit__block_invoke;
  v8 = &unk_1E68EB808;
  v9 = v13;
  v10 = v11;
  -[CBHistogramBuilder2D enumerateBinsUsingBlock:](stats, "enumerateBinsUsingBlock:", &v4);
  -[CBHistogramBuilder2D reset](v13->_stats, "reset");
  objc_autoreleasePoolPop(context);
}

uint64_t __36__CBIndicatorAnalyticsModule_submit__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(_QWORD *);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = a1;
  v22 = a2;
  v21 = a3;
  v20 = a4;
  v19 = a5;
  v18 = a6;
  v17 = a1;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __36__CBIndicatorAnalyticsModule_submit__block_invoke_2;
  v11 = &unk_1E68EB7E0;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = *(_QWORD *)(a1 + 40);
  return +[CBAnalytics send:withBlock:](CBAnalytics, "send:withBlock:", CFSTR(".MIB"), &v7);
}

uint64_t __36__CBIndicatorAnalyticsModule_submit__block_invoke_2(_QWORD *a1)
{
  double v1;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("luxEdge");
  v5[0] = objc_msgSend(*(id *)(a1[4] + 64), "valueForKey:", a1[5]);
  v4[1] = CFSTR("ddEdge");
  v5[1] = objc_msgSend(*(id *)(a1[4] + 56), "valueForKey:", a1[6]);
  v4[2] = CFSTR("value");
  v5[2] = a1[7];
  v4[3] = CFSTR("sessionTime");
  LODWORD(v1) = *(_DWORD *)(a1[4] + 92);
  v5[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1);
  v4[4] = CFSTR("sessionID");
  v5[4] = a1[8];
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
}

- (id)copyPropertyForKey:(id)a3
{
  return 0;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v5;

  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("SecureIndicatorState")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(a3, "unsignedIntegerValue");
      if (v5 == 1)
      {
        -[CBIndicatorAnalyticsModule startTimer](self, "startTimer");
      }
      else if (v5 == 4)
      {
        -[CBIndicatorAnalyticsModule stopTimer](self, "stopTimer");
      }
    }
  }
  return 1;
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  float v4;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TrustedLux")) & 1) != 0)
  {
    objc_msgSend(a4, "floatValue");
    self->_trustedLux = v4;
  }
}

@end
