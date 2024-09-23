@implementation TKSmartCardUserInteraction

- (TKSmartCardUserInteraction)init
{
  TKSmartCardUserInteraction *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKSmartCardUserInteraction;
  result = -[TKSmartCardUserInteraction init](&v3, sel_init);
  if (result)
  {
    result->_initialTimeout = 0.0;
    result->_interactionTimeout = 0.0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteraction)initWithCoder:(id)a3
{
  id v4;
  TKSmartCardUserInteraction *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKSmartCardUserInteraction;
  v5 = -[TKSmartCardUserInteraction init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialTimeout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_initialTimeout = (double)objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interactionTimeout"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_interactionTimeout = (double)objc_msgSend(v7, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double initialTimeout;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  initialTimeout = self->_initialTimeout;
  v6 = a3;
  objc_msgSend(v4, "numberWithDouble:", initialTimeout);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("initialTimeout"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_interactionTimeout);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("interactionTimeout"));

}

- (void)runWithReply:(void *)reply
{
  (*((void (**)(void *, _QWORD, _QWORD))reply + 2))(reply, 0, 0);
}

- (BOOL)cancel
{
  return 0;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (NSTimeInterval)initialTimeout
{
  return self->_initialTimeout;
}

- (void)setInitialTimeout:(NSTimeInterval)initialTimeout
{
  self->_initialTimeout = initialTimeout;
}

- (NSTimeInterval)interactionTimeout
{
  return self->_interactionTimeout;
}

- (void)setInteractionTimeout:(NSTimeInterval)interactionTimeout
{
  self->_interactionTimeout = interactionTimeout;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
