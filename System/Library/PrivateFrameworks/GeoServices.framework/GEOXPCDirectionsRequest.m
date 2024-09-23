@implementation GEOXPCDirectionsRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOXPCDirectionsRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("directions.start"), a3, a4, a5);
}

- (GEOXPCDirectionsRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOXPCDirectionsRequest *v7;
  const void *data;
  void *v9;
  GEODirectionsRequest *v10;
  GEODirectionsRequest *directionsRequest;
  GEOXPCDirectionsRequest *v12;
  uint64_t v14;
  size_t length;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOXPCDirectionsRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v16, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "requestData", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[GEODirectionsRequest initWithData:]([GEODirectionsRequest alloc], "initWithData:", v9);
    }
    else
    {
      xpc_dictionary_get_value(v6, "requestData");
      v14 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v14;
      if (!v14 || MEMORY[0x18D765A14](v14) != MEMORY[0x1E0C812E8])
        goto LABEL_5;
      v10 = objc_alloc_init(GEODirectionsRequest);
    }
    directionsRequest = v7->_directionsRequest;
    v7->_directionsRequest = v10;

LABEL_5:
    v7->_priority = xpc_dictionary_get_int64(v6, "priority");
    v7->_useBackgroundURL = xpc_dictionary_get_BOOL(v6, "useAltURL");
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEODirectionsRequest *directionsRequest;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOXPCDirectionsRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  directionsRequest = self->_directionsRequest;
  if (directionsRequest)
  {
    -[GEODirectionsRequest data](directionsRequest, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "requestData", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
  xpc_dictionary_set_int64(v4, "priority", self->_priority);
  xpc_dictionary_set_BOOL(v4, "useAltURL", self->_useBackgroundURL);

}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[GEOXPCDirectionsRequest directionsRequest](self, "directionsRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)reply
{
  return 1;
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (void)setDirectionsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_directionsRequest, a3);
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (BOOL)useBackgroundURL
{
  return self->_useBackgroundURL;
}

- (void)setUseBackgroundURL:(BOOL)a3
{
  self->_useBackgroundURL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsRequest, 0);
}

@end
