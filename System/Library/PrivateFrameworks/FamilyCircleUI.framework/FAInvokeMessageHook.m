@implementation FAInvokeMessageHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v4;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[FAInvokeMessageHook transportWithActionString:](self, "transportWithActionString:", v4) != -1;

  return (char)self;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE04C48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[FAInvokeMessageHook transportWithActionString:](self, "transportWithActionString:", v5) != -1;
  return (char)self;
}

- (int64_t)transportWithActionString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("family:iMessageInvite")) & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("family:shareSheetInvite")))
  {
    v4 = 1;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v9, "startActivityIndicator");
  objc_msgSend(v16, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "visiblePage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewForElementIdentifier:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "clientInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAInvokeMessageHook _presentMessagesInviteWithServerAttributes:transport:sourceView:completion:](self, "_presentMessagesInviteWithServerAttributes:transport:sourceView:completion:", v14, -[FAInvokeMessageHook transportWithActionString:](self, "transportWithActionString:", v15), v11, v10);

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  FAInvokeMessageHook *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__FAInvokeMessageHook_processObjectModel_completion___block_invoke;
  block[3] = &unk_24C88CB78;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __53__FAInvokeMessageHook_processObjectModel_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "startActivityIndicator");
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sourceElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "visiblePage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewForElementIdentifier:", v3);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE04C48]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_presentMessagesInviteWithServerAttributes:transport:sourceView:completion:", v6, objc_msgSend(v7, "transportWithActionString:", v9), v10, *(_QWORD *)(a1 + 48));

}

- (void)_presentMessagesInviteWithServerAttributes:(id)a3 transport:(int64_t)a4 sourceView:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id completion;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  FAInvokeMessageHook *v21;
  id v22;
  id v23;
  int64_t v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  _FALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DE41000, v11, OS_LOG_TYPE_DEFAULT, "Present messsage invite triggered", buf, 2u);
  }

  _FALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    _os_log_impl(&dword_20DE41000, v12, OS_LOG_TYPE_DEFAULT, "Attributes - %@", buf, 0xCu);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30AA8]), "initWithResults:", v9);
  v14 = (void *)objc_msgSend(v10, "copy");
  completion = self->_completion;
  self->_completion = v14;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__FAInvokeMessageHook__presentMessagesInviteWithServerAttributes_transport_sourceView_completion___block_invoke;
  block[3] = &unk_24C88D358;
  v23 = v10;
  v24 = a4;
  v20 = v13;
  v21 = self;
  v22 = v9;
  v16 = v10;
  v17 = v9;
  v18 = v13;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __98__FAInvokeMessageHook__presentMessagesInviteWithServerAttributes_transport_sourceView_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  FAShareSheetInviteConfigurationController *v4;
  uint64_t v5;
  id v6;
  void *v7;
  FAShareSheetInviteConfigurationController *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  FAMessagesInviteConfigurationController *v14;
  uint64_t v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 64);
  switch(v2)
  {
    case -1:
      _FALogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Device unknown transport messages";
LABEL_11:
        _os_log_impl(&dword_20DE41000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      }
LABEL_12:

      v21 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE30900], -1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v22);

      break;
    case 0:
      if (+[FAMessagesInviteConfigurationController isAvailable](FAMessagesInviteConfigurationController, "isAvailable"))
      {
        v14 = [FAMessagesInviteConfigurationController alloc];
        v15 = *(_QWORD *)(a1 + 32);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
        objc_msgSend(WeakRetained, "presentationContextForHook:", *(_QWORD *)(a1 + 40));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[FAMessagesInviteConfigurationController initWithInviteContext:presentingController:](v14, "initWithInviteContext:presentingController:", v15, v17);
        v19 = *(_QWORD *)(a1 + 40);
        v20 = *(void **)(v19 + 8);
        *(_QWORD *)(v19 + 8) = v18;

        break;
      }
      _FALogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Device cannot send messages";
        goto LABEL_11;
      }
      goto LABEL_12;
    case 1:
      +[FamilyInviteAnalytics shared](_TtC14FamilyCircleUI21FamilyInviteAnalytics, "shared");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sendTapInviteOthersEvent");

      v4 = [FAShareSheetInviteConfigurationController alloc];
      v5 = *(_QWORD *)(a1 + 32);
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
      objc_msgSend(v6, "presentationContextForHook:", *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[FAShareSheetInviteConfigurationController initWithInviteContext:presentingController:](v4, "initWithInviteContext:presentingController:", v5, v7);

      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("alwaysNotifyServer"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAShareSheetInviteConfigurationController setAlwaysNotifyServer:](v8, "setAlwaysNotifyServer:", objc_msgSend(v9, "BOOLValue"));

      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(v10 + 8);
      *(_QWORD *)(v10 + 8) = v8;

      break;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setDelegate:");
  v23 = *(_QWORD *)(a1 + 40);
  v24 = *(void **)(v23 + 8);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __98__FAInvokeMessageHook__presentMessagesInviteWithServerAttributes_transport_sourceView_completion___block_invoke_28;
  v25[3] = &unk_24C88D330;
  v25[4] = v23;
  v26 = *(id *)(a1 + 56);
  objc_msgSend(v24, "presentWhenReadyWithCompletion:", v25);

}

void __98__FAInvokeMessageHook__presentMessagesInviteWithServerAttributes_transport_sourceView_completion___block_invoke_28(uint64_t a1, char a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopActivityIndicator");

  if ((a2 & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_stringForCompletionStatus:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_24C88D378[a3];
}

- (void)inviteController:(id)a3 didFinishWithStatus:(unint64_t)a4 recipients:(id)a5 userInfo:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  RUIServerHookResponse *v21;
  RUIServerHookResponse *serverHookResponse;
  id v23;
  void (**completion)(id, BOOL, id);
  id v25;
  int v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a6;
  v13 = a7;
  _FALogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 134217984;
    v27 = a4;
    _os_log_impl(&dword_20DE41000, v14, OS_LOG_TYPE_DEFAULT, "Message Invite Controller did finish with status: %lu", (uint8_t *)&v26, 0xCu);
  }

  _FALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v16)
    {
      v26 = 138412290;
      v27 = (unint64_t)v11;
      _os_log_impl(&dword_20DE41000, v15, OS_LOG_TYPE_DEFAULT, "Recipient key is not nil %@", (uint8_t *)&v26, 0xCu);
    }

    +[FamilyInviteAnalytics shared](_TtC14FamilyCircleUI21FamilyInviteAnalytics, "shared");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE30940]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendOtherContactInvitedEventWithInviteTransport:inviteCompletionStatus:", v18, a4);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    v15 = v19;
    if (v12)
      -[NSObject addEntriesFromDictionary:](v19, "addEntriesFromDictionary:", v12);
    -[FAInvokeMessageHook _stringForCompletionStatus:](self, "_stringForCompletionStatus:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE30938]);

    -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE30930]);
    v21 = (RUIServerHookResponse *)objc_alloc_init(MEMORY[0x24BE7EE00]);
    serverHookResponse = self->_serverHookResponse;
    self->_serverHookResponse = v21;

    v23 = -[NSObject copy](v15, "copy");
    -[RUIServerHookResponse setAdditionalPayload:](self->_serverHookResponse, "setAdditionalPayload:", v23);

    completion = (void (**)(id, BOOL, id))self->_completion;
    if (completion)
    {
      completion[2](completion, a4 == 1, v13);
      v25 = self->_completion;
      self->_completion = 0;

    }
  }
  else if (v16)
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_20DE41000, v15, OS_LOG_TYPE_DEFAULT, "Recipient key is nil, not sending the invite details to the server", (uint8_t *)&v26, 2u);
  }

}

- (void)inviteControllerDidStartAsyncLoading:(id)a3
{
  id v3;

  -[FAInvokeMessageHook objectModel](self, "objectModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startActivityIndicator");

}

- (void)inviteControllerDidEndAsyncLoading:(id)a3
{
  id v3;

  -[FAInvokeMessageHook objectModel](self, "objectModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopActivityIndicator");

}

- (void)dismissWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v4 = a3;
  -[FAInvokeMessageHook remoteUIDelegate](self, "remoteUIDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDismissInfo:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (RUIObjectModel)objectModel
{
  return self->_objectModel;
}

- (void)setObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_objectModel, a3);
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
  objc_storeStrong((id *)&self->_serverHookResponse, a3);
}

- (FACircleRemoteUIDelegate)remoteUIDelegate
{
  return (FACircleRemoteUIDelegate *)objc_loadWeakRetained((id *)&self->_remoteUIDelegate);
}

- (void)setRemoteUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_remoteUIDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteUIDelegate);
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_objectModel, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_testContext, 0);
  objc_storeStrong((id *)&self->_messageConfigurationController, 0);
}

@end
