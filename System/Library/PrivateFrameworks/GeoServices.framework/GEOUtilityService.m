@implementation GEOUtilityService

+ (GEOUtilityService)sharedService
{
  if (qword_1ECDBBD20 != -1)
    dispatch_once(&qword_1ECDBBD20, &__block_literal_global_61);
  return (GEOUtilityService *)(id)_MergedGlobals_217;
}

void __34__GEOUtilityService_sharedService__block_invoke()
{
  GEOUtilityService *v0;
  void *v1;

  v0 = objc_alloc_init(GEOUtilityService);
  v1 = (void *)_MergedGlobals_217;
  _MergedGlobals_217 = (uint64_t)v0;

}

- (void)sendHeartbeat
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 18, CFSTR("Utilities"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("message");
  v5[0] = CFSTR("utility.heartbeat");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDictionary:", v3);

}

- (id)_getPathSynchronous:(const char *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 18, CFSTR("Utilities"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("message");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendDictionaryWithReplySync:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("path"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getHomeDirectoryPath
{
  return -[GEOUtilityService _getPathSynchronous:](self, "_getPathSynchronous:", "utility.getHomeDirectory");
}

- (id)getGeoServicesCacheDirectoryPath
{
  return -[GEOUtilityService _getPathSynchronous:](self, "_getPathSynchronous:", "utility.getGeoServicesCacheDirectory");
}

- (void)getCurrentGeoServicesState:(id)a3 callback:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *global_queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 18, CFSTR("Utilities"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("message");
  v16[0] = CFSTR("utility.currentServicesState");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  global_queue = (void *)geo_get_global_queue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__GEOUtilityService_getCurrentGeoServicesState_callback___block_invoke;
  v12[3] = &unk_1E1C08D10;
  v13 = v5;
  v14 = v6;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v7, "sendDictionary:withReply:handler:", v8, global_queue, v12);

}

void __57__GEOUtilityService_getCurrentGeoServicesState_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  GEOServicesState *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  GEOServicesState *v12;
  _QWORD block[4];
  GEOServicesState *v14;
  id v15;
  id v16;

  v5 = a3;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
      v6 = -[GEOServicesState initWithData:]([GEOServicesState alloc], "initWithData:", v8);
    else
      v6 = 0;

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__GEOUtilityService_getCurrentGeoServicesState_callback___block_invoke_2;
  block[3] = &unk_1E1C01358;
  v9 = *(NSObject **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v15 = v5;
  v16 = v10;
  v14 = v6;
  v11 = v5;
  v12 = v6;
  dispatch_async(v9, block);

}

uint64_t __57__GEOUtilityService_getCurrentGeoServicesState_callback___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
