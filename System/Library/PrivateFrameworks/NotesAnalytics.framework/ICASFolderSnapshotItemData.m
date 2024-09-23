@implementation ICASFolderSnapshotItemData

- (ICASFolderSnapshotItemData)initWithFolderID:(id)a3 collaborationStatus:(id)a4 collaborationType:(id)a5 countOfInvitees:(id)a6 countOfAcceptances:(id)a7 directNoteCount:(id)a8 totalNoteCount:(id)a9 folderType:(id)a10 folderLabelType:(id)a11
{
  id v18;
  ICASFolderSnapshotItemData *v19;
  ICASFolderSnapshotItemData *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)ICASFolderSnapshotItemData;
  v19 = -[ICASFolderSnapshotItemData init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_folderID, a3);
    objc_storeStrong((id *)&v20->_collaborationStatus, a4);
    objc_storeStrong((id *)&v20->_collaborationType, a5);
    objc_storeStrong((id *)&v20->_countOfInvitees, a6);
    objc_storeStrong((id *)&v20->_countOfAcceptances, a7);
    objc_storeStrong((id *)&v20->_directNoteCount, a8);
    objc_storeStrong((id *)&v20->_totalNoteCount, a9);
    objc_storeStrong((id *)&v20->_folderType, a10);
    objc_storeStrong((id *)&v20->_folderLabelType, a11);
  }

  return v20;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("FolderSnapshotItemData");
}

- (id)toDict
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[9];
  _QWORD v33[11];

  v33[9] = *MEMORY[0x1E0C80C00];
  v32[0] = CFSTR("folderID");
  -[ICASFolderSnapshotItemData folderID](self, "folderID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[ICASFolderSnapshotItemData folderID](self, "folderID");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v30 = (void *)v3;
  v33[0] = v3;
  v32[1] = CFSTR("collaborationStatus");
  -[ICASFolderSnapshotItemData collaborationStatus](self, "collaborationStatus");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[ICASFolderSnapshotItemData collaborationStatus](self, "collaborationStatus");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v28 = (void *)v4;
  v33[1] = v4;
  v32[2] = CFSTR("collaborationType");
  -[ICASFolderSnapshotItemData collaborationType](self, "collaborationType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[ICASFolderSnapshotItemData collaborationType](self, "collaborationType");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v26 = (void *)v5;
  v33[2] = v5;
  v32[3] = CFSTR("countOfInvitees");
  -[ICASFolderSnapshotItemData countOfInvitees](self, "countOfInvitees");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[ICASFolderSnapshotItemData countOfInvitees](self, "countOfInvitees");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v24 = (void *)v6;
  v33[3] = v6;
  v32[4] = CFSTR("countOfAcceptances");
  -[ICASFolderSnapshotItemData countOfAcceptances](self, "countOfAcceptances");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[ICASFolderSnapshotItemData countOfAcceptances](self, "countOfAcceptances");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v33[4] = v7;
  v32[5] = CFSTR("directNoteCount");
  -[ICASFolderSnapshotItemData directNoteCount](self, "directNoteCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASFolderSnapshotItemData directNoteCount](self, "directNoteCount");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v33[5] = v10;
  v32[6] = CFSTR("totalNoteCount");
  -[ICASFolderSnapshotItemData totalNoteCount](self, "totalNoteCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASFolderSnapshotItemData totalNoteCount](self, "totalNoteCount");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v33[6] = v13;
  v32[7] = CFSTR("folderType");
  -[ICASFolderSnapshotItemData folderType](self, "folderType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[ICASFolderSnapshotItemData folderType](self, "folderType");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_opt_new();
  }
  v17 = (void *)v16;
  v33[7] = v16;
  v32[8] = CFSTR("folderLabelType");
  -[ICASFolderSnapshotItemData folderLabelType](self, "folderLabelType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[ICASFolderSnapshotItemData folderLabelType](self, "folderLabelType");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = objc_opt_new();
  }
  v20 = (void *)v19;
  v33[8] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSString)folderID
{
  return self->_folderID;
}

- (ICASCollaborationStatus)collaborationStatus
{
  return self->_collaborationStatus;
}

- (ICASCollaborationType)collaborationType
{
  return self->_collaborationType;
}

- (NSNumber)countOfInvitees
{
  return self->_countOfInvitees;
}

- (NSNumber)countOfAcceptances
{
  return self->_countOfAcceptances;
}

- (NSNumber)directNoteCount
{
  return self->_directNoteCount;
}

- (NSNumber)totalNoteCount
{
  return self->_totalNoteCount;
}

- (ICASFolderType)folderType
{
  return self->_folderType;
}

- (ICASFolderLabelType)folderLabelType
{
  return self->_folderLabelType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderLabelType, 0);
  objc_storeStrong((id *)&self->_folderType, 0);
  objc_storeStrong((id *)&self->_totalNoteCount, 0);
  objc_storeStrong((id *)&self->_directNoteCount, 0);
  objc_storeStrong((id *)&self->_countOfAcceptances, 0);
  objc_storeStrong((id *)&self->_countOfInvitees, 0);
  objc_storeStrong((id *)&self->_collaborationType, 0);
  objc_storeStrong((id *)&self->_collaborationStatus, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
}

@end
