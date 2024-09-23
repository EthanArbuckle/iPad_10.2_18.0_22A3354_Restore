@implementation CAMAnalyticsControlDrawerEvent

- (CAMAnalyticsControlDrawerEvent)initWithReason:(int64_t)a3 captureMode:(int64_t)a4 devicePosition:(int64_t)a5
{
  CAMAnalyticsControlDrawerEvent *v8;
  CAMAnalyticsControlDrawerEvent *v9;
  NSMutableSet *v10;
  NSMutableSet *changedControlTypes;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMAnalyticsControlDrawerEvent;
  v8 = -[CAMAnalyticsEvent init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->__openingReason = a3;
    v8->__captureMode = a4;
    v8->__devicePosition = a5;
    v8->__startTime = CFAbsoluteTimeGetCurrent();
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    changedControlTypes = v9->__changedControlTypes;
    v9->__changedControlTypes = v10;

  }
  return v9;
}

- (id)eventName
{
  return CFSTR("control.drawer");
}

- (void)setOpeningControlType:(int64_t)a3
{
  -[CAMAnalyticsControlDrawerEvent set_openingControlType:](self, "set_openingControlType:", a3);
  -[CAMAnalyticsControlDrawerEvent set_hasOpeningControlType:](self, "set_hasOpeningControlType:", 1);
}

- (void)setDismissingControlType:(int64_t)a3
{
  -[CAMAnalyticsControlDrawerEvent set_dismissingControlType:](self, "set_dismissingControlType:", a3);
  -[CAMAnalyticsControlDrawerEvent set_hasDismissingControlType:](self, "set_hasDismissingControlType:", 1);
}

- (void)dismissedControlDrawerWithReason:(int64_t)a3
{
  double Current;
  double v5;

  -[CAMAnalyticsControlDrawerEvent set_dismissingReason:](self, "set_dismissingReason:", a3);
  Current = CFAbsoluteTimeGetCurrent();
  -[CAMAnalyticsControlDrawerEvent _startTime](self, "_startTime");
  -[CAMAnalyticsControlDrawerEvent set_duration:](self, "set_duration:", Current - v5);
  -[CAMAnalyticsControlDrawerEvent publish](self, "publish");
}

- (void)didChangeValueForControlType:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[CAMAnalyticsControlDrawerEvent _changedControlTypes](self, "_changedControlTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    -[CAMAnalyticsControlDrawerEvent _changedControlTypes](self, "_changedControlTypes");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

  }
}

- (void)publish
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  unint64_t v6;
  __CFString *v7;
  int64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  unint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  __CFString *v18;
  unint64_t v19;
  __CFString *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  objc_super v25;
  _QWORD v26[4];
  id v27;

  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMAnalyticsControlDrawerEvent _openingReason](self, "_openingReason");
  if (v4 > 0xA)
    v5 = 0;
  else
    v5 = off_1EA329578[v4];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("openingReason"));
  v6 = -[CAMAnalyticsControlDrawerEvent _captureMode](self, "_captureMode");
  if (v6 > 9)
    v7 = 0;
  else
    v7 = off_1EA329528[v6];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("captureMode"));
  v8 = -[CAMAnalyticsControlDrawerEvent _devicePosition](self, "_devicePosition");
  v9 = CFSTR("Front");
  if (v8 != 1)
    v9 = 0;
  if (v8)
    v10 = v9;
  else
    v10 = CFSTR("Back");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("devicePosition"));
  if (-[CAMAnalyticsControlDrawerEvent _hasOpeningControlType](self, "_hasOpeningControlType")
    && -[CAMAnalyticsControlDrawerEvent _openingReason](self, "_openingReason") != 2)
  {
    v11 = -[CAMAnalyticsControlDrawerEvent _openingControlType](self, "_openingControlType");
    if (v11 > 0xF)
      v12 = 0;
    else
      v12 = off_1EA3295D0[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("openingControlType"));
  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMAnalyticsControlDrawerEvent _duration](self, "_duration");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("duration"));

  v15 = (void *)objc_opt_class();
  -[CAMAnalyticsControlDrawerEvent _duration](self, "_duration");
  objc_msgSend(v15, "durationRangeStringForDuration:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("durationRange"));

  v17 = -[CAMAnalyticsControlDrawerEvent _dismissingReason](self, "_dismissingReason");
  if (v17 > 0xA)
    v18 = 0;
  else
    v18 = off_1EA329578[v17];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("dismissingReason"));
  if (-[CAMAnalyticsControlDrawerEvent _hasDismissingControlType](self, "_hasDismissingControlType")
    && -[CAMAnalyticsControlDrawerEvent _dismissingReason](self, "_dismissingReason") != 2)
  {
    v19 = -[CAMAnalyticsControlDrawerEvent _dismissingControlType](self, "_dismissingControlType");
    if (v19 > 0xF)
      v20 = 0;
    else
      v20 = off_1EA3295D0[v19];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("dismissingControlType"));
  }
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CAMAnalyticsControlDrawerEvent _changedControlTypes](self, "_changedControlTypes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __41__CAMAnalyticsControlDrawerEvent_publish__block_invoke;
  v26[3] = &unk_1EA329508;
  v23 = v21;
  v27 = v23;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v26);

  objc_msgSend(v23, "sortUsingSelector:", sel_compare_);
  if (objc_msgSend(v23, "count"))
  {
    objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("changedControls"));

  }
  v25.receiver = self;
  v25.super_class = (Class)CAMAnalyticsControlDrawerEvent;
  -[CAMAnalyticsEvent publish](&v25, sel_publish);

}

uint64_t __41__CAMAnalyticsControlDrawerEvent_publish__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  __CFString *v4;

  v3 = objc_msgSend(a2, "integerValue");
  if (v3 > 0xF)
    v4 = 0;
  else
    v4 = off_1EA3295D0[v3];
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

- (int64_t)_openingReason
{
  return self->__openingReason;
}

- (int64_t)_dismissingReason
{
  return self->__dismissingReason;
}

- (void)set_dismissingReason:(int64_t)a3
{
  self->__dismissingReason = a3;
}

- (int64_t)_openingControlType
{
  return self->__openingControlType;
}

- (void)set_openingControlType:(int64_t)a3
{
  self->__openingControlType = a3;
}

- (BOOL)_hasOpeningControlType
{
  return self->__hasOpeningControlType;
}

- (void)set_hasOpeningControlType:(BOOL)a3
{
  self->__hasOpeningControlType = a3;
}

- (int64_t)_dismissingControlType
{
  return self->__dismissingControlType;
}

- (void)set_dismissingControlType:(int64_t)a3
{
  self->__dismissingControlType = a3;
}

- (BOOL)_hasDismissingControlType
{
  return self->__hasDismissingControlType;
}

- (void)set_hasDismissingControlType:(BOOL)a3
{
  self->__hasDismissingControlType = a3;
}

- (int64_t)_captureMode
{
  return self->__captureMode;
}

- (int64_t)_devicePosition
{
  return self->__devicePosition;
}

- (double)_startTime
{
  return self->__startTime;
}

- (double)_duration
{
  return self->__duration;
}

- (void)set_duration:(double)a3
{
  self->__duration = a3;
}

- (NSMutableSet)_changedControlTypes
{
  return self->__changedControlTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__changedControlTypes, 0);
}

@end
