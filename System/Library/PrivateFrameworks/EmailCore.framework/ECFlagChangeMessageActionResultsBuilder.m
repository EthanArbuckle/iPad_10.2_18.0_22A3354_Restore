@implementation ECFlagChangeMessageActionResultsBuilder

- (ECFlagChangeMessageActionResultsBuilder)init
{
  ECFlagChangeMessageActionResultsBuilder *v2;
  uint64_t v3;
  NSMutableIndexSet *completedUIDs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ECFlagChangeMessageActionResultsBuilder;
  v2 = -[ECFlagChangeMessageActionResultsBuilder init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v3 = objc_claimAutoreleasedReturnValue();
    completedUIDs = v2->_completedUIDs;
    v2->_completedUIDs = (NSMutableIndexSet *)v3;

  }
  return v2;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSMutableIndexSet)completedUIDs
{
  return self->_completedUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedUIDs, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
