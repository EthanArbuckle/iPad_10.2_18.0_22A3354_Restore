@implementation CRKListTableEntries

- (CRKListTableEntries)initWithArray:(id)a3
{
  id v5;
  CRKListTableEntries *v6;
  uint64_t v7;
  NSArray *mArray;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKListTableEntries.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("array"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CRKListTableEntries;
  v6 = -[CRKListTableEntries init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    mArray = v6->mArray;
    v6->mArray = (NSArray *)v7;

  }
  return v6;
}

- (unint64_t)rowCount
{
  return -[NSArray count](self->mArray, "count");
}

- (unint64_t)columnCount
{
  return 1;
}

- (id)entryAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  CRKRightPaddingTableEntry *v6;
  void *v7;
  CRKRightPaddingTableEntry *v8;

  v6 = [CRKRightPaddingTableEntry alloc];
  -[NSArray objectAtIndexedSubscript:](self->mArray, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CRKRightPaddingTableEntry initWithObject:](v6, "initWithObject:", v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mArray, 0);
}

@end
