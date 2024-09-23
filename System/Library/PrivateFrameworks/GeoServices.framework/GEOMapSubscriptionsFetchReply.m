@implementation GEOMapSubscriptionsFetchReply

- (GEOMapSubscriptionsFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionsFetchReply *v7;
  const void *data;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *subscriptions;
  GEOMapSubscriptionsFetchReply *v16;
  size_t length;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOMapSubscriptionsFetchReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v19, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "subscriptions", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3710];
      v11 = (void *)MEMORY[0x1E0C99E60];
      v12 = objc_opt_class();
      objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v13, v9, a4);
      v14 = objc_claimAutoreleasedReturnValue();
      subscriptions = v7->_subscriptions;
      v7->_subscriptions = (NSArray *)v14;

    }
    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOMapSubscriptionsFetchReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v6, sel_encodeToXPCDictionary_, v4);
  if (-[NSArray count](self->_subscriptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_subscriptions, 1, 0);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "subscriptions", (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

  }
}

- (BOOL)isValid
{
  return 1;
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

@end
