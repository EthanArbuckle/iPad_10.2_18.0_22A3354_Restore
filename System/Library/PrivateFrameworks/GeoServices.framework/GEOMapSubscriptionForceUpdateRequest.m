@implementation GEOMapSubscriptionForceUpdateRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOMapSubscriptionForceUpdateRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("subscriptions.forceUpdateUserInitiatedSubscriptions"), a3, a4, a5);
}

- (GEOMapSubscriptionForceUpdateRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionForceUpdateRequest *v7;
  GEOMapSubscriptionForceUpdateRequest *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapSubscriptionForceUpdateRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_dataTypes = xpc_dictionary_get_int64(v6, "dataTypes");
    v7->_downloadMode = xpc_dictionary_get_int64(v6, "downloadMode");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOMapSubscriptionForceUpdateRequest;
  v4 = a3;
  -[GEOXPCRequest encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "dataTypes", self->_dataTypes);
  xpc_dictionary_set_int64(v4, "downloadMode", self->_downloadMode);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (unint64_t)dataTypes
{
  return self->_dataTypes;
}

- (void)setDataTypes:(unint64_t)a3
{
  self->_dataTypes = a3;
}

- (unint64_t)downloadMode
{
  return self->_downloadMode;
}

- (void)setDownloadMode:(unint64_t)a3
{
  self->_downloadMode = a3;
}

@end
