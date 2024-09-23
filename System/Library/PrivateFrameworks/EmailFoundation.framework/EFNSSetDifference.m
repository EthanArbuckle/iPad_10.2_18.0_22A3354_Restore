@implementation EFNSSetDifference

- (EFNSSetDifference)initWithInsertedObjects:(id)a3 removedObjects:(id)a4
{
  id v6;
  id v7;
  EFNSSetDifference *v8;
  NSSet *v9;
  NSSet *insertions;
  NSSet *v11;
  NSSet *removals;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EFNSSetDifference;
  v8 = -[EFNSSetDifference init](&v14, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = (NSSet *)v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    insertions = v8->_insertions;
    v8->_insertions = v9;

    if (v7)
    {
      v11 = (NSSet *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    removals = v8->_removals;
    v8->_removals = v11;

  }
  return v8;
}

- (EFNSSetDifference)init
{
  return -[EFNSSetDifference initWithInsertedObjects:removedObjects:](self, "initWithInsertedObjects:removedObjects:", 0, 0);
}

- (BOOL)hasChanges
{
  void *v3;
  BOOL v4;
  void *v5;

  -[EFNSSetDifference insertions](self, "insertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[EFNSSetDifference removals](self, "removals");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (NSSet)insertions
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)removals
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removals, 0);
  objc_storeStrong((id *)&self->_insertions, 0);
}

@end
