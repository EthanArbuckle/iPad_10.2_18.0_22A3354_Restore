@implementation MNNavigationServiceCallback_ShouldEnableIdleTimer

- (unint64_t)type
{
  return 14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServiceCallback_ShouldEnableIdleTimer;
  v4 = a3;
  -[MNNavigationServiceCallbackParameters encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldEnable, CFSTR("_shouldEnable"), v5.receiver, v5.super_class);

}

- (MNNavigationServiceCallback_ShouldEnableIdleTimer)initWithCoder:(id)a3
{
  id v4;
  MNNavigationServiceCallback_ShouldEnableIdleTimer *v5;
  MNNavigationServiceCallback_ShouldEnableIdleTimer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MNNavigationServiceCallback_ShouldEnableIdleTimer;
  v5 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_shouldEnable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldEnable"));
    v6 = v5;
  }

  return v5;
}

- (BOOL)shouldEnable
{
  return self->_shouldEnable;
}

- (void)setShouldEnable:(BOOL)a3
{
  self->_shouldEnable = a3;
}

@end
