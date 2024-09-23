@implementation GEOOfflineTileConfigurationFetchReply

- (GEOOfflineTileConfigurationFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOOfflineTileConfigurationFetchReply *v7;
  const void *data;
  void *v9;
  GEOPBOfflineTileMetadata *v10;
  GEOPBOfflineTileMetadata *configuration;
  GEOOfflineTileConfigurationFetchReply *v12;
  uint64_t v14;
  size_t length;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOOfflineTileConfigurationFetchReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v16, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "configuration", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[GEOPBOfflineTileMetadata initWithData:]([GEOPBOfflineTileMetadata alloc], "initWithData:", v9);
    }
    else
    {
      xpc_dictionary_get_value(v6, "configuration");
      v14 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v14;
      if (!v14 || MEMORY[0x18D765A14](v14) != MEMORY[0x1E0C812E8])
        goto LABEL_5;
      v10 = objc_alloc_init(GEOPBOfflineTileMetadata);
    }
    configuration = v7->_configuration;
    v7->_configuration = v10;

LABEL_5:
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEOPBOfflineTileMetadata *configuration;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOOfflineTileConfigurationFetchReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  configuration = self->_configuration;
  if (configuration)
  {
    -[GEOPBOfflineTileMetadata data](configuration, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "configuration", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
}

- (BOOL)isValid
{
  return 1;
}

- (GEOPBOfflineTileMetadata)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
