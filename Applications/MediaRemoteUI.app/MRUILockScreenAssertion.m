@implementation MRUILockScreenAssertion

- (MRUILockScreenAssertion)initWithAnimated:(BOOL)a3
{
  MRUILockScreenAssertion *v4;
  MRUILockScreenAssertion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUILockScreenAssertion;
  v4 = -[MRUILockScreenAssertion init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_animated = a3;
    -[MRUILockScreenAssertion acquire](v4, "acquire");
  }
  return v5;
}

- (MRUILockScreenAssertion)init
{
  return -[MRUILockScreenAssertion initWithAnimated:](self, "initWithAnimated:", 0);
}

- (void)acquire
{
  id v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  self->_valid = 1;
  objc_initWeak(&location, self);
  v3 = objc_alloc_init((Class)SBSBackgroundContentDefinition);
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_100004A50;
  v8 = &unk_100045078;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SBSLockScreenBackgroundContentAssertion acquireBackgroundContentAssertionWithDefinition:errorHandler:](SBSLockScreenBackgroundContentAssertion, "acquireBackgroundContentAssertionWithDefinition:errorHandler:", v3, &v5));
  -[MRUILockScreenAssertion setBackgroundContentAssertion:](self, "setBackgroundContentAssertion:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)delayAcquire
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B8C;
  block[3] = &unk_1000450A0;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)invalidate
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRUILockScreenAssertion backgroundContentAssertion](self, "backgroundContentAssertion"));
  objc_msgSend(v3, "invalidate");

  -[MRUILockScreenAssertion setBackgroundContentAssertion:](self, "setBackgroundContentAssertion:", 0);
  self->_valid = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[MRUILockScreenAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MRUILockScreenAssertion;
  -[MRUILockScreenAssertion dealloc](&v3, "dealloc");
}

- (BOOL)isValid
{
  return self->_valid;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (SBSLockScreenBackgroundContentAssertion)backgroundContentAssertion
{
  return self->_backgroundContentAssertion;
}

- (void)setBackgroundContentAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundContentAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundContentAssertion, 0);
}

@end
