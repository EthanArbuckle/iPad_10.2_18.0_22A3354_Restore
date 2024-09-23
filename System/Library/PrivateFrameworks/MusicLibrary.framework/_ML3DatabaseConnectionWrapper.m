@implementation _ML3DatabaseConnectionWrapper

- (unint64_t)useCount
{
  return self->_useCount;
}

- (void)setUseCount:(unint64_t)a3
{
  self->_useCount = a3;
}

- (ML3DatabaseConnection)connection
{
  return self->_connection;
}

- (NSThread)owningThread
{
  return self->_owningThread;
}

- (void)setOwningThread:(id)a3
{
  objc_storeStrong((id *)&self->_owningThread, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p use = %lld, thread = %@, conn = %p>"), v5, self, self->_useCount, self->_owningThread, self->_connection);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_ML3DatabaseConnectionWrapper)initWithConnection:(id)a3
{
  id v5;
  _ML3DatabaseConnectionWrapper *v6;
  _ML3DatabaseConnectionWrapper *v7;
  NSThread *owningThread;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ML3DatabaseConnectionWrapper;
  v6 = -[_ML3DatabaseConnectionWrapper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    owningThread = v7->_owningThread;
    v7->_owningThread = 0;

    v7->_useCount = 0;
  }

  return v7;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t useCount;
  NSThread *owningThread;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  useCount = self->_useCount;
  owningThread = self->_owningThread;
  -[ML3DatabaseConnection debugDescription](self->_connection, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p use = %lld, thread = %@, conn = %p>"), v5, self, useCount, owningThread, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSThread)borrowingThread
{
  return self->_borrowingThread;
}

- (void)setBorrowingThread:(id)a3
{
  objc_storeStrong((id *)&self->_borrowingThread, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borrowingThread, 0);
  objc_storeStrong((id *)&self->_owningThread, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
