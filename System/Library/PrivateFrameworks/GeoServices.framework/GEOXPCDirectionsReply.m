@implementation GEOXPCDirectionsReply

- (GEOXPCDirectionsReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOXPCDirectionsReply *v7;
  const void *data;
  void *v9;
  GEODirectionsResponse *v10;
  GEODirectionsResponse *directionsResponse;
  const void *v12;
  void *v13;
  uint64_t v14;
  GEODirectionsError *directionsError;
  GEOXPCDirectionsReply *v16;
  uint64_t v18;
  size_t length;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOXPCDirectionsReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v20, sel_initWithXPCDictionary_error_, v6, a4);
  if (!v7)
    goto LABEL_8;
  length = 0;
  data = xpc_dictionary_get_data(v6, "responseData", &length);
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEODirectionsResponse initWithData:]([GEODirectionsResponse alloc], "initWithData:", v9);
  }
  else
  {
    xpc_dictionary_get_value(v6, "responseData");
    v18 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v18;
    if (!v18 || MEMORY[0x18D765A14](v18) != MEMORY[0x1E0C812E8])
      goto LABEL_5;
    v10 = objc_alloc_init(GEODirectionsResponse);
  }
  directionsResponse = v7->_directionsResponse;
  v7->_directionsResponse = v10;

LABEL_5:
  length = 0;
  v12 = xpc_dictionary_get_data(v6, "directionsError", &length);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, length, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    directionsError = v7->_directionsError;
    v7->_directionsError = (GEODirectionsError *)v14;

  }
  v16 = v7;
LABEL_8:

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEODirectionsResponse *directionsResponse;
  id v6;
  GEODirectionsError *directionsError;
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOXPCDirectionsReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v9, sel_encodeToXPCDictionary_, v4);
  directionsResponse = self->_directionsResponse;
  if (directionsResponse)
  {
    -[GEODirectionsResponse data](directionsResponse, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "responseData", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
  directionsError = self->_directionsError;
  if (directionsError)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", directionsError, 1, 0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "directionsError", (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

  }
}

- (BOOL)isValid
{
  return 1;
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (void)setDirectionsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_directionsResponse, a3);
}

- (GEODirectionsError)directionsError
{
  return self->_directionsError;
}

- (void)setDirectionsError:(id)a3
{
  objc_storeStrong((id *)&self->_directionsError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsError, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
}

@end
