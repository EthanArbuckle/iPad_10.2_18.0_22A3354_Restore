@implementation ATXPredictionAmbientLightContext

- (ATXPredictionAmbientLightContext)initWithProto:(id)a3
{
  id v4;
  ATXPredictionAmbientLightContext *v5;
  NSObject *v6;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXPredictionAmbientLightContext initWithProto:].cold.1((uint64_t)self, v6);

    goto LABEL_7;
  }
  self = -[ATXPredictionAmbientLightContext initWithAmbientLightType:](self, "initWithAmbientLightType:", objc_msgSend(v4, "ambientLightType"));
  v5 = self;
LABEL_8:

  return v5;
}

- (ATXPredictionAmbientLightContext)initWithAmbientLightType:(int)a3
{
  ATXPredictionAmbientLightContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXPredictionAmbientLightContext;
  result = -[ATXPredictionAmbientLightContext init](&v5, sel_init);
  if (result)
    result->_ambientLightType = a3;
  return result;
}

- (id)proto
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAmbientLightType:", self->_ambientLightType);
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[ATXPredictionAmbientLightContext jsonDict](self, "jsonDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)jsonDict
{
  uint64_t ambientLightType;
  __CFString *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("ambientLightType");
  ambientLightType = self->_ambientLightType;
  if (ambientLightType >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), ambientLightType, v6);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E82DE2A0[ambientLightType];
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXPredictionAmbientLightContext)initWithProtoData:(id)a3
{
  id v4;
  ATXPBPredictionAmbientLightContext *v5;
  ATXPredictionAmbientLightContext *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBPredictionAmbientLightContext initWithData:]([ATXPBPredictionAmbientLightContext alloc], "initWithData:", v4);

    self = -[ATXPredictionAmbientLightContext initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXPredictionAmbientLightContext proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXPredictionAmbientLightContext *v4;
  ATXPredictionAmbientLightContext *v5;
  BOOL v6;

  v4 = (ATXPredictionAmbientLightContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPredictionAmbientLightContext isEqualToATXPredictionAmbientLightContext:](self, "isEqualToATXPredictionAmbientLightContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXPredictionAmbientLightContext:(id)a3
{
  return self->_ambientLightType == *((_DWORD *)a3 + 2);
}

- (int)ambientLightType
{
  return self->_ambientLightType;
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
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBPredictionAmbientLightContext proto", (uint8_t *)&v5, 0xCu);

}

@end
