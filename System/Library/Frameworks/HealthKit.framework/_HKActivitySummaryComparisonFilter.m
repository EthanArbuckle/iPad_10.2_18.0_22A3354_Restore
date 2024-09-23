@implementation _HKActivitySummaryComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("activityMoveMode"));
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  char v9;
  objc_super v11;

  v8 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____HKActivitySummaryComparisonFilter;
  if (objc_msgSendSuper2(&v11, sel_areValidTypes_forKeyPath_error_, v8, a4, a5))
    v9 = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_95);
  else
    v9 = 0;

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12;
  BOOL v13;
  objc_super v15;

  v12 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS____HKActivitySummaryComparisonFilter;
  if (!objc_msgSendSuper2(&v15, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, a4, a5, a6, a7))goto LABEL_5;
  if (!_HKActivityMoveModeIsValid(objc_msgSend(v12, "integerValue")))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a7, 3, CFSTR("Value '%@' is not a valid activity move mode"), v12);
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v13 = 1;
LABEL_6:

  return v13;
}

- (BOOL)acceptsDataObject:(id)a3
{
  return 0;
}

- (int64_t)acceptsActivitySummary:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v4 = objc_msgSend(a3, "activityMoveMode");
  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HKCompareIntegers(v4, objc_msgSend(v5, "integerValue"));

  return HKComparisonResultMatchesPredicateOperator(v6, -[_HKComparisonFilter operatorType](self, "operatorType"));
}

@end
