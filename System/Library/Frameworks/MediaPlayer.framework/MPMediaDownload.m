@implementation MPMediaDownload

- (MPMediaDownload)initWithMPStoreDownload:(id)a3
{
  id v4;
  MPMediaDownload *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPMediaDownload;
  v5 = -[MPMediaDownload init](&v8, sel_init);
  if (v5)
  {
    v5->_deviceLibraryID = objc_msgSend(v4, "libraryItemIdentifier");
    v5->_storeItemID = objc_msgSend(v4, "storeItemIdentifier");
    objc_msgSend(v4, "percentComplete");
    v5->_downloadProgress = v6;
    v5->_downloadReason = +[MPMediaDownload _downloadReasonFromStoreDownload:](MPMediaDownload, "_downloadReasonFromStoreDownload:", v4);
    v5->_downloadPausedReason = 0;
  }

  return v5;
}

- (MPMediaDownload)initWithATAsset:(id)a3
{
  id v4;
  MPMediaDownload *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  int v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPMediaDownload;
  v5 = -[MPMediaDownload init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceLibraryID = objc_msgSend(v6, "longLongValue");

    objc_msgSend(v4, "storeInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adamID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_storeItemID = objc_msgSend(v8, "longLongValue");

    objc_msgSend(v4, "downloadProgress");
    v5->_downloadProgress = v9;
    v10 = objc_msgSend(v4, "downloadOnly");
    v11 = 2;
    if (!v10)
      v11 = 0;
    v5->_downloadReason = v11;
    v5->_downloadPausedReason = +[MPMediaDownload MPMediaDownloadPauseReasonForATAsset:](MPMediaDownload, "MPMediaDownloadPauseReasonForATAsset:", v4);
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %lld %lld %f %d>"), v5, self->_deviceLibraryID, self->_storeItemID, *(_QWORD *)&self->_downloadProgress, self->_downloadReason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  unint64_t result;

  result = self->_deviceLibraryID;
  if (!result)
    return self->_storeItemID;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  MPMediaDownload *v4;
  int64_t v5;
  int64_t v6;
  BOOL v7;

  v4 = (MPMediaDownload *)a3;
  v7 = 1;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ((v5 = -[MPMediaDownload deviceLibraryID](self, "deviceLibraryID")) == 0
       || v5 != -[MPMediaDownload deviceLibraryID](v4, "deviceLibraryID"))
      && ((v6 = -[MPMediaDownload storeItemID](self, "storeItemID")) == 0
       || v6 != -[MPMediaDownload storeItemID](v4, "storeItemID")))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (int64_t)deviceLibraryID
{
  return self->_deviceLibraryID;
}

- (int64_t)storeItemID
{
  return self->_storeItemID;
}

- (int64_t)downloadReason
{
  return self->_downloadReason;
}

- (void)setDownloadReason:(int64_t)a3
{
  self->_downloadReason = a3;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(double)a3
{
  self->_downloadProgress = a3;
}

- (unint64_t)downloadPausedReason
{
  return self->_downloadPausedReason;
}

- (void)setDownloadPausedReason:(unint64_t)a3
{
  self->_downloadPausedReason = a3;
}

- (int64_t)libraryID
{
  return self->_libraryID;
}

- (void)setLibraryID:(int64_t)a3
{
  self->_libraryID = a3;
}

- (int64_t)storeSagaID
{
  return self->_storeSagaID;
}

- (void)setStoreSagaID:(int64_t)a3
{
  self->_storeSagaID = a3;
}

+ (id)MPMediaDownloadsFromMPStoreDownloads:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MPMediaDownload *v11;
  MPMediaDownload *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [MPMediaDownload alloc];
        v12 = -[MPMediaDownload initWithMPStoreDownload:](v11, "initWithMPStoreDownload:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)MPMediaDownloadsFromATAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MPMediaDownload *v11;
  MPMediaDownload *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [MPMediaDownload alloc];
        v12 = -[MPMediaDownload initWithATAsset:](v11, "initWithATAsset:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (unint64_t)MPMediaDownloadPauseReasonForATAsset:(id)a3
{
  return objc_msgSend(a3, "downloadPauseReason");
}

+ (int64_t)_downloadReasonFromStoreDownload:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "reason");
  if (v3 == 1)
    return 1;
  else
    return 2 * (v3 == 2);
}

@end
