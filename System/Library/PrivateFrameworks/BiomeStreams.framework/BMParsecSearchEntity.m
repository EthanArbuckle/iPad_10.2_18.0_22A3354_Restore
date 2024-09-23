@implementation BMParsecSearchEntity

- (BMParsecSearchEntity)initWithName:(id)a3 category:(unsigned int)a4 probabilityScore:(float)a5 topics:(id)a6
{
  id v12;
  id v13;
  void *v14;
  BMParsecSearchEntity *v15;
  BMParsecSearchEntity *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v12 = a3;
  v13 = a6;
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
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMParsecSearchEngagementEvent.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMParsecSearchEngagementEvent.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("topics"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)BMParsecSearchEntity;
  v15 = -[BMParsecSearchEntity init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v16->_category = a4;
    v16->_probabilityScore = a5;
    objc_storeStrong((id *)&v16->_topics, a6);
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
      +[BMParsecSearchTopic eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v10[0] = self->_name;
  v9[0] = CFSTR("name");
  v9[1] = CFSTR("category");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_category);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("probabilityScore");
  *(float *)&v4 = self->_probabilityScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("topics");
  -[NSArray _pas_mappedArrayWithTransform:](self->_topics, "_pas_mappedArrayWithTransform:", &__block_literal_global_4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __32__BMParsecSearchEntity_jsonDict__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonDict");
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
  -[BMParsecSearchEntity jsonDict](self, "jsonDict");
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
      -[BMParsecSearchEntity json].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

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
  -[BMParsecSearchEntity encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMParsecSearchEntity)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMParsecSearchEntity *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMParsecSearchEntity initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMParsecSearchEntity proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMParsecSearchEntity)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  BMParsecSearchEntity *v13;
  NSObject *v14;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasName](v5, "hasName")
        && -[NSObject hasCategory](v5, "hasCategory")
        && -[NSObject hasProbabilityScore](v5, "hasProbabilityScore")
        && -[NSObject topicsCount](v5, "topicsCount"))
      {
        -[NSObject name](v5, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[NSObject category](v5, "category");
        -[NSObject probabilityScore](v5, "probabilityScore");
        v9 = v8;
        -[NSObject topics](v5, "topics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_128);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = v9;
        self = -[BMParsecSearchEntity initWithName:category:probabilityScore:topics:](self, "initWithName:category:probabilityScore:topics:", v6, v7, v11, v12);

        v13 = self;
LABEL_15:

        goto LABEL_16;
      }
      __biome_log_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BMParsecSearchEntity initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMParsecSearchEntity initWithProto:].cold.2();
    }
    v13 = 0;
    goto LABEL_15;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

BMParsecSearchTopic *__38__BMParsecSearchEntity_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BMParsecSearchTopic *v3;

  v2 = a2;
  v3 = -[BMParsecSearchTopic initWithProto:]([BMParsecSearchTopic alloc], "initWithProto:", v2);

  return v3;
}

- (BMParsecSearchEntity)initWithProtoData:(id)a3
{
  id v4;
  BMPBParsecSearchEntity *v5;
  BMParsecSearchEntity *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBParsecSearchEntity initWithData:]([BMPBParsecSearchEntity alloc], "initWithData:", v4);

    self = -[BMParsecSearchEntity initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  -[BMParsecSearchEntity name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v4);

  objc_msgSend(v3, "setCategory:", -[BMParsecSearchEntity category](self, "category"));
  -[BMParsecSearchEntity probabilityScore](self, "probabilityScore");
  objc_msgSend(v3, "setProbabilityScore:");
  -[BMParsecSearchEntity topics](self, "topics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_129);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v3, "setTopics:", v7);

  return v3;
}

uint64_t __29__BMParsecSearchEntity_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *name;
  void *v7;
  unsigned int category;
  float probabilityScore;
  float v10;
  NSArray *topics;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    name = self->_name;
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](name, "isEqualToString:", v7)
      && (category = self->_category, category == objc_msgSend(v5, "category"))
      && (probabilityScore = self->_probabilityScore, objc_msgSend(v5, "probabilityScore"), probabilityScore == v10))
    {
      topics = self->_topics;
      objc_msgSend(v5, "topics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NSArray isEqual:](topics, "isEqual:", v12);

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
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSString *name;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_topics;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isCompleteWithContext:error:", v6, a4, (_QWORD)v15))
        {

          v13 = 0;
          goto LABEL_13;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }

  name = self->_name;
  v13 = name != 0;
  if (a4 && !name)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)category
{
  return self->_category;
}

- (float)probabilityScore
{
  return self->_probabilityScore;
}

- (NSArray)topics
{
  return self->_topics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)json
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "BMParsecSearchEntity: Unable to create json from object: %@", a5, a6, a7, a8, 2u);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMParsecSearchEntity: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMParsecSearchEntity: tried to initialize with a non-BMParsecSearchEntity proto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
