@implementation BLHLSAudiobookFetcher

+ (id)preferredStreamFromMasterPlaylist:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "streamInfs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    BLAudiobookSyncLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_212CCAF5C();
    goto LABEL_24;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "streamInfs");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v7)
  {
LABEL_24:
    v9 = 0;
    goto LABEL_25;
  }
  v8 = v7;
  v19 = v3;
  v9 = 0;
  v10 = *(_QWORD *)v21;
  v11 = -1;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      v14 = objc_msgSend(v13, "averageBandwidthFallbackToPeak");
      v15 = v14 <= 0x15400 || v9 == 0;
      if (v15 || (unint64_t)objc_msgSend(v9, "averageBandwidthFallbackToPeak") > 0x15400)
      {
        if (v14 <= 0x10000)
          v16 = 0x10000 - v14;
        else
          v16 = v14 - 0x10000;
        if (v16 < v11
          || v14 <= 0x15400 && (unint64_t)objc_msgSend(v9, "averageBandwidthFallbackToPeak") > 0x15400)
        {
          v17 = v13;

          v9 = v17;
          v11 = v16;
        }
      }
    }
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v8);
  v3 = v19;
LABEL_25:

  return v9;
}

- (id)initCanUseCellularData:(BOOL)a3 powerRequired:(BOOL)a4 bundleID:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  BLHLSAudiobookFetcher *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURLSession *session;
  objc_super v15;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLHLSAudiobookFetcher;
  v9 = -[BLHLSAudiobookFetcher init](&v15, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    objc_msgSend(v11, "setAllowsCellularAccess:", v6);
    objc_msgSend(v11, "set_requiresPowerPluggedIn:", v5);
    objc_msgSend(v11, "setWaitsForConnectivity:", 0);
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v11, "set_sourceApplicationBundleIdentifier:", v8);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v11, 0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    session = v9->_session;
    v9->_session = (NSURLSession *)v12;

  }
  return v9;
}

- (id)setupDownloadTaskForFetchingMasterPlaylistAndSelectingStreamFromMasterPlaylistURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  BLAudiobookSyncLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "Downloading master playlist from: %@", buf, 0xCu);
  }

  -[BLHLSAudiobookFetcher session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_212C9F07C;
  v13[3] = &unk_24CE8B6F8;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v9, "downloadTaskWithURL:completionHandler:", v6, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)getRacGUIDFromMasterPlaylistURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[BLHLSAudiobookFetcher session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212C9F530;
  v11[3] = &unk_24CE8B6F8;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "downloadTaskWithURL:completionHandler:", v7, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "resume");
}

- (NSURLSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
