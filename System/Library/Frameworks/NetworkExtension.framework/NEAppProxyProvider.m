@implementation NEAppProxyProvider

- (void)startProxyWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = CFSTR("startProxyWithOptions:completionHandler: not implemented");
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = completionHandler;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("NEAppProxyProviderDefaultErrorDomain"), 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void *, void *))completionHandler + 2))(v7, v9);

}

- (void)stopProxyWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler
{
  (*((void (**)(void *))completionHandler + 2))(completionHandler);
}

- (void)cancelProxyWithError:(NSError *)error
{
  NSError *v4;
  id v5;

  v4 = error;
  -[NEProvider context](self, "context");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelWithError:", v4);

}

- (BOOL)handleNewFlow:(NEAppProxyFlow *)flow
{
  return 0;
}

- (BOOL)handleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  BOOL v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[NEProvider _callSwiftHandleNewUDPFlow:initialRemoteFlowEndpoint:](self, "_callSwiftHandleNewUDPFlow:initialRemoteFlowEndpoint:", v6, v7);
  if (v8 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CCEC78], "endpointWithCEndpoint:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NEAppProxyProvider handleNewUDPFlow:initialRemoteEndpoint:](self, "handleNewUDPFlow:initialRemoteEndpoint:", v6, v10);

  }
  else
  {
    v9 = v8 != 0;
  }

  return v9;
}

- (void)setMaxWriteSize:(unint64_t)a3
{
  void *v3;
  id v4;

  -[NEProvider context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    NEFlowDirectorSetMaxSendSize();
    v3 = v4;
  }

}

- (unint64_t)maxWriteSize
{
  void *v2;
  unint64_t MaxSendSize;

  -[NEProvider context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    MaxSendSize = NEFlowDirectorGetMaxSendSize();
  else
    MaxSendSize = 0;

  return MaxSendSize;
}

- (void)fetchFlowStatesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD *v7;
  id v8;

  v4 = a3;
  -[NEProvider context](self, "context");
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v7)
  {
    if (v7[15])
    {
      v8 = v5;
      NEFlowDirectorFetchFlowStates();

    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99D20]);
      (*((void (**)(id, id))v5 + 2))(v5, v6);

    }
  }

}

@end
