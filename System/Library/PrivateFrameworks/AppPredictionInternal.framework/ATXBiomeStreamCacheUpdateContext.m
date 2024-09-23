@implementation ATXBiomeStreamCacheUpdateContext

- (ATXBiomeStreamCacheUpdateContext)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXBiomeStreamCacheUpdateContext *v7;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[ATXBiomeStreamCacheUpdateContext initWithCurrentClientModelCacheCreationDates:previousClientModelCacheAges:currentBlendingModelCacheCreationDates:previousBlendingModelCacheAges:](self, "initWithCurrentClientModelCacheCreationDates:previousClientModelCacheAges:currentBlendingModelCacheCreationDates:previousBlendingModelCacheAges:", v3, v4, v5, v6);

  return v7;
}

- (ATXBiomeStreamCacheUpdateContext)initWithCurrentClientModelCacheCreationDates:(id)a3 previousClientModelCacheAges:(id)a4 currentBlendingModelCacheCreationDates:(id)a5 previousBlendingModelCacheAges:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXBiomeStreamCacheUpdateContext *v15;
  ATXBiomeStreamCacheUpdateContext *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXBiomeStreamCacheUpdateContext;
  v15 = -[ATXBiomeStreamCacheUpdateContext init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_currentClientModelCacheCreationDatesByClientModelId, a3);
    objc_storeStrong((id *)&v16->_previousClientModelCacheAgesByClientModelId, a4);
    objc_storeStrong((id *)&v16->_currentBlendingModelCacheCreationDatesByConsumerSubType, a5);
    objc_storeStrong((id *)&v16->_previousBlendingModelCacheAgesByConsumerSubType, a6);
  }

  return v16;
}

- (id)cacheAgeForPreviousClientModelCacheWithClientModelId:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary valueForKey:](self->_previousClientModelCacheAgesByClientModelId, "valueForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cacheAgeForPreviousBlendingUICacheUpdateForConsumerSubType:(unsigned __int8)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary valueForKey:](self->_previousBlendingModelCacheAgesByConsumerSubType, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateWithClientModelCacheUpdate:(id)a3
{
  void *v4;
  NSMutableDictionary *currentClientModelCacheCreationDatesByClientModelId;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *previousClientModelCacheAgesByClientModelId;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "clientModelId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  currentClientModelCacheCreationDatesByClientModelId = self->_currentClientModelCacheCreationDatesByClientModelId;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](currentClientModelCacheCreationDatesByClientModelId, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cacheCreationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v7, "timeIntervalSinceDate:", v6);
      previousClientModelCacheAgesByClientModelId = self->_previousClientModelCacheAgesByClientModelId;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setValue:forKey:](previousClientModelCacheAgesByClientModelId, "setValue:forKey:", v10, v4);

    }
    -[NSMutableDictionary setValue:forKey:](self->_currentClientModelCacheCreationDatesByClientModelId, "setValue:forKey:", v8, v4);

  }
  else
  {
    -[NSMutableDictionary removeAllObjects](currentClientModelCacheCreationDatesByClientModelId, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_previousClientModelCacheAgesByClientModelId, "removeAllObjects");
  }

}

- (void)updateWithBlendingUICacheUpdate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *previousBlendingModelCacheAgesByConsumerSubType;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CF9508];
  v5 = a3;
  objc_msgSend(v4, "stringForConsumerSubtype:", objc_msgSend(v5, "consumerSubType"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_currentBlendingModelCacheCreationDatesByConsumerSubType, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cacheCreationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    previousBlendingModelCacheAgesByConsumerSubType = self->_previousBlendingModelCacheAgesByConsumerSubType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](previousBlendingModelCacheAgesByConsumerSubType, "setValue:forKey:", v9, v10);

  }
  -[NSMutableDictionary setValue:forKey:](self->_currentBlendingModelCacheCreationDatesByConsumerSubType, "setValue:forKey:", v7, v10);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *currentClientModelCacheCreationDatesByClientModelId;
  id v5;

  currentClientModelCacheCreationDatesByClientModelId = self->_currentClientModelCacheCreationDatesByClientModelId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", currentClientModelCacheCreationDatesByClientModelId, CFSTR("codingKeyForClientModelCacheCreationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousClientModelCacheAgesByClientModelId, CFSTR("codingKeyForPreviousClientModelCacheAge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBlendingModelCacheCreationDatesByConsumerSubType, CFSTR("codingKeyForBlendingModelCacheCreationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousBlendingModelCacheAgesByConsumerSubType, CFSTR("codingKeyForPreviousBlendingModelCacheAge"));

}

- (ATXBiomeStreamCacheUpdateContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ATXBiomeStreamCacheUpdateContext *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("codingKeyForClientModelCacheCreationDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXBiomeStreamCacheUpdateContext checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v10, CFSTR("codingKeyForClientModelCacheCreationDate"), v4, CFSTR("com.apple.duetexpertd.ATXBiomeStreamCacheUpdateContext"), -1))
  {
    v11 = 0;
  }
  else
  {
    v12 = (void *)MEMORY[0x1CAA48B6C]();
    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = (void *)objc_msgSend(v13, "initWithObjects:", v14, v15, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("codingKeyForPreviousClientModelCacheAge"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXBiomeStreamCacheUpdateContext checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v17, CFSTR("codingKeyForPreviousClientModelCacheAge"), v4, CFSTR("com.apple.duetexpertd.ATXBiomeStreamCacheUpdateContext"), -1))
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("codingKeyForBlendingModelCacheCreationDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ATXBiomeStreamCacheUpdateContext checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v18, CFSTR("codingKeyForBlendingModelCacheCreationDate"), v4, CFSTR("com.apple.duetexpertd.ATXBiomeStreamCacheUpdateContext"), -1))
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("codingKeyForPreviousBlendingModelCacheAge"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[ATXBiomeStreamCacheUpdateContext checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v19, CFSTR("codingKeyForPreviousBlendingModelCacheAge"), v4, CFSTR("com.apple.duetexpertd.ATXBiomeStreamCacheUpdateContext"), -1))
        {
          v11 = 0;
        }
        else
        {
          self = -[ATXBiomeStreamCacheUpdateContext initWithCurrentClientModelCacheCreationDates:previousClientModelCacheAges:currentBlendingModelCacheCreationDates:previousBlendingModelCacheAges:](self, "initWithCurrentClientModelCacheCreationDates:previousClientModelCacheAges:currentBlendingModelCacheCreationDates:previousBlendingModelCacheAges:", v10, v17, v18, v19);
          v11 = self;
        }

      }
    }

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  ATXBiomeStreamCacheUpdateContext *v4;
  ATXBiomeStreamCacheUpdateContext *v5;
  BOOL v6;

  v4 = (ATXBiomeStreamCacheUpdateContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXBiomeStreamCacheUpdateContext isEqualToATXBiomeStreamCacheUpdateContext:](self, "isEqualToATXBiomeStreamCacheUpdateContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXBiomeStreamCacheUpdateContext:(id)a3
{
  id *v4;
  NSMutableDictionary *currentClientModelCacheCreationDatesByClientModelId;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  char v9;
  NSMutableDictionary *previousClientModelCacheAgesByClientModelId;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  char v14;
  NSMutableDictionary *currentBlendingModelCacheCreationDatesByConsumerSubType;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  char v19;
  char v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;

  v4 = (id *)a3;
  currentClientModelCacheCreationDatesByClientModelId = self->_currentClientModelCacheCreationDatesByClientModelId;
  v6 = (NSMutableDictionary *)v4[1];
  if (currentClientModelCacheCreationDatesByClientModelId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = currentClientModelCacheCreationDatesByClientModelId;
    v9 = -[NSMutableDictionary isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_11;
  }
  previousClientModelCacheAgesByClientModelId = self->_previousClientModelCacheAgesByClientModelId;
  v11 = (NSMutableDictionary *)v4[2];
  if (previousClientModelCacheAgesByClientModelId == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = previousClientModelCacheAgesByClientModelId;
    v14 = -[NSMutableDictionary isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_11;
  }
  currentBlendingModelCacheCreationDatesByConsumerSubType = self->_currentBlendingModelCacheCreationDatesByConsumerSubType;
  v16 = (NSMutableDictionary *)v4[3];
  if (currentBlendingModelCacheCreationDatesByConsumerSubType == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = currentBlendingModelCacheCreationDatesByConsumerSubType;
    v19 = -[NSMutableDictionary isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
    {
LABEL_11:
      v20 = 0;
      goto LABEL_17;
    }
  }
  v21 = self->_previousBlendingModelCacheAgesByConsumerSubType;
  v22 = v21;
  if (v21 == v4[4])
    v20 = 1;
  else
    v20 = -[NSMutableDictionary isEqual:](v21, "isEqual:");

LABEL_17:
  return v20;
}

- (unint64_t)hash
{
  int64_t v2;
  char *v3;

  v2 = (char *)self->_previousClientModelCacheAgesByClientModelId
     - (char *)self->_currentClientModelCacheCreationDatesByClientModelId
     + 32 * (uint64_t)self->_currentClientModelCacheCreationDatesByClientModelId;
  v3 = (char *)&self->_currentBlendingModelCacheCreationDatesByConsumerSubType[4 * v2] - v2;
  return (char *)self->_previousBlendingModelCacheAgesByConsumerSubType - v3 + 32 * (_QWORD)v3;
}

- (NSMutableDictionary)currentClientModelCacheCreationDatesByClientModelId
{
  return self->_currentClientModelCacheCreationDatesByClientModelId;
}

- (void)setCurrentClientModelCacheCreationDatesByClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_currentClientModelCacheCreationDatesByClientModelId, a3);
}

- (NSMutableDictionary)previousClientModelCacheAgesByClientModelId
{
  return self->_previousClientModelCacheAgesByClientModelId;
}

- (void)setPreviousClientModelCacheAgesByClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_previousClientModelCacheAgesByClientModelId, a3);
}

- (NSMutableDictionary)currentBlendingModelCacheCreationDatesByConsumerSubType
{
  return self->_currentBlendingModelCacheCreationDatesByConsumerSubType;
}

- (void)setCurrentBlendingModelCacheCreationDatesByConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_currentBlendingModelCacheCreationDatesByConsumerSubType, a3);
}

- (NSMutableDictionary)previousBlendingModelCacheAgesByConsumerSubType
{
  return self->_previousBlendingModelCacheAgesByConsumerSubType;
}

- (void)setPreviousBlendingModelCacheAgesByConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_previousBlendingModelCacheAgesByConsumerSubType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousBlendingModelCacheAgesByConsumerSubType, 0);
  objc_storeStrong((id *)&self->_currentBlendingModelCacheCreationDatesByConsumerSubType, 0);
  objc_storeStrong((id *)&self->_previousClientModelCacheAgesByClientModelId, 0);
  objc_storeStrong((id *)&self->_currentClientModelCacheCreationDatesByClientModelId, 0);
}

@end
