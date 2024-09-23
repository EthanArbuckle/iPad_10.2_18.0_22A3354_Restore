@implementation IMDFileTransferCenter

- (NSMutableDictionary)guidToTransferMap
{
  return self->_guidToTransferMap;
}

- (NSString)contextStamp
{
  return self->_contextStamp;
}

- (id)_dictionaryRepresentationsForFileTransfers:(id)a3 toSave:(BOOL)a4
{
  id v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;
  _QWORD v10[4];

  v5 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D14172EC;
  v8[3] = &unk_1E922AC88;
  v9 = a4;
  v8[4] = v10;
  objc_msgSend(v5, "__imArrayByApplyingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v10, 8);

  return v6;
}

- (id)_allFileTransfers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "arrayByApplyingSelector:", sel_guid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDFileTransferCenter _dictionaryRepresentationsForFileTransfers:toSave:](self, "_dictionaryRepresentationsForFileTransfers:toSave:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sharedInstance
{
  if (qword_1ED935C78 != -1)
    dispatch_once(&qword_1ED935C78, &unk_1E922AC60);
  return (id)qword_1ED935DA8;
}

- (void)addHubbleRequestedTransfer:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "guid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[IMDFileTransferCenter activeHubbleRequestedTransfers](self, "activeHubbleRequestedTransfers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)_removeHubbleRequestedTransfer:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "guid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    -[IMDFileTransferCenter activeHubbleRequestedTransfers](self, "activeHubbleRequestedTransfers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v7);

    if (v5)
    {
      -[IMDFileTransferCenter activeHubbleRequestedTransfers](self, "activeHubbleRequestedTransfers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v7);

    }
  }

}

- (void)postHubbleDownloadFinishedIfNeededForTransfer:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[IMDFileTransferCenter activeHubbleRequestedTransfers](self, "activeHubbleRequestedTransfers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
    {
      -[IMDFileTransferCenter _removeHubbleRequestedTransfer:](self, "_removeHubbleRequestedTransfer:", v8);
      if (objc_msgSend(v8, "existsAtLocalPath"))
      {
        -[IMDFileTransferCenter _completeHubbleDownloadForTransfer:](self, "_completeHubbleDownloadForTransfer:", v8);
      }
      else
      {
        +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:description:](IMDFileTransferCenter, "localFileURLRetrievalErrorWithReason:description:", 2, CFSTR("The file transfer does not exist on disk, but the transfer was explicitly ended."));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDFileTransferCenter _postHubbleDownloadFailedForTransfer:error:](self, "_postHubbleDownloadFailedForTransfer:error:", v8, v7);

      }
    }
  }

}

- (void)postHubbleDownloadFailedIfNeededForTransfer:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[IMDFileTransferCenter activeHubbleRequestedTransfers](self, "activeHubbleRequestedTransfers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if (v9)
    {
      -[IMDFileTransferCenter _removeHubbleRequestedTransfer:](self, "_removeHubbleRequestedTransfer:", v10);
      -[IMDFileTransferCenter _postHubbleDownloadFailedForTransfer:error:](self, "_postHubbleDownloadFailedForTransfer:error:", v10, v6);
    }
  }

}

- (void)_completeHubbleDownloadForTransfer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "guid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDFileTransferCenter _hubbleTransferCompleted:withGUID:error:suggestedRetryGUID:](self, "_hubbleTransferCompleted:withGUID:error:suggestedRetryGUID:", v4, v5, 0, 0);

}

- (void)_postHubbleDownloadFailedForTransfer:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "guid");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDFileTransferCenter _hubbleTransferCompleted:withGUID:error:suggestedRetryGUID:](self, "_hubbleTransferCompleted:withGUID:error:suggestedRetryGUID:", v7, v8, v6, 0);

}

- (IMDFileTransferCenter)init
{
  IMDFileTransferCenter *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMDFileTransferCenter;
  v2 = -[IMDFileTransferCenter init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDFileTransferCenter setContextStamp:](v2, "setContextStamp:", v3);

    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[IMDFileTransferCenter setGuidToTransferMap:](v2, "setGuidToTransferMap:", v4);

    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[IMDFileTransferCenter setActiveTransfers:](v2, "setActiveTransfers:", v5);

    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[IMDFileTransferCenter setTransferringTransfers:](v2, "setTransferringTransfers:", v6);

    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[IMDFileTransferCenter setActiveHubbleRequestedTransfers:](v2, "setActiveHubbleRequestedTransfers:", v7);

  }
  return v2;
}

- (id)_progressForTransferGUID:(id)a3 allowCreate:(BOOL)a4 path:(id)a5
{
  return 0;
}

- (void)_updateContextStamp
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDFileTransferCenter setContextStamp:](self, "setContextStamp:", v3);

}

- (void)_postUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "broadcasterForFileTransferListeners");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileTransfer:updatedWithProperties:", v7, v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "__mainThreadPostNotificationName:object:", CFSTR("__kIMDFileTransferUpdatedNotification"), v4);

  }
}

+ (id)fileTransferErrorWithReason:(int64_t)a3 description:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0D37F78];
  v16[0] = *MEMORY[0x1E0CB2D50];
  v7 = (void *)MEMORY[0x1E0CB34D0];
  v8 = a4;
  objc_msgSend(v7, "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("File transfer operation was unsuccessful."), &stru_1E92346B0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v16[1] = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v8, &stru_1E92346B0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)localFileURLRetrievalErrorWithReason:(int64_t)a3 description:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0D37F80];
  v16[0] = *MEMORY[0x1E0CB2D50];
  v7 = (void *)MEMORY[0x1E0CB34D0];
  v8 = a4;
  objc_msgSend(v7, "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("File transfer local file URL retrieval operation was unsuccessful."), &stru_1E92346B0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v16[1] = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v8, &stru_1E92346B0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)localFileURLRetrievalErrorWithReason:(int64_t)a3 underlyingReason:(int64_t)a4 description:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0D37F80];
  v20[0] = *MEMORY[0x1E0CB2D50];
  v10 = (void *)MEMORY[0x1E0CB34D0];
  v11 = a5;
  objc_msgSend(v10, "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("File transfer local file URL retrieval operation was unsuccessful."), &stru_1E92346B0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v20[1] = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", v11, &stru_1E92346B0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v21[1] = v15;
  v20[2] = *MEMORY[0x1E0CB3388];
  objc_msgSend(a1, "fileTransferErrorWithReason:description:", a4, CFSTR("See error code and compare against IMFileTransferErrorReason."));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, a3, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_addGatekeeperProperties:(id)a3 toDirectory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMDFileTransferCenter _addGatekeeperProperties:toFileAtPath:](self, "_addGatekeeperProperties:toFileAtPath:", v6, v7);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumeratorAtPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v7, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14), (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDFileTransferCenter _addGatekeeperProperties:toFileAtPath:](self, "_addGatekeeperProperties:toFileAtPath:", v6, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (id)_createWrapperForTransfer:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "_needsWrapper");
  objc_msgSend(v4, "localURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByDeletingPathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createUniqueDirectoryWithName:atPath:ofType:", v11, v9, *MEMORY[0x1E0D37FD8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "stringByAppendingPathComponent:", *MEMORY[0x1E0D37FE0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "guid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v15, "writeToFile:atomically:encoding:error:", v14, 1, 4, &v19);
      v16 = v19;

      if (v16)
      {

        v13 = 0;
      }

    }
    objc_msgSend(v13, "stringByAppendingPathComponent:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)_removeWrapperForTransfer:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
  objc_msgSend(v4, "localURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_addActiveTransfer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    -[IMDFileTransferCenter activeTransfers](self, "activeTransfers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
  }

}

- (BOOL)_hasActiveTransferWithGUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[IMDFileTransferCenter activeTransfers](self, "activeTransfers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)_removeActiveTransfer:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    -[IMDFileTransferCenter activeTransfers](self, "activeTransfers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v7);

    if (v5)
    {
      -[IMDFileTransferCenter activeTransfers](self, "activeTransfers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v7);

    }
    -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
  }

}

- (void)_addTransferringTransfer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    -[IMDFileTransferCenter transferringTransfers](self, "transferringTransfers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__transferTimerTick_, 0, 1, 0.25);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDFileTransferCenter setTransferTimer:](self, "setTransferTimer:", v7);

    }
    -[IMDFileTransferCenter transferringTransfers](self, "transferringTransfers");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

  }
}

- (void)_removeTransferringTransfer:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    -[IMDFileTransferCenter transferringTransfers](self, "transferringTransfers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v10);

    if (v5)
    {
      -[IMDFileTransferCenter transferringTransfers](self, "transferringTransfers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v10);

      -[IMDFileTransferCenter transferringTransfers](self, "transferringTransfers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (!v8)
      {
        -[IMDFileTransferCenter transferTimer](self, "transferTimer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "invalidate");

        -[IMDFileTransferCenter setTransferTimer:](self, "setTransferTimer:", 0);
      }
    }
  }

}

- (void)_transferTimerTick:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[IMDFileTransferCenter transferringTransfers](self, "transferringTransfers", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "_copyForEnumerating");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "averageTransferRate");
        v11 = objc_msgSend(v9, "currentBytes");
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSince1970");
        v14 = v13;

        objc_msgSend(v9, "_lastAveragedInterval");
        if (v14 - v15 > 1.0)
        {
          v16 = (double)(unint64_t)objc_msgSend(v9, "averageTransferRate");
          v10 = (unint64_t)(v16
                                 + ((double)v11 - (double)(unint64_t)objc_msgSend(v9, "_lastAveragedBytes") - v16)
                                 * 0.333333333);
          objc_msgSend(v9, "_setAveragedTransferRate:lastAveragedInterval:lastAveragedBytes:", v10, v11, v14);
        }
        objc_msgSend(v9, "_setLastUpdatedInterval:", v14);
        +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "broadcasterForFileTransferListeners");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "guid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileTransfer:updatedWithCurrentBytes:totalBytes:averageTransferRate:", v19, v11, objc_msgSend(v9, "totalBytes"), v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

}

- (void)makeNewIncomingTransferWithGUID:(id)a3 filename:(id)a4 isDirectory:(BOOL)a5 totalBytes:(unint64_t)a6 hfsType:(unsigned int)a7 hfsCreator:(unsigned int)a8 hfsFlags:(unsigned __int16)a9
{
  _BOOL8 v12;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v12 = a5;
  v21 = a3;
  v15 = a4;
  if (objc_msgSend(v21, "length"))
  {
    v16 = objc_alloc(MEMORY[0x1E0D39848]);
    objc_msgSend(v15, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v20) = 1;
    LOWORD(v20) = a9;
    v18 = (void *)objc_msgSend(v16, "_initWithGUID:filename:isDirectory:localURL:account:otherPerson:totalBytes:hfsType:hfsCreator:hfsFlags:isIncoming:", v21, v17, v12, 0, 0, 0, a6, __PAIR64__(a8, a7), v20);

    -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v21);

  }
}

- (id)createNewOutgoingTransferWithLocalFileURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v21;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v6, &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CB2B20]);

  v11 = objc_alloc(MEMORY[0x1E0D39848]);
  objc_msgSend(v6, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "fileSize");
  v14 = objc_msgSend(v8, "fileHFSTypeCode");
  v15 = objc_msgSend(v8, "fileHFSCreatorCode");
  BYTE2(v19) = 0;
  LOWORD(v19) = objc_msgSend(v8, "fileHFSFlags");
  v16 = (void *)objc_msgSend(v11, "_initWithGUID:filename:isDirectory:localURL:account:otherPerson:totalBytes:hfsType:hfsCreator:hfsFlags:isIncoming:", v5, v12, v10, v4, 0, 0, v13, __PAIR64__(v15, v14), v19);

  -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v5);

  return v5;
}

- (void)broadcastTransfersWithGUIDs:(id)a3 atLocalPaths:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "broadcasterForFileTransferListeners");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileTransfers:createdWithLocalPaths:", v6, v5);

}

- (void)makeNewOutgoingTransferWithGUID:(id)a3 filename:(id)a4 isDirectory:(BOOL)a5 totalBytes:(unint64_t)a6 hfsType:(unsigned int)a7 hfsCreator:(unsigned int)a8 hfsFlags:(unsigned __int16)a9
{
  _BOOL8 v12;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v12 = a5;
  v19 = a3;
  v15 = a4;
  if (objc_msgSend(v19, "length"))
  {
    BYTE2(v18) = 0;
    LOWORD(v18) = a9;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39848]), "_initWithGUID:filename:isDirectory:localURL:account:otherPerson:totalBytes:hfsType:hfsCreator:hfsFlags:isIncoming:", v19, v15, v12, 0, 0, 0, a6, __PAIR64__(a8, a7), v18);
    -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v19);

  }
}

- (id)guidForNewIncomingTransferWithFilename:(id)a3 isDirectory:(BOOL)a4 totalBytes:(unint64_t)a5 hfsType:(unsigned int)a6 hfsCreator:(unsigned int)a7 hfsFlags:(unsigned __int16)a8
{
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v12;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v12 = a4;
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = a3;
  objc_msgSend(v14, "stringGUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v19) = a8;
  -[IMDFileTransferCenter makeNewIncomingTransferWithGUID:filename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:](self, "makeNewIncomingTransferWithGUID:filename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v16, v17, v12, a5, v10, v9, v19);

  return v16;
}

- (id)guidForNewOutgoingTransferWithFilename:(id)a3 isDirectory:(BOOL)a4 totalBytes:(unint64_t)a5 hfsType:(unsigned int)a6 hfsCreator:(unsigned int)a7 hfsFlags:(unsigned __int16)a8
{
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v12;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v12 = a4;
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = a3;
  objc_msgSend(v14, "stringGUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v18) = a8;
  -[IMDFileTransferCenter makeNewOutgoingTransferWithGUID:filename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:](self, "makeNewOutgoingTransferWithGUID:filename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v16, v15, v12, a5, v10, v9, v18);

  return v16;
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
  void *v18;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v8)
  {
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v10, "attributesOfItemAtPath:error:", v9, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B18]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0CB2B20]);

    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v22 = objc_alloc(MEMORY[0x1E0D39848]);
      objc_msgSend(v9, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v11, "fileSize");
      v16 = objc_msgSend(v11, "fileHFSTypeCode");
      v17 = objc_msgSend(v11, "fileHFSCreatorCode");
      BYTE2(v20) = 0;
      LOWORD(v20) = objc_msgSend(v11, "fileHFSFlags");
      v14 = (void *)objc_msgSend(v22, "_initWithGUID:filename:isDirectory:localURL:account:otherPerson:totalBytes:hfsType:hfsCreator:hfsFlags:isIncoming:", v6, v15, v13, v7, 0, 0, v21, __PAIR64__(v17, v16), v20);

    }
    -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, v6);

  }
  return v8 != 0;
}

- (void)assignTransfer:(id)a3 toAccount:(id)a4 otherPerson:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v16, "length"))
  {
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "_setAccount:otherPerson:", v8, v9);
      +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "broadcasterForFileTransferListeners");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "guid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fileTransfer:createdWithProperties:", v14, v15);

      -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
    }

  }
}

- (void)addTransfer:(id)a3 forGUID:(id)a4
{
  -[IMDFileTransferCenter _addTransfer:forGUID:shouldNotify:](self, "_addTransfer:forGUID:shouldNotify:", a3, a4, 1);
}

- (void)_addTransfer:(id)a3 forGUID:(id)a4 shouldNotify:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a5;
  v8 = a3;
  if (v8)
  {
    if (a4)
    {
      v17 = v8;
      v9 = a4;
      -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v9);

      v8 = v17;
      if (v5)
      {
        if (v11)
        {
          -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v17);
        }
        else
        {
          +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "broadcasterForFileTransferListeners");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "guid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "fileTransfer:createdWithProperties:", v15, v16);

        }
        v8 = v17;
      }
    }
  }

}

- (id)transferForGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)removeTransferForGUID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

  }
}

- (void)deleteTransferForGUID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    -[IMDFileTransferCenter _handleFileTransferRemoved:](self, "_handleFileTransferRemoved:", v5);
    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteAttachmentWithGUID:", v5);

  }
}

- (void)updateTransferGUID:(id)a3 toGUID:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[IMDFileTransferCenter _updateTransferGUID:toGUID:](self, "_updateTransferGUID:toGUID:", v7, v6);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D14A87BC;
    block[3] = &unk_1E9229280;
    block[4] = self;
    v9 = v7;
    v10 = v6;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
}

- (void)_updateTransferGUID:(id)a3 toGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_DEFAULT, "FileTransferCenter updating guid for transfer in cache map:%@ to %@", (uint8_t *)&v14, 0x16u);
    }

    v11 = objc_msgSend(v7, "copy");
    objc_msgSend(v9, "setGuid:", v11);
    -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v6);

    -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, v11);

    v7 = (id)v11;
  }

}

- (void)startTransfer:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "length");
  v5 = v9;
  if (v4)
  {
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (objc_msgSend(v6, "transferState") < 2 || objc_msgSend(v7, "transferState") == 6))
    {
      -[IMDFileTransferCenter _addActiveTransfer:](self, "_addActiveTransfer:", v9);
      objc_msgSend(v7, "_setTransferState:", 2);
      objc_msgSend(v7, "_setError:", -1);
      -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v7);
      if (objc_msgSend(v7, "isIncoming"))
      {
        -[IMDFileTransferCenter _createWrapperForTransfer:](self, "_createWrapperForTransfer:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v7, "_setLocalURL:", v8);
          -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v7);
        }
        else
        {
          -[IMDFileTransferCenter resetTransfer:andPostReason:](self, "resetTransfer:andPostReason:", v9, 20);
        }

      }
      -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
    }

    v5 = v9;
  }

}

- (void)updateTransfer:(id)a3 currentBytes:(unint64_t)a4 totalBytes:(unint64_t)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = objc_msgSend(v13, "length");
  v9 = v13;
  if (v8)
  {
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "transferState") > 2)
      {
        objc_msgSend(v11, "_setCurrentBytes:totalBytes:", a4, a5);
      }
      else
      {
        objc_msgSend(v11, "_setTransferState:", 3);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_setStartDate:", v12);

        -[IMDFileTransferCenter _addTransferringTransfer:](self, "_addTransferringTransfer:", v11);
        objc_msgSend(v11, "_setCurrentBytes:totalBytes:", a4, a5);
        -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v11);
      }
      -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
    }

    v9 = v13;
  }

}

- (void)updateTransfer:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "length");
  v5 = v7;
  if (v4)
  {
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v6);
      -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
    }

    v5 = v7;
  }

}

- (void)updateTransferAsWaitingForAccept:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    objc_msgSend(v4, "_setTransferState:", 0);
    objc_msgSend(v9, "guid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "_setTransferState:", 0);
      -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateAttachment:", v6);
      v8 = v6;
    }
    else
    {
      -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateAttachment:", v9);
      v8 = v9;
    }

    -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v8);
    v4 = v9;
  }

}

- (void)startFinalizingTransfer:(id)a3
{
  -[IMDFileTransferCenter startFinalizingTransfer:updateByteCounts:](self, "startFinalizingTransfer:updateByteCounts:", a3, 1);
}

- (void)startFinalizingTransfer:(id)a3 updateByteCounts:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "transferState") <= 3)
      {
        objc_msgSend(v8, "_setTransferState:", 4);
        if (v4)
          objc_msgSend(v8, "_setCurrentBytes:totalBytes:", objc_msgSend(v8, "totalBytes"), objc_msgSend(v8, "totalBytes"));
        -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v8);
        if (objc_msgSend(v8, "isIncoming"))
        {
          -[IMDFileTransferCenter _removeWrapperForTransfer:](self, "_removeWrapperForTransfer:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v8, "_setLocalURL:", v9);
            objc_msgSend(v9, "path");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 0;
            objc_msgSend(v11, "attributesOfItemAtPath:error:", v10, &v17);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B18]);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isEqual:", *MEMORY[0x1E0CB2B20]);

              objc_msgSend(v8, "_setDirectory:hfsType:hfsCreator:hfsFlags:", v14, objc_msgSend(v12, "fileHFSTypeCode"), objc_msgSend(v12, "fileHFSCreatorCode"), objc_msgSend(v12, "fileHFSFlags"));
              if (v4)
              {
                objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v16 = objc_msgSend(v15, "unsignedLongLongValue");
                    objc_msgSend(v8, "_setCurrentBytes:totalBytes:", v16, v16);
                  }
                }

              }
            }
            -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v8);

          }
          else
          {
            -[IMDFileTransferCenter resetTransfer:andPostReason:](self, "resetTransfer:andPostReason:", v6, 20);
          }

        }
        -[IMDFileTransferCenter _removeActiveTransfer:](self, "_removeActiveTransfer:", v6);
        -[IMDFileTransferCenter _removeTransferringTransfer:](self, "_removeTransferringTransfer:", v8);
      }
      -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
    }

  }
}

- (void)endTransfer:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_endTransfer_endState_updateByteCounts_);
}

- (void)endTransfer:(id)a3 endState:(int64_t)a4 updateByteCounts:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  if (objc_msgSend(v11, "length"))
  {
    -[IMDFileTransferCenter startFinalizingTransfer:updateByteCounts:](self, "startFinalizingTransfer:updateByteCounts:", v11, v5);
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "thumbnailMode"))
      objc_msgSend(v8, "setThumbnailMode:", objc_msgSend(v8, "thumbnailModeAfterDownloadSuccess:", 1));
    if ((objc_msgSend(v8, "isFinished") & 1) == 0)
    {
      objc_msgSend(v8, "setCloudKitSyncState:", 0);
      objc_msgSend(v8, "_setTransferState:", a4);
      -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v8);
      if ((IMIsRunningInUnitTesting() & 1) == 0)
      {
        +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "storeAttachment:associateWithMessageWithGUID:", v8, 0);

      }
      objc_msgSend(v8, "localPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDFileTransferCenter _addSpotlightPropertiesFromFileTransfer:toDirectory:](self, "_addSpotlightPropertiesFromFileTransfer:toDirectory:", v8, v10);

    }
    -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
    -[IMDFileTransferCenter _completeProgressForTransferGUID:](self, "_completeProgressForTransferGUID:", v11);
    -[IMDFileTransferCenter postHubbleDownloadFinishedIfNeededForTransfer:](self, "postHubbleDownloadFinishedIfNeededForTransfer:", v8);

  }
}

- (void)failTransfer:(id)a3 reason:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "length"))
  {
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "thumbnailMode"))
      objc_msgSend(v6, "setThumbnailMode:", objc_msgSend(v6, "thumbnailModeAfterDownloadSuccess:", 0));
    if (v6 && objc_msgSend(v6, "transferState") != 6)
    {
      -[IMDFileTransferCenter _removeActiveTransfer:](self, "_removeActiveTransfer:", v12);
      -[IMDFileTransferCenter _removeTransferringTransfer:](self, "_removeTransferringTransfer:", v6);
      if (a4 == -1)
        a4 = 15;
      objc_msgSend(v6, "_setTransferState:", 6);
      objc_msgSend(v6, "_setError:", a4);
      -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v6);
      +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "storeAttachment:associateWithMessageWithGUID:", v6, 0);

    }
    -[IMDFileTransferCenter _clearProgressForTransferGUID:](self, "_clearProgressForTransferGUID:", v12);
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "errorDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Transfer failed. See underlying error. transfer.errorDescription:%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:underlyingReason:description:](IMDFileTransferCenter, "localFileURLRetrievalErrorWithReason:underlyingReason:description:", 3, a4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDFileTransferCenter postHubbleDownloadFailedIfNeededForTransfer:error:](self, "postHubbleDownloadFailedIfNeededForTransfer:error:", v6, v11);

  }
}

- (void)resetTransfer:(id)a3 andPostReason:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "length"))
  {
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "errorDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Transfer was reset. See underlying error. transfer.errorDescription:%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:underlyingReason:description:](IMDFileTransferCenter, "localFileURLRetrievalErrorWithReason:underlyingReason:description:", 4, a4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDFileTransferCenter resetTransfer:andPostError:](self, "resetTransfer:andPostError:", v11, v10);

  }
}

- (void)resetTransfer:(id)a3 andPostError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "finalTransferStateForSuccess:", 0);
    v10 = objc_msgSend(v8, "thumbnailMode");
    if (v10)
      objc_msgSend(v8, "setThumbnailMode:", v10 - 1);
    if (v8 && objc_msgSend(v8, "transferState") != 6)
    {
      IMLogHandleForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_DEFAULT, "IMDFileTransfer posting recoverable error state for IMFileTransfer", buf, 2u);
      }

      objc_msgSend(v8, "_setTransferState:", 7);
      v12 = v7;
      objc_msgSend(v12, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D38C58]);

      if ((v14 & 1) != 0)
      {
        v15 = 15;
      }
      else if (v12)
      {
        v16 = objc_msgSend(v12, "code");
        v17 = 26;
        if (v16 != 9)
          v17 = 15;
        if ((unint64_t)(v16 - 26) >= 2)
          v15 = v17;
        else
          v15 = 13;
      }
      else
      {
        v15 = -1;
      }

      objc_msgSend(v8, "_setError:", v15);
      -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v8);
      IMLogHandleForCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_DEFAULT, "IMDFileTransfer reset file transfer to waiting state", v20, 2u);
      }

      objc_msgSend(v8, "_setTransferState:", v9);
      objc_msgSend(v8, "_setError:", -1);
      -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v8);
      +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "storeAttachment:associateWithMessageWithGUID:", v8, 0);

    }
    -[IMDFileTransferCenter _clearProgressForTransferGUID:](self, "_clearProgressForTransferGUID:", v6);
    -[IMDFileTransferCenter postHubbleDownloadFailedIfNeededForTransfer:error:](self, "postHubbleDownloadFailedIfNeededForTransfer:error:", v8, v7);

  }
}

- (void)failTransferPreviewGeneration:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_DEFAULT, "Marking transfer %@ as failing preview generation", buf, 0xCu);
  }

  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transferForGUID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "attributionInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      v9 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D37F60]);
      v10 = (void *)objc_msgSend(v9, "copy");

    }
    else
    {
      v12 = *MEMORY[0x1E0D37F60];
      v13 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "setAttributionInfo:", v10);
    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateAttachment:", v6);

  }
}

- (void)rejectTransfer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "length"))
  {
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[IMDFileTransferCenter _removeActiveTransfer:](self, "_removeActiveTransfer:", v10);
      -[IMDFileTransferCenter _removeTransferringTransfer:](self, "_removeTransferringTransfer:", v4);
      objc_msgSend(v4, "_setTransferState:", 8);
      -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v4);
      +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "storeAttachment:associateWithMessageWithGUID:", v4, 0);

    }
    -[IMDFileTransferCenter _clearProgressForTransferGUID:](self, "_clearProgressForTransferGUID:", v10);
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "errorDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Transfer failed. See underlying error. transfer.errorDescription:%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:underlyingReason:description:](IMDFileTransferCenter, "localFileURLRetrievalErrorWithReason:underlyingReason:description:", 3, 28, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDFileTransferCenter postHubbleDownloadFailedIfNeededForTransfer:error:](self, "postHubbleDownloadFailedIfNeededForTransfer:error:", v4, v9);

  }
}

- (void)updateTransfer:(id)a3 withPreviewSize:(id)a4 forConstraints:(IMPreviewConstraints *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[32];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  IMLogHandleForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v24 = 138412546;
    *(_QWORD *)&v24[4] = v8;
    *(_WORD *)&v24[12] = 2112;
    *(_QWORD *)&v24[14] = v9;
    _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_DEFAULT, "Updating transfer %@ with size %@", v24, 0x16u);
  }

  -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "attributionInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_OWORD *)&a5->var1.height;
    *(_OWORD *)v24 = *(_OWORD *)&a5->var0;
    *(_OWORD *)&v24[16] = v14;
    v25 = *(_QWORD *)&a5->var3;
    IMUpdateTransferConstraintAndSizeKeys();
    v15 = objc_claimAutoreleasedReturnValue();

    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 138412290;
      *(_QWORD *)&v24[4] = v15;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_DEFAULT, "New attribution info is %@", v24, 0xCu);
    }

    objc_msgSend(v12, "setAttributionInfo:", v15);
    -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateAttachment:", v12);

  }
  else
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1D1667E50((uint64_t)v8, v15, v18, v19, v20, v21, v22, v23);
  }

}

- (void)setRecoverableErrorForTransfer:(id)a3 error:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  int64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "transferState") != 6)
    {
      IMLogHandleForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134218242;
        v12 = a4;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_DEFAULT, "IMDFileTransfer posting recoverable error state (%zd) for IMFileTransfer %@", (uint8_t *)&v11, 0x16u);
      }

      objc_msgSend(v8, "_setTransferState:", 7);
      objc_msgSend(v8, "_setError:", a4);
      -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v8);
      +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "storeAttachment:associateWithMessageWithGUID:", v8, 0);

    }
  }

}

- (void)failTransfer:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "length"))
  {
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setErrorDescription:", v8);

    -[IMDFileTransferCenter failTransfer:reason:](self, "failTransfer:reason:", v10, 24);
    -[IMDFileTransferCenter _clearProgressForTransferGUID:](self, "_clearProgressForTransferGUID:", v10);
    -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storeAttachment:associateWithMessageWithGUID:", v7, 0);

    -[IMDFileTransferCenter postHubbleDownloadFailedIfNeededForTransfer:error:](self, "postHubbleDownloadFailedIfNeededForTransfer:error:", v7, v6);
  }

}

- (void)acceptTransfer:(id)a3 path:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "length"))
  {
    -[IMDFileTransferCenter _handleFileTransfer:acceptedWithPath:autoRename:overwrite:options:postNotification:](self, "_handleFileTransfer:acceptedWithPath:autoRename:overwrite:options:postNotification:", v7, v6, 1, 0, 0, 0);
    -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
  }

}

- (void)_handleFileTransfer:(id)a3 createdWithProperties:(id)a4 withAuditToken:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint8_t buf[16];
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D39848]);
    objc_msgSend(v10, "_updateWithDictionaryRepresentation:", v9);
    if (!a5 || (objc_msgSend(v10, "localPath"), (v11 = objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_19:
      -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap", v33);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v10, v8);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "__mainThreadPostNotificationName:object:", CFSTR("__kIMDFileTransferCreatedNotification"), v10);

      -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
      if (v10)
      {
        if (v25)
        {
          -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v10);
        }
        else
        {
          +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "broadcasterForFileTransferListeners");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "guid");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "fileTransfer:createdWithProperties:", v30, v31);

        }
      }
LABEL_23:

      goto LABEL_24;
    }
    v12 = (void *)v11;
    objc_msgSend(v10, "sandboxToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = objc_retainAutorelease(v13);
      objc_msgSend(v15, "UTF8String");
      if (sandbox_extension_consume() != -1)
      {
        if (sandbox_extension_release() == -1)
        {
          IMLogHandleForCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            sub_1D1667F14();

        }
LABEL_18:

        goto LABEL_19;
      }
      IMLogHandleForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1D1667EB4();

    }
    v18 = objc_retainAutorelease(v12);
    v19 = objc_msgSend(v18, "UTF8String");
    v20 = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a5->var0;
    v35 = v20;
    v33 = v19;
    v21 = sandbox_check_by_audit_token();
    if (v21)
    {
      v22 = v21;
      IMLogHandleForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v32 = *__error();
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v22;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v32;
        *(_WORD *)&buf[14] = 1024;
        LODWORD(v35) = (_DWORD)a5;
        WORD2(v35) = 2112;
        *(_QWORD *)((char *)&v35 + 6) = v18;
        _os_log_error_impl(&dword_1D1413000, v23, OS_LOG_TYPE_ERROR, "Denying transfer, (check %d, errno %d) client with audit token:%u not allowed to access request path:%@", buf, 0x1Eu);
      }

      goto LABEL_23;
    }
    v15 = v14;
    goto LABEL_18;
  }
LABEL_24:

}

- (void)_updateAndPostCachedTransfer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    objc_msgSend(v4, "guid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    v4 = v10;
    if (v6)
    {
      objc_msgSend(v10, "guid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
      if (v8)
      {
        if (v8 != v10)
        {
          objc_msgSend(v10, "_dictionaryRepresentation");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_updateWithDictionaryRepresentation:", v9);

        }
        -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v8);
      }

      v4 = v10;
    }
  }

}

- (void)_handleFileTransferForStickerRepositionWithGUID:(id)a3 updatedWithProperties:(id)a4 fromLocalChange:(BOOL)a5
{
  MEMORY[0x1E0DE7D20](self, sel__handleFileTransfer_updatedWithProperties_isStickerReposition_repositionedLocally_);
}

- (void)_handleFileTransfer:(id)a3 updatedWithProperties:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__handleFileTransfer_updatedWithProperties_isStickerReposition_repositionedLocally_);
}

- (void)_handleFileTransfer:(id)a3 updatedWithProperties:(id)a4 isStickerReposition:(BOOL)a5 repositionedLocally:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v6 = a6;
  v7 = a5;
  v17 = a3;
  v10 = a4;
  if (objc_msgSend(v17, "length"))
  {
    -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "transferredFilename");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");

      objc_msgSend(v12, "_updateWithDictionaryRepresentation:", v10);
      if (v7)
      {
        if (v6)
          v15 = 1;
        else
          v15 = 2;
        objc_msgSend(v12, "setUpdateReason:", v15);
      }
      if (v14)
        objc_msgSend(v12, "setTransferredFilename:", v14);
      -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateAttachment:", v12);

      -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
      if (!v7)
        -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v12);
    }
    else
    {
      -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
    }

  }
}

- (void)_handleFileTransfer:(id)a3 acceptedWithPath:(id)a4 autoRename:(BOOL)a5 overwrite:(BOOL)a6 options:(int64_t)a7 postNotification:(BOOL)a8
{
  _BOOL4 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v8 = a8;
  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (objc_msgSend(v12, "length"))
  {
    -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v12;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_DEFAULT, "_handleFileTransfer accepted %@", buf, 0xCu);
    }

    objc_msgSend(v15, "_resetTransferStateIfAttachmentIsMissingAndDownloadable");
    +[IMDCKCacheDeleteManager sharedInstance](IMDCKCacheDeleteManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "shouldDownloadAssetsOfSize:refreshCachedValue:", objc_msgSend(v15, "totalBytes"), 1);

    if ((v18 & 1) != 0)
    {
      if (objc_msgSend(v15, "transferState") <= 0)
      {
        if (IMGetAppBoolForKey())
        {
          -[IMDFileTransferCenter failTransfer:reason:](self, "failTransfer:reason:", v12, 25);
        }
        else
        {
          -[IMDFileTransferCenter _addActiveTransfer:](self, "_addActiveTransfer:", v12);
          if (!v13)
          {
            objc_msgSend(v15, "filename");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "lastPathComponent");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "im_randomTemporaryFileURLWithFileName:", v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "path");
            v13 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v15, "_setTransferState:", 1);
          objc_msgSend(v15, "_setFetchOptions:", a7);
          if (v13)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "_setLocalURL:", v34);

          }
          if (v8)
          {
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "__mainThreadPostNotificationName:object:", CFSTR("__kIMDFileTransferAcceptedNotification"), v15);

          }
          -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
          if (v15)
            -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v15);
        }
      }
      else
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v15, "transferState");
        IMStringFromTransferState();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cloudKitSyncState");
        IMStringFromCKSyncState();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v15, "existsAtLocalPath");
        v23 = CFSTR("NO");
        if (v22)
          v23 = CFSTR("YES");
        objc_msgSend(v19, "stringWithFormat:", CFSTR("Invalid transfer state. transferState:%@ cloudKitSyncState:%@ existsAtLocalPath:%@"), v20, v21, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:description:](IMDFileTransferCenter, "localFileURLRetrievalErrorWithReason:description:", 11, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDFileTransferCenter postHubbleDownloadFailedIfNeededForTransfer:error:](self, "postHubbleDownloadFailedIfNeededForTransfer:error:", v15, v25);

      }
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v15, "totalBytes"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("Not enough diskspace to download file transfer with guid: %@, transfer: %@, total bytes: %@"), v12, v15, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:description:](IMDFileTransferCenter, "localFileURLRetrievalErrorWithReason:description:", 12, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDFileTransferCenter postHubbleDownloadFailedIfNeededForTransfer:error:](self, "postHubbleDownloadFailedIfNeededForTransfer:error:", v15, v29);

    }
  }

}

- (void)_handleFileTransfers:(id)a3 autoRename:(BOOL)a4 overwrite:(BOOL)a5 options:(int64_t)a6 postNotification:(BOOL)a7
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  _BOOL4 v39;
  id v40;
  id v41;
  id v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v39 = a7;
  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v49;
    v40 = v9;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v13);
        if (objc_msgSend(v14, "length"))
        {
          -[NSMutableDictionary objectForKey:](self->_guidToTransferMap, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          IMLogHandleForCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v14;
            _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_DEFAULT, "_handleFileTransfers accepted %@", buf, 0xCu);
          }

          objc_msgSend(v15, "_resetTransferStateIfAttachmentIsMissingAndDownloadable");
          if (objc_msgSend(v15, "transferState") > 0)
          {
            v17 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v15, "transferState");
            IMStringFromTransferState();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "cloudKitSyncState");
            IMStringFromCKSyncState();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v15, "existsAtLocalPath");
            v21 = CFSTR("NO");
            if (v20)
              v21 = CFSTR("YES");
            objc_msgSend(v17, "stringWithFormat:", CFSTR("Invalid transfer state. transferState: %@ cloudKitSyncState: %@ existsAtLocalPath: %@"), v18, v19, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:description:](IMDFileTransferCenter, "localFileURLRetrievalErrorWithReason:description:", 11, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDFileTransferCenter postHubbleDownloadFailedIfNeededForTransfer:error:](self, "postHubbleDownloadFailedIfNeededForTransfer:error:", v15, v23);

            goto LABEL_13;
          }
          if (IMGetAppBoolForKey())
          {
            -[IMDFileTransferCenter failTransfer:reason:](self, "failTransfer:reason:", v14, 25);
          }
          else
          {
            -[IMDFileTransferCenter _addActiveTransfer:](self, "_addActiveTransfer:", v14);
            objc_msgSend(v9, "objectForKeyedSubscript:", v14);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "localPath");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              objc_msgSend(v15, "filename");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "lastPathComponent");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "im_randomTemporaryFileURLWithFileName:", v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "path");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v9 = v40;
            }
            objc_msgSend(v15, "_setTransferState:", 1);
            objc_msgSend(v15, "_setFetchOptions:", a6);
            if (v18)
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v18);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "_setLocalURL:", v29);

            }
            if (v15)
            {
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v15, v14);
              objc_msgSend(v41, "setObject:forKeyedSubscript:", v18, v14);
            }
LABEL_13:

          }
        }
        ++v13;
      }
      while (v11 != v13);
      v30 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      v11 = v30;
    }
    while (v30);
  }

  if (objc_msgSend(v42, "count"))
  {
    if (v39)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "allValues");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "__mainThreadPostNotificationName:object:", CFSTR("__kIMDFileTransferBatchAcceptedNotification"), v32);

    }
    -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v33 = v42;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v45 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(v33, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v38);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v35);
    }

  }
}

- (void)_handleFileTransferStopped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEFAULT, "stopping transfer to guid", v12, 2u);
    }

    -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_setFetchOptions:", 0);
    if ((objc_msgSend(v7, "isFinished") & 1) == 0)
    {
      -[IMDFileTransferCenter _removeActiveTransfer:](self, "_removeActiveTransfer:", v4);
      -[IMDFileTransferCenter _removeTransferringTransfer:](self, "_removeTransferringTransfer:", v7);
      if (objc_msgSend(v7, "transferState") || !objc_msgSend(v7, "isIncoming"))
      {
        v8 = 10;
      }
      else if (objc_msgSend(v7, "error") == -1)
      {
        v8 = 12;
      }
      else
      {
        v8 = 10;
      }
      objc_msgSend(v7, "_setTransferState:", 6);
      objc_msgSend(v7, "_setError:", v8);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "__mainThreadPostNotificationName:object:", CFSTR("__kIMDFileTransferStoppedNotification"), v7);

      -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
      -[IMDFileTransferCenter _clearProgressForTransferGUID:](self, "_clearProgressForTransferGUID:", v4);
      +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:description:](IMDFileTransferCenter, "localFileURLRetrievalErrorWithReason:description:", 5, CFSTR("File transfer stopped locally."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDFileTransferCenter postHubbleDownloadFailedIfNeededForTransfer:error:](self, "postHubbleDownloadFailedIfNeededForTransfer:error:", v7, v10);

      if (v7)
        -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v7);
      +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "storeAttachment:associateWithMessageWithGUID:", v7, 0);

    }
  }

}

- (void)_handleFileTransferRemoved:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "length"))
  {
    -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_setFetchOptions:", 0);
    if ((objc_msgSend(v5, "isFinished") & 1) == 0
      && (objc_msgSend(v5, "transferState")
       || -[IMDFileTransferCenter _hasActiveTransferWithGUID:](self, "_hasActiveTransferWithGUID:", v9)))
    {
      -[IMDFileTransferCenter _handleFileTransferStopped:](self, "_handleFileTransferStopped:", v9);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__mainThreadPostNotificationName:object:", CFSTR("__kIMDFileTransferRemovedNotification"), v5);

    -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v9);

    -[IMDFileTransferCenter _updateContextStamp](self, "_updateContextStamp");
    if (v5)
      -[IMDFileTransferCenter _postUpdated:](self, "_postUpdated:", v5);
    -[IMDFileTransferCenter _clearProgressForTransferGUID:](self, "_clearProgressForTransferGUID:", v9);
    +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:description:](IMDFileTransferCenter, "localFileURLRetrievalErrorWithReason:description:", 6, CFSTR("File transfer removed."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDFileTransferCenter postHubbleDownloadFailedIfNeededForTransfer:error:](self, "postHubbleDownloadFailedIfNeededForTransfer:error:", v5, v8);

  }
}

- (id)_getNewFileTransferForStoredAttachmentPayloadDataWithTransferGUID:(id)a3 messageGUID:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMessageGUID:", v6);

  objc_msgSend(v7, "setHideAttachment:", 1);
  return v7;
}

- (id)guidsForStoredAttachmentBlastDoorPayloadData:(id)a3 messageGUID:(id)a4
{
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFURL *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  CGImage *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  CGImageDestination *v24;
  const __CFURL *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v41;
  uint64_t v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  uint8_t v50;
  char v51[15];
  uint8_t v52;
  char v53[15];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  const __CFURL *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v41 = v7;
    obj = v7;
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v48)
    {
      v45 = *(_QWORD *)v55;
      v44 = *MEMORY[0x1E0D37FC8];
      v42 = *MEMORY[0x1E0D38CA0];
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v55 != v45)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringByAppendingPathExtension:", v44);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "im_randomTemporaryFileURLWithFileName:", v11);
          v13 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "content");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "type");

          if (v15 == 1)
          {
            IMLogHandleForCategory();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              sub_1D1667FA4(&v50, v51, v27);

            objc_msgSend(v9, "content");
            v28 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v28, "other");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "data");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v49 = 0;
            LOBYTE(v28) = objc_msgSend(v30, "writeToURL:options:error:", v13, 1, &v49);
            v25 = (const __CFURL *)v49;
            if ((v28 & 1) == 0)
            {
              IMLogHandleForCategory();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v59 = v25;
                _os_log_error_impl(&dword_1D1413000, v31, OS_LOG_TYPE_ERROR, "MessageService Failed writing attachment to disk on incoming:%@", buf, 0xCu);
              }

            }
          }
          else if (v15)
          {
            v25 = 0;
          }
          else
          {
            IMLogHandleForCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              sub_1D1667F74(&v52, v53, v16);

            objc_msgSend(v9, "content");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "astc");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "image");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (CGImage *)objc_msgSend(v19, "cgImage");

            objc_msgSend(v9, "content");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "astc");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "originalUTIType");
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v24 = CGImageDestinationCreateWithURL(v13, v23, 1uLL, 0);

            if (v24)
            {
              CGImageDestinationAddImage(v24, v20, 0);
              v25 = 0;
              if (!CGImageDestinationFinalize(v24))
              {
                v25 = (const __CFURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v42, 9, 0);
                IMLogHandleForCategory();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v59 = v25;
                  _os_log_error_impl(&dword_1D1413000, v26, OS_LOG_TYPE_ERROR, "MessageService Failed writing astc encoded image attachment to disk on incoming:%@", buf, 0xCu);
                }

              }
              CFRelease(v24);
            }
            else
            {
              v25 = (const __CFURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v42, 9, 0);
              IMLogHandleForCategory();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v59 = v13;
                _os_log_error_impl(&dword_1D1413000, v32, OS_LOG_TYPE_ERROR, "MessageService Failed to create CGImageDestination for %@", buf, 0xCu);
              }

            }
          }
          -[IMDFileTransferCenter createNewOutgoingTransferWithLocalFileURL:](self, "createNewOutgoingTransferWithLocalFileURL:", v13);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDFileTransferCenter _getNewFileTransferForStoredAttachmentPayloadDataWithTransferGUID:messageGUID:](self, "_getNewFileTransferForStoredAttachmentPayloadDataWithTransferGUID:messageGUID:", v33, v6);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "storeAttachment:associateWithMessageWithGUID:", v34, v6);

          -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v33);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v33);
          objc_msgSend(v36, "localPath");
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v37;
          if (v37)
            v39 = (const __CFString *)v37;
          else
            v39 = &stru_1E92346B0;
          objc_msgSend(v46, "addObject:", v39);

        }
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v48);
    }

    -[IMDFileTransferCenter broadcastTransfersWithGUIDs:atLocalPaths:](self, "broadcastTransfersWithGUIDs:atLocalPaths:", v47, v46);
    v7 = v41;
  }
  else
  {
    v47 = (id)MEMORY[0x1E0C9AA60];
  }

  return v47;
}

- (id)guidsForStoredAttachmentPayloadData:(id)a3 messageGUID:(id)a4
{
  id v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = v6;
    obj = v6;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v33)
    {
      v29 = *(_QWORD *)v36;
      v28 = *MEMORY[0x1E0D37FC8];
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringByAppendingPathExtension:", v28);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "im_randomTemporaryFileURLWithFileName:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "path");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "stringByResolvingAndStandardizingPath");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = 0;
          LOBYTE(v8) = objc_msgSend(v8, "writeToFile:options:error:", v14, 1, &v34);
          v15 = v34;
          if ((v8 & 1) == 0)
          {
            IMLogHandleForCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v40 = v15;
              _os_log_error_impl(&dword_1D1413000, v16, OS_LOG_TYPE_ERROR, "MessageService Failed writing attachment to disk on incoming:%@", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDFileTransferCenter createNewOutgoingTransferWithLocalFileURL:](self, "createNewOutgoingTransferWithLocalFileURL:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDFileTransferCenter _getNewFileTransferForStoredAttachmentPayloadDataWithTransferGUID:messageGUID:](self, "_getNewFileTransferForStoredAttachmentPayloadDataWithTransferGUID:messageGUID:", v18, v31);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "storeAttachment:associateWithMessageWithGUID:", v19, v31);

          -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v18);
          objc_msgSend(v21, "localPath");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (v22)
            v24 = (const __CFString *)v22;
          else
            v24 = &stru_1E92346B0;
          objc_msgSend(v30, "addObject:", v24);

        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v33);
    }

    -[IMDFileTransferCenter broadcastTransfersWithGUIDs:atLocalPaths:](self, "broadcastTransfersWithGUIDs:atLocalPaths:", v32, v30);
    v6 = v26;
  }
  else
  {
    v32 = (id)MEMORY[0x1E0C9AA60];
  }

  return v32;
}

- (id)guidsForStoredAttachmentPayloadDataURLs:(id)a3 messageGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  id v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v6;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(obj);
          -[IMDFileTransferCenter createNewOutgoingTransferWithLocalFileURL:](self, "createNewOutgoingTransferWithLocalFileURL:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDFileTransferCenter _getNewFileTransferForStoredAttachmentPayloadDataWithTransferGUID:messageGUID:](self, "_getNewFileTransferForStoredAttachmentPayloadDataWithTransferGUID:messageGUID:", v13, v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "storeAttachment:associateWithMessageWithGUID:", v14, v7);

          -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v13);
          objc_msgSend(v16, "localPath");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (v17)
            v19 = (const __CFString *)v17;
          else
            v19 = &stru_1E92346B0;
          objc_msgSend(v8, "addObject:", v19);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    -[IMDFileTransferCenter broadcastTransfersWithGUIDs:atLocalPaths:](self, "broadcastTransfersWithGUIDs:atLocalPaths:", v23, v8);
    v6 = v21;
  }
  else
  {
    v23 = (id)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

- (BOOL)markAttachment:(id)a3 sender:(id)a4 recipients:(id)a5 isIncoming:(BOOL)a6
{
  return 0;
}

- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  NSMutableDictionary *localFileURLRetrievalWithGuidCompletionHandlers;
  NSMutableDictionary *v31;
  NSMutableDictionary *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  IMDFileTransferCenter *v48;
  id v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v80;
  IMDFileTransferCenter *v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _QWORD v93[2];
  _QWORD v94[2];
  uint8_t buf[4];
  const char *v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  void *v100;
  _BYTE v101[128];
  _QWORD v102[2];
  _QWORD v103[5];

  v103[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v76 = v8;
  if (objc_msgSend(v7, "count"))
  {
    v77 = (void *)objc_opt_new();
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v71 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
    if (!v10)
      goto LABEL_31;
    v11 = v10;
    v80 = *(_QWORD *)v89;
    v74 = *MEMORY[0x1E0D37F80];
    v73 = *MEMORY[0x1E0CB2D50];
    v72 = *MEMORY[0x1E0CB2D68];
    v81 = self;
    v75 = v9;
    while (1)
    {
      v12 = 0;
      v78 = v11;
      do
      {
        if (*(_QWORD *)v89 != v80)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v12);
        -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v13, v71);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "existsAtLocalPath"))
        {
          IMLogHandleForCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v14, "localPath");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446722;
            v96 = "-[IMDFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
            v97 = 2112;
            v98 = (uint64_t)v13;
            v99 = 2112;
            v100 = v16;
            _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s File transfer %@ exists at local path %@, no need to move further", buf, 0x20u);

            self = v81;
          }

          if (v8)
          {
            objc_msgSend(v14, "localPath");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "localPath");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "im_livePhotoBundlePath");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, uint64_t, void *, _QWORD, void *, void *, _QWORD))v8 + 2))(v8, 1, v13, 0, v17, v19, 0);

LABEL_28:
            self = v81;
          }
        }
        else if (objc_msgSend(v14, "isInThumbnailState"))
        {
          IMLogHandleForCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v96 = "-[IMDFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
            v97 = 2112;
            v98 = (uint64_t)v13;
            _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s File transfer %@ is in thumbnail state, not retrieving", buf, 0x16u);
          }

          if (v8)
          {
            v21 = (void *)MEMORY[0x1E0CB35C8];
            v93[0] = v73;
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("File transfer local file url retrieval operation was unsuccessful."), &stru_1E92346B0, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v93[1] = v72;
            v94[0] = v23;
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("The given GUID references an attachment which is in thumbnail state. You don't want to analyze this, Skip and retry later, user did not tap to downloaded."), &stru_1E92346B0, 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v94[1] = v25;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "errorWithDomain:code:userInfo:", v74, 24, v26);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v11 = v78;
            v8 = v76;

            v9 = v75;
            (*((void (**)(id, _QWORD, void *, _QWORD, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, v13, 0, 0, 0, v17);
            goto LABEL_28;
          }
        }
        else
        {
          IMLogHandleForCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
          if (v14)
          {
            if (v28)
            {
              objc_msgSend(v14, "localPath");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136446722;
              v96 = "-[IMDFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
              v97 = 2112;
              v98 = (uint64_t)v13;
              v99 = 2112;
              v100 = v29;
              _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s File transfer %@ does not exist at local path (%@) and is not in thumbnail state, retrieving", buf, 0x20u);

              v11 = v78;
            }
          }
          else if (v28)
          {
            *(_DWORD *)buf = 136446466;
            v96 = "-[IMDFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
            v97 = 2112;
            v98 = (uint64_t)v13;
            _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s File transfer guid %@ does not exist or is not cached, retrieving", buf, 0x16u);
          }

          objc_msgSend(v77, "addObject:", v13);
          self = v81;
          if (v8)
          {
            localFileURLRetrievalWithGuidCompletionHandlers = v81->_localFileURLRetrievalWithGuidCompletionHandlers;
            if (!localFileURLRetrievalWithGuidCompletionHandlers)
            {
              v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
              v32 = v81->_localFileURLRetrievalWithGuidCompletionHandlers;
              v81->_localFileURLRetrievalWithGuidCompletionHandlers = v31;

              localFileURLRetrievalWithGuidCompletionHandlers = v81->_localFileURLRetrievalWithGuidCompletionHandlers;
            }
            -[NSMutableDictionary objectForKeyedSubscript:](localFileURLRetrievalWithGuidCompletionHandlers, "objectForKeyedSubscript:", v13);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v81->_localFileURLRetrievalWithGuidCompletionHandlers, "setObject:forKeyedSubscript:", v34, v13);

            }
            -[NSMutableDictionary objectForKeyedSubscript:](v81->_localFileURLRetrievalWithGuidCompletionHandlers, "objectForKeyedSubscript:", v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = _Block_copy(v8);
            objc_msgSend(v17, "addObject:", v35);

            v11 = v78;
            goto LABEL_28;
          }
        }

        ++v12;
      }
      while (v11 != v12);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
      if (!v11)
      {
LABEL_31:

        v36 = v77;
        if (objc_msgSend(v77, "count"))
        {
          IMLogHandleForCategory();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = objc_msgSend(v77, "count");
            *(_DWORD *)buf = 136446722;
            v96 = "-[IMDFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
            v97 = 2048;
            v98 = v38;
            v99 = 2112;
            v100 = v77;
            _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_DEFAULT, "%{public}s Retrieving %llu file transfers (%@)", buf, 0x20u);
          }

          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v77, "count"));
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v87 = 0u;
          v36 = v77;
          v40 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v85;
            do
            {
              v43 = 0;
              do
              {
                if (*(_QWORD *)v85 != v42)
                  objc_enumerationMutation(v36);
                v44 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v43);
                v82 = 0;
                v83 = 0;
                -[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:](self, "_retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:", v44, a4, &v83, &v82, v71);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = v83;
                v47 = v82;
                if (v47)
                {
                  v48 = self;
                  v49 = v46;
                  v50 = v44;
                  v51 = v47;
                  v52 = v45;
LABEL_43:
                  -[IMDFileTransferCenter _hubbleTransferCompleted:withGUID:error:suggestedRetryGUID:](v48, "_hubbleTransferCompleted:withGUID:error:suggestedRetryGUID:", v49, v50, v51, v52);
                  goto LABEL_44;
                }
                if (objc_msgSend(v46, "existsAtLocalPath"))
                {
                  v48 = self;
                  v49 = v46;
                  v50 = v44;
                  v51 = 0;
                  v52 = 0;
                  goto LABEL_43;
                }
                if (v46)
                  objc_msgSend(v39, "setObject:forKeyedSubscript:", v46, v44);
LABEL_44:

                ++v43;
              }
              while (v41 != v43);
              v53 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
              v41 = v53;
            }
            while (v53);
          }

          v7 = v71;
          v8 = v76;
          if (objc_msgSend(v39, "count"))
          {
            -[IMDFileTransferCenter _handleFileTransfers:autoRename:overwrite:options:postNotification:](self, "_handleFileTransfers:autoRename:overwrite:options:postNotification:", v39, 1, 0, a4, 1);
            IMLogHandleForCategory();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v39, "allKeys");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136446466;
              v96 = "-[IMDFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
              v97 = 2112;
              v98 = (uint64_t)v55;
              _os_log_impl(&dword_1D1413000, v54, OS_LOG_TYPE_DEFAULT, "%{public}s Successfully started explicit download for local file url retrieval of transfer with GUIDs %@", buf, 0x16u);

            }
          }

        }
        else
        {
          v7 = v71;
        }
LABEL_59:

        goto LABEL_60;
      }
    }
  }
  IMLogHandleForCategory();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    sub_1D1667FD4(v56, v57, v58, v59, v60, v61, v62, v63);

  if (v8)
  {
    v64 = (void *)MEMORY[0x1E0CB35C8];
    v65 = *MEMORY[0x1E0D37F80];
    v102[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("File transfer local file urls retrieval operation was unsuccessful."), &stru_1E92346B0, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v67;
    v102[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("The given GUIDs was empty."), &stru_1E92346B0, 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v69;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 2);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "errorWithDomain:code:userInfo:", v65, 24, v70);
    v36 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v76;
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id))v8 + 2))(v8, 0, 0, 0, 0, 0, v36);
    goto LABEL_59;
  }
LABEL_60:

}

- (void)_hubbleTransferCompleted:(id)a3 withGUID:(id)a4 error:(id)a5 suggestedRetryGUID:(id)a6
{
  id v10;
  char *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  NSObject *v27;
  _BOOL4 v28;
  char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[2];
  _QWORD v46[2];
  const __CFString *v47;
  uint64_t v48;
  _QWORD v49[2];
  _QWORD v50[2];
  const __CFString *v51;
  uint64_t v52;
  uint8_t v53[128];
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  char *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (char *)a4;
  v12 = a5;
  v38 = a6;
  v40 = v12;
  IMLogHandleForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 136446722;
      v55 = "-[IMDFileTransferCenter _hubbleTransferCompleted:withGUID:error:suggestedRetryGUID:]";
      v56 = 2112;
      v57 = v11;
      v58 = 2112;
      v59 = v12;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s Failed to retrieve local file URL for %@: %@", buf, 0x20u);
    }
  }
  else if (v14)
  {
    objc_msgSend(v10, "localPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446722;
    v55 = "-[IMDFileTransferCenter _hubbleTransferCompleted:withGUID:error:suggestedRetryGUID:]";
    v56 = 2112;
    v57 = v11;
    v58 = 2112;
    v59 = v15;
    _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s Successfully retrieved local file URL for %@ at path %@", buf, 0x20u);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_localFileURLRetrievalWithGuidCompletionHandlers, "objectForKeyedSubscript:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_localFileURLRetrievalWithGuidCompletionHandlers, "removeObjectForKey:", v11);
  v17 = objc_msgSend(v10, "existsAtLocalPath");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v19)
  {
    v20 = (v12 == 0) & v17;
    v21 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v42 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (v20)
        {
          objc_msgSend(v10, "localPath");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "createAndPersistLivePhotoBundleIfNecessary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, uint64_t, char *, _QWORD, void *, void *, _QWORD))(v23 + 16))(v23, 1, v11, 0, v24, v25, 0);

        }
        else
        {
          (*(void (**)(_QWORD, _QWORD, char *, id, _QWORD, _QWORD, void *))(v23 + 16))(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i), 0, v11, v38, 0, 0, v40);
        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v19);
  }

  v26 = objc_msgSend(v10, "existsAtLocalPath");
  IMLogHandleForCategory();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (((v40 == 0) & v26) != 0)
  {
    if (v28)
    {
      objc_msgSend(v10, "guid");
      v29 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v55 = v29;
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_DEFAULT, "Sending completion notification for explicit download of transfer: %@", buf, 0xCu);

    }
    v51 = CFSTR("__kIMDFileTransferExplicitDownloadCompletedSuccessKey");
    v30 = MEMORY[0x1E0C9AAB0];
    v52 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v49[0] = CFSTR("__kIMDFileTransferExplicitDownloadCompletedSuccessKey");
      v49[1] = CFSTR("__kIMDFileTransferExplicitDownloadCompletedFileURLKey");
      v50[0] = v30;
      objc_msgSend(v10, "localURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
      v34 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v34;
    }
  }
  else
  {
    if (v28)
    {
      *(_DWORD *)buf = 138412290;
      v55 = v11;
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_DEFAULT, "Sending completion notification for explicit download of transfer with guid %@", buf, 0xCu);
    }

    v47 = CFSTR("__kIMDFileTransferExplicitDownloadCompletedSuccessKey");
    v35 = MEMORY[0x1E0C9AAA0];
    v48 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v45[0] = CFSTR("__kIMDFileTransferExplicitDownloadCompletedSuccessKey");
      v45[1] = CFSTR("__kIMDFileTransferExplicitDownloadCompletedErrorKey");
      v46[0] = v35;
      v46[1] = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v36 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v36;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "postNotificationName:object:userInfo:", CFSTR("__kIMDFileTransferExplicitDownloadCompletedNotification"), v10, v31);

}

- (id)_findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMMessageGuidFromIMFileTransferGuid();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v11 = 136446722;
      v12 = "-[IMDFileTransferCenter _findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:]";
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s Decomposed attachment guid %@ to messageGUID: %@", (uint8_t *)&v11, 0x20u);
    }

    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageWithGUID:registerAttachments:", v4, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    -[NSObject findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:](v6, "findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      v11 = 136446466;
      v12 = "-[IMDFileTransferCenter _findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:]";
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s Failed to decompose attachment GUID %@, to get message GUID", (uint8_t *)&v11, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)_retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4 outTransfer:(id *)a5 outError:(id *)a6
{
  char v8;
  id v10;
  void *v11;
  id v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  const __CFString *v40;
  uint64_t v41;

  v8 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (objc_msgSend(v10, "length"))
  {
    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attachmentWithGUID:", v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v10;
      if (!a5)
      {
LABEL_5:
        if (objc_msgSend(v12, "existsAtLocalPath"))
        {
          objc_msgSend(v12, "localPath");
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          IMLogHandleForCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v36 = "-[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:]";
            v37 = 2112;
            v38 = v13;
            v39 = 2112;
            v40 = v14;
            _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s Transfer with guid %@ already exists on disk at path %@", buf, 0x20u);
          }

          v10 = v13;
LABEL_32:
          v18 = v10;
          goto LABEL_45;
        }
        if (objc_msgSend(v12, "isInThumbnailState"))
        {
          IMLogHandleForCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v36 = "-[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:]";
            v37 = 2112;
            v38 = v13;
            _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s Transfer with guid %@ is in thumbnail state, skipping retrieve", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File transfer associated with GUID %@ was not auto-downloaded, we only have a thumbnail."), v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 11;
LABEL_29:
          +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:description:](IMDFileTransferCenter, "localFileURLRetrievalErrorWithReason:description:", v23, v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (a6)
            *a6 = objc_retainAutorelease(v26);
          v10 = v13;

          goto LABEL_32;
        }
        IMLogHandleForCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if ((v8 & 1) == 0)
        {
          if (v25)
          {
            *(_DWORD *)buf = 136446722;
            v36 = "-[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:]";
            v37 = 2112;
            v38 = v13;
            v39 = 2112;
            v40 = CFSTR("NO");
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s File transfer associated with GUID %@ needs downloading but allowDownload was %@, failing local file url retrieval", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File transfer associated with GUID %@ needs downloading but allowDownload was %@."), v13, CFSTR("NO"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 10;
          goto LABEL_29;
        }
        if (v25)
        {
          objc_msgSend(v12, "guid");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v36 = "-[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:]";
          v37 = 2112;
          v38 = v30;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s Transfer %@ does not already exist on disk. Starting explicit download for local file url retrieval.", buf, 0x16u);

        }
        objc_msgSend(v12, "guid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          objc_msgSend(v12, "guid");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDFileTransferCenter _addTransfer:forGUID:shouldNotify:](self, "_addTransfer:forGUID:shouldNotify:", v12, v33, 0);

        }
        -[IMDFileTransferCenter addHubbleRequestedTransfer:](self, "addHubbleRequestedTransfer:", v12);
        v29 = v13;
LABEL_44:
        v10 = v29;
        v18 = v29;
        goto LABEL_45;
      }
LABEL_4:
      *a5 = objc_retainAutorelease(v12);
      goto LABEL_5;
    }
    if ((IMFileTransferGUIDIsTemporary() & 1) == 0)
    {
      -[IMDFileTransferCenter _findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:](self, "_findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "attachmentWithGUID:", v13);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          IMLogHandleForCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v36 = (const char *)v13;
            v37 = 2112;
            v38 = v10;
            _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_DEFAULT, "Found a file transfer %@ that matches donated guid %@", buf, 0x16u);
          }

          if (!a5)
            goto LABEL_5;
          goto LABEL_4;
        }
      }

    }
    IMLogHandleForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v36 = "-[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:]";
      v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s No file transfer associated with GUID %@, failing local file url retrieval", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("There was no file transfer associated with GUID %@."), v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:description:](IMDFileTransferCenter, "localFileURLRetrievalErrorWithReason:description:", 9, v28);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a6)
      *a6 = objc_retainAutorelease(v12);
    v29 = v10;
    goto LABEL_44;
  }
  IMLogHandleForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v36 = "-[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:]";
    _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s Empty guid passed, failing local file url retrieval", buf, 0xCu);
  }

  +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:description:](IMDFileTransferCenter, "localFileURLRetrievalErrorWithReason:description:", 8, CFSTR("The given transfer GUID was empty."));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  if (a6)
  {
    v12 = objc_retainAutorelease(v17);
    v18 = 0;
    *a6 = v12;
  }
  else
  {
    v18 = 0;
  }
LABEL_45:

  return v18;
}

- (id)_transcodeControllerSharedInstance
{
  return (id)objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
}

- (id)_attachmentStoreSharedInstance
{
  return +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
}

- (void)removeFinishedTransfers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D14AD034;
  v8[3] = &unk_1E922ACB0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  -[IMDFileTransferCenter guidToTransferMap](self, "guidToTransferMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsForKeys:", v7);

}

- (void)setUpdatedStickerUserInfo:(id)a3 forTransfer:(id)a4 repositioningFromLocalChange:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v5 = a5;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  IMLogHandleForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v8;
    _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_DEFAULT, "Updating sticker user info for transfer %@", (uint8_t *)&v13, 0xCu);
  }

  -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStickerUserInfo:", v9);

  objc_msgSend(v11, "_dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDFileTransferCenter _handleFileTransferForStickerRepositionWithGUID:updatedWithProperties:fromLocalChange:](self, "_handleFileTransferForStickerRepositionWithGUID:updatedWithProperties:fromLocalChange:", v8, v12, v5);

}

- (void)setContextStamp:(id)a3
{
  objc_storeStrong((id *)&self->_contextStamp, a3);
}

- (NSMutableDictionary)localFileURLRetrievalWithGuidCompletionHandlers
{
  return self->_localFileURLRetrievalWithGuidCompletionHandlers;
}

- (void)setLocalFileURLRetrievalWithGuidCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_localFileURLRetrievalWithGuidCompletionHandlers, a3);
}

- (void)setGuidToTransferMap:(id)a3
{
  objc_storeStrong((id *)&self->_guidToTransferMap, a3);
}

- (NSMutableSet)activeTransfers
{
  return self->_activeTransfers;
}

- (void)setActiveTransfers:(id)a3
{
  objc_storeStrong((id *)&self->_activeTransfers, a3);
}

- (NSTimer)transferTimer
{
  return self->_transferTimer;
}

- (void)setTransferTimer:(id)a3
{
  objc_storeStrong((id *)&self->_transferTimer, a3);
}

- (NSMutableArray)transferringTransfers
{
  return self->_transferringTransfers;
}

- (void)setTransferringTransfers:(id)a3
{
  objc_storeStrong((id *)&self->_transferringTransfers, a3);
}

- (NSMutableSet)activeHubbleRequestedTransfers
{
  return self->_activeHubbleRequestedTransfers;
}

- (void)setActiveHubbleRequestedTransfers:(id)a3
{
  objc_storeStrong((id *)&self->_activeHubbleRequestedTransfers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeHubbleRequestedTransfers, 0);
  objc_storeStrong((id *)&self->_transferringTransfers, 0);
  objc_storeStrong((id *)&self->_transferTimer, 0);
  objc_storeStrong((id *)&self->_activeTransfers, 0);
  objc_storeStrong((id *)&self->_guidToTransferMap, 0);
  objc_storeStrong((id *)&self->_localFileURLRetrievalWithGuidCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_contextStamp, 0);
}

- (id)_messageStoreSharedInstance
{
  return +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
}

- (BOOL)_shouldDownloadAssetForTransfer:(id)a3 forMessageItem:(id)a4
{
  id v5;
  char v6;

  v5 = a3;
  if ((objc_msgSend(a4, "isAudioMessage") & 1) != 0
    || (objc_msgSend(v5, "isSticker") & 1) != 0
    || (objc_msgSend(v5, "hideAttachment") & 1) != 0
    || (objc_msgSend(v5, "isLocation") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v5, "isContact");
  }

  return v6;
}

- (id)updateTransfersWithCKRecord:(id)a3 recordWasFetched:(BOOL)a4 downloadAsset:(BOOL *)a5
{
  _BOOL4 v6;
  id v8;
  __CFString *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  __CFString *v28;
  __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const __CFString *v33;
  void *v34;
  _BOOL8 v35;
  unsigned int v36;
  NSObject *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  int v41;
  void *v42;
  __CFString *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  BOOL *v61;
  void *v62;
  void *v63;
  __CFString *v64;
  uint8_t buf[4];
  const __CFString *v66;
  __int16 v67;
  const __CFString *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v6 = a4;
  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    v61 = a5;
    objc_msgSend(MEMORY[0x1E0D39848], "transferGUIDOfRecord:", v8);
    v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    IMMessageGuidFromIMFileTransferGuid();
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(MEMORY[0x1E0D39848], "attachmentRecordHasAsset:", v8);
    v11 = v10;
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v66 = v9;
        v67 = 2112;
        if (v11)
          v13 = CFSTR("YES");
        v68 = v64;
        v69 = 2112;
        v70 = (uint64_t)v13;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Found message GUId %@ from IMFileTransferGUID %@ so that we can upadte the transfer. Record hasAsset %@", buf, 0x20u);
      }

    }
    -[IMDFileTransferCenter _messageStoreSharedInstance](self, "_messageStoreSharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messageWithGUID:", v9);
    v15 = objc_claimAutoreleasedReturnValue();

    -[IMDFileTransferCenter _messageStoreSharedInstance](self, "_messageStoreSharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "itemWithGUID:", v9);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v63, "actionIsGroupPhoto"))
      v17 = v63;
    else
      v17 = 0;
    v62 = (void *)v17;
    v18 = (v17 | v15) != 0;
    -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateTemporaryTransferGUIDsOnMessageIfNeeded:", v15);

    -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attachmentWithGUID:", v64);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      if (!v6 && IMOSLoggingEnabled(v22))
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v66 = v64;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "IMDFileTransferCenter - Update from CKRecord found no existing attachment for %@, but was on the write path", buf, 0xCu);
        }

      }
      v28 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39848]), "initWithCKRecord:writeAssetToDisk:", v8, 1);
      v29 = v28;
      if (v11)
        v30 = 5;
      else
        v30 = 0;
      -[__CFString _setTransferState:](v28, "_setTransferState:", v30);
      v31 = IMOSLoggingEnabled(-[__CFString setCloudKitSyncState:](v29, "setCloudKitSyncState:", 1));
      if ((_DWORD)v31)
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          v66 = v29;
          v67 = 2112;
          if (v11)
            v33 = CFSTR("YES");
          v68 = v9;
          v69 = 2112;
          v70 = (uint64_t)v33;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Fetched from CK. Created new transfer %@ from CKRecord. Associating with message guid %@ hasAsset: %@", buf, 0x20u);
        }

      }
      if (v18)
      {
        -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "storeAttachment:associateWithMessageWithGUID:", v29, v9);

        -[IMDFileTransferCenter _updateAndPostCachedTransfer:](self, "_updateAndPostCachedTransfer:", v29);
        v35 = -[IMDFileTransferCenter _shouldDownloadAssetForTransfer:forMessageItem:](self, "_shouldDownloadAssetForTransfer:forMessageItem:", v29, v15);
        v36 = v62 != 0 || v35;
        if (IMOSLoggingEnabled(v35))
        {
          OSLogHandleForIMFoundationCategory();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v38 = CFSTR("YES");
            if (v61)
              v39 = CFSTR("YES");
            else
              v39 = CFSTR("NO");
            if (v36)
              v40 = CFSTR("YES");
            else
              v40 = CFSTR("NO");
            *(_DWORD *)buf = 138412802;
            v66 = v39;
            v67 = 2112;
            v68 = v40;
            if (!v11)
              v38 = CFSTR("NO");
            v69 = 2112;
            v70 = (uint64_t)v38;
            _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "Do we want to download the transfer later? downloadAsset: %@, shouldDownloadAssetForTransfer: %@, hasAsset: %@", buf, 0x20u);
          }

        }
        v41 = v36 ^ 1;
        if (!v61)
          v41 = 1;
        if (((v41 | v11) & 1) == 0)
        {
          -[__CFString guid](v29, "guid");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v42);
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (IMOSLoggingEnabled(v44))
          {
            OSLogHandleForIMFoundationCategory();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              v66 = v29;
              v67 = 2112;
              v68 = v43;
              v69 = 2112;
              v70 = v15;
              v71 = 2112;
              v72 = v62;
              _os_log_impl(&dword_1D1413000, v45, OS_LOG_TYPE_INFO, "Going to auto downloading asset at the end of batch fetch for transfer: %@ addedTransfer %@ for messageItem: %@ groupPhotoUpdate: %@", buf, 0x2Au);
            }

          }
          *v61 = 1;
          if (!v43)
          {
            -[__CFString guid](v29, "guid");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDFileTransferCenter addTransfer:forGUID:](self, "addTransfer:forGUID:", v29, v46);

          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled(v31))
        {
          OSLogHandleForIMFoundationCategory();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v66 = v64;
            v67 = 2112;
            v68 = v9;
            _os_log_impl(&dword_1D1413000, v58, OS_LOG_TYPE_INFO, "Storing attachment %@ with no associate-able message %@", buf, 0x16u);
          }

        }
        -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "storeAttachment:associateWithMessageWithGUID:", v29, 0);

        -[IMDFileTransferCenter _updateAndPostCachedTransfer:](self, "_updateAndPostCachedTransfer:", 0);
      }
      -[__CFString guid](v29, "guid");
      v52 = objc_claimAutoreleasedReturnValue();
      goto LABEL_87;
    }
    if (v6)
    {
      if (v11)
      {
        v23 = -[__CFString wantsAssetFromRecord:](v21, "wantsAssetFromRecord:", v8);
        if ((_DWORD)v23)
        {
          if (IMOSLoggingEnabled(v23))
          {
            OSLogHandleForIMFoundationCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v66 = v64;
              _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Taking asset from CKRecord for %@", buf, 0xCu);
            }

          }
          -[__CFString _setTransferState:](v21, "_setTransferState:", 5);
          -[__CFString moveAssetFromRecord:](v21, "moveAssetFromRecord:", v8);
        }
        else
        {
          v53 = -[__CFString hasPreferredAssetOverRecord:](v21, "hasPreferredAssetOverRecord:", v8);
          v54 = v53;
          v55 = IMOSLoggingEnabled(v53);
          if (v54)
          {
            if (v55)
            {
              OSLogHandleForIMFoundationCategory();
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v66 = v64;
                _os_log_impl(&dword_1D1413000, v56, OS_LOG_TYPE_INFO, "Setting local record to upload asset for %@", buf, 0xCu);
              }

            }
            v47 = 0;
            goto LABEL_66;
          }
          if (v55)
          {
            OSLogHandleForIMFoundationCategory();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v66 = v64;
              _os_log_impl(&dword_1D1413000, v57, OS_LOG_TYPE_INFO, "Keeping local asset and sync state for %@", buf, 0xCu);
            }

          }
        }
      }
      else
      {
        -[__CFString _setTransferState:](v21, "_setTransferState:", -1);
      }
      v47 = 1;
    }
    else
    {
      v47 = 4;
    }
LABEL_66:
    -[__CFString setCloudKitSyncState:](v21, "setCloudKitSyncState:", v47);
    objc_msgSend(v8, "recordID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "recordName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setCloudKitRecordID:](v21, "setCloudKitRecordID:", v49);

    v29 = (__CFString *)objc_msgSend(v8, "copyEncodedSystemFields");
    if (IMOSLoggingEnabled(-[__CFString setCloudKitServerChangeTokenBlob:](v21, "setCloudKitServerChangeTokenBlob:", v29)))
    {
      OSLogHandleForIMFoundationCategory();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v66 = v21;
        v67 = 2112;
        v68 = v9;
        _os_log_impl(&dword_1D1413000, v50, OS_LOG_TYPE_INFO, "Fetched from CK. Updating existing transfer %@ for message GUID %@", buf, 0x16u);
      }

    }
    -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "storeAttachment:associateWithMessageWithGUID:", v21, v9);

    -[IMDFileTransferCenter _updateAndPostCachedTransfer:](self, "_updateAndPostCachedTransfer:", v21);
    -[__CFString guid](v21, "guid");
    v52 = objc_claimAutoreleasedReturnValue();
LABEL_87:
    v26 = (void *)v52;

    goto LABEL_88;
  }
  if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Nil CKRecord", buf, 2u);
    }

  }
  v26 = 0;
LABEL_88:

  return v26;
}

- (void)markTransferAsNotSyncedSuccessfully:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "markTransferAsNotSyncedSuccessfullyUsingCKRecord transferGUID %@", (uint8_t *)&v11, 0xCu);
    }

  }
  -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentWithGUID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setCloudKitSyncState:", 2);
    -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateAttachment:", v7);

  }
  else if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Could not find transferGUID %@ to mark as not synced successfully", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)markTransferAsNotSuccessfullyDownloadedFromCloud:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "guid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "markTransferAsNotSyncSuccessfullyDownloadedFromCloud transfer %@", (uint8_t *)&v9, 0xCu);

      }
    }
    objc_msgSend(v5, "setCloudKitSyncState:", 5);
    -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateAttachment:", v5);

  }
}

- (void)resetSyncStateForRecord:(id)a3 toState:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D39848], "transferGUIDOfRecord:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = v7;
      v16 = 2048;
      v17 = a4;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "resetSyncStateForRecord transfer %@ toNewState:%ld", (uint8_t *)&v14, 0x16u);
    }

  }
  -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachmentWithGUID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "setCloudKitServerChangeTokenBlob:", 0);
    objc_msgSend(v10, "setCloudKitSyncState:", a4);
    objc_msgSend(v10, "setCloudKitRecordID:", 0);
    -[IMDFileTransferCenter _attachmentStoreSharedInstance](self, "_attachmentStoreSharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateAttachment:", v10);

  }
  else if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = (int64_t)v6;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Tried to clear the sync state for a transfer we don't have on disk transfer: %@ record: %@", (uint8_t *)&v14, 0x16u);
    }

  }
}

- (BOOL)populateLocalURLsForTransfer:(id)a3 fromCKRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  char v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  uint64_t v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "_assetForKey:", CFSTR("lqa"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v9 != 0;
    if (v9)
    {
      objc_msgSend(v5, "_setLocalURL:", v9);
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setLocalPath:", v10);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = *MEMORY[0x1E0CB2AD8];
      v71[0] = *MEMORY[0x1E0CB2AC0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0;
      v14 = objc_msgSend(v11, "setAttributes:ofItemAtPath:error:", v12, v13, &v59);
      v15 = v59;

      if ((v14 & 1) == 0 && IMOSLoggingEnabled(v16))
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v63 = (uint64_t)v18;
          v64 = 2112;
          v65 = v15;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Failed making file class C: %@ with error %@", buf, 0x16u);

        }
      }

    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "_stringForKey:", CFSTR("aguid"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = (uint64_t)v20;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Couldn't get local asset URL from CKRecord: %@", buf, 0xCu);

      }
    }

  }
  else
  {
    v56 = 0;
  }
  objc_msgSend(v6, "_assetForKey:", CFSTR("avid"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0D39848], "transferMetaDataFromRecord:", v6);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    JWDecodeDictionary();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("pathc"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "im_lastPathComponent");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "mimeType");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "guid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)IMDCopyAttachmentPersistentPath();
    if (objc_msgSend(v25, "length"))
    {
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("pathc"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "im_lastPathComponent");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v51, "length"))
      {
        objc_msgSend(v21, "fileURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "path");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v50, "length"))
        {
          objc_msgSend(v25, "stringByDeletingLastPathComponent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringByAppendingPathComponent:", v51);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v49, "stringByDeletingLastPathComponent");
          v29 = objc_claimAutoreleasedReturnValue();
          IMSharedHelperEnsureDirectoryExistsAtPath();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 0;
          LOBYTE(v29) = objc_msgSend(v30, "moveItemAtPath:toPath:error:", v50, v49, &v58);
          v48 = v58;

          v32 = IMOSLoggingEnabled(v31);
          if ((v29 & 1) != 0)
          {
            if (v32)
            {
              OSLogHandleForIMFoundationCategory();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v63 = (uint64_t)v24;
                v64 = 2112;
                v65 = v49;
                _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Stored aux video for transfer %@, finalAssetPath %@", buf, 0x16u);
              }

            }
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = *MEMORY[0x1E0CB2AD8];
            v61 = *MEMORY[0x1E0CB2AC0];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = 0;
            v36 = objc_msgSend(v34, "setAttributes:ofItemAtPath:error:", v35, v49, &v57);
            v46 = v57;

            if ((v36 & 1) == 0 && IMOSLoggingEnabled(v37))
            {
              OSLogHandleForIMFoundationCategory();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v63 = (uint64_t)v49;
                v64 = 2112;
                v65 = v46;
                _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "Failed making file class C: %@ with error %@", buf, 0x16u);
              }

            }
          }
          else
          {
            if (v32)
            {
              OSLogHandleForIMFoundationCategory();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v21, "fileURL");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "path");
                v44 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v47 = (void *)v44;
                v63 = v44;
                v64 = 2112;
                v65 = v49;
                v66 = 2112;
                v67 = v48;
                _os_log_impl(&dword_1D1413000, v42, OS_LOG_TYPE_INFO, "Failed to move file from %@ to %@ error %@", buf, 0x20u);

              }
            }
            objc_msgSend(MEMORY[0x1E0D39848], "cleanUpAsset:", v21);
          }

        }
        else
        {
          if (IMOSLoggingEnabled(0))
          {
            OSLogHandleForIMFoundationCategory();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v63 = (uint64_t)v55;
              v64 = 2112;
              v65 = v51;
              _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Failed to get aux video asset fileURL for aux video copy dest, bad transfer/data (assetPath %@ auxAssetPath %@)", buf, 0x16u);
            }

          }
          objc_msgSend(MEMORY[0x1E0D39848], "cleanUpAsset:", v21);
        }

      }
      else
      {
        if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v63 = (uint64_t)v51;
            _os_log_impl(&dword_1D1413000, v40, OS_LOG_TYPE_INFO, "Failed to get valid attachment aux filename for aux video copy dest, bad transfer/data (auxAssetPath %@)", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0D39848], "cleanUpAsset:", v21);
      }

    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          v63 = (uint64_t)v55;
          v64 = 2112;
          v65 = v53;
          v66 = 2112;
          v67 = v54;
          v68 = 2112;
          v69 = v24;
          _os_log_impl(&dword_1D1413000, v39, OS_LOG_TYPE_INFO, "Failed to create attachment persistent path for aux video source, bad transfer/data (assetPath %@ mimeType %@ utiType %@ guid %@)", buf, 0x2Au);
        }

      }
      objc_msgSend(MEMORY[0x1E0D39848], "cleanUpAsset:", v21);
    }

  }
  return v56;
}

@end
