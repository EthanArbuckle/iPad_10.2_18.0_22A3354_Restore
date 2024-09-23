@implementation IDSServerStorageStateMachineCompletedMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSServerStorageStateMachineCompleted");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  const char *v37;
  double v38;
  void *v39;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_service(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("service"), v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend_linkType(self, v9, v10, v11);
  objc_msgSend_numberWithInteger_(v8, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("linkType"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend_wasPrimary(self, v17, v18, v19);
  objc_msgSend_numberWithBool_(v16, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("wasPrimary"), v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timeTaken(self, v25, v26, v27);
  objc_msgSend_numberWithDouble_(v24, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v3, CFSTR("timeTaken"), v31);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  v36 = objc_msgSend_numberProcessed(self, v33, v34, v35);
  objc_msgSend_numberWithInteger_(v32, v37, v36, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("numberProcessed"), v39);

  return (NSDictionary *)v3;
}

- (IDSServerStorageStateMachineCompletedMetric)initWithService:(id)a3 linkType:(int64_t)a4 wasPrimary:(BOOL)a5 timeTaken:(double)a6 numberProcessed:(int64_t)a7
{
  id v13;
  IDSServerStorageStateMachineCompletedMetric *v14;
  IDSServerStorageStateMachineCompletedMetric *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSServerStorageStateMachineCompletedMetric;
  v14 = -[IDSServerStorageStateMachineCompletedMetric init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_service, a3);
    v15->_linkType = a4;
    v15->_wasPrimary = a5;
    v15->_timeTaken = a6;
    v15->_numberProcessed = a7;
  }

  return v15;
}

- (NSString)service
{
  return self->_service;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (BOOL)wasPrimary
{
  return self->_wasPrimary;
}

- (double)timeTaken
{
  return self->_timeTaken;
}

- (int64_t)numberProcessed
{
  return self->_numberProcessed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
