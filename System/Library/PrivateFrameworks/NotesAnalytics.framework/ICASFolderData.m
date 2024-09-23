@implementation ICASFolderData

- (ICASFolderData)initWithFolderID:(id)a3 folderType:(id)a4 folderLabelType:(id)a5 subFolderLevel:(id)a6 collaborationStatus:(id)a7 collaborationType:(id)a8
{
  id v15;
  id v16;
  id v17;
  ICASFolderData *v18;
  ICASFolderData *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ICASFolderData;
  v18 = -[ICASFolderData init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_folderID, a3);
    objc_storeStrong((id *)&v19->_folderType, a4);
    objc_storeStrong((id *)&v19->_folderLabelType, a5);
    objc_storeStrong((id *)&v19->_subFolderLevel, a6);
    objc_storeStrong((id *)&v19->_collaborationStatus, a7);
    objc_storeStrong((id *)&v19->_collaborationType, a8);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("FolderData");
}

- (id)toDict
{
  uint64_t v3;
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
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("folderID");
  -[ICASFolderData folderID](self, "folderID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[ICASFolderData folderID](self, "folderID");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v22 = (void *)v3;
  v25[0] = v3;
  v24[1] = CFSTR("folderType");
  -[ICASFolderData folderType](self, "folderType");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[ICASFolderData folderType](self, "folderType", v20);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v25[1] = v4;
  v24[2] = CFSTR("folderLabelType");
  -[ICASFolderData folderLabelType](self, "folderLabelType", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASFolderData folderLabelType](self, "folderLabelType");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v25[2] = v7;
  v24[3] = CFSTR("subFolderLevel");
  -[ICASFolderData subFolderLevel](self, "subFolderLevel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASFolderData subFolderLevel](self, "subFolderLevel");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v25[3] = v10;
  v24[4] = CFSTR("collaborationStatus");
  -[ICASFolderData collaborationStatus](self, "collaborationStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASFolderData collaborationStatus](self, "collaborationStatus");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v25[4] = v13;
  v24[5] = CFSTR("collaborationType");
  -[ICASFolderData collaborationType](self, "collaborationType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[ICASFolderData collaborationType](self, "collaborationType");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_opt_new();
  }
  v17 = (void *)v16;
  v25[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)folderID
{
  return self->_folderID;
}

- (ICASFolderType)folderType
{
  return self->_folderType;
}

- (ICASFolderLabelType)folderLabelType
{
  return self->_folderLabelType;
}

- (NSNumber)subFolderLevel
{
  return self->_subFolderLevel;
}

- (ICASCollaborationStatus)collaborationStatus
{
  return self->_collaborationStatus;
}

- (ICASCollaborationType)collaborationType
{
  return self->_collaborationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationType, 0);
  objc_storeStrong((id *)&self->_collaborationStatus, 0);
  objc_storeStrong((id *)&self->_subFolderLevel, 0);
  objc_storeStrong((id *)&self->_folderLabelType, 0);
  objc_storeStrong((id *)&self->_folderType, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
}

@end
