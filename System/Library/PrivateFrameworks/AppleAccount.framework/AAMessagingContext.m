@implementation AAMessagingContext

- (AAMessagingContext)initWithContext:(id)a3
{
  id v5;
  AAMessagingContext *v6;
  AAMessagingContext *v7;
  uint64_t v8;
  NSString *outgoingResponseIdentifier;
  uint64_t v10;
  NSString *senderCorrelationIdentifier;
  uint64_t v12;
  NSString *incomingResponseIdentifier;
  void *v14;
  AAMessagingDestination *v15;
  void *v16;
  uint64_t v17;
  AAMessagingDestination *fromID;
  AAMessagingDestination *v19;
  void *v20;
  uint64_t v21;
  AAMessagingDestination *toID;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AAMessagingContext;
  v6 = -[AAMessagingContext init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_expectsPeerResponse = -[IDSMessageContext expectsPeerResponse](v7->_context, "expectsPeerResponse");
    -[IDSMessageContext outgoingResponseIdentifier](v7->_context, "outgoingResponseIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    outgoingResponseIdentifier = v7->_outgoingResponseIdentifier;
    v7->_outgoingResponseIdentifier = (NSString *)v8;

    -[IDSMessageContext senderCorrelationIdentifier](v7->_context, "senderCorrelationIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    senderCorrelationIdentifier = v7->_senderCorrelationIdentifier;
    v7->_senderCorrelationIdentifier = (NSString *)v10;

    -[IDSMessageContext incomingResponseIdentifier](v7->_context, "incomingResponseIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    incomingResponseIdentifier = v7->_incomingResponseIdentifier;
    v7->_incomingResponseIdentifier = (NSString *)v12;

    -[IDSMessageContext fromID](v7->_context, "fromID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [AAMessagingDestination alloc];
      -[IDSMessageContext fromID](v7->_context, "fromID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[AAMessagingDestination initWithHandle:](v15, "initWithHandle:", v16);
      fromID = v7->_fromID;
      v7->_fromID = (AAMessagingDestination *)v17;

      v19 = [AAMessagingDestination alloc];
      -[IDSMessageContext toID](v7->_context, "toID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[AAMessagingDestination initWithHandle:](v19, "initWithHandle:", v20);
      toID = v7->_toID;
      v7->_toID = (AAMessagingDestination *)v21;

    }
  }

  return v7;
}

- (NSString)outgoingResponseIdentifier
{
  return self->_outgoingResponseIdentifier;
}

- (NSString)incomingResponseIdentifier
{
  return self->_incomingResponseIdentifier;
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (AAMessagingDestination)fromID
{
  return self->_fromID;
}

- (AAMessagingDestination)toID
{
  return self->_toID;
}

- (BOOL)expectsPeerResponse
{
  return self->_expectsPeerResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toID, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_incomingResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_outgoingResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
