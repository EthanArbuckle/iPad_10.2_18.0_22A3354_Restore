@implementation _MFDADeferredDeleteMailboxOperation

- (_MFDADeferredDeleteMailboxOperation)initWithCoder:(id)a3
{
  id v4;
  _MFDADeferredDeleteMailboxOperation *v5;
  uint64_t v6;
  NSString *folderID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MFDADeferredDeleteMailboxOperation;
  v5 = -[_MFDADeferredDeleteMailboxOperation init](&v9, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
      __assert_rtn("-[_MFDADeferredDeleteMailboxOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 803, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FolderID"));
    v6 = objc_claimAutoreleasedReturnValue();
    folderID = v5->_folderID;
    v5->_folderID = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[_MFDADeferredDeleteMailboxOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 812, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\");
  objc_msgSend(v4, "encodeObject:forKey:", self->_folderID, CFSTR("FolderID"));

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
  v7.super_class = (Class)_MFDADeferredDeleteMailboxOperation;
  -[_MFDADeferredDeleteMailboxOperation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ folder-id \"%@\"), v4, self->_folderID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderID, 0);
}

@end
