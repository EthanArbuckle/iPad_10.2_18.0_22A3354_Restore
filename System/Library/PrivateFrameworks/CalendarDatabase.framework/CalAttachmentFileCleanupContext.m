@implementation CalAttachmentFileCleanupContext

- (CalAttachmentFileCleanupContext)initWithStore:(void *)a3
{
  CalAttachmentFileCleanupContext *v4;
  const void *v5;
  uint64_t v6;
  NSURL *storeAttachmentContainer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CalAttachmentFileCleanupContext;
  v4 = -[CalAttachmentFileCleanupContext init](&v9, sel_init);
  if (v4)
  {
    v5 = CalCopyDatabaseForRecord();
    _CalAttachmentFileCopyAttachmentContainerForStore((uint64_t)a3, (uint64_t)v5);
    v6 = objc_claimAutoreleasedReturnValue();
    storeAttachmentContainer = v4->_storeAttachmentContainer;
    v4->_storeAttachmentContainer = (NSURL *)v6;

    if (v5)
      CFRelease(v5);
  }
  return v4;
}

- (CalAttachmentFileCleanupContext)initWithExternalID:(id)a3 storeUUID:(id)a4 database:(CalDatabase *)a5
{
  id v8;
  id v9;
  CalAttachmentFileCleanupContext *v10;
  uint64_t v11;
  NSURL *storeAttachmentContainer;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CalAttachmentFileCleanupContext;
  v10 = -[CalAttachmentFileCleanupContext init](&v14, sel_init);
  if (v10)
  {
    _CalAttachmentFileCopyAttachmentContainerForStoreProperties(v8, v9, (uint64_t)a5);
    v11 = objc_claimAutoreleasedReturnValue();
    storeAttachmentContainer = v10->_storeAttachmentContainer;
    v10->_storeAttachmentContainer = (NSURL *)v11;

  }
  return v10;
}

- (void)addAttachmentToDelete:(id)a3
{
  id v4;
  NSMutableArray *attachmentUUIDsToDelete;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (!self->_deleteEntireContainer)
  {
    attachmentUUIDsToDelete = self->_attachmentUUIDsToDelete;
    v8 = v4;
    if (!attachmentUUIDsToDelete)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_attachmentUUIDsToDelete;
      self->_attachmentUUIDsToDelete = v6;

      attachmentUUIDsToDelete = self->_attachmentUUIDsToDelete;
    }
    -[NSMutableArray addObject:](attachmentUUIDsToDelete, "addObject:", v8);
    v4 = v8;
  }

}

- (void)markStoreAsDeleted
{
  NSMutableArray *attachmentUUIDsToDelete;

  self->_deleteEntireContainer = 1;
  attachmentUUIDsToDelete = self->_attachmentUUIDsToDelete;
  self->_attachmentUUIDsToDelete = 0;

}

- (void)cleanup
{
  void *v3;
  void *v4;
  NSURL *storeAttachmentContainer;
  char v6;
  uint64_t v7;
  NSURL *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSURL *v18;
  char v19;
  NSMutableArray *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  uint32_t v25;
  NSURL *v26;
  __int128 v27;
  NSMutableArray *obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  NSURL *v37;
  __int16 v38;
  NSMutableArray *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_deleteEntireContainer)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = self->_attachmentUUIDsToDelete;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (!v13)
      goto LABEL_22;
    v15 = v13;
    v16 = *(_QWORD *)v31;
    *(_QWORD *)&v14 = 138412546;
    v27 = v14;
LABEL_7:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v16)
        objc_enumerationMutation(obj);
      -[NSURL URLByAppendingPathComponent:](self->_storeAttachmentContainer, "URLByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v17), v27);
      v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v19 = objc_msgSend(v4, "removeItemAtURL:error:", v18, &v29);
      v20 = (NSMutableArray *)v29;
      v21 = CDBLogHandle;
      if ((v19 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v18;
          v22 = v21;
          v23 = OS_LOG_TYPE_DEFAULT;
          v24 = "Deleted attachment at path %@";
          v25 = 12;
LABEL_15:
          _os_log_impl(&dword_1A5CCB000, v22, v23, v24, buf, v25);
        }
      }
      else if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v27;
        v37 = v18;
        v38 = 2112;
        v39 = v20;
        v22 = v21;
        v23 = OS_LOG_TYPE_ERROR;
        v24 = "Failed to delete attachment at path %@: %@";
        v25 = 22;
        goto LABEL_15;
      }

      if (v15 == ++v17)
      {
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (!v15)
          goto LABEL_22;
        goto LABEL_7;
      }
    }
  }
  storeAttachmentContainer = self->_storeAttachmentContainer;
  v34 = 0;
  v6 = objc_msgSend(v3, "removeItemAtURL:error:", storeAttachmentContainer, &v34);
  obj = (NSMutableArray *)v34;
  v7 = CDBLogHandle;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_storeAttachmentContainer;
      *(_DWORD *)buf = 138412290;
      v37 = v8;
      v9 = "Deleted attachments for deleted store at path %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_21:
      _os_log_impl(&dword_1A5CCB000, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
  {
    v26 = self->_storeAttachmentContainer;
    *(_DWORD *)buf = 138412546;
    v37 = v26;
    v38 = 2112;
    v39 = obj;
    v9 = "Failed to delete attachments for deleted store at path %@: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_21;
  }
LABEL_22:

}

- (id)description
{
  void *v3;
  void *v4;
  NSURL *storeAttachmentContainer;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)CalAttachmentFileCleanupContext;
  -[CalAttachmentFileCleanupContext description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  storeAttachmentContainer = self->_storeAttachmentContainer;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleteEntireContainer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@], _storeAttachmentContainer: [%@], _deleteEntireContainer: [%@], _attachmentUUIDsToDelete: [%@]"), v4, storeAttachmentContainer, v6, self->_attachmentUUIDsToDelete);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentUUIDsToDelete, 0);
  objc_storeStrong((id *)&self->_storeAttachmentContainer, 0);
}

@end
