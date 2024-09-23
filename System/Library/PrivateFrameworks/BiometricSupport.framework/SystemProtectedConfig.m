@implementation SystemProtectedConfig

- (SystemProtectedConfig)init
{
  SystemProtectedConfig *result;
  __int128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SystemProtectedConfig;
  result = -[SystemProtectedConfig init](&v4, sel_init);
  if (result)
  {
    *(_QWORD *)&v3 = -1;
    *((_QWORD *)&v3 + 1) = -1;
    *(_OWORD *)&result->_unlockTokenMaxLifetime = v3;
    *(_OWORD *)&result->_biometryEnabled = v3;
  }
  return result;
}

- (int)biometryEnabled
{
  return self->_biometryEnabled;
}

- (void)setBiometryEnabled:(int)a3
{
  self->_biometryEnabled = a3;
}

- (int)unlockEnabled
{
  return self->_unlockEnabled;
}

- (void)setUnlockEnabled:(int)a3
{
  self->_unlockEnabled = a3;
}

- (int)identificationEnabled
{
  return self->_identificationEnabled;
}

- (void)setIdentificationEnabled:(int)a3
{
  self->_identificationEnabled = a3;
}

- (int)loginEnabled
{
  return self->_loginEnabled;
}

- (void)setLoginEnabled:(int)a3
{
  self->_loginEnabled = a3;
}

- (int)unlockTokenMaxLifetime
{
  return self->_unlockTokenMaxLifetime;
}

- (void)setUnlockTokenMaxLifetime:(int)a3
{
  self->_unlockTokenMaxLifetime = a3;
}

- (int)bioMatchLifespan
{
  return self->_bioMatchLifespan;
}

- (void)setBioMatchLifespan:(int)a3
{
  self->_bioMatchLifespan = a3;
}

- (int)passcodeInputLifespan
{
  return self->_passcodeInputLifespan;
}

- (void)setPasscodeInputLifespan:(int)a3
{
  self->_passcodeInputLifespan = a3;
}

- (int)periocularMatchEnabled
{
  return self->_periocularMatchEnabled;
}

- (void)setPeriocularMatchEnabled:(int)a3
{
  self->_periocularMatchEnabled = a3;
}

@end
