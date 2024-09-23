@implementation SFCreateAppSuggestionBannerFromMetaTagContent

void __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id obj;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD block[5];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_3;
    block[3] = &unk_1E21E3330;
    block[4] = *(_QWORD *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_48;
  }
  v33 = a1;
  v34 = v3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (!v5)
  {
    v36 = 0;
    v37 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v35 = 0;
    v10 = 0;
    goto LABEL_40;
  }
  v6 = v5;
  v36 = 0;
  v37 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v35 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v51;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v51 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10 && objc_msgSend(v15, "rangeOfString:options:", CFSTR("app-id"), 9) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = (void *)MEMORY[0x1E0CB37E8];
        SFValueFromKeyValueString(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "longLongValue"));
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_34:

        goto LABEL_35;
      }
      if (!v9
        && objc_msgSend(v15, "rangeOfString:options:", CFSTR("app-clip-registered-link"), 9) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v18 = (void *)MEMORY[0x1E0CB37E8];
        SFValueFromKeyValueString(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "numberWithBool:", objc_msgSend(v17, "BOOLValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      if (!v8 && objc_msgSend(v15, "rangeOfString:options:", CFSTR("app-clip-bundle-id"), 9) != 0x7FFFFFFFFFFFFFFFLL)
      {
        SFValueFromKeyValueString(v15);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if (!v7
        && objc_msgSend(v15, "rangeOfString:options:", CFSTR("app-clip-action-title"), 9) != 0x7FFFFFFFFFFFFFFFLL)
      {
        SFValueFromKeyValueString(v15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if (!v37 && objc_msgSend(v15, "rangeOfString:options:", CFSTR("app-clip-display"), 9) != 0x7FFFFFFFFFFFFFFFLL)
      {
        SFValueFromKeyValueString(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "caseInsensitiveCompare:", CFSTR("card")))
        {
          v19 = objc_msgSend(v17, "caseInsensitiveCompare:", CFSTR("banner"));
          v20 = (void *)MEMORY[0x1E0C9AAA0];
          if (v19)
            v20 = 0;
        }
        else
        {
          v20 = (void *)MEMORY[0x1E0C9AAB0];
        }
        v37 = v20;
        goto LABEL_34;
      }
      if (v36 || objc_msgSend(v15, "rangeOfString:options:", CFSTR("affiliate-data"), 9) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (!v35)
        {
          if (objc_msgSend(v15, "rangeOfString:options:", CFSTR("app-argument"), 9) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v35 = 0;
          }
          else
          {
            SFValueFromKeyValueString(v15);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      else
      {
        SFValueFromKeyValueString(v15);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_35:

    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  }
  while (v6);
LABEL_40:
  v21 = actionTitleFromString_onceToken;
  v22 = v7;
  if (v21 != -1)
    dispatch_once(&actionTitleFromString_onceToken, &__block_literal_global_51_0);
  v4 = v34;
  v23 = (void *)actionTitleFromString_actionMapping;
  objc_msgSend(v22, "lowercaseString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "objectForKeyedSubscript:", v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  v27 = (void *)actionTitleFromString_defaultTitle;
  if (v25)
    v27 = (void *)v25;
  v28 = v27;

  if (v10 | v8)
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_36;
    v39[3] = &unk_1E21E58F8;
    v40 = (id)v10;
    v29 = *(id *)(v33 + 32);
    v30 = *(_QWORD *)(v33 + 48);
    v41 = v29;
    v48 = v30;
    v42 = v36;
    v31 = v35;
    v43 = v35;
    v44 = (id)v8;
    v45 = v28;
    v32 = v37;
    v46 = v37;
    v47 = *(id *)(v33 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v39);

  }
  else
  {
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_4;
    v49[3] = &unk_1E21E3330;
    v49[4] = *(_QWORD *)(v33 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v49);
    v31 = v35;
    v32 = v37;
  }

LABEL_48:
}

uint64_t __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
}

uint64_t __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_4(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXBanners();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_4_cold_1(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
}

void __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_36(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  id v7;
  void *v8;
  SFClipLink *v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  SFClipLink *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  SFClipLink *v17;
  id v18;
  _QWORD aBlock[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_2_37;
  aBlock[3] = &unk_1E21E5840;
  v20 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 96);
  v21 = v3;
  v24 = v4;
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!*(_QWORD *)(a1 + 64))
    goto LABEL_8;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v6 = (void *)getCPSClipURLClass_softClass;
  v29 = getCPSClipURLClass_softClass;
  if (!getCPSClipURLClass_softClass)
  {
    v25[0] = v2;
    v25[1] = 3221225472;
    v25[2] = __getCPSClipURLClass_block_invoke;
    v25[3] = &unk_1E21E3330;
    v25[4] = &v26;
    __getCPSClipURLClass_block_invoke((uint64_t)v25);
    v6 = (void *)v27[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v26, 8);
  if (objc_msgSend(v7, "isSupported")
    && (v8 = *(void **)(a1 + 40)) != 0
    && (objc_msgSend(v8, "safari_isHTTPFamilyURL") & 1) != 0)
  {
    v9 = -[SFClipLink initWithURL:bundleIdentifier:actionTitle:]([SFClipLink alloc], "initWithURL:bundleIdentifier:actionTitle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    -[SFClipLink setSiteRequestsShowCard:](v9, "setSiteRequestsShowCard:", objc_msgSend(*(id *)(a1 + 80), "BOOLValue"));
    v16[0] = v2;
    v16[1] = 3221225472;
    v16[2] = __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_45;
    v16[3] = &unk_1E21E58A8;
    v17 = v9;
    v18 = *(id *)(a1 + 88);
    v13[0] = v2;
    v13[1] = 3221225472;
    v13[2] = __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_49;
    v13[3] = &unk_1E21E58D0;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 96);
    v14 = v10;
    v15 = v11;
    v12 = v9;
    +[SFClipLinkBanner getClipLinkBannerForClipLink:openActionHandler:completionHandler:](SFClipLinkBanner, "getClipLinkBannerForClipLink:openActionHandler:completionHandler:", v12, v16, v13);

  }
  else
  {
LABEL_8:
    v5[2](v5);
  }

}

void __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_2_37(uint64_t a1)
{
  void *v1;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_3_38;
    block[3] = &unk_1E21E5840;
    v7 = v1;
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 64);
    v8 = v4;
    v11 = v5;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    dispatch_async(v3, block);

  }
}

void __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_3_38(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  +[SFStoreBannerTracker sharedTracker](SFStoreBannerTracker, "sharedTracker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "safari_userVisibleHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_4_40;
  v7[3] = &unk_1E21E5818;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 64);
  v8 = v5;
  v12 = v6;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v2, "isProductBannerBlocked:forHost:completion:", v3, v4, v7);

}

void __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_4_40(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_5;
  v5[3] = &unk_1E21E57F0;
  v11 = a2;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 64);
  v6 = v3;
  v10 = v4;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  SFStoreBanner *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(void **)(a1 + 32);
      v4 = v2;
      v9 = 67174657;
      v10 = objc_msgSend(v3, "intValue");
      _os_log_impl(&dword_18B7B2000, v4, OS_LOG_TYPE_INFO, "Not showing banner for app '%{private}i' because of the user's preference", (uint8_t *)&v9, 8u);

    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) + 16))();
  }
  else
  {
    v5 = -[SFStoreBanner initWithProductID:mainDocumentURL:affiliateData:applicationLaunchArgument:]([SFStoreBanner alloc], "initWithProductID:mainDocumentURL:affiliateData:applicationLaunchArgument:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v6 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = 67174657;
      v10 = objc_msgSend(v7, "intValue");
      _os_log_impl(&dword_18B7B2000, v8, OS_LOG_TYPE_INFO, "Showing banner for app '%{private}i'", (uint8_t *)&v9, 8u);

    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) + 16))();

  }
}

void __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
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
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v3 = a2;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v4 = (void *)getCPSClipRequestClass_softClass;
  v31 = getCPSClipRequestClass_softClass;
  if (!getCPSClipRequestClass_softClass)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __getCPSClipRequestClass_block_invoke;
    v27[3] = &unk_1E21E3330;
    v27[4] = &v28;
    __getCPSClipRequestClass_block_invoke((uint64_t)v27);
    v4 = (void *)v29[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v28, 8);
  v6 = [v5 alloc];
  objc_msgSend(*(id *)(a1 + 32), "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithURL:fallbackClipBundleID:", v7, v8);

  objc_msgSend(v9, "sessionProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v11, "setReferrerBundleID:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_systemNavigationAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForSetting:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "bundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(v15, "sceneIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(CFSTR("sceneID:"), "length");
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

        v25 = v21 + v24 + 1;
        v26 = objc_msgSend(v20, "length");
        if (v26 <= v25)
        {
          v18 = 0;
        }
        else
        {
          objc_msgSend(v20, "substringWithRange:", v21, v26 - v25);
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.springboard.spotlight-placeholder")) & 1) != 0)
        v19 = 0;
      else
        v19 = v18;

    }
    else
    {
      v19 = 0;
    }

    objc_msgSend(v11, "setReferrerBundleID:", v19);
  }
  objc_msgSend(v9, "requestClipWithCompletion:", &__block_literal_global_37);

}

void __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_2_46(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = v4;
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_18B7B2000, v5, OS_LOG_TYPE_INFO, "Failed to request clip with error %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }

}

uint64_t __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_49(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint8_t v5[16];

  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
  v4 = WBS_LOG_CHANNEL_PREFIXBanners();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18B7B2000, v4, OS_LOG_TYPE_DEFAULT, "Falling back to full app's smart app banner", v5, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __SFCreateAppSuggestionBannerFromMetaTagContent_block_invoke_4_cold_1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  __int16 v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 138543618;
  v2 = CFSTR("app-id");
  v3 = 2114;
  v4 = CFSTR("app-clip-bundle-id");
  _os_log_error_impl(&dword_18B7B2000, log, OS_LOG_TYPE_ERROR, "Not showing banner because there wasn't a valid '%{public}@' or '%{public}@' parameter", (uint8_t *)&v1, 0x16u);
}

@end
