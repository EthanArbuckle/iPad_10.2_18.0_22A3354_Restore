@implementation ICASCollabFoldersItemData

- (ICASCollabFoldersItemData)initWithTotalFoldersCollabRootReadOnlyCount:(id)a3 totalFoldersCollabSubfolderReadOnlyCount:(id)a4 totalFoldersCollabRootReadWriteJoinedCount:(id)a5 totalFoldersCollabSubfolderReadWriteJoinedCount:(id)a6 totalFoldersNotCollabCount:(id)a7 totalFoldersCollabRootOwnedCount:(id)a8 totalFoldersCollabSubfolderOwnedCount:(id)a9
{
  id v16;
  id v17;
  ICASCollabFoldersItemData *v18;
  ICASCollabFoldersItemData *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ICASCollabFoldersItemData;
  v18 = -[ICASCollabFoldersItemData init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_totalFoldersCollabRootReadOnlyCount, a3);
    objc_storeStrong((id *)&v19->_totalFoldersCollabSubfolderReadOnlyCount, a4);
    objc_storeStrong((id *)&v19->_totalFoldersCollabRootReadWriteJoinedCount, a5);
    objc_storeStrong((id *)&v19->_totalFoldersCollabSubfolderReadWriteJoinedCount, a6);
    objc_storeStrong((id *)&v19->_totalFoldersNotCollabCount, a7);
    objc_storeStrong((id *)&v19->_totalFoldersCollabRootOwnedCount, a8);
    objc_storeStrong((id *)&v19->_totalFoldersCollabSubfolderOwnedCount, a9);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("CollabFoldersItemData");
}

- (id)toDict
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[7];
  _QWORD v27[9];

  v27[7] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("totalFoldersCollabRootReadOnlyCount");
  -[ICASCollabFoldersItemData totalFoldersCollabRootReadOnlyCount](self, "totalFoldersCollabRootReadOnlyCount");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[ICASCollabFoldersItemData totalFoldersCollabRootReadOnlyCount](self, "totalFoldersCollabRootReadOnlyCount");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v24 = (void *)v3;
  v27[0] = v3;
  v26[1] = CFSTR("totalFoldersCollabSubfolderReadOnlyCount");
  -[ICASCollabFoldersItemData totalFoldersCollabSubfolderReadOnlyCount](self, "totalFoldersCollabSubfolderReadOnlyCount");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[ICASCollabFoldersItemData totalFoldersCollabSubfolderReadOnlyCount](self, "totalFoldersCollabSubfolderReadOnlyCount");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v22 = (void *)v4;
  v27[1] = v4;
  v26[2] = CFSTR("totalFoldersCollabRootReadWriteJoinedCount");
  -[ICASCollabFoldersItemData totalFoldersCollabRootReadWriteJoinedCount](self, "totalFoldersCollabRootReadWriteJoinedCount");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[ICASCollabFoldersItemData totalFoldersCollabRootReadWriteJoinedCount](self, "totalFoldersCollabRootReadWriteJoinedCount");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v6 = (void *)v5;
  v27[2] = v5;
  v26[3] = CFSTR("totalFoldersCollabSubfolderReadWriteJoinedCount");
  -[ICASCollabFoldersItemData totalFoldersCollabSubfolderReadWriteJoinedCount](self, "totalFoldersCollabSubfolderReadWriteJoinedCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ICASCollabFoldersItemData totalFoldersCollabSubfolderReadWriteJoinedCount](self, "totalFoldersCollabSubfolderReadWriteJoinedCount");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v27[3] = v8;
  v26[4] = CFSTR("totalFoldersNotCollabCount");
  -[ICASCollabFoldersItemData totalFoldersNotCollabCount](self, "totalFoldersNotCollabCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ICASCollabFoldersItemData totalFoldersNotCollabCount](self, "totalFoldersNotCollabCount");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_opt_new();
  }
  v12 = (void *)v11;
  v27[4] = v11;
  v26[5] = CFSTR("totalFoldersCollabRootOwnedCount");
  -[ICASCollabFoldersItemData totalFoldersCollabRootOwnedCount](self, "totalFoldersCollabRootOwnedCount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[ICASCollabFoldersItemData totalFoldersCollabRootOwnedCount](self, "totalFoldersCollabRootOwnedCount");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_opt_new();
  }
  v15 = (void *)v14;
  v27[5] = v14;
  v26[6] = CFSTR("totalFoldersCollabSubfolderOwnedCount");
  -[ICASCollabFoldersItemData totalFoldersCollabSubfolderOwnedCount](self, "totalFoldersCollabSubfolderOwnedCount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[ICASCollabFoldersItemData totalFoldersCollabSubfolderOwnedCount](self, "totalFoldersCollabSubfolderOwnedCount");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_opt_new();
  }
  v18 = (void *)v17;
  v27[6] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSNumber)totalFoldersCollabRootReadOnlyCount
{
  return self->_totalFoldersCollabRootReadOnlyCount;
}

- (NSNumber)totalFoldersCollabSubfolderReadOnlyCount
{
  return self->_totalFoldersCollabSubfolderReadOnlyCount;
}

- (NSNumber)totalFoldersCollabRootReadWriteJoinedCount
{
  return self->_totalFoldersCollabRootReadWriteJoinedCount;
}

- (NSNumber)totalFoldersCollabSubfolderReadWriteJoinedCount
{
  return self->_totalFoldersCollabSubfolderReadWriteJoinedCount;
}

- (NSNumber)totalFoldersNotCollabCount
{
  return self->_totalFoldersNotCollabCount;
}

- (NSNumber)totalFoldersCollabRootOwnedCount
{
  return self->_totalFoldersCollabRootOwnedCount;
}

- (NSNumber)totalFoldersCollabSubfolderOwnedCount
{
  return self->_totalFoldersCollabSubfolderOwnedCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalFoldersCollabSubfolderOwnedCount, 0);
  objc_storeStrong((id *)&self->_totalFoldersCollabRootOwnedCount, 0);
  objc_storeStrong((id *)&self->_totalFoldersNotCollabCount, 0);
  objc_storeStrong((id *)&self->_totalFoldersCollabSubfolderReadWriteJoinedCount, 0);
  objc_storeStrong((id *)&self->_totalFoldersCollabRootReadWriteJoinedCount, 0);
  objc_storeStrong((id *)&self->_totalFoldersCollabSubfolderReadOnlyCount, 0);
  objc_storeStrong((id *)&self->_totalFoldersCollabRootReadOnlyCount, 0);
}

@end
