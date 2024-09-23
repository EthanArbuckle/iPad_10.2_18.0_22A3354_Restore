@implementation PHPersonUserFeedbackProperties

- (PHPersonUserFeedbackProperties)initWithFetchDictionary:(id)a3 person:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  PHUserFeedback *v25;
  uint64_t v26;
  uint64_t v27;
  NSOrderedSet *autonamingUserFeedbacks;
  void *v30;
  id v31;
  id v32;
  PHPersonUserFeedbackProperties *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)PHPersonUserFeedbackProperties;
  v33 = -[PHPersonUserFeedbackProperties init](&v39, sel_init);
  if (v33)
  {
    objc_storeWeak((id *)&v33->super._person, v8);
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fetchedResults"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        v31 = v8;
        v32 = v7;
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v9, "count"));
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v30 = v9;
        obj = v9;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v36;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v36 != v13)
                objc_enumerationMutation(obj);
              v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("uuid"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("type"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "integerValue");

              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("feature"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "integerValue");

              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("creationType"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "integerValue");

              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("context"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("lastModifiedDate"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = -[PHUserFeedback initWithUUID:type:feature:creationType:context:lastModifiedDate:]([PHUserFeedback alloc], "initWithUUID:type:feature:creationType:context:lastModifiedDate:", v16, v18, v20, v22, v23, v24);
              if (-[PHUserFeedback feature](v25, "feature") || v33->_userFeedback)
              {
                if (-[PHUserFeedback feature](v25, "feature") == 1 || -[PHUserFeedback feature](v25, "feature") == 2)
                  objc_msgSend(v10, "addObject:", v25);
              }
              else
              {
                objc_storeStrong((id *)&v33->_userFeedback, v25);
              }

              ++v14;
            }
            while (v12 != v14);
            v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
            v12 = v26;
          }
          while (v26);
        }

        if (objc_msgSend(v10, "count"))
        {
          v27 = objc_msgSend(v10, "copy");
          autonamingUserFeedbacks = v33->_autonamingUserFeedbacks;
          v33->_autonamingUserFeedbacks = (NSOrderedSet *)v27;

        }
        v8 = v31;
        v7 = v32;
        v9 = v30;
      }

    }
  }

  return v33;
}

- (PHUserFeedback)userFeedback
{
  return self->_userFeedback;
}

- (NSOrderedSet)autonamingUserFeedbacks
{
  return self->_autonamingUserFeedbacks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autonamingUserFeedbacks, 0);
  objc_storeStrong((id *)&self->_userFeedback, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHPersonPropertySetUserFeedback");
}

+ (id)keyPathFromPrimaryObject
{
  return CFSTR("userFeedbacks");
}

+ (id)keyPathToPrimaryObject
{
  return CFSTR("person");
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
  return (id)propertiesToFetch_pl_once_object_24;
}

void __51__PHPersonUserFeedbackProperties_propertiesToFetch__block_invoke()
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
  v2 = (void *)propertiesToFetch_pl_once_object_24;
  propertiesToFetch_pl_once_object_24 = v1;

}

@end
