@implementation CHAppLaunchSensorData

- (CHAppLaunchSensorData)initWithBundleId:(id)a3 embeddingVector:(id)a4 modelVersion:(id)a5 algorithmType:(id)a6 trainingDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CHAppLaunchSensorData *v17;
  CHAppLaunchSensorData *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CHAppLaunchSensorData;
  v17 = -[CHAppLaunchSensorData init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleId, a3);
    objc_storeStrong((id *)&v18->_embeddingVector, a4);
    objc_storeStrong((id *)&v18->_modelVersion, a5);
    objc_storeStrong((id *)&v18->_algorithmType, a6);
    objc_storeStrong((id *)&v18->_trainingDate, a7);
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleId;
  id v5;

  bundleId = self->_bundleId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_embeddingVector, CFSTR("embeddingVector"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelVersion, CFSTR("modelVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_algorithmType, CFSTR("algorithmType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trainingDate, CFSTR("trainingDate"));

}

- (CHAppLaunchSensorData)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CHAppLaunchSensorData *v19;
  void *v21;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BE7A630];
  v7 = objc_opt_class();
  v8 = MEMORY[0x24BDACB70];
  objc_msgSend(v6, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v7, CFSTR("bundleId"), v5, 1, CFSTR("CHErrorDomain"), 1, MEMORY[0x24BDACB70]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHAppLaunchSensorData.m"), 63, CFSTR("bundleId can't be nil."));

  }
  v10 = (void *)MEMORY[0x24BE7A630];
  v11 = (void *)MEMORY[0x23B830284]();
  v12 = objc_alloc(MEMORY[0x24BDBCF20]);
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v10, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("embeddingVector"), v5, 0, CFSTR("CHErrorDomain"), 1, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7A630], "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("modelVersion"), v5, 0, CFSTR("CHErrorDomain"), 1, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7A630], "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("algorithmType"), v5, 0, CFSTR("CHErrorDomain"), 1, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7A630], "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("trainingDate"), v5, 0, CFSTR("CHErrorDomain"), 1, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[CHAppLaunchSensorData initWithBundleId:embeddingVector:modelVersion:algorithmType:trainingDate:]([CHAppLaunchSensorData alloc], "initWithBundleId:embeddingVector:modelVersion:algorithmType:trainingDate:", v9, v15, v16, v17, v18);

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *modelVersion;
  NSString *algorithmType;
  void *v7;
  void *v8;
  __int128 v10;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDateFormat:", CFSTR("MM-dd-yyyy HH:mm"));
  v4 = (void *)MEMORY[0x24BDD17C8];
  v10 = *(_OWORD *)&self->_bundleId;
  modelVersion = self->_modelVersion;
  algorithmType = self->_algorithmType;
  objc_msgSend(v3, "stringFromDate:", self->_trainingDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<CHAppLaunchSensorData for bundleId: %@\nEmbeddingVector: %@\nModel version: %@ | algo: %@ | trainingDate: %@"), v10, modelVersion, algorithmType, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSArray)embeddingVector
{
  return self->_embeddingVector;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSString)algorithmType
{
  return self->_algorithmType;
}

- (NSDate)trainingDate
{
  return self->_trainingDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingDate, 0);
  objc_storeStrong((id *)&self->_algorithmType, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_embeddingVector, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
