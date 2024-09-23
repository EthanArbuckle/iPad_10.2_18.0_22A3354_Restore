@implementation _DKPerformSyncUpChangeOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  uint64_t v3;

  v3 = objc_opt_class();
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, 0, self->_policy))-[_DKPerformSyncUpChangeOperation endOperation](self, "endOperation");
  else
    -[_DKPerformSyncUpChangeOperation performSyncUpChange]((uint64_t)self);
}

- (void)performSyncUpChange
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 304), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v4, v5, "%{public}@: Skipping change sync up on transport %{public}@ because there are no changes", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)endOperation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncUpChangeOperation;
  -[_DKSyncCompositeOperation endOperation](&v2, sel_endOperation);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedEventIDs, 0);
  objc_storeStrong((id *)&self->_insertedEvents, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

@end
