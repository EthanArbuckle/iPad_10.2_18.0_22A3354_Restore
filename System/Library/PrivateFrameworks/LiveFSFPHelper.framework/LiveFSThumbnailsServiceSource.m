@implementation LiveFSThumbnailsServiceSource

- (LiveFSThumbnailsServiceSource)initWithFileProviderExtension:(id)a3
{
  id v4;
  LiveFSThumbnailsServiceSource *v5;
  LiveFSThumbnailsServiceSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LiveFSThumbnailsServiceSource;
  v5 = -[LiveFSThumbnailsServiceSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->ex, v4);

  return v6;
}

- (id)makeListenerEndpointAndReturnError:(id *)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "resume");
  objc_msgSend(v4, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)serviceName
{
  return (NSString *)CFSTR("com.apple.filesystems.LiveItemThumbnails");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD1990];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_255521480);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getThumbnailURLForItem_completion_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_storeThumbnailAtURL_forItem_completion_, 1, 0);

  objc_msgSend(v6, "setExportedInterface:", v7);
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

- (id)thumbnailCache
{
  QLExternalThumbnailCache *thumbnailCache;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  QLExternalThumbnailCache *v8;
  id v9;
  QLExternalThumbnailCache *v10;
  NSObject *v11;
  id v13;

  thumbnailCache = self->thumbnailCache;
  if (!thumbnailCache)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->ex);
    objc_msgSend(WeakRetained, "URLForItemWithIdentifier:", *MEMORY[0x24BDC8228]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR(".thumbnails"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 0, 0, 0);

    }
    v13 = 0;
    v8 = (QLExternalThumbnailCache *)objc_msgSend(objc_alloc(MEMORY[0x24BDE5ED8]), "initWithDirectoryURL:maximumCacheSize:error:", v6, 104857600, &v13);
    v9 = v13;
    v10 = self->thumbnailCache;
    self->thumbnailCache = v8;

    if (!self->thumbnailCache)
    {
      livefs_std_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[LiveFSThumbnailsServiceSource thumbnailCache].cold.1();

    }
    thumbnailCache = self->thumbnailCache;
  }
  return thumbnailCache;
}

- (void)storeThumbnailAtURL:(id)a3 forItem:(id)a4 completion:(id)a5
{
  void (**v8)(id, id);
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v8 = (void (**)(id, id))a5;
  v9 = a4;
  v10 = a3;
  -[LiveFSThumbnailsServiceSource thumbnailCache](self, "thumbnailCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v11, "storeThumbnailAtURL:forItem:error:", v10, v9, &v13);

  v12 = v13;
  v8[2](v8, v12);

}

- (void)getThumbnailURLForItem:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[LiveFSThumbnailsServiceSource thumbnailCache](self, "thumbnailCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v8, "thumbnailURLForItem:error:", v7, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  v6[2](v6, v9, v10);

}

- (void)getThumbnailCacheURLWrappersWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void (**)(id, void *, void *))a3;
  -[LiveFSThumbnailsServiceSource thumbnailCache](self, "thumbnailCache");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDC8310];
  objc_msgSend(v11, "inboxDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wrapperWithURL:readonly:error:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDC8310];
  objc_msgSend(v11, "thumbnailsDirectoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wrapperWithURL:readonly:error:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->thumbnailCache, 0);
  objc_destroyWeak((id *)&self->ex);
}

- (void)thumbnailCache
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_21F8A5000, v0, v1, "Can't create external thumbnail cache: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
