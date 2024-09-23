@implementation BLSHWaiterForBacklightState

- (BLSHWaiterForBacklightState)initWithBacklightState:(int64_t)a3
{
  BLSHWaiterForBacklightState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BLSHWaiterForBacklightState;
  result = -[BLSHWaiterForBacklight init](&v5, sel_init);
  if (result)
    result->_backlightState = a3;
  return result;
}

- (BLSHWaiterForBacklightState)initWithPredicate:(id)a3
{
  id v4;
  BLSHWaiterForBacklightState *v5;
  uint64_t v6;
  id predicate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHWaiterForBacklightState;
  v5 = -[BLSHWaiterForBacklight init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x2199D2BD8](v4);
    predicate = v5->_predicate;
    v5->_predicate = (id)v6;

  }
  return v5;
}

- (BOOL)isDesiredState:(int64_t)a3
{
  uint64_t (**predicate)(id, int64_t);

  predicate = (uint64_t (**)(id, int64_t))self->_predicate;
  if (predicate)
    return predicate[2](self->_predicate, a3);
  else
    return self->_backlightState == a3;
}

- (BOOL)isAlreadyAtDesiredState
{
  void *v3;

  +[BLSHBacklightHost sharedBacklightHost](BLSHBacklightHost, "sharedBacklightHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[BLSHWaiterForBacklightState isDesiredState:](self, "isDesiredState:", objc_msgSend(v3, "backlightState"));

  return (char)self;
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  if (-[BLSHWaiterForBacklightState isDesiredState:](self, "isDesiredState:", a4))
    -[BLSHWaiterForBacklight callCompletion](self, "callCompletion");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predicate, 0);
}

@end
