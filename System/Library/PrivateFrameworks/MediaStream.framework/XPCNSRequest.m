@implementation XPCNSRequest

- (XPCNSRequest)initWithXPCRequest:(id)a3
{
  id v5;
  XPCNSRequest *v6;
  XPCNSRequest *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  id v22;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)XPCNSRequest;
  v6 = -[XPCNSRequest init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    objc_msgSend(v5, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = 0;
    v9 = _unpack(v8, &v22, &v21);
    v10 = v22;
    v11 = v22;
    v12 = v21;
    v13 = v21;

    if (v9)
    {
      objc_storeStrong((id *)&v7->_message, v10);
      objc_storeStrong((id *)&v7->_data, v12);
    }
    else
    {
      if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
        _XPCLog(3, CFSTR("%@: Could not initialize object."), v14, v15, v16, v17, v18, v19, (uint64_t)v7);

      v7 = 0;
    }

  }
  return v7;
}

- (void)sendReply:(id)a3
{
  XPCRequest *request;
  id v5;
  void *v6;
  int inserted;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  request = self->_request;
  v5 = a3;
  -[XPCRequest reply](request, "reply");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  inserted = _insertMessage(v6, v5, 0, 0, 0);

  if (inserted)
  {
    -[XPCRequest sendReply](self->_request, "sendReply");
  }
  else if (_shouldLogBlock)
  {
    if ((*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      _XPCLog(3, CFSTR("%@: Cannot send reply."), v8, v9, v10, v11, v12, v13, (uint64_t)self);
  }
}

- (NSCoding)message
{
  return self->_message;
}

- (NSData)data
{
  return self->_data;
}

- (XPCRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
