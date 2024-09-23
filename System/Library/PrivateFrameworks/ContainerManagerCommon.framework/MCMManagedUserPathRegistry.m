@implementation MCMManagedUserPathRegistry

- (MCMManagedUserPathRegistry)initWithUserIdentity:(id)a3 daemonUser:(id)a4
{
  id v7;
  MCMManagedUserPathRegistry *v8;
  MCMManagedUserPathRegistry *v9;
  void *v10;
  MCMManagedPath *containermanagerUserPendingUpdates;
  MCMManagedPath *containermanagerUserReplaceOperations;
  MCMManagedPath *containermanagerUserDeleteOperations;
  void *v14;
  objc_super v16;
  _QWORD v17[4];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MCMManagedUserPathRegistry;
  v8 = -[MCMManagedPathRegistry initWithDaemonUser:privileged:](&v16, sel_initWithDaemonUser_privileged_, a4, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userIdentity, a3);
    -[MCMManagedUserPathRegistry _initPathPropertiesWithUserIdentity:](v9, "_initPathPropertiesWithUserIdentity:", v7);
    v18[0] = v9->_userHome;
    v18[1] = v9->_userLibrary;
    v18[2] = v9->_userCaches;
    v18[3] = v9->_containermanagerUserCaches;
    v18[4] = v9->_containermanagerUserDeathrow;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMManagedPathRegistry _addPaths:](v9, "_addPaths:", v10);

    if (v9->_containermanagerUserLibrary)
    {
      containermanagerUserPendingUpdates = v9->_containermanagerUserPendingUpdates;
      if (containermanagerUserPendingUpdates)
      {
        containermanagerUserReplaceOperations = v9->_containermanagerUserReplaceOperations;
        if (containermanagerUserReplaceOperations)
        {
          containermanagerUserDeleteOperations = v9->_containermanagerUserDeleteOperations;
          if (containermanagerUserDeleteOperations)
          {
            v17[0] = v9->_containermanagerUserLibrary;
            v17[1] = containermanagerUserPendingUpdates;
            v17[2] = containermanagerUserReplaceOperations;
            v17[3] = containermanagerUserDeleteOperations;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[MCMManagedPathRegistry _addPaths:](v9, "_addPaths:", v14);

          }
        }
      }
    }
  }

  return v9;
}

- (void)_initPathPropertiesWithUserIdentity:(id)a3
{
  id v4;
  void *v5;
  MCMManagedPath *v6;
  MCMManagedPath *userHome;
  MCMManagedPath *v8;
  MCMManagedPath *userLibrary;
  uint64_t v10;
  MCMManagedPath *v11;
  MCMManagedPath *userCaches;
  MCMManagedPath *v13;
  MCMManagedPath *containermanagerUserCaches;
  MCMManagedPath *v15;
  MCMManagedPath *containermanagerUserDeathrow;
  MCMManagedPath *containermanagerUserLibrary;
  MCMManagedPath *containermanagerUserPendingUpdates;
  MCMManagedPath *containermanagerUserReplaceOperations;
  MCMManagedPath *containermanagerUserDeleteOperations;
  char v21;
  MCMManagedPath *v22;
  MCMManagedPath *v23;
  MCMManagedPath *v24;
  MCMManagedPath *v25;
  MCMManagedPath *v26;
  MCMManagedPath *v27;
  MCMManagedPath *v28;
  MCMManagedPath *v29;
  id v30;

  v4 = a3;
  objc_msgSend(v4, "homeDirectoryURL");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posixUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMManagedPath initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:]([MCMManagedPath alloc], "initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:", v30, 0, 0, 493, 0xFFFFFFFFLL, v5, 0);
  userHome = self->_userHome;
  self->_userHome = v6;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_userHome, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("Library"), 2, 2, 493, 0xFFFFFFFFLL, v5);
  v8 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  userLibrary = self->_userLibrary;
  self->_userLibrary = v8;

  if (objc_msgSend(v4, "isDataSeparated"))
    v10 = 2;
  else
    v10 = 0;
  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_userLibrary, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("Caches"), v10, 2, 493, 0xFFFFFFFFLL, v5);
  v11 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  userCaches = self->_userCaches;
  self->_userCaches = v11;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_userCaches, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("com.apple.containermanagerd"), 3, 1, 493, 4, v5);
  v13 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerUserCaches = self->_containermanagerUserCaches;
  self->_containermanagerUserCaches = v13;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_containermanagerUserCaches, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("Dead"), 7, 1, 493, 4, v5);
  v15 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerUserDeathrow = self->_containermanagerUserDeathrow;
  self->_containermanagerUserDeathrow = v15;

  containermanagerUserLibrary = self->_containermanagerUserLibrary;
  self->_containermanagerUserLibrary = 0;

  containermanagerUserPendingUpdates = self->_containermanagerUserPendingUpdates;
  self->_containermanagerUserPendingUpdates = 0;

  containermanagerUserReplaceOperations = self->_containermanagerUserReplaceOperations;
  self->_containermanagerUserReplaceOperations = 0;

  containermanagerUserDeleteOperations = self->_containermanagerUserDeleteOperations;
  self->_containermanagerUserDeleteOperations = 0;

  v21 = objc_msgSend(v4, "isDataSeparated");
  if ((v21 & 1) == 0)
  {
    -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_userLibrary, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("MobileContainerManager"), 7, 1, 493, 4, v5);
    v22 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
    v23 = self->_containermanagerUserLibrary;
    self->_containermanagerUserLibrary = v22;

    -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_containermanagerUserLibrary, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("PendingUpdates"), 7, 1, 493, 4, v5);
    v24 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
    v25 = self->_containermanagerUserPendingUpdates;
    self->_containermanagerUserPendingUpdates = v24;

    -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_containermanagerUserLibrary, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("Replace"), 7, 1, 493, 4, v5);
    v26 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
    v27 = self->_containermanagerUserReplaceOperations;
    self->_containermanagerUserReplaceOperations = v26;

    -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_containermanagerUserLibrary, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("Delete"), 7, 1, 493, 4, v5);
    v28 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
    v29 = self->_containermanagerUserDeleteOperations;
    self->_containermanagerUserDeleteOperations = v28;

  }
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (MCMManagedPath)userHome
{
  return self->_userHome;
}

- (MCMManagedPath)userLibrary
{
  return self->_userLibrary;
}

- (MCMManagedPath)userCaches
{
  return self->_userCaches;
}

- (MCMManagedPath)containermanagerUserCaches
{
  return self->_containermanagerUserCaches;
}

- (MCMManagedPath)containermanagerUserDeathrow
{
  return self->_containermanagerUserDeathrow;
}

- (MCMManagedPath)containermanagerUserLibrary
{
  return self->_containermanagerUserLibrary;
}

- (MCMManagedPath)containermanagerUserPendingUpdates
{
  return self->_containermanagerUserPendingUpdates;
}

- (MCMManagedPath)containermanagerUserReplaceOperations
{
  return self->_containermanagerUserReplaceOperations;
}

- (MCMManagedPath)containermanagerUserDeleteOperations
{
  return self->_containermanagerUserDeleteOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containermanagerUserDeleteOperations, 0);
  objc_storeStrong((id *)&self->_containermanagerUserReplaceOperations, 0);
  objc_storeStrong((id *)&self->_containermanagerUserPendingUpdates, 0);
  objc_storeStrong((id *)&self->_containermanagerUserLibrary, 0);
  objc_storeStrong((id *)&self->_containermanagerUserDeathrow, 0);
  objc_storeStrong((id *)&self->_containermanagerUserCaches, 0);
  objc_storeStrong((id *)&self->_userCaches, 0);
  objc_storeStrong((id *)&self->_userLibrary, 0);
  objc_storeStrong((id *)&self->_userHome, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

@end
