@implementation GEOOfflineServiceStateSubscribeRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOOfflineServiceStateSubscribeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("offlinestate.subscribe"), a3, a4, a5);
}

- (GEOOfflineServiceStateSubscribeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOOfflineServiceStateSubscribeRequest *v7;
  GEOOfflineServiceStateSubscribeRequest *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineServiceStateSubscribeRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_subscribe = xpc_dictionary_get_BOOL(v6, "subscribe");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineServiceStateSubscribeRequest;
  v4 = a3;
  -[GEOXPCRequest encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_BOOL(v4, "subscribe", self->_subscribe);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (BOOL)subscribe
{
  return self->_subscribe;
}

- (void)setSubscribe:(BOOL)a3
{
  self->_subscribe = a3;
}

@end
