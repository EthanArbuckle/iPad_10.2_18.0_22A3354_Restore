@implementation ATXUnifiedInferredActivityTransition

- (id)initFromTransitionTime:(double)a3 isEntryEvent:(BOOL)a4 source:(id)a5 mode:(id)a6
{
  id v11;
  id v12;
  ATXUnifiedInferredActivityTransition *v13;
  ATXUnifiedInferredActivityTransition *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ATXUnifiedInferredActivityTransition;
  v13 = -[ATXUnifiedInferredActivityTransition init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_mode, a6);
    objc_storeStrong((id *)&v14->_source, a5);
    v14->_transitionTime = a3;
    v14->_isEntryEvent = a4;
    v14->_confidence = 1.0;
    ATXStringToMode();
    v14->_inferredActivityType = ATXActivityTypeFromMode();
  }

  return v14;
}

- (id)initFromTransitionTime:(double)a3 isEntryEvent:(BOOL)a4 source:(id)a5 activityType:(unint64_t)a6 confidence:(double)a7
{
  id v13;
  ATXUnifiedInferredActivityTransition *v14;
  ATXUnifiedInferredActivityTransition *v15;
  uint64_t v16;
  NSString *mode;
  objc_super v19;

  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXUnifiedInferredActivityTransition;
  v14 = -[ATXUnifiedInferredActivityTransition init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_source, a5);
    v15->_transitionTime = a3;
    v15->_isEntryEvent = a4;
    v15->_inferredActivityType = a6;
    v15->_confidence = a7;
    ATXModeFromActivityType();
    ATXModeToString();
    v16 = objc_claimAutoreleasedReturnValue();
    mode = v15->_mode;
    v15->_mode = (NSString *)v16;

  }
  return v15;
}

- (unint64_t)activityTypeAfterTransition
{
  if (-[ATXUnifiedInferredActivityTransition isEntryEvent](self, "isEntryEvent"))
    return -[ATXUnifiedInferredActivityTransition inferredActivityType](self, "inferredActivityType");
  else
    return 14;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXUnifiedInferredActivityTransition jsonRepresentation](self, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unsigned)dataVersion
{
  return 2;
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
  if (a4 == 2)
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
  -[ATXUnifiedInferredActivityTransition encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXUnifiedInferredActivityTransition)initWithCoder:(id)a3
{
  id v4;
  ATXUnifiedInferredActivityTransition *v5;
  ATXUnifiedInferredActivityTransition *v6;
  ATXUnifiedInferredActivityTransition *v7;
  ATXUnifiedInferredActivityTransition *v8;
  ATXUnifiedInferredActivityTransition *v9;
  NSObject *v10;

  v4 = a3;
  v5 = -[ATXUnifiedInferredActivityTransition initWithCoder_v2:](self, "initWithCoder_v2:", v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (ATXUnifiedInferredActivityTransition *)(id)objc_msgSend(0, "initWithCoder_v1:", v4);
    v7 = v8;
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      __atxlog_handle_modes();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[ATXUnifiedInferredActivityTransition initWithCoder:].cold.1();

    }
  }

  return v7;
}

- (ATXUnifiedInferredActivityTransition)initWithCoder_v2:(id)a3
{
  id v4;
  void *v5;
  ATXUnifiedInferredActivityTransition *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ATXUnifiedInferredActivityTransition initWithProtoData:](self, "initWithProtoData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXUnifiedInferredActivityTransition)initWithCoder_v1:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  objc_class *v20;
  NSObject *v21;
  ATXUnifiedInferredActivityTransition *v22;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_modes();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("inferredMode"), v4, 1, CFSTR("com.apple.proactive.decode.InferredModeSession"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 && v8)
  {
    v10 = (void *)MEMORY[0x1E0D81610];
    v11 = objc_opt_class();
    __atxlog_handle_modes();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v11, CFSTR("source"), v4, 1, CFSTR("com.apple.proactive.decode.InferredModeSession"), -1, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 || !v13)
    {
      __atxlog_handle_modes();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("transitionTime"));
      v16 = v15;
      objc_msgSend(v4, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v24 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEntryEvent"));
        objc_msgSend(v4, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          self = (ATXUnifiedInferredActivityTransition *)-[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:mode:](self, "initFromTransitionTime:isEntryEvent:source:mode:", v24, v13, v8, v16);
          v22 = self;
          goto LABEL_14;
        }
        __atxlog_handle_modes();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        goto LABEL_11;
      }
      __atxlog_handle_modes();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
LABEL_11:
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_INFO, "Unable to construct class %@ from coder using v1 decoding", buf, 0xCu);

      }
    }
LABEL_12:

    goto LABEL_13;
  }
  __atxlog_handle_modes();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v18;
    _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_INFO, "Unable to construct class %@ from coder using v1 decoding", buf, 0xCu);
    goto LABEL_12;
  }
LABEL_13:
  v22 = 0;
LABEL_14:

  return v22;
}

- (id)prettyRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  NSString *source;
  __CFString *v12;
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
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_transitionTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = CFSTR("Enters");
  if (!self->_isEntryEvent)
    v9 = CFSTR("Exits");
  v10 = (void *)MEMORY[0x1E0CB3940];
  source = self->_source;
  v12 = v9;
  -[ATXUnifiedInferredActivityTransition inferredActivityType](self, "inferredActivityType");
  ATXActivityTypeToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUnifiedInferredActivityTransition confidence](self, "confidence");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@ %@ %@.  Confidence %.2f"), v8, source, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  ATXUnifiedInferredActivityTransition *v4;
  ATXUnifiedInferredActivityTransition *v5;
  BOOL v6;

  v4 = (ATXUnifiedInferredActivityTransition *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUnifiedInferredActivityTransition isEqualToATXUnifiedInferredActivityTransition:](self, "isEqualToATXUnifiedInferredActivityTransition:", v5);

  return v6;
}

- (BOOL)isEqualToATXUnifiedInferredActivityTransition:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  int v23;
  BOOL result;
  double v25;

  v4 = a3;
  -[ATXUnifiedInferredActivityTransition transitionTime](self, "transitionTime");
  v6 = v5;
  objc_msgSend(v4, "transitionTime");
  v8 = v6 - v7;
  if (v8 >= 0.0)
    v9 = v8;
  else
    v9 = -v8;
  v10 = -[ATXUnifiedInferredActivityTransition isEntryEvent](self, "isEntryEvent");
  v11 = objc_msgSend(v4, "isEntryEvent");
  -[ATXUnifiedInferredActivityTransition mode](self, "mode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  v15 = -[ATXUnifiedInferredActivityTransition inferredActivityType](self, "inferredActivityType");
  v16 = objc_msgSend(v4, "inferredActivityType");
  -[ATXUnifiedInferredActivityTransition confidence](self, "confidence");
  v18 = v17;
  objc_msgSend(v4, "confidence");
  v20 = v19;
  -[ATXUnifiedInferredActivityTransition source](self, "source");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v21, "isEqualToString:", v22);
  result = 0;
  if (v9 < 0.1 && ((v10 ^ v11) & 1) == 0 && v14 && v23)
  {
    v25 = v18 - v20;
    if (v18 - v20 < 0.0)
      v25 = -(v18 - v20);
    return v25 < 0.01 && v15 == v16;
  }
  return result;
}

- (id)eventTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_transitionTime);
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXUnifiedInferredActivityTransition proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUnifiedInferredActivityTransition)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  ATXUnifiedInferredActivityTransition *v13;
  NSObject *v14;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_modes();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[ATXUnifiedInferredActivitySession initWithProto:].cold.1();

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "transitionTime");
  v7 = v6;
  v8 = objc_msgSend(v5, "isActivityStart");
  objc_msgSend(v5, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "inferredActivity");
  objc_msgSend(v5, "confidence");
  v12 = v11;

  self = (ATXUnifiedInferredActivityTransition *)-[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:activityType:confidence:](self, "initFromTransitionTime:isEntryEvent:source:activityType:confidence:", v8, v9, v10, v7, v12);
  v13 = self;
LABEL_8:

  return v13;
}

- (ATXUnifiedInferredActivityTransition)initWithProtoData:(id)a3
{
  id v4;
  ATXPBUnifiedInferredActivityTransition *v5;
  ATXUnifiedInferredActivityTransition *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBUnifiedInferredActivityTransition initWithData:]([ATXPBUnifiedInferredActivityTransition alloc], "initWithData:", v4);

    self = -[ATXUnifiedInferredActivityTransition initWithProto:](self, "initWithProto:", v5);
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
  -[ATXUnifiedInferredActivityTransition confidence](self, "confidence");
  objc_msgSend(v3, "setConfidence:");
  objc_msgSend(v3, "setInferredActivity:", -[ATXUnifiedInferredActivityTransition inferredActivityType](self, "inferredActivityType"));
  -[ATXUnifiedInferredActivityTransition transitionTime](self, "transitionTime");
  objc_msgSend(v3, "setTransitionTime:");
  objc_msgSend(v3, "setIsActivityStart:", -[ATXUnifiedInferredActivityTransition isEntryEvent](self, "isEntryEvent"));
  -[ATXUnifiedInferredActivityTransition source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSource:", v4);

  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXUnifiedInferredActivityTransition *v6;

  v4 = a3;
  v5 = -[ATXPBUnifiedInferredActivityTransition initFromJSON:]([ATXPBUnifiedInferredActivityTransition alloc], "initFromJSON:", v4);

  v6 = -[ATXUnifiedInferredActivityTransition initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXUnifiedInferredActivityTransition proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)transitionTime
{
  return self->_transitionTime;
}

- (BOOL)isEntryEvent
{
  return self->_isEntryEvent;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)mode
{
  return self->_mode;
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
  objc_storeStrong((id *)&self->_mode, 0);
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

@end
