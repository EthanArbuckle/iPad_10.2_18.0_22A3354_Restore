@implementation PHMemoryUserFeedbackProperties

- (PHMemoryUserFeedbackProperties)initWithFetchDictionary:(id)a3 memory:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHMemoryUserFeedbackProperties *v9;
  PHMemoryUserFeedbackProperties *v10;
  void *v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  PHUserFeedback *v20;
  PHUserFeedback *userFeedback;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PHMemoryUserFeedbackProperties;
  v9 = -[PHMemoryUserFeedbackProperties init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._memory, v8);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("uuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("feature"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("creationType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("context"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("lastModifiedDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[PHUserFeedback initWithUUID:type:feature:creationType:context:lastModifiedDate:]([PHUserFeedback alloc], "initWithUUID:type:feature:creationType:context:lastModifiedDate:", v11, v13, v15, v17, v18, v19);
      userFeedback = v10->_userFeedback;
      v10->_userFeedback = v20;

    }
  }

  return v10;
}

- (PHUserFeedback)userFeedback
{
  return self->_userFeedback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFeedback, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHMemoryPropertySetUserFeedback");
}

+ (id)keyPathFromPrimaryObject
{
  return CFSTR("userFeedbacks");
}

+ (id)keyPathToPrimaryObject
{
  return CFSTR("memory");
}

+ (BOOL)isToMany
{
  return 1;
}

+ (id)entityName
{
  return CFSTR("UserFeedback");
}

+ (id)propertiesToSortBy
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastModifiedDate"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_28;
}

void __51__PHMemoryUserFeedbackProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("uuid");
  v3[1] = CFSTR("type");
  v3[2] = CFSTR("feature");
  v3[3] = CFSTR("creationType");
  v3[4] = CFSTR("context");
  v3[5] = CFSTR("lastModifiedDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_28;
  propertiesToFetch_pl_once_object_28 = v1;

}

@end
