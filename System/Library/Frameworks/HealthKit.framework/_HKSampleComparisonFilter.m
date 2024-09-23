@implementation _HKSampleComparisonFilter

+ (id)startDateFilterWithOperatorType:(unint64_t)a3 date:(id)a4 dataTypes:(id)a5
{
  return (id)objc_msgSend(a1, "filterForKeyPath:operatorType:value:dataTypes:", CFSTR("startDate"), a3, a4, a5);
}

+ (id)endDateFilterWithOperatorType:(unint64_t)a3 date:(id)a4 dataTypes:(id)a5
{
  return (id)objc_msgSend(a1, "filterForKeyPath:operatorType:value:dataTypes:", CFSTR("endDate"), a3, a4, a5);
}

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("startDate")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("offsetFromStartDate")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("endDate"));
  }

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("offsetFromStartDate")))
    v6 = a3 == 3;
  else
    v6 = +[_HKComparisonFilter isAllowedPredicateOperatorType:forKeyPath:](_HKComparisonFilter, "isAllowedPredicateOperatorType:forKeyPath:", a3, v5);

  return v6;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS____HKSampleComparisonFilter;
  if (!objc_msgSendSuper2(&v12, sel_areValidTypes_forKeyPath_error_, v8, v9, a5))
    goto LABEL_6;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("offsetFromStartDate"))
    && objc_msgSend(v8, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("expected 1 sample type but got %ld %@"), objc_msgSend(v8, "count"), v8);
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v10 = 1;
LABEL_7:

  return v10;
}

+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3
{
  return 1;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("startDate")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("offsetFromStartDate")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("endDate")) & 1) != 0)
  {
    v6 = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKSampleComparisonFilter.m"), 151, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKSampleComparisonFilter;
    v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (void)configureInMemoryFilter
{
  void *v3;
  double v4;
  void *v5;
  HKSampleType *v6;
  HKSampleType *anySampleType;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HKSampleComparisonFilter;
  -[_HKComparisonFilter configureInMemoryFilter](&v8, sel_configureInMemoryFilter);
  -[_HKComparisonFilter value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  self->_comparisonTime = v4;

  -[_HKComparisonFilter dataTypes](self, "dataTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (HKSampleType *)objc_claimAutoreleasedReturnValue();
  anySampleType = self->_anySampleType;
  self->_anySampleType = v6;

}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue");
    objc_msgSend(v5, "_startTimestamp");
    v8 = v7;
    objc_msgSend(v5, "_endTimestamp");
    v10 = v9;

    v11 = _AcceptsDataObject(v6, self->_anySampleType, -[_HKComparisonFilter operatorType](self, "operatorType"), v8, v10, self->_comparisonTime);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)acceptsDataObjectWithStartTimestamp:(double)a3 endTimestamp:(double)a4 valueInCanonicalUnit:(double)a5
{
  return _AcceptsDataObject(-[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue", a3, a4, a5), self->_anySampleType, -[_HKComparisonFilter operatorType](self, "operatorType"), a3, a4, self->_comparisonTime);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anySampleType, 0);
}

@end
