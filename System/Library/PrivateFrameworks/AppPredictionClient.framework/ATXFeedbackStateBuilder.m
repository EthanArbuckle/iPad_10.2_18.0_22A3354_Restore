@implementation ATXFeedbackStateBuilder

- (ATXFeedbackStateBuilder)initWithABGroup:(id)a3 assetVersion:(int64_t)a4
{
  id v7;
  ATXFeedbackStateBuilder *v8;
  const char *v9;
  int v10;
  uint64_t v11;
  NSMutableData *data;
  uint64_t v13;
  void *v15;
  objc_super v16;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXFeedbackState.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("abGroup"));

  }
  v16.receiver = self;
  v16.super_class = (Class)ATXFeedbackStateBuilder;
  v8 = -[ATXFeedbackStateBuilder init](&v16, sel_init);
  if (v8)
  {
    v9 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    v10 = strlen(v9);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v10 + 32);
    data = v8->_data;
    v8->_data = (NSMutableData *)v11;

    v13 = -[NSMutableData mutableBytes](v8->_data, "mutableBytes");
    *(_QWORD *)v13 = 466107951;
    *(_QWORD *)(v13 + 8) = a4;
    *(_QWORD *)(v13 + 16) = 0x33100000000;
    *(_DWORD *)(v13 + 24) = v10;
    *(_DWORD *)(v13 + 28) = 0;
    memcpy(-[NSMutableData mutableBytes](v8->_data, "mutableBytes") + 32, v9, v10);
    v8->_finished = 0;
  }

  return v8;
}

- (void)recordPrediction:(id)a3 actionHash:(unint64_t)a4 totalScore:(float)a5 scoreInputs:(const float *)a6 isMediumConfidenceForBlendingLayer:(BOOL)a7 isHighConfidenceForBlendingLayer:(BOOL)a8
{
  id v15;
  void *v16;
  void *v17;
  float v18;

  v15 = a3;
  v18 = a5;
  if (self->_finished)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXFeedbackState.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_finished"));

    if (a6)
      goto LABEL_3;
  }
  else if (a6)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXFeedbackState.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scoreInputs"));

LABEL_3:
  ++self->_predictionCount;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    ATXCacheAppendString(self->_data, v15);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[ATXFeedbackStateBuilder recordPrediction:actionHash:totalScore:scoreInputs:isMediumConfidenceForBlendingLayer:isHighConfidenceForBlendingLayer:].cold.1((uint64_t)a2, (uint64_t)self);
    ATXCacheAppendInteger(self->_data, objc_msgSend(v15, "integerValue"));
  }
  ATXCacheAppendFloats(self->_data, (const char *)&v18, 1);
  ATXCacheAppendFloats(self->_data, (const char *)a6, 817);
  ATXCacheAppendUnsignedInteger(self->_data, a4);
  ATXCacheAppendBoolean(self->_data, a7);
  ATXCacheAppendBoolean(self->_data, a8);

}

- (id)finish
{
  int predictionCount;
  void *v4;
  NSMutableData *data;
  void *v8;

  if (self->_finished)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXFeedbackState.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_finished"));

  }
  self->_finished = 1;
  predictionCount = self->_predictionCount;
  *(_DWORD *)(-[NSMutableData mutableBytes](self->_data, "mutableBytes") + 16) = predictionCount;
  objc_msgSend(MEMORY[0x1E0D81560], "fastCompress:", self->_data);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)recordPrediction:(uint64_t)a1 actionHash:(uint64_t)a2 totalScore:scoreInputs:isMediumConfidenceForBlendingLayer:isHighConfidenceForBlendingLayer:.cold.1(uint64_t a1, uint64_t a2)
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1, a2, CFSTR("ATXFeedbackState.m"), 83, CFSTR("ATXFeedbackStateBuilder only supports NSNumber and NSString"));

  __break(1u);
}

@end
