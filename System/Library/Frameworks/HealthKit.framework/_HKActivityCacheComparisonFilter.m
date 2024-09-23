@implementation _HKActivityCacheComparisonFilter

+ (id)filterWithOperatorType:(unint64_t)a3 cacheIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  +[HKObjectType activityCacheType](HKSampleType, "activityCacheType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filterForKeyPath:operatorType:value:dataTypes:", CFSTR("cacheIndex"), a3, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("dateComponents")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("cacheIndex"));

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("dateComponents")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("cacheIndex")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKActivityCacheComparisonFilter.m"), 53, CFSTR("Unreachable code has been executed"));

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x1E0C99E60];
  }
  objc_msgSend(v6, "setWithObject:", objc_opt_class());
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)v7;

  return v9;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  char v9;
  objc_super v11;

  v8 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____HKActivityCacheComparisonFilter;
  if (objc_msgSendSuper2(&v11, sel_areValidTypes_forKeyPath_error_, v8, a4, a5))
    v9 = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_66);
  else
    v9 = 0;

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  BOOL v14;
  id v15;
  id v17;
  objc_super v18;

  v12 = a3;
  v13 = a4;
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS____HKActivityCacheComparisonFilter;
  if (objc_msgSendSuper2(&v18, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, a6, a7))
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("dateComponents")))
    {
      v17 = 0;
      v14 = +[HKActivitySummary _validateActivitySummaryDateComponents:errorMessage:](HKActivitySummary, "_validateActivitySummaryDateComponents:errorMessage:", v12, &v17);
      v15 = v17;
      if (!v14)
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a7, 3, v15);

    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)configureInMemoryFilter
{
  void *v3;
  int v4;
  void *v5;
  int64_t v6;
  void *v7;
  int v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_HKActivityCacheComparisonFilter;
  -[_HKComparisonFilter configureInMemoryFilter](&v9, sel_configureInMemoryFilter);
  -[_HKComparisonFilter keyPath](self, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("dateComponents"));

  if (v4)
  {
    -[_HKComparisonFilter value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _HKCacheIndexFromDateComponents(v5);
  }
  else
  {
    -[_HKComparisonFilter keyPath](self, "keyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("cacheIndex"));

    if (!v8)
      return;
    -[_HKComparisonFilter value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");
  }
  self->_cacheIndex = v6;

}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = HKCompareIntegers(objc_msgSend(v4, "cacheIndex"), self->_cacheIndex);
    v6 = HKComparisonResultMatchesPredicateOperator(v5, -[_HKComparisonFilter operatorType](self, "operatorType"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)cacheIndex
{
  return self->_cacheIndex;
}

@end
