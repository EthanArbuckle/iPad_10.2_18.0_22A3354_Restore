@implementation ATXPredictionSetReader

- (ATXPredictionSetReader)initWithData:(id)a3 predictedItemClass:(Class)a4
{
  id v7;
  ATXPredictionSetReader *v8;
  uint64_t v9;
  NSData *data;
  ATXPredictionSetReader *v11;
  int *v12;
  uint64_t v13;
  int v14;
  int v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  objc_super v34;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXPredictionSet.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v34.receiver = self;
  v34.super_class = (Class)ATXPredictionSetReader;
  v8 = -[ATXPredictionSetReader init](&v34, sel_init);
  if (!v8)
    goto LABEL_21;
  objc_msgSend(MEMORY[0x1E0D81560], "decompress:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  data = v8->_data;
  v8->_data = (NSData *)v9;

  if (-[NSData length](v8->_data, "length") >= 8)
  {
    v8->_predictedItemClass = a4;
    v12 = -[NSData bytes](v8->_data, "bytes");
    v13 = (uint64_t)v12;
    v14 = *v12;
    if (*v12 > -362938750)
    {
      if (v14 != -362938749)
      {
        if (v14 == -218895609)
        {
          v16 = v12[1];
          v8->_predictionCount = v16;
          if (v16 < 0)
          {
            __atxlog_handle_default();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              -[ATXPredictionSetReader initWithData:predictedItemClass:].cold.2((uint64_t)&v8->_predictionCount, v26, v27, v28, v29, v30, v31, v32);

            goto LABEL_5;
          }
          v17 = (const char *)(v12 + 2);
          goto LABEL_20;
        }
        goto LABEL_16;
      }
    }
    else if (v14 != -1813681383 && v14 != -1789354849)
    {
LABEL_16:
      __atxlog_handle_default();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXPredictionSetReader initWithData:predictedItemClass:].cold.1(v13, v18, v19, v20, v21, v22, v23, v24);

    }
    v17 = 0;
    v8->_predictionCount = 0;
LABEL_20:
    v8->_perPredictionDataStart = v17;
LABEL_21:
    v11 = v8;
    goto LABEL_22;
  }
LABEL_5:
  v11 = 0;
LABEL_22:

  return v11;
}

+ (id)bundleIdReader:(id)a3
{
  id v3;
  ATXPredictionSetReader *v4;

  v3 = a3;
  v4 = -[ATXPredictionSetReader initWithData:predictedItemClass:]([ATXPredictionSetReader alloc], "initWithData:predictedItemClass:", v3, objc_opt_class());

  return v4;
}

+ (id)actionReader:(id)a3
{
  id v3;
  ATXPredictionSetReader *v4;

  v3 = a3;
  v4 = -[ATXPredictionSetReader initWithData:predictedItemClass:]([ATXPredictionSetReader alloc], "initWithData:predictedItemClass:", v3, objc_opt_class());

  return v4;
}

- (id)_scoredPredictionFromData:(id)a3 score:(float)a4
{
  id v6;
  Class predictedItemClass;
  void *v8;
  Class v9;
  uint64_t v10;
  NSObject *v11;
  ATXScoredPrediction *v12;
  double v13;
  ATXScoredPrediction *v14;
  NSObject *v15;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  predictedItemClass = self->_predictedItemClass;
  if (predictedItemClass == (Class)objc_opt_class())
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
    if (v11)
      goto LABEL_5;
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXPredictionSetReader _scoredPredictionFromData:score:].cold.1((uint64_t)self, (uint64_t)v6, v11);
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v8 = (void *)MEMORY[0x1A85A4F90]();
  v9 = self->_predictedItemClass;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", v9, v6, &v20);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v20;
  objc_autoreleasePoolPop(v8);
  if (!v10)
  {
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(self->_predictedItemClass);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v11;
      _os_log_fault_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_FAULT, "%@ - error unarchiving action with predictedItemClass: %@, err: %@", buf, 0x20u);

    }
    goto LABEL_11;
  }

  v11 = v10;
LABEL_5:
  v12 = [ATXScoredPrediction alloc];
  *(float *)&v13 = a4;
  v14 = -[ATXScoredPrediction initWithPredictedItem:score:](v12, "initWithPredictedItem:score:", v11, v13);
LABEL_12:

  return v14;
}

- (id)readScoredPredictionsWithLimit:(int)a3
{
  return -[ATXPredictionSetReader readScoredPredictionsWithLimit:filterPredicate:](self, "readScoredPredictionsWithLimit:filterPredicate:", *(_QWORD *)&a3, 0);
}

- (id)readScoredPredictionsWithLimit:(int)a3 filterPredicate:(id)a4
{
  id v6;
  const void *v7;
  NSUInteger v8;
  int predictionCount;
  unint64_t v10;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  int __dst;
  const char *perPredictionDataStart;

  v6 = a4;
  perPredictionDataStart = self->_perPredictionDataStart;
  v7 = -[NSData bytes](self->_data, "bytes");
  v8 = -[NSData length](self->_data, "length");
  if (self->_predictionCount >= a3)
    predictionCount = a3;
  else
    predictionCount = self->_predictionCount;
  v10 = predictionCount & ~(predictionCount >> 31);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  if (predictionCount >= 1 && self->_predictionCount >= 1)
  {
    v12 = 0;
    v13 = (unint64_t)v7 + v8;
    while (1)
    {
      v14 = (void *)MEMORY[0x1A85A4F90]();
      ATXCacheReadData((unint64_t *)&perPredictionDataStart, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      __dst = 0;
      ATXCacheReadFloats((const void **)&perPredictionDataStart, v13, &__dst, 1);
      LODWORD(v16) = __dst;
      -[ATXPredictionSetReader _scoredPredictionFromData:score:](self, "_scoredPredictionFromData:score:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        if (!v6 || objc_msgSend(v6, "evaluateWithObject:", v17))
        {
          objc_msgSend(v11, "addObject:", v17);
          if (objc_msgSend(v11, "count") >= v10)
            break;
        }
      }

      objc_autoreleasePoolPop(v14);
      if (++v12 >= self->_predictionCount)
        goto LABEL_14;
    }

    objc_autoreleasePoolPop(v14);
  }
LABEL_14:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)initWithData:(uint64_t)a3 predictedItemClass:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_12(&dword_1A49EF000, a2, a3, "Unrecognized magic number: %u", a5, a6, a7, a8, 0);
}

- (void)initWithData:(uint64_t)a3 predictedItemClass:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_12(&dword_1A49EF000, a2, a3, "Invalid prediction count: %i", a5, a6, a7, a8, 0);
}

- (void)_scoredPredictionFromData:(NSObject *)a3 score:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_fault_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_FAULT, "%@ - error decoding app UTF-8 data: %@", (uint8_t *)&v7, 0x16u);

}

@end
