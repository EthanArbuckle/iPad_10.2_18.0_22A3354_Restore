@implementation _EDThreadQueryUnderlyingHandlers

- (BOOL)_isCurrentObservationToken:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[_EDThreadQueryUnderlyingHandlers inMemoryObservationID](self, "inMemoryObservationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[_EDThreadQueryUnderlyingHandlers precomputedObservationID](self, "precomputedObservationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v7);

  }
  return v6;
}

- (EMObjectID)precomputedObservationID
{
  return self->_precomputedObservationID;
}

- (EMObjectID)inMemoryObservationID
{
  return self->_inMemoryObservationID;
}

- (EDPrecomputedThreadQueryHandler)precomputedQueryHandler
{
  return self->_precomputedQueryHandler;
}

- (EDThreadMigrator)threadMigrator
{
  return self->_threadMigrator;
}

- (EDInMemoryThreadQueryHandler)inMemoryQueryHandler
{
  return self->_inMemoryQueryHandler;
}

- (void)setPrecomputedQueryHandler:(id)a3
{
  objc_storeStrong((id *)&self->_precomputedQueryHandler, a3);
}

- (void)setPrecomputedObservationID:(id)a3
{
  objc_storeStrong((id *)&self->_precomputedObservationID, a3);
}

- (void)setInMemoryObservationID:(id)a3
{
  objc_storeStrong((id *)&self->_inMemoryObservationID, a3);
}

- (void)setInMemoryQueryHandler:(id)a3
{
  objc_storeStrong((id *)&self->_inMemoryQueryHandler, a3);
}

- (void)setThreadMigrator:(id)a3
{
  objc_storeStrong((id *)&self->_threadMigrator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadMigrator, 0);
  objc_storeStrong((id *)&self->_precomputedQueryHandler, 0);
  objc_storeStrong((id *)&self->_inMemoryQueryHandler, 0);
  objc_storeStrong((id *)&self->_precomputedObservationID, 0);
  objc_storeStrong((id *)&self->_inMemoryObservationID, 0);
}

@end
