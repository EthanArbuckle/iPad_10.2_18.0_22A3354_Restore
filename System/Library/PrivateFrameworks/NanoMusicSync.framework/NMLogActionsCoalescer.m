@implementation NMLogActionsCoalescer

- (NMLogActionsCoalescer)initWithIdentifier:(id)a3 logCategory:(id)a4
{
  id v7;
  id v8;
  NMLogActionsCoalescer *v9;
  NMLogActionsCoalescer *v10;
  uint64_t v11;
  NSMutableArray *pendingLogActions;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NMLogActionsCoalescer;
  v9 = -[NMLogActionsCoalescer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_category, a4);
    v10->_messageBufferLimit = 300;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 300);
    v11 = objc_claimAutoreleasedReturnValue();
    pendingLogActions = v10->_pendingLogActions;
    v10->_pendingLogActions = (NSMutableArray *)v11;

  }
  return v10;
}

- (void)setMessageBufferLimit:(unint64_t)a3
{
  NSMutableArray *v4;
  NSMutableArray *pendingLogActions;

  if (self->_messageBufferLimit != a3)
  {
    self->_messageBufferLimit = a3;
    if (-[NSMutableArray count](self->_pendingLogActions, "count"))
      -[NMLogActionsCoalescer _writeLogMessageFromActions:includingPartNumber:](self, "_writeLogMessageFromActions:includingPartNumber:", self->_pendingLogActions, 1);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_messageBufferLimit);
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    pendingLogActions = self->_pendingLogActions;
    self->_pendingLogActions = v4;

  }
}

- (void)addLogAction:(id)a3
{
  -[NMLogActionsCoalescer _addAction:toPendingActions:limit:](self, "_addAction:toPendingActions:limit:", a3, self->_pendingLogActions, self->_messageBufferLimit);
}

- (void)flush
{
  -[NMLogActionsCoalescer _writeLogMessageFromActions:includingPartNumber:](self, "_writeLogMessageFromActions:includingPartNumber:", self->_pendingLogActions, self->_partNumber != 0);
  -[NSMutableArray removeAllObjects](self->_pendingLogActions, "removeAllObjects");
  self->_partNumber = 0;
}

- (void)_addAction:(id)a3 toPendingActions:(id)a4 limit:(unint64_t)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count") == a5)
  {
    -[NMLogActionsCoalescer _writeLogMessageFromActions:includingPartNumber:](self, "_writeLogMessageFromActions:includingPartNumber:", v8, 1);
    objc_msgSend(v8, "removeAllObjects");
  }
  objc_msgSend(v8, "addObject:", v9);

}

- (id)_logMessageFromPendingLogActions:(id)a3 includingPartNumber:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" (part #%lu) "), self->_partNumber);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24D648498;
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("logMessage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@%@: <\n%@\n>"), self->_prefix, self->_identifier, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_writeLogMessageFromActions:(id)a3 includingPartNumber:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *category;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  category = self->_category;
  if (os_log_type_enabled(category, OS_LOG_TYPE_DEFAULT))
  {
    v8 = category;
    -[NMLogActionsCoalescer _logMessageFromPendingLogActions:includingPartNumber:](self, "_logMessageFromPendingLogActions:includingPartNumber:", v6, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v10, 0xCu);

  }
  if (v4)
    ++self->_partNumber;

}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_prefix, a3);
}

- (unint64_t)messageBufferLimit
{
  return self->_messageBufferLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong(&self->_identifier, 0);
  objc_storeStrong((id *)&self->_pendingLogActions, 0);
}

@end
