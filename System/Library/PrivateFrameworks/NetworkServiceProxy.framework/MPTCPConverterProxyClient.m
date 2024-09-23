@implementation MPTCPConverterProxyClient

+ (id)getServerConnection
{
  if (qword_1ED062A70 != -1)
    dispatch_once(&qword_1ED062A70, &__block_literal_global_8);
  return (id)_MergedGlobals_34;
}

void __48__MPTCPConverterProxyClient_getServerConnection__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[NSPServerClient initWithCallbackQueue:]([NSPServerClient alloc], 0);
  v1 = (void *)_MergedGlobals_34;
  _MergedGlobals_34 = (uint64_t)v0;

}

+ (void)startProxyToMPTCPConverterProxyWithCompletionHandler:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  +[MPTCPConverterProxyClient getServerConnection](MPTCPConverterProxyClient, "getServerConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__MPTCPConverterProxyClient_startProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E41379B0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "startProxyToMPTCPConverterProxyWithCompletionHandler:", v10);

}

void __100__MPTCPConverterProxyClient_startProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __100__MPTCPConverterProxyClient_startProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke_2;
      v6[3] = &unk_1E4137988;
      v8 = v5;
      v7 = v3;
      dispatch_async(v4, v6);

    }
  }

}

uint64_t __100__MPTCPConverterProxyClient_startProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)stopProxyToMPTCPConverterProxyWithCompletionHandler:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  +[MPTCPConverterProxyClient getServerConnection](MPTCPConverterProxyClient, "getServerConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__MPTCPConverterProxyClient_stopProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E41379B0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "stopProxyToMPTCPConverterProxyWithCompletionHandler:", v10);

}

void __99__MPTCPConverterProxyClient_stopProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __99__MPTCPConverterProxyClient_stopProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke_2;
      v6[3] = &unk_1E4137988;
      v8 = v5;
      v7 = v3;
      dispatch_async(v4, v6);

    }
  }

}

uint64_t __99__MPTCPConverterProxyClient_stopProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
