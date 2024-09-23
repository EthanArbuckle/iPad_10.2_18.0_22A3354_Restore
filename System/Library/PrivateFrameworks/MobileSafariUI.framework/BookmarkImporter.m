@implementation BookmarkImporter

- (BookmarkImporter)initWithBookmarkCollection:(id)a3
{
  id v5;
  BookmarkImporter *v6;
  BookmarkImporter *v7;
  BookmarkImporter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BookmarkImporter;
  v6 = -[BookmarkImporter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    v8 = v7;
  }

  return v7;
}

- (void)importBuiltinBookmarks
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__BookmarkImporter_importBuiltinBookmarks__block_invoke;
  v2[3] = &unk_1E9CFA320;
  v2[4] = self;
  -[BookmarkImporter _getCarrierBundleBuiltinBookmarkInfoWithCompletion:](self, "_getCarrierBundleBuiltinBookmarkInfoWithCompletion:", v2);
}

void __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.BookmarkImporter", v2);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v3);
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_171;
  v10[3] = &unk_1E9CFA2F8;
  v6 = v5;
  v11 = v6;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v7, "getSubscriptionInfo:", v10);
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (objc_msgSend((id)v15[5], "count"))
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend((id)v15[5], "count");
      *(_DWORD *)buf = 134217984;
      v21 = v9;
      _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_DEFAULT, "Successfully imported %ld carrier bookmarks.", buf, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  _Block_object_dispose(&v14, 8);
}

- (void)_getCarrierBundleBuiltinBookmarkInfoWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  void (**v5)(id, _QWORD);
  _QWORD block[4];
  id v7;

  v3 = (void (**)(id, _QWORD))a3;
  if ((MGGetBoolAnswer() & 1) == 0)
    v3[2](v3, MEMORY[0x1E0C9AA60]);
  dispatch_get_global_queue(9, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke;
  block[3] = &unk_1E9CF34B0;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldDeletedStaticBookmarks, 0);
  objc_storeStrong((id *)&self->_carrierBookmarkInfo, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

- (void)_importCarrierBookmarksIfNecessary
{
  NSArray *carrierBookmarkInfo;
  void *v4;
  void *v5;
  uint64_t v6;

  carrierBookmarkInfo = self->_carrierBookmarkInfo;
  -[BookmarkImporter _lastImportedCarrierBookmarksInfo](self, "_lastImportedCarrierBookmarksInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(carrierBookmarkInfo) = -[NSArray isEqual:](carrierBookmarkInfo, "isEqual:", v4);

  if ((carrierBookmarkInfo & 1) == 0)
  {
    -[WebBookmarkCollection clearCarrierBookmarks](self->_collection, "clearCarrierBookmarks");
    -[WebBookmarkCollection rootBookmark](self->_collection, "rootBookmark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "identifier");

    -[BookmarkImporter _appendBookmarksFromSource:toParent:](self, "_appendBookmarksFromSource:toParent:", CFSTR("CarrierBundle"), v6);
  }
}

- (id)_lastImportedCarrierBookmarksInfo
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[WebBookmarkCollection syncDataForKey:](self->_collection, "syncDataForKey:", CFSTR("LastImportedCarrierBookmarksArray"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[WebBookmarkCollection syncDataForKey:](self->_collection, "syncDataForKey:", CFSTR("LastImportedCarrierBookmarksDictionary"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      return 0;
    -[WebBookmarkCollection setSyncData:forKey:](self->_collection, "setSyncData:forKey:", 0, CFSTR("LastImportedCarrierBookmarksDictionary"));
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_10;
    }
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_10:

  return v6;
}

- (id)_oldDeletedStaticBookmarks
{
  NSArray *oldDeletedStaticBookmarks;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  oldDeletedStaticBookmarks = self->_oldDeletedStaticBookmarks;
  if (!oldDeletedStaticBookmarks)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("DeletedStaticBookmarks"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_oldDeletedStaticBookmarks;
    self->_oldDeletedStaticBookmarks = v5;

    oldDeletedStaticBookmarks = self->_oldDeletedStaticBookmarks;
  }
  return oldDeletedStaticBookmarks;
}

- (void)_clearOldDeletedStaticBookmarks
{
  NSArray *oldDeletedStaticBookmarks;
  id v3;

  oldDeletedStaticBookmarks = self->_oldDeletedStaticBookmarks;
  self->_oldDeletedStaticBookmarks = 0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("DeletedStaticBookmarks"));

}

- (id)_builtinFavoritesForLocale:(id)a3 deviceClass:(int64_t)a4
{
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[4];
  _QWORD v37[8];
  _QWORD v38[8];
  _QWORD v39[8];
  _QWORD v40[3];
  _QWORD v41[4];
  _QWORD v42[8];
  _QWORD v43[8];
  _QWORD v44[10];

  v44[8] = *MEMORY[0x1E0C80C00];
  v30 = a3;
  objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v29, "length"))
  {

    v29 = CFSTR("US");
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("CN"), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("TW"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("HK"), CFSTR("MO"), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("RU"), CFSTR("UA"), CFSTR("TR"), CFSTR("KZ"), CFSTR("BY"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("NL"), CFSTR("DK"), CFSTR("FI"), CFSTR("NO"), CFSTR("PL"), CFSTR("PT"), CFSTR("TH"), CFSTR("HR"), CFSTR("CZ"), CFSTR("IL"), CFSTR("HU"), CFSTR("SK"), CFSTR("KR"), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("JP"), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("GB"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("IN"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "containsObject:", v29))
  {
    v44[0] = CFSTR("Apple");
    v44[1] = CFSTR("iCloud");
    v44[2] = CFSTR("Baidu");
    v44[3] = CFSTR("Sogou");
    v44[4] = CFSTR("Qihoo");
    v44[5] = CFSTR("Bing");
    v44[6] = CFSTR("Baike");
    v44[7] = CFSTR("Sina");
    v6 = v44;
LABEL_9:
    v7 = 8;
    goto LABEL_10;
  }
  if (objc_msgSend(v27, "containsObject:", v29))
  {
    v43[0] = CFSTR("Apple");
    v43[1] = CFSTR("iCloud");
    v43[2] = CFSTR("Google");
    v43[3] = CFSTR("Yahoo");
    v43[4] = CFSTR("Wikipedia");
    v43[5] = CFSTR("Facebook");
    v43[6] = CFSTR("Twitter");
    v43[7] = CFSTR("iPeen");
    v6 = v43;
    goto LABEL_9;
  }
  if (objc_msgSend(v26, "containsObject:", v29))
  {
    v42[0] = CFSTR("Apple");
    v42[1] = CFSTR("iCloud");
    v42[2] = CFSTR("Google");
    v42[3] = CFSTR("Yahoo");
    v42[4] = CFSTR("Wikipedia");
    v42[5] = CFSTR("Facebook");
    v42[6] = CFSTR("Twitter");
    v42[7] = CFSTR("OpenRice");
    v6 = v42;
    goto LABEL_9;
  }
  if (objc_msgSend(v25, "containsObject:", v29))
  {
    v41[0] = CFSTR("Apple");
    v41[1] = CFSTR("Yandex");
    v41[2] = CFSTR("Bing");
    v41[3] = CFSTR("Google");
    v6 = v41;
LABEL_22:
    v7 = 4;
    goto LABEL_10;
  }
  if (!objc_msgSend(v24, "containsObject:", v29))
  {
    if (objc_msgSend(v23, "containsObject:", v29))
    {
      v39[0] = CFSTR("Apple");
      v39[1] = CFSTR("iCloud");
      v39[2] = CFSTR("Google");
      v39[3] = CFSTR("Yahoo");
      v39[4] = CFSTR("Wikipedia");
      v39[5] = CFSTR("Facebook");
      v39[6] = CFSTR("Twitter");
      v39[7] = CFSTR("Asahi");
      v6 = v39;
      goto LABEL_9;
    }
    if (objc_msgSend(v22, "containsObject:", v29))
    {
      v38[0] = CFSTR("Apple");
      v38[1] = CFSTR("iCloud");
      v38[2] = CFSTR("Google");
      v38[3] = CFSTR("Yahoo");
      v38[4] = CFSTR("Wikipedia");
      v38[5] = CFSTR("Facebook");
      v38[6] = CFSTR("Twitter");
      v38[7] = CFSTR("BBC");
      v6 = v38;
      goto LABEL_9;
    }
    if (objc_msgSend(v21, "containsObject:", v29))
    {
      v37[0] = CFSTR("Apple");
      v37[1] = CFSTR("iCloud");
      v37[2] = CFSTR("Google");
      v37[3] = CFSTR("Yahoo");
      v37[4] = CFSTR("Facebook");
      v37[5] = CFSTR("Zomato");
      v37[6] = CFSTR("NDTV");
      v37[7] = CFSTR("Hotstar");
      v6 = v37;
      goto LABEL_9;
    }
    v36[0] = CFSTR("Apple");
    v36[1] = CFSTR("Bing");
    v36[2] = CFSTR("Google");
    v36[3] = CFSTR("Yahoo");
    v6 = v36;
    goto LABEL_22;
  }
  v40[0] = CFSTR("Apple");
  v40[1] = CFSTR("Bing");
  v40[2] = CFSTR("Google");
  v6 = v40;
  v7 = 3;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathForResource:ofType:", CFSTR("BuiltInBookmarkItems"), CFSTR("plist"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithContentsOfFile:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v20;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(v12, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BookmarkImporter _builtInBookmarkItemWithTemplate:forLocale:deviceClass:](self, "_builtInBookmarkItemWithTemplate:forLocale:deviceClass:", v17, v30, a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          objc_msgSend(v8, "addObject:", v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v14);
  }

  return v8;
}

- (id)test_builtinFavoritesForLocale:(id)a3 deviceClass:(int64_t)a4
{
  -[BookmarkImporter _builtinFavoritesForLocale:deviceClass:](self, "_builtinFavoritesForLocale:deviceClass:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_googleChannelReplacementStringForDeviceClass:(int64_t)a3
{
  if (a3)
    return CFSTR("ipad_bm");
  else
    return CFSTR("iphone_bm");
}

- (id)_builtInBookmarkItemWithTemplate:(id)a3 forLocale:(id)a4 deviceClass:(int64_t)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v26 = a4;
  v27 = v8;
  if (!v8)
  {
    v14 = 0;
    goto LABEL_33;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("LocalizedTitle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("LocalizedURL"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v22, "length");
  v10 = objc_msgSend(v25, "length");
  v28 = 0;
  if (objc_msgSend(v23, "count") && v9 | v10)
  {
    v28 = 0;
    if (v9 && v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v25, v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v28 && v10)
    {
      objc_msgSend(v23, "objectForKey:", v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = 0;
  if (objc_msgSend(v24, "count"))
  {
    if (v9)
    {
      if (!v10
        || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v25, v22),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v24, "objectForKey:", v13),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            !v12))
      {
        objc_msgSend(v24, "objectForKey:", v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          if (v10)
          {
            objc_msgSend(v24, "objectForKey:", v25);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
  }
  if (v28)
  {
    if (!v12)
      goto LABEL_22;
  }
  else
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("Title"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_22:
      objc_msgSend(v8, "objectForKey:", CFSTR("URL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("URLQueryStringParameterKeys"));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v15);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "isEqualToString:", CFSTR("$GOOGLE_CHANNEL")))
        {
          -[BookmarkImporter _googleChannelReplacementStringForDeviceClass:](self, "_googleChannelReplacementStringForDeviceClass:", a5);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("$GOOGLE_CHANNEL"), v19);
          v20 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v20;
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v16);
  }

  v33[0] = CFSTR("Title");
  v33[1] = CFSTR("URL");
  v34[0] = v28;
  v34[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
  return v14;
}

void __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[16];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v18 = v5;
  v19 = v6;
  if (!v5 || v6)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription", v5, v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_171_cold_1(v17, (uint64_t)v28, v8);
    }
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v5, "subscriptionsInUse", v5, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v24;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
          v20[0] = v11;
          v20[1] = 3221225472;
          v20[2] = __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_172;
          v20[3] = &unk_1E9CFA2D0;
          v14 = *(void **)(a1 + 40);
          v15 = *(id *)(a1 + 32);
          v16 = *(_QWORD *)(a1 + 48);
          v21 = v15;
          v22 = v16;
          objc_msgSend(v14, "copyCarrierBookmarks:completion:", v13, v20);

        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_172(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_172_cold_1(v10, (uint64_t)v11, v9);
    }

  }
  else
  {
    v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v8);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);
    objc_sync_exit(v8);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)_myAccountBookmarkInfo
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  NSArray *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_carrierBookmarkInfo;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "safari_stringForKey:", CFSTR("MyAccountURLTitle_Localized"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safari_stringForKey:", CFSTR("MyAccountURL"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "safari_bestURLForUserTypedString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "absoluteString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          v12 = v11 == 0;
        else
          v12 = 1;
        if (v12)
        {

          v14 = 0;
          goto LABEL_14;
        }
        v21[0] = CFSTR("Title");
        v21[1] = CFSTR("URL");
        v22[0] = v8;
        v22[1] = v11;
        v21[2] = CFSTR("BookmarkType");
        v22[2] = CFSTR("CarrierBookmark");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v4)
        continue;
      break;
    }
  }

  v14 = v3;
LABEL_14:

  return v14;
}

- (id)_builtinBookmarkWithInfo:(id)a3 asCarrierBookmark:(BOOL)a4
{
  id v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v26;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D89BD0], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deviceClass");

  v9 = v8 != 3;
  if (v8 == 3)
  {
    v10 = CFSTR("iPadTitle");
LABEL_5:
    objc_msgSend(v6, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v8 == 1)
  {
    v10 = CFSTR("iPhoneTitle");
    goto LABEL_5;
  }
  v9 = 0;
LABEL_8:
  objc_msgSend(v6, "objectForKey:", CFSTR("Title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v11, &stru_1E9CFDBB0, CFSTR("BuiltinBookmarks"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v19 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[BookmarkImporter _builtinBookmarkWithInfo:asCarrierBookmark:].cold.1();
    goto LABEL_14;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("IsFolder"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0DCCB98]);
    -[WebBookmarkCollection configuration](self->_collection, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initFolderWithParentID:collectionType:", 0, objc_msgSend(v17, "collectionType"));

    objc_msgSend(v18, "setTitle:", v13);
    goto LABEL_26;
  }
  if (v8 == 3)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("iPadURL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_17:
      objc_msgSend(v6, "objectForKey:", CFSTR("iPhoneURL"));
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v21;
      if (v21)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else
  {
    v20 = 0;
    if (v9)
      goto LABEL_17;
  }
  if (v20)
    goto LABEL_22;
LABEL_21:
  objc_msgSend(v6, "objectForKey:", CFSTR("URL"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v26 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[BookmarkImporter _builtinBookmarkWithInfo:asCarrierBookmark:].cold.2();
LABEL_14:
    v18 = 0;
    goto LABEL_26;
  }
LABEL_22:
  objc_msgSend(v6, "safari_stringForKey:", CFSTR("BookmarkType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (a4 || objc_msgSend(v22, "isEqualToString:", CFSTR("CarrierBookmark")))
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DCCB98]), "initCarrierBookmarkWithTitle:address:", v13, v20);
  }
  else if (objc_msgSend(v23, "isEqualToString:", CFSTR("DeviceBookmark")))
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DCCB98]), "initBuiltinDeviceBookmarkWithTitle:address:", v13, v20);
  }
  else
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DCCB98]), "initBuiltinBookmarkWithTitle:address:", v13, v20);
  }
  v18 = (void *)v24;

LABEL_26:
  return v18;
}

- (void)_appendBookmarksFromSource:(id)a3 toParent:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSArray *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v4 = *(_QWORD *)&a4;
  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CarrierBundle")))
  {
    -[BookmarkImporter _myAccountBookmarkInfo](self, "_myAccountBookmarkInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v6 = v18;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v29;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v29 != v8)
              objc_enumerationMutation(v6);
            -[BookmarkImporter _appendBuiltinBookmarkWithInfo:toParent:asCarrierBookmark:](self, "_appendBuiltinBookmarkWithInfo:toParent:asCarrierBookmark:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9++), v4, 1);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v7);
      }

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = self->_carrierBookmarkInfo;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v25;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "safari_arrayForKey:", CFSTR("CarrierBookmarks"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v21;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v21 != v16)
                  objc_enumerationMutation(v14);
                -[BookmarkImporter _appendBuiltinBookmarkWithInfo:toParent:asCarrierBookmark:](self, "_appendBuiltinBookmarkWithInfo:toParent:asCarrierBookmark:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17++), v4, 1);
              }
              while (v15 != v17);
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
            }
            while (v15);
          }

          ++v12;
        }
        while (v12 != v10);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v10);
    }

    -[BookmarkImporter _setLastImportedCarrierBookmarksInfo:](self, "_setLastImportedCarrierBookmarksInfo:", self->_carrierBookmarkInfo);
  }
}

- (void)_appendBuiltinBookmarkWithInfo:(id)a3 toParent:(int)a4 asCarrierBookmark:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "safari_stringForKey:", CFSTR("BookmarkType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("BookmarkArray"));

  if (v10)
  {
    if (!v5)
    {
      objc_msgSend(v8, "safari_stringForKey:", CFSTR("BookmarkArraySource"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BookmarkImporter _appendBookmarksFromSource:toParent:](self, "_appendBookmarksFromSource:toParent:", v11, v6);

    }
  }
  else
  {
    -[BookmarkImporter _builtinBookmarkWithInfo:asCarrierBookmark:](self, "_builtinBookmarkWithInfo:asCarrierBookmark:", v8, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && (-[BookmarkImporter _oldDeletedStaticBookmarks](self, "_oldDeletedStaticBookmarks"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "address"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v13, "containsObject:", v14),
          v14,
          v13,
          (v15 & 1) == 0))
    {
      -[WebBookmarkCollection moveBookmark:toFolderWithID:](self->_collection, "moveBookmark:toFolderWithID:", v12, v6);
      -[WebBookmarkCollection saveBookmark:](self->_collection, "saveBookmark:", v12);
      if (objc_msgSend(v12, "isFolder"))
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v8, "objectForKey:", CFSTR("Bookmarks"), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v22;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v22 != v19)
                objc_enumerationMutation(v17);
              -[BookmarkImporter _appendBuiltinBookmarkWithInfo:toParent:asCarrierBookmark:](self, "_appendBuiltinBookmarkWithInfo:toParent:asCarrierBookmark:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++), objc_msgSend(v12, "identifier"), v5);
            }
            while (v18 != v20);
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
          }
          while (v18);
        }

      }
    }
    else
    {
      v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v26 = v6;
        _os_log_impl(&dword_1D7CA3000, v16, OS_LOG_TYPE_DEFAULT, "Not appending bookmark to folder %d", buf, 8u);
      }
    }

  }
}

- (void)_importRootFolderBuiltinBookmarks
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("BuiltinBookmarks"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v19 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_INFO, "Importing %zd root level built-in bookmarks", buf, 0xCu);
  }

  -[WebBookmarkCollection rootBookmark](self->_collection, "rootBookmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "identifier");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        -[BookmarkImporter _appendBuiltinBookmarkWithInfo:toParent:asCarrierBookmark:](self, "_appendBuiltinBookmarkWithInfo:toParent:asCarrierBookmark:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v8, 0, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_setLastImportedCarrierBookmarksInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[WebBookmarkCollection setSyncData:forKey:](self->_collection, "setSyncData:forKey:", v5, CFSTR("LastImportedCarrierBookmarksArray"));

}

- (int64_t)_currentDeviceClass
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D89BD0], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceClass");

  return v3 == 3;
}

- (void)_importFavoritesFolderBuiltinBookmarks
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Favorites folder does not exist. Importing built-in favorites will fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __42__BookmarkImporter_importBuiltinBookmarks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__BookmarkImporter_importBuiltinBookmarks__block_invoke_2;
  v5[3] = &unk_1E9CF3358;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __42__BookmarkImporter_importBuiltinBookmarks__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_importBuiltinBookmarksWithCarrierBookmarkInfo:", *(_QWORD *)(a1 + 40));
}

- (void)_importBuiltinBookmarksWithCarrierBookmarkInfo:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint8_t v15[16];
  id buf[4];

  v5 = a3;
  objc_storeStrong((id *)&self->_carrierBookmarkInfo, a3);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLForKey:", CFSTR("DidImportBuiltinBookmarks")))
  {
    v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D7CA3000, v7, OS_LOG_TYPE_INFO, "Safari has already imported built-in bookmarks; No need to import them again",
        (uint8_t *)buf,
        2u);
    }
    MEMORY[0x1D82A16A4](buf, CFSTR("com.apple.MobileSafari.BookmarkImporter"));
    if ((objc_msgSend(MEMORY[0x1E0DCCBA0], "lockSync") & 1) != 0)
    {
      -[BookmarkImporter _importCarrierBookmarksIfNecessary](self, "_importCarrierBookmarksIfNecessary");
      objc_msgSend(MEMORY[0x1E0DCCBA0], "unlockSync");
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[BookmarkImporter _importBuiltinBookmarksWithCarrierBookmarkInfo:].cold.1();
    }
  }
  else
  {
    MEMORY[0x1D82A16A4](buf, CFSTR("com.apple.MobileSafari.BookmarkImporter"));
    if ((objc_msgSend(MEMORY[0x1E0DCCBA0], "lockSync") & 1) != 0)
    {
      if (-[WebBookmarkCollection isEmpty](self->_collection, "isEmpty"))
      {
        v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_INFO, "Bookmarks collection is empty. Importing built-in bookmarks at root level", v15, 2u);
        }
        -[BookmarkImporter _importRootFolderBuiltinBookmarks](self, "_importRootFolderBuiltinBookmarks");
      }
      else
      {
        v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_INFO, "Bookmarks collection is not empty. Importing carrier bookmarks if needed", v15, 2u);
        }
        -[BookmarkImporter _importCarrierBookmarksIfNecessary](self, "_importCarrierBookmarksIfNecessary");
      }
      -[WebBookmarkCollection bookmarksBarList](self->_collection, "bookmarksBarList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "bookmarkCount");

      if (!v13)
      {
        v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_1D7CA3000, v14, OS_LOG_TYPE_INFO, "Favorites folder is empty. Importing built-in bookmarks for Favorites", v15, 2u);
        }
        -[BookmarkImporter _importFavoritesFolderBuiltinBookmarks](self, "_importFavoritesFolderBuiltinBookmarks");
      }
      objc_msgSend(MEMORY[0x1E0DCCBA0], "unlockSync");
      -[BookmarkImporter _clearOldDeletedStaticBookmarks](self, "_clearOldDeletedStaticBookmarks");
      objc_msgSend(v6, "setBool:forKey:", 1, CFSTR("DidImportBuiltinBookmarks"));
    }
    else
    {
      v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[BookmarkImporter _importBuiltinBookmarksWithCarrierBookmarkInfo:].cold.2();
    }
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(buf);

}

- (id)_uniqueYouTubeBookmarkFolderName
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  void *j;
  void *v17;
  uint64_t v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[WebBookmarkCollection subfoldersOfID:](self->_collection, "subfoldersOfID:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v20, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = v20;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v7, "title");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 == 0;

        if (!v9)
        {
          objc_msgSend(v7, "title");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v10);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0D89BD0], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userAssignedName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("YouTube – %@"), v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("YouTube");
  }
  v14 = v13;
  v15 = 1;
  for (j = v14; objc_msgSend(v2, "containsObject:", j); j = (void *)v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%u)"), v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (v15 + 1);
  }

  return j;
}

- (void)migrateYouTubeBookmarks
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Failed to remove migrated YouTube data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_171_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, a2, a3, "Failed to retrieve carrier subscription info: %{public}@", (uint8_t *)a2);

}

void __71__BookmarkImporter__getCarrierBundleBuiltinBookmarkInfoWithCompletion___block_invoke_172_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, a2, a3, "Failed to copy carrier bookmarks: %{public}@", (uint8_t *)a2);

}

- (void)_builtinBookmarkWithInfo:asCarrierBookmark:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Cannot create a built-in bookmark without a title", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_builtinBookmarkWithInfo:asCarrierBookmark:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Cannot create a built-in bookmark without a URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_importBuiltinBookmarksWithCarrierBookmarkInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Couldn't acquire bookmarks lock to import carrier bookmarks. Will try again later.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_importBuiltinBookmarksWithCarrierBookmarkInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Couldn't acquire bookmarks lock - failed to import builtin bookmarks. Will try again later.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
