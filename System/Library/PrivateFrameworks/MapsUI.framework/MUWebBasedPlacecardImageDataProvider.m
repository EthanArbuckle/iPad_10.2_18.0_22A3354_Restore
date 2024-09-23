@implementation MUWebBasedPlacecardImageDataProvider

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MUWebBasedPlacecardImageDataProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED01B528 != -1)
    dispatch_once(&qword_1ED01B528, block);
  return (id)_MergedGlobals_116;
}

void __54__MUWebBasedPlacecardImageDataProvider_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_116;
  _MergedGlobals_116 = (uint64_t)v1;

}

- (id)imageDataForStyleAttributes:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "nightMode");
  v6 = objc_msgSend(v4, "transparent");
  objc_msgSend(v4, "styleAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D275B0]), "initWithDictionary:", v8);
  v10 = objc_alloc_init(MEMORY[0x1E0D275A8]);
  objc_msgSend(v10, "setKey:", 5);
  objc_msgSend(v10, "setValue:", 3);
  objc_msgSend(v9, "addAttribute:", v10);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithGEOStyleAttributes:", v9);
  v12 = (void *)MEMORY[0x1E0CC17D0];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nativeScale");
  LOBYTE(v17) = v5;
  objc_msgSend(v12, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:", v11, 4, 1, v6, 0, 0, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUWebBasedPlacecardImageDataProvider _base64EncodedImageForUIImage:](self, "_base64EncodedImageForUIImage:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)dataForAMPId:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CC1760];
  v7 = a3;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUPlaceAppLockupView appIconSize](MUPlaceAppLockupView, "appIconSize");
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "screenScale");
  v16 = v15;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68__MUWebBasedPlacecardImageDataProvider_dataForAMPId_withCompletion___block_invoke;
  v18[3] = &unk_1E2E016A8;
  v19 = v5;
  v17 = v5;
  objc_msgSend(v8, "appleMediaServicesResultsWithIdentifiers:artworkSize:screenScale:type:source:completion:", v9, 1, 4, v18, v11, v13, v16);

}

void __68__MUWebBasedPlacecardImageDataProvider_dataForAMPId_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || !v6)
  {
    if (qword_1ED01B538 != -1)
      dispatch_once(&qword_1ED01B538, &__block_literal_global_4);
    v24 = qword_1ED01B530;
    if (os_log_type_enabled((os_log_t)qword_1ED01B530, OS_LOG_TYPE_ERROR))
    {
      v25 = 138412290;
      v26 = v5;
      _os_log_impl(&dword_191DB8000, v24, OS_LOG_TYPE_ERROR, "Error with fetching adam ids %@", (uint8_t *)&v25, 0xCu);
    }
    v23 = *(_QWORD *)(a1 + 32);
    if (v23)
      goto LABEL_20;
  }
  else if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("identifier"));

    }
    objc_msgSend(v6, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "displayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("displayName"));

    }
    objc_msgSend(v6, "subtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "subtitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("subtitle"));

    }
    objc_msgSend(v6, "artworkURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v6, "artworkURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "absoluteString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v17, CFSTR("artworkURL"));

    }
    objc_msgSend(v6, "url");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v6, "url");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "absoluteString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v21, CFSTR("url"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isAppInstalled"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v22, CFSTR("isAppInstalled"));

    v23 = *(_QWORD *)(a1 + 32);
LABEL_20:
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v7);
  }

}

- (void)attributionDataForVendorID:(id)a3 mapItem:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *i;
  void *v40;
  void *v41;
  int v42;
  MUWebBasedPlacecardImageDataProvider *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_attribution");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "providerID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", v8);

  if (v14)
  {
    objc_msgSend(v9, "_attribution");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v9, "_reviewsAttribution");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "providerID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", v8);

  if (v18)
  {
    objc_msgSend(v9, "_reviewsAttribution");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v9, "_photosAttribution");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "providerID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", v8);

  if (v21)
  {
    objc_msgSend(v9, "_photosAttribution");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v9, "_encyclopedicInfoAttribution");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "providerID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", v8);

  if (v24)
  {
    objc_msgSend(v9, "_encyclopedicInfoAttribution");
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v25 = (id)v15;
    if (!v15)
      goto LABEL_21;
    goto LABEL_10;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v9, "_allPhotoAttributions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v25)
  {
    v43 = self;
    v38 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v38)
          objc_enumerationMutation(obj);
        v40 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v40, "providerID", v43);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqualToString:", v8);

        if (v42)
        {
          v25 = v40;
          goto LABEL_32;
        }
      }
      v25 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v25)
        continue;
      break;
    }
LABEL_32:
    self = v43;
  }

  if (v25)
  {
LABEL_10:
    objc_msgSend(v25, "providerName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v25, "providerName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v27, CFSTR("displayName"));

    }
    objc_msgSend(v25, "providerID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v25, "providerID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v29, CFSTR("providerID"));

    }
    objc_msgSend(v25, "attributionURLs");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v25, "attributionURLs");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v31, CFSTR("baseActionUrl"));

    }
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "screenScale");
    objc_msgSend(v25, "providerLogoImageForScale:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      -[MUWebBasedPlacecardImageDataProvider _base64EncodedImageForUIImage:](self, "_base64EncodedImageForUIImage:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v34, CFSTR("logoImage"));

    }
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "screenScale");
    objc_msgSend(v25, "providerSnippetLogoImageForScale:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[MUWebBasedPlacecardImageDataProvider _base64EncodedImageForUIImage:](self, "_base64EncodedImageForUIImage:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v37, CFSTR("snippetLogoImage"));

    }
  }
LABEL_21:
  v10[2](v10, v11);

}

- (id)_base64EncodedImageForUIImage:(id)a3
{
  void *v3;
  void *v4;

  UIImagePNGRepresentation((UIImage *)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
