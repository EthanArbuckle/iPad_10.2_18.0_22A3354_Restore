@implementation CAXContextualActionContent

- (CAXContextualActionContent)initWithContentType:(id)a3 contentMetadata:(id)a4
{
  id v6;
  id v7;
  CAXContextualActionContent *v8;
  NSString *v9;
  NSString *contentType;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAXContextualActionContent;
  v8 = -[CAXContextualActionContent init](&v12, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = (NSString *)v6;
    }
    else
    {
      +[CAXContextualActionsPredictor ioNoneType](CAXContextualActionsPredictor, "ioNoneType");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    contentType = v8->_contentType;
    v8->_contentType = v9;

    objc_storeStrong((id *)&v8->_contentMetadata, a4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v21 = *MEMORY[0x24BDD0FC8];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAXContextualActionContent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAXProtobufData"));

}

- (CAXContextualActionContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CAXContextualActionContent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAXProtobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CAXContextualActionContent initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[CAXContextualActionContent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CAXContextualActionContent)initWithProtoData:(id)a3
{
  id v4;
  CAXPBContextualActionContent *v5;
  CAXContextualActionContent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[CAXPBContextualActionContent initWithData:]([CAXPBContextualActionContent alloc], "initWithData:", v4);

    self = -[CAXContextualActionContent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CAXContextualActionContent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  CAXContextualActionContent *v12;
  void *v13;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_contextual_actions();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[CAXContextualActionContent initWithProto:].cold.1();

    goto LABEL_8;
  }
  v5 = v4;
  if (objc_msgSend(v5, "hasContentMetadata"))
  {
    v6 = (void *)MEMORY[0x219A31BB4]();
    v7 = (void *)MEMORY[0x24BDD1620];
    v8 = objc_opt_class();
    objc_msgSend(v5, "contentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v5, "contentType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CAXContextualActionContent initWithContentType:contentMetadata:](self, "initWithContentType:contentMetadata:", v13, v10);

  v12 = self;
LABEL_11:

  return v12;
}

- (id)proto
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = objc_msgSend(v3, "setContentType:", self->_contentType);
  if (self->_contentMetadata)
  {
    v5 = (void *)MEMORY[0x219A31BB4](v4);
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_contentMetadata, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v3, "setContentMetadata:", v6);

  return v3;
}

- (id)jsonRawData
{
  NSDictionary *contentMetadata;
  void *v4;
  id v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  contentMetadata = self->_contentMetadata;
  if (contentMetadata)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", contentMetadata, 1, &v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
  }
  else
  {
    v4 = 0;
    v6 = 0;
    v5 = 0;
  }
  v15[0] = CFSTR("contentType");
  -[CAXContextualActionContent contentType](self, "contentType");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("nil");
  v15[1] = CFSTR("contentMetadata");
  v16[0] = v9;
  -[CAXContextualActionContent contentMetadata](self, "contentMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = v6;
  else
    v11 = CFSTR("nil");
  v16[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[CAXContextualActionContent jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSDictionary)contentMetadata
{
  return self->_contentMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMetadata, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
}

- (void)initWithProto:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_2();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_2196B3000, v2, v3, "Unable to construct class %@ from ProtoBuf object", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
