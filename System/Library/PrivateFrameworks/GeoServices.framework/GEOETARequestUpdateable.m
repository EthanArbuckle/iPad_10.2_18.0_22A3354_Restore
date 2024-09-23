@implementation GEOETARequestUpdateable

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOETARequestUpdateable)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("ETA.startETARequest"), a3, a4, a5);
}

- (GEOETARequestUpdateable)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOETARequestUpdateable *v7;
  const void *data;
  void *v9;
  GEOETATrafficUpdateRequest *v10;
  GEOETATrafficUpdateRequest *request;
  const void *v12;
  void *v13;
  uint64_t v14;
  GEODataConditionalConnectionProperties *connectionProperties;
  GEOETARequestUpdateable *v16;
  uint64_t v18;
  size_t length;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOETARequestUpdateable;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v20, sel_initWithXPCDictionary_error_, v6, a4);
  if (!v7)
    goto LABEL_8;
  length = 0;
  data = xpc_dictionary_get_data(v6, "requestData", &length);
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOETATrafficUpdateRequest initWithData:]([GEOETATrafficUpdateRequest alloc], "initWithData:", v9);
  }
  else
  {
    xpc_dictionary_get_value(v6, "requestData");
    v18 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v18;
    if (!v18 || MEMORY[0x18D765A14](v18) != MEMORY[0x1E0C812E8])
      goto LABEL_5;
    v10 = objc_alloc_init(GEOETATrafficUpdateRequest);
  }
  request = v7->_request;
  v7->_request = v10;

LABEL_5:
  length = 0;
  v12 = xpc_dictionary_get_data(v6, "connectionProperties", &length);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, length, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    connectionProperties = v7->_connectionProperties;
    v7->_connectionProperties = (GEODataConditionalConnectionProperties *)v14;

  }
  v16 = v7;
LABEL_8:

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEOETATrafficUpdateRequest *request;
  id v6;
  GEODataConditionalConnectionProperties *connectionProperties;
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOETARequestUpdateable;
  -[GEOXPCRequest encodeToXPCDictionary:](&v9, sel_encodeToXPCDictionary_, v4);
  request = self->_request;
  if (request)
  {
    -[GEOETATrafficUpdateRequest data](request, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "requestData", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
  connectionProperties = self->_connectionProperties;
  if (connectionProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", connectionProperties, 1, 0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "connectionProperties", (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

  }
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[GEOETARequestUpdateable request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)reply
{
  void *v2;
  unint64_t v3;

  -[GEOXPCRequest method](self, "method");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("start"));

  return v3;
}

- (GEOETATrafficUpdateRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (GEODataConditionalConnectionProperties)connectionProperties
{
  return self->_connectionProperties;
}

- (void)setConnectionProperties:(id)a3
{
  objc_storeStrong((id *)&self->_connectionProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProperties, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
