@implementation GEOMapSubscriptionSetPairedDeviceSyncRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionSetPairedDeviceSyncRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("subscriptions.setPairedDeviceSyncBehavior"), a3, a4, a5);
}

- (GEOMapSubscriptionSetPairedDeviceSyncRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionSetPairedDeviceSyncRequest *v7;
  const char *string;
  uint64_t v9;
  NSString *identifier;
  GEOMapSubscriptionSetPairedDeviceSyncRequest *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMapSubscriptionSetPairedDeviceSyncRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v13, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    string = xpc_dictionary_get_string(v6, "identifier");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v9 = objc_claimAutoreleasedReturnValue();
      identifier = v7->_identifier;
      v7->_identifier = (NSString *)v9;

    }
    v7->_shouldSync = xpc_dictionary_get_BOOL(v6, "shouldSync");
    v11 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSString *identifier;
  const char *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOMapSubscriptionSetPairedDeviceSyncRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  identifier = self->_identifier;
  if (identifier)
  {
    v6 = -[NSString UTF8String](identifier, "UTF8String");
    if (v6)
      xpc_dictionary_set_string(v4, "identifier", v6);
  }
  xpc_dictionary_set_BOOL(v4, "shouldSync", self->_shouldSync);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)shouldSync
{
  return self->_shouldSync;
}

- (void)setShouldSync:(BOOL)a3
{
  self->_shouldSync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
