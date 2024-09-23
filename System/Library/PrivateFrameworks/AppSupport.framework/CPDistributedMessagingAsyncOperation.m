@implementation CPDistributedMessagingAsyncOperation

- (CPDistributedMessagingAsyncOperation)initWithCenter:(id)a3 messageName:(id)a4 userInfoData:(id)a5 oolKey:(id)a6 oolData:(id)a7 target:(id)a8 selector:(SEL)a9 context:(void *)a10 makeServer:(BOOL)a11
{
  CPDistributedMessagingAsyncOperation *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CPDistributedMessagingAsyncOperation;
  v17 = -[CPDistributedMessagingAsyncOperation init](&v19, sel_init);
  if (v17)
  {
    v17->_center = (CPDistributedMessagingCenter *)a3;
    v17->_name = (NSString *)objc_msgSend(a4, "copy");
    v17->_userInfoData = (NSData *)objc_msgSend(a5, "copy");
    v17->_oolKey = (NSString *)objc_msgSend(a6, "copy");
    v17->_oolData = (NSData *)a7;
    v17->_target = a8;
    v17->_selector = a9;
    v17->_context = a10;
    v17->_calloutThread = (NSThread *)(id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v17->_makeServer = a11;
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[CPDistributedMessagingAsyncOperation _releaseSendingData](self, "_releaseSendingData");

  v3.receiver = self;
  v3.super_class = (Class)CPDistributedMessagingAsyncOperation;
  -[CPDistributedMessagingAsyncOperation dealloc](&v3, sel_dealloc);
}

- (void)_releaseSendingData
{
  NSData *userInfoData;
  NSString *oolKey;
  NSData *oolData;

  userInfoData = self->_userInfoData;
  if (userInfoData)
  {

    self->_userInfoData = 0;
  }
  oolKey = self->_oolKey;
  if (oolKey)
  {

    self->_oolKey = 0;
  }
  oolData = self->_oolData;
  if (oolData)
  {

    self->_oolData = 0;
  }
}

- (void)main
{
  NSDictionary **p_reply;
  NSError **p_error;
  NSDictionary *v5;
  NSError *v6;
  uint64_t v7;

  p_reply = &self->_reply;
  p_error = &self->_error;
  LOBYTE(v7) = 0;
  -[CPDistributedMessagingCenter _sendMessage:userInfoData:oolKey:oolData:makeServer:receiveReply:nonBlocking:error:](self->_center, "_sendMessage:userInfoData:oolKey:oolData:makeServer:receiveReply:nonBlocking:error:", self->_name, self->_userInfoData, self->_oolKey, self->_oolData, self->_makeServer, &self->_reply, v7, &self->_error);
  if (*p_reply)
    v5 = *p_reply;
  if (*p_error)
    v6 = *p_error;
  -[CPDistributedMessagingAsyncOperation _releaseSendingData](self, "_releaseSendingData");
  -[CPDistributedMessagingAsyncOperation performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__performCallout, self->_calloutThread, 0, 0);
}

- (void)_performCallout
{
  objc_msgSend(self->_target, self->_selector, self->_center, self->_reply, self->_error, self->_context);
}

@end
