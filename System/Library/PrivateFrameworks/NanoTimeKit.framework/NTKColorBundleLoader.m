@implementation NTKColorBundleLoader

void __45__NTKColorBundleLoader_colorBundlesDirectory__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99E98];
  +[NTKBundleLoader rootDirectory](NTKBundleLoader, "rootDirectory");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("/System/Library/NanoTimeKit/FaceBundles/ColorBundles/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v4;

}

void __40__NTKColorBundleLoader_loadColorBundles__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[5];
  if (!v3)
  {
    v4 = (void *)v2[1];
    objc_msgSend(*(id *)(a1 + 32), "colorBundlesDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundlesFromDirectoryURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sortedBundles:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

void __38__NTKColorBundleLoader_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v1;

}

- (id)sortedBundles:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_10_3);
}

- (id)loadColorBundles
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__51;
  v10 = __Block_byref_object_dispose__51;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__NTKColorBundleLoader_loadColorBundles__block_invoke;
  v5[3] = &unk_1E6BD8368;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NTKColorBundleLoader)init
{
  NTKColorBundleLoader *v2;
  NTKBundleLoader *v3;
  NTKBundleLoader *bundleLoader;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKColorBundleLoader;
  v2 = -[NTKColorBundleLoader init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NTKBundleLoader);
    bundleLoader = v2->_bundleLoader;
    v2->_bundleLoader = v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.NanoTimeKit.colorBundleLoader", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    -[NTKColorBundleLoader _startMonitoringColorBundlesDirectoryIfNeeded](v2, "_startMonitoringColorBundlesDirectoryIfNeeded");
  }
  return v2;
}

- (NSURL)colorBundlesDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NTKColorBundleLoader_colorBundlesDirectory__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  if (colorBundlesDirectory_onceToken != -1)
    dispatch_once(&colorBundlesDirectory_onceToken, block);
  return self->_colorBundlesDirectory;
}

- (void)_startMonitoringColorBundlesDirectoryIfNeeded
{
  NSObject *v3;
  OS_dispatch_source *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *colorBundleSource;
  NSObject *v12;
  _QWORD handler[4];
  int v14;
  uint8_t buf[16];

  if (+[NTKDefaultPreferences monitorColorBundleFolder](NTKDefaultPreferences, "monitorColorBundleFolder")&& !self->_colorBundleSource)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "#color-bundle It will monitor color bundle updates", buf, 2u);
    }

    -[NTKColorBundleLoader colorBundlesDirectory](self, "colorBundlesDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = open((const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4), 0);

    v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DE8], v9, 0xEuLL, (dispatch_queue_t)self->_queue);
    colorBundleSource = self->_colorBundleSource;
    self->_colorBundleSource = v10;

    dispatch_source_set_event_handler((dispatch_source_t)self->_colorBundleSource, &__block_literal_global_159);
    v12 = self->_colorBundleSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __69__NTKColorBundleLoader__startMonitoringColorBundlesDirectoryIfNeeded__block_invoke_2;
    handler[3] = &__block_descriptor_36_e5_v8__0l;
    v14 = v9;
    dispatch_source_set_cancel_handler(v12, handler);
    dispatch_resume((dispatch_object_t)self->_colorBundleSource);
  }
  else if (+[NTKDefaultPreferences monitorColorBundleFolder](NTKDefaultPreferences, "monitorColorBundleFolder")|| (v3 = self->_colorBundleSource) == 0)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "#color-bundle It won't monitor color bundle updates", buf, 2u);
    }

  }
  else
  {
    dispatch_source_cancel(v3);
    v4 = self->_colorBundleSource;
    self->_colorBundleSource = 0;

  }
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__NTKColorBundleLoader_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_24 != -1)
    dispatch_once(&sharedInstance_onceToken_24, block);
  return (id)sharedInstance___instance;
}

void __69__NTKColorBundleLoader__startMonitoringColorBundlesDirectoryIfNeeded__block_invoke()
{
  exit(-1);
}

uint64_t __69__NTKColorBundleLoader__startMonitoringColorBundlesDirectoryIfNeeded__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

int64_t __38__NTKColorBundleLoader_sortedBundles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v4 = a3;
  objc_msgSend(a2, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bundlePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = +[NTKPlistPigmentEditOptionLoader compareColorFileNames:otherFileName:fileExtension:](NTKPlistPigmentEditOptionLoader, "compareColorFileNames:otherFileName:fileExtension:", v7, v10, CFSTR(".bundle"));
  return v11;
}

- (NTKBundleLoader)bundleLoader
{
  return self->_bundleLoader;
}

- (void)setBundleLoader:(id)a3
{
  objc_storeStrong((id *)&self->_bundleLoader, a3);
}

- (void)setColorBundlesDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_colorBundlesDirectory, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)colorBundleSource
{
  return self->_colorBundleSource;
}

- (void)setColorBundleSource:(id)a3
{
  objc_storeStrong((id *)&self->_colorBundleSource, a3);
}

- (NSArray)sortedBundles
{
  return self->_sortedBundles;
}

- (void)setSortedBundles:(id)a3
{
  objc_storeStrong((id *)&self->_sortedBundles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedBundles, 0);
  objc_storeStrong((id *)&self->_colorBundleSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_colorBundlesDirectory, 0);
  objc_storeStrong((id *)&self->_bundleLoader, 0);
}

@end
