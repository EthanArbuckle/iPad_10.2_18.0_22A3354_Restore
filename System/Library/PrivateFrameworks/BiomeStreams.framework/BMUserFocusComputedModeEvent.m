@implementation BMUserFocusComputedModeEvent

- (BMUserFocusComputedModeEvent)initWithMode:(id)a3 starting:(BOOL)a4
{
  return -[BMUserFocusComputedModeEvent initWithMode:starting:modeUpdateReason:modeSemanticType:modeUpdateSource:](self, "initWithMode:starting:modeUpdateReason:modeSemanticType:modeUpdateSource:", a3, a4, 0, -1, 0);
}

- (BMUserFocusComputedModeEvent)initWithMode:(id)a3 starting:(BOOL)a4 modeUpdateReason:(unint64_t)a5 modeSemanticType:(int64_t)a6
{
  return -[BMUserFocusComputedModeEvent initWithMode:starting:modeUpdateReason:modeSemanticType:modeUpdateSource:](self, "initWithMode:starting:modeUpdateReason:modeSemanticType:modeUpdateSource:", a3, a4, a5, a6, 0);
}

- (BMUserFocusComputedModeEvent)initWithMode:(id)a3 starting:(BOOL)a4 modeUpdateReason:(unint64_t)a5 modeSemanticType:(int64_t)a6 modeUpdateSource:(int64_t)a7
{
  return -[BMUserFocusComputedModeEvent initWithMode:semanticModeIdentifier:starting:modeUpdateReason:modeSemanticType:modeUpdateSource:](self, "initWithMode:semanticModeIdentifier:starting:modeUpdateReason:modeSemanticType:modeUpdateSource:", a3, 0, a4, a5, a6, a7);
}

- (BMUserFocusComputedModeEvent)initWithMode:(id)a3 semanticModeIdentifier:(id)a4 starting:(BOOL)a5 modeUpdateReason:(unint64_t)a6 modeSemanticType:(int64_t)a7 modeUpdateSource:(int64_t)a8
{
  id v15;
  id v16;
  BMUserFocusComputedModeEvent *v17;
  BMUserFocusComputedModeEvent *v18;
  objc_super v20;

  v15 = a3;
  v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BMUserFocusComputedModeEvent;
  v17 = -[BMEventBase init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_mode, a3);
    objc_storeStrong((id *)&v18->_semanticModeIdentifier, a4);
    v18->_starting = a5;
    v18->_modeUpdateReason = a6;
    v18->_modeSemanticType = a7;
    v18->_modeUpdateSource = a8;
  }

  return v18;
}

- (NSString)description
{
  id v3;
  NSString *mode;
  NSString *semanticModeIdentifier;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  mode = self->_mode;
  semanticModeIdentifier = self->_semanticModeIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_starting);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_modeUpdateReason);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_modeSemanticType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_modeUpdateSource);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("User mode event, currentMode: %@, semanticModeIdentifier: %@, starting: %@, modeUpdateReason: %@, modeSemanticType: %@, modeUpdateSource: %@"), mode, semanticModeIdentifier, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("mode");
  -[BMUserFocusComputedModeEvent mode](self, "mode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("semanticModeIdentifier");
  -[BMUserFocusComputedModeEvent semanticModeIdentifier](self, "semanticModeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("starting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUserFocusComputedModeEvent isStarting](self, "isStarting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("modeUpdateReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BMUserFocusComputedModeEvent modeUpdateReason](self, "modeUpdateReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  v13[4] = CFSTR("modeSemanticType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[BMUserFocusComputedModeEvent modeSemanticType](self, "modeSemanticType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v9;
  v13[5] = CFSTR("modeUpdateSource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[BMUserFocusComputedModeEvent modeUpdateSource](self, "modeUpdateSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  if (!v3)

  return v11;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMUserFocusComputedModeEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMPOICategoryEvent json].cold.1(v6);

  }
  return v4;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  if (a4 == 2)
    v4 = (objc_class *)BMUserFocusComputedModeEvent_v2;
  else
    v4 = (objc_class *)a1;
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithProtoData:", v5);

  return v6;
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[BMUserFocusComputedModeEvent mode](self, "mode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BMUserFocusComputedModeEvent semanticModeIdentifier](self, "semanticModeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUserFocusComputedModeEvent isStarting](self, "isStarting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BMUserFocusComputedModeEvent modeUpdateReason](self, "modeUpdateReason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[BMUserFocusComputedModeEvent modeSemanticType](self, "modeSemanticType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ v10 ^ objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[BMUserFocusComputedModeEvent modeUpdateSource](self, "modeUpdateSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  int v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  void *v18;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[BMUserFocusComputedModeEvent mode](self, "mode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqual:", v9))
    {
      v12 = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[BMUserFocusComputedModeEvent semanticModeIdentifier](self, "semanticModeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(v7, "semanticModeIdentifier"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BMUserFocusComputedModeEvent semanticModeIdentifier](self, "semanticModeIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "semanticModeIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqualToString:", v4))
      {
        v12 = 0;
        goto LABEL_17;
      }
      v11 = 1;
    }
    else
    {
      v18 = 0;
      v11 = 0;
    }
    v13 = -[BMUserFocusComputedModeEvent isStarting](self, "isStarting");
    if (v13 == objc_msgSend(v7, "isStarting")
      && (v14 = -[BMUserFocusComputedModeEvent modeSemanticType](self, "modeSemanticType"),
          v14 == objc_msgSend(v7, "modeSemanticType"))
      && (v15 = -[BMUserFocusComputedModeEvent modeUpdateReason](self, "modeUpdateReason"),
          v15 == objc_msgSend(v7, "modeUpdateReason")))
    {
      v16 = -[BMUserFocusComputedModeEvent modeUpdateSource](self, "modeUpdateSource");
      v12 = v16 == objc_msgSend(v7, "modeUpdateSource");
      if ((v11 & 1) == 0)
        goto LABEL_18;
    }
    else
    {
      v12 = 0;
      if (!v11)
      {
LABEL_18:
        if (!v10)

        goto LABEL_21;
      }
    }
LABEL_17:

    goto LABEL_18;
  }
  v12 = 0;
LABEL_22:

  return v12;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMUserFocusComputedModeEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMUserFocusComputedModeEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t updated;
  unsigned int v10;
  uint64_t v11;
  BMUserFocusComputedModeEvent *v12;
  NSObject *v13;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject mode](v5, "mode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject semanticModeIdentifier](v5, "semanticModeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSObject starting](v5, "starting");
      updated = BMUserFocusComputedModeUpdateReasonFromReason(-[NSObject modeUpdateReason](v5, "modeUpdateReason"));
      v10 = -[NSObject modeSemanticType](v5, "modeSemanticType");
      if (v10 >= 0xA)
      {
        __biome_log_for_category();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[BMUserFocusComputedModeEvent initWithProto:].cold.1();

        v11 = 0;
      }
      else
      {
        v11 = v10 - 1;
      }
      self = -[BMUserFocusComputedModeEvent initWithMode:semanticModeIdentifier:starting:modeUpdateReason:modeSemanticType:modeUpdateSource:](self, "initWithMode:semanticModeIdentifier:starting:modeUpdateReason:modeSemanticType:modeUpdateSource:", v6, v7, v8, updated, v11, BMUserFocusComputedModeUpdateSourceFromSource(-[NSObject modeUpdateSource](v5, "modeUpdateSource")));

      v12 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMUserFocusComputedModeEvent initWithProto:].cold.2();
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BMUserFocusComputedModeEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBUserFocusComputedModeEvent *v5;
  BMUserFocusComputedModeEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBUserFocusComputedModeEvent initWithData:]([BMPBUserFocusComputedModeEvent alloc], "initWithData:", v4);

    self = -[BMUserFocusComputedModeEvent initWithProto:](self, "initWithProto:", v5);
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
  void *v4;
  void *v5;
  unint64_t v6;
  int v7;
  NSObject *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t v13;
  id v14;
  NSObject *v15;

  v3 = (void *)objc_opt_new();
  -[BMUserFocusComputedModeEvent mode](self, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMode:", v4);

  -[BMUserFocusComputedModeEvent semanticModeIdentifier](self, "semanticModeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSemanticModeIdentifier:", v5);

  objc_msgSend(v3, "setStarting:", -[BMUserFocusComputedModeEvent isStarting](self, "isStarting"));
  v6 = -[BMUserFocusComputedModeEvent modeUpdateReason](self, "modeUpdateReason");
  if (v6 >= 4)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMUserFocusComputedModeEvent proto].cold.3(v6);

    v6 = 0xFFFFFFFFLL;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  v9 = -[BMUserFocusComputedModeEvent modeSemanticType](self, "modeSemanticType");
  v10 = 0;
  switch(v9)
  {
    case -1:
      break;
    case 0:
      v10 = 1;
      break;
    case 1:
      v10 = 2;
      break;
    case 2:
      v10 = 3;
      break;
    case 3:
      v10 = 4;
      break;
    case 4:
      v10 = 5;
      break;
    case 5:
      v10 = 6;
      break;
    case 6:
      v10 = 7;
      break;
    case 7:
      v10 = 8;
      break;
    case 8:
      v10 = 9;
      break;
    default:
      v11 = v9;
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[BMUserFocusComputedModeEvent proto].cold.2(v11);

      v10 = 0xFFFFFFFFLL;
      v7 = 1;
      break;
  }
  v13 = -[BMUserFocusComputedModeEvent modeUpdateSource](self, "modeUpdateSource");
  if (v13 >= 4)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BMUserFocusComputedModeEvent proto].cold.1(v13);

    goto LABEL_25;
  }
  if (v7)
  {
LABEL_25:
    v14 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v3, "setModeUpdateReason:", v6);
  objc_msgSend(v3, "setModeSemanticType:", v10);
  objc_msgSend(v3, "setModeUpdateSource:", v13);
  v14 = v3;
LABEL_26:

  return v14;
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)semanticModeIdentifier
{
  return self->_semanticModeIdentifier;
}

- (void)setSemanticModeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)modeUpdateReason
{
  return self->_modeUpdateReason;
}

- (void)setModeUpdateReason:(unint64_t)a3
{
  self->_modeUpdateReason = a3;
}

- (int64_t)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(int64_t)a3
{
  self->_modeSemanticType = a3;
}

- (int64_t)modeUpdateSource
{
  return self->_modeUpdateSource;
}

- (void)setModeUpdateSource:(int64_t)a3
{
  self->_modeUpdateSource = a3;
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
  objc_storeStrong((id *)&self->_semanticModeIdentifier, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

- (void)initWithProto:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_2();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMUserFocusComputedModeEvent: unable to convert BMPBModeSemanticType enum value: %@", v3, v4, v5, v6, v7);

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
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBUserFocusComputedModeEvent proto", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMUserFocusComputedModeEvent: unable to convert BMUserFocusComputedModeUpdateReason enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
