@implementation LPiCloudSharingMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 4;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  LPiCloudSharingMetadataProviderSpecialization *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[LPPresentationSpecializations isiCloudSharingURL:](LPPresentationSpecializations, "isiCloudSharingURL:", v4);

  if (v5)
  {
    objc_msgSend(v3, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPiCloudSharingMetadata extractApplicationFromURL:](LPiCloudSharingMetadata, "extractApplicationFromURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "_lp_isEqualIgnoringCase:", CFSTR("photos")) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v3, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[LPiCloudSharingMetadata extractKindFromURL:](LPiCloudSharingMetadata, "extractKindFromURL:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[LPiCloudSharingMetadata extractTitleFromURL:](LPiCloudSharingMetadata, "extractTitleFromURL:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[LPiCloudSharingMetadataProviderSpecialization initWithContext:applicationFromURL:kindFromURL:titleFromURL:]([LPiCloudSharingMetadataProviderSpecialization alloc], "initWithContext:applicationFromURL:kindFromURL:titleFromURL:", v3, v7, v10, v12);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)canUseCloudKit
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  +[LPiCloudSharingMetadata _applicationNameMap](LPiCloudSharingMetadata, "_applicationNameMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", self->_applicationFromURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "normalizeKind:forApplication:", self->_kindFromURL, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Template")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("Freeform"))
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("Copy")) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    LPValueForEntitlement((void *)*MEMORY[0x1E0C95348]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0C95340]) & 1) != 0;

  }
  return v6;
}

- (LPiCloudSharingMetadataProviderSpecialization)initWithContext:(id)a3 applicationFromURL:(id)a4 kindFromURL:(id)a5 titleFromURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  LPiCloudSharingMetadataProviderSpecialization *v14;
  LPiCloudSharingMetadataProviderSpecialization *v15;
  uint64_t v16;
  CKContainer *baseContainer;
  LPiCloudSharingMetadataProviderSpecialization *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)LPiCloudSharingMetadataProviderSpecialization;
  v14 = -[LPMetadataProviderSpecialization initWithContext:](&v20, sel_initWithContext_, v10);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_applicationFromURL, a4);
    objc_storeStrong((id *)&v15->_kindFromURL, a5);
    objc_storeStrong((id *)&v15->_titleFromURL, a6);
    if (-[LPiCloudSharingMetadataProviderSpecialization canUseCloudKit](v15, "canUseCloudKit"))
    {
      objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", CFSTR("com.apple.cloudkit"));
      v16 = objc_claimAutoreleasedReturnValue();
      baseContainer = v15->_baseContainer;
      v15->_baseContainer = (CKContainer *)v16;

    }
    v18 = v15;
  }

  return v15;
}

- (id)applicationFromBundleIdentifiers:(id)a3 containerIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[LPiCloudSharingMetadata _bundleIdentifierMap](LPiCloudSharingMetadata, "_bundleIdentifierMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __102__LPiCloudSharingMetadataProviderSpecialization_applicationFromBundleIdentifiers_containerIdentifier___block_invoke;
  v28[3] = &unk_1E44AA0A8;
  v8 = v5;
  v29 = v8;
  objc_msgSend(v7, "keysOfEntriesPassingTest:", v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v25;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15);
          v17 = objc_alloc(MEMORY[0x1E0CA5870]);
          v18 = (void *)objc_msgSend(v17, "initWithBundleIdentifier:allowPlaceholder:error:", v16, 1, 0, (_QWORD)v24);
          objc_msgSend(v18, "localizedName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v11 = v19;

            goto LABEL_15;
          }

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        if (v13)
          continue;
        break;
      }
    }

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, 0);
    objc_msgSend(v20, "localizedName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;
    if (v21)
      v22 = v21;

  }
LABEL_15:

  return v11;
}

uint64_t __102__LPiCloudSharingMetadataProviderSpecialization_applicationFromBundleIdentifiers_containerIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

+ (id)normalizeKind:(id)a3 forApplication:(id)a4
{
  id v5;
  id v6;
  const __CFString *v7;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("Reminders")))
    goto LABEL_14;
  if (!v5)
  {
    v7 = CFSTR("Shared List");
    goto LABEL_11;
  }
  if ((objc_msgSend(v5, "_lp_isEqualIgnoringCase:", CFSTR("template")) & 1) != 0)
  {
    v7 = CFSTR("Template");
  }
  else
  {
LABEL_14:
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Freeform")))
    {
      if (objc_msgSend(v5, "_lp_isEqualIgnoringCase:", CFSTR("copy")))
        v7 = CFSTR("Copy");
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
  }
LABEL_11:

  return (id)v7;
}

- (id)iconFromShare:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  LPImage *v6;
  void *v7;
  LPImage *v8;

  v3 = a3;
  v4 = *MEMORY[0x1E0C94A78];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [LPImage alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[LPImage initWithData:MIMEType:](v6, "initWithData:MIMEType:", v7, CFSTR("image/png"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)start
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1A0C41000, a3, (uint64_t)a3, "LPiCloudSharingMetadata: start (URL=%@)", (uint8_t *)a2);

  OUTLINED_FUNCTION_4_0();
}

uint64_t __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUsingApplication:kind:title:thumbnail:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0);
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_3;
  block[3] = &unk_1E44A8DD0;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_3(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  uint64_t v19;
  id v20;
  _BYTE v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v2 = (uint64_t *)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = LPLogChannelFetching();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_3_cold_2(v2, v5, v6);
      objc_msgSend(*(id *)(a1 + 32), "fail");
    }
    else
    {
      v7 = v4;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 48), "containerIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_3_cold_1(v8, (uint64_t)v21, v7);
      }

      v9 = (void *)MEMORY[0x1E0C94C28];
      objc_msgSend(*(id *)(a1 + 48), "containerIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "containerWithIdentifier:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 56);
      *(_QWORD *)(v12 + 56) = v11;

      v14 = objc_alloc_init(MEMORY[0x1E0C94E80]);
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_32;
      v18 = &unk_1E44AA0D0;
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(id *)(a1 + 48);
      objc_msgSend(v14, "setFetchWhitelistedBundleIDsCompletionBlock:", &v15);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addOperation:", v14, v15, v16, v17, v18, v19);

    }
  }
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2_33;
  v10[3] = &unk_1E44A8388;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v5;
  v13 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2_33(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 64))
  {
    v1 = result;
    v2 = (uint64_t *)(result + 40);
    v3 = *(_QWORD *)(result + 40);
    v4 = LPLogChannelFetching();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
        __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2_33_cold_2(v2, v4, v6);
      return objc_msgSend(*(id *)(v1 + 32), "fail");
    }
    else
    {
      if (v5)
        __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2_33_cold_1(v1, v4, v6);
      return objc_msgSend(*(id *)(v1 + 32), "completeWithShareMetadata:bundleIDs:", *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 48));
    }
  }
  return result;
}

- (void)completeWithShareMetadata:(id)a3 bundleIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  LPiCloudSharingMetadata *v21;
  void *v22;
  void *v23;
  NSString *titleFromURL;
  void *v25;
  void *v26;
  LPLinkMetadata *v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  v8 = LPLogChannelFetching();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[LPiCloudSharingMetadataProviderSpecialization completeWithShareMetadata:bundleIDs:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  +[LPiCloudSharingMetadata _applicationNameMap](LPiCloudSharingMetadata, "_applicationNameMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", self->_applicationFromURL);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "normalizeKind:forApplication:", self->_kindFromURL, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "share");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A80]);
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (-[LPiCloudSharingMetadataProviderSpecialization canRetrieveThumbnailForApplication:](self, "canRetrieveThumbnailForApplication:", v17))
    {
      -[LPiCloudSharingMetadataProviderSpecialization completeRetrievingThumbnailForShareMetadata:application:kind:title:](self, "completeRetrievingThumbnailForShareMetadata:application:kind:title:", v6, v17, v18, v20);
    }
    else
    {
      -[LPiCloudSharingMetadataProviderSpecialization completeUsingApplication:kind:title:thumbnail:](self, "completeUsingApplication:kind:title:thumbnail:", v17, v18, v20, 0);
    }
  }
  else
  {
    v21 = objc_alloc_init(LPiCloudSharingMetadata);
    objc_msgSend(v6, "containerIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadataProviderSpecialization applicationFromBundleIdentifiers:containerIdentifier:](self, "applicationFromBundleIdentifiers:containerIdentifier:", v7, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata setApplication:](v21, "setApplication:", v23);

    -[LPiCloudSharingMetadata setKind:](v21, "setKind:", v18);
    if (self->_titleFromURL)
      titleFromURL = self->_titleFromURL;
    else
      titleFromURL = v20;
    -[LPiCloudSharingMetadata setTitle:](v21, "setTitle:", titleFromURL);
    objc_msgSend(v6, "share");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadataProviderSpecialization iconFromShare:](self, "iconFromShare:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata setIcon:](v21, "setIcon:", v26);

    v27 = objc_alloc_init(LPLinkMetadata);
    -[LPLinkMetadata setSpecialization:](v27, "setSpecialization:", v21);
    -[LPMetadataProviderSpecialization delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "metadataProviderSpecialization:didCompleteWithMetadata:", self, v27);

  }
}

- (void)completeUsingApplication:(id)a3 kind:(id)a4 title:(id)a5 thumbnail:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  LPiCloudSharingMetadata *v15;
  LPLinkMetadata *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = LPLogChannelFetching();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[LPiCloudSharingMetadataProviderSpecialization completeUsingApplication:kind:title:thumbnail:].cold.1((uint64_t)v10, (uint64_t)v12, v14);
  v15 = objc_alloc_init(LPiCloudSharingMetadata);
  -[LPiCloudSharingMetadata setApplication:](v15, "setApplication:", v10);
  -[LPiCloudSharingMetadata setKind:](v15, "setKind:", v11);
  -[LPiCloudSharingMetadata setTitle:](v15, "setTitle:", v12);
  -[LPiCloudSharingMetadata setThumbnail:](v15, "setThumbnail:", v13);
  v16 = objc_alloc_init(LPLinkMetadata);
  -[LPLinkMetadata setSpecialization:](v16, "setSpecialization:", v15);
  -[LPMetadataProviderSpecialization delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "metadataProviderSpecialization:didCompleteWithMetadata:", self, v16);

}

- (void)fail
{
  id v3;

  -[LPiCloudSharingMetadataProviderSpecialization cancel](self, "cancel");
  -[LPMetadataProviderSpecialization delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataProviderSpecializationDidFail:", self);

}

- (void)cancel
{
  self->_canceled = 1;
}

- (BOOL)canRetrieveThumbnailForApplication:(id)a3
{
  id v3;
  char v4;
  void **v5;
  void *v6;
  void *v7;
  void **v8;
  void *v9;
  void *v10;
  BOOL result;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Notes")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Reminders")) & 1) != 0)
  {
    v4 = 0;
LABEL_14:

    return v4;
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v5 = (void **)getBREntitlementSharingPrivateInterfaceSymbolLoc_ptr;
  v19 = getBREntitlementSharingPrivateInterfaceSymbolLoc_ptr;
  if (!getBREntitlementSharingPrivateInterfaceSymbolLoc_ptr)
  {
    v6 = CloudDocsLibrary();
    v5 = (void **)dlsym(v6, "BREntitlementSharingPrivateInterface");
    v17[3] = (uint64_t)v5;
    getBREntitlementSharingPrivateInterfaceSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v16, 8);
  if (v5)
  {
    LPValueForEntitlement(*v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "BOOLValue") & 1) == 0)
    {
      v4 = 0;
      goto LABEL_13;
    }
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v8 = (void **)getBRContainerProxyEntitlementSymbolLoc_ptr;
    v19 = getBRContainerProxyEntitlementSymbolLoc_ptr;
    if (!getBRContainerProxyEntitlementSymbolLoc_ptr)
    {
      v9 = CloudDocsLibrary();
      v8 = (void **)dlsym(v9, "BRContainerProxyEntitlement");
      v17[3] = (uint64_t)v8;
      getBRContainerProxyEntitlementSymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(&v16, 8);
    if (v8)
    {
      LPValueForEntitlement(*v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v10, "BOOLValue");

LABEL_13:
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBREntitlementSharingPrivateInterface(void)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("LPiCloudSharingMetadataProviderSpecialization.m"), 24, CFSTR("%s"), dlerror());

    __break(1u);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBRContainerProxyEntitlement(void)");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("LPiCloudSharingMetadataProviderSpecialization.m"), 25, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void)completeRetrievingThumbnailForShareMetadata:(id)a3 application:(id)a4 kind:(id)a5 title:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  LPiCloudSharingMetadataProviderSpecialization *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD aBlock[5];
  id v35;
  id v36;
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke;
  aBlock[3] = &unk_1E44AA170;
  aBlock[4] = self;
  v15 = v11;
  v35 = v15;
  v16 = v12;
  v36 = v16;
  v17 = v13;
  v37 = v17;
  v18 = _Block_copy(aBlock);
  v19 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2_46;
  v26[3] = &unk_1E44AA198;
  v20 = v10;
  v27 = v20;
  v28 = self;
  v21 = v15;
  v29 = v21;
  v22 = v16;
  v30 = v22;
  v23 = v17;
  v31 = v23;
  v24 = v18;
  v32 = v19;
  v33 = v24;
  v25 = v19;
  objc_msgSend(v25, "addOperationWithBlock:", v26);

}

void __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v13 = LPLogChannelFetching();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_cold_1((uint64_t)v7, v13, v14);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_39;
    block[3] = &unk_1E44A8388;
    v15 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v23 = v15;
    v24 = *(id *)(a1 + 48);
    v25 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(v5, "startAccessingSecurityScopedResource");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD32C8]), "initWithFileAtURL:size:scale:representationTypes:", v5, 4, 300.0, 600.0, 3.0);
    objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2;
    v16[3] = &unk_1E44AA148;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v17 = v10;
    v18 = v11;
    v19 = v12;
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    objc_msgSend(v9, "generateBestRepresentationForRequest:completionHandler:", v8, v16);

  }
}

uint64_t __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_39(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUsingApplication:kind:title:thumbnail:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
}

void __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  if (v6)
  {
    v7 = LPLogChannelFetching();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2_cold_1((uint64_t)v6, v7, v8);
  }
  else if (objc_msgSend(v5, "CGImage"))
  {
    v9 = -[LPImage _initWithCGImage:]([LPImage alloc], "_initWithCGImage:", objc_msgSend(v5, "CGImage"));
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_42;
  block[3] = &unk_1E44AA120;
  v10 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v13 = v10;
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v16 = v9;
  v11 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_42(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUsingApplication:kind:title:thumbnail:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2_46(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForUbiquityContainerIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v5 = (void *)getBRShareCopyDocumentURLForRecordIDClass_softClass;
    v20 = getBRShareCopyDocumentURLForRecordIDClass_softClass;
    if (!getBRShareCopyDocumentURLForRecordIDClass_softClass)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __getBRShareCopyDocumentURLForRecordIDClass_block_invoke;
      v21[3] = &unk_1E44A7DB0;
      v21[4] = &v17;
      __getBRShareCopyDocumentURLForRecordIDClass_block_invoke((uint64_t)v21);
      v5 = (void *)v18[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v17, 8);
    v7 = [v6 alloc];
    objc_msgSend(*(id *)(a1 + 32), "hierarchicalRootRecordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithRecordID:fileURL:withServerLookup:", v8, v4, 1);

    objc_msgSend(v9, "setCopyDocumentURLCompletionBlock:", *(_QWORD *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 72), "addOperation:", v9);

  }
  else
  {
    v10 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2_46_cold_1(v11, (uint64_t)v21, v10);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_48;
    v13[3] = &unk_1E44A8388;
    v12 = *(void **)(a1 + 48);
    v13[4] = *(_QWORD *)(a1 + 40);
    v14 = v12;
    v15 = *(id *)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E0C80D38], v13);

  }
}

uint64_t __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUsingApplication:kind:title:thumbnail:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationContainer, 0);
  objc_storeStrong((id *)&self->_baseContainer, 0);
  objc_storeStrong((id *)&self->_titleFromURL, 0);
  objc_storeStrong((id *)&self->_kindFromURL, 0);
  objc_storeStrong((id *)&self->_applicationFromURL, 0);
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_3_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1A0C41000, a3, (uint64_t)a3, "LPiCloudSharingMetadata: starting fetch bundleIDs (container=%@)", (uint8_t *)a2);

  OUTLINED_FUNCTION_4_0();
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_3_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_6(&dword_1A0C41000, a2, a3, "LPiCloudSharingMetadata: failed with error (%@)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2_33_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_6(&dword_1A0C41000, a2, a3, "LPiCloudSharingMetadata: finished fetching bundleIDs (%@)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2_33_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_6(&dword_1A0C41000, a2, a3, "LPiCloudSharingMetadata: container fetch failed with error (%@)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)completeWithShareMetadata:(uint64_t)a3 bundleIDs:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1A0C41000, a1, a3, "LPiCloudSharingMetadata: completed fetches", a5, a6, a7, a8, 0);
}

- (void)completeUsingApplication:(os_log_t)log kind:title:thumbnail:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1A0C41000, log, OS_LOG_TYPE_DEBUG, "LPiCloudSharingMetadata: completed using application name (%@) and title (%@)", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A0C41000, a2, a3, "LPiCloudSharingMetadata: failed to retrieve a documentURL from a shareURL (%@)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A0C41000, a2, a3, "LPiCloudSharingMetadata: failed to retrieve a thumbnail from QuickLookThumbnailing (%@)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2_46_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A0C41000, a3, (uint64_t)a3, "LPiCloudSharingMetadata: failed to retrieve a containerURL (container=%@)", (uint8_t *)a2);

  OUTLINED_FUNCTION_4_0();
}

@end
