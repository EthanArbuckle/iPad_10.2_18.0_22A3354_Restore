@implementation BMPhotosKnowledgeGraphEnrichmentEntity

- (BMPhotosKnowledgeGraphEnrichmentEntity)initWithName:(id)a3 score:(double)a4 language:(id)a5 category:(unsigned int)a6
{
  id v12;
  id v13;
  void *v14;
  BMPhotosKnowledgeGraphEnrichmentEntity *v15;
  BMPhotosKnowledgeGraphEnrichmentEntity *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v12 = a3;
  v13 = a5;
  v14 = v13;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMPhotosKnowledgeGraphEnrichmentEvent.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMPhotosKnowledgeGraphEnrichmentEvent.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("language"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)BMPhotosKnowledgeGraphEnrichmentEntity;
  v15 = -[BMPhotosKnowledgeGraphEnrichmentEntity init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v16->_score = a4;
    objc_storeStrong((id *)&v16->_language, a5);
    v16->_category = a6;
  }

  return v16;
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
      +[BMPhotosKnowledgeGraphEnrichmentEntity eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v3;
  NSString *language;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v9[0] = self->_name;
  v8[0] = CFSTR("name");
  v8[1] = CFSTR("score");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  language = self->_language;
  v9[1] = v3;
  v9[2] = language;
  v8[2] = CFSTR("language");
  v8[3] = CFSTR("category");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_category);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  -[BMPhotosKnowledgeGraphEnrichmentEntity jsonDict](self, "jsonDict");
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
      -[BMPhotosKnowledgeGraphEnrichmentEntity json].cold.1();

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
  -[BMPhotosKnowledgeGraphEnrichmentEntity encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMPhotosKnowledgeGraphEnrichmentEntity)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMPhotosKnowledgeGraphEnrichmentEntity *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMPhotosKnowledgeGraphEnrichmentEntity initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMPhotosKnowledgeGraphEnrichmentEntity proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMPhotosKnowledgeGraphEnrichmentEntity)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  BMPhotosKnowledgeGraphEnrichmentEntity *v10;
  NSObject *v11;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasName](v5, "hasName")
        && -[NSObject hasScore](v5, "hasScore")
        && -[NSObject hasLanguage](v5, "hasLanguage")
        && (-[NSObject hasCategory](v5, "hasCategory") & 1) != 0)
      {
        -[NSObject name](v5, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject score](v5, "score");
        v8 = v7;
        -[NSObject language](v5, "language");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMPhotosKnowledgeGraphEnrichmentEntity initWithName:score:language:category:](self, "initWithName:score:language:category:", v6, v9, -[NSObject category](v5, "category"), v8);

        v10 = self;
LABEL_15:

        goto LABEL_16;
      }
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[BMPhotosKnowledgeGraphEnrichmentEntity initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMPhotosKnowledgeGraphEnrichmentEntity initWithProto:].cold.2();
    }
    v10 = 0;
    goto LABEL_15;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (BMPhotosKnowledgeGraphEnrichmentEntity)initWithProtoData:(id)a3
{
  id v4;
  BMPBPhotosKnowledgeGraphEnrichmentEntity *v5;
  BMPhotosKnowledgeGraphEnrichmentEntity *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBPhotosKnowledgeGraphEnrichmentEntity initWithData:]([BMPBPhotosKnowledgeGraphEnrichmentEntity alloc], "initWithData:", v4);

    self = -[BMPhotosKnowledgeGraphEnrichmentEntity initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  -[BMPhotosKnowledgeGraphEnrichmentEntity name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v4);

  -[BMPhotosKnowledgeGraphEnrichmentEntity score](self, "score");
  objc_msgSend(v3, "setScore:");
  -[BMPhotosKnowledgeGraphEnrichmentEntity language](self, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLanguage:", v5);

  objc_msgSend(v3, "setCategory:", -[BMPhotosKnowledgeGraphEnrichmentEntity category](self, "category"));
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_name, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_category);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *name;
  void *v7;
  double score;
  double v9;
  NSString *language;
  void *v11;
  unsigned int category;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    name = self->_name;
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](name, "isEqualToString:", v7)
      && (score = self->_score, objc_msgSend(v5, "score"), score == v9))
    {
      language = self->_language;
      objc_msgSend(v5, "language");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](language, "isEqualToString:", v11))
      {
        category = self->_category;
        v13 = category == objc_msgSend(v5, "category");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (self->_name && self->_language)
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

- (NSString)name
{
  return self->_name;
}

- (double)score
{
  return self->_score;
}

- (NSString)language
{
  return self->_language;
}

- (unsigned)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_name, 0);
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
  OUTLINED_FUNCTION_4(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEntity: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEntity: Unable to create json from object: %@", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEntity: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEntity: tried to initialize with a non-BMPhotosKnowledgeGraphEnrichmentEntity proto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
