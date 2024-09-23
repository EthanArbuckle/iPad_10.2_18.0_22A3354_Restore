@implementation MFIMAPDownloadCache

- (id)downloadForMessage:(id)a3
{
  id v4;
  unsigned int v5;
  unint64_t RangeOfDownloadsWithUid;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  MFIMAPMessageDownload *v11;
  MFIMAPMessageDownload *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "uid");
  -[MFIMAPDownloadCache mf_lock](self, "mf_lock");
  RangeOfDownloadsWithUid = _lockedFindRangeOfDownloadsWithUid(self, v5);
  if (!v7)
    goto LABEL_4;
  -[NSMutableArray objectAtIndex:](self->_downloads, "objectAtIndex:", RangeOfDownloadsWithUid);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v8)
      goto LABEL_13;
LABEL_4:
    if (!v5)
      goto LABEL_7;
    goto LABEL_10;
  }

  if (!v5)
  {
LABEL_7:
    MFLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "ef_publicDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_INFO, "uid of message %{public}@ is 0", (uint8_t *)&v14, 0xCu);

    }
  }
LABEL_10:
  v11 = -[MFIMAPMessageDownload initWithMessage:]([MFIMAPMessageDownload alloc], "initWithMessage:", v4);
  v12 = v11;
  if (v11)
  {
    -[MFIMAPMessageDownload setAllowsPartialDownloads:](v11, "setAllowsPartialDownloads:", 1);
    v8 = v12;
    -[NSMutableArray insertObject:atIndex:](self->_downloads, "insertObject:atIndex:", v12, RangeOfDownloadsWithUid);
  }
  else
  {
    v8 = 0;
  }
LABEL_13:
  -[MFIMAPDownloadCache mf_unlock](self, "mf_unlock");

  return v8;
}

- (id)downloadForUid:(unsigned int)a3 section:(id)a4 length:(unint64_t)a5 consumer:(id)a6
{
  _getDownload(self, *(uint64_t *)&a3, a4, a5, a5, 0, 0x7FFFFFFFFFFFFFFFLL, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)downloadForUid:(unsigned int)a3 section:(id)a4 expectedLength:(unint64_t)a5 consumer:(id)a6
{
  _getDownload(self, *(uint64_t *)&a3, a4, 0xFFFFFFFFLL, a5, 0, 0x7FFFFFFFFFFFFFFFLL, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)downloadForUid:(unsigned int)a3 section:(id)a4 range:(_NSRange)a5 consumer:(id)a6
{
  _getDownload(self, *(uint64_t *)&a3, a4, 0xFFFFFFFFLL, 0xFFFFFFFFLL, a5.location, a5.length, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)handleFetchResponse:(id)a3 forUid:(unsigned int)a4
{
  unint64_t RangeOfDownloadsWithUid;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  -[MFIMAPDownloadCache mf_lock](self, "mf_lock");
  RangeOfDownloadsWithUid = _lockedFindRangeOfDownloadsWithUid(self, a4);
  v8 = v7;
  objc_msgSend(v10, "fetchResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _lockedUpdateDownloadsInRange(self, RangeOfDownloadsWithUid, v8, v9);

  -[MFIMAPDownloadCache mf_unlock](self, "mf_unlock");
}

- (void)handleFetchResponses:(id)a3
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t RangeOfDownloadsWithUid;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  if (objc_msgSend(v15, "count"))
  {
    -[MFIMAPDownloadCache mf_lock](self, "mf_lock");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = v15;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v5 = 0;
      v6 = 0;
      RangeOfDownloadsWithUid = 0;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "fetchResultWithType:", 8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "uid");

          if (v12)
          {
            if (v12 != v5)
            {
              RangeOfDownloadsWithUid = _lockedFindRangeOfDownloadsWithUid(self, v12);
              v6 = v13;
              v5 = v12;
            }
            objc_msgSend(v10, "fetchResults");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            _lockedUpdateDownloadsInRange(self, RangeOfDownloadsWithUid, v6, v14);

          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v4);
    }

    -[MFIMAPDownloadCache mf_unlock](self, "mf_unlock");
  }

}

- (void)processResultsForUid:(unsigned int)a3
{
  unint64_t RangeOfDownloadsWithUid;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;

  -[MFIMAPDownloadCache mf_lock](self, "mf_lock");
  RangeOfDownloadsWithUid = _lockedFindRangeOfDownloadsWithUid(self, a3);
  if (RangeOfDownloadsWithUid < RangeOfDownloadsWithUid + v6)
  {
    v7 = RangeOfDownloadsWithUid;
    v8 = v6;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_downloads, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "processResults");

      ++v7;
      --v8;
    }
    while (v8);
  }
  -[MFIMAPDownloadCache mf_unlock](self, "mf_unlock");
}

- (void)cleanUpDownloadsForUid:(unsigned int)a3
{
  unint64_t RangeOfDownloadsWithUid;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  -[MFIMAPDownloadCache mf_lock](self, "mf_lock");
  RangeOfDownloadsWithUid = _lockedFindRangeOfDownloadsWithUid(self, a3);
  v7 = RangeOfDownloadsWithUid + v6;
  if (RangeOfDownloadsWithUid + v6 > RangeOfDownloadsWithUid)
  {
    v8 = RangeOfDownloadsWithUid;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_downloads, "objectAtIndex:", --v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isComplete"))
        -[NSMutableArray removeObjectAtIndex:](self->_downloads, "removeObjectAtIndex:", v7);

    }
    while (v7 > v8);
  }
  -[MFIMAPDownloadCache mf_unlock](self, "mf_unlock");
}

- (void)addCommandsForDownload:(id)a3 toPipeline:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[MFIMAPDownloadCache mf_lock](self, "mf_lock");
  objc_msgSend(v7, "addCommandsToPipeline:withCache:", v6, self);
  -[MFIMAPDownloadCache mf_unlock](self, "mf_unlock");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloads, 0);
}

@end
