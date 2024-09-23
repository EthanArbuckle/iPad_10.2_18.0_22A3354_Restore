@implementation CXSetAllowUplinkAudioInjectionAction

- (CXSetAllowUplinkAudioInjectionAction)initWithCallUUID:(id)a3 willInject:(BOOL)a4
{
  CXSetAllowUplinkAudioInjectionAction *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXSetAllowUplinkAudioInjectionAction;
  result = -[CXCallAction initWithCallUUID:](&v6, sel_initWithCallUUID_, a3);
  if (result)
    result->_inject = a4;
  return result;
}

- (id)customDescription
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXSetAllowUplinkAudioInjectionAction;
  -[CXCallAction customDescription](&v5, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" willInject=%d"), -[CXSetAllowUplinkAudioInjectionAction willInject](self, "willInject"));
  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetAllowUplinkAudioInjectionAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v7, sel_updateCopy_withZone_, v6, a4);
  objc_msgSend(v6, "setInject:", -[CXSetAllowUplinkAudioInjectionAction willInject](self, "willInject", v7.receiver, v7.super_class));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetAllowUplinkAudioInjectionAction)initWithCoder:(id)a3
{
  id v4;
  CXSetAllowUplinkAudioInjectionAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetAllowUplinkAudioInjectionAction;
  v5 = -[CXCallAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_willInject);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_inject = objc_msgSend(v4, "decodeBoolForKey:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetAllowUplinkAudioInjectionAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[CXSetAllowUplinkAudioInjectionAction willInject](self, "willInject", v7.receiver, v7.super_class);
  NSStringFromSelector(sel_willInject);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

}

- (BOOL)willInject
{
  return self->_inject;
}

- (void)setInject:(BOOL)a3
{
  self->_inject = a3;
}

@end
