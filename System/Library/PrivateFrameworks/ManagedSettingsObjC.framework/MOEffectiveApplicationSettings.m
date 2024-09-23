@implementation MOEffectiveApplicationSettings

+ (id)newConnection
{
  id v2;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  v2 = +[MOManagedSettingsAgentConnection newConnection](MOManagedSettingsAgentConnection, "newConnection");
  objc_initWeak(&location, v2);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __47__MOEffectiveApplicationSettings_newConnection__block_invoke;
  v7 = &unk_1E675E388;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v2, "setInterruptionHandler:", &v4);
  objc_msgSend(v2, "activate", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v2;
}

void __47__MOEffectiveApplicationSettings_newConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

+ (void)askToOverrideUnremovabilityOfApplication:(id)a3 teamIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(a1, "newConnection");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __108__MOEffectiveApplicationSettings_askToOverrideUnremovabilityOfApplication_teamIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E675E6E8;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v11, 1, v15);
  objc_msgSend(v11, "invalidate");

}

uint64_t __108__MOEffectiveApplicationSettings_askToOverrideUnremovabilityOfApplication_teamIdentifier_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "askToOverrideUnremovabilityOfApplication:teamIdentifier:replyHandler:", a1[4], a1[5], a1[6]);
  else
    return (*(uint64_t (**)(void))(a1[6] + 16))();
}

@end
