@implementation DEAttachmentGroup

+ (id)createWithName:(id)a3 rootURL:(id)a4
{
  id v5;
  id v6;
  DEAttachmentGroup *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  DEAttachmentItem *v16;
  DEAttachmentItem *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(DEAttachmentGroup);
  -[DEAttachmentItem setDisplayName:](v7, "setDisplayName:", v5);
  -[DEAttachmentGroup setRootURL:](v7, "setRootURL:", v6);
  +[DEUtils lsDir:](DEUtils, "lsDir:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14);
        v16 = [DEAttachmentItem alloc];
        v17 = -[DEAttachmentItem initWithPathURL:](v16, "initWithPathURL:", v15, (_QWORD)v22);
        objc_msgSend(v9, "addObject:", v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEAttachmentGroup setAttachmentItems:](v7, "setAttachmentItems:", v18);

  -[DEAttachmentItem setAttachmentType:](v7, "setAttachmentType:", CFSTR("DEAttachmentTypeGroup"));
  -[DEAttachmentItem displayName](v7, "displayName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEAttachmentItem setPath:](v7, "setPath:", v20);

  return v7;
}

+ (id)createWithName:(id)a3 rootURL:(id)a4 attachmentItems:(id)a5
{
  id v7;
  id v8;
  id v9;
  DEAttachmentGroup *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(DEAttachmentGroup);
  -[DEAttachmentItem setDisplayName:](v10, "setDisplayName:", v9);

  -[DEAttachmentGroup setRootURL:](v10, "setRootURL:", v8);
  -[DEAttachmentGroup setAttachmentItems:](v10, "setAttachmentItems:", v7);

  -[DEAttachmentItem setAttachmentType:](v10, "setAttachmentType:", CFSTR("DEAttachmentTypeGroup"));
  -[DEAttachmentItem displayName](v10, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEAttachmentItem setPath:](v10, "setPath:", v12);
  return v10;
}

- (DEAttachmentGroup)initWithCoder:(id)a3
{
  id v3;
  DEAttachmentGroup *v4;
  uint64_t v5;
  NSURL *rootURL;
  uint64_t v7;
  NSArray *attachmentItems;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DEAttachmentGroup;
  v3 = a3;
  v4 = -[DEAttachmentItem initWithCoder:](&v10, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("RootURL"), v10.receiver, v10.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  rootURL = v4->_rootURL;
  v4->_rootURL = (NSURL *)v5;

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("AttachmentItems"));
  v7 = objc_claimAutoreleasedReturnValue();

  attachmentItems = v4->_attachmentItems;
  v4->_attachmentItems = (NSArray *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DEAttachmentGroup;
  v4 = a3;
  -[DEAttachmentItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_rootURL, CFSTR("RootURL"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_attachmentItems, CFSTR("AttachmentItems"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)attachToDestinationDir:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[DELogging fwHandle](DELogging, "fwHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v50 = v4;
    _os_log_impl(&dword_1A4EEE000, v5, OS_LOG_TYPE_INFO, "Log destination directory: %{public}@", buf, 0xCu);
  }

  -[DEAttachmentItem displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[DEAttachmentItem displayName](self, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DEAttachmentGroup rootURL](self, "rootURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "URLByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEUtils createDirectoryWithClassCDataProtection:](DEUtils, "createDirectoryWithClassCDataProtection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[DEAttachmentGroup attachToDestinationDir:].cold.3((uint64_t)v9, v10, v11);
  }
  else
  {
    -[DEAttachmentItem setAttachedPath:](self, "setAttachedPath:", v9);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[DEAttachmentGroup attachmentItems](self, "attachmentItems", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v45 != v14)
            objc_enumerationMutation(v11);
          v16 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "attachToDestinationDir:", v9);
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v13);
    }
  }

  -[DEAttachmentItem attachedPath](self, "attachedPath");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[DEAttachmentItem deleteOnAttach](self, "deleteOnAttach");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v20)
    {
      +[DELogging fwHandle](DELogging, "fwHandle");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[DEAttachmentGroup attachToDestinationDir:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);

      -[DEAttachmentGroup rootURL](self, "rootURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[DEUtils removeFile:](DEUtils, "removeFile:", v29);

    }
  }
  -[DEAttachmentItem shouldCompress](self, "shouldCompress");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "BOOLValue");

  if (v31)
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[DEAttachmentGroup attachToDestinationDir:].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);

    -[DEAttachmentItem attachedPath](self, "attachedPath");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEArchiver archiveDirectoryAt:](DEArchiver, "archiveDirectoryAt:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEAttachmentItem setAttachedPath:](self, "setAttachedPath:", v41);

  }
  -[DEAttachmentItem attachedPath](self, "attachedPath");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (NSURL)rootURL
{
  return self->_rootURL;
}

- (void)setRootURL:(id)a3
{
  objc_storeStrong((id *)&self->_rootURL, a3);
}

- (NSArray)attachmentItems
{
  return self->_attachmentItems;
}

- (void)setAttachmentItems:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentItems, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
}

- (void)attachToDestinationDir:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A4EEE000, a1, a3, "will compress group", a5, a6, a7, a8, 0);
}

- (void)attachToDestinationDir:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A4EEE000, a1, a3, "will delete group after attaching", a5, a6, a7, a8, 0);
}

- (void)attachToDestinationDir:(NSObject *)a3 .cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1A4EEE000, a3, OS_LOG_TYPE_ERROR, "error creating group directory [%{public}@] with error [%{public}@]", (uint8_t *)&v6, 0x16u);

}

@end
