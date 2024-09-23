@implementation _CATXPCTransportSendMessageOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  NSObject *v3;
  void *v4;
  id v5;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[_CATXPCTransportSendMessageOperation transport](self, "transport");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && !-[CATOperation isCanceled](self, "isCanceled"))
  {
    -[_CATXPCTransportSendMessageOperation message](self, "message");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transportSendMessageOperation:processMessage:", self, v4);
  }
  else
  {
    CATErrorWithCodeAndUserInfo(404, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperation endOperationWithError:](self, "endOperationWithError:", v4);
  }

}

- (void)didProcessMessage
{
  if (-[CATOperation isExecuting](self, "isExecuting"))
    -[CATOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

- (void)didFailWithError:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CATOperation isExecuting](self, "isExecuting"))
    -[CATOperation endOperationWithError:](self, "endOperationWithError:", v4);

}

- (CATXPCTransport)transport
{
  return (CATXPCTransport *)objc_loadWeakRetained((id *)&self->_transport);
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
