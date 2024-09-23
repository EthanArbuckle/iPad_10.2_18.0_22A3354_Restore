@implementation CXSetRelayingCallAction

- (CXSetRelayingCallAction)initWithCallUUID:(id)a3 relaying:(BOOL)a4
{
  CXSetRelayingCallAction *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXSetRelayingCallAction;
  result = -[CXCallAction initWithCallUUID:](&v6, sel_initWithCallUUID_, a3);
  if (result)
    result->_relaying = a4;
  return result;
}

- (id)customDescription
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXSetRelayingCallAction;
  -[CXCallAction customDescription](&v5, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" relaying=%d"), -[CXSetRelayingCallAction isRelaying](self, "isRelaying"));
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
  v7.super_class = (Class)CXSetRelayingCallAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v7, sel_updateCopy_withZone_, v6, a4);
  objc_msgSend(v6, "setRelaying:", -[CXSetRelayingCallAction isRelaying](self, "isRelaying", v7.receiver, v7.super_class));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetRelayingCallAction)initWithCoder:(id)a3
{
  id v4;
  CXSetRelayingCallAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetRelayingCallAction;
  v5 = -[CXCallAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_isRelaying);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_relaying = objc_msgSend(v4, "decodeBoolForKey:", v6);

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
  v7.super_class = (Class)CXSetRelayingCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[CXSetRelayingCallAction isRelaying](self, "isRelaying", v7.receiver, v7.super_class);
  NSStringFromSelector(sel_isRelaying);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

}

- (BOOL)isRelaying
{
  return self->_relaying;
}

- (void)setRelaying:(BOOL)a3
{
  self->_relaying = a3;
}

@end
