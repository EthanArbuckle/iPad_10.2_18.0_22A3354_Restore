@implementation MPSGraphBlock

- (MPSGraphBlock)init
{
  MPSGraphBlock *v2;
  MPSGraphOperation *terminator;
  uint64_t v4;
  NSMutableArray *blockOperations;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPSGraphBlock;
  v2 = -[MPSGraphBlock init](&v7, sel_init);
  terminator = v2->_terminator;
  v2->_terminator = 0;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = objc_claimAutoreleasedReturnValue();
  blockOperations = v2->_blockOperations;
  v2->_blockOperations = (NSMutableArray *)v4;

  return v2;
}

- (void)addTerminatorOperation:(id)a3
{
  objc_storeStrong((id *)&self->_terminator, a3);
}

- (id)parentOp
{
  id *WeakRetained;
  id v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_parentRegion);
  v3 = objc_loadWeakRetained(WeakRetained + 2);

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentRegion);
  objc_storeStrong((id *)&self->_blockOperations, 0);
  objc_storeStrong((id *)&self->_terminator, 0);
}

@end
