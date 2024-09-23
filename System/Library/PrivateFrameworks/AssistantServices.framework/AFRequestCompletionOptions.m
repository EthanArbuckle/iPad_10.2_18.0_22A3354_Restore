@implementation AFRequestCompletionOptions

- (id)_initWithShowUIDuringListening:(BOOL)a3 playAlertBeforeListening:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  AFRequestCompletionOptions *v6;
  AFTriggerlessListeningOptions *v7;
  AFTriggerlessListeningOptions *triggerlessListeningOptions;

  v4 = a4;
  v5 = a3;
  v6 = -[AFRequestCompletionOptions init](self, "init");
  if (v6)
  {
    v7 = -[AFTriggerlessListeningOptions _initWithShowUIDuringListening:playAlertBeforeListening:]([AFTriggerlessListeningOptions alloc], "_initWithShowUIDuringListening:playAlertBeforeListening:", v5, v4);
    triggerlessListeningOptions = v6->_triggerlessListeningOptions;
    v6->_triggerlessListeningOptions = v7;

  }
  return v6;
}

- (AFRequestCompletionOptions)initWithCoder:(id)a3
{
  id v4;
  AFRequestCompletionOptions *v5;
  uint64_t v6;
  AFTriggerlessListeningOptions *triggerlessListeningOptions;

  v4 = a3;
  v5 = -[AFRequestCompletionOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_triggerlessListeningOptions"));
    v6 = objc_claimAutoreleasedReturnValue();
    triggerlessListeningOptions = v5->_triggerlessListeningOptions;
    v5->_triggerlessListeningOptions = (AFTriggerlessListeningOptions *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_triggerlessListeningOptions, CFSTR("_triggerlessListeningOptions"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTriggerlessListeningOptions:", self->_triggerlessListeningOptions);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFRequestCompletionOptions;
  -[AFRequestCompletionOptions description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("triggerlessListeningOptions: %@"), self->_triggerlessListeningOptions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (AFTriggerlessListeningOptions)triggerlessListeningOptions
{
  return self->_triggerlessListeningOptions;
}

- (void)setTriggerlessListeningOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerlessListeningOptions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
