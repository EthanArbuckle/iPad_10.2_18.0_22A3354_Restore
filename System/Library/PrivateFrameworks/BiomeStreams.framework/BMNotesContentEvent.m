@implementation BMNotesContentEvent

- (BMNotesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 content:(id)a8 contentProtection:(id)a9
{
  id v17;
  id v18;
  id v19;
  BMNotesContentEvent *v20;
  BMNotesContentEvent *v21;
  void *v23;
  void *v24;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v17 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a7;
  v18 = a8;
  v19 = a9;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMNotesContentEvent.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMNotesContentEvent.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("content"));

LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)BMNotesContentEvent;
  v20 = -[BMNotesContentEvent init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uniqueId, a3);
    objc_storeStrong((id *)&v21->_domainId, a4);
    objc_storeStrong((id *)&v21->_personaId, a5);
    v21->_absoluteTimestamp = a6;
    objc_storeStrong((id *)&v21->_title, a7);
    objc_storeStrong((id *)&v21->_content, a8);
    objc_storeStrong((id *)&v21->_contentProtection, a9);
  }

  return v21;
}

- (BMNotesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 contentProtection:(id)a8
{
  return -[BMNotesContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:contentProtection:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:contentProtection:", a3, a4, 0, a6, a7, a8, a5);
}

- (BMNotesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7
{
  return -[BMNotesContentEvent initWithUniqueId:domainId:absoluteTimestamp:title:content:contentProtection:](self, "initWithUniqueId:domainId:absoluteTimestamp:title:content:contentProtection:", a3, a4, a6, a7, 0, a5);
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
      +[BMNotesContentEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v2;
  void *v3;

  -[BMNotesContentEvent proto](self, "proto");
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
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMNotesContentEvent jsonDict](self, "jsonDict");
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
      -[BMNotesContentEvent json].cold.1((uint64_t)v5, v6);

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
  -[BMNotesContentEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMNotesContentEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMNotesContentEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMNotesContentEvent initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMNotesContentEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMNotesContentEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  BMNotesContentEvent *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasUniqueId](v5, "hasUniqueId")
        && -[NSObject hasAbsoluteTimestamp](v5, "hasAbsoluteTimestamp")
        && (-[NSObject hasContent](v5, "hasContent") & 1) != 0)
      {
        -[NSObject uniqueId](v5, "uniqueId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject domainId](v5, "domainId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject personaId](v5, "personaId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
        v10 = v9;
        -[NSObject title](v5, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject content](v5, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject contentProtection](v5, "contentProtection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMNotesContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:contentProtection:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:contentProtection:", v6, v7, v8, v11, v12, v13, v10);

        v14 = self;
LABEL_14:

        goto LABEL_15;
      }
      __biome_log_for_category();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[BMNotesContentEvent initWithProto:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMNotesContentEvent initWithProto:].cold.2(v5, v15, v16, v17, v18, v19, v20, v21);
    }
    v14 = 0;
    goto LABEL_14;
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (BMNotesContentEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBNotesContentEvent *v5;
  BMNotesContentEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBNotesContentEvent initWithData:]([BMPBNotesContentEvent alloc], "initWithData:", v4);

    self = -[BMNotesContentEvent initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  -[BMNotesContentEvent uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueId:", v4);

  -[BMNotesContentEvent domainId](self, "domainId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDomainId:", v5);

  -[BMNotesContentEvent personaId](self, "personaId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonaId:", v6);

  -[BMNotesContentEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  -[BMNotesContentEvent title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v7);

  -[BMNotesContentEvent content](self, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContent:", v8);

  -[BMNotesContentEvent contentProtection](self, "contentProtection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentProtection:", v9);

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_uniqueId, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

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
    -[BMNotesContentEvent proto](self, "proto");
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
  if (self->_uniqueId && self->_content)
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

- (NSString)title
{
  return self->_title;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMNotesContentEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMNotesContentEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMNotesContentEvent: tried to initialize with a proto missing required data.", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMNotesContentEvent: tried to initialize with a non-BMNotesContentEvent proto", a5, a6, a7, a8, 0);
}

@end
