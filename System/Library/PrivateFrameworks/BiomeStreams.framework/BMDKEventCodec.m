@implementation BMDKEventCodec

- (id)encodeAsProtoData:(id)a3
{
  void *v3;
  void *v4;

  -[BMDKEventCodec encodeAsProto:](self, "encodeAsProto:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)codecWithVersion:(unsigned int)a3
{
  __objc2_class *v4;
  id v5;
  NSObject *v6;

  if (a3 == 2)
  {
    v4 = _BMDKEventCodec_DKPREvent;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = _BMDKEventCodec_BMPBDKEvent;
LABEL_5:
    v5 = objc_alloc_init(v4);
    return v5;
  }
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[BMDKEventCodec codecWithVersion:].cold.1(a3, v6);

  v5 = 0;
  return v5;
}

- (BMDKEventCodec)init
{
  BMDKEventCodec *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BMDKEventCodec;
  result = -[BMDKEventCodec init](&v3, sel_init);
  if (result)
    result->_decodeMetadata = 1;
  return result;
}

- (BOOL)decodeMetadata
{
  return self->_decodeMetadata;
}

- (void)setDecodeMetadata:(BOOL)a3
{
  self->_decodeMetadata = a3;
}

- (id)encodeAsProto:(id)a3
{
  id result;

  objc_opt_class();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)decodeWithProto:(id)a3
{
  id result;

  objc_opt_class();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)decodeWithProtoData:(id)a3
{
  id result;

  objc_opt_class();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1();
  return result;
}

+ (void)codecWithVersion:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMDKEventCodec: Invalid data version %u", (uint8_t *)v2, 8u);
}

@end
