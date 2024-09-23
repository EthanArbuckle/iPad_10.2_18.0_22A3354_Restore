@implementation BMParsecSearchEngagementEvent

- (BMParsecSearchEngagementEvent)initWithUniqueId:(id)a3 resultId:(id)a4 domainId:(id)a5 personaId:(id)a6 absoluteTimestamp:(double)a7 userInput:(id)a8 completedQuery:(id)a9 entities:(id)a10 contentProtection:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BMParsecSearchEngagementEvent *v24;
  BMParsecSearchEngagementEvent *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v39;

  v18 = a3;
  v19 = a4;
  v37 = a5;
  obj = a6;
  v36 = a6;
  v34 = a8;
  v20 = a8;
  v35 = a9;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  if (v18)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMParsecSearchEngagementEvent.m"), 392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

    if (v19)
    {
LABEL_3:
      if (v20)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMParsecSearchEngagementEvent.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultId"));

  if (v20)
  {
LABEL_4:
    if (v21)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMParsecSearchEngagementEvent.m"), 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completedQuery"));

    if (v22)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMParsecSearchEngagementEvent.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInput"));

  if (!v21)
    goto LABEL_12;
LABEL_5:
  if (v22)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMParsecSearchEngagementEvent.m"), 396, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entities"));

LABEL_6:
  v39.receiver = self;
  v39.super_class = (Class)BMParsecSearchEngagementEvent;
  v24 = -[BMParsecSearchEngagementEvent init](&v39, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uniqueId, a3);
    objc_storeStrong((id *)&v25->_resultId, a4);
    objc_storeStrong((id *)&v25->_domainId, a5);
    objc_storeStrong((id *)&v25->_personaId, obj);
    v25->_absoluteTimestamp = a7;
    objc_storeStrong((id *)&v25->_userInput, v34);
    objc_storeStrong((id *)&v25->_completedQuery, v35);
    objc_storeStrong((id *)&v25->_entities, a10);
    objc_storeStrong((id *)&v25->_contentProtection, a11);
  }

  return v25;
}

- (BMParsecSearchEngagementEvent)initWithUniqueId:(id)a3 resultId:(id)a4 domainId:(id)a5 absoluteTimestamp:(double)a6 userInput:(id)a7 completedQuery:(id)a8 entities:(id)a9 contentProtection:(id)a10
{
  return -[BMParsecSearchEngagementEvent initWithUniqueId:resultId:domainId:personaId:absoluteTimestamp:userInput:completedQuery:entities:contentProtection:](self, "initWithUniqueId:resultId:domainId:personaId:absoluteTimestamp:userInput:completedQuery:entities:contentProtection:", a3, a4, a5, 0, a7, a8, a6, a9, a10);
}

- (BMParsecSearchEngagementEvent)initWithUniqueId:(id)a3 resultId:(id)a4 domainId:(id)a5 absoluteTimestamp:(double)a6 userInput:(id)a7 completedQuery:(id)a8 entities:(id)a9
{
  return -[BMParsecSearchEngagementEvent initWithUniqueId:resultId:domainId:absoluteTimestamp:userInput:completedQuery:entities:contentProtection:](self, "initWithUniqueId:resultId:domainId:absoluteTimestamp:userInput:completedQuery:entities:contentProtection:", a3, a4, a5, a7, a8, a9, a6, 0);
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
  void *v2;
  void *v3;

  -[BMParsecSearchEngagementEvent proto](self, "proto");
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
  -[BMParsecSearchEngagementEvent jsonDict](self, "jsonDict");
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
  -[BMParsecSearchEngagementEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMParsecSearchEngagementEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMParsecSearchEngagementEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMParsecSearchEngagementEvent initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMParsecSearchEngagementEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMParsecSearchEngagementEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BMParsecSearchEngagementEvent *v15;
  NSObject *v16;
  void *v18;
  void *v19;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasUniqueId](v5, "hasUniqueId")
        && -[NSObject hasResultId](v5, "hasResultId")
        && -[NSObject hasAbsoluteTimestamp](v5, "hasAbsoluteTimestamp")
        && -[NSObject hasUserInput](v5, "hasUserInput")
        && (-[NSObject hasCompletedQuery](v5, "hasCompletedQuery") & 1) != 0)
      {
        -[NSObject uniqueId](v5, "uniqueId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject resultId](v5, "resultId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject domainId](v5, "domainId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject personaId](v5, "personaId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
        v9 = v8;
        -[NSObject userInput](v5, "userInput");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject completedQuery](v5, "completedQuery");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject entities](v5, "entities");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_166);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject contentProtection](v5, "contentProtection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMParsecSearchEngagementEvent initWithUniqueId:resultId:domainId:personaId:absoluteTimestamp:userInput:completedQuery:entities:contentProtection:](self, "initWithUniqueId:resultId:domainId:personaId:absoluteTimestamp:userInput:completedQuery:entities:contentProtection:", v19, v18, v6, v7, v10, v11, v9, v13, v14);

        v15 = self;
LABEL_16:

        goto LABEL_17;
      }
      __biome_log_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BMParsecSearchEngagementEvent initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMParsecSearchEngagementEvent initWithProto:].cold.2();
    }
    v15 = 0;
    goto LABEL_16;
  }
  v15 = 0;
LABEL_17:

  return v15;
}

BMParsecSearchEntity *__47__BMParsecSearchEngagementEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BMParsecSearchEntity *v3;

  v2 = a2;
  v3 = -[BMParsecSearchEntity initWithProto:]([BMParsecSearchEntity alloc], "initWithProto:", v2);

  return v3;
}

- (BMParsecSearchEngagementEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBParsecSearchEngagementEvent *v5;
  BMParsecSearchEngagementEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBParsecSearchEngagementEvent initWithData:]([BMPBParsecSearchEngagementEvent alloc], "initWithData:", v4);

    self = -[BMParsecSearchEngagementEvent initWithProto:](self, "initWithProto:", v5);
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
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  -[BMParsecSearchEngagementEvent uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueId:", v4);

  -[BMParsecSearchEngagementEvent resultId](self, "resultId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResultId:", v5);

  -[BMParsecSearchEngagementEvent domainId](self, "domainId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDomainId:", v6);

  -[BMParsecSearchEngagementEvent personaId](self, "personaId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonaId:", v7);

  -[BMParsecSearchEngagementEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  -[BMParsecSearchEngagementEvent userInput](self, "userInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInput:", v8);

  -[BMParsecSearchEngagementEvent completedQuery](self, "completedQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletedQuery:", v9);

  -[BMParsecSearchEngagementEvent entities](self, "entities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_168);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v3, "setEntities:", v12);

  -[BMParsecSearchEngagementEvent contentProtection](self, "contentProtection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentProtection:", v13);

  return v3;
}

uint64_t __38__BMParsecSearchEngagementEvent_proto__block_invoke(uint64_t a1, void *a2)
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
    -[BMParsecSearchEngagementEvent proto](self, "proto");
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
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_entities;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "isCompleteWithContext:error:", v6, a4, (_QWORD)v14))
        {

          goto LABEL_15;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (self->_uniqueId && self->_resultId && self->_userInput && self->_completedQuery)
  {
    v12 = 1;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_15:
    v12 = 0;
  }

  return v12;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)resultId
{
  return self->_resultId;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (NSString)completedQuery
{
  return self->_completedQuery;
}

- (NSArray)entities
{
  return self->_entities;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_completedQuery, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMParsecSearchEngagementEvent: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMParsecSearchEngagementEvent: tried to initialize with a non-BMParsecSearchEngagementEvent proto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
