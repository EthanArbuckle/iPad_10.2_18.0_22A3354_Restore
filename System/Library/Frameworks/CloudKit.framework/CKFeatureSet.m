@implementation CKFeatureSet

- (CKFeatureSet)initWithFeatures:(id)a3
{
  id v4;
  CKFeatureSet *v5;
  uint64_t v6;
  NSMutableDictionary *featureMap;
  const char *v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKFeatureSet;
  v5 = -[CKFeatureSet init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    featureMap = v5->_featureMap;
    v5->_featureMap = (NSMutableDictionary *)v6;

    objc_msgSend_addFeatures_(v5, v8, (uint64_t)v4, v9);
  }

  return v5;
}

- (void)addFeatures:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *featureMap;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  NSMutableDictionary *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        featureMap = self->_featureMap;
        objc_msgSend_name(v13, v7, v8, v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(featureMap, v16, (uint64_t)v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          v18 = (void *)objc_opt_new();
        objc_msgSend_value(v13, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v18, v23, (uint64_t)v13, (uint64_t)v22);

        v24 = self->_featureMap;
        objc_msgSend_name(v13, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v24, v29, (uint64_t)v18, (uint64_t)v28);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v10);
  }

}

- (NSArray)features
{
  CKFeatureSet *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  void *v25;
  id v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSArray *features;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[2];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_features)
  {
    v3 = (void *)objc_opt_new();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend_allValues(v2->_featureMap, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v40, (uint64_t)v46, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v41;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v14);
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          objc_msgSend_allValues(v15, v9, v10, v11, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v36, (uint64_t)v45, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v37;
            do
            {
              v22 = 0;
              do
              {
                if (*(_QWORD *)v37 != v21)
                  objc_enumerationMutation(v16);
                objc_msgSend_addObject_(v3, v18, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v22++), v19);
              }
              while (v20 != v22);
              v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v36, (uint64_t)v45, 16);
            }
            while (v20);
          }

          ++v14;
        }
        while (v14 != v12);
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v40, (uint64_t)v46, 16);
      }
      while (v12);
    }

    v23 = objc_alloc(MEMORY[0x1E0CB3928]);
    v25 = (void *)objc_msgSend_initWithKey_ascending_(v23, v24, (uint64_t)CFSTR("name"), 1);
    v26 = objc_alloc(MEMORY[0x1E0CB3928]);
    v28 = (void *)objc_msgSend_initWithKey_ascending_(v26, v27, (uint64_t)CFSTR("value"), 1);
    v44[0] = v25;
    v44[1] = v28;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v29, (uint64_t)v44, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingDescriptors_(v3, v31, (uint64_t)v30, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    features = v2->_features;
    v2->_features = (NSArray *)v33;

  }
  objc_sync_exit(v2);

  return v2->_features;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  id v11;

  v11 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_features(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_features);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v11, v10, (uint64_t)v8, (uint64_t)v9);

  objc_autoreleasePoolPop(v4);
}

- (CKFeatureSet)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKFeatureSet;
  v5 = -[CKFeatureSet init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v12, v7, v13, v8, v9, v10, v11, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_features);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v17;

    v19 = objc_opt_new();
    v20 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v19;

    objc_msgSend_addFeatures_(v5, v21, *((_QWORD *)v5 + 1), v22);
  }

  return (CKFeatureSet *)v5;
}

- (id)valuesForName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  objc_msgSend_featureMap(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_allKeys(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = (void *)MEMORY[0x1E0C9AA60];
  v17 = v15;

  return v17;
}

- (BOOL)hasValue:(id)a3 forName:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend_featureMap(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_valueForKey_(v14, v15, (uint64_t)v7, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17 != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
  {
    objc_msgSend_features(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_features(v4, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v11, v16, (uint64_t)v15, v17);

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_features(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKFeatureSet;
  -[CKFeatureSet description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_features(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v12, (uint64_t)CFSTR(": %@"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSMutableDictionary)featureMap
{
  return self->_featureMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureMap, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

@end
