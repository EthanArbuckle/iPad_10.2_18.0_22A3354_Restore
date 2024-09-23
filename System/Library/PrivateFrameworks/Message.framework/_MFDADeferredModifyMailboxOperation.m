@implementation _MFDADeferredModifyMailboxOperation

- (_MFDADeferredModifyMailboxOperation)initWithFolderID:(id)a3 newParentFolderID:(id)a4 newDisplayName:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MFDADeferredModifyMailboxOperation *v11;
  uint64_t v12;
  NSString *folderID;
  uint64_t v14;
  NSString *newParentFolderID;
  uint64_t v16;
  NSString *newDisplayName;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_MFDADeferredModifyMailboxOperation;
  v11 = -[_MFDADeferredModifyMailboxOperation init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    folderID = v11->_folderID;
    v11->_folderID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    newParentFolderID = v11->_newParentFolderID;
    v11->_newParentFolderID = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    newDisplayName = v11->_newDisplayName;
    v11->_newDisplayName = (NSString *)v16;

  }
  return v11;
}

- (_MFDADeferredModifyMailboxOperation)initWithCoder:(id)a3
{
  id v4;
  _MFDADeferredModifyMailboxOperation *v5;
  uint64_t v6;
  NSString *folderID;
  uint64_t v8;
  NSString *newParentFolderID;
  uint64_t v10;
  NSString *newDisplayName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MFDADeferredModifyMailboxOperation;
  v5 = -[_MFDADeferredModifyMailboxOperation init](&v13, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
      __assert_rtn("-[_MFDADeferredModifyMailboxOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 853, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FolderID"));
    v6 = objc_claimAutoreleasedReturnValue();
    folderID = v5->_folderID;
    v5->_folderID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NewParentFolderID"));
    v8 = objc_claimAutoreleasedReturnValue();
    newParentFolderID = v5->_newParentFolderID;
    v5->_newParentFolderID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NewDisplayName"));
    v10 = objc_claimAutoreleasedReturnValue();
    newDisplayName = v5->_newDisplayName;
    v5->_newDisplayName = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[_MFDADeferredModifyMailboxOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 864, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\");
  objc_msgSend(v4, "encodeObject:forKey:", self->_folderID, CFSTR("FolderID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_newParentFolderID, CFSTR("NewParentFolderID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_newDisplayName, CFSTR("NewDisplayName"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)translateToLocalActionWithConnection:(id)a3
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_MFDADeferredModifyMailboxOperation;
  -[_MFDADeferredModifyMailboxOperation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ folder-id \"%@\", new-parent-folder-id \"%@\", new-display-name \"%@\"), v4, self->_folderID, self->_newParentFolderID, self->_newDisplayName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newDisplayName, 0);
  objc_storeStrong((id *)&self->_newParentFolderID, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
}

@end
