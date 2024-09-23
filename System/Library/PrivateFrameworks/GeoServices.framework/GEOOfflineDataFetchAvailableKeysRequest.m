@implementation GEOOfflineDataFetchAvailableKeysRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOOfflineDataFetchAvailableKeysRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("offlinedata.fetchAvailableKeys"), a3, a4, a5);
}

- (GEOOfflineDataFetchAvailableKeysRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOOfflineDataFetchAvailableKeysRequest *v7;
  GEOOfflineDataFetchAvailableKeysRequest *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineDataFetchAvailableKeysRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_layer = xpc_dictionary_get_int64(v6, "layer");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineDataFetchAvailableKeysRequest;
  v4 = a3;
  -[GEOXPCRequest encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "layer", self->_layer);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (unsigned)layer
{
  return self->_layer;
}

- (void)setLayer:(unsigned int)a3
{
  self->_layer = a3;
}

@end
