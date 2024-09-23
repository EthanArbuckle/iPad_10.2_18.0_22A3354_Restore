@implementation BMPhotosKnowledgeGraphEnrichmentEvent

- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithUniqueId:(id)a3 personaId:(id)a4 absoluteTimestamp:(double)a5 topics:(id)a6 entities:(id)a7 locations:(id)a8 contentProtection:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BMPhotosKnowledgeGraphEnrichmentEvent *v22;
  BMPhotosKnowledgeGraphEnrichmentEvent *v23;
  BMPhotosKnowledgeGraphEnrichmentEvent *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v17 = a3;
  v34 = a4;
  v18 = a6;
  v19 = a7;
  obj = a8;
  v20 = a8;
  v32 = a9;
  v21 = a9;
  v22 = self;
  v33 = v21;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("BMPhotosKnowledgeGraphEnrichmentEvent.m"), 564, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

    if (v18)
    {
LABEL_3:
      if (v19)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("BMPhotosKnowledgeGraphEnrichmentEvent.m"), 566, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entities"));

      if (v20)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("BMPhotosKnowledgeGraphEnrichmentEvent.m"), 565, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("topics"));

  if (!v19)
    goto LABEL_10;
LABEL_4:
  if (v20)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("BMPhotosKnowledgeGraphEnrichmentEvent.m"), 567, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locations"));

LABEL_5:
  v35.receiver = v22;
  v35.super_class = (Class)BMPhotosKnowledgeGraphEnrichmentEvent;
  v23 = -[BMPhotosKnowledgeGraphEnrichmentEvent init](&v35, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_uniqueId, a3);
    objc_storeStrong((id *)&v24->_personaId, a4);
    v24->_absoluteTimestamp = a5;
    objc_storeStrong((id *)&v24->_topics, a6);
    objc_storeStrong((id *)&v24->_entities, a7);
    objc_storeStrong((id *)&v24->_locations, obj);
    objc_storeStrong((id *)&v24->_contentProtection, v32);
  }

  return v24;
}

- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 topics:(id)a5 entities:(id)a6 locations:(id)a7 contentProtection:(id)a8
{
  return -[BMPhotosKnowledgeGraphEnrichmentEvent initWithUniqueId:personaId:absoluteTimestamp:topics:entities:locations:contentProtection:](self, "initWithUniqueId:personaId:absoluteTimestamp:topics:entities:locations:contentProtection:", a3, 0, a5, a6, a7, a8, a4);
}

- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 topics:(id)a5 entities:(id)a6 locations:(id)a7
{
  return -[BMPhotosKnowledgeGraphEnrichmentEvent initWithUniqueId:absoluteTimestamp:topics:entities:locations:contentProtection:](self, "initWithUniqueId:absoluteTimestamp:topics:entities:locations:contentProtection:", a3, a5, a6, a7, 0, a4);
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
      +[BMPhotosKnowledgeGraphEnrichmentEvent eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  -[BMPhotosKnowledgeGraphEnrichmentEvent proto](self, "proto");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[BMPhotosKnowledgeGraphEnrichmentEvent proto](self, "proto");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = v9;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("locations"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("locations"));

    v4 = v10;
  }
  return v4;
}

id __49__BMPhotosKnowledgeGraphEnrichmentEvent_jsonDict__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("encodedLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("encodedLocation"));

    v2 = v4;
  }

  return v2;
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
  -[BMPhotosKnowledgeGraphEnrichmentEvent jsonDict](self, "jsonDict");
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
      -[BMPhotosKnowledgeGraphEnrichmentEvent json].cold.1();

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
  -[BMPhotosKnowledgeGraphEnrichmentEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMPhotosKnowledgeGraphEnrichmentEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMPhotosKnowledgeGraphEnrichmentEvent initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMPhotosKnowledgeGraphEnrichmentEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithProto:(id)a3
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
  BMPhotosKnowledgeGraphEnrichmentEvent *v15;
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
        && (-[NSObject hasAbsoluteTimestamp](v5, "hasAbsoluteTimestamp") & 1) != 0)
      {
        -[NSObject uniqueId](v5, "uniqueId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject personaId](v5, "personaId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
        v9 = v8;
        -[NSObject topics](v5, "topics");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_pas_mappedArrayWithTransform:", &__block_literal_global_192);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject entities](v5, "entities");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_pas_mappedArrayWithTransform:", &__block_literal_global_194);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject locations](v5, "locations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_196);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject contentProtection](v5, "contentProtection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMPhotosKnowledgeGraphEnrichmentEvent initWithUniqueId:personaId:absoluteTimestamp:topics:entities:locations:contentProtection:](self, "initWithUniqueId:personaId:absoluteTimestamp:topics:entities:locations:contentProtection:", v6, v7, v10, v11, v13, v14, v9);

        v15 = self;
LABEL_13:

        goto LABEL_14;
      }
      __biome_log_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BMPhotosKnowledgeGraphEnrichmentEvent initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMPhotosKnowledgeGraphEnrichmentEvent initWithProto:].cold.2();
    }
    v15 = 0;
    goto LABEL_13;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

BMPhotosKnowledgeGraphEnrichmentTopic *__55__BMPhotosKnowledgeGraphEnrichmentEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BMPhotosKnowledgeGraphEnrichmentTopic *v3;

  v2 = a2;
  v3 = -[BMPhotosKnowledgeGraphEnrichmentTopic initWithProto:]([BMPhotosKnowledgeGraphEnrichmentTopic alloc], "initWithProto:", v2);

  return v3;
}

BMPhotosKnowledgeGraphEnrichmentEntity *__55__BMPhotosKnowledgeGraphEnrichmentEvent_initWithProto___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  BMPhotosKnowledgeGraphEnrichmentEntity *v3;

  v2 = a2;
  v3 = -[BMPhotosKnowledgeGraphEnrichmentEntity initWithProto:]([BMPhotosKnowledgeGraphEnrichmentEntity alloc], "initWithProto:", v2);

  return v3;
}

BMPhotosKnowledgeGraphEnrichmentLocation *__55__BMPhotosKnowledgeGraphEnrichmentEvent_initWithProto___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  BMPhotosKnowledgeGraphEnrichmentLocation *v3;

  v2 = a2;
  v3 = -[BMPhotosKnowledgeGraphEnrichmentLocation initWithProto:]([BMPhotosKnowledgeGraphEnrichmentLocation alloc], "initWithProto:", v2);

  return v3;
}

- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBPhotosKnowledgeGraphEnrichmentEvent *v5;
  BMPhotosKnowledgeGraphEnrichmentEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBPhotosKnowledgeGraphEnrichmentEvent initWithData:]([BMPBPhotosKnowledgeGraphEnrichmentEvent alloc], "initWithData:", v4);

    self = -[BMPhotosKnowledgeGraphEnrichmentEvent initWithProto:](self, "initWithProto:", v5);
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
  void *v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  -[BMPhotosKnowledgeGraphEnrichmentEvent uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueId:", v4);

  -[BMPhotosKnowledgeGraphEnrichmentEvent personaId](self, "personaId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonaId:", v5);

  -[BMPhotosKnowledgeGraphEnrichmentEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  -[BMPhotosKnowledgeGraphEnrichmentEvent topics](self, "topics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_198);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v3, "setTopics:", v8);

  -[BMPhotosKnowledgeGraphEnrichmentEvent entities](self, "entities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_200);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v3, "setEntities:", v11);

  -[BMPhotosKnowledgeGraphEnrichmentEvent locations](self, "locations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_202);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v3, "setLocations:", v14);

  -[BMPhotosKnowledgeGraphEnrichmentEvent contentProtection](self, "contentProtection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentProtection:", v15);

  return v3;
}

uint64_t __46__BMPhotosKnowledgeGraphEnrichmentEvent_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

uint64_t __46__BMPhotosKnowledgeGraphEnrichmentEvent_proto__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

uint64_t __46__BMPhotosKnowledgeGraphEnrichmentEvent_proto__block_invoke_3(uint64_t a1, void *a2)
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
    -[BMPhotosKnowledgeGraphEnrichmentEvent proto](self, "proto");
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *uniqueId;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = self->_topics;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v10)
        objc_enumerationMutation(v7);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v11), "isCompleteWithContext:error:", v6, a4))
        goto LABEL_28;
      if (v9 == ++v11)
      {
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = self->_entities;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
LABEL_11:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v14)
        objc_enumerationMutation(v7);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v15), "isCompleteWithContext:error:", v6, a4))
        goto LABEL_28;
      if (v13 == ++v15)
      {
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v13)
          goto LABEL_11;
        break;
      }
    }
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_locations;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
LABEL_19:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v18)
        objc_enumerationMutation(v7);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "isCompleteWithContext:error:", v6, a4, (_QWORD)v23))break;
      if (v17 == ++v19)
      {
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
        if (v17)
          goto LABEL_19;
        goto LABEL_25;
      }
    }
LABEL_28:

    v21 = 0;
    goto LABEL_29;
  }
LABEL_25:

  uniqueId = self->_uniqueId;
  v21 = uniqueId != 0;
  if (a4 && !uniqueId)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_29:

  return v21;
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

- (NSArray)topics
{
  return self->_topics;
}

- (NSArray)entities
{
  return self->_entities;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_topics, 0);
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
  OUTLINED_FUNCTION_4(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEvent: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEvent: Unable to create json from object: %@", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEvent: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEvent: tried to initialize with a non-BMPhotosKnowledgeGraphEnrichmentEvent proto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
