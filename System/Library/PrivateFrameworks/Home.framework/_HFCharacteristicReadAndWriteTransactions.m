@implementation _HFCharacteristicReadAndWriteTransactions

- (NSMutableOrderedSet)transactionsWriting
{
  return self->_transactionsWriting;
}

- (NSMutableOrderedSet)transactionsReading
{
  return self->_transactionsReading;
}

- (_HFCharacteristicReadAndWriteTransactions)init
{
  _HFCharacteristicReadAndWriteTransactions *v2;
  uint64_t v3;
  NSMutableOrderedSet *transactionsReading;
  uint64_t v5;
  NSMutableOrderedSet *transactionsWriting;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HFCharacteristicReadAndWriteTransactions;
  v2 = -[_HFCharacteristicReadAndWriteTransactions init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v3 = objc_claimAutoreleasedReturnValue();
    transactionsReading = v2->_transactionsReading;
    v2->_transactionsReading = (NSMutableOrderedSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v5 = objc_claimAutoreleasedReturnValue();
    transactionsWriting = v2->_transactionsWriting;
    v2->_transactionsWriting = (NSMutableOrderedSet *)v5;

  }
  return v2;
}

- (void)setTransactionsReading:(id)a3
{
  objc_storeStrong((id *)&self->_transactionsReading, a3);
}

- (void)setTransactionsWriting:(id)a3
{
  objc_storeStrong((id *)&self->_transactionsWriting, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionsWriting, 0);
  objc_storeStrong((id *)&self->_transactionsReading, 0);
}

@end
