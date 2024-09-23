@implementation FigDisplaySleepAssertion

- (FigDisplaySleepAssertion)initWithReason:(id)a3 queue:(id)a4 expirationHandler:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD handler[5];
  objc_super v14;

  if (initWithReason_queue_expirationHandler__onceToken != -1)
    dispatch_once(&initWithReason_queue_expirationHandler__onceToken, &__block_literal_global_70);
  v14.receiver = self;
  v14.super_class = (Class)FigDisplaySleepAssertion;
  v9 = -[FigDisplaySleepAssertion init](&v14, sel_init);
  if (v9)
  {
    *((_QWORD *)v9 + 2) = a3;
    v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)a4);
    *((_QWORD *)v9 + 1) = v10;
    *((_QWORD *)v9 + 3) = 0;
    *((_QWORD *)v9 + 4) = 0;
    if (v10)
    {
      dispatch_source_set_timer(v10, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      v11 = *((_QWORD *)v9 + 1);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __67__FigDisplaySleepAssertion_initWithReason_queue_expirationHandler___block_invoke_2;
      handler[3] = &unk_1E2F98E38;
      handler[4] = a5;
      dispatch_source_set_event_handler(v11, handler);
      dispatch_activate(*((dispatch_object_t *)v9 + 1));
    }
  }
  return (FigDisplaySleepAssertion *)v9;
}

uint64_t __67__FigDisplaySleepAssertion_initWithReason_queue_expirationHandler___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  ITIdleTimerStateClass = result;
  return result;
}

uint64_t __67__FigDisplaySleepAssertion_initWithReason_queue_expirationHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  NSObject *timer;
  BSInvalidatable *idleTimerAssertion;
  objc_super v5;

  timer = self->_timer;
  if (timer)
    dispatch_release(timer);
  idleTimerAssertion = self->_idleTimerAssertion;
  if (idleTimerAssertion)
  {
    -[BSInvalidatable invalidate](idleTimerAssertion, "invalidate");

    self->_idleTimerAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)FigDisplaySleepAssertion;
  -[FigDisplaySleepAssertion dealloc](&v5, sel_dealloc);
}

- (unsigned)resetIdleTimer
{
  BSInvalidatable *idleTimerAssertion;
  BOOL v4;
  uint64_t v5;
  NSObject *timer;
  dispatch_time_t v7;

  if (self->_timer)
  {
    idleTimerAssertion = self->_idleTimerAssertion;
    if (idleTimerAssertion)
      v4 = 1;
    else
      v4 = ITIdleTimerStateClass == 0;
    if (!v4)
    {
      idleTimerAssertion = (BSInvalidatable *)objc_msgSend((id)objc_msgSend((id)ITIdleTimerStateClass, "sharedInstance"), "newAssertionToDisableIdleTimerForReason:", self->_reason);
      self->_idleTimerAssertion = idleTimerAssertion;
    }
    if (idleTimerAssertion)
    {
      v5 = mach_absolute_time();
      if ((unint64_t)FigHostTimeToNanoseconds() >= 0xFE502B)
      {
        timer = self->_timer;
        v7 = dispatch_time(0, 2000000000);
        dispatch_source_set_timer(timer, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
        self->_lastIdleTimerResetTime = v5;
      }
      LOBYTE(idleTimerAssertion) = 1;
    }
  }
  else
  {
    LOBYTE(idleTimerAssertion) = 0;
  }
  return idleTimerAssertion;
}

@end
