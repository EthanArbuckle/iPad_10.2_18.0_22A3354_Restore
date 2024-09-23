@implementation LAPSPasscodePersistenceMKBAdapter

- (BOOL)isPasscodeLockedOut
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;

  v2 = (void *)MKBGetDeviceLockStateInfo();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE67218]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &unk_24FDDD9E8;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = objc_msgSend(v6, "unsignedIntValue");
  return (v7 >> 3) & 1;
}

- (id)backoffTimeout
{
  return -[LAPSPasscodePersistenceMKBAdapter _deviceLockStateValueForKey:](self, "_deviceLockStateValueForKey:", *MEMORY[0x24BE67210]);
}

- (id)failedPasscodeAttempts
{
  return -[LAPSPasscodePersistenceMKBAdapter _deviceLockStateValueForKey:](self, "_deviceLockStateValueForKey:", *MEMORY[0x24BE67220]);
}

- (id)verifyPasscode:(id)a3
{
  return -[LAPSPasscodePersistenceMKBAdapter _verifyPasscode:options:](self, "_verifyPasscode:options:", a3, 0);
}

- (id)failedPasscodeRecoveryAttempts
{
  return -[LAPSPasscodePersistenceMKBAdapter _mementoStateValueForKey:](self, "_mementoStateValueForKey:", CFSTR("MementoBlobFailedAttempts"));
}

- (id)maxPasscodeRecoveryAttempts
{
  return -[LAPSPasscodePersistenceMKBAdapter _mementoStateValueForKey:](self, "_mementoStateValueForKey:", CFSTR("MementoBlobMaxUnlockAttempts"));
}

- (id)verifyRecoveryPasscode:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("UseMementoBlob");
  v10[0] = MEMORY[0x24BDBD1C8];
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodePersistenceMKBAdapter _verifyPasscode:options:](self, "_verifyPasscode:options:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_verifyPasscode:(id)a3 options:(id)a4
{
  return -[LAPSPasscodePersistenceMKBAdapter _persistenceErrorWithPasscodeVerificationStatus:](self, "_persistenceErrorWithPasscodeVerificationStatus:", MKBVerifyPasswordWithContext());
}

- (id)_persistenceErrorWithPasscodeVerificationStatus:(int)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    if (a3 == -3)
    {
      +[LAPSErrorBuilder invalidPasscodeError](LAPSErrorBuilder, "invalidPasscodeError");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Passcode verification failed (status: %d)"), *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[LAPSErrorBuilder genericErrorWithDebugDescription:](LAPSErrorBuilder, "genericErrorWithDebugDescription:", v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_mementoStateValueForKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (MKBKeyBagMementoGetBlobState())
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(0, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_deviceLockStateValueForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)MKBGetDeviceLockStateInfo();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
