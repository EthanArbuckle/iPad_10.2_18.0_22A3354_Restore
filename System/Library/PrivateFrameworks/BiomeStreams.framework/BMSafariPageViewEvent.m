@implementation BMSafariPageViewEvent

- (BMSafariPageViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 content:(id)a8 contentIsReaderText:(BOOL)a9 url:(id)a10 contentProtection:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  BMSafariPageViewEvent *v22;
  BMSafariPageViewEvent *v23;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v18 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a7;
  obj = a8;
  v19 = a8;
  v20 = a10;
  v21 = a11;
  if (v18)
  {
    if (v19)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSafariPageViewEvent.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("content"));

    if (v20)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSafariPageViewEvent.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

  if (!v19)
    goto LABEL_8;
LABEL_3:
  if (v20)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSafariPageViewEvent.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

LABEL_4:
  v34.receiver = self;
  v34.super_class = (Class)BMSafariPageViewEvent;
  v22 = -[BMSafariPageViewEvent init](&v34, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_uniqueId, a3);
    objc_storeStrong((id *)&v23->_personaId, a5);
    objc_storeStrong((id *)&v23->_domainId, a4);
    v23->_absoluteTimestamp = a6;
    objc_storeStrong((id *)&v23->_title, a7);
    objc_storeStrong((id *)&v23->_content, obj);
    v23->_contentIsReaderText = a9;
    objc_storeStrong((id *)&v23->_url, a10);
    objc_storeStrong((id *)&v23->_contentProtection, a11);
  }

  return v23;
}

- (BMSafariPageViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 contentIsReaderText:(BOOL)a8 url:(id)a9 contentProtection:(id)a10
{
  return -[BMSafariPageViewEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:contentIsReaderText:url:contentProtection:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:contentIsReaderText:url:contentProtection:", a3, a4, 0, a6, a7, a8, a5, a9, a10);
}

- (BMSafariPageViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 contentIsReaderText:(BOOL)a8 url:(id)a9
{
  return -[BMSafariPageViewEvent initWithUniqueId:domainId:absoluteTimestamp:title:content:contentIsReaderText:url:contentProtection:](self, "initWithUniqueId:domainId:absoluteTimestamp:title:content:contentIsReaderText:url:contentProtection:", a3, a4, a6, a7, a8, a9, a5, 0);
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
      +[BMSafariPageViewEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v2;
  void *v3;

  -[BMSafariPageViewEvent proto](self, "proto");
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
  -[BMSafariPageViewEvent jsonDict](self, "jsonDict");
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
      -[BMSafariPageViewEvent json].cold.1((uint64_t)v5, v6);

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
  -[BMSafariPageViewEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMSafariPageViewEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMSafariPageViewEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMSafariPageViewEvent initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMSafariPageViewEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSafariPageViewEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BMSafariPageViewEvent *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMSafariPageViewEvent initWithProto:].cold.4(v5, v20, v21, v22, v23, v24, v25, v26);
      v19 = 0;
      goto LABEL_19;
    }
    v5 = v4;
    if (-[NSObject hasUniqueId](v5, "hasUniqueId")
      && -[NSObject hasAbsoluteTimestamp](v5, "hasAbsoluteTimestamp")
      && -[NSObject hasContent](v5, "hasContent")
      && -[NSObject hasContentIsReaderText](v5, "hasContentIsReaderText")
      && (-[NSObject hasUrl](v5, "hasUrl") & 1) != 0)
    {
      -[NSObject url](v5, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (v7)
      {
        v8 = objc_alloc(MEMORY[0x1E0C99E98]);
        -[NSObject url](v5, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "initWithString:encodingInvalidCharacters:", v9, 1);

        if (v10)
        {
          -[NSObject uniqueId](v5, "uniqueId");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject domainId](v5, "domainId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject personaId](v5, "personaId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
          v14 = v13;
          -[NSObject title](v5, "title");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject content](v5, "content");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[NSObject contentIsReaderText](v5, "contentIsReaderText");
          -[NSObject contentProtection](v5, "contentProtection");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[BMSafariPageViewEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:contentIsReaderText:url:contentProtection:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:contentIsReaderText:url:contentProtection:", v43, v11, v12, v15, v16, v17, v14, v10, v18);

          v19 = self;
LABEL_18:

LABEL_19:
          goto LABEL_20;
        }
        __biome_log_for_category();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
          -[BMSafariPageViewEvent initWithProto:].cold.2(v5, v42);

      }
      else
      {
        __biome_log_for_category();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          -[BMSafariPageViewEvent initWithProto:].cold.1(v10, v35, v36, v37, v38, v39, v40, v41);
      }
    }
    else
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BMSafariPageViewEvent initWithProto:].cold.3(v10, v27, v28, v29, v30, v31, v32, v33);
    }
    v19 = 0;
    goto LABEL_18;
  }
  v19 = 0;
LABEL_20:

  return v19;
}

- (BMSafariPageViewEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSafariPageViewEvent *v5;
  BMSafariPageViewEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSafariPageViewEvent initWithData:]([BMPBSafariPageViewEvent alloc], "initWithData:", v4);

    self = -[BMSafariPageViewEvent initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  -[BMSafariPageViewEvent uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueId:", v4);

  -[BMSafariPageViewEvent domainId](self, "domainId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDomainId:", v5);

  -[BMSafariPageViewEvent personaId](self, "personaId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonaId:", v6);

  -[BMSafariPageViewEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  objc_msgSend(v3, "setTitle:", self->_title);
  objc_msgSend(v3, "setContent:", self->_content);
  objc_msgSend(v3, "setContentIsReaderText:", self->_contentIsReaderText);
  -[NSURL absoluteString](self->_url, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUrl:", v7);

  -[BMSafariPageViewEvent contentProtection](self, "contentProtection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentProtection:", v8);

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_uniqueId, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[NSURL absoluteString](self->_url, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ v3 ^ objc_msgSend(v6, "hash");

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
    -[BMSafariPageViewEvent proto](self, "proto");
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
  if (self->_uniqueId && self->_content && self->_url)
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

- (BOOL)contentIsReaderText
{
  return self->_contentIsReaderText;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_url, 0);
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
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMSafariPageViewEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMSafariPageViewEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMSafariPageViewEvent: tried to initialize with a proto with empty url string.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138739971;
  v5 = v3;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "BMSafariPageViewEvent: could not init NSURL from string %{sensitive}@.", (uint8_t *)&v4, 0xCu);

}

- (void)initWithProto:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMSafariPageViewEvent: tried to initialize with a proto missing required data.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMSafariPageViewEvent: tried to initialize with a non-BMSafariPageViewEvent proto", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
