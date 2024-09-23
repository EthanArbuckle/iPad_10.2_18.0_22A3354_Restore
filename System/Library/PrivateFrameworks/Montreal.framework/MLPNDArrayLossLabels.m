@implementation MLPNDArrayLossLabels

- (MLPNDArrayLossLabels)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  MLPNDArrayLossLabels *v5;
  uint64_t v6;
  NSMutableArray *largeReductionSumResult;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *smallReductionSumResult;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MLPNDArrayLossLabels;
  v5 = -[MLPNDArrayLossLabels init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    largeReductionSumResult = v5->_largeReductionSumResult;
    v5->_largeReductionSumResult = (NSMutableArray *)v6;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    smallReductionSumResult = v5->_smallReductionSumResult;
    v5->_smallReductionSumResult = (NSMutableArray *)v11;

  }
  return v5;
}

- (NSMutableArray)largeReductionSumResult
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLargeReductionSumResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)smallReductionSumResult
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSmallReductionSumResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)labels
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLabels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_smallReductionSumResult, 0);
  objc_storeStrong((id *)&self->_largeReductionSumResult, 0);
}

@end
