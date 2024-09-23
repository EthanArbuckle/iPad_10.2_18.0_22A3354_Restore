@implementation ECIMAPFlagChangeUndownloadedActionReplayer

- (id)replayAction
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  ECLocalMessageActionResults *v17;
  void *v18;
  int v19;
  ECLocalMessageActionResults *v20;
  void *v21;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[ECLocalActionReplayer action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECIMAPFlagChangeUndownloadedActionReplayer.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.action isKindOfClass:[ECFlagChangeUndownloadedMessageAction class]]"));

  }
  -[ECLocalActionReplayer action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flagChange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oldestPersistedRemoteID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue") - 1;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECIMAPFlagChangeUndownloadedActionReplayer serverInterface](self, "serverInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "storeFlagChange:forUIDs:", v7, v10);

  +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[ECLocalActionReplayer action](self, "action");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "count");
    v16 = CFSTR("didn't work");
    *(_DWORD *)buf = 138543874;
    v25 = v14;
    if (v12)
      v16 = CFSTR("worked");
    v26 = 2048;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_1B9ADE000, v13, OS_LOG_TYPE_DEFAULT, "Replaying flag action %{public}@ for %lu uids %@", buf, 0x20u);

  }
  if (v12)
  {
    v17 = -[ECLocalMessageActionResults initWithError:]([ECLocalMessageActionResults alloc], "initWithError:", 0);
  }
  else
  {
    -[ECIMAPFlagChangeUndownloadedActionReplayer serverInterface](self, "serverInterface");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hasValidConnection");

    if (v19)
    {
      v20 = [ECLocalMessageActionResults alloc];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECLocalActionReplayErrorDomain"), 1, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[ECLocalMessageActionResults initWithError:](v20, "initWithError:", v21);

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (ECIMAPServerInterface)serverInterface
{
  return self->serverInterface;
}

- (void)setServerInterface:(id)a3
{
  objc_storeStrong((id *)&self->serverInterface, a3);
}

- (ECIMAPLocalActionReplayerDelegate)delegate
{
  return (ECIMAPLocalActionReplayerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->serverInterface, 0);
}

@end
