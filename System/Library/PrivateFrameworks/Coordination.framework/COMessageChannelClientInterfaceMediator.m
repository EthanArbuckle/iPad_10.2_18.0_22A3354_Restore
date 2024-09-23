@implementation COMessageChannelClientInterfaceMediator

- (COMessageChannelClientInterfaceMediator)initWithMessageChannel:(id)a3
{
  id v4;
  COMessageChannelClientInterfaceMediator *v5;
  COMessageChannelClientInterfaceMediator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COMessageChannelClientInterfaceMediator;
  v5 = -[COMessageChannelClientInterfaceMediator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_messageChannel, v4);

  return v6;
}

- (void)receivedRecipientListForRequestID:(unsigned int)a3 recipients:(id)a4
{
  uint64_t v4;
  id WeakRetained;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "receivedRecipientListForRequestID:recipients:", v4, v8);

}

- (void)receivedRequestWithPayload:(id)a3 payloadType:(id)a4 requestID:(unsigned int)a5 fromMember:(id)a6 withCallback:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  id v17;

  v9 = *(_QWORD *)&a5;
  v17 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);
  v16 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "receivedRequestWithPayload:payloadType:requestID:fromMember:withCallback:", v17, v12, v9, v13, v14);

}

- (void)receivedResponseForRequestID:(unsigned int)a3 responsePayload:(id)a4 responseType:(id)a5 responseError:(id)a6 fromMember:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  id v17;

  v10 = *(_QWORD *)&a3;
  v17 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);
  v16 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "receivedResponseForRequestID:responsePayload:responseType:responseError:fromMember:", v10, v17, v12, v13, v14);

}

- (void)failedToSendRequestWithID:(unsigned int)a3 withError:(id)a4
{
  uint64_t v4;
  id WeakRetained;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "failedToSendRequestWithID:withError:", v4, v8);

}

- (COMessageChannel)messageChannel
{
  return (COMessageChannel *)objc_loadWeakRetained((id *)&self->_messageChannel);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageChannel);
}

@end
