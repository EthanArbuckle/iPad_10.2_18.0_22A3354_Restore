@implementation ATXUnifiedInferredActivitySession

- (id)initFromStartTime:(double)a3 endTime:(double)a4 source:(id)a5 activityType:(unint64_t)a6 confidence:(double)a7
{
  id v13;
  ATXUnifiedInferredActivitySession *v14;
  ATXUnifiedInferredActivitySession *v15;
  objc_super v17;

  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXUnifiedInferredActivitySession;
  v14 = -[ATXUnifiedInferredActivitySession init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_source, a5);
    v15->_startTime = a3;
    v15->_endTime = a4;
    v15->_inferredActivityType = a6;
    v15->_confidence = a7;
  }

  return v15;
}

- (id)prettyRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *source;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v4 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFormatFromTemplate:options:locale:", CFSTR("EMMMd HH:mm ss ZZZZ"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setDateFormat:", v6);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_startTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_endTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  source = self->_source;
  -[ATXUnifiedInferredActivitySession inferredActivityType](self, "inferredActivityType");
  ATXActivityTypeToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUnifiedInferredActivitySession confidence](self, "confidence");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: (%@, %@), %@.  Confidence %.2f"), source, v8, v10, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXUnifiedInferredActivitySession jsonRepresentation](self, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unsigned)dataVersion
{
  return 3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v12;

  v6 = a3;
  if (a4 == 3)
  {
    v7 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1CAA48B6C]();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, v6, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    objc_autoreleasePoolPop(v8);
    v7 = 0;
    if (!v10)
      v7 = v9;

  }
  return v7;
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
  -[ATXUnifiedInferredActivitySession encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXUnifiedInferredActivitySession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXUnifiedInferredActivitySession *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ATXUnifiedInferredActivitySession initWithProtoData:](self, "initWithProtoData:", v5);
    v6 = self;
  }
  else
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXUnifiedInferredActivitySession initWithCoder:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ATXUnifiedInferredActivitySession *v4;
  ATXUnifiedInferredActivitySession *v5;
  BOOL v6;

  v4 = (ATXUnifiedInferredActivitySession *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUnifiedInferredActivitySession isEqualToATXUnifiedInferredActivitySession:](self, "isEqualToATXUnifiedInferredActivitySession:", v5);

  return v6;
}

- (BOOL)isEqualToATXUnifiedInferredActivitySession:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v28;

  v4 = a3;
  -[ATXUnifiedInferredActivitySession startTime](self, "startTime");
  v6 = v5;
  objc_msgSend(v4, "startTime");
  v8 = v6 - v7;
  if (v8 >= 0.0)
    v9 = v8;
  else
    v9 = -v8;
  -[ATXUnifiedInferredActivitySession endTime](self, "endTime");
  v11 = v10;
  objc_msgSend(v4, "endTime");
  v13 = v12;
  v14 = -[ATXUnifiedInferredActivitySession inferredActivityType](self, "inferredActivityType");
  v15 = objc_msgSend(v4, "inferredActivityType");
  -[ATXUnifiedInferredActivitySession source](self, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToString:", v17);

  v19 = -[ATXUnifiedInferredActivitySession inferredActivityType](self, "inferredActivityType");
  v20 = objc_msgSend(v4, "inferredActivityType");
  -[ATXUnifiedInferredActivitySession confidence](self, "confidence");
  v22 = v21;
  objc_msgSend(v4, "confidence");
  v24 = v23;

  if (v9 >= 0.1)
    return 0;
  v25 = v22 - v24;
  if (v22 - v24 < 0.0)
    v25 = -(v22 - v24);
  v26 = v11 - v13;
  if (v11 - v13 < 0.0)
    v26 = -(v11 - v13);
  if (v26 < 0.1 && v14 == v15)
    v28 = v18;
  else
    v28 = 0;
  if (v19 != v20)
    v28 = 0;
  return v25 < 0.01 && v28;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXUnifiedInferredActivitySession proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUnifiedInferredActivitySession)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  ATXUnifiedInferredActivitySession *v14;
  NSObject *v15;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_modes();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[ATXUnifiedInferredActivitySession initWithProto:].cold.1();

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "startTime");
  v7 = v6;
  objc_msgSend(v5, "endTime");
  v9 = v8;
  objc_msgSend(v5, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "inferredActivity");
  objc_msgSend(v5, "confidence");
  v13 = v12;

  self = (ATXUnifiedInferredActivitySession *)-[ATXUnifiedInferredActivitySession initFromStartTime:endTime:source:activityType:confidence:](self, "initFromStartTime:endTime:source:activityType:confidence:", v10, v11, v7, v9, v13);
  v14 = self;
LABEL_8:

  return v14;
}

- (ATXUnifiedInferredActivitySession)initWithProtoData:(id)a3
{
  id v4;
  ATXPBUnifiedInferredActivitySession *v5;
  ATXUnifiedInferredActivitySession *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBUnifiedInferredActivitySession initWithData:]([ATXPBUnifiedInferredActivitySession alloc], "initWithData:", v4);

    self = -[ATXUnifiedInferredActivitySession initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  -[ATXUnifiedInferredActivitySession confidence](self, "confidence");
  objc_msgSend(v3, "setConfidence:");
  objc_msgSend(v3, "setInferredActivity:", -[ATXUnifiedInferredActivitySession inferredActivityType](self, "inferredActivityType"));
  -[ATXUnifiedInferredActivitySession startTime](self, "startTime");
  objc_msgSend(v3, "setStartTime:");
  -[ATXUnifiedInferredActivitySession endTime](self, "endTime");
  objc_msgSend(v3, "setEndTime:");
  -[ATXUnifiedInferredActivitySession source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSource:", v4);

  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXUnifiedInferredActivitySession *v6;

  v4 = a3;
  v5 = -[ATXPBUnifiedInferredActivitySession initFromJSON:]([ATXPBUnifiedInferredActivitySession alloc], "initFromJSON:", v4);

  v6 = -[ATXUnifiedInferredActivitySession initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXUnifiedInferredActivitySession proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (NSString)source
{
  return self->_source;
}

- (unint64_t)inferredActivityType
{
  return self->_inferredActivityType;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)initWithCoder:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "Unable to construct class %@ from coder", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
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

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "Unable to construct class %@ from ProtoBuf object", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
