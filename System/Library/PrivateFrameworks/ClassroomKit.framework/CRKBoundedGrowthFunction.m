@implementation CRKBoundedGrowthFunction

- (CRKBoundedGrowthFunction)initWithGrowthFunction:(id)a3 lowerBound:(double)a4 upperBound:(double)a5
{
  id v10;
  CRKBoundedGrowthFunction *v11;
  CRKBoundedGrowthFunction *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKBoundedGrowthFunction.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("growthFunction"));

  }
  if (a4 > a5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKBoundedGrowthFunction.m"), 23, CFSTR("Must provide a valud interval for the growth function"));

  }
  v16.receiver = self;
  v16.super_class = (Class)CRKBoundedGrowthFunction;
  v11 = -[CRKBoundedGrowthFunction init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_growthFunction, a3);
    v12->_lowerBound = a4;
    v12->_upperBound = a5;
  }

  return v12;
}

- (double)evaluateWithValue:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double result;

  -[CRKBoundedGrowthFunction growthFunction](self, "growthFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluateWithValue:", a3);
  v7 = v6;

  -[CRKBoundedGrowthFunction lowerBound](self, "lowerBound");
  if (v8 >= v7)
    v7 = v8;
  -[CRKBoundedGrowthFunction upperBound](self, "upperBound");
  if (v7 < result)
    return v7;
  return result;
}

- (CRKGrowthFunction)growthFunction
{
  return self->_growthFunction;
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_growthFunction, 0);
}

@end
