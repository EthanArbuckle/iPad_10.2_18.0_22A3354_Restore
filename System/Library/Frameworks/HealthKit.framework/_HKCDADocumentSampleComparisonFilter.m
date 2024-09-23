@implementation _HKCDADocumentSampleComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("author_name")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("custodian_name")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("patient_name")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("title"));
  }

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  char v9;
  objc_super v11;

  v8 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____HKCDADocumentSampleComparisonFilter;
  if (objc_msgSendSuper2(&v11, sel_areValidTypes_forKeyPath_error_, v8, a4, a5))
    v9 = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_86);
  else
    v9 = 0;

  return v9;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  BOOL result;

  result = 1;
  if (a3 > 9 || ((1 << a3) & 0x3B0) == 0)
    return a3 == 99;
  return result;
}

- (void)configureInMemoryFilter
{
  void *v3;
  NSRegularExpression *v4;
  NSRegularExpression *comparisonExpression;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKCDADocumentSampleComparisonFilter;
  -[_HKComparisonFilter configureInMemoryFilter](&v6, sel_configureInMemoryFilter);
  -[_HKComparisonFilter value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKCDADocumentSample _comparisonExpressionForValue:operatorType:](HKCDADocumentSample, "_comparisonExpressionForValue:operatorType:", v3, -[_HKComparisonFilter operatorType](self, "operatorType"));
  v4 = (NSRegularExpression *)objc_claimAutoreleasedReturnValue();
  comparisonExpression = self->_comparisonExpression;
  self->_comparisonExpression = v4;

}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_HKComparisonFilter keyPath](self, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "_predicateMatchForKeyPath:pattern:", v6, self->_comparisonExpression);

    v8 = v7 ^ (-[_HKComparisonFilter operatorType](self, "operatorType") == 5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisonExpression, 0);
}

@end
