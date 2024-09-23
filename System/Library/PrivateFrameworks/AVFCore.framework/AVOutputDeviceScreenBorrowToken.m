@implementation AVOutputDeviceScreenBorrowToken

- (AVOutputDeviceScreenBorrowToken)initWithEndpoint:(OpaqueFigEndpoint *)a3 client:(id)a4 reason:(id)a5
{
  AVOutputDeviceScreenBorrowToken *v8;
  OpaqueFigEndpoint *v9;
  OpaqueFigEndpoint *endpoint;
  NSString *client;
  NSString *reason;
  void (*v13)(OpaqueFigEndpoint *, NSString *, NSString *);
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVOutputDeviceScreenBorrowToken;
  v8 = -[AVOutputDeviceScreenBorrowToken init](&v15, sel_init);
  if (v8)
  {
    if (a3)
      v9 = (OpaqueFigEndpoint *)CFRetain(a3);
    else
      v9 = 0;
    v8->_endpoint = v9;
    v8->_client = (NSString *)objc_msgSend(a4, "copy");
    v8->_reason = (NSString *)objc_msgSend(a5, "copy");
    endpoint = v8->_endpoint;
    if (endpoint)
    {
      FigEndpointExtendedGetClassID();
      if (CMBaseObjectIsMemberOfClass())
      {
        client = v8->_client;
        reason = v8->_reason;
        v13 = *(void (**)(OpaqueFigEndpoint *, NSString *, NSString *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 24)
                                                                                 + 16);
        if (v13)
          v13(endpoint, client, reason);
      }
    }
  }
  return v8;
}

- (AVOutputDeviceScreenBorrowToken)init
{
  return -[AVOutputDeviceScreenBorrowToken initWithEndpoint:client:reason:](self, "initWithEndpoint:client:reason:", 0, 0, 0);
}

- (void)dealloc
{
  OpaqueFigEndpoint *endpoint;
  NSString *client;
  NSString *reason;
  void (*v6)(OpaqueFigEndpoint *, NSString *, NSString *);
  OpaqueFigEndpoint *v7;
  objc_super v8;

  endpoint = self->_endpoint;
  if (endpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      client = self->_client;
      reason = self->_reason;
      v6 = *(void (**)(OpaqueFigEndpoint *, NSString *, NSString *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24)
                                                                              + 24);
      if (v6)
        v6(endpoint, client, reason);
    }
    v7 = self->_endpoint;
    if (v7)
      CFRelease(v7);
  }

  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceScreenBorrowToken;
  -[AVOutputDeviceScreenBorrowToken dealloc](&v8, sel_dealloc);
}

- (NSString)client
{
  return self->_client;
}

- (NSString)reason
{
  return self->_reason;
}

@end
