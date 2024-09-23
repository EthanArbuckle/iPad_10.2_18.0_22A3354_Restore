@implementation GEOOfflineServiceRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOOfflineServiceRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("offlineserver.request"), a3, a4, a5);
}

- (GEOOfflineServiceRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOOfflineServiceRequest *v7;
  const void *data;
  void *v9;
  uint64_t v10;
  NSData *request;
  const void *v12;
  void *v13;
  uint64_t v14;
  NSData *requestMetadata;
  GEOOfflineServiceRequest *v16;
  size_t length;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOOfflineServiceRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v19, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "request", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      request = v7->_request;
      v7->_request = (NSData *)v10;

    }
    length = 0;
    v12 = xpc_dictionary_get_data(v6, "requestMetadata", &length);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, length, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, a4);
      v14 = objc_claimAutoreleasedReturnValue();
      requestMetadata = v7->_requestMetadata;
      v7->_requestMetadata = (NSData *)v14;

    }
    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSData *request;
  id v6;
  NSData *requestMetadata;
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOOfflineServiceRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v9, sel_encodeToXPCDictionary_, v4);
  request = self->_request;
  if (request)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", request, 1, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "request", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
  requestMetadata = self->_requestMetadata;
  if (requestMetadata)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", requestMetadata, 1, 0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "requestMetadata", (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

  }
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[GEOOfflineServiceRequest request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)reply
{
  return 1;
}

- (NSData)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSData)requestMetadata
{
  return self->_requestMetadata;
}

- (void)setRequestMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_requestMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestMetadata, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
