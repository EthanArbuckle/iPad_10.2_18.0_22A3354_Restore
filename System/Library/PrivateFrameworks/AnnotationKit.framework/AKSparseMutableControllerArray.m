@implementation AKSparseMutableControllerArray

- (BOOL)containsAnyObjects:(id)a3
{
  void *v3;
  NSMutableArray *backendArray;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCF20];
  backendArray = self->_backendArray;
  v5 = a3;
  objc_msgSend(v3, "setWithArray:", backendArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "intersectsSet:", v7);
  return (char)v5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;

  if (-[NSMutableArray count](self->_backendArray, "count") <= a3)
    goto LABEL_4;
  -[NSMutableArray objectAtIndex:](self->_backendArray, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {

LABEL_4:
    v5 = 0;
  }
  return v5;
}

- (id)objectsAtIndexes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_229011F14;
  v11[3] = &unk_24F1A7B38;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

- (AKSparseMutableControllerArray)initWithCapacity:(unint64_t)a3
{
  AKSparseMutableControllerArray *v4;
  uint64_t v5;
  NSMutableArray *backendArray;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKSparseMutableControllerArray;
  v4 = -[AKSparseMutableControllerArray init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    backendArray = v4->_backendArray;
    v4->_backendArray = (NSMutableArray *)v5;

  }
  return v4;
}

- (void)addObject:(id)a3
{
  -[NSMutableArray addObject:](self->_backendArray, "addObject:", a3);
}

- (void)_backFillUntilCount:(unint64_t)a3
{
  NSMutableArray *backendArray;
  void *v6;

  while (-[NSMutableArray count](self->_backendArray, "count") < a3)
  {
    backendArray = self->_backendArray;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](backendArray, "addObject:", v6);

  }
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[AKSparseMutableControllerArray _backFillUntilCount:](self, "_backFillUntilCount:", a4);
  -[NSMutableArray insertObject:atIndex:](self->_backendArray, "insertObject:atIndex:", v6, a4);

}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  unint64_t v6;
  id v7;

  v6 = a3 + 1;
  v7 = a4;
  -[AKSparseMutableControllerArray _backFillUntilCount:](self, "_backFillUntilCount:", v6);
  -[NSMutableArray setObject:atIndexedSubscript:](self->_backendArray, "setObject:atIndexedSubscript:", v7, a3);

}

- (unint64_t)count
{
  uint64_t v3;
  void *v5;
  void *v6;
  char v7;

  v3 = -[NSMutableArray count](self->_backendArray, "count");
  while (v3-- >= 1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_backendArray, "objectAtIndexedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) == 0)
      return v3 + 1;
  }
  return 0;
}

- (void)removeObject:(id)a3
{
  -[NSMutableArray removeObject:](self->_backendArray, "removeObject:", a3);
}

- (void)removeLastObject
{
  uint64_t v3;
  void *v5;
  void *v6;
  char v7;

  v3 = -[NSMutableArray count](self->_backendArray, "count");
  do
  {
    if (v3-- < 1)
      break;
    -[NSMutableArray objectAtIndexedSubscript:](self->_backendArray, "objectAtIndexedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_backendArray, "removeObjectAtIndex:", v3);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  while ((v7 & 1) != 0);
}

- (void)removeAllObjects
{
  -[NSMutableArray removeAllObjects](self->_backendArray, "removeAllObjects");
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if (-[NSMutableArray count](self->_backendArray, "count") > a3)
    -[NSMutableArray removeObjectAtIndex:](self->_backendArray, "removeObjectAtIndex:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backendArray, 0);
}

@end
