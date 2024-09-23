@implementation MCMManagedPath

- (MCMManagedPath)initWithURL:(id)a3 flags:(unint64_t)a4 ACLConfig:(unint64_t)a5 mode:(unsigned __int16)a6 dpClass:(int)a7 owner:(id)a8 parent:(id)a9
{
  id v15;
  id v16;
  id v17;
  MCMManagedPath *v18;
  MCMManagedPath *v19;
  MCMFSNode *fsNode;
  objc_super v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a8;
  v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)MCMManagedPath;
  v18 = -[MCMManagedPath init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_url, a3);
    v19->_flags = a4;
    v19->_ACLConfig = a5;
    v19->_mode = a6;
    v19->_dpClass = a7;
    objc_storeStrong((id *)&v19->_owner, a8);
    objc_storeStrong((id *)&v19->_parent, a9);
    fsNode = v19->_fsNode;
    v19->_fsNode = 0;

  }
  return v19;
}

- (id)managedPathByAppendingPathComponent:(id)a3 flags:(unint64_t)a4 ACLConfig:(unint64_t)a5 mode:(unsigned __int16)a6 dpClass:(int)a7 owner:(id)a8
{
  uint64_t v8;
  uint64_t v9;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = *(_QWORD *)&a7;
  v9 = a6;
  v14 = a8;
  v15 = a3;
  -[MCMManagedPath url](self, "url");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", v15, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:", v17, a4, a5, v9, v8, v14, self);
  return v18;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_url, "hash");
}

- (BOOL)isEqualToManagedPath:(id)a3
{
  return -[NSURL isEqual:](self->_url, "isEqual:", *((_QWORD *)a3 + 2));
}

- (BOOL)isEqual:(id)a3
{
  MCMManagedPath *v4;
  BOOL v5;

  v4 = (MCMManagedPath *)a3;
  v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[MCMManagedPath isEqualToManagedPath:](self, "isEqualToManagedPath:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    *(_QWORD *)(v5 + 24) = self->_flags;
    *(_QWORD *)(v5 + 32) = self->_ACLConfig;
    *(_WORD *)(v5 + 8) = self->_mode;
    *(_DWORD *)(v5 + 12) = self->_dpClass;
    v8 = -[MCMPOSIXUser copyWithZone:](self->_owner, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    objc_storeStrong((id *)(v5 + 48), self->_parent);
    v10 = -[MCMFSNode copyWithZone:](self->_fsNode, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v10;

  }
  return (id)v5;
}

- (NSString)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__MCMManagedPath_description__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (NSURL)url
{
  return self->_url;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (unint64_t)ACLConfig
{
  return self->_ACLConfig;
}

- (unsigned)mode
{
  return self->_mode;
}

- (int)dpClass
{
  return self->_dpClass;
}

- (MCMPOSIXUser)owner
{
  return self->_owner;
}

- (MCMManagedPath)parent
{
  return self->_parent;
}

- (MCMFSNode)fsNode
{
  return self->_fsNode;
}

- (void)setFsNode:(id)a3
{
  objc_storeStrong((id *)&self->_fsNode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsNode, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

id __29__MCMManagedPath_description__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v29 = objc_msgSend(v7, "flags");
  v28 = objc_msgSend(*(id *)(a1 + 32), "ACLConfig");
  v27 = objc_msgSend(*(id *)(a1 + 32), "mode");
  v26 = objc_msgSend(*(id *)(a1 + 32), "dpClass");
  objc_msgSend(*(id *)(a1 + 32), "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = (uint64_t)v8;
  if (a2)
  {
    objc_msgSend(v8, "redactedDescription");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fsNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v12, "redactedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "redactedDescription");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v4;
    v20 = v9;
    v21 = v6;
    v22 = (void *)v18;
    objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p; flags = 0x%lx, ACLConfig = 0x%lx, mode = 0%o, dpClass = %d, owner = %@, parent = %p, fsNode = %@, url = [%@]>"),
      v21,
      v16,
      v29,
      v28,
      v27,
      v26,
      v10,
      v11,
      v14,
      v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v21;
    v9 = v20;

    v24 = v13;
    v13 = v11;
    v11 = (void *)v10;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "url");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; flags = 0x%lx, ACLConfig = 0x%lx, mode = 0%o, dpClass = %d, owner = %@, parent = %p, fsNode = %@, url = [%@]>"),
      v6,
      v7,
      v29,
      v28,
      v27,
      v26,
      v10,
      v11,
      v13,
      v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

@end
