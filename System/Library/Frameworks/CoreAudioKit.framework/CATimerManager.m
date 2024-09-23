@implementation CATimerManager

- (CATimerManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CATimerManager;
  return -[CATimerManager init](&v3, sel_init);
}

+ (id)getWeakReferenceOfObject:(id)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTimerSource:", a3);
  return v4;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  -[CATimerManager timerSource](self, "timerSource");
  return (id)objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "invokeWithTarget:", -[CATimerManager timerSource](self, "timerSource"));
}

- (id)timerSource
{
  return self->timerSource;
}

- (void)setTimerSource:(id)a3
{
  self->timerSource = a3;
}

@end
