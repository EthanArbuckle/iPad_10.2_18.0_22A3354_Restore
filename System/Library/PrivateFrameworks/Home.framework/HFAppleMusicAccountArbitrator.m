@implementation HFAppleMusicAccountArbitrator

- (HFAppleMusicAccountArbitrator)initWithAccessories:(id)a3 account:(id)a4 contextGenerator:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFAppleMusicAccountArbitrator *v12;
  uint64_t v13;
  NSSet *accessories;
  uint64_t v15;
  id contextGenerator;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAppleMusicAccountArbitrator.m"), 354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessories.count > 0"));

  }
  v19.receiver = self;
  v19.super_class = (Class)HFAppleMusicAccountArbitrator;
  v12 = -[HFAppleMusicAccountArbitrator init](&v19, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    accessories = v12->_accessories;
    v12->_accessories = (NSSet *)v13;

    objc_storeStrong((id *)&v12->_account, a4);
    v15 = objc_msgSend(v11, "copy");
    contextGenerator = v12->_contextGenerator;
    v12->_contextGenerator = (id)v15;

    v12->_loginType = 0;
  }

  return v12;
}

- (HFAppleMusicAccountArbitrator)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessories_account_contextGenerator_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAppleMusicAccountArbitrator.m"), 369, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAppleMusicAccountArbitrator init]",
    v5);

  return 0;
}

- (id)pendingArbitrationExecutionFuture
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  SEL v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  HFAppleMusicAccountArbitrator *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[HFAppleMusicAccountArbitrator activeArbitrationFuture](self, "activeArbitrationFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HFAppleMusicAccountArbitrator activeArbitrationFuture](self, "activeArbitrationFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[HFAppleMusicAccountArbitrator accessories](self, "accessories");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
  if (!v7)
    goto LABEL_12;
  v8 = v7;
  v9 = *(_QWORD *)v46;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v46 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      objc_msgSend(v11, "remoteLoginHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
      {
        v20 = (void *)MEMORY[0x1E0D519C0];
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v61[0] = CFSTR("accessory");
        v61[1] = CFSTR("accessories");
        v62[0] = v11;
        -[HFAppleMusicAccountArbitrator accessories](self, "accessories");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v62[1] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v21;
        v25 = 11;
LABEL_16:
        objc_msgSend(v24, "hf_errorWithCode:operation:options:", v25, CFSTR("AppleMusicAccountArbitratorLogin"), v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "futureWithError:", v27);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_26;
      }
      if ((objc_msgSend(v12, "isControllable") & 1) == 0)
      {
        v20 = (void *)MEMORY[0x1E0D519C0];
        v26 = (void *)MEMORY[0x1E0CB35C8];
        v59[0] = CFSTR("accessory");
        v59[1] = CFSTR("accessories");
        v60[0] = v11;
        -[HFAppleMusicAccountArbitrator accessories](self, "accessories");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v60[1] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v26;
        v25 = 12;
        goto LABEL_16;
      }

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
    if (v8)
      continue;
    break;
  }
LABEL_12:

  v14 = (void *)objc_opt_new();
  -[HFAppleMusicAccountArbitrator accessories](self, "accessories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __66__HFAppleMusicAccountArbitrator_pendingArbitrationExecutionFuture__block_invoke;
  v42[3] = &unk_1EA73E798;
  v42[4] = self;
  v44 = a2;
  v6 = v14;
  v43 = v6;
  objc_msgSend(v15, "na_each:", v42);

  -[HFAppleMusicAccountArbitrator account](self, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAppleMusicAccountArbitrator contextGenerator](self, "contextGenerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v18 = -[HFAppleMusicAccountArbitrator _resolvedLoginType:](self, "_resolvedLoginType:", &v41);
  v19 = v41;
  if (!v19)
  {
    if (v18 == 1)
    {
      v28 = v17;
      v17 = 0;
    }
    else
    {
      if (v18 != 2)
      {
LABEL_22:
        -[HFAppleMusicAccountArbitrator accessories](self, "accessories");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[_HFAppleMusicAccountArbitrationActionItem loginActionItemForAccessories:account:contextGenerator:](_HFAppleMusicAccountArbitrationActionItem, "loginActionItemForAccessories:account:contextGenerator:", v29, v16, v17);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "addObject:", v30);
        HFLogForCategory(0);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v50 = self;
          v51 = 2112;
          v52 = v32;
          v53 = 2112;
          v54 = v30;
          v55 = 2112;
          v56 = v16;
          v57 = 2112;
          v58 = v33;
          _os_log_impl(&dword_1DD34E000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@ Added Login plan = [%@] account = [%@] loginType = [%@]", buf, 0x34u);

        }
        objc_msgSend(v6, "na_map:", &__block_literal_global_127_2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)MEMORY[0x1E0D519C0];
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __66__HFAppleMusicAccountArbitrator_pendingArbitrationExecutionFuture__block_invoke_2;
        v39[3] = &unk_1EA728A78;
        v40 = v34;
        v36 = v34;
        objc_msgSend(v35, "lazyFutureWithBlock:", v39);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFAppleMusicAccountArbitrator setActiveArbitrationFuture:](self, "setActiveArbitrationFuture:", v37);

        -[HFAppleMusicAccountArbitrator activeArbitrationFuture](self, "activeArbitrationFuture");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_25;
      }
      v28 = v16;
      v16 = 0;
    }

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
  return v5;
}

void __66__HFAppleMusicAccountArbitrator_pendingArbitrationExecutionFuture__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "supportsMultiUser") & 1) == 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "forceLogout") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "account");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_HFAppleMusicAccountArbitrationActionItem logoutActionItemForAccessories:desiredAccount:](_HFAppleMusicAccountArbitrationActionItem, "logoutActionItemForAccessories:desiredAccount:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Added Logout plan for account = [%@]", (uint8_t *)&v10, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
}

uint64_t __66__HFAppleMusicAccountArbitrator_pendingArbitrationExecutionFuture__block_invoke_125(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "future");
}

void __66__HFAppleMusicAccountArbitrator_pendingArbitrationExecutionFuture__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D519C0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "chainFutures:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (id)objc_msgSend(v7, "addCompletionBlock:", v5);
}

- (int64_t)_resolvedLoginType:(id *)a3
{
  int64_t v5;
  int64_t v6;
  void *v7;
  int64_t result;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = -[HFAppleMusicAccountArbitrator loginType](self, "loginType");
  v6 = v5;
  if (!v5)
  {
    -[HFAppleMusicAccountArbitrator contextGenerator](self, "contextGenerator");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9
      || (v10 = (void *)v9,
          -[HFAppleMusicAccountArbitrator account](self, "account"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          !v11))
    {
      -[HFAppleMusicAccountArbitrator contextGenerator](self, "contextGenerator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        return 2;
      -[HFAppleMusicAccountArbitrator account](self, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        return 1;
      if (a3)
        goto LABEL_5;
    }
    return 0;
  }
  if (v5 != 1)
    return v6;
  -[HFAppleMusicAccountArbitrator account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  result = 1;
  if (a3 && !v7)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 9, CFSTR("Failed verification of login type"), 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  return result;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (id)contextGenerator
{
  return self->_contextGenerator;
}

- (int64_t)loginType
{
  return self->_loginType;
}

- (void)setLoginType:(int64_t)a3
{
  self->_loginType = a3;
}

- (BOOL)forceLogout
{
  return self->_forceLogout;
}

- (void)setForceLogout:(BOOL)a3
{
  self->_forceLogout = a3;
}

- (NAFuture)activeArbitrationFuture
{
  return self->_activeArbitrationFuture;
}

- (void)setActiveArbitrationFuture:(id)a3
{
  objc_storeStrong((id *)&self->_activeArbitrationFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeArbitrationFuture, 0);
  objc_storeStrong(&self->_contextGenerator, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
