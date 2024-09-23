@implementation BKUserProtectedConfiguration

- (BKUserProtectedConfiguration)initWithDictionary:(id)a3 effective:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BKUserProtectedConfiguration *v7;
  BKUserProtectedConfiguration *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSNumber *unlockEnabled;
  uint64_t v17;
  NSNumber *identificationEnabled;
  uint64_t v19;
  NSNumber *loginEnabled;
  uint64_t v21;
  NSNumber *applePayEnabled;
  uint64_t v23;
  NSNumber *attentionDetectionEnabled;
  uint64_t v25;
  NSNumber *periocularFaceIDMatchEnabled;
  objc_super v28;

  v4 = a4;
  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BKUserProtectedConfiguration;
  v7 = -[BKUserProtectedConfiguration init](&v28, sel_init);
  v8 = v7;
  if (v6 && v7)
  {
    if (v4)
      v9 = CFSTR("BKUserCfgEffectiveTouchIDUnlockEnabled");
    else
      v9 = CFSTR("BKUserCfgTouchIDUnlockEnabled");
    if (v4)
      v10 = CFSTR("BKUserCfgEffectiveTouchIDIdentificationEnabled");
    else
      v10 = CFSTR("BKUserCfgTouchIDIdentificationEnabled");
    if (v4)
      v11 = CFSTR("BKUserCfgEffectiveTouchIDLoginEnabled");
    else
      v11 = CFSTR("BKUserCfgTouchIDLoginEnabled");
    if (v4)
      v12 = CFSTR("BKUserCfgEffectiveTouchIDApplePayEnabled");
    else
      v12 = CFSTR("BKUserCfgTouchIDApplePayEnabled");
    if (v4)
      v13 = CFSTR("BKUserCfgEffectiveAttentionDetectionEnabled");
    else
      v13 = CFSTR("BKUserCfgAttentionDetectionEnabled");
    if (v4)
      v14 = CFSTR("BKUserCfgEffectivePeriocularMatchEnabled");
    else
      v14 = CFSTR("BKUserCfgPeriocularMatchEnabled");
    objc_msgSend(v6, "objectForKeyedSubscript:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    unlockEnabled = v8->_unlockEnabled;
    v8->_unlockEnabled = (NSNumber *)v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", v10);
    v17 = objc_claimAutoreleasedReturnValue();
    identificationEnabled = v8->_identificationEnabled;
    v8->_identificationEnabled = (NSNumber *)v17;

    objc_msgSend(v6, "objectForKeyedSubscript:", v11);
    v19 = objc_claimAutoreleasedReturnValue();
    loginEnabled = v8->_loginEnabled;
    v8->_loginEnabled = (NSNumber *)v19;

    objc_msgSend(v6, "objectForKeyedSubscript:", v12);
    v21 = objc_claimAutoreleasedReturnValue();
    applePayEnabled = v8->_applePayEnabled;
    v8->_applePayEnabled = (NSNumber *)v21;

    objc_msgSend(v6, "objectForKeyedSubscript:", v13);
    v23 = objc_claimAutoreleasedReturnValue();
    attentionDetectionEnabled = v8->_attentionDetectionEnabled;
    v8->_attentionDetectionEnabled = (NSNumber *)v23;

    objc_msgSend(v6, "objectForKeyedSubscript:", v14);
    v25 = objc_claimAutoreleasedReturnValue();
    periocularFaceIDMatchEnabled = v8->_periocularFaceIDMatchEnabled;
    v8->_periocularFaceIDMatchEnabled = (NSNumber *)v25;

  }
  return v8;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  NSNumber *unlockEnabled;
  NSNumber *identificationEnabled;
  NSNumber *loginEnabled;
  NSNumber *applePayEnabled;
  NSNumber *attentionDetectionEnabled;
  NSNumber *periocularFaceIDMatchEnabled;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  unlockEnabled = self->_unlockEnabled;
  if (unlockEnabled)
    objc_msgSend(v3, "setObject:forKey:", unlockEnabled, CFSTR("BKUserCfgTouchIDUnlockEnabled"));
  identificationEnabled = self->_identificationEnabled;
  if (identificationEnabled)
    objc_msgSend(v4, "setObject:forKey:", identificationEnabled, CFSTR("BKUserCfgTouchIDIdentificationEnabled"));
  loginEnabled = self->_loginEnabled;
  if (loginEnabled)
    objc_msgSend(v4, "setObject:forKey:", loginEnabled, CFSTR("BKUserCfgTouchIDLoginEnabled"));
  applePayEnabled = self->_applePayEnabled;
  if (applePayEnabled)
    objc_msgSend(v4, "setObject:forKey:", applePayEnabled, CFSTR("BKUserCfgTouchIDApplePayEnabled"));
  attentionDetectionEnabled = self->_attentionDetectionEnabled;
  if (attentionDetectionEnabled)
    objc_msgSend(v4, "setObject:forKey:", attentionDetectionEnabled, CFSTR("BKUserCfgAttentionDetectionEnabled"));
  periocularFaceIDMatchEnabled = self->_periocularFaceIDMatchEnabled;
  if (periocularFaceIDMatchEnabled)
    objc_msgSend(v4, "setObject:forKey:", periocularFaceIDMatchEnabled, CFSTR("BKUserCfgPeriocularMatchEnabled"));
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p:(unlockEnabled:%@, identificationEnabled:%@, loginEnabled:%@, applePayEnabled:%@, attentionDetectionEnabled:%@, periocularFaceIDMatchEnabled:%@)>"), v5, self, self->_unlockEnabled, self->_identificationEnabled, self->_loginEnabled, self->_applePayEnabled, self->_attentionDetectionEnabled, self->_periocularFaceIDMatchEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

- (NSNumber)applePayEnabled
{
  return self->_applePayEnabled;
}

- (void)setApplePayEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_applePayEnabled, a3);
}

- (NSNumber)attentionDetectionEnabled
{
  return self->_attentionDetectionEnabled;
}

- (void)setAttentionDetectionEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_attentionDetectionEnabled, a3);
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
  objc_storeStrong((id *)&self->_attentionDetectionEnabled, 0);
  objc_storeStrong((id *)&self->_applePayEnabled, 0);
  objc_storeStrong((id *)&self->_loginEnabled, 0);
  objc_storeStrong((id *)&self->_identificationEnabled, 0);
  objc_storeStrong((id *)&self->_unlockEnabled, 0);
}

@end
