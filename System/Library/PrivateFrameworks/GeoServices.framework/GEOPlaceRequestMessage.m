@implementation GEOPlaceRequestMessage

- (unint64_t)reply
{
  return 1;
}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  -[GEOPlaceRequestMessage requestUUID](self, "requestUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GEOPlaceRequestMessage request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEOPDPlaceRequest)request
{
  return self->_request;
}

- (GEOPlaceRequestMessage)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOPlaceRequestMessage *v7;
  const uint8_t *uuid;
  uint64_t v9;
  NSUUID *requestUUID;
  const void *data;
  void *v12;
  GEOPDPlaceRequest *v13;
  GEOPDPlaceRequest *request;
  GEOPlaceRequestMessage *v15;
  uint64_t v17;
  size_t length;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOPlaceRequestMessage;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v19, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    uuid = xpc_dictionary_get_uuid(v6, "requestUUID");
    if (uuid)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
      requestUUID = v7->_requestUUID;
      v7->_requestUUID = (NSUUID *)v9;

    }
    length = 0;
    data = xpc_dictionary_get_data(v6, "req", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[GEOPDPlaceRequest initWithData:]([GEOPDPlaceRequest alloc], "initWithData:", v12);
    }
    else
    {
      xpc_dictionary_get_value(v6, "req");
      v17 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v17;
      if (!v17 || MEMORY[0x18D765A14](v17) != MEMORY[0x1E0C812E8])
        goto LABEL_7;
      v13 = objc_alloc_init(GEOPDPlaceRequest);
    }
    request = v7->_request;
    v7->_request = v13;

LABEL_7:
    v7->_cachePolicy = xpc_dictionary_get_int64(v6, "cachePolicy");
    v7->_timeout = xpc_dictionary_get_double(v6, "timeout");
    v15 = v7;
  }

  return v7;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (double)timeout
{
  return self->_timeout;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (GEOPlaceRequestMessage)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("placedata.performPlaceDataRequest"), a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSUUID *requestUUID;
  GEOPDPlaceRequest *request;
  id v7;
  objc_super v8;
  unsigned __int8 uuid[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceRequestMessage;
  -[GEOXPCRequest encodeToXPCDictionary:](&v8, sel_encodeToXPCDictionary_, v4);
  requestUUID = self->_requestUUID;
  if (requestUUID)
  {
    *(_QWORD *)uuid = 0;
    v10 = 0;
    -[NSUUID getUUIDBytes:](requestUUID, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "requestUUID", uuid);
  }
  request = self->_request;
  if (request)
  {
    -[GEOPDPlaceRequest data](request, "data");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "req", (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  }
  xpc_dictionary_set_int64(v4, "cachePolicy", self->_cachePolicy);
  xpc_dictionary_set_double(v4, "timeout", self->_timeout);

}

@end
