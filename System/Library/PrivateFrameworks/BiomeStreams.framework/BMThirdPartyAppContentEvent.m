@implementation BMThirdPartyAppContentEvent

- (BMThirdPartyAppContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 bundleId:(id)a5 personaId:(id)a6 absoluteTimestamp:(double)a7 title:(id)a8 desc:(id)a9 comment:(id)a10 content:(id)a11 contentProtection:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BMThirdPartyAppContentEvent *v24;
  BMThirdPartyAppContentEvent *v25;
  void *v27;
  void *v28;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v19 = a3;
  v31 = a4;
  v37 = a4;
  v32 = a5;
  v20 = a5;
  v36 = a6;
  v33 = a8;
  v35 = a8;
  v21 = a9;
  v34 = a10;
  v22 = a11;
  v23 = a12;
  if (v19)
  {
    if (v20)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMThirdPartyAppContentEvent.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

    if (v20)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMThirdPartyAppContentEvent.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

LABEL_3:
  v38.receiver = self;
  v38.super_class = (Class)BMThirdPartyAppContentEvent;
  v24 = -[BMThirdPartyAppContentEvent init](&v38, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uniqueId, a3);
    objc_storeStrong((id *)&v25->_domainId, v31);
    objc_storeStrong((id *)&v25->_bundleId, v32);
    objc_storeStrong((id *)&v25->_personaId, a6);
    v25->_absoluteTimestamp = a7;
    objc_storeStrong((id *)&v25->_title, v33);
    objc_storeStrong((id *)&v25->_desc, a9);
    objc_storeStrong((id *)&v25->_comment, a10);
    objc_storeStrong((id *)&v25->_content, a11);
    objc_storeStrong((id *)&v25->_contentProtection, a12);
  }

  return v25;
}

- (BMThirdPartyAppContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 bundleId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 desc:(id)a8 comment:(id)a9 content:(id)a10 contentProtection:(id)a11
{
  return -[BMThirdPartyAppContentEvent initWithUniqueId:domainId:bundleId:personaId:absoluteTimestamp:title:desc:comment:content:contentProtection:](self, "initWithUniqueId:domainId:bundleId:personaId:absoluteTimestamp:title:desc:comment:content:contentProtection:", a3, a4, a5, 0, a7, a8, a6, a9, a10, a11);
}

- (BMThirdPartyAppContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 bundleId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 desc:(id)a8 comment:(id)a9 content:(id)a10
{
  return -[BMThirdPartyAppContentEvent initWithUniqueId:domainId:bundleId:absoluteTimestamp:title:desc:comment:content:contentProtection:](self, "initWithUniqueId:domainId:bundleId:absoluteTimestamp:title:desc:comment:content:contentProtection:", a3, a4, a5, a7, a8, a9, a6, a10, 0);
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
      +[BMThirdPartyAppContentEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v2;
  void *v3;

  -[BMThirdPartyAppContentEvent proto](self, "proto");
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
  -[BMThirdPartyAppContentEvent jsonDict](self, "jsonDict");
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
      -[BMThirdPartyAppContentEvent json].cold.1((uint64_t)v5, v6);

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
  -[BMThirdPartyAppContentEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMThirdPartyAppContentEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMThirdPartyAppContentEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMThirdPartyAppContentEvent initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMThirdPartyAppContentEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMThirdPartyAppContentEvent)initWithProto:(id)a3
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
  BMThirdPartyAppContentEvent *v15;
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
  void *v33;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasUniqueId](v5, "hasUniqueId")
        && -[NSObject hasAbsoluteTimestamp](v5, "hasAbsoluteTimestamp")
        && (-[NSObject hasBundleId](v5, "hasBundleId") & 1) != 0)
      {
        -[NSObject uniqueId](v5, "uniqueId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject domainId](v5, "domainId");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject bundleId](v5, "bundleId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject personaId](v5, "personaId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
        v9 = v8;
        -[NSObject title](v5, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject desc](v5, "desc");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject comment](v5, "comment");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject content](v5, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject contentProtection](v5, "contentProtection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMThirdPartyAppContentEvent initWithUniqueId:domainId:bundleId:personaId:absoluteTimestamp:title:desc:comment:content:contentProtection:](self, "initWithUniqueId:domainId:bundleId:personaId:absoluteTimestamp:title:desc:comment:content:contentProtection:", v33, v32, v6, v7, v10, v11, v9, v12, v13, v14);

        v15 = self;
LABEL_14:

        goto LABEL_15;
      }
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        -[BMThirdPartyAppContentEvent initWithProto:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMThirdPartyAppContentEvent initWithProto:].cold.2(v5, v16, v17, v18, v19, v20, v21, v22);
    }
    v15 = 0;
    goto LABEL_14;
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (BMThirdPartyAppContentEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBThirdPartyAppContentEvent *v5;
  BMThirdPartyAppContentEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBThirdPartyAppContentEvent initWithData:]([BMPBThirdPartyAppContentEvent alloc], "initWithData:", v4);

    self = -[BMThirdPartyAppContentEvent initWithProto:](self, "initWithProto:", v5);
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
  -[BMThirdPartyAppContentEvent uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueId:", v4);

  -[BMThirdPartyAppContentEvent domainId](self, "domainId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDomainId:", v5);

  -[BMThirdPartyAppContentEvent bundleId](self, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleId:", v6);

  -[BMThirdPartyAppContentEvent personaId](self, "personaId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonaId:", v7);

  -[BMThirdPartyAppContentEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  objc_msgSend(v3, "setTitle:", self->_title);
  objc_msgSend(v3, "setDesc:", self->_desc);
  objc_msgSend(v3, "setComment:", self->_comment);
  objc_msgSend(v3, "setContent:", self->_content);
  objc_msgSend(v3, "setContentProtection:", self->_contentProtection);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_uniqueId, "hash");
  v4 = -[NSString hash](self->_bundleId, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
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
    -[BMThirdPartyAppContentEvent proto](self, "proto");
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
  if (self->_uniqueId && self->_bundleId)
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

- (NSString)bundleId
{
  return self->_bundleId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)desc
{
  return self->_desc;
}

- (NSString)comment
{
  return self->_comment;
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
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
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
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMThirdPartyAppContentEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMThirdPartyAppContentEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMPBThirdPartyAppContentEvent: tried to initialize with a proto missing required data.", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMThirdPartyAppContentEvent: tried to initialize with a non-BMThirdPartyAppContentEvent proto", a5, a6, a7, a8, 0);
}

@end
