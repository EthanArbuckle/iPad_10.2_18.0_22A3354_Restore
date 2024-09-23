@implementation GEOOfflineServiceReply

- (GEOOfflineServiceReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOOfflineServiceReply *v7;
  const void *data;
  void *v9;
  uint64_t v10;
  NSData *response;
  const void *v12;
  void *v13;
  uint64_t v14;
  NSData *responseMetadata;
  GEOOfflineServiceReply *v16;
  size_t length;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOOfflineServiceReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v19, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "response", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      response = v7->_response;
      v7->_response = (NSData *)v10;

    }
    length = 0;
    v12 = xpc_dictionary_get_data(v6, "responseMetadata", &length);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, length, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, a4);
      v14 = objc_claimAutoreleasedReturnValue();
      responseMetadata = v7->_responseMetadata;
      v7->_responseMetadata = (NSData *)v14;

    }
    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSData *response;
  id v6;
  NSData *responseMetadata;
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOOfflineServiceReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v9, sel_encodeToXPCDictionary_, v4);
  response = self->_response;
  if (response)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", response, 1, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "response", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
  responseMetadata = self->_responseMetadata;
  if (responseMetadata)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", responseMetadata, 1, 0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "responseMetadata", (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

  }
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  void *v5;

  -[GEOOfflineServiceReply response](self, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[GEOXPCReply error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (NSData)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSData)responseMetadata
{
  return self->_responseMetadata;
}

- (void)setResponseMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_responseMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseMetadata, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
