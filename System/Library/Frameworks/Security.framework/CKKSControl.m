@implementation CKKSControl

- (CKKSControl)initWithConnection:(id)a3
{
  id v5;
  CKKSControl *v6;
  CKKSControl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSControl;
  v6 = -[CKKSControl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKKSControl connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)CKKSControl;
  -[CKKSControl dealloc](&v4, sel_dealloc);
}

- (id)objectProxyWithErrorHandler:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[CKKSControl synchronous](self, "synchronous");
  -[CKKSControl connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  else
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)rpcStatus:(id)a3 reply:(id)a4
{
  -[CKKSControl rpcStatus:fast:waitForNonTransientState:reply:](self, "rpcStatus:fast:waitForNonTransientState:reply:", a3, 0, 1000000000, a4);
}

- (void)rpcFastStatus:(id)a3 reply:(id)a4
{
  -[CKKSControl rpcStatus:fast:waitForNonTransientState:reply:](self, "rpcStatus:fast:waitForNonTransientState:reply:", a3, 1, 1000000000, a4);
}

- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6
{
  _BOOL8 v7;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v7 = a4;
  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__CKKSControl_rpcStatus_fast_waitForNonTransientState_reply___block_invoke;
  v18[3] = &unk_1E1FD6038;
  v12 = v10;
  v19 = v12;
  v13 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __61__CKKSControl_rpcStatus_fast_waitForNonTransientState_reply___block_invoke_2;
  v16[3] = &unk_1E1FCBBC0;
  v16[4] = self;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v14, "rpcStatus:fast:waitForNonTransientState:reply:", v13, v7, a5, v16);

}

- (void)rpcResetLocal:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  secLogObjForScope("ckkscontrol");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "Requesting a local reset for view %@", buf, 0xCu);
  }

  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __35__CKKSControl_rpcResetLocal_reply___block_invoke;
  v15[3] = &unk_1E1FD6038;
  v10 = v7;
  v16 = v10;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __35__CKKSControl_rpcResetLocal_reply___block_invoke_2;
  v13[3] = &unk_1E1FCBBE8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "rpcResetLocal:reply:", v6, v13);

}

- (void)rpcResetCloudKit:(id)a3 reason:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  secLogObjForScope("ckkscontrol");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "Requesting a CloudKit reset for view %@", buf, 0xCu);
  }

  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __45__CKKSControl_rpcResetCloudKit_reason_reply___block_invoke;
  v18[3] = &unk_1E1FD6038;
  v13 = v9;
  v19 = v13;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __45__CKKSControl_rpcResetCloudKit_reason_reply___block_invoke_2;
  v16[3] = &unk_1E1FCBBE8;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "rpcResetCloudKit:reason:reply:", v8, v10, v16);

}

- (void)rpcResyncLocal:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  secLogObjForScope("ckkscontrol");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "Requesting a local resync for view %@", buf, 0xCu);
  }

  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __36__CKKSControl_rpcResyncLocal_reply___block_invoke;
  v15[3] = &unk_1E1FD6038;
  v10 = v7;
  v16 = v10;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __36__CKKSControl_rpcResyncLocal_reply___block_invoke_2;
  v13[3] = &unk_1E1FCBBE8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "rpcResyncLocal:reply:", v6, v13);

}

- (void)rpcResync:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  secLogObjForScope("ckkscontrol");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "Requesting a resync for view %@", buf, 0xCu);
  }

  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __31__CKKSControl_rpcResync_reply___block_invoke;
  v15[3] = &unk_1E1FD6038;
  v10 = v7;
  v16 = v10;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __31__CKKSControl_rpcResync_reply___block_invoke_2;
  v13[3] = &unk_1E1FCBBE8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "rpcResync:reply:", v6, v13);

}

- (void)rpcFetchAndProcessChanges:(id)a3 classA:(BOOL)a4 onlyIfNoRecentFetch:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v7 = a5;
  v8 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  secLogObjForScope("ckkscontrol");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v10;
    _os_log_impl(&dword_18A900000, v12, OS_LOG_TYPE_DEFAULT, "Requesting a fetch for view %@", buf, 0xCu);
  }

  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__CKKSControl_rpcFetchAndProcessChanges_classA_onlyIfNoRecentFetch_reply___block_invoke;
  v19[3] = &unk_1E1FD6038;
  v14 = v11;
  v20 = v14;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __74__CKKSControl_rpcFetchAndProcessChanges_classA_onlyIfNoRecentFetch_reply___block_invoke_2;
  v17[3] = &unk_1E1FCBBE8;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "rpcFetchAndProcessChanges:classA:onlyIfNoRecentFetch:reply:", v10, v8, v7, v17);

}

- (void)rpcFetchAndProcessChanges:(id)a3 reply:(id)a4
{
  -[CKKSControl rpcFetchAndProcessChanges:classA:onlyIfNoRecentFetch:reply:](self, "rpcFetchAndProcessChanges:classA:onlyIfNoRecentFetch:reply:", a3, 0, 0, a4);
}

- (void)rpcFetchAndProcessChangesIfNoRecentFetch:(id)a3 reply:(id)a4
{
  -[CKKSControl rpcFetchAndProcessChanges:classA:onlyIfNoRecentFetch:reply:](self, "rpcFetchAndProcessChanges:classA:onlyIfNoRecentFetch:reply:", a3, 0, 1, a4);
}

- (void)rpcFetchAndProcessClassAChanges:(id)a3 reply:(id)a4
{
  -[CKKSControl rpcFetchAndProcessChanges:classA:onlyIfNoRecentFetch:reply:](self, "rpcFetchAndProcessChanges:classA:onlyIfNoRecentFetch:reply:", a3, 1, 0, a4);
}

- (void)rpcPushOutgoingChanges:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  secLogObjForScope("ckkscontrol");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "Requesting a push for view %@", buf, 0xCu);
  }

  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__CKKSControl_rpcPushOutgoingChanges_reply___block_invoke;
  v15[3] = &unk_1E1FD6038;
  v10 = v7;
  v16 = v10;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __44__CKKSControl_rpcPushOutgoingChanges_reply___block_invoke_2;
  v13[3] = &unk_1E1FCBBE8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "rpcPushOutgoingChanges:reply:", v6, v13);

}

- (void)rpcCKMetric:(id)a3 attributes:(id)a4 reply:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__CKKSControl_rpcCKMetric_attributes_reply___block_invoke;
  v17[3] = &unk_1E1FD6038;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __44__CKKSControl_rpcCKMetric_attributes_reply___block_invoke_2;
  v15[3] = &unk_1E1FCBBE8;
  v15[4] = self;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "rpcCKMetric:attributes:reply:", v12, v11, v15);

}

- (void)rpcPerformanceCounters:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__CKKSControl_rpcPerformanceCounters___block_invoke;
  v11[3] = &unk_1E1FD6038;
  v6 = v4;
  v12 = v6;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __38__CKKSControl_rpcPerformanceCounters___block_invoke_2;
  v9[3] = &unk_1E1FCBC10;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performanceCounters:", v9);

}

- (void)rpcGetCKDeviceIDWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__CKKSControl_rpcGetCKDeviceIDWithReply___block_invoke;
  v11[3] = &unk_1E1FD6038;
  v6 = v4;
  v12 = v6;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __41__CKKSControl_rpcGetCKDeviceIDWithReply___block_invoke_2;
  v9[3] = &unk_1E1FCBC38;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "rpcGetCKDeviceIDWithReply:", v9);

}

- (void)rpcTLKMissing:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__CKKSControl_rpcTLKMissing_reply___block_invoke;
  v8[3] = &unk_1E1FD5190;
  v9 = v6;
  v7 = v6;
  -[CKKSControl rpcFastStatus:reply:](self, "rpcFastStatus:reply:", a3, v8);

}

- (void)rpcKnownBadState:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__CKKSControl_rpcKnownBadState_reply___block_invoke;
  v8[3] = &unk_1E1FD5190;
  v9 = v6;
  v7 = v6;
  -[CKKSControl rpcFastStatus:reply:](self, "rpcFastStatus:reply:", a3, v8);

}

- (void)proposeTLKForSEView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;

  v12 = a7;
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __77__CKKSControl_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply___block_invoke;
  v23[3] = &unk_1E1FD6038;
  v14 = v12;
  v24 = v14;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __77__CKKSControl_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply___block_invoke_2;
  v21[3] = &unk_1E1FCBBE8;
  v21[4] = self;
  v22 = v14;
  v20 = v14;
  objc_msgSend(v19, "proposeTLKForSEView:proposedTLK:wrappedOldTLK:tlkShares:reply:", v18, v17, v16, v15, v21);

}

- (void)fetchSEViewKeyHierarchy:(id)a3 reply:(id)a4
{
  -[CKKSControl fetchSEViewKeyHierarchy:forceFetch:reply:](self, "fetchSEViewKeyHierarchy:forceFetch:reply:", a3, 1, a4);
}

- (void)fetchSEViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__CKKSControl_fetchSEViewKeyHierarchy_forceFetch_reply___block_invoke;
  v16[3] = &unk_1E1FD6038;
  v10 = v8;
  v17 = v10;
  v11 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __56__CKKSControl_fetchSEViewKeyHierarchy_forceFetch_reply___block_invoke_2;
  v14[3] = &unk_1E1FCBC60;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "fetchSEViewKeyHierarchy:forceFetch:reply:", v11, v5, v14);

}

- (void)modifyTLKSharesForSEView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__CKKSControl_modifyTLKSharesForSEView_adding_deleting_reply___block_invoke;
  v20[3] = &unk_1E1FD6038;
  v12 = v10;
  v21 = v12;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __62__CKKSControl_modifyTLKSharesForSEView_adding_deleting_reply___block_invoke_2;
  v18[3] = &unk_1E1FCBBE8;
  v18[4] = self;
  v19 = v12;
  v17 = v12;
  objc_msgSend(v16, "modifyTLKSharesForSEView:adding:deleting:reply:", v15, v14, v13, v18);

}

- (void)deleteSEView:(id)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __34__CKKSControl_deleteSEView_reply___block_invoke;
  v14[3] = &unk_1E1FD6038;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __34__CKKSControl_deleteSEView_reply___block_invoke_2;
  v12[3] = &unk_1E1FCBBE8;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "deleteSEView:reply:", v9, v12);

}

- (void)toggleHavoc:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __27__CKKSControl_toggleHavoc___block_invoke;
  v11[3] = &unk_1E1FD6038;
  v6 = v4;
  v12 = v6;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __27__CKKSControl_toggleHavoc___block_invoke_2;
  v9[3] = &unk_1E1FCBC88;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "toggleHavoc:", v9);

}

- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__CKKSControl_pcsMirrorKeysForServices_reply___block_invoke;
  v14[3] = &unk_1E1FD6038;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __46__CKKSControl_pcsMirrorKeysForServices_reply___block_invoke_2;
  v12[3] = &unk_1E1FCD928;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "pcsMirrorKeysForServices:reply:", v9, v12);

}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __46__CKKSControl_pcsMirrorKeysForServices_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__CKKSControl_pcsMirrorKeysForServices_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __27__CKKSControl_toggleHavoc___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __27__CKKSControl_toggleHavoc___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __34__CKKSControl_deleteSEView_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __34__CKKSControl_deleteSEView_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __62__CKKSControl_modifyTLKSharesForSEView_adding_deleting_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__CKKSControl_modifyTLKSharesForSEView_adding_deleting_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __56__CKKSControl_fetchSEViewKeyHierarchy_forceFetch_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__CKKSControl_fetchSEViewKeyHierarchy_forceFetch_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __77__CKKSControl_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__CKKSControl_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __38__CKKSControl_rpcKnownBadState_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  char v15;
  uint64_t v16;
  id obj;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v16 = a1;
    v5 = 0;
    v18 = 0;
    v6 = *(_QWORD *)v20;
    v7 = CFSTR("view");
    v8 = CFSTR("keystate");
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v7, v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("global")) & 1) == 0)
        {
          v13 = v8;
          v14 = v7;
          if ((objc_msgSend(v12, "isEqualToString:", CFSTR("waitfortlk")) & 1) == 0)
            objc_msgSend(v12, "isEqualToString:", CFSTR("error"));
          v15 = objc_msgSend(v12, "isEqualToString:", CFSTR("waitforunlock"));
          if ((objc_msgSend(v12, "isEqualToString:", CFSTR("waitfortlkcreation")) & 1) == 0
            && (objc_msgSend(v12, "isEqualToString:", CFSTR("waitfortlkupload")) & 1) == 0)
          {
            objc_msgSend(v12, "isEqualToString:", CFSTR("waitfortrust"));
          }
          v5 |= v15;
          v18 |= objc_msgSend(v12, "isEqualToString:", CFSTR("loggedout"));
          v7 = v14;
          v8 = v13;
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
    a1 = v16;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __35__CKKSControl_rpcTLKMissing_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("view"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("keystate"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("global")) & 1) == 0
          && (objc_msgSend(v9, "isEqualToString:", CFSTR("waitfortlk")) & 1) == 0)
        {
          objc_msgSend(v9, "isEqualToString:", CFSTR("error"));
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __41__CKKSControl_rpcGetCKDeviceIDWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__CKKSControl_rpcGetCKDeviceIDWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __38__CKKSControl_rpcPerformanceCounters___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __38__CKKSControl_rpcPerformanceCounters___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __44__CKKSControl_rpcCKMetric_attributes_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__CKKSControl_rpcCKMetric_attributes_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __44__CKKSControl_rpcPushOutgoingChanges_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__CKKSControl_rpcPushOutgoingChanges_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("ckkscontrol");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138412290;
      v10 = v3;
      v6 = "Push finished with error: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    v6 = "Push finished successfully";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);
}

uint64_t __74__CKKSControl_rpcFetchAndProcessChanges_classA_onlyIfNoRecentFetch_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__CKKSControl_rpcFetchAndProcessChanges_classA_onlyIfNoRecentFetch_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("ckkscontrol");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138412290;
      v10 = v3;
      v6 = "Fetch finished with error: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    v6 = "Fetch finished successfully";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);
}

uint64_t __31__CKKSControl_rpcResync_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __31__CKKSControl_rpcResync_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("ckkscontrol");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138412290;
      v10 = v3;
      v6 = "Resync finished with error: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    v6 = "Resync finished successfully";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);
}

uint64_t __36__CKKSControl_rpcResyncLocal_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __36__CKKSControl_rpcResyncLocal_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("ckkscontrol");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138412290;
      v10 = v3;
      v6 = "Local resync finished with error: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    v6 = "Local resync finished successfully";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);
}

uint64_t __45__CKKSControl_rpcResetCloudKit_reason_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__CKKSControl_rpcResetCloudKit_reason_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("ckkscontrol");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138412290;
      v10 = v3;
      v6 = "CloudKit reset finished with error: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    v6 = "CloudKit reset finished successfully";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);
}

uint64_t __35__CKKSControl_rpcResetLocal_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __35__CKKSControl_rpcResetLocal_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("ckkscontrol");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138412290;
      v10 = v3;
      v6 = "Local reset finished with error: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    v6 = "Local reset finished successfully";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);
}

uint64_t __61__CKKSControl_rpcStatus_fast_waitForNonTransientState_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__CKKSControl_rpcStatus_fast_waitForNonTransientState_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)controlObject:(id *)a3
{
  return +[CKKSControl CKKSControlObject:error:](CKKSControl, "CKKSControlObject:error:", 0, a3);
}

+ (id)CKKSControlObject:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v5 = a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.securityd.ckks"), 0);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF88988);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CKKSSetupControlProtocol(v7);
    objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setRemoteObjectInterface:", v7);
    objc_msgSend(v6, "resume");
    a4 = -[CKKSControl initWithConnection:]([CKKSControl alloc], "initWithConnection:", v6);
    objc_msgSend(a4, "setSynchronous:", v5);

  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Couldn't create connection (no reason given)");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("securityd"), -1, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

@end
