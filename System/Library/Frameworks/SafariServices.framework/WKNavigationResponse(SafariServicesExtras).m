@implementation WKNavigationResponse(SafariServicesExtras)

- (id)_sf_suggestedFilename
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_sf_explicitSuggestedFilename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "response");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestedFilename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_filenameByFixingIllegalCharacters");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_sf_explicitSuggestedFilename
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_sf_hasAttachmentWithFilename"))
  {
    objc_msgSend(v2, "suggestedFilename");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_downloadAttribute");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "length"))
    {
      v4 = 0;
      goto LABEL_6;
    }
  }
  objc_msgSend(v3, "safari_filenameByFixingIllegalCharacters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v4;
}

- (uint64_t)_sf_allowReloadingInMainFrame
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  __int16 v19;
  uint8_t v20[16];
  __int16 v21;
  uint8_t buf[16];

  objc_msgSend(a1, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_isDataURL");

  if (!v4)
  {
    objc_msgSend(a1, "_request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "HTTPMethod");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "safari_isCaseInsensitiveEqualToString:", CFSTR("GET"));

    if ((v9 & 1) != 0)
    {
      objc_msgSend(a1, "response");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "allHeaderFields");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "safari_stringForKey:", CFSTR("Accept-Ranges"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "safari_isCaseInsensitiveEqualToString:", CFSTR("bytes"));

        if (v13)
        {
          v14 = WBS_LOG_CHANNEL_PREFIXDownloads();
          v6 = 1;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v20 = 0;
          }
          goto LABEL_16;
        }
      }
      else
      {

      }
      v15 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v19 = 0;
        v16 = "Assuming reload-in-main-frame is not supported";
        v17 = (uint8_t *)&v19;
        goto LABEL_14;
      }
    }
    else
    {
      v15 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v21 = 0;
        v16 = "Not allowing reload-in-main-frame because the request was not a GET request";
        v17 = (uint8_t *)&v21;
LABEL_14:
        _os_log_impl(&dword_1A3B2D000, v15, OS_LOG_TYPE_INFO, v16, v17, 2u);
      }
    }
    v6 = 0;
LABEL_16:

    return v6;
  }
  v5 = WBS_LOG_CHANNEL_PREFIXDownloads();
  v6 = 1;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_INFO, "Allowing reload-in-main-frame for a data: URL", buf, 2u);
  }
  return v6;
}

- (uint64_t)_sf_responsePolicy:()SafariServicesExtras uti:
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void (*v15)(void);
  void *v16;
  int v17;
  uint64_t v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  _Unwind_Exception *v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;

  *a3 = 0;
  objc_msgSend(a1, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MIMEType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  typeIdentifierForDownloadFromResponse(v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = v9;
  v10 = _SFDownloadingFileTypeFromUTIAndMIMEType(v9, v8);
  *a3 = v10;
  v11 = *a4;
  v12 = v8;
  v13 = v12;
  v14 = 0;
  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("application/pdf")) & 1) != 0
      || (objc_msgSend(v13, "isEqualToString:", CFSTR("text/pdf")) & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v15 = (void (*)(void))getQLPreviewGetSupportedMIMETypesSymbolLoc_ptr;
      v30 = getQLPreviewGetSupportedMIMETypesSymbolLoc_ptr;
      if (!getQLPreviewGetSupportedMIMETypesSymbolLoc_ptr)
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __getQLPreviewGetSupportedMIMETypesSymbolLoc_block_invoke;
        v26[3] = &unk_1E4ABFC78;
        v26[4] = &v27;
        __getQLPreviewGetSupportedMIMETypesSymbolLoc_block_invoke((uint64_t)v26);
        v15 = (void (*)(void))v28[3];
      }
      _Block_object_dispose(&v27, 8);
      if (!v15)
      {
        v25 = (_Unwind_Exception *)-[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:].cold.1();
        _Block_object_dispose(&v27, 8);
        _Unwind_Resume(v25);
      }
      v15();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", v13);

      if (v17)
        v14 = 2;
      else
        v14 = 3;
    }
  }

  v18 = objc_msgSend(a1, "isForMainFrame");
  if ((objc_msgSend(v7, "sf_shouldDownloadDueToContentDisposition:", v18) & 1) != 0)
  {
    v19 = 1;
  }
  else
  {
    objc_msgSend(a1, "_downloadAttribute");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20 != 0;

  }
  if (v14 == 1)
  {
    v21 = v19 & (v18 ^ 1);
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLForKey:", *MEMORY[0x1E0D4F450]);

  if (!v14)
    goto LABEL_36;
  if (v14 != 2)
  {
    if ((objc_msgSend(a1, "canShowMIMEType") ^ 1 | v19) != 1)
    {
      v21 = 0;
      goto LABEL_37;
    }
    if (objc_msgSend(a1, "canShowMIMEType")
      && (objc_msgSend(v7, "_sf_allowedToOverrideContentDispositionAttachment") & v23) == 1)
    {
      if ((v18 & 1) != 0)
        goto LABEL_28;
      if ((objc_msgSend(a1, "_sf_allowReloadingInMainFrame") & 1) != 0)
      {
        v21 = 4;
        goto LABEL_37;
      }
    }
LABEL_36:
    v21 = 1;
    goto LABEL_37;
  }
  if ((v23 & 1) == 0)
  {
    v21 = v19;
    goto LABEL_37;
  }
  if (((v18 | !v19) & 1) != 0)
  {
    if ((v18 & 1) == 0)
    {
      if (_os_feature_enabled_impl())
        v21 = 3;
      else
        v21 = 0;
      goto LABEL_37;
    }
LABEL_28:
    v21 = 3;
    goto LABEL_37;
  }
  if (objc_msgSend(a1, "_sf_allowReloadingInMainFrame"))
    v21 = 4;
  else
    v21 = 1;
LABEL_37:

  return v21;
}

@end
