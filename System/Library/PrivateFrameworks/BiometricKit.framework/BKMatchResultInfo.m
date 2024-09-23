@implementation BKMatchResultInfo

- (BKMatchResultInfo)initWithServerIdentity:(id)a3 details:(id)a4 device:(id)a5
{
  BKMatchResultInfo *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  BKMatchResultInfo *v13;
  BKIdentity *v14;
  BKIdentity *identity;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  NSObject *v24;
  objc_super v26;
  uint8_t buf[4];
  BKMatchResultInfo *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = (BKMatchResultInfo *)a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKMatchResultInfo::initWithServerIdentity:details:device: %@ %@ %@\n", buf, 0x20u);
  }
  v26.receiver = self;
  v26.super_class = (Class)BKMatchResultInfo;
  v13 = -[BKMatchResultInfo init](&v26, sel_init);
  if (v13)
  {
    if (v8)
    {
      v14 = -[BKIdentity initWithServerIdentity:device:]([BKIdentity alloc], "initWithServerIdentity:device:", v8, v10);
      identity = v13->_identity;
      v13->_identity = v14;

    }
    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BKMatchDetailLockoutState"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
        +[BKDevice lockoutState:fromDeviceLockoutState:error:](BKDevice, "lockoutState:fromDeviceLockoutState:error:", &v13->_lockoutState, objc_msgSend(v16, "integerValue"), 0);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BKMatchDetailUnlocked"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        v13->_unlocked = objc_msgSend(v18, "BOOLValue");
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BKMatchDetailCredentialAdded"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        v13->_credentialAdded = objc_msgSend(v19, "BOOLValue");
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BKMatchDetailResultIgnored"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        v13->_resultIgnored = objc_msgSend(v20, "BOOLValue");

    }
    if (__osLogTrace)
      v21 = __osLogTrace;
    else
      v21 = v11;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      v22 = v21;
      v23 = OS_LOG_TYPE_DEFAULT;
LABEL_29:
      _os_log_impl(&dword_1AF533000, v22, v23, "BKMatchResultInfo::initWithServerIdentity:details: -> %@\n", buf, 0xCu);
    }
  }
  else
  {
    if (__osLogTrace)
      v24 = __osLogTrace;
    else
      v24 = v11;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = 0;
      v22 = v24;
      v23 = OS_LOG_TYPE_ERROR;
      goto LABEL_29;
    }
  }

  return v13;
}

- (BKIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (int64_t)lockoutState
{
  return self->_lockoutState;
}

- (void)setLockoutState:(int64_t)a3
{
  self->_lockoutState = a3;
}

- (BOOL)unlocked
{
  return self->_unlocked;
}

- (void)setUnlocked:(BOOL)a3
{
  self->_unlocked = a3;
}

- (BOOL)credentialAdded
{
  return self->_credentialAdded;
}

- (void)setCredentialAdded:(BOOL)a3
{
  self->_credentialAdded = a3;
}

- (BOOL)resultIgnored
{
  return self->_resultIgnored;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
