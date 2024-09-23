@implementation GEOMobileAssetResourceManager

+ (GEOMobileAssetResourceManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__GEOMobileAssetResourceManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBBFE8 != -1)
    dispatch_once(&qword_1ECDBBFE8, block);
  return (GEOMobileAssetResourceManager *)(id)_MergedGlobals_236;
}

- (void)fetchResourceOfType:(unint64_t)a3 extraParameters:(id)a4 options:(unint64_t)a5 result:(id)a6
{
  id v9;
  id v10;
  GEOMAResourceFetchRequest *v11;
  void *global_queue;
  id v13;
  _QWORD v14[4];
  id v15;

  v9 = a6;
  v10 = a4;
  v11 = -[GEOMAResourceFetchRequest initWithTraits:auditToken:throttleToken:]([GEOMAResourceFetchRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOMAResourceFetchRequest setType:](v11, "setType:", a3);
  -[GEOMAResourceFetchRequest setExtras:](v11, "setExtras:", v10);

  -[GEOMAResourceFetchRequest setOptions:](v11, "setOptions:", a5);
  qos_class_self();
  global_queue = (void *)geo_get_global_queue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__GEOMobileAssetResourceManager_fetchResourceOfType_extraParameters_options_result___block_invoke;
  v14[3] = &unk_1E1C0B508;
  v15 = v9;
  v13 = v9;
  -[GEOXPCRequest send:withReply:handler:](v11, "send:withReply:handler:", 0, global_queue, v14);

}

void __84__GEOMobileAssetResourceManager_fetchResourceOfType_extraParameters_options_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  GEOMobileAssetResource *v6;
  void *v7;
  GEOMobileAssetResource *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend(v15, "url");
  v6 = (GEOMobileAssetResource *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v15, "sandBoxToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [GEOMobileAssetResource alloc];
      objc_msgSend(v15, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sandBoxToken");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[GEOMobileAssetResource initWithURL:sandboxExtensionData:](v8, "initWithURL:sandboxExtensionData:", v9, v10);

    }
    else
    {
      v6 = 0;
    }
  }
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v15, "error");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (id)v12;
  else
    v14 = v5;
  (*(void (**)(uint64_t, GEOMobileAssetResource *, id))(v11 + 16))(v11, v6, v14);

}

void __46__GEOMobileAssetResourceManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_236;
  _MergedGlobals_236 = (uint64_t)v1;

}

- (void)updateNow
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 21, CFSTR("MAResources"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("message");
  v5[0] = CFSTR("MAResources.update");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDictionarySync:", v3);

}

- (void)notifyResourceIsCorrupt:(id)a3
{
  id v3;
  void *v4;
  GEOMAResourceReportCorrupt *v5;

  v3 = a3;
  v5 = -[GEOMAResourceReportCorrupt initWithTraits:auditToken:throttleToken:]([GEOMAResourceReportCorrupt alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOMAResourceReportCorrupt setUrl:](v5, "setUrl:", v4);
  -[GEOXPCRequest send:](v5, "send:", 0);

}

@end
