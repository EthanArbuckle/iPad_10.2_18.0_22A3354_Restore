@implementation GEOMapSubscriptionGetPairedDeviceSubscriptionsToObserveReply

- (GEOMapSubscriptionGetPairedDeviceSubscriptionsToObserveReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionGetPairedDeviceSubscriptionsToObserveReply *v7;
  const void *data;
  void *v9;
  uint64_t v10;
  NSData *serializedReply;
  GEOMapSubscriptionGetPairedDeviceSubscriptionsToObserveReply *v12;
  size_t length;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapSubscriptionGetPairedDeviceSubscriptionsToObserveReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v15, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "serializedReply", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      serializedReply = v7->_serializedReply;
      v7->_serializedReply = (NSData *)v10;

    }
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSData *serializedReply;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOMapSubscriptionGetPairedDeviceSubscriptionsToObserveReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  serializedReply = self->_serializedReply;
  if (serializedReply)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", serializedReply, 1, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "serializedReply", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
}

- (BOOL)isValid
{
  return 1;
}

- (NSData)serializedReply
{
  return self->_serializedReply;
}

- (void)setSerializedReply:(id)a3
{
  objc_storeStrong((id *)&self->_serializedReply, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedReply, 0);
}

@end
