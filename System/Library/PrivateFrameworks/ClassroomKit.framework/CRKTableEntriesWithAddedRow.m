@implementation CRKTableEntriesWithAddedRow

- (CRKTableEntriesWithAddedRow)initWithOrigin:(id)a3 index:(unint64_t)a4 entries:(id)a5
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  CRKTableEntriesWithAddedRow *v14;
  CRKTableEntriesWithAddedRow *v15;
  uint64_t v16;
  NSArray *mEntries;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v10 = a3;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKTableEntriesWithAddedRow.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKTableEntriesWithAddedRow.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entries"));

LABEL_3:
  if (objc_msgSend(v10, "rowCount") < a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKTableEntriesWithAddedRow.m"), 24, CFSTR("Invalid row index %@"), v22);

  }
  v13 = objc_msgSend(v10, "columnCount");
  if (v13 != objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "columnCount"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKTableEntriesWithAddedRow.m"), 25, CFSTR("Attempt to add a row of width %@ to a table of width %@"), v24, v25);

  }
  v26.receiver = self;
  v26.super_class = (Class)CRKTableEntriesWithAddedRow;
  v14 = -[CRKTableEntriesWithAddedRow init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->mOrigin, a3);
    v15->mIndex = a4;
    v16 = objc_msgSend(v12, "copy");
    mEntries = v15->mEntries;
    v15->mEntries = (NSArray *)v16;

  }
  return v15;
}

- (unint64_t)rowCount
{
  return -[CRKTableEntries rowCount](self->mOrigin, "rowCount") + 1;
}

- (unint64_t)columnCount
{
  return -[CRKTableEntries columnCount](self->mOrigin, "columnCount");
}

- (id)entryAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  unint64_t mIndex;
  CRKTableEntries *mOrigin;
  void *v6;

  mIndex = self->mIndex;
  if (mIndex > a3)
  {
    mOrigin = self->mOrigin;
LABEL_6:
    -[CRKTableEntries entryAtRow:column:](mOrigin, "entryAtRow:column:", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (mIndex != a3)
  {
    mOrigin = self->mOrigin;
    --a3;
    goto LABEL_6;
  }
  -[NSArray objectAtIndexedSubscript:](self->mEntries, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEntries, 0);
  objc_storeStrong((id *)&self->mOrigin, 0);
}

@end
