@implementation AVExternalDeviceScreenBorrowToken

- (AVExternalDeviceScreenBorrowToken)initWithExternalDevice:(id)a3 client:(id)a4 reason:(id)a5
{
  AVExternalDeviceScreenBorrowToken *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *client;
  NSString *reason;
  void (*v13)(uint64_t, NSString *, NSString *);
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVExternalDeviceScreenBorrowToken;
  v8 = -[AVExternalDeviceScreenBorrowToken init](&v15, sel_init);
  if (v8)
  {
    v8->_externalDevice = (AVExternalDevice *)a3;
    v8->_client = (NSString *)objc_msgSend(a4, "copy");
    v8->_reason = (NSString *)objc_msgSend(a5, "copy");
    v9 = -[AVExternalDevice figEndpoint](v8->_externalDevice, "figEndpoint");
    if (v9)
    {
      v10 = v9;
      FigEndpointExtendedGetClassID();
      if (CMBaseObjectIsMemberOfClass())
      {
        client = v8->_client;
        reason = v8->_reason;
        v13 = *(void (**)(uint64_t, NSString *, NSString *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 16);
        if (v13)
          v13(v10, client, reason);
      }
    }
  }
  return v8;
}

- (AVExternalDeviceScreenBorrowToken)init
{
  return -[AVExternalDeviceScreenBorrowToken initWithExternalDevice:client:reason:](self, "initWithExternalDevice:client:reason:", 0, 0, 0);
}

- (void)dealloc
{
  OpaqueFigEndpoint *v3;
  OpaqueFigEndpoint *v4;
  NSString *client;
  NSString *reason;
  void (*v7)(OpaqueFigEndpoint *, NSString *, NSString *);
  objc_super v8;

  v3 = -[AVExternalDevice figEndpoint](self->_externalDevice, "figEndpoint");
  if (v3)
  {
    v4 = v3;
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      client = self->_client;
      reason = self->_reason;
      v7 = *(void (**)(OpaqueFigEndpoint *, NSString *, NSString *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24)
                                                                              + 24);
      if (v7)
        v7(v4, client, reason);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)AVExternalDeviceScreenBorrowToken;
  -[AVExternalDeviceScreenBorrowToken dealloc](&v8, sel_dealloc);
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
