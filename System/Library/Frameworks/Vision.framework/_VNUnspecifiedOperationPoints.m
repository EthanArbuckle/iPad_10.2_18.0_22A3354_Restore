@implementation _VNUnspecifiedOperationPoints

- (BOOL)getDefaultConfidence:(float *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5
{
  if (a5)
  {
    _dataUnvailableError((uint64_t)a4);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withPrecision:(float)a5 error:(id *)a6
{
  if (a6)
  {
    _dataUnvailableError((uint64_t)a4);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)getPrecision:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6
{
  if (a6)
  {
    _dataUnvailableError((uint64_t)a4);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withRecall:(float)a5 error:(id *)a6
{
  if (a6)
  {
    _dataUnvailableError((uint64_t)a4);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)getRecall:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6
{
  id v7;
  void *v8;

  if (a6)
  {
    v7 = a4;
    objc_msgSend((id)objc_opt_class(), "errorForUnknownClassificationIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    *a6 = v8;
  }
  return 0;
}

- (BOOL)getClassificationMetrics:(id *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5
{
  *a3 = 0;
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (a3 == self)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
