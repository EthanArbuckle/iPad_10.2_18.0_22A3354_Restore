@implementation GEOImageServiceRequestSimple

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOImageServiceRequestSimple)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("ImageService.startImageServiceRequest"), a3, a4, a5);
}

- (GEOImageServiceRequestSimple)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOImageServiceRequestSimple *v7;
  const void *data;
  void *v9;
  GEOImageServiceRequest *v10;
  GEOImageServiceRequest *request;
  const uint8_t *uuid;
  uint64_t v13;
  NSUUID *identifier;
  GEOImageServiceRequestSimple *v15;
  uint64_t v17;
  size_t length;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOImageServiceRequestSimple;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v19, sel_initWithXPCDictionary_error_, v6, a4);
  if (!v7)
    goto LABEL_8;
  length = 0;
  data = xpc_dictionary_get_data(v6, "imageServiceRequestData", &length);
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOImageServiceRequest initWithData:]([GEOImageServiceRequest alloc], "initWithData:", v9);
  }
  else
  {
    xpc_dictionary_get_value(v6, "imageServiceRequestData");
    v17 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v17;
    if (!v17 || MEMORY[0x18D765A14](v17) != MEMORY[0x1E0C812E8])
      goto LABEL_5;
    v10 = objc_alloc_init(GEOImageServiceRequest);
  }
  request = v7->_request;
  v7->_request = v10;

LABEL_5:
  uuid = xpc_dictionary_get_uuid(v6, "identifier");
  if (uuid)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v13;

  }
  v15 = v7;
LABEL_8:

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEOImageServiceRequest *request;
  id v6;
  NSUUID *identifier;
  objc_super v8;
  unsigned __int8 uuid[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOImageServiceRequestSimple;
  -[GEOXPCRequest encodeToXPCDictionary:](&v8, sel_encodeToXPCDictionary_, v4);
  request = self->_request;
  if (request)
  {
    -[GEOImageServiceRequest data](request, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "imageServiceRequestData", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
  identifier = self->_identifier;
  if (identifier)
  {
    *(_QWORD *)uuid = 0;
    v10 = 0;
    -[NSUUID getUUIDBytes:](identifier, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "identifier", uuid);
  }

}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[GEOImageServiceRequestSimple request](self, "request");
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

- (GEOImageServiceRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
