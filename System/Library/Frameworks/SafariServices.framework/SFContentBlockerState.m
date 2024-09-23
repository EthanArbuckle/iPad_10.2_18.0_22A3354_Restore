@implementation SFContentBlockerState

- (SFContentBlockerState)initWithEnabledState:(BOOL)a3
{
  SFContentBlockerState *v4;
  SFContentBlockerState *v5;
  SFContentBlockerState *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFContentBlockerState;
  v4 = -[SFContentBlockerState init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_enabled = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFContentBlockerState)initWithCoder:(id)a3
{
  return -[SFContentBlockerState initWithEnabledState:](self, "initWithEnabledState:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("enabled")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
