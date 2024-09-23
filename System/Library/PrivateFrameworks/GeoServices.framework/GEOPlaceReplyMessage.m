@implementation GEOPlaceReplyMessage

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  void *v5;

  -[GEOPlaceReplyMessage response](self, "response");
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

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSUUID *requestUUID;
  GEOPDPlaceResponse *response;
  id v7;
  objc_super v8;
  unsigned __int8 uuid[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceReplyMessage;
  -[GEOXPCReply encodeToXPCDictionary:](&v8, sel_encodeToXPCDictionary_, v4);
  requestUUID = self->_requestUUID;
  if (requestUUID)
  {
    *(_QWORD *)uuid = 0;
    v10 = 0;
    -[NSUUID getUUIDBytes:](requestUUID, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "requestUUID", uuid);
  }
  response = self->_response;
  if (response)
  {
    -[GEOPDPlaceResponse data](response, "data");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "resp", (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  }
}

- (GEOPlaceReplyMessage)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOPlaceReplyMessage *v7;
  const uint8_t *uuid;
  uint64_t v9;
  NSUUID *requestUUID;
  const void *data;
  void *v12;
  GEOPDPlaceResponse *v13;
  GEOPDPlaceResponse *response;
  GEOPlaceReplyMessage *v15;
  uint64_t v17;
  size_t length;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOPlaceReplyMessage;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v19, sel_initWithXPCDictionary_error_, v6, a4);
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
    data = xpc_dictionary_get_data(v6, "resp", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[GEOPDPlaceResponse initWithData:]([GEOPDPlaceResponse alloc], "initWithData:", v12);
    }
    else
    {
      xpc_dictionary_get_value(v6, "resp");
      v17 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v17;
      if (!v17 || MEMORY[0x18D765A14](v17) != MEMORY[0x1E0C812E8])
        goto LABEL_7;
      v13 = objc_alloc_init(GEOPDPlaceResponse);
    }
    response = v7->_response;
    v7->_response = v13;

LABEL_7:
    v15 = v7;
  }

  return v7;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (GEOPDPlaceResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

@end
