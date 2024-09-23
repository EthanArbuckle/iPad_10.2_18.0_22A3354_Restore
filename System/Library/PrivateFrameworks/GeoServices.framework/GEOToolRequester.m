@implementation GEOToolRequester

+ (id)sharedRequester
{
  if (qword_1ECDBBFD8 != -1)
    dispatch_once(&qword_1ECDBBFD8, &__block_literal_global_88);
  return (id)_MergedGlobals_235;
}

void __35__GEOToolRequester_sharedRequester__block_invoke()
{
  GEOToolRequester *v0;
  void *v1;

  v0 = objc_alloc_init(GEOToolRequester);
  v1 = (void *)_MergedGlobals_235;
  _MergedGlobals_235 = (uint64_t)v0;

}

- (id)ping
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("message");
  v9[0] = CFSTR("geotool.ping");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDictionaryWithReplySync:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ping"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)unlockDBs
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("message");
  v5[0] = CFSTR("geotool.unlockDBs");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDictionarySync:", v3);

}

- (void)lockDBs
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("message");
  v5[0] = CFSTR("geotool.lockDBs");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDictionarySync:", v3);

}

- (id)getDefault:(id)a3 source:(int64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v5;
  v19[0] = CFSTR("message");
  v19[1] = CFSTR("userInfo");
  v20[0] = CFSTR("geotool.getDefault");
  v17 = CFSTR("key");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sendDictionaryWithReplySync:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("userInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("source"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = objc_msgSend(v12, "unsignedIntegerValue");
    else
      v13 = 0;
    *a4 = v13;

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("value"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unint64_t)calculatePurgableSpaceForUrgency:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v3 = *(_QWORD *)&a3;
  v16[2] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("message");
  v15[1] = CFSTR("userInfo");
  v16[0] = CFSTR("geotool.calculatePurgableSpace");
  v13 = CFSTR("urgency");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendDictionaryWithReplySync:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bytes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongLongValue");

  return v11;
}

- (unint64_t)freePurgableSpace:(unint64_t)a3 forUrgency:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v4 = *(_QWORD *)&a4;
  v19[2] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("message");
  v18[1] = CFSTR("userInfo");
  v19[0] = CFSTR("geotool.freePurgableSpace");
  v16[0] = CFSTR("urgency");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("bytes");
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sendDictionaryWithReplySync:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bytes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedLongLongValue");

  return v14;
}

- (void)invalidateTileCache
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("message");
  v5[0] = CFSTR("geotool.invalidateTileCache");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDictionarySync:", v3);

}

- (BOOL)notifyNetworkDefaultsChanged
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("message");
  v10[0] = CFSTR("geotool.notifyNetworkDefaultsChanged");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDictionaryWithReplySync:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)forceProactiveTileDownloaderRun
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("message");
  v5[0] = CFSTR("geotool.forceProactiveTileDownloaderRun");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDictionarySync:", v3);

}

- (BOOL)isProactiveTileDownloadEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("message");
  v10[0] = CFSTR("geotool.checkProactiveTileDownloadPolicyEnabled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDictionaryWithReplySync:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (id)listFilePathsRemote
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("message");
  v8[0] = CFSTR("geotool.listFilePaths");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDictionaryWithReplySync:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)listFilePathsLocal
{
  return +[GEOFilePaths dictionaryRepresentation](GEOFilePaths, "dictionaryRepresentation");
}

- (void)fetchOfflineMetadataWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *global_queue;
  id v7;
  _QWORD v8[4];
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("message");
  v11[0] = CFSTR("geotool.fetchOfflineMetadata");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  global_queue = (void *)geo_get_global_queue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__GEOToolRequester_fetchOfflineMetadataWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E1C02190;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "sendDictionary:withReply:handler:", v5, global_queue, v8);

}

void __62__GEOToolRequester_fetchOfflineMetadataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  v12 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("userInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeVersions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("updated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("userInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("updated"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (BOOL)flushPurgeableOfflineData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("message");
  v10[0] = CFSTR("geotool.flushPurgeableOfflineData");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDictionaryWithReplySync:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("success"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (id)pingOverIDS
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 6, CFSTR("GEOTool"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("message");
  v9[0] = CFSTR("geotool.pingOverIDS");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDictionaryWithReplySync:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ping"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
