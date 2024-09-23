@implementation MNNavigationServiceCallback_WillEndNavigation

+ (id)willEndNavigationWithReason:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setReason:", a3);
  return v4;
}

- (unint64_t)type
{
  return 16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_reason, CFSTR("_reason"));
}

- (MNNavigationServiceCallback_WillEndNavigation)initWithCoder:(id)a3
{
  id v4;
  MNNavigationServiceCallback_WillEndNavigation *v5;
  MNNavigationServiceCallback_WillEndNavigation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MNNavigationServiceCallback_WillEndNavigation;
  v5 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_reason"));
    v6 = v5;
  }

  return v5;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

@end
