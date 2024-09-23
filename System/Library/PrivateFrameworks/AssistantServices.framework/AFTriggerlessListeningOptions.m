@implementation AFTriggerlessListeningOptions

- (id)_initWithShowUIDuringListening:(BOOL)a3 playAlertBeforeListening:(BOOL)a4
{
  id result;

  result = -[AFTriggerlessListeningOptions init](self, "init");
  if (result)
  {
    *((_BYTE *)result + 8) = a3;
    *((_BYTE *)result + 9) = a4;
  }
  return result;
}

- (AFTriggerlessListeningOptions)initWithCoder:(id)a3
{
  id v4;
  AFTriggerlessListeningOptions *v5;

  v4 = a3;
  v5 = -[AFTriggerlessListeningOptions init](self, "init");
  if (v5)
  {
    v5->_showUIDuringListening = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_showUIDuringListening"));
    v5->_playAlertBeforeListening = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_playAlertBeforeListening"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 showUIDuringListening;
  id v5;

  showUIDuringListening = self->_showUIDuringListening;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", showUIDuringListening, CFSTR("_showUIDuringListening"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_playAlertBeforeListening, CFSTR("_playAlertBeforeListening"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setShowUIDuringListening:", self->_showUIDuringListening);
  objc_msgSend(v4, "setPlayAlertBeforeListening:", self->_playAlertBeforeListening);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AFTriggerlessListeningOptions;
  -[AFTriggerlessListeningOptions description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_showUIDuringListening);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_playAlertBeforeListening);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("showUIBeforeListening: %@, playAlertBeforeListening: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)showUIBeforeListening
{
  return self->_showUIDuringListening;
}

- (BOOL)beepBeforeListening
{
  return self->_playAlertBeforeListening;
}

- (double)delay
{
  return 0.0;
}

- (BOOL)showUIDuringListening
{
  return self->_showUIDuringListening;
}

- (void)setShowUIDuringListening:(BOOL)a3
{
  self->_showUIDuringListening = a3;
}

- (BOOL)playAlertBeforeListening
{
  return self->_playAlertBeforeListening;
}

- (void)setPlayAlertBeforeListening:(BOOL)a3
{
  self->_playAlertBeforeListening = a3;
}

- (double)endpointDelay
{
  return self->_endpointDelay;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
