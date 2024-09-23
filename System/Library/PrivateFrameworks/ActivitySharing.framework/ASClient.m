@implementation ASClient

- (ASClient)initWithHealthStore:(id)a3
{
  id v4;
  ASClient *v5;
  uint64_t v6;
  OS_dispatch_queue *serverQueue;
  uint64_t v8;
  OS_dispatch_queue *clientQueue;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HKProxyProvider *proxyProvider;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASClient;
  v5 = -[ASClient init](&v16, sel_init);
  if (v5)
  {
    HKCreateSerialDispatchQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    serverQueue = v5->_serverQueue;
    v5->_serverQueue = (OS_dispatch_queue *)v6;

    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc(MEMORY[0x24BDD4038]);
    ASClientTaskIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v11, v5, v12);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v13;

  }
  return v5;
}

- (id)exportedInterface
{
  return 0;
}

- (void)sendInviteRequestToDestination:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __81__ASClient_sendInviteRequestToDestination_callerID_serviceIdentifier_completion___block_invoke;
  v21[3] = &unk_24D057A18;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __81__ASClient_sendInviteRequestToDestination_callerID_serviceIdentifier_completion___block_invoke_2;
  v19[3] = &unk_24D057A40;
  v20 = v25;
  v15 = v25;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v21, v19);

}

uint64_t __81__ASClient_sendInviteRequestToDestination_callerID_serviceIdentifier_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendInviteRequestToDestination:callerID:serviceIdentifier:completion:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __81__ASClient_sendInviteRequestToDestination_callerID_serviceIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)acceptInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__ASClient_acceptInviteRequestFromFriendWithUUID_completion___block_invoke;
  v13[3] = &unk_24D057A68;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __61__ASClient_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_2;
  v11[3] = &unk_24D057A40;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

uint64_t __61__ASClient_acceptInviteRequestFromFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_acceptInviteRequestFromFriendWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __61__ASClient_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendWithdrawInviteRequestToFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__ASClient_sendWithdrawInviteRequestToFriendWithUUID_completion___block_invoke;
  v13[3] = &unk_24D057A68;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __65__ASClient_sendWithdrawInviteRequestToFriendWithUUID_completion___block_invoke_2;
  v11[3] = &unk_24D057A40;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

uint64_t __65__ASClient_sendWithdrawInviteRequestToFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendWithdrawInviteRequestToFriendWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __65__ASClient_sendWithdrawInviteRequestToFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ignoreInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__ASClient_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke;
  v13[3] = &unk_24D057A68;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __61__ASClient_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke_2;
  v11[3] = &unk_24D057A40;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

uint64_t __61__ASClient_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_ignoreInviteRequestFromFriendWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __61__ASClient_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendCompetitionRequestToFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__ASClient_sendCompetitionRequestToFriendWithUUID_completion___block_invoke;
  v13[3] = &unk_24D057A68;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __62__ASClient_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_2;
  v11[3] = &unk_24D057A40;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

uint64_t __62__ASClient_sendCompetitionRequestToFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendCompetitionRequestToFriendWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __62__ASClient_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)acceptCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__ASClient_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke;
  v13[3] = &unk_24D057A68;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __66__ASClient_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_2;
  v11[3] = &unk_24D057A40;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

uint64_t __66__ASClient_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_acceptCompetitionRequestFromFriendWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __66__ASClient_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ignoreCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__ASClient_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke;
  v13[3] = &unk_24D057A68;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __66__ASClient_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke_2;
  v11[3] = &unk_24D057A40;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

uint64_t __66__ASClient_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_ignoreCompetitionRequestFromFriendWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __66__ASClient_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)completeCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__ASClient_completeCompetitionWithFriendWithUUID_completion___block_invoke;
  v13[3] = &unk_24D057A68;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __61__ASClient_completeCompetitionWithFriendWithUUID_completion___block_invoke_2;
  v11[3] = &unk_24D057A40;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

uint64_t __61__ASClient_completeCompetitionWithFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_completeCompetitionWithFriendWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __61__ASClient_completeCompetitionWithFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setActivityDataVisible:(BOOL)a3 toFriendWithUUID:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;

  v8 = a4;
  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__ASClient_setActivityDataVisible_toFriendWithUUID_completion___block_invoke;
  v15[3] = &unk_24D057A90;
  v18 = a3;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __63__ASClient_setActivityDataVisible_toFriendWithUUID_completion___block_invoke_2;
  v13[3] = &unk_24D057A40;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v15, v13);

}

uint64_t __63__ASClient_setActivityDataVisible_toFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setActivityDataVisible:toFriendWithUUID:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __63__ASClient_setActivityDataVisible_toFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setMuteEnabled:(BOOL)a3 forFriendWithUUID:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;

  v8 = a4;
  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__ASClient_setMuteEnabled_forFriendWithUUID_completion___block_invoke;
  v15[3] = &unk_24D057A90;
  v18 = a3;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __56__ASClient_setMuteEnabled_forFriendWithUUID_completion___block_invoke_2;
  v13[3] = &unk_24D057A40;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v15, v13);

}

uint64_t __56__ASClient_setMuteEnabled_forFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setMuteEnabled:forFriendWithUUID:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __56__ASClient_setMuteEnabled_forFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__ASClient_removeFriendWithUUID_completion___block_invoke;
  v13[3] = &unk_24D057A68;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __44__ASClient_removeFriendWithUUID_completion___block_invoke_2;
  v11[3] = &unk_24D057A40;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

uint64_t __44__ASClient_removeFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removeFriendWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __44__ASClient_removeFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pushActivityDataToAllFriendsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__ASClient_pushActivityDataToAllFriendsWithCompletion___block_invoke;
  v9[3] = &unk_24D057AB8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __55__ASClient_pushActivityDataToAllFriendsWithCompletion___block_invoke_2;
  v7[3] = &unk_24D057A40;
  v8 = v10;
  v6 = v10;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

uint64_t __55__ASClient_pushActivityDataToAllFriendsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pushActivityDataWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __55__ASClient_pushActivityDataToAllFriendsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pushFakeActivityDataToAllFriendsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__ASClient_pushFakeActivityDataToAllFriendsWithCompletion___block_invoke;
  v9[3] = &unk_24D057AB8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __59__ASClient_pushFakeActivityDataToAllFriendsWithCompletion___block_invoke_2;
  v7[3] = &unk_24D057A40;
  v8 = v10;
  v6 = v10;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

uint64_t __59__ASClient_pushFakeActivityDataToAllFriendsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pushFakeActivityDataWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __59__ASClient_pushFakeActivityDataToAllFriendsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAllDataWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__ASClient_fetchAllDataWithCompletion___block_invoke;
  v9[3] = &unk_24D057AB8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __39__ASClient_fetchAllDataWithCompletion___block_invoke_2;
  v7[3] = &unk_24D057A40;
  v8 = v10;
  v6 = v10;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

uint64_t __39__ASClient_fetchAllDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllDataWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __39__ASClient_fetchAllDataWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAllDataIfTimeSinceLastFetchIsGreaterThan:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69__ASClient_fetchAllDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke;
  v11[3] = &unk_24D057AE0;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __69__ASClient_fetchAllDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke_2;
  v9[3] = &unk_24D057A40;
  v10 = v12;
  v8 = v12;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v11, v9);

}

uint64_t __69__ASClient_fetchAllDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllDataIfTimeSinceLastFetchIsGreaterThan:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __69__ASClient_fetchAllDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cloudKitAccountStatusWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke;
  v9[3] = &unk_24D057B58;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke_4;
  v7[3] = &unk_24D057A40;
  v8 = v10;
  v6 = v10;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke_2;
  v5[3] = &unk_24D057B30;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "remote_cloudKitAccountStatusWithCompletion:", v5);

}

void __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke_2(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  char v14;

  v7 = a4;
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke_3;
    block[3] = &unk_24D057B08;
    v12 = v8;
    v13 = a2;
    v14 = a3;
    v11 = v7;
    dispatch_async(v9, block);

  }
}

uint64_t __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 32));
}

uint64_t __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearFriendListWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__ASClient_clearFriendListWithCompletion___block_invoke;
  v9[3] = &unk_24D057B58;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __42__ASClient_clearFriendListWithCompletion___block_invoke_4;
  v7[3] = &unk_24D057A40;
  v8 = v10;
  v6 = v10;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __42__ASClient_clearFriendListWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__ASClient_clearFriendListWithCompletion___block_invoke_2;
  v5[3] = &unk_24D057BA8;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "remote_clearFriendListWithCompletion:", v5);

}

void __42__ASClient_clearFriendListWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__ASClient_clearFriendListWithCompletion___block_invoke_3;
    block[3] = &unk_24D057B80;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __42__ASClient_clearFriendListWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __42__ASClient_clearFriendListWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAreMultipleDevicesSharingDataForSnapshotIndex:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__ASClient_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke;
  v13[3] = &unk_24D057A68;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __78__ASClient_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke_3;
  v11[3] = &unk_24D057A40;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

void __78__ASClient_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __78__ASClient_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke_2;
  v4[3] = &unk_24D057BD0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_fetchAreMultipleDevicesSharingDataForSnapshotIndex:withCompletion:", v3, v4);

}

uint64_t __78__ASClient_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __78__ASClient_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)expireChangeTokenWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__ASClient_expireChangeTokenWithCompletion___block_invoke;
  v9[3] = &unk_24D057AB8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __44__ASClient_expireChangeTokenWithCompletion___block_invoke_2;
  v7[3] = &unk_24D057A40;
  v8 = v10;
  v6 = v10;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

uint64_t __44__ASClient_expireChangeTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_expireChangeTokenWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __44__ASClient_expireChangeTokenWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allFriendsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__ASClient_allFriendsWithCompletion___block_invoke;
  v9[3] = &unk_24D057AB8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __37__ASClient_allFriendsWithCompletion___block_invoke_3;
  v7[3] = &unk_24D057A40;
  v8 = v10;
  v6 = v10;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __37__ASClient_allFriendsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __37__ASClient_allFriendsWithCompletion___block_invoke_2;
  v3[3] = &unk_24D057BF8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_fetchAllFriendsWithCompletion:", v3);

}

uint64_t __37__ASClient_allFriendsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37__ASClient_allFriendsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)friendWithRemoteUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __44__ASClient_friendWithRemoteUUID_completion___block_invoke;
  v15[3] = &unk_24D057C48;
  v15[4] = self;
  v16 = v7;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__ASClient_friendWithRemoteUUID_completion___block_invoke_3;
  v12[3] = &unk_24D057A68;
  v13 = v6;
  v14 = (id)MEMORY[0x2199B71D0](v15);
  v10[0] = v12[0];
  v10[1] = 3221225472;
  v10[2] = __44__ASClient_friendWithRemoteUUID_completion___block_invoke_5;
  v10[3] = &unk_24D057A40;
  v11 = v14;
  v8 = v14;
  v9 = v6;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v12, v10);

}

void __44__ASClient_friendWithRemoteUUID_completion___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a2;
  v8 = a4;
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__ASClient_friendWithRemoteUUID_completion___block_invoke_2;
  v13[3] = &unk_24D057C20;
  v15 = v8;
  v16 = v9;
  v17 = a3;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, v13);

}

uint64_t __44__ASClient_friendWithRemoteUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

void __44__ASClient_friendWithRemoteUUID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__ASClient_friendWithRemoteUUID_completion___block_invoke_4;
  v4[3] = &unk_24D057C70;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_friendWithRemoteUUID:completion:", v3, v4);

}

void __44__ASClient_friendWithRemoteUUID_completion___block_invoke_4(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  ASCodableFriend *v10;
  id v11;

  v7 = a4;
  v8 = 0;
  v11 = v7;
  if (a2 && !v7 && a3)
  {
    v9 = a2;
    v10 = -[ASCodableFriend initWithData:]([ASCodableFriend alloc], "initWithData:", v9);

    +[ASFriend friendWithCodableFriend:](ASFriend, "friendWithCodableFriend:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __44__ASClient_friendWithRemoteUUID_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleNotificationResponse:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[ASClient _clientQueueSuccessCompletion:](self, "_clientQueueSuccessCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__ASClient_handleNotificationResponse_completion___block_invoke;
  v13[3] = &unk_24D057A68;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __50__ASClient_handleNotificationResponse_completion___block_invoke_2;
  v11[3] = &unk_24D057A40;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

uint64_t __50__ASClient_handleNotificationResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_handleNotificationResponse:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __50__ASClient_handleNotificationResponse_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)queryAppBadgeCountWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__ASClient_queryAppBadgeCountWithCompletion___block_invoke;
  v9[3] = &unk_24D057AB8;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __45__ASClient_queryAppBadgeCountWithCompletion___block_invoke_3;
  v7[3] = &unk_24D057A40;
  v8 = v10;
  v6 = v10;
  -[ASClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __45__ASClient_queryAppBadgeCountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__ASClient_queryAppBadgeCountWithCompletion___block_invoke_2;
  v3[3] = &unk_24D057C98;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_queryAppBadgeCountWithCompletion:", v3);

}

uint64_t __45__ASClient_queryAppBadgeCountWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__ASClient_queryAppBadgeCountWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_remoteProxy:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *serverQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serverQueue = self->_serverQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ASClient__remoteProxy_errorHandler___block_invoke;
  block[3] = &unk_24D057CC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serverQueue, block);

}

void __38__ASClient__remoteProxy_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__ASClient__remoteProxy_errorHandler___block_invoke_2;
  v3[3] = &unk_24D057A40;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "fetchProxyWithHandler:errorHandler:", v1, v3);

}

void __38__ASClient__remoteProxy_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  ASLoggingInitialize();
  v4 = ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR))
    __38__ASClient__remoteProxy_errorHandler___block_invoke_2_cold_1((uint64_t)v3, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_clientQueueSuccessCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__ASClient__clientQueueSuccessCompletion___block_invoke;
  v8[3] = &unk_24D057BA8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x2199B71D0](v8);

  return v6;
}

void __42__ASClient__clientQueueSuccessCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__ASClient__clientQueueSuccessCompletion___block_invoke_2;
    block[3] = &unk_24D057B80;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __42__ASClient__clientQueueSuccessCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
}

void __38__ASClient__remoteProxy_errorHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21381F000, a2, OS_LOG_TYPE_ERROR, "Unable to get plugin proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end
