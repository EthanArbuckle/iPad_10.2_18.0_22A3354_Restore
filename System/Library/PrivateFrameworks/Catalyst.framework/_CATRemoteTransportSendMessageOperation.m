@implementation _CATRemoteTransportSendMessageOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12[3];
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[_CATRemoteTransportSendMessageOperation transport](self, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !-[CATOperation isCanceled](self, "isCanceled"))
  {
    v6 = (void *)MEMORY[0x24BDD1618];
    -[_CATRemoteTransportSendMessageOperation message](self, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 0;
    objc_msgSend(v6, "cat_archivedDataWithRootObject:error:", v7, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12[0];

    if (v8)
    {
      -[_CATRemoteTransportSendMessageOperation didEncodeData:](self, "didEncodeData:", v8);
    }
    else
    {
      v13 = *MEMORY[0x24BDD1398];
      v14[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CATErrorWithCodeAndUserInfo(301, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATOperation endOperationWithError:](self, "endOperationWithError:", v11);

    }
  }
  else
  {
    CATErrorWithCodeAndUserInfo(404, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperation endOperationWithError:](self, "endOperationWithError:", v5);

  }
}

- (void)didEncodeData:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  -[_CATRemoteTransportSendMessageOperation transport](self, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !-[CATOperation isCanceled](self, "isCanceled"))
  {
    objc_msgSend(v5, "remoteTransportSendMessageOperation:sendData:", self, v7);
  }
  else
  {
    CATErrorWithCodeAndUserInfo(404, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperation endOperationWithError:](self, "endOperationWithError:", v6);

  }
}

- (void)didSendData
{
  -[CATOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

- (CATRemoteTransport)transport
{
  return (CATRemoteTransport *)objc_loadWeakRetained((id *)&self->_transport);
}

- (void)setTransport:(id)a3
{
  objc_storeWeak((id *)&self->_transport, a3);
}

- (CATMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_destroyWeak((id *)&self->_transport);
}

@end
