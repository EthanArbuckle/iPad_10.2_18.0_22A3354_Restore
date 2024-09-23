@implementation CRKTableEntriesWithRowSpacer

- (CRKTableEntriesWithRowSpacer)initWithOrigin:(id)a3 index:(unint64_t)a4 spacerEntry:(id)a5
{
  id v10;
  id v11;
  void *v12;
  CRKTableEntriesWithRowSpacer *v13;
  CRKTableEntriesWithRowSpacer *v14;
  void *v16;
  void *v17;
  objc_super v18;

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
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKTableEntriesWithRowSpacer.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKTableEntriesWithRowSpacer.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("spacerEntry"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)CRKTableEntriesWithRowSpacer;
  v13 = -[CRKTableEntriesWithRowSpacer init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->mOrigin, a3);
    v14->mIndex = a4;
    objc_storeStrong((id *)&v14->mSpacerEntry, a5);
  }

  return v14;
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

  mIndex = self->mIndex;
  if (mIndex <= a3)
  {
    if (mIndex == a3)
      return self->mSpacerEntry;
    mOrigin = self->mOrigin;
    --a3;
  }
  else
  {
    mOrigin = self->mOrigin;
  }
  -[CRKTableEntries entryAtRow:column:](mOrigin, "entryAtRow:column:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSpacerEntry, 0);
  objc_storeStrong((id *)&self->mOrigin, 0);
}

@end
