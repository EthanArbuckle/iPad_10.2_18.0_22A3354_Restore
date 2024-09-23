@implementation _KSTRClient

- (_KSTRClient)initWithOwner:(id)a3
{
  id v4;
  _KSTRClient *v5;
  _KSTRClient *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_KSTRClient;
  v5 = -[_KSTRClient init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_owner, v4);
    v6->_hasReadAccess = 1;
  }

  return v6;
}

- (_KSTRClient)initWithOwner:(id)a3 forConnection:(id)a4
{
  id v6;
  id v7;
  _KSTRClient *v8;
  _KSTRClient *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_KSTRClient;
  v8 = -[_KSTRClient init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_owner, v6);
    objc_msgSend(v7, "valueForEntitlement:", kTextReplacementEntitlement);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_hasReadAccess = objc_msgSend(v10, "BOOLValue");

  }
  return v9;
}

- (void)cancel
{
  int64_t *p_generation;
  unint64_t v3;
  unint64_t v4;

  p_generation = &self->_generation;
  do
  {
    v3 = __ldaxr((unint64_t *)p_generation);
    v4 = v3 + 1;
  }
  while (__stlxr(v4, (unint64_t *)p_generation));
  NSLog(CFSTR("%s: cancelled with counter %lld"), a2, "-[_KSTRClient cancel]", v4);
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50___KSTRClient_addEntries_removeEntries_withReply___block_invoke;
  v13[3] = &unk_24E2055D8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(WeakRetained, "addEntries:removeEntries:forClient:withCompletionHandler:", v10, v9, self, v13);

}

- (void)removeAllEntries
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "removeAllEntries");

}

- (void)requestSyncWithReply:(id)a3
{
  _KSTextReplacementServer **p_owner;
  id v4;
  id WeakRetained;

  p_owner = &self->_owner;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_owner);
  objc_msgSend(WeakRetained, "requestSync:withCompletionBlock:", 0, v4);

}

- (void)cancelPendingUpdatesWithReply:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void (**v7)(id, uint64_t, void *);

  v7 = (void (**)(id, uint64_t, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v5 = objc_msgSend(WeakRetained, "_cancelPendingUpdateForClient:", self);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("KSTextReplacementErrorDomain"), 10, &unk_24E20FD60);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[2](v7, v5, v6);

}

- (void)queryTextReplacementEntriesWithReply:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[_KSTRClient hasReadAccess](self, "hasReadAccess"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__5;
    v13 = __Block_byref_object_dispose__5;
    v14 = (id)os_transaction_create();
    WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __52___KSTRClient_queryTextReplacementEntriesWithReply___block_invoke;
    v7[3] = &unk_24E205CE0;
    v8 = v4;
    p_buf = &buf;
    objc_msgSend(WeakRetained, "queryTextReplacementsWithCallback:", v7);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    KSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[_KSTRClient queryTextReplacementEntriesWithReply:]";
      _os_log_impl(&dword_21DFEB000, v6, OS_LOG_TYPE_INFO, "%s  Client does not have read access", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, uint64_t))v4 + 2))(v4, MEMORY[0x24BDBD1A8], 1);
  }

}

- (void)queryTextReplacementsWithPredicate:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[_KSTRClient hasReadAccess](self, "hasReadAccess"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__5;
    v16 = __Block_byref_object_dispose__5;
    v17 = (id)os_transaction_create();
    WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56___KSTRClient_queryTextReplacementsWithPredicate_reply___block_invoke;
    v10[3] = &unk_24E205CE0;
    v11 = v7;
    p_buf = &buf;
    objc_msgSend(WeakRetained, "queryTextReplacementsWithPredicate:callback:", v6, v10);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    KSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[_KSTRClient queryTextReplacementsWithPredicate:reply:]";
      _os_log_impl(&dword_21DFEB000, v9, OS_LOG_TYPE_INFO, "%s  Client does not have read access", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, uint64_t))v7 + 2))(v7, MEMORY[0x24BDBD1A8], 1);
  }

}

- (int64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(int64_t)a3
{
  self->_generation = a3;
}

- (BOOL)hasReadAccess
{
  return self->_hasReadAccess;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
}

@end
