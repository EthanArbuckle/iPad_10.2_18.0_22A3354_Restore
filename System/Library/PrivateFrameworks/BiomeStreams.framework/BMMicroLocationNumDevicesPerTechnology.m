@implementation BMMicroLocationNumDevicesPerTechnology

- (BMMicroLocationNumDevicesPerTechnology)initWithTechnology:(id)a3 numDevices:(unsigned int)a4
{
  id v6;
  BMMicroLocationNumDevicesPerTechnology *v7;
  uint64_t v8;
  NSString *technology;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMMicroLocationNumDevicesPerTechnology;
  v7 = -[BMMicroLocationNumDevicesPerTechnology init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    technology = v7->_technology;
    v7->_technology = (NSString *)v8;

    v7->_numDevices = a4;
  }

  return v7;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMMicroLocationNumDevicesPerTechnology eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMMicroLocationNumDevicesPerTechnology proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMMicroLocationNumDevicesPerTechnology)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BMMicroLocationNumDevicesPerTechnology *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasTechnologyString](v5, "hasTechnologyString")
        && (-[NSObject hasNumber](v5, "hasNumber") & 1) != 0)
      {
        -[NSObject technologyString](v5, "technologyString");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMMicroLocationNumDevicesPerTechnology initWithTechnology:numDevices:](self, "initWithTechnology:numDevices:", v6, -[NSObject number](v5, "number"));

        v7 = self;
LABEL_13:

        goto LABEL_14;
      }
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BMMicroLocationNumDevicesPerTechnology initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMMicroLocationNumDevicesPerTechnology initWithProto:].cold.2();
    }
    v7 = 0;
    goto LABEL_13;
  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (BMMicroLocationNumDevicesPerTechnology)initWithProtoData:(id)a3
{
  id v4;
  BMPBNumDevicesPerTechnology *v5;
  BMMicroLocationNumDevicesPerTechnology *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBNumDevicesPerTechnology initWithData:]([BMPBNumDevicesPerTechnology alloc], "initWithData:", v4);

    self = -[BMMicroLocationNumDevicesPerTechnology initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTechnologyString:", self->_technology);
  objc_msgSend(v3, "setNumber:", self->_numDevices);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_technology, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numDevices);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  NSString *technology;
  NSString *v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  unsigned int numDevices;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = v6;
    technology = self->_technology;
    v9 = technology;
    if (!technology)
    {
      objc_msgSend(v6, "technology");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        numDevices = self->_numDevices;
        v12 = numDevices == objc_msgSend(v7, "numDevices");
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      v9 = self->_technology;
    }
    objc_msgSend(v7, "technology");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](v9, "isEqualToString:", v10))
    {
      v11 = self->_numDevices;
      v12 = v11 == objc_msgSend(v7, "numDevices");
    }
    else
    {
      v12 = 0;
    }

    if (technology)
      goto LABEL_13;
    goto LABEL_12;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (NSString)technology
{
  return self->_technology;
}

- (unsigned)numDevices
{
  return self->_numDevices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_technology, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4(&dword_18D810000, v0, v1, "BMMicroLocationNumDevicesPerTechnology: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMMicroLocationNumDevicesPerTechnology: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMMicroLocationNumDevicesPerTechnology: tried to initialize with a non-BMUserActivityMetadataTopic proto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
