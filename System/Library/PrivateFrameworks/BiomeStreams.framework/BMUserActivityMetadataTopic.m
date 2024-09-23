@implementation BMUserActivityMetadataTopic

- (BMUserActivityMetadataTopic)initWithTopicIdentifier:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  BMUserActivityMetadataTopic *v8;
  uint64_t v9;
  NSString *topicIdentifier;
  uint64_t v11;
  NSString *title;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMUserActivityMetadataTopic;
  v8 = -[BMUserActivityMetadataTopic init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    topicIdentifier = v8->_topicIdentifier;
    v8->_topicIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v11;

  }
  return v8;
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
      +[BMUserActivityMetadataTopic eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  NSString *title;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("topicIdentifier");
  v4[1] = CFSTR("title");
  title = self->_title;
  v5[0] = self->_topicIdentifier;
  v5[1] = title;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
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
  -[BMUserActivityMetadataTopic jsonDict](self, "jsonDict");
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
      -[BMUserActivityMetadataTopic json].cold.1((uint64_t)v5, v6);

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
  -[BMUserActivityMetadataTopic encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (BMUserActivityMetadataTopic)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMUserActivityMetadataTopic *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("data"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMUserActivityMetadataTopic initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMUserActivityMetadataTopic proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMUserActivityMetadataTopic)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BMUserActivityMetadataTopic *v8;
  NSObject *v9;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasTopicIdentifier](v5, "hasTopicIdentifier")
        && (-[NSObject hasTitle](v5, "hasTitle") & 1) != 0)
      {
        -[NSObject topicIdentifier](v5, "topicIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject title](v5, "title");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMUserActivityMetadataTopic initWithTopicIdentifier:title:](self, "initWithTopicIdentifier:title:", v6, v7);

        v8 = self;
LABEL_13:

        goto LABEL_14;
      }
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BMUserActivityMetadataTopic initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMUserActivityMetadataTopic initWithProto:].cold.2();
    }
    v8 = 0;
    goto LABEL_13;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (BMUserActivityMetadataTopic)initWithProtoData:(id)a3
{
  id v4;
  BMPBUserActivityMetadataTopic *v5;
  BMUserActivityMetadataTopic *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBUserActivityMetadataTopic initWithData:]([BMPBUserActivityMetadataTopic alloc], "initWithData:", v4);

    self = -[BMUserActivityMetadataTopic initWithProto:](self, "initWithProto:", v5);
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
  -[BMUserActivityMetadataTopic topicIdentifier](self, "topicIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v3, "setTopicIdentifier:", v5);

  -[BMUserActivityMetadataTopic title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v3, "setTitle:", v7);

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_topicIdentifier, "hash");
  return -[NSString hash](self->_title, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  NSString *topicIdentifier;
  NSString *title;
  int v11;
  BOOL v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_17;
  }
  v7 = v6;
  v8 = v7;
  topicIdentifier = self->_topicIdentifier;
  if (topicIdentifier
    || (objc_msgSend(v7, "topicIdentifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    title = self->_title;
    objc_msgSend(v8, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](title, "isEqualToString:", v4))
    {
      v12 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  v13 = self->_topicIdentifier;
  objc_msgSend(v8, "topicIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](v13, "isEqualToString:", v14))
  {
    v15 = self->_title;
    objc_msgSend(v8, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSString isEqualToString:](v15, "isEqualToString:", v16);

  }
  else
  {
    v12 = 0;
  }

  if (v11)
    goto LABEL_13;
LABEL_14:
  if (!topicIdentifier)

LABEL_17:
  return v12;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (self->_topicIdentifier && self->_title)
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

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_topicIdentifier, 0);
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

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4(&dword_18D810000, v0, v1, "BMUserActivityMetadataEvent: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMUserActivityMetadataTopic: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMUserActivityMetadataTopic: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMUserActivityMetadataTopic: tried to initialize with a non-BMUserActivityMetadataTopic proto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
