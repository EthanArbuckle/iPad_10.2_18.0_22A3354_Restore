@implementation BMSiriQueryResult

- (BMSiriQueryResult)initWithQID:(id)a3 domain:(id)a4 confidence:(double)a5
{
  id v10;
  id v11;
  BMSiriQueryResult *v12;
  BMSiriQueryResult *v13;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSiriQueryEvent.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domain"));

  }
  v16.receiver = self;
  v16.super_class = (Class)BMSiriQueryResult;
  v12 = -[BMSiriQueryResult init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_qid, a3);
    objc_storeStrong((id *)&v13->_domain, a4);
    v13->_confidence = a5;
  }

  return v13;
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
      +[BMSiriQueryResult eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  NSString *qid;
  void *v4;
  NSString *domain;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("qid");
  qid = self->_qid;
  v4 = qid;
  if (!qid)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  domain = self->_domain;
  v10[0] = v4;
  v10[1] = domain;
  v9[1] = CFSTR("domain");
  v9[2] = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!qid)
  return v7;
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
  -[BMSiriQueryResult jsonDict](self, "jsonDict");
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
      -[BMSiriQueryResult json].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

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
  -[BMSiriQueryResult encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMSiriQueryResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMSiriQueryResult *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMSiriQueryResult initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMSiriQueryResult proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSiriQueryResult)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BMSiriQueryResult *v8;
  NSObject *v9;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasDomain](v5, "hasDomain")
        && (-[NSObject hasConfidence](v5, "hasConfidence") & 1) != 0)
      {
        -[NSObject qid](v5, "qid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject domain](v5, "domain");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject confidence](v5, "confidence");
        self = -[BMSiriQueryResult initWithQID:domain:confidence:](self, "initWithQID:domain:confidence:", v6, v7);

        v8 = self;
LABEL_13:

        goto LABEL_14;
      }
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BMSiriQueryResult initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMSiriQueryResult initWithProto:].cold.2();
    }
    v8 = 0;
    goto LABEL_13;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (BMSiriQueryResult)initWithProtoData:(id)a3
{
  id v4;
  BMPBSiriQueryResult *v5;
  BMSiriQueryResult *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSiriQueryResult initWithData:]([BMPBSiriQueryResult alloc], "initWithData:", v4);

    self = -[BMSiriQueryResult initWithProto:](self, "initWithProto:", v5);
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
  -[BMSiriQueryResult qid](self, "qid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQid:", v4);

  -[BMSiriQueryResult domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDomain:", v5);

  -[BMSiriQueryResult confidence](self, "confidence");
  objc_msgSend(v3, "setConfidence:");
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_domain, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  NSString *qid;
  NSString *v10;
  int v11;
  BOOL v12;
  NSString *domain;
  void *v14;
  double confidence;
  double v16;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_18;
  }
  v7 = v6;
  v8 = v7;
  qid = self->_qid;
  v10 = qid;
  if (!qid)
  {
    objc_msgSend(v7, "qid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v11 = 0;
      goto LABEL_10;
    }
    v10 = self->_qid;
  }
  objc_msgSend(v8, "qid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](v10, "isEqualToString:", v4))
  {
    v12 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v11 = 1;
LABEL_10:
  domain = self->_domain;
  objc_msgSend(v8, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](domain, "isEqualToString:", v14))
  {
    confidence = self->_confidence;
    objc_msgSend(v8, "confidence");
    v12 = confidence == v16;
  }
  else
  {
    v12 = 0;
  }

  if (v11)
    goto LABEL_14;
LABEL_15:
  if (!qid)

LABEL_18:
  return v12;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  NSString *domain;

  domain = self->_domain;
  if (a4 && !domain)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return domain != 0;
}

- (NSString)qid
{
  return self->_qid;
}

- (NSString)domain
{
  return self->_domain;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_qid, 0);
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
  OUTLINED_FUNCTION_4(&dword_18D810000, v0, v1, "BMSiriQueryResult: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)json
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "BMSiriQueryResult: Unable to create json from object: %@", a5, a6, a7, a8, 2u);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMSiriQueryResult: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMSiriQueryResult: tried to initialize with a non-BMSiriQueryResult proto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
