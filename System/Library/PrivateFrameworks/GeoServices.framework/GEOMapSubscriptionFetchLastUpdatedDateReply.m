@implementation GEOMapSubscriptionFetchLastUpdatedDateReply

- (GEOMapSubscriptionFetchLastUpdatedDateReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionFetchLastUpdatedDateReply *v7;
  GEOMapSubscriptionFetchLastUpdatedDateReply *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapSubscriptionFetchLastUpdatedDateReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_timestamp = xpc_dictionary_get_double(v6, "timestamp");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOMapSubscriptionFetchLastUpdatedDateReply;
  v4 = a3;
  -[GEOXPCReply encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_double(v4, "timestamp", self->_timestamp);

}

- (BOOL)isValid
{
  return 1;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
