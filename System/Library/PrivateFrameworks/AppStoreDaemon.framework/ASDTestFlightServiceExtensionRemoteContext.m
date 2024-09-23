@implementation ASDTestFlightServiceExtensionRemoteContext

- (void)_checkExtensionWithErrorReply:(void *)a3 invokeBlock:
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void (**v8)(id, _QWORD, void *);

  v8 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "extensionInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5[2](v5, v6);
    }
    else
    {
      ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDTestFlightServiceErrorDomain"), 901, CFSTR("Missing extension instance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v7);

    }
  }

}

- (void)didReceivePushToken:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__ASDTestFlightServiceExtensionRemoteContext_didReceivePushToken_reply___block_invoke;
  v10[3] = &unk_1E37BF898;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ASDTestFlightServiceExtensionRemoteContext _checkExtensionWithErrorReply:invokeBlock:](self, v8, v10);

}

uint64_t __72__ASDTestFlightServiceExtensionRemoteContext_didReceivePushToken_reply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReceivePushToken:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)didReceivePushMessages:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__ASDTestFlightServiceExtensionRemoteContext_didReceivePushMessages_reply___block_invoke;
  v10[3] = &unk_1E37BF898;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ASDTestFlightServiceExtensionRemoteContext _checkExtensionWithErrorReply:invokeBlock:](self, v8, v10);

}

uint64_t __75__ASDTestFlightServiceExtensionRemoteContext_didReceivePushMessages_reply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReceivePushMessages:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)didReachTerminalPhaseWithBetaBundle:(id)a3 terminalPhase:(int64_t)a4 error:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __108__ASDTestFlightServiceExtensionRemoteContext_didReachTerminalPhaseWithBetaBundle_terminalPhase_error_reply___block_invoke;
  v16[3] = &unk_1E37BF8C0;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a4;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[ASDTestFlightServiceExtensionRemoteContext _checkExtensionWithErrorReply:invokeBlock:](self, v13, v16);

}

void __108__ASDTestFlightServiceExtensionRemoteContext_didReachTerminalPhaseWithBetaBundle_terminalPhase_error_reply___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReachTerminalPhaseWithBetaBundleID:terminalPhase:error:reply:", v5, a1[7], a1[5], a1[6]);

}

- (void)reloadAppsFromServerWithReply:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__ASDTestFlightServiceExtensionRemoteContext_reloadAppsFromServerWithReply___block_invoke;
  v6[3] = &unk_1E37BF8E8;
  v7 = v4;
  v5 = v4;
  -[ASDTestFlightServiceExtensionRemoteContext _checkExtensionWithErrorReply:invokeBlock:](self, v5, v6);

}

uint64_t __76__ASDTestFlightServiceExtensionRemoteContext_reloadAppsFromServerWithReply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadAppsFromServerWithReply:", *(_QWORD *)(a1 + 32));
}

- (void)invokeCommand:(id)a3 withArguments:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__ASDTestFlightServiceExtensionRemoteContext_invokeCommand_withArguments_reply___block_invoke;
  v14[3] = &unk_1E37BF910;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[ASDTestFlightServiceExtensionRemoteContext _checkExtensionWithErrorReply:invokeBlock:](self, v11, v14);

}

uint64_t __80__ASDTestFlightServiceExtensionRemoteContext_invokeCommand_withArguments_reply___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "invokeCommand:withArguments:reply:", a1[4], a1[5], a1[6]);
}

- (void)serviceExtensionPerformCleanup
{
  -[ASDTestFlightServiceExtensionRemoteContext setExtensionInstance:](self, "setExtensionInstance:", 0);
  -[ASDTestFlightServiceExtensionRemoteContext completeRequestReturningItems:completionHandler:](self, "completeRequestReturningItems:completionHandler:", 0, 0);
}

- (void)serviceExtensionTimeWillExpire
{
  id v2;

  -[ASDTestFlightServiceExtensionRemoteContext extensionInstance](self, "extensionInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceExtensionTimeWillExpire");

}

- (ASDTestFlightServiceExtension)extensionInstance
{
  return self->_extensionInstance;
}

- (void)setExtensionInstance:(id)a3
{
  objc_storeStrong((id *)&self->_extensionInstance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionInstance, 0);
}

@end
