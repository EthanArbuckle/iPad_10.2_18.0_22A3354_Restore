@implementation MSPSharedTripSubscriptionToken

- (MSPSharedTripSubscriptionToken)initWithSharedTripIdentifier:(id)a3 invalidationHandler:(id)a4
{
  id v7;
  id v8;
  MSPSharedTripSubscriptionToken *v9;
  MSPSharedTripSubscriptionToken *v10;
  uint64_t v11;
  id invalidationHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSPSharedTripSubscriptionToken;
  v9 = -[MSPSharedTripSubscriptionToken init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharedTripIdentifier, a3);
    v11 = objc_msgSend(v8, "copy");
    invalidationHandler = v10->_invalidationHandler;
    v10->_invalidationHandler = (id)v11;

  }
  return v10;
}

- (void)dealloc
{
  id invalidationHandler;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;
  objc_super v6;

  invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E2B4E8](invalidationHandler, a2);
    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    ((void (**)(_QWORD, MSPSharedTripSubscriptionToken *, NSString *))v4)[2](v4, self, self->_sharedTripIdentifier);
  }
  v6.receiver = self;
  v6.super_class = (Class)MSPSharedTripSubscriptionToken;
  -[MSPSharedTripSubscriptionToken dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_sharedTripIdentifier, 0);
}

@end
