@implementation _COMessageChannel

- (_COMessageChannel)initWithTopic:(id)a3 cluster:(id)a4 manualGrouping:(BOOL)a5
{
  id v7;
  _COMessageChannel *v8;
  _COMessageChannel *v9;
  void *v10;
  void *v11;
  void *v12;
  COMessageChannelRapportTransport *v13;
  void *v14;
  uint64_t v15;
  COMessageChannelRapportTransport *rapportTransport;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_COMessageChannel;
  v8 = -[COMessageChannel initWithConnectionProvider:roleMonitorConnectionProvider:topic:cluster:](&v18, sel_initWithConnectionProvider_roleMonitorConnectionProvider_topic_cluster_, 0, 0, v7, a4);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[COMessageChannel cluster](v8, "cluster");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [COMessageChannelRapportTransport alloc];
    -[COMessageChannel workQueue](v9, "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[COMessageChannelRapportTransport initWithIdentifier:delegate:dispatchQueue:](v13, "initWithIdentifier:delegate:dispatchQueue:", v12, v9, v14);
    rapportTransport = v9->_rapportTransport;
    v9->_rapportTransport = (COMessageChannelRapportTransport *)v15;

  }
  return v9;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[COMessageChannel workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44___COMessageChannel_activateWithCompletion___block_invoke;
  v7[3] = &unk_24CD3ED38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)sendRequest:(id)a3 members:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMessageChannel workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63___COMessageChannel_sendRequest_members_withCompletionHandler___block_invoke;
  v15[3] = &unk_24CD3EF48;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)broadcastRequest:(id)a3 recipientsCallback:(id)a4 responseCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMessageChannel workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83___COMessageChannel_broadcastRequest_recipientsCallback_responseCompletionHandler___block_invoke;
  v15[3] = &unk_24CD3F7C0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)_onqueue_sendRequest:(id)a3 members:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id obj;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMessageChannel workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15);
        -[_COMessageChannel rapportTransport](self, "rapportTransport");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __72___COMessageChannel__onqueue_sendRequest_members_withCompletionHandler___block_invoke;
        v19[3] = &unk_24CD403D8;
        v19[4] = v16;
        v20 = v10;
        objc_msgSend(v17, "sendRequest:to:withCompletionHandler:", v8, v16, v19);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

}

- (void)registerHandler:(id)a3 forRequestClass:(Class)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  Class v11;

  v6 = a3;
  -[COMessageChannel workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53___COMessageChannel_registerHandler_forRequestClass___block_invoke;
  block[3] = &unk_24CD40400;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)registerMemberFoundHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[COMessageChannel workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48___COMessageChannel_registerMemberFoundHandler___block_invoke;
  v7[3] = &unk_24CD3ED38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)registerMemberLostHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[COMessageChannel workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47___COMessageChannel_registerMemberLostHandler___block_invoke;
  v7[3] = &unk_24CD3ED38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)groupedHomeKitIdentifiers
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__9;
  v9 = __Block_byref_object_dispose__9;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46___COMessageChannel_groupedHomeKitIdentifiers__block_invoke;
  v4[3] = &unk_24CD3EEA8;
  v4[4] = self;
  v4[5] = &v5;
  -[COMessageChannel _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)addGroupedHomeKitIdentifiers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50___COMessageChannel_addGroupedHomeKitIdentifiers___block_invoke;
  v6[3] = &unk_24CD3EF20;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COMessageChannel _withLock:](self, "_withLock:", v6);

}

- (void)removeGroupedHomeKitIdentifiers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53___COMessageChannel_removeGroupedHomeKitIdentifiers___block_invoke;
  v6[3] = &unk_24CD3EF20;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COMessageChannel _withLock:](self, "_withLock:", v6);

}

- (void)addSessionProducerWithSubTopic:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMessageChannel workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke;
  v15[3] = &unk_24CD3FBE8;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)addSessionConsumerWithSubTopic:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMessageChannel workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke;
  v15[3] = &unk_24CD3FBE8;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)_onqueue_startSessionWithProducer:(id)a3 member:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  _COMessageChannel *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  COLogForCategory(6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134218242;
      v24 = self;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%p Session with member %@ is already active. Not starting again", buf, 0x16u);
    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 134218498;
      v24 = self;
      v25 = 2112;
      v26 = v7;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%p Attempting to start a session with member %@ using producer %@", buf, 0x20u);
    }

    objc_msgSend(v6, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak((id *)buf, self);
      +[COClusterMemberRoleSnapshot snapshotWithParticipantRoleForMember:](COClusterMemberRoleSnapshot, "snapshotWithParticipantRoleForMember:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      COLogForCategory(6);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[_COMessageChannel _onqueue_startSessionWithProducer:member:].cold.1((uint64_t)self);

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __62___COMessageChannel__onqueue_startSessionWithProducer_member___block_invoke;
      block[3] = &unk_24CD3FEE0;
      v18 = v12;
      v19 = v6;
      v20 = v13;
      v15 = v13;
      objc_copyWeak(&v22, (id *)buf);
      v21 = v7;
      dispatch_async(v10, block);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      COLogForCategory(6);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v24 = self;
        _os_log_impl(&dword_21214B000, v16, OS_LOG_TYPE_DEFAULT, "%p Client does not implement producer:shouldStartSessionWithMember:completionHandler:", buf, 0xCu);
      }

      -[_COMessageChannel _onqueue_startSessionWithProducer:member:request:](self, "_onqueue_startSessionWithProducer:member:request:", v6, v7, 0);
    }

  }
}

- (void)_onqueue_startSessionWithProducer:(id)a3 member:(id)a4 request:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  COMessageSessionManagementRequest *v16;
  COMessageSessionManagementRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id location;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[COClusterMemberRoleSnapshot snapshotWithParticipantRoleForMember:](COClusterMemberRoleSnapshot, "snapshotWithParticipantRoleForMember:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v29;
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD1398];
    v31[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1205, v15);
    v16 = (COMessageSessionManagementRequest *)objc_claimAutoreleasedReturnValue();

    -[_COMessageChannel _onqueue_deliverDidFailToStartSessionWithMember:producer:error:](self, "_onqueue_deliverDidFailToStartSessionWithMember:producer:error:", v11, v8, v16);
  }
  else
  {
    v17 = [COMessageSessionManagementRequest alloc];
    -[_COMessageChannel _payloadTypeFromClass:](self, "_payloadTypeFromClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMessageChannel topic](self, "topic");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subTopic");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[COMessageSessionManagementRequest initWithCommandType:payload:payloadType:topic:subTopic:](v17, "initWithCommandType:payload:payloadType:topic:subTopic:", 1, v22, v18, v19, v20);

    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __70___COMessageChannel__onqueue_startSessionWithProducer_member_request___block_invoke;
    v23[3] = &unk_24CD3FC88;
    objc_copyWeak(&v27, &location);
    v24 = v10;
    v25 = v8;
    v26 = v9;
    -[_COMessageChannel _onqueue_sendRequest:members:withCompletionHandler:](self, "_onqueue_sendRequest:members:withCompletionHandler:", v16, v21, v23);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

}

- (void)_onqueue_handleStartCommand:(id)a3 withMember:(id)a4 callback:(id)a5
{
  id v8;
  void (**v9)(id, COMessageSessionManagementResponse *, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  COMessageConsumedSession *v20;
  NSObject *v21;
  COMessageSessionManagementResponse *v22;
  void *v23;
  void *v24;
  COMessageConsumedSession *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  COMessageSessionManagementResponse *v29;
  void *v30;
  NSObject *queue;
  void *v32;
  void *v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _COMessageChannel *v40;
  COMessageConsumedSession *v41;
  void (**v42)(id, COMessageSessionManagementResponse *, _QWORD);
  id v43;
  id location;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;
  id v53;
  const __CFString *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v34 = a4;
  v9 = (void (**)(id, COMessageSessionManagementResponse *, _QWORD))a5;
  objc_msgSend(v8, "subTopic");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel sessionConsumers](self, "sessionConsumers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegateQueue");
  queue = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payloadType");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = 0;
  if (v12 && v13)
  {
    v16 = -[_COMessageChannel _payloadClassFromType:](self, "_payloadClassFromType:", v13);
    if (v16)
    {
      v45 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v16, v12, &v45);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v45;
      if (v17)
      {
LABEL_5:
        v18 = (void *)MEMORY[0x24BDD1540];
        v52 = *MEMORY[0x24BDD1398];
        v53 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1206, v19);
        v20 = (COMessageConsumedSession *)objc_claimAutoreleasedReturnValue();

        COLogForCategory(6);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v34, "member");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v47 = v11;
          v48 = 2112;
          v49 = v14;
          v50 = 2112;
          v51 = v30;
          _os_log_error_impl(&dword_21214B000, v21, OS_LOG_TYPE_ERROR, "%@ Consumer failed to unarchive request of type %@. Session start with member %@ failed", buf, 0x20u);

        }
        v22 = -[COMessageSessionManagementResponse initWithRemoteError:]([COMessageSessionManagementResponse alloc], "initWithRemoteError:", v20);
        v9[2](v9, v22, 0);

        goto LABEL_14;
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v54 = CFSTR("COMessageSessionUnknownClassErrorKey");
      v55[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1206, v24);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      v15 = 0;
      if (v17)
        goto LABEL_5;
    }
  }
  v25 = [COMessageConsumedSession alloc];
  objc_msgSend(v34, "member");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[COMessageConsumedSession initWithMember:consumer:](v25, "initWithMember:consumer:", v26, v11);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    COLogForCategory(6);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "subTopic");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMessageChannel _handleStartCommand:withMember:callback:].cold.1((uint64_t)self, v28, (uint64_t)buf, v27);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69___COMessageChannel__onqueue_handleStartCommand_withMember_callback___block_invoke;
    block[3] = &unk_24CD3FE68;
    v36 = v33;
    v37 = v11;
    v38 = v34;
    v15 = v15;
    v39 = v15;
    objc_copyWeak(&v43, &location);
    v40 = self;
    v20 = v20;
    v41 = v20;
    v42 = v9;
    dispatch_async(queue, block);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  else
  {
    v29 = objc_alloc_init(COMessageSessionManagementResponse);
    v9[2](v9, v29, 0);

  }
LABEL_14:

}

- (void)_onqueue_handleStopCommand:(id)a3 fromMember:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, COMessageSessionManagementResponse *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  COMessageSessionManagementResponse *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, COMessageSessionManagementResponse *, _QWORD))a5;
  objc_msgSend(v8, "subTopic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel sessionConsumers](self, "sessionConsumers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sessions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "member");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_3;
  -[COMessageChannel sessionProducers](self, "sessionProducers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "sessions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "member");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
LABEL_3:
    v30 = v13;
    objc_msgSend(v8, "payload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "payloadType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteError");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (id)v23;
    }
    else
    {
      v25 = 0;
      v24 = 0;
      if (!v21 || !v22)
        goto LABEL_6;
      v27 = -[_COMessageChannel _payloadClassFromType:](self, "_payloadClassFromType:", v22);
      if (v27)
      {
        v31 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v27, v21, &v31);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v31;
        goto LABEL_6;
      }
      v29 = (void *)MEMORY[0x24BDD1540];
      v32 = CFSTR("COMessageSessionUnknownClassErrorKey");
      v33[0] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1206, v28);
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    v25 = 0;
LABEL_6:
    -[_COMessageChannel _onqueue_deliverDidEndDelegateForSession:notice:initiator:error:](self, "_onqueue_deliverDidEndDelegateForSession:notice:initiator:error:", v16, v25, v9, v24);

    v13 = v30;
  }
  v26 = objc_alloc_init(COMessageSessionManagementResponse);
  v10[2](v10, v26, 0);

}

- (void)_onqueue_handleCapableCommand:(id)a3 fromMember:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, COMessageSessionManagementResponse *, _QWORD);
  COMessageSessionManagementResponse *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  _COMessageChannel *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, COMessageSessionManagementResponse *, _QWORD))a5;
  v11 = objc_alloc_init(COMessageSessionManagementResponse);
  v10[2](v10, v11, 0);

  -[COMessageChannel sessionsInflight](self, "sessionsInflight");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "member");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    COLogForCategory(6);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "member");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subTopic");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 134218498;
      v28 = self;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_21214B000, v15, OS_LOG_TYPE_DEFAULT, "%p Received a command indicating inflight member %@ is now capable of consuming subTopic %@", (uint8_t *)&v27, 0x20u);

    }
    -[COMessageChannel sessionProducers](self, "sessionProducers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subTopic");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqual:", v21))
      v22 = 0;
    else
      v22 = v14;
    v23 = v22;

    -[COMessageChannel sessionsInflight](self, "sessionsInflight");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "member");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeObjectForKey:", v25);

    objc_msgSend(v9, "member");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_COMessageChannel _onqueue_startSessionWithProducer:member:request:](self, "_onqueue_startSessionWithProducer:member:request:", v20, v26, v23);

  }
}

- (void)_onqueue_deliverDidFailToStartSessionWithMember:(id)a3 producer:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __84___COMessageChannel__onqueue_deliverDidFailToStartSessionWithMember_producer_error___block_invoke;
    v12[3] = &unk_24CD3FBE8;
    v13 = v10;
    v14 = v8;
    v15 = v7;
    v16 = v9;
    dispatch_async(v11, v12);

  }
}

- (void)_onqueue_deliverDidFailToStartSessionWithMember:(id)a3 consumer:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __84___COMessageChannel__onqueue_deliverDidFailToStartSessionWithMember_consumer_error___block_invoke;
    v12[3] = &unk_24CD3FBE8;
    v13 = v10;
    v14 = v8;
    v15 = v7;
    v16 = v9;
    dispatch_async(v11, v12);

  }
}

- (void)_onqueue_deliverSuccessfullyStartedSession:(id)a3 withResponse:(id)a4 withMember:(id)a5 producer:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v12, "sessions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "member");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v9, v14);

  COLogForCategory(6);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v12;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_21214B000, v15, OS_LOG_TYPE_DEFAULT, "%@ Producer successfully created a session %@", buf, 0x16u);
  }

  objc_msgSend(v12, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "delegateQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __97___COMessageChannel__onqueue_deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke;
    block[3] = &unk_24CD3FC60;
    v19 = v16;
    v20 = v12;
    v21 = v9;
    v22 = v11;
    v23 = v10;
    dispatch_async(v17, block);

  }
}

- (void)_onqueue_deliverSuccessfullyStartedSession:(id)a3 withMember:(id)a4 consumer:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "sessions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "member");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKey:", v7, v11);
  COLogForCategory(6);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_21214B000, v12, OS_LOG_TYPE_DEFAULT, "%@ Consumer successfully created a session %@", buf, 0x16u);
  }

  objc_msgSend(v8, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "delegateQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84___COMessageChannel__onqueue_deliverSuccessfullyStartedSession_withMember_consumer___block_invoke;
    block[3] = &unk_24CD3F310;
    v16 = v13;
    v17 = v8;
    v18 = v7;
    dispatch_async(v14, block);

  }
}

- (void)_onqueue_deliverDidEndDelegateForSession:(id)a3 notice:(id)a4 initiator:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id *v16;
  id *v17;
  id *v18;
  _QWORD *v19;
  id *v20;
  id *v21;
  id *v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "producer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "delegateQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __85___COMessageChannel__onqueue_deliverDidEndDelegateForSession_notice_initiator_error___block_invoke;
      v30[3] = &unk_24CD3FF48;
      v22 = &v31;
      v14 = v14;
      v31 = v14;
      v21 = &v32;
      v13 = v13;
      v32 = v13;
      v20 = &v33;
      v33 = v9;
      v16 = &v34;
      v34 = v11;
      v17 = &v35;
      v35 = v10;
      v18 = &v36;
      v36 = v12;
      v19 = v30;
LABEL_6:
      dispatch_async(v15, v19);

    }
  }
  else
  {
    objc_msgSend(v9, "consumer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "delegateQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[1] = 3221225472;
      block[2] = __85___COMessageChannel__onqueue_deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_2;
      block[3] = &unk_24CD3FF48;
      v22 = &v24;
      block[0] = MEMORY[0x24BDAC760];
      v14 = v14;
      v24 = v14;
      v21 = &v25;
      v13 = v13;
      v25 = v13;
      v20 = &v26;
      v26 = v9;
      v16 = &v27;
      v27 = v11;
      v17 = &v28;
      v28 = v10;
      v18 = &v29;
      v29 = v12;
      v19 = block;
      goto LABEL_6;
    }
  }

}

- (void)didFindMember:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[COMessageChannel workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35___COMessageChannel_didFindMember___block_invoke;
  v7[3] = &unk_24CD3EF20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)didLoseMember:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[COMessageChannel workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35___COMessageChannel_didLoseMember___block_invoke;
  v7[3] = &unk_24CD3EF20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)didReceiveRequest:(id)a3 from:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMessageChannel workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66___COMessageChannel_didReceiveRequest_from_withCompletionHandler___block_invoke;
  v15[3] = &unk_24CD404C0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (id)_payloadTypeFromClass:(Class)a3
{
  if (!a3)
    return 0;
  NSStringFromClass(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)_payloadClassFromType:(id)a3
{
  return NSClassFromString((NSString *)a3);
}

- (COMessageChannelRapportTransport)rapportTransport
{
  return self->_rapportTransport;
}

- (void)setRapportTransport:(id)a3
{
  objc_storeStrong((id *)&self->_rapportTransport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapportTransport, 0);
}

- (void)_onqueue_startSessionWithProducer:(uint64_t)a1 member:.cold.1(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  OUTLINED_FUNCTION_2_3();
  v5 = v1;
  OUTLINED_FUNCTION_5(&dword_21214B000, v2, (uint64_t)v2, "%p Reaching out to client delegate producer:shouldStartSessionWithMember:completionHandler: with member %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
