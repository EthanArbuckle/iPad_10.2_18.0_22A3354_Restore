@implementation BKSystemProtectedConfiguration

- (BKSystemProtectedConfiguration)initWithDictionary:(id)a3
{
  id v4;
  BKSystemProtectedConfiguration *v5;
  BKSystemProtectedConfiguration *v6;
  uint64_t v7;
  NSNumber *biometryEnabled;
  uint64_t v9;
  NSNumber *unlockEnabled;
  uint64_t v11;
  NSNumber *identificationEnabled;
  uint64_t v13;
  NSNumber *loginEnabled;
  uint64_t v15;
  NSNumber *unlockTokenMaxLifetime;
  uint64_t v17;
  NSNumber *bioMatchLifespan;
  uint64_t v19;
  NSNumber *passcodeInputLifespan;
  uint64_t v21;
  NSNumber *periocularFaceIDMatchEnabled;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BKSystemProtectedConfiguration;
  v5 = -[BKSystemProtectedConfiguration init](&v24, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDEnabled"));
    v7 = objc_claimAutoreleasedReturnValue();
    biometryEnabled = v6->_biometryEnabled;
    v6->_biometryEnabled = (NSNumber *)v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDUnlockEnabled"));
    v9 = objc_claimAutoreleasedReturnValue();
    unlockEnabled = v6->_unlockEnabled;
    v6->_unlockEnabled = (NSNumber *)v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDIdentificationEnabled"));
    v11 = objc_claimAutoreleasedReturnValue();
    identificationEnabled = v6->_identificationEnabled;
    v6->_identificationEnabled = (NSNumber *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDLoginEnabled"));
    v13 = objc_claimAutoreleasedReturnValue();
    loginEnabled = v6->_loginEnabled;
    v6->_loginEnabled = (NSNumber *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDUnlockTokenMaxLifetime"));
    v15 = objc_claimAutoreleasedReturnValue();
    unlockTokenMaxLifetime = v6->_unlockTokenMaxLifetime;
    v6->_unlockTokenMaxLifetime = (NSNumber *)v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDBioMatchLifespan"));
    v17 = objc_claimAutoreleasedReturnValue();
    bioMatchLifespan = v6->_bioMatchLifespan;
    v6->_bioMatchLifespan = (NSNumber *)v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDPasscodeInputLifespan"));
    v19 = objc_claimAutoreleasedReturnValue();
    passcodeInputLifespan = v6->_passcodeInputLifespan;
    v6->_passcodeInputLifespan = (NSNumber *)v19;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BKSysCfgPeriocularMatchEnabled"));
    v21 = objc_claimAutoreleasedReturnValue();
    periocularFaceIDMatchEnabled = v6->_periocularFaceIDMatchEnabled;
    v6->_periocularFaceIDMatchEnabled = (NSNumber *)v21;

  }
  return v6;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  NSNumber *biometryEnabled;
  NSNumber *unlockEnabled;
  NSNumber *identificationEnabled;
  NSNumber *loginEnabled;
  NSNumber *unlockTokenMaxLifetime;
  NSNumber *bioMatchLifespan;
  NSNumber *passcodeInputLifespan;
  NSNumber *periocularFaceIDMatchEnabled;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  biometryEnabled = self->_biometryEnabled;
  if (biometryEnabled)
    objc_msgSend(v3, "setObject:forKey:", biometryEnabled, CFSTR("BKSysCfgTouchIDEnabled"));
  unlockEnabled = self->_unlockEnabled;
  if (unlockEnabled)
    objc_msgSend(v4, "setObject:forKey:", unlockEnabled, CFSTR("BKSysCfgTouchIDUnlockEnabled"));
  identificationEnabled = self->_identificationEnabled;
  if (identificationEnabled)
    objc_msgSend(v4, "setObject:forKey:", identificationEnabled, CFSTR("BKSysCfgTouchIDIdentificationEnabled"));
  loginEnabled = self->_loginEnabled;
  if (loginEnabled)
    objc_msgSend(v4, "setObject:forKey:", loginEnabled, CFSTR("BKSysCfgTouchIDLoginEnabled"));
  unlockTokenMaxLifetime = self->_unlockTokenMaxLifetime;
  if (unlockTokenMaxLifetime)
    objc_msgSend(v4, "setObject:forKey:", unlockTokenMaxLifetime, CFSTR("BKSysCfgTouchIDUnlockTokenMaxLifetime"));
  bioMatchLifespan = self->_bioMatchLifespan;
  if (bioMatchLifespan)
    objc_msgSend(v4, "setObject:forKey:", bioMatchLifespan, CFSTR("BKSysCfgTouchIDBioMatchLifespan"));
  passcodeInputLifespan = self->_passcodeInputLifespan;
  if (passcodeInputLifespan)
    objc_msgSend(v4, "setObject:forKey:", passcodeInputLifespan, CFSTR("BKSysCfgTouchIDPasscodeInputLifespan"));
  periocularFaceIDMatchEnabled = self->_periocularFaceIDMatchEnabled;
  if (periocularFaceIDMatchEnabled)
    objc_msgSend(v4, "setObject:forKey:", periocularFaceIDMatchEnabled, CFSTR("BKSysCfgPeriocularMatchEnabled"));
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p:(biometryEnabled:%@, unlockEnabled:%@, identificationEnabled:%@, loginEnabled:%@, unlockTokenMaxLifetime:%@, bioMatchLifespan:%@, passcodeInputLifespan:%@, periocularFaceIDMatchEnabled:%@)>"), v5, self, self->_biometryEnabled, self->_unlockEnabled, self->_identificationEnabled, self->_loginEnabled, self->_unlockTokenMaxLifetime, self->_bioMatchLifespan, self->_passcodeInputLifespan, self->_periocularFaceIDMatchEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)biometryEnabled
{
  return self->_biometryEnabled;
}

- (void)setBiometryEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_biometryEnabled, a3);
}

- (NSNumber)unlockEnabled
{
  return self->_unlockEnabled;
}

- (void)setUnlockEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_unlockEnabled, a3);
}

- (NSNumber)identificationEnabled
{
  return self->_identificationEnabled;
}

- (void)setIdentificationEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_identificationEnabled, a3);
}

- (NSNumber)loginEnabled
{
  return self->_loginEnabled;
}

- (void)setLoginEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_loginEnabled, a3);
}

- (NSNumber)unlockTokenMaxLifetime
{
  return self->_unlockTokenMaxLifetime;
}

- (void)setUnlockTokenMaxLifetime:(id)a3
{
  objc_storeStrong((id *)&self->_unlockTokenMaxLifetime, a3);
}

- (NSNumber)bioMatchLifespan
{
  return self->_bioMatchLifespan;
}

- (void)setBioMatchLifespan:(id)a3
{
  objc_storeStrong((id *)&self->_bioMatchLifespan, a3);
}

- (NSNumber)passcodeInputLifespan
{
  return self->_passcodeInputLifespan;
}

- (void)setPasscodeInputLifespan:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeInputLifespan, a3);
}

- (NSNumber)periocularFaceIDMatchEnabled
{
  return self->_periocularFaceIDMatchEnabled;
}

- (void)setPeriocularFaceIDMatchEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_periocularFaceIDMatchEnabled, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periocularFaceIDMatchEnabled, 0);
  objc_storeStrong((id *)&self->_passcodeInputLifespan, 0);
  objc_storeStrong((id *)&self->_bioMatchLifespan, 0);
  objc_storeStrong((id *)&self->_unlockTokenMaxLifetime, 0);
  objc_storeStrong((id *)&self->_loginEnabled, 0);
  objc_storeStrong((id *)&self->_identificationEnabled, 0);
  objc_storeStrong((id *)&self->_unlockEnabled, 0);
  objc_storeStrong((id *)&self->_biometryEnabled, 0);
}

@end
