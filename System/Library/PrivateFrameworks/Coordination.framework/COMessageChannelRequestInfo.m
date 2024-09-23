@implementation COMessageChannelRequestInfo

- (COMessageChannelRequestInfo)initWithRequestID:(unsigned int)a3 type:(int64_t)a4 request:(id)a5
{
  id v9;
  COMessageChannelRequestInfo *v10;
  COMessageChannelRequestInfo *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)COMessageChannelRequestInfo;
  v10 = -[COMessageChannelRequestInfo init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_requestID = a3;
    v10->_requestType = a4;
    objc_storeStrong((id *)&v10->_request, a5);
    objc_storeStrong((id *)&v11->_destinationInfo, CFSTR("unknown"));
  }

  return v11;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (unsigned)requestID
{
  return self->_requestID;
}

- (unint64_t)expectedRecipients
{
  return self->_expectedRecipients;
}

- (void)setExpectedRecipients:(unint64_t)a3
{
  self->_expectedRecipients = a3;
}

- (unint64_t)receivedResponses
{
  return self->_receivedResponses;
}

- (void)setReceivedResponses:(unint64_t)a3
{
  self->_receivedResponses = a3;
}

- (COMessageChannelRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSString)destinationInfo
{
  return self->_destinationInfo;
}

- (void)setDestinationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (void)setMessageSize:(unint64_t)a3
{
  self->_messageSize = a3;
}

- (id)recipientCallback
{
  return self->_recipientCallback;
}

- (void)setRecipientCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)responseCallback
{
  return self->_responseCallback;
}

- (void)setResponseCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseCallback, 0);
  objc_storeStrong(&self->_recipientCallback, 0);
  objc_storeStrong((id *)&self->_destinationInfo, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
