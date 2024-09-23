@implementation BMSiriInferredHelpfulnessEvent

- (BMSiriInferredHelpfulnessEvent)initWithAbsoluteTimestamp:(double)a3
{
  return -[BMSiriInferredHelpfulnessEvent initWithAbsoluteTimestamp:inferredHelpfulnessScore:restatementScore:turnID:modelID:](self, "initWithAbsoluteTimestamp:inferredHelpfulnessScore:restatementScore:turnID:modelID:", 0, 0, a3, -1.0, -1.0);
}

- (BMSiriInferredHelpfulnessEvent)initWithAbsoluteTimestamp:(double)a3 inferredHelpfulnessScore:(double)a4 restatementScore:(double)a5 turnID:(id)a6 modelID:(id)a7
{
  id v12;
  id v13;
  BMSiriInferredHelpfulnessEvent *v14;
  BMSiriInferredHelpfulnessEvent *v15;
  uint64_t v16;
  NSString *turnID;
  uint64_t v18;
  NSString *modelID;
  objc_super v21;

  v12 = a6;
  v13 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMSiriInferredHelpfulnessEvent;
  v14 = -[BMSiriInferredHelpfulnessEvent init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_absoluteTimestamp = a3;
    v14->_inferredHelpfulnessScore = a4;
    v14->_restatementScore = a5;
    v16 = objc_msgSend(v12, "copy");
    turnID = v15->_turnID;
    v15->_turnID = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    modelID = v15->_modelID;
    v15->_modelID = (NSString *)v18;

  }
  return v15;
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
      +[BMSiriInferredHelpfulnessEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  NSString *turnID;
  void *v7;
  NSString *modelID;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("absoluteTimeStamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("inferredHelpfulnessScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_inferredHelpfulnessScore);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("restatementScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_restatementScore);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("turnID");
  turnID = self->_turnID;
  v7 = turnID;
  if (!turnID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[3] = v7;
  v12[4] = CFSTR("modelID");
  modelID = self->_modelID;
  v9 = modelID;
  if (!modelID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!modelID)
  {

    if (turnID)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!turnID)
    goto LABEL_9;
LABEL_7:

  return v10;
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
  -[BMSiriInferredHelpfulnessEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMSiriInferredHelpfulnessEvent json].cold.1((uint64_t)v5, v6);

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
  -[BMSiriInferredHelpfulnessEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (BMSiriInferredHelpfulnessEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMSiriInferredHelpfulnessEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("data"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMSiriInferredHelpfulnessEvent initWithProtoData:](self, "initWithProtoData:", v6);
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

  -[BMSiriInferredHelpfulnessEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSiriInferredHelpfulnessEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  BMSiriInferredHelpfulnessEvent *v14;
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
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BMSiriInferredHelpfulnessEvent initWithProto:].cold.1((uint64_t)self, v15);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "absoluteTimestamp");
  v7 = v6;
  objc_msgSend(v5, "inferredHelpfulnessScore");
  v9 = v8;
  objc_msgSend(v5, "restatementScore");
  v11 = v10;
  objc_msgSend(v5, "turnID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[BMSiriInferredHelpfulnessEvent initWithAbsoluteTimestamp:inferredHelpfulnessScore:restatementScore:turnID:modelID:](self, "initWithAbsoluteTimestamp:inferredHelpfulnessScore:restatementScore:turnID:modelID:", v12, v13, v7, v9, v11);
  v14 = self;
LABEL_8:

  return v14;
}

- (BMSiriInferredHelpfulnessEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSiriInferredHelpfulnessEvent *v5;
  BMSiriInferredHelpfulnessEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSiriInferredHelpfulnessEvent initWithData:]([BMPBSiriInferredHelpfulnessEvent alloc], "initWithData:", v4);

    self = -[BMSiriInferredHelpfulnessEvent initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAbsoluteTimestamp:", self->_absoluteTimestamp);
  objc_msgSend(v3, "setInferredHelpfulnessScore:", self->_inferredHelpfulnessScore);
  objc_msgSend(v3, "setRestatementScore:", self->_restatementScore);
  objc_msgSend(v3, "setTurnID:", self->_turnID);
  objc_msgSend(v3, "setModelID:", self->_modelID);
  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_turnID, "hash");
  v6 = v5 ^ -[NSString hash](self->_modelID, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BMSiriInferredHelpfulnessEvent *v4;
  BMSiriInferredHelpfulnessEvent *v5;
  BOOL v6;

  v4 = (BMSiriInferredHelpfulnessEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[BMSiriInferredHelpfulnessEvent isEqualToSiriInferredHelpfulnessEvent:](self, "isEqualToSiriInferredHelpfulnessEvent:", v5);

  return v6;
}

- (BOOL)isEqualToSiriInferredHelpfulnessEvent:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  double absoluteTimestamp;
  double v8;
  double inferredHelpfulnessScore;
  double v10;
  double restatementScore;
  double v12;
  NSString *turnID;
  void *v14;
  int v15;
  char v16;
  NSString *modelID;
  NSString *v19;
  void *v20;

  v6 = a3;
  absoluteTimestamp = self->_absoluteTimestamp;
  objc_msgSend(v6, "absoluteTimestamp");
  if (absoluteTimestamp != v8
    || (inferredHelpfulnessScore = self->_inferredHelpfulnessScore,
        objc_msgSend(v6, "inferredHelpfulnessScore"),
        inferredHelpfulnessScore != v10)
    || (restatementScore = self->_restatementScore, objc_msgSend(v6, "restatementScore"), restatementScore != v12))
  {
    v16 = 0;
    goto LABEL_10;
  }
  turnID = self->_turnID;
  v14 = turnID;
  if (!turnID)
  {
    objc_msgSend(v6, "turnID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v15 = 0;
      goto LABEL_13;
    }
    v14 = self->_turnID;
  }
  objc_msgSend(v6, "turnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", v4))
  {
    v16 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v15 = 1;
LABEL_13:
  modelID = self->_modelID;
  v19 = modelID;
  if (!modelID)
  {
    objc_msgSend(v6, "modelID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v16 = 1;
      goto LABEL_22;
    }
    v19 = self->_modelID;
  }
  objc_msgSend(v6, "modelID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NSString isEqualToString:](v19, "isEqualToString:", v20);

  if (modelID)
  {
    if (!v15)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_22:

  if ((v15 & 1) != 0)
    goto LABEL_18;
LABEL_19:
  if (!turnID)

LABEL_10:
  return v16;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (self->_inferredHelpfulnessScore == -1.0 || !self->_turnID)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (double)inferredHelpfulnessScore
{
  return self->_inferredHelpfulnessScore;
}

- (double)restatementScore
{
  return self->_restatementScore;
}

- (NSString)turnID
{
  return self->_turnID;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_turnID, 0);
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
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMSiriInferredHelpfulnessEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMSiriInferredHelpfulnessEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBSiriInferredHelpfulnessEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
