@implementation ATXFeedbackStateReader

+ (id)stringKeyWithData:(id)a3
{
  id v3;
  ATXFeedbackStateReader *v4;

  v3 = a3;
  v4 = -[ATXFeedbackStateReader initWithData:predictedItemKeyClass:]([ATXFeedbackStateReader alloc], "initWithData:predictedItemKeyClass:", v3, objc_opt_class());

  return v4;
}

+ (id)numberKeyWithData:(id)a3
{
  id v3;
  ATXFeedbackStateReader *v4;

  v3 = a3;
  v4 = -[ATXFeedbackStateReader initWithData:predictedItemKeyClass:]([ATXFeedbackStateReader alloc], "initWithData:predictedItemKeyClass:", v3, objc_opt_class());

  return v4;
}

- (ATXFeedbackStateReader)initWithData:(id)a3 predictedItemKeyClass:(Class)a4
{
  id v7;
  ATXFeedbackStateReader *v8;
  ATXFeedbackStateReader *v9;
  uint64_t v10;
  NSData *data;
  ATXFeedbackStateReader *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *abGroup;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  objc_super v37;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXFeedbackState.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v37.receiver = self;
  v37.super_class = (Class)ATXFeedbackStateReader;
  v8 = -[ATXFeedbackStateReader init](&v37, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_17;
  v8->_predictedItemKeyClass = a4;
  objc_msgSend(MEMORY[0x1E0D81560], "decompress:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  data = v9->_data;
  v9->_data = (NSData *)v10;

  if (-[NSData length](v9->_data, "length") < 0x20)
    goto LABEL_5;
  v13 = -[NSData bytes](v9->_data, "bytes");
  v14 = -[NSData bytes](v9->_data, "bytes");
  if (*(_DWORD *)v13 == 2146895485)
    goto LABEL_15;
  if (*(_DWORD *)v13 != 466107951)
  {
    __atxlog_handle_default();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[ATXFeedbackStateReader initWithData:predictedItemKeyClass:].cold.1(v13, v21, v22, v23, v24, v25, v26, v27);

LABEL_15:
    v20 = 0;
    v9->_predictionCount = 0;
    goto LABEL_16;
  }
  if (*(_DWORD *)(v13 + 20) == 817)
  {
    v15 = *(_DWORD *)(v13 + 16);
    v9->_predictionCount = v15;
    if (v15 < 0)
    {
      __atxlog_handle_default();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[ATXFeedbackStateReader initWithData:predictedItemKeyClass:].cold.2((uint64_t)&v9->_predictionCount, v29, v30, v31, v32, v33, v34, v35);

      goto LABEL_5;
    }
    v16 = v14;
    v9->_assetVersion = *(_QWORD *)(v13 + 8);
    if (-[NSData length](v9->_data, "length") >= *(int *)(v13 + 24) + 32)
    {
      v17 = v16 + 32;
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v17, *(int *)(v13 + 24), 4);
      abGroup = v9->_abGroup;
      v9->_abGroup = (NSString *)v18;

      v20 = (const char *)(v17 + *(int *)(v13 + 24));
LABEL_16:
      v9->_perPredictionDataStart = v20;
LABEL_17:
      v12 = v9;
      goto LABEL_18;
    }
  }
LABEL_5:
  v12 = 0;
LABEL_18:

  return v12;
}

- (void)enumerateApps:(id)a3
{
  void (**v4)(id, unsigned __int8 *, void *, unint64_t *, _BYTE *, unint64_t *, unint64_t *, float);
  NSData *data;
  uint64_t v6;
  NSUInteger v7;
  int v8;
  unint64_t v9;
  void *v10;
  Class predictedItemKeyClass;
  Class v12;
  void *v13;
  uint64_t v14;
  unint64_t *UnsignedInteger;
  unint64_t *Boolean;
  unint64_t *v17;
  int v18;
  unsigned __int8 v19;
  float __dst;
  const char *perPredictionDataStart;
  _BYTE v22[3268];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, unsigned __int8 *, void *, unint64_t *, _BYTE *, unint64_t *, unint64_t *, float))a3;
  data = self->_data;
  perPredictionDataStart = self->_perPredictionDataStart;
  v6 = -[NSData bytes](data, "bytes");
  v7 = -[NSData length](self->_data, "length");
  __dst = 0.0;
  v19 = 0;
  if (self->_predictionCount >= 1)
  {
    v8 = 0;
    v9 = v6 + v7;
    while (1)
    {
      v10 = (void *)MEMORY[0x1A85A4F90]();
      predictedItemKeyClass = self->_predictedItemKeyClass;
      if (predictedItemKeyClass == (Class)objc_opt_class())
        break;
      v12 = self->_predictedItemKeyClass;
      if (v12 == (Class)objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ATXCacheReadInteger((unint64_t *)&perPredictionDataStart, v9));
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v13 = 0;
LABEL_9:
      ATXCacheReadFloats((const void **)&perPredictionDataStart, v9, &__dst, 1);
      ATXCacheReadFloats((const void **)&perPredictionDataStart, v9, v22, 817);
      UnsignedInteger = ATXCacheReadUnsignedInteger((unint64_t *)&perPredictionDataStart, v9);
      Boolean = ATXCacheReadBoolean((unint64_t *)&perPredictionDataStart, v9);
      v17 = ATXCacheReadBoolean((unint64_t *)&perPredictionDataStart, v9);
      if (v13)
        v4[2](v4, &v19, v13, UnsignedInteger, v22, Boolean, v17, __dst);
      v18 = v19;

      objc_autoreleasePoolPop(v10);
      if (!v18 && ++v8 < self->_predictionCount)
        continue;
      goto LABEL_13;
    }
    ATXCacheReadString((unint64_t *)&perPredictionDataStart, v9);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = (void *)v14;
    goto LABEL_9;
  }
LABEL_13:

}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (int64_t)assetVersion
{
  return self->_assetVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abGroup, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)initWithData:(uint64_t)a3 predictedItemKeyClass:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_12(&dword_1A49EF000, a2, a3, "Feedback: Unrecognized magic number: %u", a5, a6, a7, a8, 0);
}

- (void)initWithData:(uint64_t)a3 predictedItemKeyClass:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_12(&dword_1A49EF000, a2, a3, "Feedback: Invalid app count: %i", a5, a6, a7, a8, 0);
}

@end
