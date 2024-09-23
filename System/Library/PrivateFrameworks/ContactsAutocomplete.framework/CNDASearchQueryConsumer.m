@implementation CNDASearchQueryConsumer

- (CNDASearchQueryConsumer)initWithLatch:(id)a3
{
  id v5;
  CNDASearchQueryConsumer *v6;
  CNDASearchQueryConsumer *v7;
  uint64_t v8;
  NSMutableArray *results;
  CNDASearchQueryConsumer *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNDASearchQueryConsumer;
  v6 = -[CNDASearchQueryConsumer init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_latch, a3);
    v8 = objc_opt_new();
    results = v7->_results;
    v7->_results = (NSMutableArray *)v8;

    v10 = v7;
  }

  return v7;
}

+ (id)SuccessfulResults
{
  return &__block_literal_global_13;
}

id __44__CNDASearchQueryConsumer_SuccessfulResults__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isSuccess"))
  {
    objc_msgSend(v2, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

- (void)searchQuery:(id)a3 returnedResults:(id)a4
{
  NSMutableArray *results;
  id v7;
  CNResult *v8;
  CNResult *result;

  results = self->_results;
  v7 = a3;
  -[NSMutableArray addObjectsFromArray:](results, "addObjectsFromArray:", a4);
  LOBYTE(a4) = objc_msgSend(v7, "isQueryRunning");

  if ((a4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", self->_results);
    v8 = (CNResult *)objc_claimAutoreleasedReturnValue();
    result = self->_result;
    self->_result = v8;

    -[CNCountdownLatch countDown](self->_latch, "countDown");
  }
}

- (void)searchQuery:(id)a3 finishedWithError:(id)a4
{
  CNResult *v5;
  CNResult *result;

  if (!self->_result)
  {
    objc_msgSend(MEMORY[0x1E0D13B60], "failureWithError:", a4);
    v5 = (CNResult *)objc_claimAutoreleasedReturnValue();
    result = self->_result;
    self->_result = v5;

    -[CNCountdownLatch countDown](self->_latch, "countDown");
  }
}

- (CNResult)result
{
  return (CNResult *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_latch, 0);
}

@end
