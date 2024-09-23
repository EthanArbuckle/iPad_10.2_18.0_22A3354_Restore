@implementation VNOperationPointsProvider

- (VNOperationPointsProvider)initWithOperationPoints:(id)a3
{
  id v5;
  VNOperationPointsProvider *v6;
  VNOperationPointsProvider *v7;
  objc_super v9;

  v5 = a3;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v5 != 0, CFSTR("operation points object must be allocated before calling this method"));
  v9.receiver = self;
  v9.super_class = (Class)VNOperationPointsProvider;
  v6 = -[VNOperationPointsProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_operationPoints, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VNOperationPointsProvider *v4;
  VNOperationPointsProvider *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VNOperationPointsProvider *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNOperationPointsProvider operationPointsAndReturnError:](self, "operationPointsAndReturnError:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNOperationPointsProvider operationPointsAndReturnError:](v5, "operationPointsAndReturnError:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = VisionCoreEqualOrNilObjects();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)operationPointsAndReturnError:(id *)a3
{
  return self->_operationPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationPoints, 0);
}

@end
