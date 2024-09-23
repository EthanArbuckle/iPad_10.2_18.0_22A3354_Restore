@implementation CNQueryAnalyticsLogger

- (void)recordQueryWithFetchRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  __CFString *v21;

  v4 = a3;
  objc_msgSend(v4, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    objc_msgSend(v4, "keyboardState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "keyboardState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "integerValue");
    }
    else
    {
      -[CNQueryAnalyticsLogger keyboardStateMonitor](self, "keyboardStateMonitor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "keyboardState");
    }

    -[CNQueryAnalyticsLogger assumedIdentity](self, "assumedIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[CNQueryAnalyticsLogger assumedIdentity](self, "assumedIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (__CFString *)tcc_object_copy_description();

    }
    else
    {
      v11 = &stru_1E29FF900;
    }

    -[CNQueryAnalyticsLogger processIdentity](self, "processIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "first");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "second");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v11;
    v19 = v6;
    v20 = v13;
    v15 = v11;
    v16 = v14;
    v17 = v13;
    v18 = v6;
    AnalyticsSendEventLazy();

  }
}

- (CNPair)processIdentity
{
  cn_objectResultWithObjectLock();
  return (CNPair *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNKeyboardStateMonitor)keyboardStateMonitor
{
  return self->_keyboardStateMonitor;
}

- (OS_tcc_identity)assumedIdentity
{
  return self->_assumedIdentity;
}

- (CNQueryAnalyticsLogger)initWithAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v7;
  id v8;
  CNQueryAnalyticsLogger *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  CNKeyboardStateMonitor *keyboardStateMonitor;
  CNQueryAnalyticsLogger *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNQueryAnalyticsLogger;
  v9 = -[CNQueryAnalyticsLogger init](&v18, sel_init);
  if (v9
    && (objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "featureFlags"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isFeatureEnabled:", 2),
        v11,
        v10,
        v12))
  {
    objc_storeStrong((id *)&v9->_auditToken, a3);
    objc_storeStrong((id *)&v9->_assumedIdentity, a4);
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keyboardStateMonitor");
    v14 = objc_claimAutoreleasedReturnValue();
    keyboardStateMonitor = v9->_keyboardStateMonitor;
    v9->_keyboardStateMonitor = (CNKeyboardStateMonitor *)v14;

    v16 = v9;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id __54__CNQueryAnalyticsLogger_recordQueryWithFetchRequest___block_invoke(uint64_t a1)
{
  unint64_t v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  __CFString *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[3];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("keyboardState");
  v2 = *(_QWORD *)(a1 + 64);
  if (v2 > 3)
    v3 = CFSTR("INVALID");
  else
    v3 = off_1E29F8E30[v2];
  v11[0] = v3;
  v10[1] = CFSTR("hasHighSpecificity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "cn_hasHighSpecificity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("predicateClass");
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("(Null)");
  }
  v11[2] = v7;
  v12 = *(_OWORD *)(a1 + 40);
  v10[3] = CFSTR("processIdentity");
  v10[4] = CFSTR("processIdentityType");
  v10[5] = CFSTR("assumedIdentity");
  v13 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)

  return v8;
}

id __41__CNQueryAnalyticsLogger_processIdentity__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (!v3)
  {
    objc_msgSend(v2, "auditToken");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D13998], "bundleIdentifierForAuditToken:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v5, CFSTR("b"));
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D13998], "processNameForAuditToken:", v4);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = CFSTR("p");
          v12 = v10;
        }
        else
        {
          v12 = &stru_1E29FF900;
          v11 = CFSTR("u");
        }
        objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v12, v11);
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = 0;
      }
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0D13AF8];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pairWithFirst:second:", v9, CFSTR("p"));
      v7 = objc_claimAutoreleasedReturnValue();

    }
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 8);
    *(_QWORD *)(v13 + 8) = v7;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  return v3;
}

- (CNAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardStateMonitor, 0);
  objc_storeStrong((id *)&self->_assumedIdentity, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
}

- (void)setProcessIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (void)setAssumedIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_assumedIdentity, a3);
}

- (void)setKeyboardStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardStateMonitor, a3);
}

@end
