@implementation GEOImageServiceReplySimple

- (GEOImageServiceReplySimple)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOImageServiceReplySimple *v7;
  const void *data;
  void *v9;
  GEOImageServiceResponse *v10;
  GEOImageServiceResponse *response;
  GEOImageServiceReplySimple *v12;
  uint64_t v14;
  size_t length;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOImageServiceReplySimple;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v16, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "imageServiceResponseData", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[GEOImageServiceResponse initWithData:]([GEOImageServiceResponse alloc], "initWithData:", v9);
    }
    else
    {
      xpc_dictionary_get_value(v6, "imageServiceResponseData");
      v14 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v14;
      if (!v14 || MEMORY[0x18D765A14](v14) != MEMORY[0x1E0C812E8])
        goto LABEL_5;
      v10 = objc_alloc_init(GEOImageServiceResponse);
    }
    response = v7->_response;
    v7->_response = v10;

LABEL_5:
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEOImageServiceResponse *response;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOImageServiceReplySimple;
  -[GEOXPCReply encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  response = self->_response;
  if (response)
  {
    -[GEOImageServiceResponse data](response, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "imageServiceResponseData", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  void *v5;

  -[GEOImageServiceReplySimple response](self, "response");
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

- (GEOImageServiceResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

@end
