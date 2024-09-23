@implementation IPProgressServerDefaultBehavior

- (IPProgressServerDefaultBehavior)initWithTransport:(id)a3 stateUpdateSink:(id)a4
{
  id v7;
  id v8;
  IPProgressServerDefaultBehavior *v9;
  IPProgressServerDefaultBehavior *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IPProgressServerDefaultBehavior;
  v9 = -[IPProgressServerDefaultBehavior init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transport, a3);
    -[IPServerXPCTransport setDelegate:](v10->_transport, "setDelegate:", v10);
    objc_storeStrong((id *)&v10->_stateSink, a4);
  }

  return v10;
}

- (void)resume
{
  NSObject *v3;
  IPServerXPCTransport *transport;
  int v5;
  IPServerXPCTransport *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _IPServerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    transport = self->_transport;
    v5 = 138412290;
    v6 = transport;
    _os_log_impl(&dword_23F108000, v3, OS_LOG_TYPE_DEFAULT, "resuming transport %@", (uint8_t *)&v5, 0xCu);
  }

  -[IPServerXPCTransport resume](self->_transport, "resume");
  -[IPStateUpdateStreamSink resume](self->_stateSink, "resume");
}

- (OS_dispatch_queue)queue
{
  return -[IPServerXPCTransport serviceQueue](self->_transport, "serviceQueue");
}

- (void)progressForIdentity:(id)a3 changed:(id)a4
{
  -[IPServerXPCTransport disseminateProgressUpdateForIdentity:currentProgress:](self->_transport, "disseminateProgressUpdateForIdentity:currentProgress:", a3, a4);
}

- (void)progressForIdentity:(id)a3 finishedWithState:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  IPStateUpdateStreamSink *stateSink;
  IPStateUpdateMessage *v21;
  _BYTE v22[12];
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  v8 = 3;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
      _IPServerLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v22 = 138412546;
        *(_QWORD *)&v22[4] = v7;
        v23 = 2048;
        v24 = a4;
        _os_log_impl(&dword_23F108000, v9, OS_LOG_TYPE_DEFAULT, "Progress for %@ finished with strange install state %llu", v22, 0x16u);
      }

      goto LABEL_5;
    case 3uLL:
      v8 = 2;
      goto LABEL_7;
    case 4uLL:
LABEL_7:
      v10 = v6;
      *(_QWORD *)v22 = 0;
      objc_msgSend(v10, "findApplicationRecordWithError:", v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(id *)v22;
      v13 = v12;
      if (!v11)
      {
        objc_msgSend(v12, "domain");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqual:", *MEMORY[0x24BDD1100]))
        {
          v17 = objc_msgSend(v13, "code");

          if (v17 == -10814)
          {
LABEL_18:

            goto LABEL_19;
          }
        }
        else
        {

        }
        _IPDefaultLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[IPProgressServerDefaultBehavior progressForIdentity:finishedWithState:].cold.1((uint64_t)v10, (uint64_t)v13, v18);

        goto LABEL_18;
      }
      objc_msgSend(v11, "identities");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v10);

      if ((v15 & 1) != 0)
        goto LABEL_22;
LABEL_19:
      _IPServerLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v22 = 138412546;
        *(_QWORD *)&v22[4] = v10;
        v23 = 1024;
        LODWORD(v24) = v8;
        _os_log_impl(&dword_23F108000, v19, OS_LOG_TYPE_DEFAULT, "Progress ended for identity %@ with reason %u and identity no longer exists; synthesizing identity unavailable event",
          v22,
          0x12u);
      }

      -[IPProgressServerDefaultBehavior identityWasUninstalled:](self, "identityWasUninstalled:", v10);
LABEL_22:
      -[IPServerXPCTransport disseminateProgressEndForIdenitty:reason:](self->_transport, "disseminateProgressEndForIdenitty:reason:", v7, v8);
      stateSink = self->_stateSink;
      v21 = -[IPStateUpdateMessage initWithType:identity:]([IPStateUpdateMessage alloc], "initWithType:identity:", 2, v7);
      -[IPStateUpdateStreamSink sendUpdateMessage:](stateSink, "sendUpdateMessage:", v21);

      return;
    case 5uLL:
      v8 = 1;
      goto LABEL_22;
    default:
LABEL_5:
      v8 = 0;
      goto LABEL_22;
  }
}

- (void)progressForIdentityInitiated:(id)a3
{
  IPStateUpdateStreamSink *stateSink;
  id v4;
  IPStateUpdateMessage *v5;

  stateSink = self->_stateSink;
  v4 = a3;
  v5 = -[IPStateUpdateMessage initWithType:identity:]([IPStateUpdateMessage alloc], "initWithType:identity:", 1, v4);

  -[IPStateUpdateStreamSink sendUpdateMessage:](stateSink, "sendUpdateMessage:", v5);
}

- (void)identityWasUninstalled:(id)a3
{
  IPStateUpdateStreamSink *stateSink;
  id v4;
  IPStateUpdateMessage *v5;

  stateSink = self->_stateSink;
  v4 = a3;
  v5 = -[IPStateUpdateMessage initWithType:identity:]([IPStateUpdateMessage alloc], "initWithType:identity:", 4, v4);

  -[IPStateUpdateStreamSink sendUpdateMessage:](stateSink, "sendUpdateMessage:", v5);
}

- (id)activeInstallationsForClient:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "activeInstallationsForBehavior:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = (void *)MEMORY[0x24BDBD1A8];
  v7 = v5;

  return v7;
}

- (id)progressForIdentity:(id)a3 forClient:(id)a4 error:(id *)a5
{
  IPProgressServerBehaviorDelegate **p_delegate;
  id v8;
  id WeakRetained;
  void *v10;

  p_delegate = &self->_delegate;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "serverBehavior:progressForIdentity:error:", self, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)allInstallableStatesForClient:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "activeInstallationsForBehavior:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "identity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDC1568], "sharedDatabaseContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__IPProgressServerDefaultBehavior_allInstallableStatesForClient___block_invoke;
  v17[3] = &unk_250FA4218;
  v18 = v4;
  v14 = v4;
  objc_msgSend(v13, "accessUsingBlock:", v17);

  objc_msgSend(v14, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __65__IPProgressServerDefaultBehavior_allInstallableStatesForClient___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  IPInstallableStateData *v16;
  int v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(MEMORY[0x24BDC1530], "enumeratorWithOptions:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v7)
    {
      v8 = v7;
      v18 = v5;
      v9 = *(_QWORD *)v21;
      while (1)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            v19 = 0;
            objc_msgSend(v11, "findApplicationRecordWithError:", &v19);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v19;
            if (v13)
            {
              v15 = v13;
              if (objc_msgSend(v15, "isDeletable"))
              {

                goto LABEL_14;
              }
              v17 = objc_msgSend(v15, "isDeletableSystemApplication");

              if (v17)
              {
LABEL_14:
                v16 = -[IPInstallableStateData initWithIdentity:isInstalling:]([IPInstallableStateData alloc], "initWithIdentity:isInstalling:", v11, 0);
                objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v16, v11);
                goto LABEL_15;
              }
            }
            else
            {
              _IPDefaultLog();
              v16 = (IPInstallableStateData *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v25 = v11;
                v26 = 2112;
                v27 = v14;
                _os_log_error_impl(&dword_23F108000, &v16->super, OS_LOG_TYPE_ERROR, "could not load record for identity %@: %@", buf, 0x16u);
              }
LABEL_15:

            }
            continue;
          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (!v8)
        {
          v5 = v18;
          break;
        }
      }
    }
  }
  else
  {
    _IPDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_23F108000, v6, OS_LOG_TYPE_DEFAULT, "Couldn't access database: %@", buf, 0xCu);
    }
  }

}

- (BOOL)transport:(id)a3 shouldAcceptConnection:(id)a4
{
  IPProgressServerDefaultBehavior *v4;
  IPProgressServerBehaviorDelegate **p_delegate;
  id v6;
  id WeakRetained;

  v4 = self;
  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v4) = objc_msgSend(WeakRetained, "serverBehavior:shouldAcceptConnection:", v4, v6);

  return (char)v4;
}

- (void)transport:(id)a3 acceptedClient:(id)a4
{
  IPProgressServerBehaviorDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "serverBehavior:acceptedClient:", self, v6);

}

- (IPProgressServerBehaviorDelegate)delegate
{
  return (IPProgressServerBehaviorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateSink, 0);
  objc_storeStrong((id *)&self->_transport, 0);
}

- (void)progressForIdentity:(os_log_t)log finishedWithState:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_23F108000, log, OS_LOG_TYPE_ERROR, "unexpected error loading record for %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
