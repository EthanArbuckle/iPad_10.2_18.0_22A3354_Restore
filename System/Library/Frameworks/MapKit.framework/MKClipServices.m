@implementation MKClipServices

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MKClipServices_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE2D880 != -1)
    dispatch_once(&qword_1ECE2D880, block);
  return (id)_MergedGlobals_127;
}

void __32__MKClipServices_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_127;
  _MergedGlobals_127 = (uint64_t)v1;

}

- (MKClipServices)init
{
  MKClipServices *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *requestAppClipMetadataQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKClipServices;
  v2 = -[MKClipServices init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.MapKit.MKClipServices.RequestAppClipMetadata", v3);
    requestAppClipMetadataQueue = v2->_requestAppClipMetadataQueue;
    v2->_requestAppClipMetadataQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)appClipWithQuickLink:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__MKClipServices_appClipWithQuickLink_completion___block_invoke;
    v10[3] = &unk_1E20D81C8;
    v11 = v8;
    -[MKClipServices appClipsFromQuickLinks:completion:](self, "appClipsFromQuickLinks:completion:", v9, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __50__MKClipServices_appClipWithQuickLink_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)quickLinksCopyByRemovingNonAvailableAppClipLinks:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v14, "type") == 2)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__MKClipServices_quickLinksCopyByRemovingNonAvailableAppClipLinks_completion___block_invoke;
  v18[3] = &unk_1E20D81F0;
  v19 = v9;
  v20 = v7;
  v16 = v7;
  v17 = v9;
  -[MKClipServices _validateAppClipBasedQuickLinks:completion:](self, "_validateAppClipBasedQuickLinks:completion:", v15, v18);

}

void __78__MKClipServices_quickLinksCopyByRemovingNonAvailableAppClipLinks_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id obj;
  _QWORD block[4];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v20 = a1;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v9 = objc_msgSend(v3, "containsObject:", v8);
        MKGetClipServicesLog();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
        if ((v9 & 1) != 0)
        {
          if (v11)
          {
            objc_msgSend(v8, "appAdamID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "URLString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "bundleID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v31 = v12;
            v32 = 2112;
            v33 = v13;
            v34 = 2112;
            v35 = v14;
            _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_DEBUG, "Removing quick link with identifier %@ url %@ bundleID %@", buf, 0x20u);

          }
        }
        else
        {
          if (v11)
          {
            objc_msgSend(v8, "appAdamID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "URLString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "bundleID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v31 = v15;
            v32 = 2112;
            v33 = v16;
            v34 = 2112;
            v35 = v17;
            _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_DEBUG, "Adding quick link with identifier %@ url %@ bundleID %@", buf, 0x20u);

          }
          objc_msgSend(v21, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v5);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__MKClipServices_quickLinksCopyByRemovingNonAvailableAppClipLinks_completion___block_invoke_15;
  block[3] = &unk_1E20D7F70;
  v18 = *(id *)(v20 + 40);
  v24 = v21;
  v25 = v18;
  v19 = v21;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __78__MKClipServices_quickLinksCopyByRemovingNonAvailableAppClipLinks_completion___block_invoke_15(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)appClipsFromQuickLinks:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *requestAppClipMetadataQueue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a3;
  objc_msgSend(v7, "predicateWithBlock:", &__block_literal_global_4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  requestAppClipMetadataQueue = self->_requestAppClipMetadataQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__MKClipServices_appClipsFromQuickLinks_completion___block_invoke_2;
  v14[3] = &unk_1E20D8238;
  v15 = v10;
  v16 = v6;
  v12 = v6;
  v13 = v10;
  dispatch_async(requestAppClipMetadataQueue, v14);

}

BOOL __52__MKClipServices_appClipsFromQuickLinks_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 2;
}

void __52__MKClipServices_appClipsFromQuickLinks_completion___block_invoke_2(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id obj;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *log;
  void *v36;
  void *v37;
  _QWORD block[4];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t v49[128];
  _BYTE buf[24];
  void *v51;
  uint64_t *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v28 = a1;
  obj = *(id *)(a1 + 32);
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v42 != v32)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v4 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v3, "URLString");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "URLWithString:", v5);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = 0;
        v46 = &v45;
        v47 = 0x2050000000;
        v6 = (void *)getCPSClipMetadataRequestClass_softClass;
        v48 = getCPSClipMetadataRequestClass_softClass;
        if (!getCPSClipMetadataRequestClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getCPSClipMetadataRequestClass_block_invoke;
          v51 = &unk_1E20D8078;
          v52 = &v45;
          __getCPSClipMetadataRequestClass_block_invoke((uint64_t)buf);
          v6 = (void *)v46[3];
        }
        v7 = v6;
        _Block_object_dispose(&v45, 8);
        v36 = (void *)objc_msgSend(objc_alloc((Class)v7), "initWithURL:", v37);
        MKGetClipServicesLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v3, "URLString");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v9;
          _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_DEBUG, "Requesting app clip for url = \"%@\", buf, 0xCu);

        }
        objc_msgSend(v36, "getClipMetadataSynchronously");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v3, "title");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            log = v11;
          }
          else
          {
            objc_msgSend(v10, "clipName");
            log = objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v10, "bundleDisplayName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            v34 = v14;
          }
          else
          {
            objc_msgSend(v10, "clipName");
            v34 = (id)objc_claimAutoreleasedReturnValue();
          }

          v16 = objc_alloc(MEMORY[0x1E0D26EE8]);
          objc_msgSend(v3, "bundleID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "fullAppShortName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "clipBusinessIconURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v19)
          {
            objc_msgSend(v10, "fullAppIconURL");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v31;
          }
          objc_msgSend(v10, "provider");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v16, "initWithBundleID:title:subtitle:appShortName:appClipURL:artworkURL:providerName:", v17, log, v34, v18, v37, v20, v21, v28);

          if (!v19)
          MKGetClipServicesLog();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v22)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v22;
              _os_log_impl(&dword_18B0B0000, v24, OS_LOG_TYPE_DEBUG, "Found %@", buf, 0xCu);
            }

            objc_msgSend(v29, "addObject:", v22);
          }
          else
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v3, "bundleID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v25;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = log;
              *(_WORD *)&buf[22] = 2112;
              v51 = v34;
              _os_log_impl(&dword_18B0B0000, v24, OS_LOG_TYPE_ERROR, "Unable to create app clip because one of the following was missing bundle id %@. title %@ subtitle %@", buf, 0x20u);

            }
          }

        }
        else
        {
          MKGetClipServicesLog();
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v3, "URLString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v13;
            _os_log_impl(&dword_18B0B0000, log, OS_LOG_TYPE_DEBUG, "No app clip found for url = \"%@\", buf, 0xCu);

          }
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v33);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MKClipServices_appClipsFromQuickLinks_completion___block_invoke_20;
  block[3] = &unk_1E20D7F70;
  v26 = *(id *)(v28 + 40);
  v39 = v29;
  v40 = v26;
  v27 = v29;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __52__MKClipServices_appClipsFromQuickLinks_completion___block_invoke_20(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_validateAppClipBasedQuickLinks:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t v43[128];
  _BYTE buf[24];
  void *v45;
  uint64_t *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v29 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v28 = v6;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v13, "URLString", v28, v29);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "URLWithString:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObject:", v16);
          objc_msgSend(v13, "bundleID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v17);

          objc_msgSend(v8, "setObject:forKey:", v13, v16);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v10);
    }

    MKGetClipServicesLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v30;
      _os_log_impl(&dword_18B0B0000, v18, OS_LOG_TYPE_DEBUG, "Requesting validation with url list %@ and bundle identifier list %@", buf, 0x16u);
    }

    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v19 = (void *)getCPSValidationRequestClass_softClass;
    v42 = getCPSValidationRequestClass_softClass;
    v20 = MEMORY[0x1E0C809B0];
    if (!getCPSValidationRequestClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getCPSValidationRequestClass_block_invoke;
      v45 = &unk_1E20D8078;
      v46 = &v39;
      __getCPSValidationRequestClass_block_invoke((uint64_t)buf);
      v19 = (void *)v40[3];
    }
    v21 = v19;
    _Block_object_dispose(&v39, 8);
    v22 = objc_alloc((Class)v21);
    v23 = (void *)objc_msgSend(v7, "copy");
    v24 = (void *)objc_msgSend(v30, "copy");
    v25 = (void *)objc_msgSend(v22, "initWithURLs:bundleIDs:", v23, v24);

    v31[0] = v20;
    v31[1] = 3221225472;
    v31[2] = __61__MKClipServices__validateAppClipBasedQuickLinks_completion___block_invoke;
    v31[3] = &unk_1E20D8260;
    v32 = v7;
    v33 = v8;
    v34 = v28;
    v26 = v8;
    v27 = v7;
    objc_msgSend(v25, "validateWithCompletion:", v31);

    v6 = v28;
  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA60]);
  }

}

void __61__MKClipServices__validateAppClipBasedQuickLinks_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MKGetClipServicesLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "availabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v5;
    _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_DEBUG, "Received validation result with availabilities %@", buf, 0xCu);

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v22;
    *(_QWORD *)&v9 = 138412290;
    v20 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        objc_msgSend(v3, "availabilities", v20, (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v15, "BOOLValue") & 1) == 0)
        {
          MKGetClipServicesLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            v27 = v13;
            _os_log_impl(&dword_18B0B0000, v16, OS_LOG_TYPE_DEBUG, "app clip with url %@ is not available", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v17);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v18 = *(_QWORD *)(a1 + 48);
  v19 = (void *)objc_msgSend(v6, "copy");
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

}

- (void)requestAppClip:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a4;
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v7 = (void *)getCPSClipRequestClass_softClass;
  v16 = getCPSClipRequestClass_softClass;
  if (!getCPSClipRequestClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getCPSClipRequestClass_block_invoke;
    v12[3] = &unk_1E20D8078;
    v12[4] = &v13;
    __getCPSClipRequestClass_block_invoke((uint64_t)v12);
    v7 = (void *)v14[3];
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);
  v9 = objc_alloc((Class)v8);
  objc_msgSend(v6, "appClipURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v9, "initWithURL:", v10);
  objc_msgSend(v11, "requestClipWithCompletion:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAppClipMetadataQueue, 0);
}

@end
