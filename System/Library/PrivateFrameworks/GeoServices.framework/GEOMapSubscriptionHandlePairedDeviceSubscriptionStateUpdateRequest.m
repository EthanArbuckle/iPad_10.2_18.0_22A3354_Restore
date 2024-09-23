@implementation GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("subscriptions.handlePairedDeviceStateUpdate"), a3, a4, a5);
}

- (GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest *v7;
  const void *data;
  void *v9;
  uint64_t v10;
  NSData *serializedState;
  GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest *v12;
  size_t length;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v15, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "serializedState", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      serializedState = v7->_serializedState;
      v7->_serializedState = (NSData *)v10;

    }
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSData *serializedState;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  serializedState = self->_serializedState;
  if (serializedState)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", serializedState, 1, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "serializedState", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (NSData)serializedState
{
  return self->_serializedState;
}

- (void)setSerializedState:(id)a3
{
  objc_storeStrong((id *)&self->_serializedState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedState, 0);
}

@end
