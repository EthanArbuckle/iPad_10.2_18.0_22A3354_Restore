@implementation VNOperationPoints

- (BOOL)getClassificationMetrics:(id *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5
{
  void *v6;

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no operating points for identifier \"%@\"), a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v6);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (BOOL)getDefaultConfidence:(float *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend((id)objc_opt_class(), "errorForUnimplementedMethod:", a2);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withPrecision:(float)a5 error:(id *)a6
{
  if (a6)
  {
    objc_msgSend((id)objc_opt_class(), "errorForUnimplementedMethod:", a2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)getPrecision:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6
{
  if (a6)
  {
    objc_msgSend((id)objc_opt_class(), "errorForUnimplementedMethod:", a2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withRecall:(float)a5 error:(id *)a6
{
  if (a6)
  {
    objc_msgSend((id)objc_opt_class(), "errorForUnimplementedMethod:", a2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)getRecall:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6
{
  if (a6)
  {
    objc_msgSend((id)objc_opt_class(), "errorForUnimplementedMethod:", a2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "errorForUnimplementedMethod:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failWithError:", v5);

}

- (VNOperationPoints)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "errorForUnimplementedMethod:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "failWithError:", v6);

  return 0;
}

+ (id)errorForUnimplementedMethod:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ must implement %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[VNError errorForUnimplementedFunctionWithLocalizedDescription:](VNError, "errorForUnimplementedFunctionWithLocalizedDescription:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorForUnknownClassificationIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown classification identifier \"%@\"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)unspecifiedOperationPoints
{
  return objc_alloc_init(_VNUnspecifiedOperationPoints);
}

+ (id)loadFromURL:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(a1, "errorForUnimplementedMethod:", a2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

+ (id)operationPointsForMLModel:(id)a3 error:(id *)p_isa
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _VNCoreMLOperationPoints *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  objc_msgSend(v5, "modelDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "classLabels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C9E9A0], "precisionRecallCurves");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parameterValueForKey:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_msgSend(v7, "count");
      if (v10 != objc_msgSend(v9, "count"))
      {
        if (p_isa)
        {
          v12 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@ has a mismatch of %@ class labels and %@ precision/recall curve entries"), v5, v13, v14);

          +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v15);
          *p_isa = (id)objc_claimAutoreleasedReturnValue();

          p_isa = 0;
        }
        goto LABEL_10;
      }
      v11 = -[_VNCoreMLOperationPoints initWithClassLabels:precisionRecallCurves:]([_VNCoreMLOperationPoints alloc], "initWithClassLabels:precisionRecallCurves:", v7, v9);
    }
    else
    {
      +[VNOperationPoints unspecifiedOperationPoints](VNOperationPoints, "unspecifiedOperationPoints");
      v11 = (_VNCoreMLOperationPoints *)objc_claimAutoreleasedReturnValue();
    }
    p_isa = (id *)&v11->super.super.isa;
LABEL_10:

    goto LABEL_11;
  }
  +[VNOperationPoints unspecifiedOperationPoints](VNOperationPoints, "unspecifiedOperationPoints");
  p_isa = (id *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return p_isa;
}

@end
