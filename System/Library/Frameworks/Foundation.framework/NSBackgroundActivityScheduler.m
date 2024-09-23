@implementation NSBackgroundActivityScheduler

- (void)setRepeats:(BOOL)repeats
{
  int64_t *p_flags;
  unsigned __int8 v4;

  self->_repeats = repeats;
  p_flags = &self->_flags;
  do
    v4 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v4 | 0x20, (unsigned __int8 *)p_flags));
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  int64_t *p_flags;
  unsigned __int8 v4;

  self->_qualityOfService = qualityOfService;
  p_flags = &self->_flags;
  do
    v4 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v4 | 0x20, (unsigned __int8 *)p_flags));
}

uint64_t __49__NSBackgroundActivityScheduler__updateCriteria___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

- (void)scheduleWithBlock:(void *)block
{
  id activity;
  xpc_object_t v6;
  int64_t *p_flags;
  unsigned __int8 v8;
  const char *v9;
  void *v10;
  _QWORD handler[6];

  handler[5] = *MEMORY[0x1E0C80C00];
  if (!block)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: The argument may not be nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v10);
  }
  activity = self->_activity;
  if (activity != block)
  {

    self->_activity = (id)objc_msgSend(block, "copy");
  }
  if (-[NSBackgroundActivityScheduler isPreregistered](self, "isPreregistered"))
  {
    v6 = (xpc_object_t)*MEMORY[0x1E0C80748];
    xpc_retain((xpc_object_t)*MEMORY[0x1E0C80748]);
  }
  else
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    -[NSBackgroundActivityScheduler _updateCriteria:](self, "_updateCriteria:", v6);
  }
  p_flags = &self->_flags;
  do
    v8 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v8 & 0xDF, (unsigned __int8 *)p_flags));
  v9 = -[NSString UTF8String](-[NSBackgroundActivityScheduler identifier](self, "identifier"), "UTF8String");
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __51__NSBackgroundActivityScheduler_scheduleWithBlock___block_invoke;
  handler[3] = &unk_1E0F4FF38;
  handler[4] = self;
  xpc_activity_register(v9, v6, handler);
  xpc_release(v6);
}

- (BOOL)isPreregistered
{
  return self->_preregistered;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_updateCriteria:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  const char *v11;
  unint64_t v12;
  const char **v13;
  OS_xpc_object *additionalProperties;
  NSString *v15;
  _QWORD applier[6];

  applier[5] = *MEMORY[0x1E0C80C00];
  -[NSBackgroundActivityScheduler tolerance](self, "tolerance");
  v6 = v5;
  -[NSBackgroundActivityScheduler interval](self, "interval");
  v8 = v7;
  if (v6 == 0.0 && v7 != 0.0)
  {
    v6 = v7 * 0.5;
    if (v7 * 0.5 < 1.0)
      v6 = 0.0;
  }
  if (v7 > 0.0)
  {
    -[NSBackgroundActivityScheduler delay](self, "delay");
    v10 = llround(v9);
    if (!v10)
    {
      v10 = llround(v8 - v6);
      if (v10 <= 0)
      {
        v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Invalid value for tolerance (%f). The value must be less than the interval."), self, *(_QWORD *)&v6);
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0));
      }
    }
    xpc_dictionary_set_int64(a3, (const char *)*MEMORY[0x1E0C80760], v10);
    xpc_dictionary_set_BOOL(a3, (const char *)*MEMORY[0x1E0C80898], -[NSBackgroundActivityScheduler repeats](self, "repeats"));
    xpc_dictionary_set_int64(a3, (const char *)*MEMORY[0x1E0C807A8], llround(v8));
  }
  if (-[NSBackgroundActivityScheduler _isAppRefresh](self, "_isAppRefresh"))
  {
    xpc_dictionary_set_BOOL(a3, (const char *)*MEMORY[0x1E0C80740], 1);
    xpc_dictionary_set_BOOL(a3, (const char *)*MEMORY[0x1E0C80898], -[NSBackgroundActivityScheduler repeats](self, "repeats"));
  }
  if (v6 != 0.0)
    xpc_dictionary_set_int64(a3, (const char *)*MEMORY[0x1E0C80790], llround(v6));
  v11 = (const char *)*MEMORY[0x1E0C80878];
  v12 = __ROR8__(-[NSBackgroundActivityScheduler qualityOfService](self, "qualityOfService") - 9, 3);
  if (v12 > 3)
    v13 = (const char **)MEMORY[0x1E0C80880];
  else
    v13 = (const char **)qword_1E0F50C68[v12];
  xpc_dictionary_set_string(a3, v11, *v13);
  additionalProperties = self->_additionalProperties;
  if (additionalProperties)
  {
    if (object_getClass(additionalProperties) == (Class)MEMORY[0x1E0C812F8])
    {
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __49__NSBackgroundActivityScheduler__updateCriteria___block_invoke;
      applier[3] = &unk_1E0F50C20;
      applier[4] = a3;
      xpc_dictionary_apply(additionalProperties, applier);
    }
  }
}

- (NSTimeInterval)tolerance
{
  return self->_tolerance;
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (NSQualityOfService)qualityOfService
{
  return self->_qualityOfService;
}

- (NSTimeInterval)interval
{
  return self->_interval;
}

- (double)delay
{
  return self->_delay;
}

- (BOOL)_isAppRefresh
{
  return self->_appRefresh;
}

- (void)_setAdditionalXPCActivityProperties:(id)a3
{
  OS_xpc_object *additionalProperties;

  additionalProperties = self->_additionalProperties;
  if (additionalProperties != a3)
  {
    if (additionalProperties)
    {
      xpc_release(additionalProperties);
      self->_additionalProperties = 0;
    }
    if (a3)
      self->_additionalProperties = (OS_xpc_object *)xpc_retain(a3);
  }
}

- (void)setInterval:(NSTimeInterval)interval
{
  int64_t *p_flags;
  unsigned __int8 v4;
  NSString *v5;

  if (interval < 1.0)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Invalid value for interval (%f). The value must be >= 1."), self, *(_QWORD *)&interval);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v5, 0));
  }
  self->_interval = interval;
  p_flags = &self->_flags;
  do
    v4 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v4 | 0x20, (unsigned __int8 *)p_flags));
}

- (NSBackgroundActivityScheduler)initWithIdentifier:(NSString *)identifier
{
  NSBackgroundActivityScheduler *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!identifier || !-[NSString length](identifier, "length"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The identifier should be a reverse-DNS style string, for example com.mycompany.myapp.activity_name"), 0));
  v7.receiver = self;
  v7.super_class = (Class)NSBackgroundActivityScheduler;
  v5 = -[NSBackgroundActivityScheduler init](&v7, sel_init);
  v5->_qualityOfService = 9;
  v5->_identifier = (NSString *)-[NSString copy](identifier, "copy");
  v5->_invalidateLock._os_unfair_lock_opaque = 0;
  return v5;
}

- (NSBackgroundActivityScheduler)init
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Use -initWithIdentifier:"), 0));
}

- (void)dealloc
{
  OS_xpc_object *currentActivity;
  OS_xpc_object *additionalProperties;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];

  currentActivity = self->_currentActivity;
  if (currentActivity)
    xpc_release(currentActivity);
  additionalProperties = self->_additionalProperties;
  if (additionalProperties)
    xpc_release(additionalProperties);
  v5.receiver = self;
  v5.super_class = (Class)NSBackgroundActivityScheduler;
  -[NSBackgroundActivityScheduler dealloc](&v5, sel_dealloc);
}

- (void)set_appRefresh:(BOOL)a3
{
  int64_t *p_flags;
  unsigned __int8 v4;

  self->_appRefresh = a3;
  p_flags = &self->_flags;
  do
    v4 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v4 | 0x20, (unsigned __int8 *)p_flags));
}

- (void)setTolerance:(NSTimeInterval)tolerance
{
  int64_t *p_flags;
  unsigned __int8 v4;
  NSString *v5;

  if (tolerance < 0.0)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Invalid value for tolerance (%f). The value must be >= 0."), self, *(_QWORD *)&tolerance);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v5, 0));
  }
  self->_tolerance = tolerance;
  p_flags = &self->_flags;
  do
    v4 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v4 | 0x20, (unsigned __int8 *)p_flags));
}

- (void)setPreregistered:(BOOL)a3
{
  self->_preregistered = a3;
}

- (void)setDelay:(double)a3
{
  int64_t *p_flags;
  unsigned __int8 v4;

  self->_delay = a3;
  p_flags = &self->_flags;
  do
    v4 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v4 | 0x20, (unsigned __int8 *)p_flags));
}

- (void)_updateCriteriaForCompletedActivity:(id)a3
{
  int64_t *p_flags;
  unsigned __int8 v6;
  xpc_object_t v7;

  p_flags = &self->_flags;
  do
    v6 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v6 & 0xDF, (unsigned __int8 *)p_flags));
  if ((v6 & 0x20) != 0)
  {
    v7 = xpc_activity_copy_criteria((xpc_activity_t)a3);
    -[NSBackgroundActivityScheduler _updateCriteria:](self, "_updateCriteria:", v7);
    xpc_activity_set_criteria((xpc_activity_t)a3, v7);
    xpc_release(v7);
  }
}

- (id)currentActivity
{
  return self->_currentActivity;
}

- (void)setCurrentActivity:(id)a3
{
  OS_xpc_object *currentActivity;

  currentActivity = self->_currentActivity;
  if (currentActivity != a3)
  {
    if (currentActivity)
    {
      xpc_release(currentActivity);
      self->_currentActivity = 0;
    }
    if (a3)
      self->_currentActivity = (OS_xpc_object *)xpc_retain(a3);
  }
}

void __51__NSBackgroundActivityScheduler_scheduleWithBlock___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;
  xpc_object_t v5;
  void *v6;
  int64_t int64;
  _BOOL8 v8;
  int64_t v9;
  int64_t v10;
  const char *v11;
  const char *string;
  uint64_t v13;
  id v14;
  unsigned __int8 *v15;
  unsigned __int8 v16;
  uint64_t v17;

  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
    v14 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCurrentActivity:", activity);
      if (!xpc_activity_set_state(activity, 4))
        NSLog((NSString *)CFSTR("Unknown error: state transition to CONTINUE failed"));
      __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)v14);

    }
  }
  else if (!state)
  {
    v5 = xpc_activity_copy_criteria(activity);
    if (v5)
    {
      v6 = v5;
      int64 = xpc_dictionary_get_int64(v5, (const char *)*MEMORY[0x1E0C807A8]);
      v8 = int64 != 0;
      if (int64)
        objc_msgSend(*(id *)(a1 + 32), "setInterval:", (double)int64);
      v9 = xpc_dictionary_get_int64(v6, (const char *)*MEMORY[0x1E0C80760]);
      if (v9)
        objc_msgSend(*(id *)(a1 + 32), "setDelay:", (double)v9);
      v10 = xpc_dictionary_get_int64(v6, (const char *)*MEMORY[0x1E0C80790]);
      if (v10)
        objc_msgSend(*(id *)(a1 + 32), "setTolerance:", (double)v10);
      v11 = (const char *)*MEMORY[0x1E0C80898];
      if (xpc_dictionary_get_value(v6, (const char *)*MEMORY[0x1E0C80898]))
        v8 = xpc_dictionary_get_BOOL(v6, v11);
      objc_msgSend(*(id *)(a1 + 32), "setRepeats:", v8);
      string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1E0C80878]);
      if ((const char *)*MEMORY[0x1E0C80888] == string || string && !strcmp((const char *)*MEMORY[0x1E0C80888], string))
        v13 = 17;
      else
        v13 = 9;
      objc_msgSend(*(id *)(a1 + 32), "setQualityOfService:", v13);
      xpc_release(v6);
      v15 = (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 80);
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 & 0xDF, v15));
    }
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    if (v17)
    {
      (*(void (**)(void))(v17 + 16))();
      objc_msgSend(*(id *)(a1 + 32), "_updateCriteriaForCompletedActivity:", activity);
    }
  }
}

void __51__NSBackgroundActivityScheduler_scheduleWithBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentActivity:", 0);
  if (a2 == 2)
  {
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
      NSLog((NSString *)CFSTR("Unknown error: state transition to DEFER failed"));
    objc_msgSend(*(id *)(a1 + 32), "_updateCriteriaForCompletedActivity:", *(_QWORD *)(a1 + 40));
  }
  else if (a2 == 1 && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    NSLog((NSString *)CFSTR("Unknown error: state transition to DONE failed"));
  }
}

- (void)invalidate
{
  os_unfair_lock_s *p_invalidateLock;

  p_invalidateLock = &self->_invalidateLock;
  os_unfair_lock_lock(&self->_invalidateLock);
  xpc_activity_unregister(-[NSString UTF8String](-[NSBackgroundActivityScheduler identifier](self, "identifier"), "UTF8String"));

  self->_activity = 0;
  os_unfair_lock_unlock(p_invalidateLock);
}

- (BOOL)shouldDefer
{
  _xpc_activity_s *v4;
  void *v6;

  v4 = -[NSBackgroundActivityScheduler currentActivity](self, "currentActivity");
  if (!v4)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This method may only be called during the invocation of the activity block or asynchronous activity"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v6);
  }
  return xpc_activity_should_defer(v4);
}

- (id)checkInHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setCheckInHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

@end
