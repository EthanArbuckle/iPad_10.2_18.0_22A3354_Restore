@implementation GEOETAUpdateableWillSendReply

- (GEOETAUpdateableWillSendReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOETAUpdateableWillSendReply *v7;
  const void *data;
  void *v9;
  GEOETATrafficUpdateRequest *v10;
  GEOETATrafficUpdateRequest *updatedRequest;
  GEOETAUpdateableWillSendReply *v12;
  uint64_t v14;
  size_t length;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOETAUpdateableWillSendReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v16, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
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
      v14 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v14;
      if (!v14 || MEMORY[0x18D765A14](v14) != MEMORY[0x1E0C812E8])
        goto LABEL_5;
      v10 = objc_alloc_init(GEOETATrafficUpdateRequest);
    }
    updatedRequest = v7->_updatedRequest;
    v7->_updatedRequest = v10;

LABEL_5:
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEOETATrafficUpdateRequest *updatedRequest;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOETAUpdateableWillSendReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  updatedRequest = self->_updatedRequest;
  if (updatedRequest)
  {
    -[GEOETATrafficUpdateRequest data](updatedRequest, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "requestData", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
}

- (BOOL)isValid
{
  return 1;
}

- (GEOETATrafficUpdateRequest)updatedRequest
{
  return self->_updatedRequest;
}

- (void)setUpdatedRequest:(id)a3
{
  objc_storeStrong((id *)&self->_updatedRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedRequest, 0);
}

@end
