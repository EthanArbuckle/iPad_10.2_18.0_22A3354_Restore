@implementation BMSemanticLocationEvent

- (BMSemanticLocationEvent)initWithUserSpecificPlaceType:(unint64_t)a3 placeType:(unint64_t)a4 starting:(BOOL)a5
{
  return -[BMSemanticLocationEvent initWithUserSpecificPlaceType:placeType:loiIdentifier:starting:](self, "initWithUserSpecificPlaceType:placeType:loiIdentifier:starting:", a3, a4, 0, a5);
}

- (BMSemanticLocationEvent)initWithUserSpecificPlaceType:(unint64_t)a3 placeType:(unint64_t)a4 loiIdentifier:(id)a5 starting:(BOOL)a6
{
  id v11;
  BMSemanticLocationEvent *v12;
  BMSemanticLocationEvent *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMSemanticLocationEvent;
  v12 = -[BMEventBase init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_userSpecificPlaceType = a3;
    v12->_placeType = a4;
    objc_storeStrong((id *)&v12->_loiIdentifier, a5);
    v13->_starting = a6;
  }

  return v13;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  NSString *loiIdentifier;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_userSpecificPlaceType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_placeType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  loiIdentifier = self->_loiIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_starting);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("SemanticLocation event with userSpecificPlaceType: %@, placeType: %@, loiIdentifier: %@, starting: %@"), v4, v5, loiIdentifier, v7);

  return (NSString *)v8;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  if (a4 == 1)
    v4 = (objc_class *)BMSemanticLocationEvent_v1;
  else
    v4 = (objc_class *)a1;
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithProtoData:", v5);

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMSemanticLocationEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSemanticLocationEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BMSemanticLocationEvent *v10;
  NSObject *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = typeFromBMPBSemanticLocationUserSpecificPlaceType(-[NSObject userSpecificPlaceType](v5, "userSpecificPlaceType"));
      v7 = -[NSObject placeType](v5, "placeType");
      v8 = v7;
      if (v7 >= 4)
      {
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[BMSemanticLocationEvent initWithProto:].cold.1(v8);

        v9 = 0;
      }
      else
      {
        v9 = qword_18DC0BAF8[(int)v7];
      }
      -[NSObject loiIdentifier](v5, "loiIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[BMSemanticLocationEvent initWithUserSpecificPlaceType:placeType:loiIdentifier:starting:](self, "initWithUserSpecificPlaceType:placeType:loiIdentifier:starting:", v6, v9, v12, -[NSObject starting](v5, "starting"));

      v10 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMSemanticLocationEvent initWithProto:].cold.2();
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMSemanticLocationEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSemanticLocationEvent *v5;
  BMSemanticLocationEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSemanticLocationEvent initWithData:]([BMPBSemanticLocationEvent alloc], "initWithData:", v4);

    self = -[BMSemanticLocationEvent initWithProto:](self, "initWithProto:", v5);
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
  uint64_t v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setStarting:", -[BMSemanticLocationEvent isStarting](self, "isStarting"));
  v4 = -[BMSemanticLocationEvent userSpecificPlaceType](self, "userSpecificPlaceType");
  v5 = 0;
  v6 = 1;
  switch(v4)
  {
    case 0:
      break;
    case 1:
      v5 = 1;
      break;
    case 2:
      v5 = 2;
      break;
    case 3:
      v5 = 3;
      break;
    case 4:
      v5 = 4;
      break;
    default:
      __biome_log_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[BMSemanticLocationEvent proto].cold.2(v4);

      v6 = 0;
      v5 = 0xFFFFFFFFLL;
      break;
  }
  v8 = -[BMSemanticLocationEvent placeType](self, "placeType");
  v9 = v8;
  if (v8 >= 4)
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BMSemanticLocationEvent proto].cold.1(v9);

    goto LABEL_15;
  }
  if (!v6)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  v10 = dword_18DC0BB20[v8];
  objc_msgSend(v3, "setUserSpecificPlaceType:", v5);
  objc_msgSend(v3, "setPlaceType:", v10);
  -[BMSemanticLocationEvent loiIdentifier](self, "loiIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLoiIdentifier:", v11);

  v12 = v3;
LABEL_16:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = -[BMSemanticLocationEvent isStarting](self, "isStarting");
    if (v7 != objc_msgSend(v6, "isStarting")
      || (v8 = -[BMSemanticLocationEvent userSpecificPlaceType](self, "userSpecificPlaceType"),
          v8 != objc_msgSend(v6, "userSpecificPlaceType"))
      || (v9 = -[BMSemanticLocationEvent placeType](self, "placeType"), v9 != objc_msgSend(v6, "placeType")))
    {
      v13 = 0;
LABEL_11:

      goto LABEL_12;
    }
    -[BMSemanticLocationEvent loiIdentifier](self, "loiIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(v6, "loiIdentifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BMSemanticLocationEvent loiIdentifier](self, "loiIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loiIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v10)
      {
LABEL_15:

        goto LABEL_11;
      }
    }
    else
    {
      v13 = 1;
    }

    goto LABEL_15;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSemanticLocationEvent isStarting](self, "isStarting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BMSemanticLocationEvent userSpecificPlaceType](self, "userSpecificPlaceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BMSemanticLocationEvent placeType](self, "placeType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[BMSemanticLocationEvent loiIdentifier](self, "loiIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (unint64_t)userSpecificPlaceType
{
  return self->_userSpecificPlaceType;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (NSString)loiIdentifier
{
  return self->_loiIdentifier;
}

- (BOOL)isStarting
{
  return self->_starting;
}

- (void)setStarting:(BOOL)a3
{
  self->_starting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loiIdentifier, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSemanticLocationEvent: unable to convert BMPBSemanticLocationPlaceType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBSemanticLocationEvent proto", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)proto
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSemanticLocationEvent: unable to convert BMSemanticLocationUserSpecificPlaceType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
