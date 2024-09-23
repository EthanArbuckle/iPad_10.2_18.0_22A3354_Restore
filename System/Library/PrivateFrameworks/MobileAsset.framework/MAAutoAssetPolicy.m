@implementation MAAutoAssetPolicy

- (MAAutoAssetPolicy)init
{
  char *v2;
  MAAutoAssetPolicy *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MAAutoAssetPolicy;
  v2 = -[MAAutoAssetPolicy init](&v6, sel_init);
  v3 = (MAAutoAssetPolicy *)v2;
  if (v2)
  {
    v2[8] = 0;
    *(_DWORD *)(v2 + 9) = 0;
    v2[13] = 0;
    *((_QWORD *)v2 + 2) = -1;
    *((_QWORD *)v2 + 3) = 0;
    v4 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 4) = 0;
    *((_QWORD *)v2 + 5) = 0;

  }
  return v3;
}

- (MAAutoAssetPolicy)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetPolicy *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *additionalPolicyControl;
  objc_super v12;
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MAAutoAssetPolicy;
  v5 = -[MAAutoAssetPolicy init](&v12, sel_init);
  if (v5)
  {
    v5->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInitiated"));
    v5->_waitForNewestSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("waitForNewestSecs"));
    v5->_interestAcrossTermination = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("interestAcrossTermination"));
    v5->_lockAcrossTermination = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lockAcrossTermination"));
    v5->_lockAcrossReboot = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lockAcrossReboot"));
    v5->_lockAcrossOTAUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lockAcrossOTAUpdate"));
    v5->_lockInhibitsEmergencyRemoval = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lockInhibitsEmergencyRemoval"));
    v5->_unlockAfterUsageSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("unlockAfterUsageSecs"));
    v5->_preventGarbageCollectionSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preventGarbageCollectionSecs"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    v13[5] = objc_opt_class();
    v13[6] = objc_opt_class();
    v13[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("additionalPolicyControl"));
    v9 = objc_claimAutoreleasedReturnValue();
    additionalPolicyControl = v5->_additionalPolicyControl;
    v5->_additionalPolicyControl = (NSDictionary *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetPolicy userInitiated](self, "userInitiated"), CFSTR("userInitiated"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetPolicy waitForNewestSecs](self, "waitForNewestSecs"), CFSTR("waitForNewestSecs"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetPolicy interestAcrossTermination](self, "interestAcrossTermination"), CFSTR("interestAcrossTermination"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetPolicy lockAcrossTermination](self, "lockAcrossTermination"), CFSTR("lockAcrossTermination"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetPolicy lockAcrossReboot](self, "lockAcrossReboot"), CFSTR("lockAcrossReboot"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetPolicy lockAcrossOTAUpdate](self, "lockAcrossOTAUpdate"), CFSTR("lockAcrossOTAUpdate"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"), CFSTR("lockInhibitsEmergencyRemoval"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetPolicy unlockAfterUsageSecs](self, "unlockAfterUsageSecs"), CFSTR("unlockAfterUsageSecs"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetPolicy preventGarbageCollectionSecs](self, "preventGarbageCollectionSecs"), CFSTR("preventGarbageCollectionSecs"));
  -[MAAutoAssetPolicy additionalPolicyControl](self, "additionalPolicyControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("additionalPolicyControl"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MAAutoAssetPolicy additionalPolicyControl](self, "additionalPolicyControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[MAAutoAssetPolicy summary](self, "summary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetPolicy additionalPolicyControl](self, "additionalPolicyControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@|additional:\n%@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MAAutoAssetPolicy summary](self, "summary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)summary
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  -[MAAutoAssetPolicy additionalPolicyControl](self, "additionalPolicyControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("(w/additional)");
  if (!v3)
    v4 = &stru_1E5D5F930;
  v5 = v4;

  if (-[MAAutoAssetPolicy interestAcrossTermination](self, "interestAcrossTermination")
    && -[MAAutoAssetPolicy lockAcrossTermination](self, "lockAcrossTermination")
    && -[MAAutoAssetPolicy lockAcrossReboot](self, "lockAcrossReboot")
    && -[MAAutoAssetPolicy lockAcrossOTAUpdate](self, "lockAcrossOTAUpdate")
    && -[MAAutoAssetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"))
  {
    v6 = CFSTR("allOtherBool:Y");
  }
  else if (-[MAAutoAssetPolicy interestAcrossTermination](self, "interestAcrossTermination")
         || -[MAAutoAssetPolicy lockAcrossTermination](self, "lockAcrossTermination")
         || -[MAAutoAssetPolicy lockAcrossReboot](self, "lockAcrossReboot")
         || -[MAAutoAssetPolicy lockAcrossOTAUpdate](self, "lockAcrossOTAUpdate")
         || -[MAAutoAssetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"))
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (-[MAAutoAssetPolicy interestAcrossTermination](self, "interestAcrossTermination"))
      v8 = CFSTR("Y");
    else
      v8 = CFSTR("N");
    if (-[MAAutoAssetPolicy lockAcrossTermination](self, "lockAcrossTermination"))
      v9 = CFSTR("Y");
    else
      v9 = CFSTR("N");
    if (-[MAAutoAssetPolicy lockAcrossReboot](self, "lockAcrossReboot"))
      v10 = CFSTR("Y");
    else
      v10 = CFSTR("N");
    if (-[MAAutoAssetPolicy lockAcrossOTAUpdate](self, "lockAcrossOTAUpdate"))
      v11 = CFSTR("Y");
    else
      v11 = CFSTR("N");
    if (-[MAAutoAssetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"))
      v12 = CFSTR("Y");
    else
      v12 = CFSTR("N");
    v6 = (__CFString *)objc_msgSend(v7, "initWithFormat:", CFSTR("interestAcrossTerm:%@|lock(AcrossTerm:%@|AcrossReboot:%@|AcrossOTA:%@|InhibitsRemoval:%@)"), v8, v9, v10, v11, v12);
  }
  else
  {
    v6 = CFSTR("allOtherBool:N");
  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  if (-[MAAutoAssetPolicy userInitiated](self, "userInitiated"))
    v14 = CFSTR("Y");
  else
    v14 = CFSTR("N");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("user:%@|waitNewestSecs:%ld|%@|unlockAfterSecs:%ld|preventGCSecs:%ld%@"), v14, -[MAAutoAssetPolicy waitForNewestSecs](self, "waitForNewestSecs"), v6, -[MAAutoAssetPolicy unlockAfterUsageSecs](self, "unlockAfterUsageSecs"), -[MAAutoAssetPolicy preventGarbageCollectionSecs](self, "preventGarbageCollectionSecs"), v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)newSummaryDictionary
{
  id v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[MAAutoAssetPolicy userInitiated](self, "userInitiated"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v4, CFSTR("userInitiated"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetPolicy waitForNewestSecs](self, "waitForNewestSecs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v5, CFSTR("waitForNewestSecs"));

  if (-[MAAutoAssetPolicy interestAcrossTermination](self, "interestAcrossTermination"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v6, CFSTR("interestAcrossTermination"));
  if (-[MAAutoAssetPolicy lockAcrossTermination](self, "lockAcrossTermination"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v7, CFSTR("lockAcrossTermination"));
  if (-[MAAutoAssetPolicy lockAcrossReboot](self, "lockAcrossReboot"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v8, CFSTR("lockAcrossReboot"));
  if (-[MAAutoAssetPolicy lockAcrossOTAUpdate](self, "lockAcrossOTAUpdate"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v9, CFSTR("lockAcrossOTAUpdate"));
  if (-[MAAutoAssetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v10, CFSTR("lockInhibitsEmergencyRemoval"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetPolicy unlockAfterUsageSecs](self, "unlockAfterUsageSecs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v11, CFSTR("unlockAfterUsageSecs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetPolicy preventGarbageCollectionSecs](self, "preventGarbageCollectionSecs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v12, CFSTR("preventGarbageCollectionSecs"));

  -[MAAutoAssetPolicy additionalPolicyControl](self, "additionalPolicyControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v14, CFSTR("additionalPolicyControl"));

  return v3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (int64_t)waitForNewestSecs
{
  return self->_waitForNewestSecs;
}

- (void)setWaitForNewestSecs:(int64_t)a3
{
  self->_waitForNewestSecs = a3;
}

- (BOOL)interestAcrossTermination
{
  return self->_interestAcrossTermination;
}

- (void)setInterestAcrossTermination:(BOOL)a3
{
  self->_interestAcrossTermination = a3;
}

- (BOOL)lockAcrossTermination
{
  return self->_lockAcrossTermination;
}

- (void)setLockAcrossTermination:(BOOL)a3
{
  self->_lockAcrossTermination = a3;
}

- (BOOL)lockAcrossReboot
{
  return self->_lockAcrossReboot;
}

- (void)setLockAcrossReboot:(BOOL)a3
{
  self->_lockAcrossReboot = a3;
}

- (BOOL)lockAcrossOTAUpdate
{
  return self->_lockAcrossOTAUpdate;
}

- (void)setLockAcrossOTAUpdate:(BOOL)a3
{
  self->_lockAcrossOTAUpdate = a3;
}

- (BOOL)lockInhibitsEmergencyRemoval
{
  return self->_lockInhibitsEmergencyRemoval;
}

- (void)setLockInhibitsEmergencyRemoval:(BOOL)a3
{
  self->_lockInhibitsEmergencyRemoval = a3;
}

- (int64_t)unlockAfterUsageSecs
{
  return self->_unlockAfterUsageSecs;
}

- (void)setUnlockAfterUsageSecs:(int64_t)a3
{
  self->_unlockAfterUsageSecs = a3;
}

- (int64_t)preventGarbageCollectionSecs
{
  return self->_preventGarbageCollectionSecs;
}

- (void)setPreventGarbageCollectionSecs:(int64_t)a3
{
  self->_preventGarbageCollectionSecs = a3;
}

- (NSDictionary)additionalPolicyControl
{
  return self->_additionalPolicyControl;
}

- (void)setAdditionalPolicyControl:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPolicyControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPolicyControl, 0);
}

@end
