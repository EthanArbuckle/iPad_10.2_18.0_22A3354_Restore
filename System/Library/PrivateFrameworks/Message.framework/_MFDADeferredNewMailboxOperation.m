@implementation _MFDADeferredNewMailboxOperation

- (_MFDADeferredNewMailboxOperation)initWithCoder:(id)a3
{
  id v4;
  _MFDADeferredNewMailboxOperation *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  NSString *parentFolderID;
  uint64_t v10;
  NSString *temporaryFolderID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MFDADeferredNewMailboxOperation;
  v5 = -[_MFDADeferredNewMailboxOperation init](&v13, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
      __assert_rtn("-[_MFDADeferredNewMailboxOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 762, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisplayName"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ParentFolderID"));
    v8 = objc_claimAutoreleasedReturnValue();
    parentFolderID = v5->_parentFolderID;
    v5->_parentFolderID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TemporaryFolderID"));
    v10 = objc_claimAutoreleasedReturnValue();
    temporaryFolderID = v5->_temporaryFolderID;
    v5->_temporaryFolderID = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[_MFDADeferredNewMailboxOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 773, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\");
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayName, CFSTR("DisplayName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentFolderID, CFSTR("ParentFolderID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_temporaryFolderID, CFSTR("TemporaryFolderID"));

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
  v7.super_class = (Class)_MFDADeferredNewMailboxOperation;
  -[_MFDADeferredNewMailboxOperation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ display-name \"%@\", parent-folder-id \"%@\", temporary-folder-id \"%@\"), v4, self->_displayName, self->_parentFolderID, self->_temporaryFolderID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryFolderID, 0);
  objc_storeStrong((id *)&self->_parentFolderID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
