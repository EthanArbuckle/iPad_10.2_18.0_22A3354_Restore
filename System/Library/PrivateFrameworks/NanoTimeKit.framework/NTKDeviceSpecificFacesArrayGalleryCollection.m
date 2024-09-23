@implementation NTKDeviceSpecificFacesArrayGalleryCollection

- (NTKDeviceSpecificFacesArrayGalleryCollection)initWithDevice:(id)a3
{
  id v5;
  NTKDeviceSpecificFacesArrayGalleryCollection *v6;
  NTKDeviceSpecificFacesArrayGalleryCollection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKDeviceSpecificFacesArrayGalleryCollection;
  v6 = -[NTKDeviceSpecificFacesArrayGalleryCollection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (CLKDevice)device
{
  return self->_device;
}

- (id)descriptionText
{
  return 0;
}

- (void)loadFacesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD aBlock[4];
  id v11;
  NTKDeviceSpecificFacesArrayGalleryCollection *v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[NTKDeviceSpecificFacesArrayGalleryCollection device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6BD39D8;
  objc_copyWeak(&v14, &location);
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = v4;
  v13 = v7;
  v8 = _Block_copy(aBlock);
  NTKFacesArrayGalleryCollectionLoadQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v9, v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  dispatch_group_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  dispatch_group_t v20;
  id v21;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "facesForDevice:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKBundleComplicationFaceMigrator sharedInstance](NTKBundleComplicationFaceMigrator, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = dispatch_group_create();
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke_2;
    v19[3] = &unk_1E6BD39B0;
    v20 = v7;
    v21 = v6;
    v9 = v6;
    v10 = v7;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke_4;
    v14[3] = &unk_1E6BD39D8;
    objc_copyWeak(&v18, v2);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v15 = v5;
    v16 = v11;
    v17 = v12;
    v13 = v5;
    dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v14);

    objc_destroyWeak(&v18);
  }

}

void __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke_3;
  v6[3] = &unk_1E6BCE828;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "migrateFace:completion:", v4, v6);

}

void __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72__NTKDeviceSpecificFacesArrayGalleryCollection_loadFacesWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setFaces:", *(_QWORD *)(a1 + 32));
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v7 = 138412802;
    v8 = v4;
    v9 = 2048;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Finished loading %@ (%p) with %lu faces", (uint8_t *)&v7, 0x20u);
  }

  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (id)title
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return &stru_1E6BDC918;
}

- (id)facesForDevice:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return (id)MEMORY[0x1E0C9AA60];
}

@end
