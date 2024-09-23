@implementation LiveFSServiceConnection

- (id)initForMount:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  LiveFSServiceConnection *v11;
  LiveFSServiceConnection *v12;
  LiveFSServiceConnection *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *setUpdateInterestQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)LiveFSServiceConnection;
  v11 = -[LiveFSServiceConnection init](&v17, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_7;
  objc_storeStrong((id *)&v11->mount, a3);
  if (!a5)
  {
    v12->_ourID = objc_msgSend(v9, "newConnectionIDOrError:", 0);
LABEL_6:
    objc_storeWeak((id *)&v12->ourConnection, v10);
    v14 = dispatch_queue_create("com.apple.LiveFSServiceConnection.setUpdateInterest", 0);
    setUpdateInterestQueue = v12->setUpdateInterestQueue;
    v12->setUpdateInterestQueue = (OS_dispatch_queue *)v14;

LABEL_7:
    v13 = v12;
    goto LABEL_8;
  }
  *a5 = 0;
  v13 = 0;
  v12->_ourID = objc_msgSend(v9, "newConnectionIDOrError:", a5);
  if (!*a5)
    goto LABEL_6;
LABEL_8:

  return v13;
}

- (void)scrubOurClientId
{
  NSObject *v3;
  unint64_t ourID;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_ourID && self->mount)
  {
    livefs_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      ourID = self->_ourID;
      v5 = 134217984;
      v6 = ourID;
      _os_log_impl(&dword_22BD61000, v3, OS_LOG_TYPE_DEFAULT, "About to scrub client mask 0x%016llx", (uint8_t *)&v5, 0xCu);
    }

    -[LiveFSVolume abortAllClientSearchesFor:](self->mount, "abortAllClientSearchesFor:", self->_ourID);
    -[LiveFSVolume invalidateFileNodesForConnection:](self->mount, "invalidateFileNodesForConnection:", self->_ourID);
    -[LiveFSVolume releaseConnectionAllocation:](self->mount, "releaseConnectionAllocation:", self->_ourID);
    self->_ourID = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_ourID && self->mount)
    -[LiveFSServiceConnection scrubOurClientId](self, "scrubOurClientId");
  v3.receiver = self;
  v3.super_class = (Class)LiveFSServiceConnection;
  -[LiveFSServiceConnection dealloc](&v3, sel_dealloc);
}

+ (id)newConnectionForMount:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForMount:connection:error:", v9, v8, a5);

  return v10;
}

+ (id)newExportObjectForObject:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v8, "conformsToProtocol:", &unk_255C01B88) & 1) != 0)
  {
    v10 = v8;
    v11 = (void *)objc_msgSend(a1, "newConnectionForMount:connection:error:", v10, v9, a5);
    v12 = v11;
    if (v11)
      objc_msgSend(v10, "rememberConnection:forID:", v9, objc_msgSend(v11, "ourID"));

  }
  else if (a5)
  {
    getNSErrorFromLiveFSErrno(22);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  LiveFSVolume *mount;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a6;
  mount = self->mount;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__LiveFSServiceConnection_close_keepingMode_requestID_reply___block_invoke;
  v15[3] = &unk_24F64C4B8;
  v16 = v10;
  v17 = v11;
  v15[4] = self;
  v13 = v10;
  v14 = v11;
  -[LiveFSVolume close:keepingMode:requestID:reply:](mount, "close:keepingMode:requestID:reply:", v13, v8, a5, v15);

}

void __61__LiveFSServiceConnection_close_keepingMode_requestID_reply___block_invoke(_QWORD *a1, int a2, void *a3, uint64_t a4, void *a5, uint64_t a6, int a7, int a8)
{
  id v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  int v21;
  void *v22;
  id v23;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  (*(void (**)(void))(a1[6] + 16))();
  if (!a2 && a7)
  {
    if (a6 | a4 || (objc_msgSend(*(id *)(a1[4] + 8), "workingSetInterest") ? (v17 = a8 == 0) : (v17 = 1), !v17))
    {
      livefs_std_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = a1[5];
        v24 = 136315650;
        v25 = "-[LiveFSServiceConnection close:keepingMode:requestID:reply:]_block_invoke";
        v26 = 2112;
        v27 = v19;
        v28 = 2048;
        v29 = a6;
        _os_log_impl(&dword_22BD61000, v18, OS_LOG_TYPE_DEFAULT, "%s: last close in file %@ interest 0x%0llx", (uint8_t *)&v24, 0x20u);
      }

      v20 = *(id *)(a1[4] + 8);
      v21 = objc_msgSend(v20, "hasPersistentFileIDs");
      if (a6)
        objc_msgSend(v20, "updatedItem:name:interestedItem:interestedClients:", a1[5], a1[5], a1[5], a6);
      if (a4)
        objc_msgSend(v20, "updatedName:interestedItem:interestedClients:", v16, v15, a4);
      if (a8 && objc_msgSend(*(id *)(a1[4] + 8), "workingSetInterest"))
      {
        v22 = (void *)a1[5];
        if (v21)
        {
          objc_msgSend(v20, "updatedItem:name:interestedItem:interestedClients:", v22, &stru_24F64CE40, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v20, "workingSetInterest"));
        }
        else
        {
          v23 = v22;
          objc_msgSend(v20, "volumeWideUpdatedName:interestedItem:interestedClients:", v23, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v20, "workingSetInterest"));

        }
      }

    }
  }

}

- (id)sanitizedAttrsForNewObjectAttrs:(id)a3 forType:(unsigned int)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v12;
  unsigned __int128 v13;

  v5 = objc_retainAutorelease((id)objc_msgSend(a3, "mutableCopy"));
  v6 = objc_msgSend(v5, "mutableBytes");
  v7 = v6;
  v8 = *(_QWORD *)(v6 + 8);
  if ((v8 & 2) != 0)
  {
    if ((v8 & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    if (a4 == 2)
      v10 = 448;
    else
      v10 = 384;
    *(_DWORD *)(v6 + 28) = v10;
    v8 |= 2uLL;
    *(_QWORD *)(v6 + 8) = v8;
    if ((v8 & 8) != 0)
    {
LABEL_3:
      if ((v8 & 0x10) != 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  *(_DWORD *)(v6 + 36) = getuid();
  v8 = *(_QWORD *)(v7 + 8) | 8;
  *(_QWORD *)(v7 + 8) = v8;
  if ((v8 & 0x10) == 0)
  {
LABEL_4:
    *(_DWORD *)(v7 + 40) = getgid();
    v8 = *(_QWORD *)(v7 + 8) | 0x10;
    *(_QWORD *)(v7 + 8) = v8;
  }
LABEL_5:
  if ((~(_WORD)v8 & 0xAC00) != 0)
  {
    v13 = 0uLL;
    if (clock_gettime(_CLOCK_REALTIME, (timespec *)&v13))
    {
      v9 = 0;
      goto LABEL_15;
    }
    v12 = *(_QWORD *)(v7 + 8);
    if ((v12 & 0x400) != 0)
    {
      if ((v12 & 0x800) != 0)
        goto LABEL_18;
    }
    else
    {
      *(_OWORD *)(v7 + 80) = v13;
      v12 |= 0x400uLL;
      *(_QWORD *)(v7 + 8) = v12;
      if ((v12 & 0x800) != 0)
      {
LABEL_18:
        if ((v12 & 0x2000) != 0)
          goto LABEL_19;
        goto LABEL_23;
      }
    }
    *(_OWORD *)(v7 + 96) = v13;
    v12 |= 0x800uLL;
    *(_QWORD *)(v7 + 8) = v12;
    if ((v12 & 0x2000) != 0)
    {
LABEL_19:
      if ((v12 & 0x8000) != 0)
        goto LABEL_6;
LABEL_24:
      *(_OWORD *)(v7 + 160) = v13;
      *(_QWORD *)(v7 + 8) = v12 | 0x8000;
      goto LABEL_6;
    }
LABEL_23:
    *(_OWORD *)(v7 + 128) = v13;
    v12 |= 0x2000uLL;
    *(_QWORD *)(v7 + 8) = v12;
    if ((v12 & 0x8000) != 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_6:
  v9 = v5;
LABEL_15:

  return v9;
}

- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  LiveFSVolume *mount;
  unint64_t ourID;
  _QWORD v19[4];
  id v20;
  LiveFSServiceConnection *v21;
  id v22;
  id v23;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = v14;
  if (self->_ourID)
  {
    -[LiveFSServiceConnection sanitizedAttrsForNewObjectAttrs:forType:](self, "sanitizedAttrsForNewObjectAttrs:forType:", a5, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    mount = self->mount;
    ourID = self->_ourID;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __69__LiveFSServiceConnection_createIn_named_attributes_requestID_reply___block_invoke;
    v19[3] = &unk_24F64C4E0;
    v23 = v15;
    v20 = v13;
    v21 = self;
    v22 = v12;
    -[LiveFSVolume createIn:named:attributes:andClient:requestID:reply:](mount, "createIn:named:attributes:andClient:requestID:reply:", v22, v20, v16, ourID, a6, v19);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, 70, 0, 0, 0, 0);
  }

}

void __69__LiveFSServiceConnection_createIn_named_attributes_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v8;
  id v9;
  int v10;
  void *v11;
  id v12;

  v12 = a5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v8 = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("."));
  if (!a2 && (v8 & 1) == 0 && (a4 || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "workingSetInterest")))
  {
    v9 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = objc_msgSend(v9, "hasPersistentFileIDs");
    if (a4)
      objc_msgSend(v9, "updatedName:interestedItem:interestedClients:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), a4);
    if (objc_msgSend(v9, "workingSetInterest") && (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR(".")) & 1) == 0)
    {
      if (v10)
      {
        objc_msgSend(v9, "updatedItem:name:interestedItem:interestedClients:", v12, *(_QWORD *)(a1 + 32), CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v9, "workingSetInterest"));
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "volumeWideUpdatedName:interestedItem:interestedClients:", v11, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v9, "workingSetInterest"));

      }
    }

  }
}

- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolume fileAttributes:requestID:reply:](self->mount, "fileAttributes:requestID:reply:", a3, a4, a5);
}

- (void)LIGetRootFileHandle:(id)a3
{
  id v4;
  void *v5;
  unint64_t ourID;
  LiveFSVolume *mount;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  ourID = self->_ourID;
  if (ourID)
  {
    mount = self->mount;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __47__LiveFSServiceConnection_LIGetRootFileHandle___block_invoke;
    v8[3] = &unk_24F64C508;
    v9 = v4;
    -[LiveFSVolume rootFileHandleForClient:reply:](mount, "rootFileHandleForClient:reply:", ourID, v8);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v4 + 2))(v4, &stru_24F64CE40);
  }

}

uint64_t __47__LiveFSServiceConnection_LIGetRootFileHandle___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getRootFileHandleWithError:(id)a3
{
  unint64_t ourID;
  LiveFSVolume *mount;
  id v6;
  id v7;

  ourID = self->_ourID;
  if (ourID)
  {
    mount = self->mount;
    v7 = a3;
    -[LiveFSVolume rootFileHandleForClient:reply:](mount, "rootFileHandleForClient:reply:", ourID);
  }
  else
  {
    v6 = a3;
    getNSErrorFromLiveFSErrno(57);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD))a3 + 2))(v6, 0);

  }
}

- (void)lookupIn:(id)a3 name:(id)a4 usingFlags:(unsigned int)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  uint64_t v9;
  unint64_t ourID;

  v9 = *(_QWORD *)&a5;
  ourID = self->_ourID;
  if (ourID)
    -[LiveFSVolume lookupin:name:forClient:usingFlags:requestID:reply:](self->mount, "lookupin:name:forClient:usingFlags:requestID:reply:", a3, a4, ourID, v9, a6, a7);
  else
    (*((void (**)(id, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a7 + 2))(a7, 70, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0);
}

- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  LiveFSVolume *mount;
  unint64_t ourID;
  _QWORD v19[4];
  id v20;
  LiveFSServiceConnection *v21;
  id v22;
  id v23;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = v14;
  if (self->_ourID)
  {
    -[LiveFSServiceConnection sanitizedAttrsForNewObjectAttrs:forType:](self, "sanitizedAttrsForNewObjectAttrs:forType:", a5, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    mount = self->mount;
    ourID = self->_ourID;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __76__LiveFSServiceConnection_makeDirectoryIn_named_attributes_requestID_reply___block_invoke;
    v19[3] = &unk_24F64C4E0;
    v23 = v15;
    v20 = v13;
    v21 = self;
    v22 = v12;
    -[LiveFSVolume makeDirectoryIn:named:attributes:andClient:requestID:reply:](mount, "makeDirectoryIn:named:attributes:andClient:requestID:reply:", v22, v20, v16, ourID, a6, v19);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, 70, 0, 0, 0, 0, 0);
  }

}

void __76__LiveFSServiceConnection_makeDirectoryIn_named_attributes_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v8;
  id v9;
  int v10;
  void *v11;
  id v12;

  v12 = a5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v8 = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("."));
  if (!a2 && (v8 & 1) == 0 && (a4 || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "workingSetInterest")))
  {
    v9 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = objc_msgSend(v9, "hasPersistentFileIDs");
    if (a4)
      objc_msgSend(v9, "updatedName:interestedItem:interestedClients:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), a4);
    if (objc_msgSend(v9, "workingSetInterest") && (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR(".")) & 1) == 0)
    {
      if (v10)
      {
        objc_msgSend(v9, "updatedItem:name:interestedItem:interestedClients:", v12, *(_QWORD *)(a1 + 32), CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v9, "workingSetInterest"));
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "volumeWideUpdatedName:interestedItem:interestedClients:", v11, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v9, "workingSetInterest"));

      }
    }

  }
}

- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  LiveFSVolume *mount;
  unint64_t ourID;
  _QWORD v22[4];
  id v23;
  LiveFSServiceConnection *v24;
  id v25;
  id v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = v17;
  if (self->_ourID)
  {
    -[LiveFSServiceConnection sanitizedAttrsForNewObjectAttrs:forType:](self, "sanitizedAttrsForNewObjectAttrs:forType:", a6, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    mount = self->mount;
    ourID = self->_ourID;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __83__LiveFSServiceConnection_makeSymLinkIn_named_contents_attributes_requestID_reply___block_invoke;
    v22[3] = &unk_24F64C4E0;
    v26 = v18;
    v23 = v15;
    v24 = self;
    v25 = v14;
    -[LiveFSVolume makeSymLinkIn:named:contents:attributes:andClient:requestID:reply:](mount, "makeSymLinkIn:named:contents:attributes:andClient:requestID:reply:", v25, v23, v16, v19, ourID, a7, v22);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v17 + 2))(v17, 70, 0, 0, 0, 0);
  }

}

void __83__LiveFSServiceConnection_makeSymLinkIn_named_contents_attributes_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  char v7;
  void *v8;
  id v9;
  id v10;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v7 = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("."));
  if (!a2 && (v7 & 1) == 0)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    if (a4)
    {
      v10 = v8;
      objc_msgSend(v10, "updatedName:interestedItem:interestedClients:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), a4);

    }
    else if (objc_msgSend(v8, "workingSetInterest"))
    {
      v9 = *(id *)(*(_QWORD *)(a1 + 40) + 8);

    }
  }
}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t ourID;
  LiveFSVolume *mount;
  _QWORD v19[4];
  id v20;
  LiveFSServiceConnection *v21;
  id v22;
  id v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = v15;
  ourID = self->_ourID;
  if (ourID)
  {
    mount = self->mount;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __72__LiveFSServiceConnection_makeLinkOf_named_inDirectory_requestID_reply___block_invoke;
    v19[3] = &unk_24F64C530;
    v24 = v15;
    v20 = v13;
    v21 = self;
    v22 = v14;
    v23 = v12;
    -[LiveFSVolume makeLinkOf:named:inDirectory:andClient:requestID:reply:](mount, "makeLinkOf:named:inDirectory:andClient:requestID:reply:", v23, v20, v22, ourID, a6, v19);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v15 + 2))(v15, 70, 0, 0, 0);
  }

}

void __72__LiveFSServiceConnection_makeLinkOf_named_inDirectory_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v10;
  int v11;
  void *v12;
  id v13;

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v10 = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("."));
  if (!a2 && (v10 & 1) == 0 && (a6 | a4 || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "workingSetInterest")))
  {
    v13 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = objc_msgSend(v13, "hasPersistentFileIDs");
    if (a4)
      objc_msgSend(v13, "updatedName:interestedItem:interestedClients:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), a4);
    if (a6)
      objc_msgSend(v13, "updatedItem:name:interestedItem:interestedClients:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), a6);
    if (objc_msgSend(v13, "workingSetInterest") && (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR(".")) & 1) == 0)
    {
      if (v11)
      {
        objc_msgSend(v13, "updatedItem:name:interestedItem:interestedClients:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v13, "workingSetInterest"));
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 32));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "volumeWideUpdatedName:interestedItem:interestedClients:", v12, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v13, "workingSetInterest"));

      }
    }

  }
}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  LiveFSVolume *mount;
  unint64_t ourID;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  v10 = *(_QWORD *)&a7;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  v19 = v18;
  if (self->_ourID)
  {
    -[LiveFSServiceConnection sanitizedAttrsForNewObjectAttrs:forType:](self, "sanitizedAttrsForNewObjectAttrs:forType:", a6, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    mount = self->mount;
    ourID = self->_ourID;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __95__LiveFSServiceConnection_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_reply___block_invoke;
    v23[3] = &unk_24F64C4E0;
    v26 = v19;
    v23[4] = self;
    v24 = v16;
    v25 = v17;
    -[LiveFSVolume makeCloneOf:named:inDirectory:attributes:usingFlags:andClient:requestID:reply:](mount, "makeCloneOf:named:inDirectory:attributes:usingFlags:andClient:requestID:reply:", v15, v24, v25, v20, v10, ourID, a8, v23);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v18 + 2))(v18, 70, 0, 0, 0, 0);
  }

}

void __95__LiveFSServiceConnection_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  int v9;
  void *v10;
  id v11;

  v11 = a5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (!a2 && (a4 || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "workingSetInterest")))
  {
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = objc_msgSend(v8, "hasPersistentFileIDs");
    if (a4)
      objc_msgSend(v8, "updatedName:interestedItem:interestedClients:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a4);
    if (objc_msgSend(v8, "workingSetInterest") && (objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR(".")) & 1) == 0)
    {
      if (v9)
      {
        objc_msgSend(v8, "updatedItem:name:interestedItem:interestedClients:", v11, *(_QWORD *)(a1 + 40), CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v8, "workingSetInterest"));
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "volumeWideUpdatedName:interestedItem:interestedClients:", v10, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v8, "workingSetInterest"));

      }
    }

  }
}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  -[LiveFSVolume open:withMode:requestID:reply:](self->mount, "open:withMode:requestID:reply:", a3, *(_QWORD *)&a4, a5, a6);
}

- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolume pathConfiguration:requestID:reply:](self->mount, "pathConfiguration:requestID:reply:", a3, a4, a5);
}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  -[LiveFSVolume otherAttributeOf:named:requestID:reply:](self->mount, "otherAttributeOf:named:requestID:reply:", a3, a4, a5, a6);
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  -[LiveFSVolume setOtherAttributeOf:named:value:requestID:reply:](self->mount, "setOtherAttributeOf:named:value:requestID:reply:", a3, a4, a5, a6, a7);
}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  -[LiveFSVolume readFrom:atOffset:intoBuffer:requestID:reply:](self->mount, "readFrom:atOffset:intoBuffer:requestID:reply:", a3, a4, a5, a6, a7);
}

- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  -[LiveFSVolume readFrom:length:atOffset:requestID:reply:](self->mount, "readFrom:length:atOffset:requestID:reply:", a3, a4, a5, a6, a7);
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  -[LiveFSVolume blockmapFile:range:startIO:flags:operationID:reply:](self->mount, "blockmapFile:range:startIO:flags:operationID:reply:", a3, a4.location, a4.length, *(_QWORD *)&a5, *(_QWORD *)&a6, a7);
}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  -[LiveFSVolume endIO:range:status:flags:operationID:reply:](self->mount, "endIO:range:status:flags:operationID:reply:", a3, a4.location, a4.length, *(_QWORD *)&a5, *(_QWORD *)&a6, a7);
}

- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  void (**v8)(id, uint64_t, _QWORD);
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  if (objc_msgSend(FSKitVolumeMachPortForKernelMount, "isEqualToString:", v11))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->ourConnection);
    objc_msgSend(WeakRetained, "valueForEntitlement:", CFSTR("com.apple.private.LiveFS.setmachport"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_msgSend(v10, "BOOLValue") & 1) != 0)
      -[LiveFSVolume fetchVolumeMachPortLabeled:forClient:requestID:reply:](self->mount, "fetchVolumeMachPortLabeled:forClient:requestID:reply:", v11, self->_ourID, a4, v8);
    else
      v8[2](v8, 13, 0);

  }
  else
  {
    v8[2](v8, 102, 0);
  }

}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  -[LiveFSVolume readDirectory:amount:cookie:verifier:requestID:reply:](self->mount, "readDirectory:amount:cookie:verifier:requestID:reply:", a3, a4, a5, a6, a7, a8);
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  -[LiveFSVolume readDirectory:intoBuffer:cookie:verifier:requestID:reply:](self->mount, "readDirectory:intoBuffer:cookie:verifier:requestID:reply:", a3, a4, a5, a6, a7, a8);
}

- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolume readLinkOf:requestID:reply:](self->mount, "readLinkOf:requestID:reply:", a3, a4, a5);
}

- (void)reclaim:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  unint64_t ourID;

  ourID = self->_ourID;
  if (ourID)
    -[LiveFSVolume reclaim:forClient:requestID:reply:](self->mount, "reclaim:forClient:requestID:reply:", a3, ourID, a4, a5);
  else
    (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  LiveFSVolume *mount;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  v10 = *(_QWORD *)&a6;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  mount = self->mount;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __76__LiveFSServiceConnection_removeItem_from_named_usingFlags_requestID_reply___block_invoke;
  v21[3] = &unk_24F64C558;
  v21[4] = self;
  v22 = v15;
  v23 = v14;
  v24 = v16;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  -[LiveFSVolume removeItem:from:named:usingFlags:requestID:reply:](mount, "removeItem:from:named:usingFlags:requestID:reply:", a3, v18, v19, v10, a7, v21);

}

void __76__LiveFSServiceConnection_removeItem_from_named_usingFlags_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, int a7)
{
  BOOL v12;
  id v13;
  int v14;
  void *v15;
  id v16;

  v16 = a6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (!a2)
  {
    if (a5 | a4
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "workingSetInterest") ? (v12 = a7 == 0) : (v12 = 1), !v12))
    {
      v13 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = objc_msgSend(v13, "hasPersistentFileIDs");
      if (a4)
        objc_msgSend(v13, "deletedName:item:interestedItem:how:interestedClients:", *(_QWORD *)(a1 + 40), v16, *(_QWORD *)(a1 + 48), 0, a4);
      if (a5)
        objc_msgSend(v13, "deletedItem:name:interestedItem:how:interestedClients:", v16, *(_QWORD *)(a1 + 40), v16, 0, a5);
      if (objc_msgSend(v13, "workingSetInterest")
        && (objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR(".")) & 1) == 0
        && (a7 & 1) == 0)
      {
        if (v14)
        {
          objc_msgSend(v13, "deletedItem:name:interestedItem:how:interestedClients:", v16, *(_QWORD *)(a1 + 40), CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), 0, objc_msgSend(v13, "workingSetInterest"));
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "volumeWideDeletedName:interestedItem:interestedClients:", v15, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v13, "workingSetInterest"));

        }
      }

    }
  }

}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  LiveFSVolume *mount;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  v10 = *(_QWORD *)&a6;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  mount = self->mount;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __81__LiveFSServiceConnection_removeDirectory_from_named_usingFlags_requestID_reply___block_invoke;
  v21[3] = &unk_24F64C558;
  v21[4] = self;
  v22 = v15;
  v23 = v14;
  v24 = v16;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  -[LiveFSVolume removeDirectory:from:named:usingFlags:requestID:reply:](mount, "removeDirectory:from:named:usingFlags:requestID:reply:", a3, v18, v19, v10, a7, v21);

}

void __81__LiveFSServiceConnection_removeDirectory_from_named_usingFlags_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, int a7)
{
  BOOL v12;
  id v13;
  int v14;
  void *v15;
  id v16;

  v16 = a6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (!a2)
  {
    if (a5 | a4
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "workingSetInterest") ? (v12 = a7 == 0) : (v12 = 1), !v12))
    {
      v13 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = objc_msgSend(v13, "hasPersistentFileIDs");
      if (a4)
        objc_msgSend(v13, "deletedName:item:interestedItem:how:interestedClients:", *(_QWORD *)(a1 + 40), v16, *(_QWORD *)(a1 + 48), 0, a4);
      if (a5)
        objc_msgSend(v13, "deletedItem:name:interestedItem:how:interestedClients:", v16, *(_QWORD *)(a1 + 40), v16, 0, a5);
      if (objc_msgSend(v13, "workingSetInterest")
        && (objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR(".")) & 1) == 0
        && (a7 & 1) == 0)
      {
        if (v14)
        {
          objc_msgSend(v13, "deletedItem:name:interestedItem:how:interestedClients:", v16, *(_QWORD *)(a1 + 40), CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), 0, objc_msgSend(v13, "workingSetInterest"));
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "volumeWideDeletedName:interestedItem:interestedClients:", v15, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v13, "workingSetInterest"));

        }
      }

    }
  }

}

- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  int v21;
  LiveFSVolume *mount;
  int v23;
  int v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  int v36;
  unsigned int v37;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a11;
  v20 = objc_msgSend(v18, "hasPrefix:", CFSTR("."));
  v21 = objc_msgSend(v16, "hasPrefix:", CFSTR("."));
  mount = self->mount;
  if (v20)
    v23 = 2;
  else
    v23 = 3;
  v30[0] = MEMORY[0x24BDAC760];
  if (v21)
    v24 = v23;
  else
    v24 = v20;
  v30[1] = 3221225472;
  v30[2] = __105__LiveFSServiceConnection_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_reply___block_invoke;
  v30[3] = &unk_24F64C580;
  v30[4] = self;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v35 = v19;
  v36 = v24;
  v37 = a9;
  v25 = v18;
  v26 = v17;
  v27 = v16;
  v28 = v15;
  v29 = v19;
  -[LiveFSVolume renameItemIn:named:toDirectory:newName:usingFlags:requestID:reply:](mount, "renameItemIn:named:toDirectory:newName:usingFlags:requestID:reply:", v28, v27, v26, v25, a9 & 0xFFFF7FFF, a10, v30);

}

void __105__LiveFSServiceConnection_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, char a9, uint64_t a10, void *a11, char a12)
{
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  void *v25;
  int v26;
  id v27;
  int v28;
  int v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v17 = a8;
  v18 = a11;
  v29 = *(_DWORD *)(a1 + 80);
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  if (!a2)
  {
    v19 = a6 | a4 | a7 | a10;
    if (v19)
      goto LABEL_3;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "workingSetInterest"))
    {
      v24 = a9 ^ 1;
      if (*(_DWORD *)(a1 + 80) == 2)
        v24 = 0;
      if ((v24 & 1) != 0 || (a12 & 1) == 0)
      {
LABEL_3:
        v20 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
        v28 = objc_msgSend(v20, "hasPersistentFileIDs");
        objc_msgSend(v20, "itemRenamedIn:named:originalID:intoDirectory:newName:atopItem:interestedClients:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v17, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v18, v19);
        livefs_std_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = *(_QWORD *)(a1 + 48);
          v23 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 136316674;
          v31 = "-[LiveFSServiceConnection renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:reply:]_block_invoke";
          v32 = 2048;
          v33 = a4;
          v34 = 2048;
          v35 = a6;
          v36 = 2048;
          v37 = a7;
          v38 = 2048;
          v39 = a10;
          v40 = 2112;
          v41 = v22;
          v42 = 2112;
          v43 = v23;
          _os_log_impl(&dword_22BD61000, v21, OS_LOG_TYPE_DEFAULT, "%s: fromDir %02llx toDir %02llx moved %02llx overwritten %02llx from Name %@ to name %@", buf, 0x48u);
        }

        if (objc_msgSend(v20, "workingSetInterest") && (a12 & 1) == 0)
        {
          if (v28)
          {
            objc_msgSend(v20, "deletedItem:name:interestedItem:how:interestedClients:", v18, *(_QWORD *)(a1 + 64), CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), 0, objc_msgSend(v20, "workingSetInterest"));
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 56), "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 64));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "volumeWideDeletedName:interestedItem:interestedClients:", v25, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v20, "workingSetInterest"));

          }
        }
        if ((*(_BYTE *)(a1 + 85) & 0x80) != 0 && v29 == 1)
          goto LABEL_29;
        if (!objc_msgSend(v20, "workingSetInterest"))
          goto LABEL_29;
        if ((a9 & 1) != 0)
          goto LABEL_29;
        v26 = *(_DWORD *)(a1 + 80);
        if (v26 == 2)
          goto LABEL_29;
        if (v26 == 1)
        {
          if (v28)
          {
            objc_msgSend(v20, "deletedItem:name:interestedItem:how:interestedClients:", v17, *(_QWORD *)(a1 + 48), CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), 1, objc_msgSend(v20, "workingSetInterest"));
LABEL_29:

            goto LABEL_30;
          }
          v27 = v17;
          objc_msgSend(v20, "volumeWideDeletedName:interestedItem:interestedClients:", v27, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v20, "workingSetInterest"));
        }
        else
        {
          if (v28)
          {
            objc_msgSend(v20, "updatedItem:name:interestedItem:interestedClients:", v17, *(_QWORD *)(a1 + 64), CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v20, "workingSetInterest"));
            goto LABEL_29;
          }
          v27 = v17;
          objc_msgSend(v20, "volumeWideUpdatedName:interestedItem:interestedClients:", v27, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v20, "workingSetInterest"));
        }

        goto LABEL_29;
      }
    }
  }
LABEL_30:

}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  LiveFSVolume *mount;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v10 = a3;
  v11 = a6;
  mount = self->mount;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__LiveFSServiceConnection_setFileAttributesOf_to_requestID_reply___block_invoke;
  v15[3] = &unk_24F64C5A8;
  v16 = v10;
  v17 = v11;
  v15[4] = self;
  v13 = v10;
  v14 = v11;
  -[LiveFSVolume setFileAttributesOf:to:requestID:reply:](mount, "setFileAttributesOf:to:requestID:reply:", v13, a4, a5, v15);

}

void __66__LiveFSServiceConnection_setFileAttributesOf_to_requestID_reply___block_invoke(_QWORD *a1, int a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, int a8)
{
  id v14;
  uint64_t v15;
  id v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;

  v21 = a4;
  v14 = a6;
  (*(void (**)(void))(a1[6] + 16))();
  if (!a2)
  {
    if (a7 | a5 || (v15 = objc_msgSend(*(id *)(a1[4] + 8), "workingSetInterest"), a8 != 2) && v15)
    {
      v16 = *(id *)(a1[4] + 8);
      v17 = objc_msgSend(v16, "hasPersistentFileIDs");
      if (a7)
        objc_msgSend(v16, "updatedItem:name:interestedItem:interestedClients:", a1[5], a1[5], a1[5], a7);
      if (a5)
        objc_msgSend(v16, "updatedName:interestedItem:interestedClients:", v14, v21, a5);
      v18 = objc_msgSend(v16, "workingSetInterest");
      if (a8 == 2 || !v18)
        goto LABEL_19;
      v19 = (void *)a1[5];
      if (a8 == 1)
      {
        if (v17)
        {
          objc_msgSend(v16, "deletedItem:name:interestedItem:how:interestedClients:", v19, &stru_24F64CE40, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), 1, objc_msgSend(v16, "workingSetInterest"));
LABEL_19:

          goto LABEL_20;
        }
        v20 = v19;
        objc_msgSend(v16, "volumeWideDeletedName:interestedItem:interestedClients:", v20, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v16, "workingSetInterest"));
      }
      else
      {
        if (v17)
        {
          objc_msgSend(v16, "updatedItem:name:interestedItem:interestedClients:", v19, &stru_24F64CE40, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v16, "workingSetInterest"));
          goto LABEL_19;
        }
        v20 = v19;
        objc_msgSend(v16, "volumeWideUpdatedName:interestedItem:interestedClients:", v20, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v16, "workingSetInterest"));
      }

      goto LABEL_19;
    }
  }
LABEL_20:

}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolume volumeStatistics:requestID:reply:](self->mount, "volumeStatistics:requestID:reply:", a3, a4, a5);
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  -[LiveFSVolume writeTo:atOffset:fromBuffer:requestID:reply:](self->mount, "writeTo:atOffset:fromBuffer:requestID:reply:", a3, a4, a5, a6, a7);
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 sharedBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  LiveFSVolume *mount;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  objc_msgSend(v13, "createDispatchData");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v23[5];
  v23[5] = v15;

  v17 = v23[5];
  if (v17)
  {
    mount = self->mount;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __73__LiveFSServiceConnection_writeTo_atOffset_sharedBuffer_requestID_reply___block_invoke;
    v19[3] = &unk_24F64C5D0;
    v21 = &v22;
    v20 = v14;
    -[LiveFSVolume writeTo:atOffset:fromBuffer:requestID:reply:](mount, "writeTo:atOffset:fromBuffer:requestID:reply:", v12, a4, v17, a6, v19);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v14 + 2))(v14, 12, 0, 0);
  }
  _Block_object_dispose(&v22, 8);

}

void __73__LiveFSServiceConnection_writeTo_atOffset_sharedBuffer_requestID_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;
  v7 = a4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  -[LiveFSVolume readDirectory:amount:requestedAttributes:cookie:verifier:requestID:reply:](self->mount, "readDirectory:amount:requestedAttributes:cookie:verifier:requestID:reply:", a3, a4, a5, a6, a7, a8);
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  -[LiveFSVolume readDirectory:intoBuffer:requestedAttributes:cookie:verifier:requestID:reply:](self->mount, "readDirectory:intoBuffer:requestedAttributes:cookie:verifier:requestID:reply:", a3, a4, a5, a6, a7, a8);
}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  -[LiveFSVolume xattrOf:named:requestID:reply:](self->mount, "xattrOf:named:requestID:reply:", a3, a4, a5, a6);
}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  LiveFSVolume *mount;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v10 = *(_QWORD *)&a6;
  v14 = a3;
  v15 = a8;
  mount = self->mount;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __70__LiveFSServiceConnection_setXattrOf_named_value_how_requestID_reply___block_invoke;
  v19[3] = &unk_24F64C5F8;
  v20 = v14;
  v21 = v15;
  v19[4] = self;
  v17 = v14;
  v18 = v15;
  -[LiveFSVolume setXattrOf:named:value:how:requestID:reply:](mount, "setXattrOf:named:value:how:requestID:reply:", v17, a4, a5, v10, a7, v19);

}

void __70__LiveFSServiceConnection_setXattrOf_named_value_how_requestID_reply___block_invoke(_QWORD *a1, int a2, void *a3, uint64_t a4, void *a5, uint64_t a6, int a7)
{
  id v13;
  uint64_t v14;
  id v15;
  int v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  v20 = a3;
  v13 = a5;
  (*(void (**)(void))(a1[6] + 16))();
  if (!a2)
  {
    if (a6 | a4 || (v14 = objc_msgSend(*(id *)(a1[4] + 8), "workingSetInterest"), a7 != 2) && v14)
    {
      v15 = *(id *)(a1[4] + 8);
      v16 = objc_msgSend(v15, "hasPersistentFileIDs");
      if (a6)
        objc_msgSend(v15, "updatedItem:name:interestedItem:interestedClients:", a1[5], a1[5], a1[5], a6);
      if (a4)
        objc_msgSend(v15, "updatedName:interestedItem:interestedClients:", v13, v20, a4);
      v17 = objc_msgSend(v15, "workingSetInterest");
      if (a7 == 2 || !v17)
        goto LABEL_19;
      v18 = (void *)a1[5];
      if (a7 == 1)
      {
        if (v16)
        {
          objc_msgSend(v15, "deletedItem:name:interestedItem:how:interestedClients:", v18, &stru_24F64CE40, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), 1, objc_msgSend(v15, "workingSetInterest"));
LABEL_19:

          goto LABEL_20;
        }
        v19 = v18;
        objc_msgSend(v15, "volumeWideDeletedName:interestedItem:interestedClients:", v19, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v15, "workingSetInterest"));
      }
      else
      {
        if (v16)
        {
          objc_msgSend(v15, "updatedItem:name:interestedItem:interestedClients:", v18, &stru_24F64CE40, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v15, "workingSetInterest"));
          goto LABEL_19;
        }
        v19 = v18;
        objc_msgSend(v15, "volumeWideUpdatedName:interestedItem:interestedClients:", v19, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), objc_msgSend(v15, "workingSetInterest"));
      }

      goto LABEL_19;
    }
  }
LABEL_20:

}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolume listXattrsOf:requestID:reply:](self->mount, "listXattrsOf:requestID:reply:", a3, a4, a5);
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  uint64_t v11;
  uint64_t v13;
  NSXPCConnection **p_ourConnection;
  id v19;
  id v20;
  id v21;
  id v22;
  id WeakRetained;
  id v24;

  v11 = *(_QWORD *)&a9;
  v13 = *(_QWORD *)&a7;
  p_ourConnection = &self->ourConnection;
  v19 = a11;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_ourConnection);
  v24 = +[LiveFSVolumeSearchResultConnector newSearchConnector:connection:maxData:maxDelay:initialCredits:](LiveFSVolumeSearchResultConnector, "newSearchConnector:connection:maxData:maxDelay:initialCredits:", v21, WeakRetained, v13, v11, a8);

  -[LiveFSVolume search:token:criteria:returnProxy:forClient:requestID:reply:](self->mount, "search:token:criteria:returnProxy:forClient:requestID:reply:", v22, v21, v20, v24, self->_ourID, a10, v19);
}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  -[LiveFSVolume replenishSearchCreditsFor:credits:requestID:reply:](self->mount, "replenishSearchCreditsFor:credits:requestID:reply:", a3, *(_QWORD *)&a4, a5, a6);
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolume abortSearch:requestID:reply:](self->mount, "abortSearch:requestID:reply:", a3, a4, a5);
}

- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  -[LiveFSVolume checkAccessTo:requestedAccess:requestID:reply:](self->mount, "checkAccessTo:requestedAccess:requestID:reply:", a3, *(_QWORD *)&a4, a5, a6);
}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  _BOOL4 v8;
  id v10;
  void (**v11)(id, NSObject *);
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  NSObject *setUpdateInterestQueue;
  LiveFSVolume *v18;
  LiveFSVolume *mount;
  unint64_t v20;
  unint64_t ourID;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  LiveFSServiceConnection *v26;
  id v27;
  NSObject *v28;
  uint64_t *v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v8 = a4;
  v10 = a3;
  v11 = (void (**)(id, NSObject *))a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  v37 = 0;
  v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier"));
  v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"));
  if ((v12 & v8) == 1)
  {
    getNSErrorFromLiveFSErrno(22);
    v14 = objc_claimAutoreleasedReturnValue();
    v11[2](v11, v14);
LABEL_6:

    goto LABEL_16;
  }
  v15 = v13;
  if ((v12 | v13 ^ 1) == 1)
  {
    v16 = dispatch_group_create();
    dispatch_group_enter(v16);
    setUpdateInterestQueue = self->setUpdateInterestQueue;
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __70__LiveFSServiceConnection_setUpdateInterest_interest_requestID_reply___block_invoke;
    v25 = &unk_24F64C648;
    v26 = self;
    v31 = v8;
    v27 = v10;
    v29 = &v32;
    v30 = a5;
    v14 = v16;
    v28 = v14;
    dispatch_async(setUpdateInterestQueue, &v22);
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if (v33[5])
    {
      ((void (*)(void (**)(id, NSObject *)))v11[2])(v11);

      goto LABEL_6;
    }

  }
  if ((v12 | v15) == 1)
  {
    v18 = self->mount;
    objc_sync_enter(v18);
    mount = self->mount;
    if (v8)
    {
      v20 = self->_ourID | -[LiveFSVolume workingSetInterest](self->mount, "workingSetInterest");
    }
    else
    {
      ourID = self->_ourID;
      v20 = -[LiveFSVolume workingSetInterest](self->mount, "workingSetInterest") & ~ourID;
    }
    -[LiveFSVolume setWorkingSetInterest:](mount, "setWorkingSetInterest:", v20, v22, v23, v24, v25, v26);
    objc_sync_exit(v18);

  }
  if (!v8)
    -[LiveFSVolume itemUpdatesDone:interestedClients:](self->mount, "itemUpdatesDone:interestedClients:", v10, self->_ourID);
  v11[2](v11, 0);
LABEL_16:
  _Block_object_dispose(&v32, 8);

}

void __70__LiveFSServiceConnection_setUpdateInterest_interest_requestID_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 72);
  v4 = *(void **)(v1 + 8);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(a1 + 64);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v8 = *(_OWORD *)(a1 + 48);
  v9[2] = __70__LiveFSServiceConnection_setUpdateInterest_interest_requestID_reply___block_invoke_2;
  v9[3] = &unk_24F64C620;
  v7 = (id)v8;
  v10 = v8;
  objc_msgSend(v4, "setUpdateInterest:interest:forClient:requestID:reply:", v2, v3, v5, v6, v9);

}

void __70__LiveFSServiceConnection_setUpdateInterest_interest_requestID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  if (self->_ourID)
    -[LiveFSVolume verifyItemExistenceByIDs:requestID:reply:](self->mount, "verifyItemExistenceByIDs:requestID:reply:", a3, a4, a5);
  else
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 70, 0);
}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  if (self->_ourID)
    -[LiveFSVolume parentsAndAttributesForItemsByID:requestID:reply:](self->mount, "parentsAndAttributesForItemsByID:requestID:reply:", a3, a4, a5);
  else
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 70, 0);
}

- (void)pathsAndAttributesForItemsByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, int, void *);
  void *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (self->_ourID)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __75__LiveFSServiceConnection_pathsAndAttributesForItemsByIDs_requestID_reply___block_invoke;
    v16 = &unk_24F64C670;
    v18 = v9;
    v11 = v8;
    v17 = v11;
    v12 = (void *)MEMORY[0x22E2FAC64](&v13);
    -[LiveFSVolume parentsAndAttributesForItemsByID:requestID:reply:](self->mount, "parentsAndAttributesForItemsByID:requestID:reply:", v11, a4, v12, v13, v14, v15, v16);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 70, 0);
  }

}

void __75__LiveFSServiceConnection_pathsAndAttributesForItemsByIDs_requestID_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t *v25;
  const char *v26;
  size_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!a2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
    v30 = a1;
    v7 = objc_msgSend(*(id *)(a1 + 32), "length");
    if ((v7 & 0x7FFFFFFF8) == 0)
    {
LABEL_27:
      (*(void (**)(void))(*(_QWORD *)(v30 + 40) + 16))();

      goto LABEL_28;
    }
    v8 = 0;
    v9 = (v7 >> 3);
    v10 = 0x24BDD1000uLL;
    v33 = v9;
    v34 = v6;
    v36 = v5;
    while (1)
    {
      objc_msgSend(*(id *)(v10 + 1760), "numberWithUnsignedLongLong:", *(_QWORD *)(v6 + 8 * v8));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        break;
LABEL_26:

      if (++v8 == v9)
        goto LABEL_27;
    }
    v13 = v12;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("attributes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      v22 = v13;
LABEL_25:

      goto LABEL_26;
    }
    v16 = objc_retainAutorelease(v14);
    v17 = objc_msgSend(v16, "bytes");
    v35 = v15;
    if (*(_QWORD *)(v17 + 72) == *(_QWORD *)(v17 + 64))
    {
      LOBYTE(v37[0]) = 0;
      v18 = v37;
      v19 = v13;
LABEL_9:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v18);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v20, CFSTR("path"), v16, CFSTR("attributes"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, v11);
    }
    else
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("name"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        v22 = 0;
        v29 = v13;
LABEL_24:

        v13 = v29;
        v15 = v35;
        goto LABEL_25;
      }
      v31 = v16;
      v24 = 0;
      v25 = &v38;
      v19 = v13;
      while (1)
      {
        v20 = objc_retainAutorelease(v23);
        v26 = (const char *)objc_msgSend(v20, "UTF8String");
        v27 = strlen(v26);
        if (!v27 || (v18 = (uint64_t *)((char *)v25 + ~v27), v18 < v37))
        {
          v21 = v13;
          v13 = 0;
          v5 = v36;
          goto LABEL_23;
        }
        memcpy((char *)v25 + ~v27, v26, v27);
        *((_BYTE *)v25 - 1) = v24;
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("parent"));
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
        {

          v5 = v36;
          v16 = v31;
          goto LABEL_9;
        }
        v21 = (void *)v28;
        v5 = v36;
        objc_msgSend(v36, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
          break;

        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("name"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 47;
        v25 = v18;
        v19 = v29;
        if (!v23)
        {
          v22 = 0;
          v5 = v36;
          v9 = v33;
          v6 = v34;
          v10 = 0x24BDD1000;
          goto LABEL_24;
        }
      }

      v13 = 0;
      v19 = 0;
    }
LABEL_23:
    v22 = v13;

    v13 = v20;
    v29 = v19;
    v9 = v33;
    v6 = v34;
    v10 = 0x24BDD1000;
    goto LABEL_24;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_28:

}

- (void)LIGetAttr:(id)a3 reply:(id)a4
{
  -[LiveFSVolume fileAttributes:requestID:reply:](self->mount, "fileAttributes:requestID:reply:", a3, -1, a4);
}

- (void)LIGetFsAttr:(id)a3 name:(id)a4 reply:(id)a5
{
  -[LiveFSVolume otherAttributeOf:named:requestID:reply:](self->mount, "otherAttributeOf:named:requestID:reply:", a3, a4, -1, a5);
}

- (void)LIGetParentsAndAttributesForFileIDs:(id)a3 reply:(id)a4
{
  -[LiveFSVolume parentsAndAttributesForItemsByID:requestID:reply:](self->mount, "parentsAndAttributesForItemsByID:requestID:reply:", a3, -1, a4);
}

- (void)LILookup:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  unint64_t ourID;
  LiveFSVolume *mount;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v9 = v8;
  ourID = self->_ourID;
  if (ourID)
  {
    mount = self->mount;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__LiveFSServiceConnection_LILookup_name_reply___block_invoke;
    v12[3] = &unk_24F64C698;
    v13 = v8;
    -[LiveFSVolume lookupin:name:forClient:usingFlags:requestID:reply:](mount, "lookupin:name:forClient:usingFlags:requestID:reply:", a3, a4, ourID, 0, -1, v12);

  }
  else
  {
    (*((void (**)(id, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 70, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0);
  }

}

uint64_t __47__LiveFSServiceConnection_LILookup_name_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
}

- (void)LISearch:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 reply:(id)a10
{
  -[LiveFSServiceConnection search:token:criteria:resumeAt:maxData:maxDelay:initialCredits:requestID:reply:](self, "search:token:criteria:resumeAt:maxData:maxDelay:initialCredits:requestID:reply:", a3, a4, a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a9, a8, -1, a10);
}

- (void)LISearchAbort:(id)a3 reply:(id)a4
{
  -[LiveFSVolume abortSearch:requestID:reply:](self->mount, "abortSearch:requestID:reply:", a3, -1, a4);
}

- (unint64_t)ourID
{
  return self->_ourID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->setUpdateInterestQueue, 0);
  objc_destroyWeak((id *)&self->ourConnection);
  objc_storeStrong((id *)&self->mount, 0);
}

@end
