@implementation ARNonSynchronousData

- (ARNonSynchronousData)initWithGatheredData:(id)a3 timestamp:(double)a4
{
  id v7;
  ARNonSynchronousData *v8;
  ARNonSynchronousData *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARNonSynchronousData;
  v8 = -[ARNonSynchronousData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_gatheredData, a3);
    v9->_timestamp = a4;
  }

  return v9;
}

- (id)resultDataOfClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[ARNonSynchronousData gatheredData](self, "gatheredData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__ARNonSynchronousData_resultDataOfClass___block_invoke;
  v8[3] = &__block_descriptor_40_e41_B24__0___ARResultData__8__NSDictionary_16lu32l8;
  v8[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __42__ARNonSynchronousData_resultDataOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (NSArray)gatheredData
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGatheredData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatheredData, 0);
}

@end
