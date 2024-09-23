@implementation FedStatsDataEncoderDimensionalResult

- (FedStatsDataEncoderDimensionalResult)initWithIndex:(id)a3 dimensionality:(id)a4
{
  id v7;
  id v8;
  FedStatsDataEncoderDimensionalResult *v9;
  FedStatsDataEncoderDimensionalResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FedStatsDataEncoderDimensionalResult;
  v9 = -[FedStatsDataEncoderDimensionalResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_index, a3);
    objc_storeStrong((id *)&v10->_dimensionality, a4);
  }

  return v10;
}

+ (id)resultWithIndex:(id)a3 dimensionality:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIndex:dimensionality:", v7, v6);

  return v8;
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIndex:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSNumber)dimensionality
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDimensionality:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensionality, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end
