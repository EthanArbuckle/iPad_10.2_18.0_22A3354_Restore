@implementation _ML3DatabaseConnectionPoolDiagnostic

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_ML3DatabaseConnectionPoolDiagnostic _copyWithZone:usingConcreteClass:](self, "_copyWithZone:usingConcreteClass:", a3, objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[_ML3DatabaseConnectionPoolDiagnostic _copyWithZone:usingConcreteClass:](self, "_copyWithZone:usingConcreteClass:", a3, objc_opt_class());
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_alloc_init(a4);
  v6 = -[NSArray copy](self->_readerAvailableConnections, "copy");
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSArray copy](self->_readerBusyConnections, "copy");
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSArray copy](self->_writerAvailableConnections, "copy");
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSArray copy](self->_writerBusyConnections, "copy");
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (NSArray)readerAvailableConnections
{
  return self->_readerAvailableConnections;
}

- (NSArray)readerBusyConnections
{
  return self->_readerBusyConnections;
}

- (NSArray)writerAvailableConnections
{
  return self->_writerAvailableConnections;
}

- (NSArray)writerBusyConnections
{
  return self->_writerBusyConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writerBusyConnections, 0);
  objc_storeStrong((id *)&self->_writerAvailableConnections, 0);
  objc_storeStrong((id *)&self->_readerBusyConnections, 0);
  objc_storeStrong((id *)&self->_readerAvailableConnections, 0);
}

@end
