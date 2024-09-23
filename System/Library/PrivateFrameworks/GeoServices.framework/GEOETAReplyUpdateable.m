@implementation GEOETAReplyUpdateable

- (GEOETAReplyUpdateable)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOETAReplyUpdateable *v7;
  const void *data;
  void *v9;
  GEOETATrafficUpdateResponse *v10;
  GEOETATrafficUpdateResponse *response;
  const void *v12;
  void *v13;
  uint64_t v14;
  GEOETATrafficUpdateErrorInfo *errorInfo;
  GEOETAReplyUpdateable *v16;
  uint64_t v18;
  size_t length;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOETAReplyUpdateable;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v20, sel_initWithXPCDictionary_error_, v6, a4);
  if (!v7)
    goto LABEL_8;
  length = 0;
  data = xpc_dictionary_get_data(v6, "responseData", &length);
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOETATrafficUpdateResponse initWithData:]([GEOETATrafficUpdateResponse alloc], "initWithData:", v9);
  }
  else
  {
    xpc_dictionary_get_value(v6, "responseData");
    v18 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v18;
    if (!v18 || MEMORY[0x18D765A14](v18) != MEMORY[0x1E0C812E8])
      goto LABEL_5;
    v10 = objc_alloc_init(GEOETATrafficUpdateResponse);
  }
  response = v7->_response;
  v7->_response = v10;

LABEL_5:
  length = 0;
  v12 = xpc_dictionary_get_data(v6, "errorInfo", &length);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, length, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    errorInfo = v7->_errorInfo;
    v7->_errorInfo = (GEOETATrafficUpdateErrorInfo *)v14;

  }
  v16 = v7;
LABEL_8:

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEOETATrafficUpdateResponse *response;
  id v6;
  GEOETATrafficUpdateErrorInfo *errorInfo;
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOETAReplyUpdateable;
  -[GEOXPCReply encodeToXPCDictionary:](&v9, sel_encodeToXPCDictionary_, v4);
  response = self->_response;
  if (response)
  {
    -[GEOETATrafficUpdateResponse data](response, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "responseData", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
  errorInfo = self->_errorInfo;
  if (errorInfo)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", errorInfo, 1, 0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "errorInfo", (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

  }
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  void *v5;

  -[GEOETAReplyUpdateable response](self, "response");
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

- (GEOETATrafficUpdateResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (GEOETATrafficUpdateErrorInfo)errorInfo
{
  return self->_errorInfo;
}

- (void)setErrorInfo:(id)a3
{
  objc_storeStrong((id *)&self->_errorInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorInfo, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
