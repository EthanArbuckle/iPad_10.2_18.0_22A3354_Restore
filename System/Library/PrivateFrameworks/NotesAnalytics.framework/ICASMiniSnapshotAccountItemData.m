@implementation ICASMiniSnapshotAccountItemData

- (ICASMiniSnapshotAccountItemData)initWithCountofNotes:(id)a3 counfOfFolders:(id)a4 countOfAttachments:(id)a5 privateAccountID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICASMiniSnapshotAccountItemData *v15;
  ICASMiniSnapshotAccountItemData *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASMiniSnapshotAccountItemData;
  v15 = -[ICASMiniSnapshotAccountItemData init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_countofNotes, a3);
    objc_storeStrong((id *)&v16->_counfOfFolders, a4);
    objc_storeStrong((id *)&v16->_countOfAttachments, a5);
    objc_storeStrong((id *)&v16->_privateAccountID, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("MiniSnapshotAccountItemData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("countofNotes");
  -[ICASMiniSnapshotAccountItemData countofNotes](self, "countofNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASMiniSnapshotAccountItemData countofNotes](self, "countofNotes");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = CFSTR("counfOfFolders");
  -[ICASMiniSnapshotAccountItemData counfOfFolders](self, "counfOfFolders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASMiniSnapshotAccountItemData counfOfFolders](self, "counfOfFolders");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = CFSTR("countOfAttachments");
  -[ICASMiniSnapshotAccountItemData countOfAttachments](self, "countOfAttachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASMiniSnapshotAccountItemData countOfAttachments](self, "countOfAttachments");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = CFSTR("privateAccountID");
  -[ICASMiniSnapshotAccountItemData privateAccountID](self, "privateAccountID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASMiniSnapshotAccountItemData privateAccountID](self, "privateAccountID");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v18[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSNumber)countofNotes
{
  return self->_countofNotes;
}

- (NSNumber)counfOfFolders
{
  return self->_counfOfFolders;
}

- (NSNumber)countOfAttachments
{
  return self->_countOfAttachments;
}

- (NSString)privateAccountID
{
  return self->_privateAccountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateAccountID, 0);
  objc_storeStrong((id *)&self->_countOfAttachments, 0);
  objc_storeStrong((id *)&self->_counfOfFolders, 0);
  objc_storeStrong((id *)&self->_countofNotes, 0);
}

@end
