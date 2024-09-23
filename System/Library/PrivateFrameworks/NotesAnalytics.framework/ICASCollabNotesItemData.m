@implementation ICASCollabNotesItemData

- (ICASCollabNotesItemData)initWithTotalNotesCollabRootReadOnlyCount:(id)a3 totalNotesCollabThruFolderReadOnlyCount:(id)a4 totalNotesCollabRootReadWriteJoinedCount:(id)a5 totalNotesCollabThruFolderReadWriteJoinedCount:(id)a6 totalNotesNotCollabCount:(id)a7 totalNotesCollabRootOwnedCount:(id)a8 totalNotesCollabThruFolderOwnedCount:(id)a9
{
  id v16;
  id v17;
  ICASCollabNotesItemData *v18;
  ICASCollabNotesItemData *v19;
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
  v26.super_class = (Class)ICASCollabNotesItemData;
  v18 = -[ICASCollabNotesItemData init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_totalNotesCollabRootReadOnlyCount, a3);
    objc_storeStrong((id *)&v19->_totalNotesCollabThruFolderReadOnlyCount, a4);
    objc_storeStrong((id *)&v19->_totalNotesCollabRootReadWriteJoinedCount, a5);
    objc_storeStrong((id *)&v19->_totalNotesCollabThruFolderReadWriteJoinedCount, a6);
    objc_storeStrong((id *)&v19->_totalNotesNotCollabCount, a7);
    objc_storeStrong((id *)&v19->_totalNotesCollabRootOwnedCount, a8);
    objc_storeStrong((id *)&v19->_totalNotesCollabThruFolderOwnedCount, a9);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("CollabNotesItemData");
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
  v26[0] = CFSTR("totalNotesCollabRootReadOnlyCount");
  -[ICASCollabNotesItemData totalNotesCollabRootReadOnlyCount](self, "totalNotesCollabRootReadOnlyCount");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[ICASCollabNotesItemData totalNotesCollabRootReadOnlyCount](self, "totalNotesCollabRootReadOnlyCount");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v24 = (void *)v3;
  v27[0] = v3;
  v26[1] = CFSTR("totalNotesCollabThruFolderReadOnlyCount");
  -[ICASCollabNotesItemData totalNotesCollabThruFolderReadOnlyCount](self, "totalNotesCollabThruFolderReadOnlyCount");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[ICASCollabNotesItemData totalNotesCollabThruFolderReadOnlyCount](self, "totalNotesCollabThruFolderReadOnlyCount");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v22 = (void *)v4;
  v27[1] = v4;
  v26[2] = CFSTR("totalNotesCollabRootReadWriteJoinedCount");
  -[ICASCollabNotesItemData totalNotesCollabRootReadWriteJoinedCount](self, "totalNotesCollabRootReadWriteJoinedCount");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[ICASCollabNotesItemData totalNotesCollabRootReadWriteJoinedCount](self, "totalNotesCollabRootReadWriteJoinedCount");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v6 = (void *)v5;
  v27[2] = v5;
  v26[3] = CFSTR("totalNotesCollabThruFolderReadWriteJoinedCount");
  -[ICASCollabNotesItemData totalNotesCollabThruFolderReadWriteJoinedCount](self, "totalNotesCollabThruFolderReadWriteJoinedCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ICASCollabNotesItemData totalNotesCollabThruFolderReadWriteJoinedCount](self, "totalNotesCollabThruFolderReadWriteJoinedCount");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v27[3] = v8;
  v26[4] = CFSTR("totalNotesNotCollabCount");
  -[ICASCollabNotesItemData totalNotesNotCollabCount](self, "totalNotesNotCollabCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ICASCollabNotesItemData totalNotesNotCollabCount](self, "totalNotesNotCollabCount");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_opt_new();
  }
  v12 = (void *)v11;
  v27[4] = v11;
  v26[5] = CFSTR("totalNotesCollabRootOwnedCount");
  -[ICASCollabNotesItemData totalNotesCollabRootOwnedCount](self, "totalNotesCollabRootOwnedCount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[ICASCollabNotesItemData totalNotesCollabRootOwnedCount](self, "totalNotesCollabRootOwnedCount");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_opt_new();
  }
  v15 = (void *)v14;
  v27[5] = v14;
  v26[6] = CFSTR("totalNotesCollabThruFolderOwnedCount");
  -[ICASCollabNotesItemData totalNotesCollabThruFolderOwnedCount](self, "totalNotesCollabThruFolderOwnedCount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[ICASCollabNotesItemData totalNotesCollabThruFolderOwnedCount](self, "totalNotesCollabThruFolderOwnedCount");
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

- (NSNumber)totalNotesCollabRootReadOnlyCount
{
  return self->_totalNotesCollabRootReadOnlyCount;
}

- (NSNumber)totalNotesCollabThruFolderReadOnlyCount
{
  return self->_totalNotesCollabThruFolderReadOnlyCount;
}

- (NSNumber)totalNotesCollabRootReadWriteJoinedCount
{
  return self->_totalNotesCollabRootReadWriteJoinedCount;
}

- (NSNumber)totalNotesCollabThruFolderReadWriteJoinedCount
{
  return self->_totalNotesCollabThruFolderReadWriteJoinedCount;
}

- (NSNumber)totalNotesNotCollabCount
{
  return self->_totalNotesNotCollabCount;
}

- (NSNumber)totalNotesCollabRootOwnedCount
{
  return self->_totalNotesCollabRootOwnedCount;
}

- (NSNumber)totalNotesCollabThruFolderOwnedCount
{
  return self->_totalNotesCollabThruFolderOwnedCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalNotesCollabThruFolderOwnedCount, 0);
  objc_storeStrong((id *)&self->_totalNotesCollabRootOwnedCount, 0);
  objc_storeStrong((id *)&self->_totalNotesNotCollabCount, 0);
  objc_storeStrong((id *)&self->_totalNotesCollabThruFolderReadWriteJoinedCount, 0);
  objc_storeStrong((id *)&self->_totalNotesCollabRootReadWriteJoinedCount, 0);
  objc_storeStrong((id *)&self->_totalNotesCollabThruFolderReadOnlyCount, 0);
  objc_storeStrong((id *)&self->_totalNotesCollabRootReadOnlyCount, 0);
}

@end
