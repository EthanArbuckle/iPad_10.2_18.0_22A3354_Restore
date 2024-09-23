@implementation CNTCCVersion1

- (int64_t)checkAuthorizationStatusOfCurrentProcess
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;

  if (checkAuthorizationStatusOfCurrentProcess_cn_once_token_1 != -1)
    dispatch_once(&checkAuthorizationStatusOfCurrentProcess_cn_once_token_1, &__block_literal_global_29);
  v3 = (id)checkAuthorizationStatusOfCurrentProcess_cn_once_object_1;
  -[CNTCCVersion1 simulateStatus](self, "simulateStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNTCCVersion1 simulateStatus](self, "simulateStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");
LABEL_8:

    goto LABEL_9;
  }
  if (!-[CNTCCVersion1 isUnitTesting](self, "isUnitTesting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", TCCAccessPreflight());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "integerValue");

    goto LABEL_8;
  }
  v6 = 3;
LABEL_9:

  return v6;
}

void __57__CNTCCVersion1_checkAuthorizationStatusOfCurrentProcess__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E29EFF98;
  v3[1] = &unk_1E29EFFC8;
  v4[0] = &unk_1E29EFFB0;
  v4[1] = &unk_1E29EFFE0;
  v3[2] = &unk_1E29EFFF8;
  v4[2] = &unk_1E29F0010;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)checkAuthorizationStatusOfCurrentProcess_cn_once_object_1;
  checkAuthorizationStatusOfCurrentProcess_cn_once_object_1 = v1;

}

- (int64_t)checkAuthorizationStatusOfAuditToken:(id *)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[CNTCCVersion1 simulateStatus](self, "simulateStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNTCCVersion1 simulateStatus](self, "simulateStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    return v6;
  }
  else if (-[CNTCCVersion1 isUnitTesting](self, "isUnitTesting"))
  {
    return 3;
  }
  else if (TCCAccessCheckAuditToken())
  {
    return 3;
  }
  else
  {
    return 1;
  }
}

- (int64_t)checkAuthorizationStatusOfAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  int64_t v9;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    if (v6)
    {
      objc_msgSend(v6, "audit_token");
      v9 = -[CNTCCVersion1 checkAuthorizationStatusOfAuditToken:](self, "checkAuthorizationStatusOfAuditToken:", &v11);
    }
    else
    {
      v9 = -[CNTCCVersion1 checkAuthorizationStatusOfCurrentProcess](self, "checkAuthorizationStatusOfCurrentProcess");
    }
    v8 = v9;
  }

  return v8;
}

- (BOOL)isAuthorizationRestricted
{
  void *v3;

  -[CNTCCVersion1 simulateStatus](self, "simulateStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 && !-[CNTCCVersion1 isUnitTesting](self, "isUnitTesting") && TCCAccessRestricted() != 0;
}

- (void)requestAuthorization:(int64_t)a3 auditToken:(id)a4 assumedIdentity:(id)a5 completionHandler:(id)a6
{
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void (**v10)(id, uint64_t);

  v7 = (void (**)(id, uint64_t))a6;
  -[CNTCCVersion1 simulateStatus](self, "simulateStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNTCCVersion1 simulateStatus](self, "simulateStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, objc_msgSend(v9, "integerValue"));

  }
  else if (-[CNTCCVersion1 isUnitTesting](self, "isUnitTesting"))
  {
    v7[2](v7, 3);
  }
  else
  {
    v10 = v7;
    TCCAccessRequest();

  }
}

uint64_t __83__CNTCCVersion1_requestAuthorization_auditToken_assumedIdentity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)bundleIdentifierForAuditToken:(id)a3 assumedIdentity:(id)a4
{
  return 0;
}

+ (id)bundleIdentifierForIdentity:(id)a3
{
  return 0;
}

- (id)authorizationRecords
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v3 = (void *)TCCAccessCopyInformation();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__CNTCCVersion1_authorizationRecords__block_invoke;
  v6[3] = &unk_1E29BA030;
  v6[4] = self;
  objc_msgSend(v3, "_cn_compactMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __37__CNTCCVersion1_authorizationRecords__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "createAppAuthorizationRecordFromTCCAppInfo:bundleIdentifier:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  CNNilToNull_block_invoke_2((uint64_t)&__block_literal_global_1_2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)authorizationRecordForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)TCCAccessCopyInformationForBundleId();
  objc_msgSend(v4, "_cn_firstObjectPassingTest:", &__block_literal_global_12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "createAppAuthorizationRecordFromTCCAppInfo:bundleIdentifier:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL __56__CNTCCVersion1_authorizationRecordForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB10B8]);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return CFStringCompare(v2, (CFStringRef)*MEMORY[0x1E0DB10D0], 1uLL) == kCFCompareEqualTo;
}

- (void)saveAuthorizationRecord:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "authorizationStatus");
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CNTCCVersion1 setAuthorizationStatus:forBundleIdentifier:noKillApp:](self, "setAuthorizationStatus:forBundleIdentifier:noKillApp:", v5, v6, 0);
}

- (void)setAuthorizationStatus:(int64_t)a3 forBundleIdentifier:(id)a4 noKillApp:(BOOL)a5
{
  TCCAccessSetForBundleId();
}

+ (id)createAppAuthorizationRecordFromTCCAppInfo:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CNTCCAppAuthorizationRecord *v14;

  v5 = a4;
  v6 = *MEMORY[0x1E0DB1098];
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DB10A8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && v8)
  {
    CFBundleGetIdentifier((CFBundleRef)v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && objc_msgSend(v11, "length"))
    {
      if (CFBooleanGetValue((CFBooleanRef)v9))
        v13 = 3;
      else
        v13 = 1;
      v14 = -[CNTCCAppAuthorizationRecord initWithBundleIdentifier:localizedName:recordType:authorizationStatus:]([CNTCCAppAuthorizationRecord alloc], "initWithBundleIdentifier:localizedName:recordType:authorizationStatus:", v5, v12, 0, v13);
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)simulateStatus:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNTCCVersion1 setSimulateStatus:](self, "setSimulateStatus:", v4);

}

- (void)stopSimulation
{
  -[CNTCCVersion1 setSimulateStatus:](self, "setSimulateStatus:", 0);
}

- (BOOL)isUnitTesting
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CNTCCVersion1_isUnitTesting__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  cn_objectResultWithObjectLock(self, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

id __30__CNTCCVersion1_isUnitTesting__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    objc_msgSend(v2, "isUnitTestingImpl");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return v3;
}

- (id)isUnitTestingImpl
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executablePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("CNTestsHostiOS")) & 1) != 0
    || (objc_msgSend(v3, "hasSuffix:", CFSTR("CNTestsHostiOS_XPC")) & 1) != 0
    || (objc_msgSend(v3, "hasSuffix:", CFSTR("otest")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("xctest"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSNumber)simulateStatus
{
  return self->_simulateStatus;
}

- (void)setSimulateStatus:(id)a3
{
  objc_storeStrong((id *)&self->_simulateStatus, a3);
}

- (NSNumber)isUnitTestingCachedValue
{
  return self->_isUnitTestingCachedValue;
}

- (void)setIsUnitTestingCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->_isUnitTestingCachedValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isUnitTestingCachedValue, 0);
  objc_storeStrong((id *)&self->_simulateStatus, 0);
}

@end
