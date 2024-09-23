@implementation IMFileTransferCenter

- (void)acknowledgeAllPendingTransfers
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableSet copy](self->_pendingTransfers, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[IMFileTransferCenter _removePendingTransfer:](self, "_removePendingTransfer:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_removeAllActiveTransfers
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableSet copy](self->_activeTransfers, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[IMFileTransferCenter _removeActiveTransfer:](self, "_removeActiveTransfer:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_handleAllFileTransfers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMFileTransferCenter _clearTransfers](self, "_clearTransfers");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "fileTransferClass"));
        objc_msgSend(v11, "_updateWithDictionaryRepresentation:", v10);
        -[IMFileTransferCenter _addTransfer:](self, "_addTransfer:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferRefreshAllNotification"), v4);

}

- (void)_clearTransfers
{
  NSMutableDictionary *guidToTransferMap;
  NSMutableDictionary *guidToRemovedTransferMap;
  NSMutableDictionary *accountIDToTransferGUIDsMap;
  NSMutableArray *preauthorizedInfos;
  NSMutableArray *preauthorizedGUIDs;
  NSMutableSet *activeTransfers;
  NSMutableSet *pendingTransfers;

  -[IMFileTransferCenter _removeAllActiveTransfers](self, "_removeAllActiveTransfers");
  -[IMFileTransferCenter acknowledgeAllPendingTransfers](self, "acknowledgeAllPendingTransfers");
  -[NSMutableDictionary removeAllObjects](self->_guidToTransferMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_guidToRemovedTransferMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_accountIDToTransferGUIDsMap, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_preauthorizedInfos, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_preauthorizedGUIDs, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_activeTransfers, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_pendingTransfers, "removeAllObjects");
  if (!-[NSMutableDictionary count](self->_guidToTransferMap, "count"))
  {
    guidToTransferMap = self->_guidToTransferMap;
    self->_guidToTransferMap = 0;

  }
  if (!-[NSMutableDictionary count](self->_guidToRemovedTransferMap, "count"))
  {
    guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
    self->_guidToRemovedTransferMap = 0;

  }
  if (!-[NSMutableDictionary count](self->_accountIDToTransferGUIDsMap, "count"))
  {
    accountIDToTransferGUIDsMap = self->_accountIDToTransferGUIDsMap;
    self->_accountIDToTransferGUIDsMap = 0;

  }
  if (!-[NSMutableArray count](self->_preauthorizedInfos, "count"))
  {
    preauthorizedInfos = self->_preauthorizedInfos;
    self->_preauthorizedInfos = 0;

  }
  if (!-[NSMutableArray count](self->_preauthorizedGUIDs, "count"))
  {
    preauthorizedGUIDs = self->_preauthorizedGUIDs;
    self->_preauthorizedGUIDs = 0;

  }
  if (!-[NSMutableSet count](self->_activeTransfers, "count"))
  {
    activeTransfers = self->_activeTransfers;
    self->_activeTransfers = 0;

  }
  if (!-[NSMutableSet count](self->_pendingTransfers, "count"))
  {
    pendingTransfers = self->_pendingTransfers;
    self->_pendingTransfers = 0;

  }
}

- (void)_addTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *guidToTransferMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      guidToTransferMap = self->_guidToTransferMap;
      if (!guidToTransferMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v9 = self->_guidToTransferMap;
        self->_guidToTransferMap = Mutable;

        guidToTransferMap = self->_guidToTransferMap;
      }
      objc_msgSend(v5, "guid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](guidToTransferMap, "setObject:forKey:", v5, v10);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "guid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412290;
          v16 = v12;
          _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "_addTransfer: %@", (uint8_t *)&v15, 0xCu);

        }
      }
      objc_msgSend(v5, "accountID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        -[IMFileTransferCenter _addTransfer:toAccount:](self, "_addTransfer:toAccount:", v5, v13);
      if (!objc_msgSend(v5, "transferState"))
      {
        objc_msgSend(v5, "guid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMFileTransferCenter _addPendingTransfer:](self, "_addPendingTransfer:", v14);

      }
    }
  }

}

+ (Class)transferCenterClass
{
  if (qword_1EE65F470)
    return (Class)(id)qword_1EE65F470;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)sharedInstance
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)qword_1ECF12548;
  if (!qword_1ECF12548)
  {
    v4 = objc_alloc_init((Class)objc_msgSend(a1, "transferCenterClass"));
    v5 = (void *)qword_1ECF12548;
    qword_1ECF12548 = (uint64_t)v4;

    v3 = (void *)qword_1ECF12548;
  }
  return v3;
}

+ (Class)fileTransferClass
{
  return (Class)objc_opt_class();
}

+ (void)setTransferCenterClass:(Class)a3
{
  qword_1EE65F470 = (uint64_t)a3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)IMFileTransferCenter;
  -[IMFileTransferCenter dealloc](&v4, sel_dealloc);
}

- (BOOL)hasPendingFileTransfers
{
  return -[NSMutableSet count](self->_pendingTransfers, "count") != 0;
}

- (void)_addPendingTransfer:(id)a3
{
  id v4;
  NSMutableSet *pendingTransfers;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  pendingTransfers = self->_pendingTransfers;
  v8 = v4;
  if (!pendingTransfers)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_pendingTransfers;
    self->_pendingTransfers = v6;

    v4 = v8;
    pendingTransfers = self->_pendingTransfers;
  }
  -[NSMutableSet addObject:](pendingTransfers, "addObject:", v4);

}

- (void)_removePendingTransfer:(id)a3
{
  NSMutableSet *pendingTransfers;
  id v5;

  v5 = a3;
  if (-[NSMutableSet containsObject:](self->_pendingTransfers, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_pendingTransfers, "removeObject:", v5);
    if (!-[NSMutableSet count](self->_pendingTransfers, "count"))
    {
      pendingTransfers = self->_pendingTransfers;
      self->_pendingTransfers = 0;

    }
  }

}

- (BOOL)hasActiveFileTransfers
{
  return -[NSMutableSet count](self->_activeTransfers, "count") != 0;
}

- (void)_addActiveTransfer:(id)a3
{
  id v4;
  NSMutableSet *activeTransfers;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  activeTransfers = self->_activeTransfers;
  v8 = v4;
  if (!activeTransfers)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_activeTransfers;
    self->_activeTransfers = v6;

    v4 = v8;
    activeTransfers = self->_activeTransfers;
  }
  -[NSMutableSet addObject:](activeTransfers, "addObject:", v4);
  -[IMFileTransferCenter _removePendingTransfer:](self, "_removePendingTransfer:", v8);

}

- (void)_removeActiveTransfer:(id)a3
{
  NSMutableSet *activeTransfers;
  id v5;

  v5 = a3;
  if (-[NSMutableSet containsObject:](self->_activeTransfers, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_activeTransfers, "removeObject:", v5);
    if (!-[NSMutableSet count](self->_activeTransfers, "count"))
    {
      activeTransfers = self->_activeTransfers;
      self->_activeTransfers = 0;

    }
  }

}

- (BOOL)isActiveTransfer:(id)a3
{
  return -[NSMutableSet containsObject:](self->_activeTransfers, "containsObject:", a3);
}

- (void)_addTransfer:(id)a3 toAccount:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *accountIDToTransferGUIDsMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_accountIDToTransferGUIDsMap, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      accountIDToTransferGUIDsMap = self->_accountIDToTransferGUIDsMap;
      if (!accountIDToTransferGUIDsMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v10 = self->_accountIDToTransferGUIDsMap;
        self->_accountIDToTransferGUIDsMap = Mutable;

        accountIDToTransferGUIDsMap = self->_accountIDToTransferGUIDsMap;
      }
      -[NSMutableDictionary setObject:forKey:](accountIDToTransferGUIDsMap, "setObject:forKey:", v7, v6);
    }
    objc_msgSend(v12, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
}

- (BOOL)doesLocalURLRequireArchiving:(id)a3 toHandle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  char v13;
  uint64_t v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
  v8 = objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend((id)v8, "attributesOfItemAtPath:error:", v7, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(MEMORY[0x1E0D39848], "_doesLocalURLRequireArchiving:", v6);
  v10 = objc_msgSend(v5, "hasCapability:", 0x80000000000);

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB2B18]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0CB2B20]);

  if ((v8 & 1) != 0)
    v13 = 1;
  else
    v13 = v12 & (v10 ^ 1);

  return v13;
}

- (id)createNewOutgoingTransferWithLocalFileURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  IMTemporaryFileTransferGUIDForNewOutgoingTransfer();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFileTransferCenter _createNewOutgoingFileTransferWithTransferGUID:localFileURL:](self, "_createNewOutgoingFileTransferWithTransferGUID:localFileURL:", v5, v4);

  return v5;
}

- (id)createNewOutgoingGroupPhotoTransferWithLocalFileURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  IMTemporaryFileTransferGUIDForNewOutgoingTransfer();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFileTransferCenter _createNewOutgoingFileTransferWithTransferGUID:localFileURL:](self, "_createNewOutgoingFileTransferWithTransferGUID:localFileURL:", v6, v4);

  return v6;
}

- (void)_createNewOutgoingFileTransferWithTransferGUID:(id)a3 localFileURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = a4;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v8, "attributesOfItemAtPath:error:", v7, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v24;

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB2B18]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", *MEMORY[0x1E0CB2B20]);

  v12 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "fileTransferClass"));
  objc_msgSend(v7, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "fileSize");
  LODWORD(v8) = objc_msgSend(v9, "fileHFSTypeCode");
  LODWORD(v10) = objc_msgSend(v9, "fileHFSCreatorCode");
  BYTE2(v21) = 0;
  LOWORD(v21) = objc_msgSend(v9, "fileHFSFlags");
  v15 = (void *)objc_msgSend(v12, "_initWithGUID:filename:isDirectory:localURL:account:otherPerson:totalBytes:hfsType:hfsCreator:hfsFlags:isIncoming:", v23, v13, v11, v6, 0, 0, v14, __PAIR64__(v10, v8), v21);

  if (-[IMFileTransferCenter shouldIssueSandboxEstensionsForTransfers](self, "shouldIssueSandboxEstensionsForTransfers"))
  {
    v16 = objc_retainAutorelease(v7);
    objc_msgSend(v16, "UTF8String");
    v17 = (void *)sandbox_extension_issue_file();
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      free(v17);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = *__error();
          *(_DWORD *)buf = 138412546;
          v26 = v16;
          v27 = 1024;
          v28 = v20;
          _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Failed to issue sandbox extension for path %@, errno %d", buf, 0x12u);
        }

      }
      v18 = 0;
    }
    objc_msgSend(v15, "setSandboxToken:", v18);

  }
  -[IMFileTransferCenter _addTransfer:](self, "_addTransfer:", v15);

}

- (BOOL)registerGUID:(id)a3 forNewOutgoingTransferWithLocalURL:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v8)
  {
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v10, "attributesOfItemAtPath:error:", v9, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2B18]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0CB2B20]);

    -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v21 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "fileTransferClass"));
      objc_msgSend(v9, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v11, "fileSize");
      v16 = objc_msgSend(v11, "fileHFSTypeCode");
      v17 = objc_msgSend(v11, "fileHFSCreatorCode");
      BYTE2(v19) = 0;
      LOWORD(v19) = objc_msgSend(v11, "fileHFSFlags");
      v14 = (void *)objc_msgSend(v21, "_initWithGUID:filename:isDirectory:localURL:account:otherPerson:totalBytes:hfsType:hfsCreator:hfsFlags:isIncoming:", v6, v15, v13, v7, 0, 0, v20, __PAIR64__(v17, v16), v19);

    }
    -[IMFileTransferCenter _addTransfer:](self, "_addTransfer:", v14);

  }
  return v8 != 0;
}

- (void)assignTransfer:(id)a3 toMessage:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "uniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setAccount:otherPerson:", v12, 0);
    objc_msgSend(v9, "guid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMessageGUID:", v13);

    -[IMFileTransferCenter _addTransfer:toAccount:](self, "_addTransfer:toAccount:", v11, v12);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v19 = 138412546;
        v20 = v8;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Adding transfer guid: %@ to message: %@", (uint8_t *)&v19, 0x16u);
      }

    }
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileTransfer:createdWithProperties:", v8, v16);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferCreatedNotification"), v11);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Not assigning transfer guid: %@   transfer doesn't exist", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (void)assignTransfer:(id)a3 toHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "localURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[IMFileTransferCenter doesLocalURLRequireArchiving:toHandle:](self, "doesLocalURLRequireArchiving:toHandle:", v11, v7);

    if (v12)
      objc_msgSend(v8, "_setForceArchive:", 1);
    objc_msgSend(v7, "ID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setAccount:otherPerson:", v10, v13);

    -[IMFileTransferCenter _addTransfer:toAccount:](self, "_addTransfer:toAccount:", v8, v10);
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fileTransfer:createdWithProperties:", v6, v15);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferCreatedNotification"), v8);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Not assigning transfer guid: %@ to handle: %@  transfer doesn't exist", (uint8_t *)&v18, 0x16u);
    }

  }
}

- (void)registerTransferWithDaemon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileTransfer:createdWithProperties:", v4, v7);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Could not register transfer with daemon %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (id)chatForTransfer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "messageGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedChats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v3, "messageGUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "messageForGUID:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v7 = v10;

            goto LABEL_12;
          }
        }
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)transferForGUID:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_transferForGUID_includeRemoved_);
}

- (id)transferForGUID:(id)a3 includeRemoved:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_guidToTransferMap, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    -[NSMutableDictionary objectForKey:](self->_guidToRemovedTransferMap, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)downloadFileTransferWithLocalURL:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  NSMutableDictionary *redownloadlocalFilesWithURLCompletionHandlers;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void (**aBlock)(id, uint64_t, _QWORD);
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t buf[4];
  const char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  aBlock = (void (**)(id, uint64_t, _QWORD))a4;
  if (v40)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[IMFileTransferCenter transfers](self, "transfers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v43 != v9)
            objc_enumerationMutation(v7);
          -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i), v40);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "localPath");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13 == 0;

            if (!v14)
            {
              objc_msgSend(v12, "localPath");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "absoluteString");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v15, "containsString:", v16);

              if (((aBlock != 0) & v17) == 1)
                aBlock[2](aBlock, 1, 0);
            }
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v8);
    }

    if (aBlock)
    {
      if (!self->_disconnectionListenerSetUp)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__daemonDisconnected_, CFSTR("__kIMDaemonDidDisconnectNotification"), 0);

        self->_disconnectionListenerSetUp = 1;
      }
      redownloadlocalFilesWithURLCompletionHandlers = self->_redownloadlocalFilesWithURLCompletionHandlers;
      if (!redownloadlocalFilesWithURLCompletionHandlers)
      {
        v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v21 = self->_redownloadlocalFilesWithURLCompletionHandlers;
        self->_redownloadlocalFilesWithURLCompletionHandlers = v20;

        redownloadlocalFilesWithURLCompletionHandlers = self->_redownloadlocalFilesWithURLCompletionHandlers;
      }
      objc_msgSend(v40, "absoluteString", v40);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](redownloadlocalFilesWithURLCompletionHandlers, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = self->_redownloadlocalFilesWithURLCompletionHandlers;
        objc_msgSend(v40, "absoluteString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v25, v27);

      }
      v28 = self->_redownloadlocalFilesWithURLCompletionHandlers;
      objc_msgSend(v40, "absoluteString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = _Block_copy(aBlock);
      objc_msgSend(v30, "addObject:", v31);

      -[IMFileTransferCenter _registerDaemonListenerIfNecessary](self, "_registerDaemonListenerIfNecessary");
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "downloadFileTransferWithLocalURL:", v40);
      goto LABEL_27;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[IMFileTransferCenter downloadFileTransferWithLocalURL:completion:]";
        _os_log_impl(&dword_1A1FF4000, v33, OS_LOG_TYPE_INFO, "%s invalid URL passed", buf, 0xCu);
      }

    }
    if (aBlock)
    {
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v47[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("File transfer local file url retrieval operation was unsuccessful."), &stru_1E4725068, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v36;
      v47[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("The given URL was empty."), &stru_1E4725068, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37F80], 24, v39);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, uint64_t, void *))aBlock)[2](aBlock, 0, v32);
LABEL_27:

    }
  }

}

- (void)acceptTransfer:(id)a3 withPath:(id)a4 autoRename:(BOOL)a5 overwrite:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v6 = a6;
  v7 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!-[IMFileTransferCenter isActiveTransfer:](self, "isActiveTransfer:", v10))
  {
    -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject _resetTransferStateIfAttachmentIsMissingAndDownloadable](v12, "_resetTransferStateIfAttachmentIsMissingAndDownloadable");
    if (v12 && -[NSObject transferState](v12, "transferState") <= 0)
    {
      -[IMFileTransferCenter _addActiveTransfer:](self, "_addActiveTransfer:", v10);
      -[NSObject _setTransferState:](v12, "_setTransferState:", 1);
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject _setLocalURL:](v12, "_setLocalURL:", v16);

      }
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v11)
      {
        objc_msgSend(v17, "fileTransfer:acceptedWithPath:autoRename:overwrite:options:", v10, v11, v7, v6, 0);
      }
      else
      {
        -[NSObject localPath](v12, "localPath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileTransfer:acceptedWithPath:autoRename:overwrite:options:", v10, v19, v7, v6, 0);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferUpdatedNotification"), v12);

    }
    else if (IMIsRunningInAutomation())
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSObject transferState](v12, "transferState"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412546;
          v22 = v12;
          v23 = 2112;
          v24 = v14;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "We tried to accept a file transfer whose transfer state was greater than the accepted state or we got back a nil transfer -- transfer: %@ transfer state: %@", (uint8_t *)&v21, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0D397B8], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postCoreAutomationNotificationFinishedTapToDownload:downloadedFromCloudKitSuccessfully:", v10, 0);

    }
    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = v10;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Asked to accept transfer %@ which is already in progress. Returning early.", (uint8_t *)&v21, 0xCu);
    }
LABEL_20:

  }
}

- (void)acceptTransfer:(id)a3
{
  -[IMFileTransferCenter acceptTransfer:withPath:autoRename:overwrite:](self, "acceptTransfer:withPath:autoRename:overwrite:", a3, 0, 1, 1);
}

- (void)stopTransfer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "stopping transfer to guid %@", (uint8_t *)&v10, 0xCu);
    }

  }
  if (v5 && (objc_msgSend(v5, "isFinished") & 1) == 0)
  {
    -[IMFileTransferCenter _removeActiveTransfer:](self, "_removeActiveTransfer:", v4);
    -[IMFileTransferCenter _removePendingTransfer:](self, "_removePendingTransfer:", v4);
    if (objc_msgSend(v5, "transferState"))
    {
      v7 = 10;
    }
    else if (objc_msgSend(v5, "isIncoming"))
    {
      v7 = 12;
    }
    else
    {
      v7 = 10;
    }
    objc_msgSend(v5, "_setTransferState:", objc_msgSend(v5, "finalTransferStateForSuccess:", 0));
    objc_msgSend(v5, "_setError:", v7);
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileTransferStopped:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferUpdatedNotification"), v5);

  }
}

- (void)removeTransfer:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *guidToRemovedTransferMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v8;
  NSMutableDictionary *accountIDToTransferGUIDsMap;
  void *v10;
  void *v11;
  NSMutableDictionary *guidToTransferMap;
  void *v13;
  id v14;

  v14 = a3;
  -[IMFileTransferCenter _removeActiveTransfer:](self, "_removeActiveTransfer:", v14);
  -[IMFileTransferCenter _removePendingTransfer:](self, "_removePendingTransfer:", v14);
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferRemovedNotification"), v4);

    guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
    if (!guidToRemovedTransferMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v8 = self->_guidToRemovedTransferMap;
      self->_guidToRemovedTransferMap = Mutable;

      guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
    }
    -[NSMutableDictionary setObject:forKey:](guidToRemovedTransferMap, "setObject:forKey:", v4, v14);
    accountIDToTransferGUIDsMap = self->_accountIDToTransferGUIDsMap;
    objc_msgSend(v4, "accountID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](accountIDToTransferGUIDsMap, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v14);

    -[NSMutableDictionary removeObjectForKey:](self->_guidToTransferMap, "removeObjectForKey:", v14);
    if (!-[NSMutableDictionary count](self->_guidToTransferMap, "count"))
    {
      guidToTransferMap = self->_guidToTransferMap;
      self->_guidToTransferMap = 0;

    }
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileTransferRemoved:", v14);

  }
}

- (void)deleteTransfer:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *guidToRemovedTransferMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v8;
  NSMutableDictionary *accountIDToTransferGUIDsMap;
  void *v10;
  void *v11;
  NSMutableDictionary *guidToTransferMap;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFileTransferCenter _removeActiveTransfer:](self, "_removeActiveTransfer:", v15);
  -[IMFileTransferCenter _removePendingTransfer:](self, "_removePendingTransfer:", v15);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferRemovedNotification"), v4);

    guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
    if (!guidToRemovedTransferMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v8 = self->_guidToRemovedTransferMap;
      self->_guidToRemovedTransferMap = Mutable;

      guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
    }
    -[NSMutableDictionary setObject:forKey:](guidToRemovedTransferMap, "setObject:forKey:", v4, v15);
    accountIDToTransferGUIDsMap = self->_accountIDToTransferGUIDsMap;
    objc_msgSend(v4, "accountID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](accountIDToTransferGUIDsMap, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v15);

    -[NSMutableDictionary removeObjectForKey:](self->_guidToTransferMap, "removeObjectForKey:", v15);
    if (!-[NSMutableDictionary count](self->_guidToTransferMap, "count"))
    {
      guidToTransferMap = self->_guidToTransferMap;
      self->_guidToTransferMap = 0;

    }
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileTransferRemoved:", v15);

    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deleteFileTransferWithGUID:", v15);

  }
}

- (void)retargetTransfer:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_setLocalURL:", v8);
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileTransfer:updatedWithProperties:", v7, v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferUpdatedNotification"), v12);

}

- (id)transfersForAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_accountIDToTransferGUIDsMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (NSDictionary)transfers
{
  return (NSDictionary *)self->_guidToTransferMap;
}

- (NSMutableSet)activeTransfers
{
  return (NSMutableSet *)-[NSMutableSet allObjects](self->_activeTransfers, "allObjects");
}

- (NSArray)activeTransferGUIDs
{
  return (NSArray *)-[NSMutableSet allObjects](self->_activeTransfers, "allObjects");
}

- (NSArray)orderedTransfers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("createdDate"), 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("filename"), 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v3, v4, 0);
  -[NSMutableDictionary allValues](self->_guidToTransferMap, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)orderedTransfersGUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("createdDate"), 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("filename"), 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v3, v4, 0);
  -[NSMutableDictionary allValues](self->_guidToTransferMap, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (void)clearFinishedTransfers
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *guidToRemovedTransferMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v16;
  NSMutableDictionary *accountIDToTransferGUIDsMap;
  void *v18;
  void *v19;
  NSMutableDictionary *guidToTransferMap;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_guidToTransferMap, "count"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary allValues](self->_guidToTransferMap, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v11, "isFinished", (_QWORD)v21))
          {
            objc_msgSend(v11, "guid");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMFileTransferCenter _removeActiveTransfer:](self, "_removeActiveTransfer:", v12);
            -[IMFileTransferCenter _removePendingTransfer:](self, "_removePendingTransfer:", v12);
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferRemovedNotification"), v11);

            guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
            if (!guidToRemovedTransferMap)
            {
              Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
              v16 = self->_guidToRemovedTransferMap;
              self->_guidToRemovedTransferMap = Mutable;

              guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
            }
            -[NSMutableDictionary setObject:forKey:](guidToRemovedTransferMap, "setObject:forKey:", v11, v12);
            accountIDToTransferGUIDsMap = self->_accountIDToTransferGUIDsMap;
            objc_msgSend(v11, "accountID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](accountIDToTransferGUIDsMap, "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeObject:", v12);

            -[NSMutableDictionary removeObjectForKey:](self->_guidToTransferMap, "removeObjectForKey:", v12);
            if (!-[NSMutableDictionary count](self->_guidToTransferMap, "count"))
            {
              guidToTransferMap = self->_guidToTransferMap;
              self->_guidToTransferMap = 0;

            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)isFileTransfer:(id)a3 preauthorizedWithDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("sPreauthorizedTransferDictionaryOtherPersonKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("sPreauthorizedTransferDictionaryAccountKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("sPreauthorizedTransferDictionaryFilenameKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "transferState"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "otherPerson");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", v7))
    {
      objc_msgSend(v5, "accountID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", v8))
      {
        objc_msgSend(v5, "filename");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (void)preauthorizeFileTransferFromOtherPerson:(id)a3 account:(id)a4 filename:(id)a5 saveToPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  NSMutableArray *preauthorizedInfos;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  NSMutableArray *preauthorizedGUIDs;
  NSMutableArray *v25;
  NSMutableArray *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10 && v11 && v12)
  {
    if (!self->_preauthorizedInfos)
    {
      v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      preauthorizedInfos = self->_preauthorizedInfos;
      self->_preauthorizedInfos = v14;

    }
    v27 = v13;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("sPreauthorizedTransferDictionaryOtherPersonKey"), v11, CFSTR("sPreauthorizedTransferDictionaryAccountKey"), v12, CFSTR("sPreauthorizedTransferDictionaryFilenameKey"), v13, CFSTR("sPreauthorizedTransferDictionarySaveToPathKey"), 0);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[NSMutableDictionary allValues](self->_guidToTransferMap, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (-[IMFileTransferCenter isFileTransfer:preauthorizedWithDictionary:](self, "isFileTransfer:preauthorizedWithDictionary:", v22, v16))
          {
            objc_msgSend(v22, "guid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v27;
            -[IMFileTransferCenter acceptTransfer:withPath:autoRename:overwrite:](self, "acceptTransfer:withPath:autoRename:overwrite:", v23, v27, 1, 0);
            preauthorizedGUIDs = self->_preauthorizedGUIDs;
            if (!preauthorizedGUIDs)
            {
              v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v26 = self->_preauthorizedGUIDs;
              self->_preauthorizedGUIDs = v25;

              preauthorizedGUIDs = self->_preauthorizedGUIDs;
            }
            -[NSMutableArray addObject:](preauthorizedGUIDs, "addObject:", v23);

            goto LABEL_18;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v19)
          continue;
        break;
      }
    }

    -[NSMutableArray addObject:](self->_preauthorizedInfos, "addObject:", v16);
    v13 = v27;
LABEL_18:

  }
}

- (BOOL)wasFileTransferPreauthorized:(id)a3
{
  return -[NSMutableArray containsObject:](self->_preauthorizedGUIDs, "containsObject:", a3);
}

- (void)acceptFileTransferIfPreauthorzed:(id)a3
{
  id v4;
  NSMutableArray *preauthorizedInfos;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *preauthorizedGUIDs;
  NSMutableArray *v13;
  NSMutableArray *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  preauthorizedInfos = self->_preauthorizedInfos;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](preauthorizedInfos, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(preauthorizedInfos);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
      if (-[IMFileTransferCenter isFileTransfer:preauthorizedWithDictionary:](self, "isFileTransfer:preauthorizedWithDictionary:", v4, v9, (_QWORD)v15))
      {
        break;
      }
      if (v6 == (id)++v8)
      {
        v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](preauthorizedInfos, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_15;
      }
    }
    objc_msgSend(v9, "objectForKey:", CFSTR("sPreauthorizedTransferDictionarySaveToPathKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMFileTransferCenter acceptTransfer:withPath:autoRename:overwrite:](self, "acceptTransfer:withPath:autoRename:overwrite:", v11, v10, 1, 0);
    v6 = v9;
    preauthorizedGUIDs = self->_preauthorizedGUIDs;
    if (!preauthorizedGUIDs)
    {
      v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = self->_preauthorizedGUIDs;
      self->_preauthorizedGUIDs = v13;

      preauthorizedGUIDs = self->_preauthorizedGUIDs;
    }
    -[NSMutableArray addObject:](preauthorizedGUIDs, "addObject:", v11);

    if (v6)
    {
      -[NSMutableArray removeObject:](self->_preauthorizedInfos, "removeObject:", v6);
      if (!-[NSMutableArray count](self->_preauthorizedInfos, "count"))
      {
        preauthorizedInfos = self->_preauthorizedInfos;
        self->_preauthorizedInfos = 0;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:

  }
}

- (void)_handleSerializedFileTransfers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0D39848], "_dictionaryRepresentationGUIDKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[IMFileTransferCenter _handleFileTransfer:createdWithProperties:](self, "_handleFileTransfer:createdWithProperties:", v11, v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_handleFileTransfer:(id)a3 createdWithProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[IMFileTransferCenter _handleFileTransfer:updatedWithProperties:](self, "_handleFileTransfer:updatedWithProperties:", v6, v7);
  }
  else
  {
    v8 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "fileTransferClass"));
    v9 = objc_msgSend(v8, "_updateWithDictionaryRepresentation:", v7);
    -[IMFileTransferCenter _addTransfer:](self, "_addTransfer:", v8);
    v10 = IMOSLoggingEnabled();
    if (v9)
    {
      if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D37F88]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412546;
          v16 = v8;
          v17 = 2112;
          v18 = v12;
          _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Posting transfer created: %@  transferName: %@", (uint8_t *)&v15, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferCreatedNotification"), v8);

    }
    else if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v8;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Nothing changed for create, not posting for: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    -[IMFileTransferCenter acceptFileTransferIfPreauthorzed:](self, "acceptFileTransferIfPreauthorzed:", v8);
  }

}

- (void)_handleFileTransfers:(id)a3 createdWithLocalPaths:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  IMFileTransferCenter *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 == objc_msgSend(v7, "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1A207B010;
    v10[3] = &unk_1E471FE38;
    v11 = v7;
    v12 = self;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "IMFileTransferCenter: number of new file transfers %@ does not match number of local urls %@.", buf, 0x16u);
    }

  }
}

- (void)_handleFileTransfer:(id)a3 updatedWithProperties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "transferState");
    v11 = objc_msgSend(v9, "isFinished");
    v12 = objc_msgSend(v9, "_updateWithDictionaryRepresentation:", v7);
    if (objc_msgSend(v9, "isFromMomentShare"))
    {
      v13 = objc_msgSend(v9, "transferState") == 5 ? v11 : 0;
      if (v13 == 1)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v25 = 138412290;
            v26 = v9;
            _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Overriding changed for CMM transfer %@", (uint8_t *)&v25, 0xCu);
          }

        }
        v12 = 1;
      }
    }
    v15 = objc_msgSend(v9, "transferState");
    if ((v11 & 1) != 0 || !objc_msgSend(v9, "isFinished"))
    {
      v16 = 0;
      if (v10 <= 1 && v15 >= 2)
      {
        -[IMFileTransferCenter _addActiveTransfer:](self, "_addActiveTransfer:", v6);
        v16 = 0;
      }
    }
    else
    {
      -[IMFileTransferCenter _removeActiveTransfer:](self, "_removeActiveTransfer:", v6);
      -[IMFileTransferCenter _removePendingTransfer:](self, "_removePendingTransfer:", v6);
      v16 = 1;
    }
    if (-[IMFileTransferCenter isActiveTransfer:](self, "isActiveTransfer:", v6)
      && IMFileTransferStateIsNotActive())
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          IMStringFromTransferState();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138412546;
          v26 = v6;
          v27 = 2112;
          v28 = v18;
          _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Removing %@ from active transfers, as newState is %@", (uint8_t *)&v25, 0x16u);

        }
      }
      -[IMFileTransferCenter _removeActiveTransfer:](self, "_removeActiveTransfer:", v6);
    }
    v19 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v19)
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v25 = 138412290;
          v26 = v6;
          _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Posting transfer, guid: %@", (uint8_t *)&v25, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferUpdatedNotification"), v9);

    }
    else if (v19)
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v25 = 138412290;
        v26 = v6;
        _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Nothing changed for update, not posting, guid: %@", (uint8_t *)&v25, 0xCu);
      }

    }
    if (v16)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v25 = 138412290;
          v26 = v6;
          _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "Posting transfer, guid: %@  finished", (uint8_t *)&v25, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferFinishedNotification"), v9);

    }
  }
  else
  {
    -[IMFileTransferCenter _handleFileTransfer:createdWithProperties:](self, "_handleFileTransfer:createdWithProperties:", v6, v7);
  }

}

- (void)_handleFileTransfer:(id)a3 updatedWithCurrentBytes:(unint64_t)a4 totalBytes:(unint64_t)a5 averageTransferRate:(unint64_t)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "currentBytes") == a4
    && objc_msgSend(v11, "totalBytes") == a5
    && objc_msgSend(v11, "averageTransferRate") == a6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "transferState"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138413058;
        v22 = v10;
        v23 = 2112;
        v24 = v13;
        v25 = 2112;
        v26 = v14;
        v27 = 2112;
        v28 = v15;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Ignoring update for transfer guid: %@ state: %@ currentBytes: %@ totalBytes: %@ (values have not changed)", (uint8_t *)&v21, 0x2Au);

      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "transferState"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138413058;
        v22 = v10;
        v23 = 2112;
        v24 = v17;
        v25 = 2112;
        v26 = v18;
        v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Updating transfer guid: %@ state: %@ currentBytes: %@ totalBytes: %@", (uint8_t *)&v21, 0x2Au);

      }
    }
    objc_msgSend(v11, "_setCurrentBytes:totalBytes:", a4, a5);
    objc_msgSend(v11, "_setAveragedTransferRate:lastAveragedInterval:lastAveragedBytes:", a6, 0, 0.0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferUpdatedNotification"), v11);

  }
}

- (void)_handleFileTransfer:(id)a3 highQualityDownloadSucceededWithPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "High quality download for transfer %@ succeeded at path %@", buf, 0x16u);
    }

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_fetchHighQualityVariantCompletionHandlers, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fetchHighQualityVariantCompletionHandlers, "setObject:forKeyedSubscript:", 0, v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A207B9A4;
  v11[3] = &unk_1E471FE60;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

}

- (void)_handleFileTransferHighQualityDownloadFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "High quality download for transfer %@ failed", (uint8_t *)&v7, 0xCu);
    }

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_fetchHighQualityVariantCompletionHandlers, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fetchHighQualityVariantCompletionHandlers, "setObject:forKeyedSubscript:", 0, v4);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &unk_1E471D678);

}

- (void)_handleFileTransfer:(id)a3 explicitDownloadSucceededWithPath:(id)a4 livePhotoBundlePath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Download for transfer %@ succeeded at path %@", buf, 0x16u);
    }

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_localFileURLRetrievalCompletionHandlers, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localFileURLRetrievalCompletionHandlers, "setObject:forKeyedSubscript:", 0, v8);
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1A207BD30;
  v24[3] = &unk_1E471FEA8;
  v14 = v9;
  v25 = v14;
  v15 = v10;
  v26 = v15;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v24);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_localFileURLRetrievalWithGuidCompletionHandlers, "objectForKeyedSubscript:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localFileURLRetrievalWithGuidCompletionHandlers, "setObject:forKeyedSubscript:", 0, v8);
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = sub_1A207BD4C;
  v20[3] = &unk_1E471FED0;
  v21 = v8;
  v22 = v14;
  v23 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v8;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);

}

- (void)_handleFileTransferExplicitDownloadFailed:(id)a3 suggestedRetryGUID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Download for transfer %@ failed", buf, 0xCu);
    }

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_localFileURLRetrievalCompletionHandlers, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localFileURLRetrievalCompletionHandlers, "setObject:forKeyedSubscript:", 0, v8);
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1A207BFB0;
  v24[3] = &unk_1E471FEA8;
  v14 = v9;
  v25 = v14;
  v15 = v10;
  v26 = v15;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v24);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_localFileURLRetrievalWithGuidCompletionHandlers, "objectForKeyedSubscript:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localFileURLRetrievalWithGuidCompletionHandlers, "setObject:forKeyedSubscript:", 0, v8);
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = sub_1A207BFCC;
  v20[3] = &unk_1E471FED0;
  v21 = v8;
  v22 = v14;
  v23 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v8;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);

}

- (void)_handleFileTransferDownloadSucceededWithLocalURL:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *redownloadlocalFilesWithURLCompletionHandlers;
  void *v7;
  void *v8;
  NSMutableDictionary *localFileURLRetrievalCompletionHandlers;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Re-Download for transfer at URL %@ succeeded", (uint8_t *)&v11, 0xCu);
    }

  }
  redownloadlocalFilesWithURLCompletionHandlers = self->_redownloadlocalFilesWithURLCompletionHandlers;
  objc_msgSend(v4, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](redownloadlocalFilesWithURLCompletionHandlers, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  localFileURLRetrievalCompletionHandlers = self->_localFileURLRetrievalCompletionHandlers;
  objc_msgSend(v4, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](localFileURLRetrievalCompletionHandlers, "setObject:forKeyedSubscript:", 0, v10);

  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &unk_1E471C550);
}

- (void)_handleFileTransferDownloadFailedWithLocalURL:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *redownloadlocalFilesWithURLCompletionHandlers;
  void *v11;
  void *v12;
  NSMutableDictionary *localFileURLRetrievalCompletionHandlers;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Re-Download for transfer at URL %@ failed %@", buf, 0x16u);

    }
  }
  redownloadlocalFilesWithURLCompletionHandlers = self->_redownloadlocalFilesWithURLCompletionHandlers;
  objc_msgSend(v6, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](redownloadlocalFilesWithURLCompletionHandlers, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  localFileURLRetrievalCompletionHandlers = self->_localFileURLRetrievalCompletionHandlers;
  objc_msgSend(v6, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](localFileURLRetrievalCompletionHandlers, "setObject:forKeyedSubscript:", 0, v14);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1A207C308;
  v16[3] = &unk_1E471FF18;
  v17 = v7;
  v15 = v7;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

}

- (void)setAuxImageForTransfer:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v4)
        v8 = CFSTR("YES");
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Setting Aux image to %@ for transfer %@", (uint8_t *)&v13, 0x16u);
    }

  }
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsAuxImage:", v4);
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileTransfer:updatedWithProperties:", v6, v11);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferUpdatedNotification"), v9);

}

- (void)setAuxVideoForTransfer:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v4)
        v8 = CFSTR("YES");
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Setting Aux video to %@ for transfer %@", (uint8_t *)&v13, 0x16u);
    }

  }
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsAuxVideo:", v4);
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileTransfer:updatedWithProperties:", v6, v11);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferUpdatedNotification"), v9);

}

- (void)setCommSafetySensitiveForTransfer:(id)a3 value:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Setting Communication Safety Sensitivity to %@ for transfer %@", (uint8_t *)&v13, 0x16u);

    }
  }
  -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCommSafetySensitive:", a4);
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileTransfer:updatedWithProperties:", v6, v11);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "__mainThreadPostNotificationName:object:", CFSTR("__kIMFileTransferUpdatedNotification"), v9);

}

- (id)guidsForStoredAttachmentPayloadData:(id)a3 messageGUID:(id)a4
{
  id v5;
  __CFArray *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v25;
  void *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  v26 = v5;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (__CFArray *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v26;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v7)
    {
      v29 = *(_QWORD *)v33;
      v28 = *MEMORY[0x1E0D37FC8];
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v33 != v29)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringByAppendingPathExtension:", v28);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if ((IMIsRunningInMessages() & 1) != 0
            || (IMIsRunningInMobileSMS() & 1) != 0
            || (IMIsRunningInIMDPersistenceAgent() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "im_randomTemporaryFileURLWithFileName:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "path");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "_randomTemporaryPathWithSuffix:withAppendedPathComponent:", v11, CFSTR("com.apple.MobileSMS"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v14, "stringByResolvingAndStandardizingPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = 0;
          v16 = objc_msgSend(v9, "writeToFile:options:error:", v15, 1, &v31);
          v17 = v31;
          if ((v16 & 1) == 0 && IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v17;
              _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "MessageService Failed writing attachment to disk on incoming: %@", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v15, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMFileTransferCenter createNewOutgoingTransferWithLocalFileURL:](self, "createNewOutgoingTransferWithLocalFileURL:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "transferForGUID:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v22, "setHideAttachment:", 1);
          if (v6 && v20)
            CFArrayAppendValue(v6, v20);

          ++v8;
        }
        while (v7 != v8);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        v7 = v23;
      }
      while (v23);
    }

  }
  else
  {
    v6 = (__CFArray *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)fetchHighQualityVariantForTransfer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMFileTransferCenter _fetchHighQualityVariantForTransferGUID:completion:](self, "_fetchHighQualityVariantForTransferGUID:completion:", v8, v7);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "fetchHighQualityVariantForTransfer:completion: was given no transfer", v10, 2u);
      }

    }
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)_fetchHighQualityVariantForTransferGUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  NSMutableDictionary *fetchHighQualityVariantCompletionHandlers;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t v18[16];

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    if (v7)
    {
      if (!self->_disconnectionListenerSetUp)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__daemonDisconnected_, CFSTR("__kIMDaemonDidDisconnectNotification"), 0);

        self->_disconnectionListenerSetUp = 1;
      }
      fetchHighQualityVariantCompletionHandlers = self->_fetchHighQualityVariantCompletionHandlers;
      if (!fetchHighQualityVariantCompletionHandlers)
      {
        v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v12 = self->_fetchHighQualityVariantCompletionHandlers;
        self->_fetchHighQualityVariantCompletionHandlers = v11;

        fetchHighQualityVariantCompletionHandlers = self->_fetchHighQualityVariantCompletionHandlers;
      }
      -[NSMutableDictionary objectForKeyedSubscript:](fetchHighQualityVariantCompletionHandlers, "objectForKeyedSubscript:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fetchHighQualityVariantCompletionHandlers, "setObject:forKeyedSubscript:", v14, v6);

      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_fetchHighQualityVariantCompletionHandlers, "objectForKeyedSubscript:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = _Block_copy(v8);
      objc_msgSend(v15, "addObject:", v16);

    }
    -[IMFileTransferCenter _initiateHighQualityVariantDownloadWithDaemonForGUID:](self, "_initiateHighQualityVariantDownloadWithDaemonForGUID:", v6);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "fetchHighQualityVariantForTransfer:completion: was given no transfer guid", v18, 2u);
      }

    }
    if (v8)
      v8[2](v8, 0, 0);
  }

}

- (void)_initiateHighQualityVariantDownloadWithDaemonForGUID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downloadHighQualityVariantOfFileTransferWithGUID:", v3);

}

- (void)_daemonRestarted:(id)a3
{
  NSMutableDictionary *fetchHighQualityVariantCompletionHandlers;
  NSMutableDictionary *v4;

  fetchHighQualityVariantCompletionHandlers = self->_fetchHighQualityVariantCompletionHandlers;
  self->_fetchHighQualityVariantCompletionHandlers = 0;
  v4 = fetchHighQualityVariantCompletionHandlers;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v4, "enumerateKeysAndObjectsUsingBlock:", &unk_1E471BC00);
}

- (void)_daemonDisconnected:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *localFileURLRetrievalCompletionHandlers;
  NSMutableDictionary *v13;
  uint64_t v14;
  id v15;
  NSMutableDictionary *localFileURLRetrievalWithGuidCompletionHandlers;
  NSMutableDictionary *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0D37F78];
  v23[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("File transfer local file URL retrieval operation was unsuccessful."), &stru_1E4725068, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v23[1] = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("The daemon disconnected."), &stru_1E4725068, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 24, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  localFileURLRetrievalCompletionHandlers = self->_localFileURLRetrievalCompletionHandlers;
  self->_localFileURLRetrievalCompletionHandlers = 0;
  v13 = localFileURLRetrievalCompletionHandlers;

  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1A207D0C0;
  v21[3] = &unk_1E471FF88;
  v15 = v11;
  v22 = v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v13, "enumerateKeysAndObjectsUsingBlock:", v21);
  localFileURLRetrievalWithGuidCompletionHandlers = self->_localFileURLRetrievalWithGuidCompletionHandlers;
  self->_localFileURLRetrievalWithGuidCompletionHandlers = 0;
  v17 = localFileURLRetrievalWithGuidCompletionHandlers;

  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = sub_1A207D14C;
  v19[3] = &unk_1E471FF88;
  v20 = v15;
  v18 = v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v17, "enumerateKeysAndObjectsUsingBlock:", v19);

}

- (void)preWarmConnection
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A1FF4000, v2, OS_LOG_TYPE_INFO, "IMTransferCenter is asked for prewarm", v4, 2u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preWarm");

}

- (void)retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableDictionary *localFileURLRetrievalCompletionHandlers;
  NSMutableDictionary *v30;
  NSMutableDictionary *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t buf[4];
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "existsAtLocalPath"))
    {
      if (v9)
      {
        objc_msgSend(v10, "localPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "im_livePhotoBundlePath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, uint64_t, _QWORD, void *, void *, _QWORD))v9 + 2))(v9, 1, 0, v11, v13, 0);

      }
    }
    else if (objc_msgSend(v10, "isInThumbnailState"))
    {
      if (v9)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", *MEMORY[0x1E0CB2D50]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("File transfer local file url retrieval operation was unsuccessful."), &stru_1E4725068, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v23;
        v36[1] = *MEMORY[0x1E0CB2D68];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("The given GUID references an attachment which is in thumbnail state. You don't want to analyze this, Skip and retry later, user did not tap to downloaded."), &stru_1E4725068, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37F80], 24, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, 0, 0, v27);
      }
    }
    else
    {
      if (v9)
      {
        if (!self->_disconnectionListenerSetUp)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObserver:selector:name:object:", self, sel__daemonDisconnected_, CFSTR("__kIMDaemonDidDisconnectNotification"), 0);

          self->_disconnectionListenerSetUp = 1;
        }
        localFileURLRetrievalCompletionHandlers = self->_localFileURLRetrievalCompletionHandlers;
        if (!localFileURLRetrievalCompletionHandlers)
        {
          v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v31 = self->_localFileURLRetrievalCompletionHandlers;
          self->_localFileURLRetrievalCompletionHandlers = v30;

          localFileURLRetrievalCompletionHandlers = self->_localFileURLRetrievalCompletionHandlers;
        }
        -[NSMutableDictionary objectForKeyedSubscript:](localFileURLRetrievalCompletionHandlers, "objectForKeyedSubscript:", v8);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localFileURLRetrievalCompletionHandlers, "setObject:forKeyedSubscript:", v33, v8);

        }
        -[NSMutableDictionary objectForKeyedSubscript:](self->_localFileURLRetrievalCompletionHandlers, "objectForKeyedSubscript:", v8);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = _Block_copy(v9);
        objc_msgSend(v34, "addObject:", v35);

      }
      -[IMFileTransferCenter _initiateLocalFileURLRetrievalInDaemonForGUID:options:](self, "_initiateLocalFileURLRetrievalInDaemonForGUID:options:", v8, a4);
    }
    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[IMFileTransferCenter retrieveLocalFileURLForFileTransferWithGUID:options:completion:]";
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "%s was given no transfer guid", buf, 0xCu);
    }

  }
  if (v9)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v38[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("File transfer local file url retrieval operation was unsuccessful."), &stru_1E4725068, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v17;
    v38[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("The given GUID was empty."), &stru_1E4725068, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37F80], 24, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, 0, 0, v10);
LABEL_23:

  }
}

- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *localFileURLRetrievalWithGuidCompletionHandlers;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _BYTE v50[128];
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  const char *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v36 = v7;
  if (objc_msgSend(v7, "count"))
  {
    v40 = (void *)objc_opt_new();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v7;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (!v43)
      goto LABEL_21;
    v42 = *(_QWORD *)v45;
    v37 = *MEMORY[0x1E0D37F80];
    v38 = *MEMORY[0x1E0CB2D68];
    v39 = *MEMORY[0x1E0CB2D50];
    while (1)
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v45 != v42)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        -[IMFileTransferCenter transferForGUID:](self, "transferForGUID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (((v8 != 0) & objc_msgSend(v11, "existsAtLocalPath")) == 1)
        {
          objc_msgSend(v11, "localPath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localPath");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "im_livePhotoBundlePath");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, uint64_t, uint64_t, _QWORD, void *, void *, _QWORD))v8 + 2))(v8, 1, v10, 0, v12, v14, 0);

        }
        else if (objc_msgSend(v11, "isInThumbnailState"))
        {
          if (!v8)
            goto LABEL_19;
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v48[0] = v39;
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("File transfer local file url retrieval operation was unsuccessful."), &stru_1E4725068, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v48[1] = v38;
          v49[0] = v17;
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("The given GUID references an attachment which is in thumbnail state. You don't want to analyze this, Skip and retry later, user did not tap to downloaded."), &stru_1E4725068, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v49[1] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", v37, 24, v20);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, 0, 0, 0, v12);
        }
        else
        {
          objc_msgSend(v40, "addObject:", v10);
          if (!v8)
            goto LABEL_19;
          localFileURLRetrievalWithGuidCompletionHandlers = self->_localFileURLRetrievalWithGuidCompletionHandlers;
          if (!localFileURLRetrievalWithGuidCompletionHandlers)
          {
            v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            v23 = self->_localFileURLRetrievalWithGuidCompletionHandlers;
            self->_localFileURLRetrievalWithGuidCompletionHandlers = v22;

            localFileURLRetrievalWithGuidCompletionHandlers = self->_localFileURLRetrievalWithGuidCompletionHandlers;
          }
          -[NSMutableDictionary objectForKeyedSubscript:](localFileURLRetrievalWithGuidCompletionHandlers, "objectForKeyedSubscript:", v10);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24 == 0;

          if (v25)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localFileURLRetrievalWithGuidCompletionHandlers, "setObject:forKeyedSubscript:", v26, v10);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](self->_localFileURLRetrievalWithGuidCompletionHandlers, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = _Block_copy(v8);
          objc_msgSend(v12, "addObject:", v27);

        }
LABEL_19:

      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (!v43)
      {
LABEL_21:

        -[IMFileTransferCenter _initiateLocalFileURLRetrievalInDaemonForGUIDs:options:](self, "_initiateLocalFileURLRetrievalInDaemonForGUIDs:options:", v40, a4);
        goto LABEL_28;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[IMFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
      _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "%s was given no transfer guids", buf, 0xCu);
    }

  }
  if (v8)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v51[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("File transfer local file urls retrieval operation was unsuccessful."), &stru_1E4725068, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v31;
    v51[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("The given GUIDs was empty."), &stru_1E4725068, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37F80], 24, v34);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, 0, 0, 0, v40);
LABEL_28:

  }
}

- (void)_initiateLocalFileURLRetrievalInDaemonForGUID:(id)a3 options:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[IMFileTransferCenter _registerDaemonListenerIfNecessary](self, "_registerDaemonListenerIfNecessary");
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "retrieveLocalFileURLForFileTransferWithGUID:options:", v6, a4);

}

- (void)_initiateLocalFileURLRetrievalInDaemonForGUIDs:(id)a3 options:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[IMFileTransferCenter _registerDaemonListenerIfNecessary](self, "_registerDaemonListenerIfNecessary");
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "retrieveLocalFileURLForFileTransferWithGUIDs:options:", v6, a4);

}

- (void)createItemForPHAssetWithUUID:(id)a3 parentChatItemGUID:(id)a4 chatGUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createItemForPHAssetWithUUID:parentChatItemGUID:chatGUID:", v9, v8, v7);

}

- (void)_registerDaemonListenerIfNecessary
{
  IMDaemonMultiplexedConnectionManaging *daemonConnection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  IMDaemonMultiplexedConnectionManaging *v8;
  IMDaemonMultiplexedConnectionManaging *v9;

  daemonConnection = self->_daemonConnection;
  if (!daemonConnection)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-IMFileTransferCenter"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDaemonController sharedController](IMDaemonController, "sharedController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiplexedConnectionWithLabel:capabilities:context:", v6, 0x10000000, 0);
    v8 = (IMDaemonMultiplexedConnectionManaging *)objc_claimAutoreleasedReturnValue();
    v9 = self->_daemonConnection;
    self->_daemonConnection = v8;

    daemonConnection = self->_daemonConnection;
  }
  -[IMDaemonMultiplexedConnectionManaging waitForSetup](daemonConnection, "waitForSetup");
}

- (BOOL)shouldIssueSandboxEstensionsForTransfers
{
  return self->_issueSandboxEstensionsForTransfers;
}

- (void)setIssueSandboxEstensionsForTransfers:(BOOL)a3
{
  self->_issueSandboxEstensionsForTransfers = a3;
}

- (IMDaemonMultiplexedConnectionManaging)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnection, a3);
}

- (NSMutableDictionary)guidToTransferMap
{
  return self->_guidToTransferMap;
}

- (void)setGuidToTransferMap:(id)a3
{
  objc_storeStrong((id *)&self->_guidToTransferMap, a3);
}

- (NSMutableDictionary)guidToRemovedTransferMap
{
  return self->_guidToRemovedTransferMap;
}

- (void)setGuidToRemovedTransferMap:(id)a3
{
  objc_storeStrong((id *)&self->_guidToRemovedTransferMap, a3);
}

- (NSMutableDictionary)accountIDToTransferGUIDsMap
{
  return self->_accountIDToTransferGUIDsMap;
}

- (void)setAccountIDToTransferGUIDsMap:(id)a3
{
  objc_storeStrong((id *)&self->_accountIDToTransferGUIDsMap, a3);
}

- (NSMutableArray)preauthorizedInfos
{
  return self->_preauthorizedInfos;
}

- (void)setPreauthorizedInfos:(id)a3
{
  objc_storeStrong((id *)&self->_preauthorizedInfos, a3);
}

- (NSMutableArray)preauthorizedGUIDs
{
  return self->_preauthorizedGUIDs;
}

- (void)setPreauthorizedGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_preauthorizedGUIDs, a3);
}

- (void)setActiveTransfers:(id)a3
{
  objc_storeStrong((id *)&self->_activeTransfers, a3);
}

- (NSMutableSet)pendingTransfers
{
  return self->_pendingTransfers;
}

- (void)setPendingTransfers:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTransfers, a3);
}

- (BOOL)disconnectionListenerSetUp
{
  return self->_disconnectionListenerSetUp;
}

- (void)setDisconnectionListenerSetUp:(BOOL)a3
{
  self->_disconnectionListenerSetUp = a3;
}

- (NSMutableDictionary)fetchHighQualityVariantCompletionHandlers
{
  return self->_fetchHighQualityVariantCompletionHandlers;
}

- (void)setFetchHighQualityVariantCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_fetchHighQualityVariantCompletionHandlers, a3);
}

- (NSMutableDictionary)localFileURLRetrievalCompletionHandlers
{
  return self->_localFileURLRetrievalCompletionHandlers;
}

- (void)setLocalFileURLRetrievalCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_localFileURLRetrievalCompletionHandlers, a3);
}

- (NSMutableDictionary)localFileURLRetrievalWithGuidCompletionHandlers
{
  return self->_localFileURLRetrievalWithGuidCompletionHandlers;
}

- (void)setLocalFileURLRetrievalWithGuidCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_localFileURLRetrievalWithGuidCompletionHandlers, a3);
}

- (NSMutableDictionary)redownloadlocalFilesWithURLCompletionHandlers
{
  return self->_redownloadlocalFilesWithURLCompletionHandlers;
}

- (void)setRedownloadlocalFilesWithURLCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_redownloadlocalFilesWithURLCompletionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redownloadlocalFilesWithURLCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_localFileURLRetrievalWithGuidCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_localFileURLRetrievalCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_fetchHighQualityVariantCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_pendingTransfers, 0);
  objc_storeStrong((id *)&self->_activeTransfers, 0);
  objc_storeStrong((id *)&self->_preauthorizedGUIDs, 0);
  objc_storeStrong((id *)&self->_preauthorizedInfos, 0);
  objc_storeStrong((id *)&self->_accountIDToTransferGUIDsMap, 0);
  objc_storeStrong((id *)&self->_guidToRemovedTransferMap, 0);
  objc_storeStrong((id *)&self->_guidToTransferMap, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

@end
