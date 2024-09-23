@implementation ATXCorrelationMatrixGuardedData

- (ATXCorrelationMatrixGuardedData)init
{
  void *v3;
  void *v4;
  ATXCorrelationMatrixGuardedData *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXCorrelationMatrixGuardedData initWithCorrelationMatrix:locationTotals:](self, "initWithCorrelationMatrix:locationTotals:", v3, v4);

  return v5;
}

- (ATXCorrelationMatrixGuardedData)initWithCorrelationMatrix:(id)a3 locationTotals:(id)a4
{
  id v7;
  NSMutableDictionary *v8;
  ATXCorrelationMatrixGuardedData *v9;
  ATXCorrelationMatrixGuardedData *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  NSMutableDictionary *correlationMatrix;
  NSMutableDictionary *locationTotals;
  objc_super v16;

  v7 = a3;
  v8 = (NSMutableDictionary *)a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXCorrelationMatrixGuardedData;
  v9 = -[ATXCorrelationMatrixGuardedData init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v7 && v8)
    {
      objc_storeStrong((id *)&v9->_correlationMatrix, a3);
      v11 = v8;
      v8 = v11;
    }
    else
    {

      v12 = objc_opt_new();
      correlationMatrix = v10->_correlationMatrix;
      v10->_correlationMatrix = (NSMutableDictionary *)v12;

      v11 = (NSMutableDictionary *)objc_opt_new();
      v7 = 0;
      v8 = 0;
    }
    locationTotals = v10->_locationTotals;
    v10->_locationTotals = v11;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationTotals, 0);
  objc_storeStrong((id *)&self->_correlationMatrix, 0);
}

@end
