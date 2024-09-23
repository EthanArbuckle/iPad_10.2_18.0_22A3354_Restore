@implementation BMParsecSearchTopic

- (BMParsecSearchTopic)initWithIdentifier:(id)a3 score:(float)a4
{
  id v8;
  BMParsecSearchTopic *v9;
  BMParsecSearchTopic *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMParsecSearchEngagementEvent.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v13.receiver = self;
  v13.super_class = (Class)BMParsecSearchTopic;
  v9 = -[BMParsecSearchTopic init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_score = a4;
  }

  return v10;
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
      +[BMParsecSearchTopic eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  double v2;
  NSString *identifier;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  identifier = self->_identifier;
  v7[1] = CFSTR("score");
  v8[0] = identifier;
  v7[0] = CFSTR("identifier");
  *(float *)&v2 = self->_score;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  -[BMParsecSearchTopic jsonDict](self, "jsonDict");
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
      -[BMParsecSearchTopic json].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

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
  -[BMParsecSearchTopic encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMParsecSearchTopic)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMParsecSearchTopic *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMParsecSearchTopic initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMParsecSearchTopic proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMParsecSearchTopic)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BMParsecSearchTopic *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasIdentifier](v5, "hasIdentifier")
        && (-[NSObject hasScore](v5, "hasScore") & 1) != 0)
      {
        -[NSObject identifier](v5, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject score](v5, "score");
        self = -[BMParsecSearchTopic initWithIdentifier:score:](self, "initWithIdentifier:score:", v6);

        v7 = self;
LABEL_13:

        goto LABEL_14;
      }
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BMParsecSearchTopic initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMParsecSearchTopic initWithProto:].cold.2();
    }
    v7 = 0;
    goto LABEL_13;
  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (BMParsecSearchTopic)initWithProtoData:(id)a3
{
  id v4;
  BMPBParsecSearchTopic *v5;
  BMParsecSearchTopic *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBParsecSearchTopic initWithData:]([BMPBParsecSearchTopic alloc], "initWithData:", v4);

    self = -[BMParsecSearchTopic initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  -[BMParsecSearchTopic identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v4);

  -[BMParsecSearchTopic score](self, "score");
  objc_msgSend(v3, "setScore:");
  return v3;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *identifier;
  void *v7;
  float score;
  float v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    identifier = self->_identifier;
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](identifier, "isEqualToString:", v7))
    {
      score = self->_score;
      objc_msgSend(v5, "score");
      v10 = score == v9;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  NSString *identifier;

  identifier = self->_identifier;
  if (a4 && !identifier)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return identifier != 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (float)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
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
  OUTLINED_FUNCTION_4(&dword_18D810000, v0, v1, "BMParsecSearchEngagementEvent: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)json
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "BMParsecSearchEngagementEvent: Unable to create json from object: %@", a5, a6, a7, a8, 2u);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMParsecSearchTopic: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMParsecSearchTopic: tried to initialize with a non-BMParsecSearchTopic proto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
