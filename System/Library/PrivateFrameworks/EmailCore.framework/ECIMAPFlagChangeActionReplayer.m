@implementation ECIMAPFlagChangeActionReplayer

- (id)replayAction
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  ECLocalMessageActionResults *v25;
  void *v26;
  int v27;
  ECLocalMessageActionResults *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  const __CFString *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  -[ECLocalActionReplayer action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECIMAPFlagChangeActionReplayer.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.action isKindOfClass:[ECFlagChangeMessageAction class]]"));

  }
  -[ECLocalActionReplayer action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteIDs");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messages");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = v33;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "integerValue"));
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v9);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = v32;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "remoteID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");

        if (v17)
          objc_msgSend(v7, "addIndex:", v17);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "flagChange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECIMAPFlagChangeActionReplayer serverInterface](self, "serverInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "storeFlagChange:forUIDs:", v18, v7);

  }
  else
  {
    v20 = 1;
  }
  +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[ECLocalActionReplayer action](self, "action");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v7, "count");
    v24 = CFSTR("didn't work");
    *(_DWORD *)buf = 138543874;
    v43 = v22;
    if (v20)
      v24 = CFSTR("worked");
    v44 = 2048;
    v45 = v23;
    v46 = 2112;
    v47 = v24;
    _os_log_impl(&dword_1B9ADE000, v21, OS_LOG_TYPE_DEFAULT, "Replaying flag action %{public}@ for %lu uids %@", buf, 0x20u);

  }
  if (v20)
  {
    v25 = -[ECLocalMessageActionResults initWithError:]([ECLocalMessageActionResults alloc], "initWithError:", 0);
  }
  else
  {
    -[ECIMAPFlagChangeActionReplayer serverInterface](self, "serverInterface");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "hasValidConnection");

    if (v27)
    {
      v28 = [ECLocalMessageActionResults alloc];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECLocalActionReplayErrorDomain"), 1, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[ECLocalMessageActionResults initWithError:](v28, "initWithError:", v29);

    }
    else
    {
      v25 = 0;
    }
  }

  return v25;
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
