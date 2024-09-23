@implementation BMNewsArticleViewEvent

- (BMNewsArticleViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 content:(id)a8 summary:(id)a9 publication:(id)a10 contentProtection:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BMNewsArticleViewEvent *v24;
  BMNewsArticleViewEvent *v25;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v19 = a3;
  v35 = a4;
  v34 = a5;
  v33 = a7;
  obj = a8;
  v20 = a8;
  v32 = a9;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  if (v19)
  {
    if (v20)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMNewsArticleViewEvent.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("content"));

    if (v21)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMNewsArticleViewEvent.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

  if (!v20)
    goto LABEL_8;
LABEL_3:
  if (v21)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMNewsArticleViewEvent.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("summary"));

LABEL_4:
  v36.receiver = self;
  v36.super_class = (Class)BMNewsArticleViewEvent;
  v24 = -[BMNewsArticleViewEvent init](&v36, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uniqueId, a3);
    objc_storeStrong((id *)&v25->_domainId, a4);
    objc_storeStrong((id *)&v25->_personaId, a5);
    v25->_absoluteTimestamp = a6;
    objc_storeStrong((id *)&v25->_title, a7);
    objc_storeStrong((id *)&v25->_content, obj);
    objc_storeStrong((id *)&v25->_summary, v32);
    objc_storeStrong((id *)&v25->_publication, a10);
    objc_storeStrong((id *)&v25->_contentProtection, a11);
  }

  return v25;
}

- (BMNewsArticleViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 summary:(id)a8 publication:(id)a9 contentProtection:(id)a10
{
  return -[BMNewsArticleViewEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:summary:publication:contentProtection:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:summary:publication:contentProtection:", a3, a4, 0, a6, a7, a8, a5, a9, a10);
}

- (BMNewsArticleViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 summary:(id)a8 publication:(id)a9
{
  return -[BMNewsArticleViewEvent initWithUniqueId:domainId:absoluteTimestamp:title:content:summary:publication:contentProtection:](self, "initWithUniqueId:domainId:absoluteTimestamp:title:content:summary:publication:contentProtection:", a3, a4, a6, a7, a8, a9, a5, 0);
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
      +[BMNewsArticleViewEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v2;
  void *v3;

  -[BMNewsArticleViewEvent proto](self, "proto");
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
  -[BMNewsArticleViewEvent jsonDict](self, "jsonDict");
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
      -[BMNewsArticleViewEvent json].cold.1((uint64_t)v5, v6);

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
  -[BMNewsArticleViewEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMNewsArticleViewEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMNewsArticleViewEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMNewsArticleViewEvent initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMNewsArticleViewEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMNewsArticleViewEvent)initWithProto:(id)a3
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
  BMNewsArticleViewEvent *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasUniqueId](v5, "hasUniqueId")
        && -[NSObject hasAbsoluteTimestamp](v5, "hasAbsoluteTimestamp")
        && -[NSObject hasContent](v5, "hasContent")
        && (-[NSObject hasSummary](v5, "hasSummary") & 1) != 0)
      {
        -[NSObject uniqueId](v5, "uniqueId");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject domainId](v5, "domainId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject personaId](v5, "personaId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
        v9 = v8;
        -[NSObject title](v5, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject content](v5, "content");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject summary](v5, "summary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject publication](v5, "publication");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject contentProtection](v5, "contentProtection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMNewsArticleViewEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:summary:publication:contentProtection:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:summary:publication:contentProtection:", v32, v6, v7, v10, v11, v12, v9, v13, v14);

        v15 = self;
LABEL_15:

        goto LABEL_16;
      }
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        -[BMNewsArticleViewEvent initWithProto:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMNewsArticleViewEvent initWithProto:].cold.2(v5, v16, v17, v18, v19, v20, v21, v22);
    }
    v15 = 0;
    goto LABEL_15;
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (BMNewsArticleViewEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBNewsArticleViewEvent *v5;
  BMNewsArticleViewEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBNewsArticleViewEvent initWithData:]([BMPBNewsArticleViewEvent alloc], "initWithData:", v4);

    self = -[BMNewsArticleViewEvent initWithProto:](self, "initWithProto:", v5);
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
  -[BMNewsArticleViewEvent uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueId:", v4);

  -[BMNewsArticleViewEvent domainId](self, "domainId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDomainId:", v5);

  -[BMNewsArticleViewEvent personaId](self, "personaId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonaId:", v6);

  -[BMNewsArticleViewEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  objc_msgSend(v3, "setTitle:", self->_title);
  objc_msgSend(v3, "setContent:", self->_content);
  objc_msgSend(v3, "setSummary:", self->_summary);
  objc_msgSend(v3, "setPublication:", self->_publication);
  -[BMNewsArticleViewEvent contentProtection](self, "contentProtection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentProtection:", v7);

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_uniqueId, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[NSString hash](self->_title, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_summary, "hash");

  return v7;
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
    -[BMNewsArticleViewEvent proto](self, "proto");
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
  if (self->_uniqueId && self->_content && self->_summary)
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

- (NSString)summary
{
  return self->_summary;
}

- (NSString)publication
{
  return self->_publication;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_publication, 0);
  objc_storeStrong((id *)&self->_summary, 0);
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
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMNewsArticleViewEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMNewsArticleViewEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMNewsArticleViewEvent: tried to initialize with a proto missing required data.", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMNewsArticleViewEvent: tried to initialize with a non-BMNewsArticleViewEvent proto", a5, a6, a7, a8, 0);
}

@end
