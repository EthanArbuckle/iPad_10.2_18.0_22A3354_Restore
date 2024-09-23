@implementation ATXPredictionSetBuilder

- (ATXPredictionSetBuilder)init
{
  ATXPredictionSetBuilder *v2;
  uint64_t v3;
  NSMutableData *data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXPredictionSetBuilder;
  v2 = -[ATXPredictionSetBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 8);
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;

    *(_QWORD *)-[NSMutableData mutableBytes](v2->_data, "mutableBytes") = 4076071687;
    v2->_finished = 0;
  }
  return v2;
}

- (void)recordPrediction:(id)a3 score:(float)a4
{
  id v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  float v15;

  v7 = a3;
  v15 = a4;
  if (self->_finished)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXPredictionSet.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_finished"));

  }
  ++self->_predictionCount;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = (void *)MEMORY[0x1A85A4F90]();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXPredictionSet.m"), 62, CFSTR("Archiving error: %@"), v11);

    }
  }
  objc_autoreleasePoolPop(v9);
  ATXCacheAppendData(self->_data, v10);
  ATXCacheAppendFloats(self->_data, (const char *)&v15, 1);

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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXPredictionSet.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_finished"));

  }
  self->_finished = 1;
  predictionCount = self->_predictionCount;
  *(_DWORD *)(-[NSMutableData mutableBytes](self->_data, "mutableBytes") + 4) = predictionCount;
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

@end
