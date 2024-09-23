@implementation _MPCPlaybackEngineSessionManager

- (BOOL)isStateRestorationSupported
{
  return self->_stateRestorationSupported;
}

- (_MPCPlaybackEngineSessionManager)initWithPlaybackEngine:(id)a3
{
  id v4;
  _MPCPlaybackEngineSessionManager *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  uint64_t v9;
  NSMutableArray *sessionArchives;
  uint64_t v11;
  NSMutableDictionary *sessionIdentifierArchiveMap;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MPCPlaybackEngineSessionManager;
  v5 = -[_MPCPlaybackEngineSessionManager init](&v14, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.MediaPlaybackCore._MPCPlaybackEngineSessionManager/serialQueue", v6);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    sessionArchives = v5->_sessionArchives;
    v5->_sessionArchives = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    sessionIdentifierArchiveMap = v5->_sessionIdentifierArchiveMap;
    v5->_sessionIdentifierArchiveMap = (NSMutableDictionary *)v11;

    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    objc_msgSend(v4, "addEngineObserver:", v5);
  }

  return v5;
}

- (id)_playbackSessionsDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlaybackSessions"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  return v5;
}

+ (id)archivesAtURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  _MPCPlaybackSessionArchive *v21;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDBCC60];
  v6 = *MEMORY[0x24BDBCBE0];
  v31[0] = *MEMORY[0x24BDBCC60];
  v31[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v23 = v3;
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, v7, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v25 = 0;
        v16 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v25, v5, 0);
        v17 = v25;
        v18 = v17;
        if (v16 && objc_msgSend(v17, "BOOLValue"))
        {
          objc_msgSend(v15, "pathExtension");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("playbackSessionArchive"));

          if (v20)
          {
            v21 = -[_MPCPlaybackSessionArchive initWithURL:]([_MPCPlaybackSessionArchive alloc], "initWithURL:", v15);
            if (v21)
              objc_msgSend(v24, "addObject:", v21);
            else
              objc_msgSend(v8, "removeItemAtURL:error:", v15, 0);

          }
          else
          {
            objc_msgSend(v8, "removeItemAtURL:error:", v15, 0);
          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  objc_msgSend(v24, "sortUsingComparator:", &__block_literal_global_29474);
  return v24;
}

- (void)setStateRestorationSupported:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *serialQueue;
  _QWORD v6[5];
  BOOL v7;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (self->_stateRestorationSupported != v3)
  {
    self->_stateRestorationSupported = v3;
    serialQueue = self->_serialQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65___MPCPlaybackEngineSessionManager_setStateRestorationSupported___block_invoke;
    v6[3] = &unk_24CABA9F0;
    v7 = v3;
    v6[4] = self;
    dispatch_async(serialQueue, v6);
  }
}

- (NSString)stateRestorationSessionIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("LastPlaybackSessionIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)saveSessionWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD, void *);
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _MPCPlaybackSessionArchive *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *serialQueue;
  _MPCPlaybackSessionArchive *v39;
  NSObject *v40;
  NSObject *v41;
  _MPCPlaybackSessionArchive *v42;
  void *v43;
  void *v44;
  void *v45;
  _MPCPlaybackSessionArchive *v46;
  void *v47;
  _QWORD v48[5];
  _MPCPlaybackSessionArchive *v49;
  void (**v50)(id, _QWORD, void *);
  __int128 *v51;
  _QWORD block[4];
  id v53;
  _MPCPlaybackSessionArchive *v54;
  NSObject *v55;
  __int128 *p_buf;
  _QWORD v57[5];
  NSObject *v58;
  _MPCPlaybackSessionArchive *v59;
  __int128 buf;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  objc_msgSend(WeakRetained, "queueController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCPlaybackEngineSessionManager.m"), 117, CFSTR("Session management only available with MPCQueueController"));

    }
    if (self->_stateRestorationSupported)
    {
      objc_msgSend(MEMORY[0x24BEC8998], "sharedSecurityInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isContentProtectionEnabled")
        && (objc_msgSend(v8, "isDeviceClassCUnlocked") & 1) == 0)
      {
        v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = self;
          _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion: [before first unlock] skipping save", (uint8_t *)&buf, 0xCu);
        }

        v22 = (void *)MEMORY[0x24BDD1540];
        v23 = CFSTR("Can't save an archive before first unlock (cannot write to container data).");
        v24 = 1;
      }
      else
      {
        if ((objc_msgSend(v7, "containsRestorableContent") & 1) != 0)
        {
          objc_msgSend(WeakRetained, "mediaRemotePublisher");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "infoCenter");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "sessionID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "nowPlayingContentItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            v47 = v11;
            objc_msgSend(v12, "userInfo");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDDC4B0]);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "BOOLValue");

            if (v16)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackSessionManagerError"), 2, CFSTR("Opting not to save an archive with a placeholder content item."));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v5[2](v5, 0, v17);

            }
            else
            {
              -[_MPCPlaybackEngineSessionManager _playbackSessionsDirectory](self, "_playbackSessionsDirectory");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "stringByAppendingPathExtension:", CFSTR("playbackSessionArchive"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "URLByAppendingPathComponent:isDirectory:", v28, 1);
              v44 = v13;
              v29 = objc_claimAutoreleasedReturnValue();

              v30 = [_MPCPlaybackSessionArchive alloc];
              v45 = (void *)v29;
              v31 = v29;
              v13 = v44;
              v46 = -[_MPCPlaybackSessionArchive initWithURL:identifier:](v30, "initWithURL:identifier:", v31, v47);
              -[_MPCPlaybackSessionArchive setContentItem:](v46, "setContentItem:", v44);
              v32 = dispatch_group_create();
              objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "archiveSessionArtwork");

              if (v34)
              {
                objc_msgSend(v10, "playbackQueueDataSource");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  dispatch_group_enter(v32);
                  objc_msgSend(v10, "nowPlayingContentItem");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v57[0] = MEMORY[0x24BDAC760];
                  v57[1] = 3221225472;
                  v57[2] = __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke;
                  v57[3] = &unk_24CABAA50;
                  v57[4] = self;
                  v58 = v32;
                  v59 = v46;
                  v37 = (id)objc_msgSend(v35, "nowPlayingInfoCenter:artworkForContentItem:size:completion:", v10, v36, v57, 1200.0, 1200.0);

                }
              }
              *(_QWORD *)&buf = 0;
              *((_QWORD *)&buf + 1) = &buf;
              v61 = 0x3032000000;
              v62 = __Block_byref_object_copy__29443;
              v63 = __Block_byref_object_dispose__29444;
              v64 = 0;
              dispatch_group_enter(v32);
              serialQueue = self->_serialQueue;
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke_36;
              block[3] = &unk_24CABAA78;
              v53 = v7;
              v39 = v46;
              v55 = v32;
              p_buf = &buf;
              v54 = v39;
              v40 = v32;
              dispatch_async(serialQueue, block);
              v41 = self->_serialQueue;
              v48[0] = MEMORY[0x24BDAC760];
              v48[1] = 3221225472;
              v48[2] = __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke_40;
              v48[3] = &unk_24CABAAA0;
              v51 = &buf;
              v48[4] = self;
              v49 = v39;
              v50 = v5;
              v42 = v39;
              dispatch_group_notify(v40, v41, v48);

              _Block_object_dispose(&buf, 8);
            }
            v11 = v47;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackSessionManagerError"), 2, CFSTR("Can't save an archive without a now playing content item."));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v5[2](v5, 0, v26);

          }
          goto LABEL_29;
        }
        v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = self;
          _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion: [containsRestorableContent = NO] skipping save", (uint8_t *)&buf, 0xCu);
        }

        v22 = (void *)MEMORY[0x24BDD1540];
        v23 = CFSTR("Opting not to save an archive that does not contain restorable content");
        v24 = 3;
      }
      objc_msgSend(v22, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackSessionManagerError"), v24, v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, 0, v10);
LABEL_29:

      goto LABEL_30;
    }
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = CFSTR("MPCError");
    v20 = CFSTR("Playback engine doesn't support state restoration");
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = CFSTR("MPCPlaybackSessionManagerError");
    v20 = CFSTR("Can't save an archive without a QueueController");
  }
  objc_msgSend(v18, "msv_errorWithDomain:code:debugDescription:", v19, 2, v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v8);
LABEL_30:

}

- (void)deleteSessionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (self->_stateRestorationSupported)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionIdentifierArchiveMap, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "packageURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(v9, "removeItemAtURL:error:", v10, &v13);
      v11 = v13;

      if (!v11)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionIdentifierArchiveMap, "setObject:forKeyedSubscript:", 0, v6);
        -[NSMutableArray removeObjectIdenticalTo:](self->_sessionArchives, "removeObjectIdenticalTo:", v8);
      }
      v7[2](v7, v11);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 999, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v12);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 2, CFSTR("Playback engine doesn't support state restoration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8);
  }

}

- (void)setStateRestorationSessionIdentifier:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "length");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("LastPlaybackSessionIdentifier"));
  else
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("LastPlaybackSessionIdentifier"));

}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSMutableArray)sessionArchives
{
  return self->_sessionArchives;
}

- (NSMutableDictionary)sessionIdentifierArchiveMap
{
  return self->_sessionIdentifierArchiveMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifierArchiveMap, 0);
  objc_storeStrong((id *)&self->_sessionArchives, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
}

@end
