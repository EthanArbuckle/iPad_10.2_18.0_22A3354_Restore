@implementation GEOResourceManager

- (id)allResourceNames
{
  void *v2;
  void *v3;

  +[GEOResourceManifestManager modernManagerForConfiguration:](GEOResourceManifestManager, "modernManagerForConfiguration:", self->_configuration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allResourceNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isDevResourceWithName:(id)a3 fallbackBundle:(id)a4 fallbackNameHandler:(id)a5
{
  void *v5;
  void *v6;
  char v7;

  -[GEOResourceManager pathForResourceWithName:fallbackBundle:fallbackNameHandler:](self, "pathForResourceWithName:fallbackBundle:fallbackNameHandler:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOResourceDevResourcesPath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasPrefix:", v6);

  return v7;
}

- (id)dataForResourceWithName:(id)a3 fallbackBundle:(id)a4 fallbackNameHandler:(id)a5
{
  void *v5;
  void *v6;

  -[GEOResourceManager pathForResourceWithName:fallbackBundle:fallbackNameHandler:](self, "pathForResourceWithName:fallbackBundle:fallbackNameHandler:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pathForResourceWithName:(id)a3 fallbackBundle:(id)a4 fallbackNameHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  +[GEOResourceManifestManager modernManagerForConfiguration:](GEOResourceManifestManager, "modernManagerForConfiguration:", self->_configuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathForResourceWithName:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

  if ((v14 & 1) == 0)
  {
    if (v9)
    {
      if (v10)
      {
        v10[2](v10, v8);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = v8;
      }
      v17 = v15;
      objc_msgSend(v15, "stringByDeletingPathExtension");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pathExtension");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pathForResource:ofType:", v18, v19);
      v16 = objc_claimAutoreleasedReturnValue();

      v12 = v17;
    }
    else
    {
      v16 = 0;
    }

    v12 = (void *)v16;
  }

  return v12;
}

void __35__GEOResourceManager_sharedManager__block_invoke()
{
  GEOResourceManager *v0;
  void *v1;

  v0 = -[GEOResourceManager initWithConfiguration:]([GEOResourceManager alloc], "initWithConfiguration:", 0);
  v1 = (void *)qword_1ECDBBE60;
  qword_1ECDBBE60 = (uint64_t)v0;

}

- (GEOResourceManager)initWithConfiguration:(id)a3
{
  GEOResourceManifestConfiguration *v4;
  GEOResourceManager *v5;
  GEOResourceManager *v6;
  objc_super v8;

  v4 = (GEOResourceManifestConfiguration *)a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOResourceManager;
  v5 = -[GEOResourceManager init](&v8, sel_init);
  if (v5)
  {
    if (!v4)
      v4 = objc_alloc_init(GEOResourceManifestConfiguration);
    objc_storeStrong((id *)&v5->_configuration, v4);
    v6 = v5;
  }

  return v5;
}

+ (id)sharedManager
{
  if (qword_1ECDBBE68 != -1)
    dispatch_once(&qword_1ECDBBE68, &__block_literal_global_78);
  return (id)qword_1ECDBBE60;
}

- (id)dataForResourceWithName:(id)a3 fallbackBundle:(id)a4
{
  return -[GEOResourceManager dataForResourceWithName:fallbackBundle:fallbackNameHandler:](self, "dataForResourceWithName:fallbackBundle:fallbackNameHandler:", a3, a4, 0);
}

+ (id)sharedManagerForConfiguration:(id)a3
{
  id v4;
  GEOResourceManager *v5;

  v4 = a3;
  if (v4)
  {
    if (qword_1ECDBBE78 != -1)
      dispatch_once(&qword_1ECDBBE78, &__block_literal_global_3_1);
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_229);
    objc_msgSend((id)qword_1ECDBBE70, "objectForKey:", v4);
    v5 = (GEOResourceManager *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = -[GEOResourceManager initWithConfiguration:]([GEOResourceManager alloc], "initWithConfiguration:", v4);
      objc_msgSend((id)qword_1ECDBBE70, "setObject:forKey:", v5, v4);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_229);
  }
  else
  {
    objc_msgSend(a1, "sharedManager");
    v5 = (GEOResourceManager *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __52__GEOResourceManager_sharedManagerForConfiguration___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 5);
  v1 = (void *)qword_1ECDBBE70;
  qword_1ECDBBE70 = v0;

}

- (id)pathForResourceWithName:(id)a3 fallbackBundle:(id)a4
{
  return -[GEOResourceManager pathForResourceWithName:fallbackBundle:fallbackNameHandler:](self, "pathForResourceWithName:fallbackBundle:fallbackNameHandler:", a3, a4, 0);
}

- (void)dataForSignedResourceWithName:(id)a3 fallbackBundle:(id)a4 fallbackNameHandler:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *global_queue;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v10 = a6;
  if (v10)
  {
    v11 = v10;
    -[GEOResourceManager pathForResourceWithName:fallbackBundle:fallbackNameHandler:](self, "pathForResourceWithName:fallbackBundle:fallbackNameHandler:", a3, a4, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)objc_msgSend(v11, "copy");

      qos_class_self();
      global_queue = geo_get_global_queue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __101__GEOResourceManager_dataForSignedResourceWithName_fallbackBundle_fallbackNameHandler_resultHandler___block_invoke;
      v16[3] = &unk_1E1BFFBF0;
      v17 = v12;
      v11 = v13;
      v18 = v11;
      dispatch_async(global_queue, v16);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v15);

    }
  }
}

void __101__GEOResourceManager_dataForSignedResourceWithName_fallbackBundle_fallbackNameHandler_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v5 = 0;
  +[GEOSignedResource loadResourceAtPath:error:](GEOSignedResource, "loadResourceAtPath:error:", v2, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
