@implementation ECGmailLabelChangeReplayer

- (id)replayAction
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  ECLocalMessageActionResults *v25;
  void *v26;
  int v27;
  ECLocalMessageActionResults *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[ECLocalActionReplayer action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECGmailLabelChangeReplayer.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[labelChangeAction isKindOfClass:[ECLabelChangeMessageAction class]]"));

  }
  objc_msgSend(v4, "remoteIDs");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messages");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = v34;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "integerValue"));
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v7);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = v33;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "remoteID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue");

        if (v15)
          objc_msgSend(v5, "addIndex:", v15);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v11);
  }

  objc_msgSend(v4, "labelsToAdd");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "valueForKey:", CFSTR("labelName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "labelsToRemove");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueForKey:", CFSTR("labelName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    -[ECGmailLabelChangeReplayer serverInterface](self, "serverInterface");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "storeGmailLabels:state:forUIDs:", v17, 1, v5);

    if (!v22)
      goto LABEL_24;
  }
  if (objc_msgSend(v20, "count")
    && (-[ECGmailLabelChangeReplayer serverInterface](self, "serverInterface"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v23, "storeGmailLabels:state:forUIDs:", v20, 0, v5),
        v23,
        !v24))
  {
LABEL_24:
    -[ECGmailLabelChangeReplayer serverInterface](self, "serverInterface");
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
  else
  {
    v25 = -[ECLocalMessageActionResults initWithError:]([ECLocalMessageActionResults alloc], "initWithError:", 0);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->serverInterface, 0);
}

@end
