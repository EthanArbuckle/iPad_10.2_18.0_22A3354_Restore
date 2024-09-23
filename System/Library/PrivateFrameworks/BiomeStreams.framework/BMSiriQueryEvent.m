@implementation BMSiriQueryEvent

- (BMSiriQueryEvent)initWithUniqueId:(id)a3 personaId:(id)a4 absoluteTimestamp:(double)a5 query:(id)a6 results:(id)a7 contentProtection:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  BMSiriQueryEvent *v19;
  BMSiriQueryEvent *v20;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  objc_super v27;

  v15 = a3;
  v26 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSiriQueryEvent.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (v17)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSiriQueryEvent.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

  if (!v16)
    goto LABEL_8;
LABEL_3:
  if (v17)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSiriQueryEvent.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("results"));

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)BMSiriQueryEvent;
  v19 = -[BMSiriQueryEvent init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_uniqueId, a3);
    objc_storeStrong((id *)&v20->_personaId, a4);
    v20->_absoluteTimestamp = a5;
    objc_storeStrong((id *)&v20->_query, a6);
    objc_storeStrong((id *)&v20->_results, a7);
    objc_storeStrong((id *)&v20->_contentProtection, a8);
  }

  return v20;
}

- (BMSiriQueryEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 query:(id)a5 results:(id)a6 contentProtection:(id)a7
{
  return -[BMSiriQueryEvent initWithUniqueId:personaId:absoluteTimestamp:query:results:contentProtection:](self, "initWithUniqueId:personaId:absoluteTimestamp:query:results:contentProtection:", a3, 0, a5, a6, a7, a4);
}

- (BMSiriQueryEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 query:(id)a5 results:(id)a6
{
  return -[BMSiriQueryEvent initWithUniqueId:absoluteTimestamp:query:results:contentProtection:](self, "initWithUniqueId:absoluteTimestamp:query:results:contentProtection:", a3, a5, a6, 0, a4);
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMSiriQueryEvent eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v2;
  void *v3;

  -[BMSiriQueryEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMSiriQueryEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;

  if (!v4)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMSiriQueryEvent json].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMSiriQueryEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMSiriQueryEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMSiriQueryEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMSiriQueryEvent initWithProtoData:](self, "initWithProtoData:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMSiriQueryEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSiriQueryEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BMSiriQueryEvent *v16;
  NSObject *v17;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasUniqueId](v5, "hasUniqueId"))
      {
        -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
        if (v6 != 0.0)
        {
          -[NSObject query](v5, "query");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            -[NSObject uniqueId](v5, "uniqueId");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject personaId](v5, "personaId");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
            v11 = v10;
            -[NSObject query](v5, "query");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject results](v5, "results");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject contentProtection](v5, "contentProtection");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            self = -[BMSiriQueryEvent initWithUniqueId:personaId:absoluteTimestamp:query:results:contentProtection:](self, "initWithUniqueId:personaId:absoluteTimestamp:query:results:contentProtection:", v8, v9, v12, v14, v15, v11);

            v16 = self;
LABEL_14:

            goto LABEL_15;
          }
        }
      }
      __biome_log_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[BMSiriQueryEvent initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMSiriQueryEvent initWithProto:].cold.2();
    }
    v16 = 0;
    goto LABEL_14;
  }
  v16 = 0;
LABEL_15:

  return v16;
}

BMSiriQueryResult *__34__BMSiriQueryEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BMSiriQueryResult *v3;

  v2 = a2;
  v3 = -[BMSiriQueryResult initWithProto:]([BMSiriQueryResult alloc], "initWithProto:", v2);

  return v3;
}

- (BMSiriQueryEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSiriQueryEvent *v5;
  BMSiriQueryEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSiriQueryEvent initWithData:]([BMPBSiriQueryEvent alloc], "initWithData:", v4);

    self = -[BMSiriQueryEvent initWithProto:](self, "initWithProto:", v5);
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[BMSiriQueryEvent uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueId:", v4);

  -[BMSiriQueryEvent personaId](self, "personaId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonaId:", v5);

  -[BMSiriQueryEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  -[BMSiriQueryEvent query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQuery:", v6);

  -[BMSiriQueryEvent results](self, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_133);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v3, "setResults:", v9);

  -[BMSiriQueryEvent contentProtection](self, "contentProtection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentProtection:", v10);

  return v3;
}

uint64_t __25__BMSiriQueryEvent_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_uniqueId, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriQueryEvent proto](self, "proto");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proto");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (self->_uniqueId && self->_query && -[NSArray count](self->_results, "count"))
  {
    v7 = 1;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)query
{
  return self->_query;
}

- (NSArray)results
{
  return self->_results;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
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

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_18D810000, v0, v1, "BMSiriQueryEvent: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)json
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "BMSiriQueryEvent: Unable to create json from object: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMPBSiriQueryEvent: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMSiriQueryEvent: tried to initialize with a non-BMSiriQueryEvent proto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
