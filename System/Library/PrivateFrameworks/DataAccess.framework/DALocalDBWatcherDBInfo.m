@implementation DALocalDBWatcherDBInfo

- (DALocalDBWatcherDBInfo)initWithPath:(id)a3
{
  id v5;
  DALocalDBWatcherDBInfo *v6;
  DALocalDBWatcherDBInfo *v7;
  uint64_t v8;
  NSMutableDictionary *blocksByConcernedParty;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DALocalDBWatcherDBInfo;
  v6 = -[DALocalDBWatcherDBInfo init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    v7->_lastSavedSequenceNumber = 0;
    v8 = objc_opt_new();
    blocksByConcernedParty = v7->_blocksByConcernedParty;
    v7->_blocksByConcernedParty = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)addBlock:(id)a3 forConcernedParty:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  DALocalDBWatcherCalConcernedParty *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = -[DALocalDBWatcherCalConcernedParty initWithConcernedParty:accountID:]([DALocalDBWatcherCalConcernedParty alloc], "initWithConcernedParty:accountID:", v9, v8);

  v11 = (void *)MEMORY[0x1B5E48C2C](v10);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_blocksByConcernedParty, "setObject:forKeyedSubscript:", v11, v12);

}

- (void)removeBlockForConcernedParty:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  DALocalDBWatcherCalConcernedParty *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[DALocalDBWatcherCalConcernedParty initWithConcernedParty:accountID:]([DALocalDBWatcherCalConcernedParty alloc], "initWithConcernedParty:accountID:", v7, v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_blocksByConcernedParty, "setObject:forKeyedSubscript:", 0, v8);
  if (!-[NSMutableDictionary count](self->_blocksByConcernedParty, "count"))
    self->_lastSavedSequenceNumber = 0;

}

- (id)allConcernedParties
{
  return (id)-[NSMutableDictionary allKeys](self->_blocksByConcernedParty, "allKeys");
}

- (id)allBlocks
{
  return (id)-[NSMutableDictionary allValues](self->_blocksByConcernedParty, "allValues");
}

- (NSString)path
{
  return self->_path;
}

- (int)lastSavedSequenceNumber
{
  return self->_lastSavedSequenceNumber;
}

- (void)setLastSavedSequenceNumber:(int)a3
{
  self->_lastSavedSequenceNumber = a3;
}

- (NSMutableDictionary)blocksByConcernedParty
{
  return self->_blocksByConcernedParty;
}

- (void)setBlocksByConcernedParty:(id)a3
{
  objc_storeStrong((id *)&self->_blocksByConcernedParty, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocksByConcernedParty, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
