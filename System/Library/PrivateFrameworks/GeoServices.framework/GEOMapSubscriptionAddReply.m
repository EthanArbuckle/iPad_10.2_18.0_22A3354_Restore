@implementation GEOMapSubscriptionAddReply

- (GEOMapSubscriptionAddReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionAddReply *v7;
  const void *data;
  void *v9;
  uint64_t v10;
  GEOMapDataSubscription *subscription;
  GEOMapSubscriptionAddReply *v12;
  size_t length;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapSubscriptionAddReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v15, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "subscription", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      subscription = v7->_subscription;
      v7->_subscription = (GEOMapDataSubscription *)v10;

    }
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEOMapDataSubscription *subscription;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOMapSubscriptionAddReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  subscription = self->_subscription;
  if (subscription)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", subscription, 1, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "subscription", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
}

- (BOOL)isValid
{
  return 1;
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
}

@end
