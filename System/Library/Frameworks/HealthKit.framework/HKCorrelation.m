@implementation HKCorrelation

+ (HKCorrelation)correlationWithType:(HKCorrelationType *)correlationType startDate:(NSDate *)startDate endDate:(NSDate *)endDate objects:(NSSet *)objects
{
  return (HKCorrelation *)objc_msgSend(a1, "correlationWithType:startDate:endDate:objects:device:metadata:", correlationType, startDate, endDate, objects, 0, 0);
}

+ (HKCorrelation)correlationWithType:(HKCorrelationType *)correlationType startDate:(NSDate *)startDate endDate:(NSDate *)endDate objects:(NSSet *)objects metadata:(NSDictionary *)metadata
{
  return (HKCorrelation *)objc_msgSend(a1, "correlationWithType:startDate:endDate:objects:device:metadata:", correlationType, startDate, endDate, objects, 0, metadata);
}

+ (HKCorrelation)correlationWithType:(HKCorrelationType *)correlationType startDate:(NSDate *)startDate endDate:(NSDate *)endDate objects:(NSSet *)objects device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  HKCorrelationType *v14;
  NSDate *v15;
  NSDate *v16;
  NSSet *v17;
  HKDevice *v18;
  NSDictionary *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSSet *v24;
  void *v25;
  _QWORD v27[4];
  NSSet *v28;

  v14 = correlationType;
  v15 = startDate;
  v16 = endDate;
  v17 = objects;
  v18 = device;
  v19 = metadata;
  if (!v15)
  {
    v21 = 2.22507386e-308;
    if (v16)
      goto LABEL_3;
LABEL_5:
    v23 = 2.22507386e-308;
    goto LABEL_6;
  }
  -[NSDate timeIntervalSinceReferenceDate](v15, "timeIntervalSinceReferenceDate");
  v21 = v20;
  if (!v16)
    goto LABEL_5;
LABEL_3:
  -[NSDate timeIntervalSinceReferenceDate](v16, "timeIntervalSinceReferenceDate");
  v23 = v22;
LABEL_6:
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __79__HKCorrelation_correlationWithType_startDate_endDate_objects_device_metadata___block_invoke;
  v27[3] = &unk_1E37F6308;
  v28 = v17;
  v24 = v17;
  v25 = (void *)objc_msgSend(a1, "_newSampleWithType:startDate:endDate:device:metadata:config:", v14, v18, v19, v27, v21, v23);

  return (HKCorrelation *)v25;
}

uint64_t __79__HKCorrelation_correlationWithType_startDate_endDate_objects_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_addCorrelatedObjects:", *(_QWORD *)(a1 + 32));
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKCorrelation;
  v2 = -[HKSample _init](&v6, sel__init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[12];
    v2[12] = v3;

  }
  return v2;
}

- (NSSet)objects
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_objects, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "unionSet:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v9.receiver = self;
  v9.super_class = (Class)HKCorrelation;
  -[HKSample description](&v9, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCorrelation objects](self, "objects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@> %@ (%ld objects)"), v4, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_addCorrelatedObject:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objects, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_objects, "setObject:forKeyedSubscript:", v5, v4);
  }
  objc_msgSend(v5, "addObject:", v6);

}

- (void)_addCorrelatedObjects:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[HKCorrelation _addCorrelatedObject:](self, "_addCorrelatedObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSSet)objectsForType:(HKObjectType *)objectType
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_objects, "objectForKeyedSubscript:", objectType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)_filterCorrelatedObjectsWithFilterDictionary:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *objects;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  NSMutableDictionary *v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objects = self->_objects;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__HKCorrelation__filterCorrelatedObjectsWithFilterDictionary___block_invoke;
  v11[3] = &unk_1E37F6330;
  v12 = v4;
  v7 = v5;
  v13 = v7;
  v10 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objects, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = self->_objects;
  self->_objects = v7;
  v9 = v7;

}

void __62__HKCorrelation__filterCorrelatedObjectsWithFilterDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (+[_HKFilter filter:acceptsDataObject:](_HKFilter, "filter:acceptsDataObject:", v8, v14, (_QWORD)v15))
        {
          objc_msgSend(v7, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v7, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v5);

}

- (BOOL)_correlatedObjectsMatchFilterDictionary:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSMutableDictionary *objects;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = 1;
    if (objc_msgSend(v4, "count"))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 1;
      objects = self->_objects;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __57__HKCorrelation__correlatedObjectsMatchFilterDictionary___block_invoke;
      v9[3] = &unk_1E37F6358;
      v10 = v5;
      v11 = &v12;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objects, "enumerateKeysAndObjectsUsingBlock:", v9);
      v6 = *((_BYTE *)v13 + 24) != 0;

      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

void __57__HKCorrelation__correlatedObjectsMatchFilterDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        if (!+[_HKFilter filter:acceptsDataObject:](_HKFilter, "filter:acceptsDataObject:", v8, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)_containsObjects
{
  NSMutableDictionary *objects;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  objects = self->_objects;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__HKCorrelation__containsObjects__block_invoke;
  v5[3] = &unk_1E37F6380;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objects, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__HKCorrelation__containsObjects__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_removeAllCorrelatedObjects
{
  NSMutableDictionary *v3;
  NSMutableDictionary *objects;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  objects = self->_objects;
  self->_objects = v3;

}

- (id)_allTypes
{
  return (id)-[NSMutableDictionary allKeys](self->_objects, "allKeys");
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  HKCorrelation *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t i;
  HKCorrelation *v19;
  void *v20;
  unint64_t v21;
  const char *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  uint64_t v41;
  uint64_t v43;
  id obj;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v4 = self;
  v54 = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)HKCorrelation;
  -[HKSample _validateWithConfiguration:](&v52, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCorrelation correlationType](v4, "correlationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v8 = 0x1E0CB3000uLL;
  if ((isKindOfClass & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    -[HKCorrelation correlationType](v4, "correlationType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, CFSTR("Data type %@ must be of type %@"), v11, objc_opt_class());
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }
  if ((objc_msgSend((id)objc_opt_class(), "_allowEmptyCorrelations") & 1) == 0
    && !-[HKCorrelation _containsObjects](v4, "_containsObjects"))
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = objc_opt_class();
    objc_msgSend(v13, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v14, a2, CFSTR("%@: Objects must contain one or more HKSample"), objc_opt_class());
    v15 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v15;
  }
  -[HKCorrelation objects](v4, "objects");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v47)
  {
    v16 = CFSTR("@\"\");
    v46 = *(_QWORD *)v49;
    v17 = v5;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v49 != v46)
          objc_enumerationMutation(obj);
        v19 = v4;
        v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v8;
        }
        else
        {
          v45 = v17;
          v22 = a2;
          v23 = v16;
          v21 = v8;
          v24 = *(void **)(v8 + 1480);
          v25 = objc_opt_class();
          v26 = objc_opt_class();
          v43 = objc_opt_class();
          v27 = v24;
          v16 = v23;
          a2 = v22;
          objc_msgSend(v27, "hk_errorForInvalidArgument:class:selector:format:", v16, v25, v22, CFSTR("%@: All objects must be of class %@, received %@"), v26, v43, v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_opt_class();
        v8 = v21;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = *(void **)(v21 + 1480);
          v4 = v19;
          v29 = objc_opt_class();
          objc_msgSend(v28, "hk_errorForInvalidArgument:class:selector:format:", v16, v29, a2, CFSTR("%@: Correlations cannot contain other correlations. Received %@"), objc_opt_class(), v20);
          v30 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v30;
        }
        else
        {
          v4 = v19;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = *(void **)(v8 + 1480);
          v32 = objc_opt_class();
          objc_msgSend(v31, "hk_errorForInvalidArgument:class:selector:format:", v16, v32, a2, CFSTR("%@: Correlations cannot contain workouts. Received %@"), objc_opt_class(), v20);
          v33 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v33;
        }
        objc_msgSend(v20, "_source");
        v34 = objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v35 = (void *)v34;
          v36 = v17;
          objc_msgSend(v20, "_source");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          +[HKSource defaultSource](HKSource, "defaultSource");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v37, "isEqual:", v38);

          if ((v39 & 1) != 0)
          {
            v8 = 0x1E0CB3000;
            v17 = v36;
          }
          else
          {
            v40 = (void *)MEMORY[0x1E0CB35C8];
            v41 = objc_opt_class();
            objc_msgSend(v40, "hk_errorForInvalidArgument:class:selector:format:", v16, v41, a2, CFSTR("%@: Correlations cannot contain objects that were saved by other sources. Received %@"), objc_opt_class(), v20);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = 0x1E0CB3000uLL;
          }
        }
      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v47);
  }
  else
  {
    v17 = v5;
  }

  return v17;
}

+ (BOOL)_allowEmptyCorrelations
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCorrelation)initWithCoder:(id)a3
{
  id v4;
  HKCorrelation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *objects;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKCorrelation;
  v5 = -[HKSample initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("correlatedObjects"));
    v11 = objc_claimAutoreleasedReturnValue();
    objects = v5->_objects;
    v5->_objects = (NSMutableDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKCorrelation;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_objects, CFSTR("correlatedObjects"), v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
