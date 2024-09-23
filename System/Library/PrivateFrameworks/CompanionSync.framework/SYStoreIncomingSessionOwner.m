@implementation SYStoreIncomingSessionOwner

- (SYStoreIncomingSessionOwner)initWithIncomingSession:(id)a3
{
  id v4;
  SYStoreIncomingSessionOwner *v5;
  SYStoreIncomingSessionOwner *v6;
  SYStoreIncomingSessionOwner *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYStoreIncomingSessionOwner;
  v5 = -[SYStoreIncomingSessionOwner init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SYStoreSessionOwner setSession:](v5, "setSession:", v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)isResetSync
{
  void *v2;
  char v3;

  -[SYStoreSessionOwner session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isResetSync");

  return v3;
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  id v6;
  _WORD *v7;
  unsigned __int8 v8;
  BOOL v9;
  void *v10;
  objc_super v12;
  objc_super v13;

  v6 = a3;
  -[SYStoreSessionOwner store](self, "store");
  v7 = (_WORD *)objc_claimAutoreleasedReturnValue();
  if (-[SYStoreIncomingSessionOwner isResetSync](self, "isResetSync"))
  {
    if ((v7[8] & 0x10) != 0)
    {
      objc_msgSend(v7, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "syncStoreAllObjectsDeleted:", v7);

      v9 = 1;
      goto LABEL_7;
    }
    v8 = -[SYStoreSessionOwner syncSession:resetDataStoreWithError:](&v12, sel_syncSession_resetDataStoreWithError_, v6, a4, self, SYStoreIncomingSessionOwner, v13.receiver, v13.super_class);
  }
  else
  {
    v8 = -[SYStoreSessionOwner syncSession:resetDataStoreWithError:](&v13, sel_syncSession_resetDataStoreWithError_, v6, a4, v12.receiver, v12.super_class, self, SYStoreIncomingSessionOwner);
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[SYStoreSessionOwner store](self, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v11 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 134217984;
    v24 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_211704000, v12, OS_LOG_TYPE_DEFAULT, "SYStore shim: forwarding %lu changes to SYStoreDelegate", buf, 0xCu);

  }
  objc_msgSend(v9, "delegateQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __67__SYStoreIncomingSessionOwner_syncSession_applyChanges_completion___block_invoke;
  v18[3] = &unk_24CC65620;
  v19 = v7;
  v20 = v10;
  v21 = v9;
  v22 = v8;
  v14 = v8;
  v15 = v9;
  v16 = v10;
  v17 = v7;
  dispatch_async(v13, v18);

}

void __67__SYStoreIncomingSessionOwner_syncSession_applyChanges_completion___block_invoke(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  id v6;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __67__SYStoreIncomingSessionOwner_syncSession_applyChanges_completion___block_invoke_2;
  v2[3] = &unk_24CC65620;
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  _os_activity_initiate(&dword_211704000, "Sync Batch Input", OS_ACTIVITY_FLAG_DEFAULT, v2);

}

uint64_t __67__SYStoreIncomingSessionOwner_syncSession_applyChanges_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "changeType", (_QWORD)v17);
        switch(v8)
        {
          case 3:
            v14 = *(void **)(a1 + 40);
            v15 = *(_QWORD *)(a1 + 48);
            objc_msgSend(v7, "wrappedObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "syncStore:objectDeleted:", v15, v11);
            break;
          case 2:
            v12 = *(void **)(a1 + 40);
            v13 = *(_QWORD *)(a1 + 48);
            objc_msgSend(v7, "wrappedObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "syncStore:objectUpdated:", v13, v11);
            break;
          case 1:
            v9 = *(void **)(a1 + 40);
            v10 = *(_QWORD *)(a1 + 48);
            objc_msgSend(v7, "wrappedObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "syncStore:objectAdded:", v10, v11);
            break;
          default:
            continue;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

@end
