@implementation BMPhotosKnowledgeGraphEnrichmentTopic

- (BMPhotosKnowledgeGraphEnrichmentTopic)initWithIdentifier:(id)a3 score:(double)a4
{
  id v8;
  BMPhotosKnowledgeGraphEnrichmentTopic *v9;
  BMPhotosKnowledgeGraphEnrichmentTopic *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMPhotosKnowledgeGraphEnrichmentEvent.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v13.receiver = self;
  v13.super_class = (Class)BMPhotosKnowledgeGraphEnrichmentTopic;
  v9 = -[BMPhotosKnowledgeGraphEnrichmentTopic init](&v13, sel_init);
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
      +[BMPhotosKnowledgeGraphEnrichmentTopic eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  NSString *identifier;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  identifier = self->_identifier;
  v6[1] = CFSTR("score");
  v7[0] = identifier;
  v6[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMPhotosKnowledgeGraphEnrichmentTopic jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMPhotosKnowledgeGraphEnrichmentTopic json].cold.1();

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
  -[BMPhotosKnowledgeGraphEnrichmentTopic encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMPhotosKnowledgeGraphEnrichmentTopic)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMPhotosKnowledgeGraphEnrichmentTopic *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMPhotosKnowledgeGraphEnrichmentTopic initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMPhotosKnowledgeGraphEnrichmentTopic proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMPhotosKnowledgeGraphEnrichmentTopic)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BMPhotosKnowledgeGraphEnrichmentTopic *v7;
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
        self = -[BMPhotosKnowledgeGraphEnrichmentTopic initWithIdentifier:score:](self, "initWithIdentifier:score:", v6);

        v7 = self;
LABEL_13:

        goto LABEL_14;
      }
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BMPhotosKnowledgeGraphEnrichmentTopic initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMPhotosKnowledgeGraphEnrichmentTopic initWithProto:].cold.2();
    }
    v7 = 0;
    goto LABEL_13;
  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (BMPhotosKnowledgeGraphEnrichmentTopic)initWithProtoData:(id)a3
{
  id v4;
  BMPBPhotosKnowledgeGraphEnrichmentTopic *v5;
  BMPhotosKnowledgeGraphEnrichmentTopic *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBPhotosKnowledgeGraphEnrichmentTopic initWithData:]([BMPBPhotosKnowledgeGraphEnrichmentTopic alloc], "initWithData:", v4);

    self = -[BMPhotosKnowledgeGraphEnrichmentTopic initWithProto:](self, "initWithProto:", v5);
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
  -[BMPhotosKnowledgeGraphEnrichmentTopic identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v4);

  -[BMPhotosKnowledgeGraphEnrichmentTopic score](self, "score");
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
  double score;
  double v9;
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

- (double)score
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
  OUTLINED_FUNCTION_4(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentTopic: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)json
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentTopic: Unable to create json from object: %@", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentTopic: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentTopic: tried to initialize with a non-BMPhotosKnowledgeGraphEnrichmentTopic proto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
