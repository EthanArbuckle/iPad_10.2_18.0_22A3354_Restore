@implementation CRKDictionaryRowTableEntries

- (CRKDictionaryRowTableEntries)initWithDictionaryObjects:(id)a3 keys:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CRKDictionaryRowTableEntries *v10;
  uint64_t v11;
  NSArray *mObjects;
  uint64_t v13;
  NSArray *mKeys;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKDictionaryRowTableEntries.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objects"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKDictionaryRowTableEntries.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keys"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)CRKDictionaryRowTableEntries;
  v10 = -[CRKDictionaryRowTableEntries init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    mObjects = v10->mObjects;
    v10->mObjects = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    mKeys = v10->mKeys;
    v10->mKeys = (NSArray *)v13;

  }
  return v10;
}

- (unint64_t)rowCount
{
  return -[NSArray count](self->mObjects, "count");
}

- (unint64_t)columnCount
{
  return -[NSArray count](self->mKeys, "count");
}

- (id)entryAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  void *v6;
  void *v7;
  CRKRightPaddingTableEntry *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CRKRightPaddingTableEntry *v12;

  -[NSArray objectAtIndexedSubscript:](self->mKeys, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->mObjects, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [CRKRightPaddingTableEntry alloc];
  objc_msgSend(v7, "valueForKeyPath:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = &unk_24DA080C0;
  v12 = -[CRKRightPaddingTableEntry initWithObject:](v8, "initWithObject:", v11);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mKeys, 0);
  objc_storeStrong((id *)&self->mObjects, 0);
}

@end
