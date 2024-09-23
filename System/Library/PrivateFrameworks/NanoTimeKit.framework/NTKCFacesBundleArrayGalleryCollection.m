@implementation NTKCFacesBundleArrayGalleryCollection

- (NTKCFacesBundleArrayGalleryCollection)initWithDevice:(id)a3 faceBundle:(id)a4
{
  id v7;
  id v8;
  NTKCFacesBundleArrayGalleryCollection *v9;
  NTKCFacesBundleArrayGalleryCollection *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKCFacesBundleArrayGalleryCollection;
  v9 = -[NTKCFacesBundleArrayGalleryCollection init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_faceBundle, a4);
    objc_msgSend(v8, "galleryTitleForDevice:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGalleryCollection setTitle:](v10, "setTitle:", v11);

    objc_msgSend(v8, "galleryDescriptionForDevice:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGalleryCollection setDescriptionText:](v10, "setDescriptionText:", v12);

    -[NTKFaceBundle addObserver:](v10->_faceBundle, "addObserver:", v10);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKFaceBundle removeObserver:](self->_faceBundle, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)NTKCFacesBundleArrayGalleryCollection;
  -[NTKCFacesBundleArrayGalleryCollection dealloc](&v3, sel_dealloc);
}

- (void)loadFaces
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  dispatch_block_t v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  NTKCFacesBundleArrayGalleryCollection *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NTKCFacesBundleArrayGalleryCollection device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFacesBundleArrayGalleryCollection faceBundle](self, "faceBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(45, (uint64_t)"NTKLoggingDomainFaceGallery");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v5;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Loading faces for %{public}@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke;
  block[3] = &unk_1E6BCE2C8;
  objc_copyWeak(&v17, (id *)buf);
  v7 = v5;
  v13 = v7;
  v8 = v4;
  v14 = v8;
  v9 = v3;
  v15 = v9;
  v16 = self;
  v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, -1, block);
  NTKFacesArrayGalleryCollectionLoadQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v11, v10);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  NSObject *v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 8;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    objc_msgSend(a1[5], "galleryFacesForDevice:", a1[6]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1[6], "supportsWidgetMigration") & 1) != 0)
    {
      +[NTKBundleComplicationFaceMigrator sharedInstance](NTKBundleComplicationFaceMigrator, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke_2;
      v20[3] = &unk_1E6BD5A98;
      v6 = v4;
      v21 = v6;
      v22 = a1[4];
      objc_copyWeak(&v23, v2);
      objc_msgSend(v5, "migrateFaces:completion:", v6, v20);
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = v6;
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "companionGalleryName", (_QWORD)v16);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11 == 0;

            if (!v12)
            {

              objc_msgSend(a1[7], "setCalloutName:", &__block_literal_global_112);
              goto LABEL_18;
            }
          }
          v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
          if (v8)
            continue;
          break;
        }
      }

LABEL_18:
      objc_destroyWeak(&v23);

    }
    else
    {
      _NTKLoggingObjectForDomain(45, (uint64_t)"NTKLoggingDomainFaceGallery");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = a1[4];
        *(_DWORD *)buf = 138543362;
        v28 = v15;
        _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_DEFAULT, "Skipped widget migration for %{public}@", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke_3;
      block[3] = &unk_1E6BCD778;
      block[4] = a1[7];
      v7 = v4;
      v25 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    _NTKLoggingObjectForDomain(45, (uint64_t)"NTKLoggingDomainFaceGallery");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = a1[4];
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Skipped loading faces for %{public}@ - dealloc'd", buf, 0xCu);
    }
  }

}

uint64_t __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFaces:", *(_QWORD *)(a1 + 40));
}

void __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(45, (uint64_t)"NTKLoggingDomainFaceGallery");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "Loaded %lu faces for %{public}@", (uint8_t *)&v6, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setFaces:", *(_QWORD *)(a1 + 32));

}

uint64_t __50__NTKCFacesBundleArrayGalleryCollection_loadFaces__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "companionGalleryName");
}

- (void)galleryFacesDidUpdate
{
  NSObject *v3;
  int v4;
  NTKCFacesBundleArrayGalleryCollection *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(45, (uint64_t)"NTKLoggingDomainFaceGallery");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Reloading faces for collection: %@", (uint8_t *)&v4, 0xCu);
  }

  -[NTKCFacesBundleArrayGalleryCollection loadFaces](self, "loadFaces");
}

- (CLKDevice)device
{
  return self->_device;
}

- (NTKFaceBundle)faceBundle
{
  return self->_faceBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceBundle, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
