void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t CopyImageBlockSetCallback(void *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = a1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      CopyImageBlockSetCallback_cold_1();
    v5 = objc_msgSend(v4, "__IS_copyCGImageBlockSetWithProvider:", a2);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(a1, "blockSet");
      if (v5)
        CGImageBlockSetRetain();
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

void ReleaseInfoCallback(void *a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      ReleaseInfoCallback_cold_1();
  }

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id IFTopLevelAppBundlePlistKeys()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0C99E60];
  +[IFPlistParser topLevelAppBundleIconKeys](IFPlistParser, "topLevelAppBundleIconKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id IFPossibleResourceFilenames(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  IFPlistParser *v5;
  void *v6;
  void *v7;
  void *v9;
  IFResourceNames *v10;
  void *v11;
  void *v12;

  v3 = a1;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = -[IFPlistParser initWithInfoDictionary:]([IFPlistParser alloc], "initWithInfoDictionary:", v4);
    -[IFPlistParser catalogAssetNamesReturningPlistExcerpt:](v5, "catalogAssetNamesReturningPlistExcerpt:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("Assets.car"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[IFPlistParser looseFilesNamesReturningPlistExcerpt:](v5, "looseFilesNamesReturningPlistExcerpt:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = -[IFResourceNames initWithRootNames:variants:]([IFResourceNames alloc], "initWithRootNames:variants:", v9, &unk_1E9771230);
        -[IFResourceNames extrapolateFullNamesForIOS](v10, "extrapolateFullNamesForIOS");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[IFResourceNames extrapolateFullNamesForMacOS](v10, "extrapolateFullNamesForMacOS");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setByAddingObjectsFromSet:", v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid infoDictionary"));
    v5 = (IFPlistParser *)objc_claimAutoreleasedReturnValue();
    logAndSetError(v5, -2, a2);
    v7 = 0;
  }

  return v7;
}

void logAndSetError(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  IFDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    logAndSetError_cold_1((uint64_t)v5, a2, v6);

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5, *MEMORY[0x1E0CB2D50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.iconServices.assetCapture.error"), a2, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
}

uint64_t _captureCatalogAssets(void *a1, void *a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;

  v9 = a1;
  v10 = a3;
  objc_msgSend(a2, "catalogAssetNamesReturningPlistExcerpt:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_7;
  objc_msgSend(v9, "assetCatalogURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "bundleURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Bundle '%@' declared catalog asset but couldn't find catalog"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    logAndSetError(v26, -4, a5);

LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v9, "assetCatalogURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "assetCatalogURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v18 = CUIGeneratePlaceholderAssetCatalog(v16, v15, v17, (uint64_t *)&v28);
  v19 = v28;

  if ((v18 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "assetCatalogURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Failed to thin asset catalog %@ to %@ items only. Error: %@"), v21, v22, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    logAndSetError(v23, -3, a5);

  }
LABEL_8:

  return v18;
}

uint64_t _captureLooseFileAssets(void *a1, void *a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  void *v10;
  IFResourceNames *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  IFResourceNames *v43;
  void *v44;
  id obj;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v46 = a3;
  objc_msgSend(a2, "looseFilesNamesReturningPlistExcerpt:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[IFResourceNames initWithRootNames:variants:]([IFResourceNames alloc], "initWithRootNames:variants:", v10, &unk_1E9771248);
    -[IFResourceNames extrapolateFullNamesForIOS](v11, "extrapolateFullNamesForIOS");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IFResourceNames extrapolateFullNamesForMacOS](v11, "extrapolateFullNamesForMacOS");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setByAddingObjectsFromSet:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "URLsForResources:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 && objc_msgSend(v16, "count"))
    {
      v40 = v15;
      v41 = v13;
      v38 = a5;
      v39 = v17;
      v42 = v12;
      v43 = v11;
      v44 = v9;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = v17;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v49 != v21)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v23, "lastPathComponent");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "URLByAppendingPathComponent:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 0;
            v27 = objc_msgSend(v26, "copyItemAtURL:toURL:error:", v23, v25, &v47);
            v28 = v47;

            if ((v27 & 1) == 0)
            {
              IFDefaultLog();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v53 = v23;
                v54 = 2112;
                v55 = v25;
                v56 = 2112;
                v57 = v28;
                _os_log_impl(&dword_1D4106000, v29, OS_LOG_TYPE_INFO, "Failed to copy file %@ to %@. Error: %@", buf, 0x20u);
              }

              ++v20;
            }

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
        }
        while (v19);
      }
      else
      {
        v20 = 0;
      }

      if (objc_msgSend(obj, "count") == v20)
      {
        v34 = (void *)MEMORY[0x1E0CB3940];
        v9 = v44;
        objc_msgSend(v44, "bundleURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v40;
        objc_msgSend(v34, "stringWithFormat:", CFSTR("Failed to retrieve file assets %@ from %@"), v40, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        logAndSetError(v36, -5, v38);

        v33 = 0;
        v11 = v43;
        v13 = v41;
        v12 = v42;
      }
      else
      {
        v33 = 1;
        v9 = v44;
        v12 = v42;
        v11 = v43;
        v15 = v40;
        v13 = v41;
      }
      v17 = v39;
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "bundleURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("File assets %@ were declared but we were unable to find them in %@"), v15, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      logAndSetError(v32, -4, a5);

      v33 = 0;
    }

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

uint64_t IFCaptureIconContent(void *a1, void *a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  IFVariantAgnosticBundle *v13;
  IFVariantAgnosticBundle *v14;
  void *v15;
  void *v16;
  IFPlistParser *v17;
  void *v18;
  IFPlistParser *v19;
  IFPlistParser *v20;
  void *v21;
  IFPlistParser *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  char v37;
  IFPlistParser *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  if (v9)
  {
    if (v10)
    {
      IFDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v9;
        _os_log_impl(&dword_1D4106000, v12, OS_LOG_TYPE_INFO, "Capturing icon content for %@", buf, 0xCu);
      }

      v13 = -[IFBundle initWithURL:]([IFVariantAgnosticBundle alloc], "initWithURL:", v9);
      v14 = v13;
      if (!v13 || !-[IFBundle bundle](v13, "bundle"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create bundle at %@"), v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        logAndSetError(v16, -1, a5);
        v26 = 0;
LABEL_38:

        goto LABEL_39;
      }
      -[IFVariantAgnosticBundle infoDictionary](v14, "infoDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (!v15 || !objc_msgSend(v15, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to read Info.plist at %@"), v9);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        logAndSetError(v25, -1, a5);
        v26 = 0;
LABEL_37:

        goto LABEL_38;
      }
      v17 = [IFPlistParser alloc];
      -[IFVariantAgnosticBundle infoDictionary](v14, "infoDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[IFPlistParser initWithInfoDictionary:](v17, "initWithInfoDictionary:", v18);

      if (v11)
      {
        -[IFPlistParser iconContentForAlternateIconName:variants:](v19, "iconContentForAlternateIconName:variants:", v11, &unk_1E9771260);
        v20 = v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[IFPlistParser initWithInfoDictionary:]([IFPlistParser alloc], "initWithInfoDictionary:", v21);

        v19 = v22;
      }
      v23 = -[IFPlistParser hasGraphicIconReturningPlistExcerpt:](v19, "hasGraphicIconReturningPlistExcerpt:", a4);
      if ((_DWORD)v23)
      {
        IFDefaultLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v9;
          _os_log_impl(&dword_1D4106000, v24, OS_LOG_TYPE_INFO, "Graphic icon configuration set for %@", buf, 0xCu);
        }
        v25 = 0;
      }
      else
      {
        v41 = 0;
        v39 = v19;
        v30 = _captureCatalogAssets(v14, v19, v10, a4, &v41);
        v31 = v41;
        v32 = v31;
        v25 = 0;
        if ((v30 & 1) == 0 && v31)
          v25 = v31;

        if ((v30 & 1) != 0)
        {
          v26 = 1;
          v19 = v39;
          goto LABEL_36;
        }
        v40 = 0;
        v19 = v39;
        v26 = _captureLooseFileAssets(v14, v39, v10, a4, &v40);
        v33 = v40;
        v34 = v33;
        if ((v26 & 1) == 0 && v33)
        {
          if (v25)
            v35 = v25;
          else
            v35 = v33;
          v36 = v35;

          v25 = v36;
          v19 = v39;
        }

        if (v25)
          v37 = v26;
        else
          v37 = 1;
        if ((v37 & 1) != 0)
          goto LABEL_36;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to capture assets. Error: %@"), v25);
        v24 = objc_claimAutoreleasedReturnValue();
        logAndSetError(v24, -1, a5);
        v23 = 0;
      }

      v26 = v23;
LABEL_36:

      goto LABEL_37;
    }
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = CFSTR("Invalid destination url");
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = CFSTR("Invalid bundle url");
  }
  objc_msgSend(v27, "stringWithFormat:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  logAndSetError(v29, -2, a5);

  v26 = 0;
LABEL_39:

  return v26;
}

id IFDefaultLog()
{
  if (IFDefaultLog_onceToken != -1)
    dispatch_once(&IFDefaultLog_onceToken, &__block_literal_global_8);
  return (id)IFDefaultLog_log;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t CreateARGBBitmapContext()
{
  return 0;
}

uint64_t _LookupStructuredThemeProvider()
{
  return 0;
}

uint64_t CUIConstantToMapID()
{
  return 0;
}

uint64_t CUICreateEffectPresetWithStyle()
{
  return 0;
}

uint64_t CUICreateRenditionKeyWithShapeEffectState()
{
  return 0;
}

uint64_t _CUIDebugUseSimplifiedTextEffects()
{
  return 0;
}

uint64_t _CUIDebugShowGraphicVariantMetrics()
{
  return 0;
}

double _CUIEffectiveScaleForContext()
{
  return 0.0;
}

uint64_t __CUISubtypeFromIndex(unint64_t a1, unsigned int a2)
{
  uint64_t result;
  signed int v4;
  unsigned int *v5;

  if (a1 == -1)
  {
    if (a2 >= 0x20)
      return 0xFFFFFFFFLL;
    else
      return dword_1D41398EC[a2];
  }
  else if (a2)
  {
    switch(a1)
    {
      case 0uLL:
        result = 1864;
        switch(a2)
        {
          case 0x1Au:
            return 1964;
          case 0x1Bu:
            return 2234;
          case 0x1Cu:
          case 0x1Du:
          case 0x1Eu:
            goto LABEL_25;
          case 0x1Fu:
            return 1665;
          case 0x20u:
            return result;
          default:
            if (a2 != 1)
              goto LABEL_25;
            return result;
        }
      case 3uLL:
        v4 = a2 - 5;
        if (a2 - 5 >= 3)
          goto LABEL_25;
        v5 = (unsigned int *)&unk_1D413996C;
        goto LABEL_16;
      case 4uLL:
        switch(a2)
        {
          case 0x17u:
            return 430;
          case 0x18u:
            return 484;
          case 0x19u:
          case 0x1Au:
          case 0x1Bu:
            goto LABEL_25;
          case 0x1Cu:
            return 502;
          case 0x1Du:
            return 446;
          case 0x1Eu:
            return 496;
          default:
            result = 320;
            switch(a2)
            {
              case 8u:
                return result;
              case 9u:
                return 384;
              case 0xDu:
                return 340;
              case 0xEu:
                return 390;
              default:
                goto LABEL_25;
            }
        }
      case 5uLL:
        if (a2 != 1)
          goto LABEL_25;
        return 3648;
      default:
        if (a1 > 2 || a2 >= 0x1F || (v4 = a2 - 1, ((0x313FFEFFu >> (a2 - 1)) & 1) == 0))
LABEL_25:
          __CUISubtypeFromIndex_cold_1(a1);
        v5 = (unsigned int *)&unk_1D4139978;
LABEL_16:
        result = v5[v4];
        break;
    }
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t CUIValidateIdiomSubtypes(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  BOOL v5;
  BOOL v6;

  v2 = *a2;
  switch(a1)
  {
    case 0:
    case 4:
    case 6:
    case 7:
      goto LABEL_2;
    case 1:
    case 2:
      result = 1;
      if (v2 > 2419)
      {
        if (v2 <= 2731)
        {
          if (v2 > 2555)
          {
            if (v2 == 2556 || v2 == 2622 || v2 == 2688)
              return result;
          }
          else if (v2 == 2420 || v2 == 2436 || v2 == 2532)
          {
            return result;
          }
        }
        else if (v2 > 2867)
        {
          if (v2 == 2868 || v2 == 3024 || v2 == 32401)
            return result;
        }
        else if ((unint64_t)(v2 - 2752) <= 0x2C && ((1 << (v2 + 64)) & 0x100004000001) != 0
               || v2 == 2732)
        {
          return result;
        }
      }
      else if (v2 > 2159)
      {
        v6 = (unint64_t)(v2 - 2224) > 0x2A || ((1 << (v2 + 80)) & 0x40000000401) == 0;
        if (!v6
          || (unint64_t)(v2 - 2340) <= 0x30 && ((1 << (v2 - 36)) & 0x1000000100001) != 0
          || v2 == 2160)
        {
          return result;
        }
      }
      else if (v2 > 1664)
      {
        if (v2 == 1665 || v2 == 1792 || v2 == 1964)
          return result;
      }
      else if ((unint64_t)(v2 - 568) < 3 || v2 == 163)
      {
        return result;
      }
      goto LABEL_2;
    case 3:
      result = 1;
      if (v2 == 720 || v2 == 1088 || v2 == 3840)
        return result;
      goto LABEL_2;
    case 5:
      result = 1;
      if (v2 > 483)
      {
        if ((unint64_t)(v2 - 484) <= 0x12 && ((1 << (v2 + 28)) & 0x41001) != 0)
          return result;
      }
      else
      {
        v5 = (unint64_t)(v2 - 384) > 0x3E || ((1 << (v2 + 0x80)) & 0x4000400000000041) == 0;
        if (!v5 || v2 == 320 || v2 == 340)
          return result;
      }
LABEL_2:
      v3 = 0;
      *a2 = 0;
LABEL_3:
      if (v3 == v2)
        return 1;
      _CUILog();
      return 0;
    case 8:
      if (v2 != 3648)
        goto LABEL_2;
      v3 = 3648;
      goto LABEL_3;
    default:
      return 1;
  }
}

uint64_t CUIParseDeploymentTarget(char *a1, int a2)
{
  const char *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  unsigned int v15;

  v4 = *(const char **)(MEMORY[0x1E0D1A700] + 16);
  if (v4)
  {
    v5 = (_QWORD *)MEMORY[0x1E0D1A700];
    while (strcasecmp(a1, v4))
    {
      v4 = (const char *)v5[5];
      v5 += 3;
      if (!v4)
        goto LABEL_5;
    }
    return *(unsigned int *)v5;
  }
  else
  {
LABEL_5:
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a1);
    v7 = (void *)objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v8 = objc_msgSend(v7, "count");
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "intValue");
      if (v9 == 1)
        v11 = 0;
      else
        v11 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "intValue");
    }
    else
    {
      v11 = 0;
      v10 = 0x7FFFFFFF;
    }

    if (a2 <= 1)
      v13 = 1;
    else
      v13 = a2;
    switch(v13)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 7:
        if ((int)v10 < 10)
          goto LABEL_53;
        if (v10 == 10)
          return 1;
        if (v10 < 0xC)
          return 2;
        if (v10 == 12)
          goto LABEL_35;
        if (v10 < 0xE)
          return 5;
        if (v10 == 14)
          return 6;
        if (v10 < 0x10)
          return 7;
        if (v10 == 16)
          return 8;
        if (v10 <= 0x11)
          goto LABEL_50;
        if (v10 == 18)
          goto LABEL_40;
        goto LABEL_52;
      case 5:
        if ((int)v10 < 3)
          goto LABEL_53;
        if (v10 == 3)
          return 1;
        if (v10 < 5)
          return 2;
        if (v10 == 5)
        {
LABEL_35:
          v14 = v11 < 2;
          v15 = 3;
          goto LABEL_36;
        }
        if (v10 < 7)
          return 5;
        if (v10 == 7)
          return 6;
        if (v10 < 9)
          return 7;
        if (v10 == 9)
          return 8;
        if (v10 <= 0xA)
        {
LABEL_50:
          v14 = v11 < 4;
          goto LABEL_33;
        }
        if (v10 == 11)
          goto LABEL_40;
        goto LABEL_52;
      case 8:
        if ((int)v10 > 1)
        {
          if (v10 == 2)
          {
LABEL_40:
            result = 11;
          }
          else
          {
LABEL_52:
            fprintf((FILE *)*MEMORY[0x1E0C80C10], "assuming --deployment-target %s == --deployment-target any\n", a1);
LABEL_53:
            result = 0;
          }
        }
        else
        {
          v14 = v11 < 1;
LABEL_33:
          v15 = 9;
LABEL_36:
          if (v14)
            result = v15;
          else
            result = v15 + 1;
        }
        break;
      default:
        goto LABEL_52;
    }
  }
  return result;
}

uint64_t CUIWatchSubTypeFallbackOrder(uint64_t result, void *a2)
{
  uint64_t v3;

  if (result > 445)
  {
    if (result > 495)
    {
      if (result != 496 && result != 502)
        return result;
      objc_msgSend(a2, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 484));
    }
    else
    {
      if (result == 446)
      {
        v3 = 430;
        goto LABEL_18;
      }
      if (result != 484)
        return result;
    }
    v3 = 390;
LABEL_18:
    objc_msgSend(a2, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3));
    goto LABEL_19;
  }
  if (result <= 389)
  {
    if (result != 340)
    {
      if (result != 384)
        return result;
      return objc_msgSend(a2, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 320));
    }
LABEL_20:
    objc_msgSend(a2, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 384));
    return objc_msgSend(a2, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 320));
  }
  if (result == 390 || result == 430)
  {
LABEL_19:
    objc_msgSend(a2, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 340));
    goto LABEL_20;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return _CUILog();
}

const __CFString *OUTLINED_FUNCTION_1_1(uint64_t a1, uint64_t a2)
{
  return CUIPlatformNameForPlatform(a2);
}

const __CFString *OUTLINED_FUNCTION_2_1(uint64_t a1, uint64_t a2)
{
  return CUIPlatformNameForPlatform(a2);
}

BOOL __copyBlock(uint64_t a1, uint64_t a2, const char *a3)
{
  unsigned int NamedBlock;
  unsigned int v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v16;

  NamedBlock = BOMStorageGetNamedBlock(a1, a3);
  if (!NamedBlock)
    return 1;
  v7 = NamedBlock;
  v8 = BOMStorageNewNamedBlock(a2, a3);
  v9 = BOMStorageSizeOfBlock(a1, v7);
  v10 = malloc_type_malloc(v9, 0xA14CACC5uLL);
  if (BOMStorageCopyFromBlock(a1, v7, v10))
  {
    free(v10);
    return 0;
  }
  v16 = BOMStorageCopyToBlock(a2, v8, v10, v9, v11, v12, v13, v14);
  free(v10);
  if (v16)
    return 0;
  return BOMStorageCommit(a2) == 0;
}

uint64_t __copyTree(uint64_t a1, uint64_t a2, const char *a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t **i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  size_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  size_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL8 v60;

  v7 = BOMTreeOpenWithName(a1, a3, 0);
  if (!v7)
    return 1;
  v8 = v7;
  if (BOMTreePageSize(v7) <= 0x400)
    a4 = BOMTreePageSize(v8);
  v9 = BOMTreeUsesNumericKeys(v8);
  v10 = BOMTreeNewWithOptions(a2, 0, a3, a4, v9);
  if (!v10)
    return 0;
  v11 = (uint64_t)v10;
  v12 = (uint64_t **)BOMTreeIteratorNew(v8, 0, 0, 0);
  if (!v12)
    return 0;
  for (i = v12;
        !BOMTreeIteratorIsAtEnd((uint64_t)i, v13, v14, v15, v16, v17, v18, v19);
        BOMTreeIteratorNext((uint64_t)i, v53, v54, v55, v56, v57, v58, v59))
  {
    v28 = (void *)BOMTreeIteratorKey((uint64_t)i, v21, v22, v23, v24, v25, v26, v27);
    v36 = BOMTreeIteratorKeySize((uint64_t)i, v29, v30, v31, v32, v33, v34, v35);
    v44 = (const void *)BOMTreeIteratorValue((uint64_t)i, v37, v38, v39, v40, v41, v42, v43);
    v52 = BOMTreeIteratorValueSize(i, v45, v46, v47, v48, v49, v50, v51);
    BOMTreeSetValue(v11, v28, v36, v44, v52);
  }
  v60 = BOMStorageCommit(a2) == 0;
  BOMTreeIteratorFree(i);
  BOMTreeFree(v11);
  return v60;
}

uint64_t __commonAssetStoragetHandler()
{
  return _CUILog();
}

unsigned __int16 *CUIFillRenditionKeyForCARKeyArray(unsigned __int16 *result, uint64_t a2, uint64_t a3)
{
  unsigned int v5;
  unsigned __int16 *v6;
  int v7;

  if (!result || !a2)
    CUIFillRenditionKeyForCARKeyArray_cold_1();
  v5 = *(_DWORD *)(a3 + 8);
  if (v5)
  {
    v6 = result;
    v7 = 0;
    do
    {
      result = CUIRenditionKeySetValueForAttribute(v6, *(unsigned __int16 *)(a3 + 4 * (unsigned __int16)v7 + 12), *(unsigned __int16 *)(a2 + 2 * (unsigned __int16)v7), (unsigned __int16)(v5 + 1));
      ++v7;
      v5 = *(_DWORD *)(a3 + 8);
    }
    while (v5 > (unsigned __int16)v7);
  }
  return result;
}

unsigned __int16 *CUIRenditionKeySetValueForAttribute(unsigned __int16 *result, int a2, int a3, unsigned int a4)
{
  int v4;
  unint64_t v5;
  unsigned __int16 *v6;
  int v7;
  BOOL v8;
  unsigned __int16 v9;
  unsigned __int16 *v10;
  unsigned __int16 v11;
  unint64_t v12;
  unsigned __int16 *v13;

  if (result)
  {
    if (!a4)
      CUIRenditionKeySetValueForAttribute_cold_1();
    v4 = *result;
    if (!(result[1] | v4))
      goto LABEL_15;
    LODWORD(v5) = 0;
    v6 = result + 3;
    while (v4 != a2)
    {
      LODWORD(v5) = v5 + 1;
      v7 = *v6;
      v4 = *(v6 - 1);
      v6 += 2;
      if (v7)
        v8 = 0;
      else
        v8 = v4 == 0;
      if (v8)
        goto LABEL_15;
    }
    if ((v5 & 0x80000000) != 0)
    {
LABEL_15:
      if (!a3)
        return result;
      v9 = 0;
      if (result[1])
        goto LABEL_18;
      while (result[2 * v9])
      {
        do
LABEL_18:
          ++v9;
        while (result[2 * v9 + 1]);
      }
      if ((int)(a4 - 1) <= v9)
        CUIRenditionKeySetValueForAttribute_cold_2();
      v10 = &result[2 * v9];
      *v10 = a2;
      v10[1] = a3;
      v5 = v9 + 1;
      result[2 * v5] = 0;
      LOWORD(a3) = 0;
      goto LABEL_22;
    }
    if (a3)
    {
      v5 = v5;
LABEL_22:
      result[2 * v5 + 1] = a3;
      return result;
    }
    v11 = 0;
    if (result[1])
      goto LABEL_26;
    while (1)
    {
      v12 = v11;
      if (!result[2 * v11])
        break;
      do
LABEL_26:
        ++v11;
      while (result[2 * v11 + 1]);
    }
    if (a4 <= v11)
      CUIRenditionKeySetValueForAttribute_cold_3();
    if (v11 > (unsigned __int16)v5)
    {
      v5 = (unsigned __int16)v5;
      v13 = &result[2 * (unsigned __int16)v5 + 2];
      do
      {
        ++v5;
        *((_DWORD *)v13 - 1) = *(_DWORD *)v13;
        v13 += 2;
      }
      while (v5 < v12);
    }
  }
  return result;
}

const char *CUISystemThemeRenditionKeyFormat()
{
  return "tmfk";
}

const char *CUIDefaultThemeRenditionKeyFormat(int a1, unsigned int a2)
{
  const char *v2;
  const char *v3;

  switch(a1)
  {
    case 4:
      return "tmfk";
    case 2:
      if (a2 >= 6)
      {
        if (a2 >= 0xB)
        {
          if (a2 == 11)
          {
            return "tmfk";
          }
          else if (a2 >= 0xD)
          {
            if (a2 == 13)
            {
              return "tmfk";
            }
            else if (a2 >= 0xF)
            {
              if (a2 == 15)
              {
                return "tmfk";
              }
              else if (a2 >= 0x11)
              {
                return "tmfk";
              }
              else
              {
                return "tmfk";
              }
            }
            else
            {
              return "tmfk";
            }
          }
          else
          {
            return "tmfk";
          }
        }
        else
        {
          return "tmfk";
        }
      }
      else
      {
        return "tmfk";
      }
    case 1:
      v2 = "tmfk";
      v3 = "tmfk";
      if (a2 < 0xF)
        v3 = "tmfk";
      if (a2 != 13)
        v2 = v3;
      if (a2 >= 0xD)
        return v2;
      else
        return "tmfk";
    default:
      _CUILog();
      return 0;
  }
}

uint64_t CUIRenditionKeyIndexForAttribute(unsigned __int16 *a1, int a2)
{
  int v3;
  uint64_t result;
  unsigned __int16 *v6;
  int v7;
  BOOL v8;

  if (!a1)
    return 0xFFFFFFFFLL;
  v3 = *a1;
  if (!a1[1] && v3 == 0)
    return 0xFFFFFFFFLL;
  result = 0;
  v6 = a1 + 3;
  while (v3 != a2)
  {
    v7 = *v6;
    v3 = *(v6 - 1);
    result = (result + 1);
    v6 += 2;
    if (v7)
      v8 = 0;
    else
      v8 = v3 == 0;
    if (v8)
      return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t CUIRenditionKeyTokenCount(uint64_t a1)
{
  unsigned __int16 v1;

  v1 = 0;
  if (a1)
  {
    while (*(_WORD *)(a1 + 4 * v1 + 2) || *(_WORD *)(a1 + 4 * v1))
      ++v1;
  }
  return v1;
}

BOOL CUIRenditionKeyHasIdentifier(uint64_t a1, int a2)
{
  uint64_t v2;
  int *v3;
  uint64_t i;
  int v5;

  v2 = *(unsigned int *)(a1 + 8);
  if (!(_DWORD)v2)
    return 0;
  v3 = (int *)(a1 + 12);
  for (i = 0xFFFFFFFFLL; ; --i)
  {
    v5 = *v3++;
    if (v5 == a2)
      break;
    if (!--v2)
      return 0;
  }
  return i != 0;
}

uint64_t CUIRenditionKeyFormatRemoveAttribute(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(unsigned int *)(result + 8);
  if ((_DWORD)v2)
  {
    v3 = 0;
    while (*(_DWORD *)(result + 12 + 4 * v3) != a2)
    {
      if (v2 == ++v3)
        return result;
    }
    if ((int)v3 + 1 < v2)
    {
      do
      {
        *(_DWORD *)(result + 4 * v3 + 12) = *(_DWORD *)(result + 16 + 4 * v3);
        ++v3;
      }
      while ((_DWORD)v2 - 1 != (_DWORD)v3);
    }
    *(_DWORD *)(result + 8) = v2 - 1;
  }
  return result;
}

unsigned __int16 *CUIRenditionKeyValueForAttribute(unsigned __int16 *result, int a2)
{
  int v2;
  BOOL v3;
  int v4;
  unsigned __int16 *v5;
  int v6;
  BOOL v7;

  if (result)
  {
    v2 = *result;
    if (result[1])
      v3 = 0;
    else
      v3 = v2 == 0;
    if (v3)
      return 0;
    v4 = 0;
    v5 = result + 3;
    while (v2 != a2)
    {
      ++v4;
      v6 = *v5;
      v2 = *(v5 - 1);
      v5 += 2;
      if (v6)
        v7 = 0;
      else
        v7 = v2 == 0;
      if (v7)
        return 0;
    }
    if (v4 < 0)
      return 0;
    else
      return (unsigned __int16 *)result[2 * v4 + 1];
  }
  return result;
}

uint64_t CUIFillCARKeyArrayForRenditionKey2(uint64_t result, int *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int *v9;
  int v10;
  _OWORD v11[12];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!result || !a2)
    CUIFillCARKeyArrayForRenditionKey2_cold_1();
  v5 = a4;
  v6 = result;
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  if (!a4)
  {
    v5 = (uint64_t *)v11;
    result = CUIRenditionKeyInitializeAttributeIndexWithKeyFormat((uint64_t)v11, a3);
  }
  v7 = *a2;
  if (*a2)
  {
    v8 = *v5;
    v9 = a2 + 1;
    do
    {
      if ((v8 & (1 << v7)) != 0)
        *(_WORD *)(v6 + 2 * *((unsigned __int8 *)v5 + (unsigned __int16)v7 + 8)) = *((_WORD *)v9 - 1);
      v10 = *v9++;
      LOWORD(v7) = v10;
    }
    while (v10);
  }
  return result;
}

uint64_t CUIRenditionKeyInitializeAttributeIndexWithKeyFormat(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;

  *(_QWORD *)(result + 192) = 0;
  *(_OWORD *)(result + 160) = 0u;
  *(_OWORD *)(result + 176) = 0u;
  *(_OWORD *)(result + 128) = 0u;
  *(_OWORD *)(result + 144) = 0u;
  *(_OWORD *)(result + 96) = 0u;
  *(_OWORD *)(result + 112) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)result = 0u;
  *(_OWORD *)(result + 80) = 0u;
  v2 = *(_DWORD *)(a2 + 8);
  if (v2 >= 0x40)
    v2 = 64;
  if (v2)
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *(unsigned __int16 *)(a2 + 12 + 4 * v3);
      *(_BYTE *)(result + 8 + v6) = v3;
      if (v6 <= 0x1C)
        *(_DWORD *)(result + 80 + 4 * v5++) = v6;
      v4 |= 1 << v6;
      ++v3;
      LODWORD(v6) = *(_DWORD *)(a2 + 8);
      if (v6 >= 0x40)
        v6 = 64;
      else
        v6 = v6;
    }
    while (v3 < v6);
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  *(_DWORD *)(result + 76) = v5;
  *(_QWORD *)result = v4;
  return result;
}

uint64_t CUIFillCARKeyArrayForRenditionKey(uint64_t a1, int *a2, uint64_t a3)
{
  return CUIFillCARKeyArrayForRenditionKey2(a1, a2, a3, 0);
}

void CUIRenditionKeyStandardize(void *a1, unsigned __int16 *a2, uint64_t a3)
{
  unsigned int v6;
  _WORD *v7;
  _WORD *v8;
  uint64_t v9;
  int *v10;
  __int16 v11;
  int v12;
  unsigned int v13;
  _OWORD v14[6];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(v14, 0, 92);
  v6 = *(_DWORD *)(a3 + 8);
  if (v6 - 23 > 0xFFFFFFE7)
  {
    v7 = v14;
  }
  else
  {
    v7 = malloc_type_calloc(v6 + 3, 4uLL, 0x100004052888210uLL);
    v6 = *(_DWORD *)(a3 + 8);
  }
  v8 = v7;
  if (v6)
  {
    v9 = v6;
    v10 = (int *)(a3 + 12);
    v8 = v7;
    do
    {
      v12 = *v10++;
      v11 = v12;
      v13 = CUIRenditionKeyValueForAttribute(a2, (unsigned __int16)v12);
      if (v13)
      {
        *v8 = v11;
        v8[1] = v13;
        v8 += 2;
      }
      --v9;
    }
    while (v9);
  }
  *(_DWORD *)v8 = 0;
  CUIRenditionKeyCopy(a1, v7, (unsigned __int16)(*(_WORD *)(a3 + 8) + 1));
  if (v7 != (_WORD *)v14)
    free(v7);
}

void *CUIRenditionKeyCopy(void *a1, _WORD *a2, unsigned int a3)
{
  unsigned __int16 i;

  if (!a1 || !a2)
    CUIRenditionKeyCopy_cold_1();
  for (i = 0; a2[2 * i + 1] || a2[2 * i]; ++i)
    ;
  if (i >= a3)
    CUIRenditionKeyCopy_cold_2();
  return memmove(a1, a2, 4 * i + 4);
}

uint64_t CUICompareRenditionKey(unsigned __int16 *a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int16 *v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;

  v4 = *(unsigned int *)(a3 + 8);
  if (!(_DWORD)v4)
    return 0;
  v7 = (unsigned __int16 *)(a3 + 12);
  while (1)
  {
    v8 = *v7;
    v7 += 2;
    v9 = CUIRenditionKeyValueForAttribute(a1, v8);
    v10 = CUIRenditionKeyValueForAttribute(a2, v8);
    v11 = v9 > v10 ? 1 : v3;
    v3 = v9 < v10 ? -1 : v11;
    if (v9 != v10)
      break;
    if (!--v4)
      return 0;
  }
  return v3;
}

uint64_t _CUICopySortedKeySignature(char *__dst, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  char *v9;
  char *v10;
  unint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  _BOOL4 v25;
  _BOOL4 v26;
  _BYTE *v27;
  BOOL v28;

  result = -1;
  if (__dst && a2 >= 0x65)
  {
    v9 = stpncpy(__dst, "{", a2 - 1);
    v10 = (char *)(&__dst[a2] - v9);
    if (&__dst[a2] != v9 && (uint64_t)(a4 & 0xFFFFFFFFFFFFFFFELL) >= 1)
    {
      v11 = a3 + 2;
      do
      {
        v12 = *(unsigned __int16 *)(v11 - 2);
        v13 = (v12 >> 8) & 0xF;
        if (v12 >= 0xA000)
          v14 = 87;
        else
          v14 = 48;
        v15 = v14 + (v12 >> 12);
        if (v13 >= 0xA)
          v16 = 87;
        else
          v16 = 48;
        v17 = v16 + v13;
        v18 = v12 & 0xF;
        v19 = v12 >> 4;
        if (v19 >= 0xA)
          v20 = 87;
        else
          v20 = 48;
        v21 = v20 + v19;
        if (v18 >= 0xA)
          v22 = 87;
        else
          v22 = 48;
        v23 = v22 + v18;
        v25 = v15 == 48 && v17 == 48;
        v26 = v21 == 48 && v25;
        v27 = v9 + 1;
        if (v26 && v23 == 48)
        {
          *v9 = 48;
        }
        else if (v26)
        {
          *v9 = v23;
        }
        else if (v25)
        {
          *v9 = v21;
          v27 = v9 + 2;
          v9[1] = v23;
        }
        else if (v15 == 48)
        {
          v27 = v9 + 3;
          *v9 = v17;
          v9[1] = v21;
          v9[2] = v23;
        }
        else
        {
          *v9 = v15;
          v9[1] = v17;
          v9[2] = v21;
          v27 = v9 + 4;
          v9[3] = v23;
        }
        *v27 = 45;
        v9 = v27 + 1;
        v10 -= 5;
        if (!v10)
          break;
        v28 = v11 >= a3 + (a4 & 0xFFFFFFFFFFFFFFFELL);
        v11 += 2;
      }
      while (!v28);
    }
    if ((unint64_t)(v10 - 3) > 0xFFFFFFFFFFFFFFFDLL)
      v9 -= 2;
    else
      *(v9 - 1) = 125;
    *v9 = 0;
    return v9 - __dst;
  }
  return result;
}

uint64_t CUICopyKeySignatureWithPrefix(char *a1, unint64_t a2, int *a3, uint64_t a4, uint64_t *a5, unsigned int a6)
{
  size_t v12;
  _OWORD *v13;
  char *v14;
  unsigned int v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  char *v20;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char *v30;
  int v31;
  char v32;
  _OWORD v34[3];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a4)
    CUICopyKeySignatureWithPrefix_cold_1();
  memset(v34, 0, 44);
  v12 = *(unsigned int *)(a4 + 8);
  if (v12 < 0x16)
    v13 = v34;
  else
    v13 = malloc_type_calloc(v12, 2uLL, 0x1000040BDFB0063uLL);
  CUIFillCARKeyArrayForRenditionKey2((uint64_t)v13, a3, a4, a5);
  if (a2)
  {
    v14 = a1 + 1;
    do
    {
      v15 = a6;
      v16 = v14;
      a6 /= 0xAu;
      *(v14 - 1) = (v15 - 10 * a6) | 0x30;
      if (v15 < 0xA)
        break;
      ++v14;
      --a2;
    }
    while (a2);
  }
  else
  {
    v16 = a1;
  }
  v17 = v16 - a1;
  if ((unint64_t)(v16 - a1) >= 2)
  {
    v18 = 0;
    do
    {
      v19 = a1[v18];
      v20 = (char *)(v17 - (v18 + 1));
      a1[v18] = v20[(_QWORD)a1];
      v20[(_QWORD)a1] = v19;
    }
    while (v17 >> 1 > ++v18);
  }
  v22 = _CUICopySortedKeySignature(v16, a2, (uint64_t)v13, 2 * *(unsigned int *)(a4 + 8));
  if (v22 < 0)
  {
    if (v13 != v34)
      free(v13);
    return -1;
  }
  v23 = v22;
  if (v13 != v34)
    free(v13);
  if (a2 - v23 < 0x11)
    return -1;
  if (v23 < 0x61)
    return v23;
  v24 = 0;
  v25 = 0;
  while (HIWORD(a3[v24]))
  {
    v26 = LOWORD(a3[v24]);
    if (a5 && (*a5 & (1 << v26)) != 0)
    {
      LODWORD(v27) = *((unsigned __int8 *)a5 + LOWORD(a3[v24]) + 8);
LABEL_24:
      v28 = 4 * v24 + 16;
      if (v27 < 4)
        v28 = 8 * v24;
      if (v27 <= 0xB)
        v25 ^= (unint64_t)HIWORD(a3[v24]) << v28;
      goto LABEL_33;
    }
    v29 = *(unsigned int *)(a4 + 8);
    if ((_DWORD)v29)
    {
      v27 = 0;
      while (*(_DWORD *)(a4 + 12 + 4 * v27) != v26)
      {
        if (v29 == ++v27)
          goto LABEL_33;
      }
      goto LABEL_24;
    }
LABEL_33:
    if (++v24 == 21)
      break;
  }
  v23 += 16;
  v30 = &v16[v23];
  v16[v23] = 0;
  v31 = 16;
  do
  {
    if (v25)
    {
      if ((v25 & 0xF) >= 0xA)
        v32 = (v25 & 0xF) + 87;
      else
        v32 = v25 & 0xF | 0x30;
      *--v30 = v32;
      v25 >>= 4;
    }
    else
    {
      *--v30 = 48;
    }
    --v31;
  }
  while (v31);
  return v23;
}

uint64_t CUICopyKeySignature(char *a1, unint64_t a2, int *a3, uint64_t a4, uint64_t *a5)
{
  return CUICopyKeySignatureWithPrefix(a1, a2, a3, a4, a5, 0);
}

uint64_t CUIMaxScaleForTargetPlatform(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 2)
    return 2;
  else
    return 3;
}

uint64_t CUIMinScaleForTargetPlatform(uint64_t a1)
{
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 4)
    return 2;
  else
    return 1;
}

double CUIPointSizeForDimensionForVectorGlyph(uint64_t a1, unsigned int a2)
{
  char *v2;
  char *v3;
  char *v4;

  v2 = (char *)&__VectorGlyphDimension2ToPointSizeTableEmbedded + 8 * a2;
  v3 = (char *)&__VectorGlyphDimension2ToPointSizeTableWatch + 8 * a2;
  v4 = (char *)&__VectorGlyphDimension2ToPointSizeTableForMac + 8 * a2;
  if (a1)
    v4 = (char *)&__VectorGlyphDimension2ToPointSizeTableEmbedded + 8 * a2;
  if (a1 != 4)
    v3 = v4;
  if (a1 != 5)
    v2 = v3;
  return *(double *)v2;
}

uint64_t CUIMinDimensionForVectorGlyph()
{
  return 0;
}

uint64_t CUIMaxDimensionForVectorGlyph(uint64_t a1)
{
  if (a1 == 4)
    return 1;
  else
    return 3;
}

uint64_t CUIPreferredVectorGlyphConfigurationsForPlatform(unint64_t a1)
{
  if (a1 < 6)
    return (uint64_t)*(&off_1E9768BD8 + a1);
  _CUILog();
  return 0;
}

const __CFString *CUIPlatformNameForPlatform(uint64_t a1)
{
  const __CFString *result;

  switch(a1)
  {
    case 0:
      result = kCUIPlatformMac[0];
      break;
    case 1:
      result = (const __CFString *)kCUIPlatformiOS;
      break;
    case 2:
      result = (const __CFString *)kCUIPlatformMaciOS;
      break;
    case 3:
      result = (const __CFString *)kCUIPlatformAppleTV;
      break;
    case 4:
      result = kCUIPlatformWatch[0];
      break;
    case 5:
      result = (const __CFString *)kCUIPlatformVision;
      break;
    default:
      result = &stru_1E97698A0;
      break;
  }
  return result;
}

uint64_t CUIPlatformForPlatformString(void *a1)
{
  if ((objc_msgSend(a1, "isEqualToString:", kCUIPlatformMac[0]) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("osx")) & 1) != 0)
  {
    return 0;
  }
  if ((objc_msgSend(a1, "isEqualToString:", kCUIPlatformMaciOS) & 1) != 0)
    return 2;
  if ((objc_msgSend(a1, "isEqualToString:", kCUIPlatformiOS) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("iphoneos")) & 1) != 0)
  {
    return 1;
  }
  if ((objc_msgSend(a1, "isEqualToString:", kCUIPlatformAppleTV) & 1) != 0)
    return 3;
  if ((objc_msgSend(a1, "isEqualToString:", kCUIPlatformWatch[0]) & 1) != 0)
    return 4;
  if ((objc_msgSend(a1, "isEqualToString:", kCUIPlatformVision) & 1) != 0)
    return 5;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("xros")))
    return 5;
  return -1;
}

uint64_t CUICurrentDeploymentVersionForTargetPlatform()
{
  return 11;
}

uint64_t CUICurrentPlatform()
{
  return 1;
}

uint64_t CUIRenditionKeyTokenIsBaseKeyOfKeyList(uint64_t a1, unsigned __int16 *a2)
{
  unsigned __int16 v3;
  unsigned __int16 v4;
  uint64_t v6;
  _WORD *i;
  int v8;

  v3 = 0;
  if (a1)
  {
    while (*(_WORD *)(a1 + 4 * v3 + 2) || *(_WORD *)(a1 + 4 * v3))
      ++v3;
  }
  v4 = 0;
  if (a2)
  {
    while (a2[2 * v4 + 1] || a2[2 * v4])
      ++v4;
  }
  if (v4 < v3)
    return 0;
  if (v3)
  {
    v6 = v3;
    for (i = (_WORD *)(a1 + 2); ; i += 2)
    {
      if (*i)
      {
        v8 = (unsigned __int16)*i;
        if (v8 != CUIRenditionKeyValueForAttribute(a2, (unsigned __int16)*(i - 1)))
          break;
      }
      if (!--v6)
        return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t CUICGBlendModeFromLSRDescription(void *a1)
{
  uint64_t result;
  const char *v2;
  uint64_t v3;

  result = objc_msgSend(a1, "UTF8String");
  if (result)
  {
    v2 = (const char *)result;
    v3 = 0;
    while (strcasecmp((const char *)gCGBlendModeDescriptions[v3 + 1], v2))
    {
      v3 += 3;
      if (v3 == 84)
        return 0;
    }
    return LODWORD(gCGBlendModeDescriptions[v3]);
  }
  return result;
}

const __CFString *CUIBlendModeLSRDescriptionFromCGBlendMode(int a1)
{
  uint64_t v1;

  v1 = 0;
  while (gCGBlendModeDescriptions[v1] != a1)
  {
    v1 += 3;
    if (v1 == 84)
      return CFSTR("normal");
  }
  return (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", gCGBlendModeDescriptions[v1 + 1]);
}

const __CFString *CUIBlendModeDescriptionFromCGBlendMode(int a1)
{
  uint64_t v1;

  v1 = 0;
  while (gCGBlendModeDescriptions[v1] != a1)
  {
    v1 += 3;
    if (v1 == 84)
      return CFSTR("Normal");
  }
  return (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", gCGBlendModeDescriptions[v1 + 2]);
}

const char *CUIThemeAttributeNameToString(int a1)
{
  if ((a1 - 1) > 0x1B)
    return "UNKNOWN";
  else
    return off_1E9768C08[a1 - 1];
}

void *CUIKeyFormatToArrayString(uint64_t a1)
{
  void *v2;
  int v3;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (*(_DWORD *)(a1 + 8))
  {
    v3 = 0;
    do
      objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CUIThemeAttributeNameToString(*(_DWORD *)(a1 + 4 * (unsigned __int16)v3++ + 12))));
    while (*(_DWORD *)(a1 + 8) > (unsigned __int16)v3);
  }
  return v2;
}

void sub_1D4126AE0()
{
  objc_end_catch();
  JUMPOUT(0x1D4126AE8);
}

unsigned __int16 *_CUIRenditionKeySetIntegerValueForAttribute(unsigned __int16 *a1, __int16 a2, unint64_t a3)
{
  if (a3 >> 16)
    _CUIRenditionKeySetIntegerValueForAttribute_cold_1(a2);
  return CUIRenditionKeySetValueForAttribute(a1, a2, (unsigned __int16)a3, 0x16u);
}

_DWORD *CUIBitVectorCreate(unsigned int a1)
{
  int v1;
  unsigned int v2;
  _DWORD *v3;

  if (a1 <= 1)
    v1 = 1;
  else
    v1 = a1;
  v2 = ((v1 - 1) >> 5) + 1;
  v3 = malloc_type_malloc(4 * v2 + 8, 0x7EDDED84uLL);
  bzero(v3, 4 * v2 + 8);
  __CFSetLastAllocationEventName();
  *v3 = 0;
  v3[1] = v2;
  return v3;
}

void *CUIBitVectorCopy(unsigned int *a1)
{
  uint64_t v2;
  _DWORD *v3;

  v2 = a1[1];
  v3 = malloc_type_malloc(4 * v2 + 8, 0x7EDDED84uLL);
  bzero(v3, 4 * v2 + 8);
  __CFSetLastAllocationEventName();
  *v3 = 0;
  v3[1] = v2;
  return memcpy(v3, a1, 4 * a1[1] + 8);
}

void CUIBitVectorDestroy(os_unfair_lock_s *a1)
{
  if (a1)
  {
    os_unfair_lock_lock(a1);
    free(a1);
  }
}

uint64_t CUIBitVectorSetBit(os_unfair_lock_s *a1, unsigned int a2)
{
  uint64_t v4;

  os_unfair_lock_lock(a1);
  if (a2 >> 5 >= a1[1]._os_unfair_lock_opaque)
  {
    v4 = 0xFFFFFFFFLL;
  }
  else
  {
    v4 = 1;
    a1[(a2 >> 5) + 2]._os_unfair_lock_opaque |= 1 << a2;
  }
  os_unfair_lock_unlock(a1);
  return v4;
}

uint64_t CUIBitVectorUnSetBit(os_unfair_lock_s *a1, unsigned int a2)
{
  uint64_t v4;

  os_unfair_lock_lock(a1);
  if (a2 >> 5 >= a1[1]._os_unfair_lock_opaque)
  {
    v4 = 0xFFFFFFFFLL;
  }
  else
  {
    v4 = 1;
    a1[(a2 >> 5) + 2]._os_unfair_lock_opaque &= ~(1 << a2);
  }
  os_unfair_lock_unlock(a1);
  return v4;
}

uint64_t CUIBitVectorIsBitSet(os_unfair_lock_s *a1, unsigned int a2)
{
  uint64_t v4;

  os_unfair_lock_lock(a1);
  if (a2 >> 5 >= a1[1]._os_unfair_lock_opaque)
    v4 = 0xFFFFFFFFLL;
  else
    v4 = (a1[(a2 >> 5) + 2]._os_unfair_lock_opaque >> a2) & 1;
  os_unfair_lock_unlock(a1);
  return v4;
}

uint64_t CUIBitVectorNumberOfBitsSet(os_unfair_lock_s *a1)
{
  uint64_t os_unfair_lock_opaque;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint32_t v5;
  uint8x8_t v6;

  os_unfair_lock_lock(a1);
  os_unfair_lock_opaque = a1[1]._os_unfair_lock_opaque;
  if ((_DWORD)os_unfair_lock_opaque)
  {
    LODWORD(v3) = 0;
    v4 = a1 + 2;
    do
    {
      v5 = v4->_os_unfair_lock_opaque;
      ++v4;
      v6 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
      v6.i16[0] = vaddlv_u8(v6);
      v3 = (v6.i32[0] + v3);
      --os_unfair_lock_opaque;
    }
    while (os_unfair_lock_opaque);
  }
  else
  {
    v3 = 0;
  }
  os_unfair_lock_unlock(a1);
  return v3;
}

uint64_t CUIBitVectorNumberOfBitsSetInBucket(uint64_t a1, unsigned int a2)
{
  uint8x8_t v2;

  v2 = (uint8x8_t)vcnt_s8((int8x8_t)*(unsigned int *)(a1 + 4 * (a2 >> 5) + 8));
  v2.i16[0] = vaddlv_u8(v2);
  return v2.u32[0];
}

uint64_t CUIBitVectorBucketValue(os_unfair_lock_s *a1, unsigned int a2)
{
  uint64_t os_unfair_lock_opaque;

  os_unfair_lock_lock(a1);
  os_unfair_lock_opaque = a1[(a2 >> 5) + 2]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(a1);
  return os_unfair_lock_opaque;
}

uint64_t CUIBitVectorSetBitRange(os_unfair_lock_s *a1, unsigned int a2, unsigned int a3)
{
  uint32_t os_unfair_lock_opaque;

  os_unfair_lock_lock(a1);
  if (a2 >= a3)
  {
LABEL_5:
    os_unfair_lock_unlock(a1);
    return 1;
  }
  else
  {
    os_unfair_lock_opaque = a1[1]._os_unfair_lock_opaque;
    while (a2 >> 5 < os_unfair_lock_opaque)
    {
      a1[(a2 >> 5) + 2]._os_unfair_lock_opaque |= 1 << a2;
      if (a3 == ++a2)
        goto LABEL_5;
    }
    os_unfair_lock_unlock(a1);
    return 0xFFFFFFFFLL;
  }
}

_DWORD *CUIBitVectorBitAnd(os_unfair_lock_s *a1, os_unfair_lock_s *a2)
{
  uint64_t os_unfair_lock_opaque;
  _DWORD *v5;
  uint64_t v6;
  unint64_t v7;

  os_unfair_lock_lock(a1);
  os_unfair_lock_lock(a2);
  os_unfair_lock_opaque = a1[1]._os_unfair_lock_opaque;
  if ((_DWORD)os_unfair_lock_opaque == a2[1]._os_unfair_lock_opaque)
  {
    v5 = malloc_type_malloc(4 * os_unfair_lock_opaque + 8, 0x7EDDED84uLL);
    bzero(v5, 4 * os_unfair_lock_opaque + 8);
    __CFSetLastAllocationEventName();
    *v5 = 0;
    v5[1] = os_unfair_lock_opaque;
    if (a1[1]._os_unfair_lock_opaque)
    {
      v6 = 2;
      do
      {
        v5[v6] = a2[v6]._os_unfair_lock_opaque & a1[v6]._os_unfair_lock_opaque;
        v7 = v6++ - 1;
      }
      while (v7 < a1[1]._os_unfair_lock_opaque);
    }
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(a2);
  os_unfair_lock_unlock(a1);
  return v5;
}

_DWORD *CUIBitVectorBitOrForBucket(os_unfair_lock_s *a1, os_unfair_lock_s *a2, int a3)
{
  uint64_t os_unfair_lock_opaque;
  _DWORD *v7;
  unint64_t v8;
  int v9;

  os_unfair_lock_lock(a1);
  os_unfair_lock_lock(a2);
  os_unfair_lock_opaque = a1[1]._os_unfair_lock_opaque;
  if ((_DWORD)os_unfair_lock_opaque == a2[1]._os_unfair_lock_opaque)
  {
    v7 = malloc_type_malloc(4 * os_unfair_lock_opaque + 8, 0x7EDDED84uLL);
    bzero(v7, 4 * os_unfair_lock_opaque + 8);
    __CFSetLastAllocationEventName();
    *v7 = 0;
    v7[1] = os_unfair_lock_opaque;
    if (a1[1]._os_unfair_lock_opaque)
    {
      v8 = 0;
      do
      {
        if (a3 == v8)
          v9 = a2[a3 + 2]._os_unfair_lock_opaque | a1[a3 + 2]._os_unfair_lock_opaque;
        else
          v9 = a1[v8 + 2]._os_unfair_lock_opaque;
        v7[v8++ + 2] = v9;
      }
      while (v8 < a1[1]._os_unfair_lock_opaque);
    }
    os_unfair_lock_unlock(a2);
  }
  else
  {
    os_unfair_lock_unlock(a2);
    v7 = 0;
  }
  os_unfair_lock_unlock(a1);
  return v7;
}

_DWORD *CUIBitVectorToData(os_unfair_lock_s *a1, size_t *a2)
{
  size_t v4;
  _DWORD *v5;
  _DWORD *v6;
  unint64_t v7;

  os_unfair_lock_lock(a1);
  v4 = 4 * a1[1]._os_unfair_lock_opaque + 4;
  *a2 = v4;
  v5 = malloc_type_malloc(v4, 0x46EEF169uLL);
  v6 = v5;
  *v5 = a1[1]._os_unfair_lock_opaque;
  if (a1[1]._os_unfair_lock_opaque)
  {
    v7 = 0;
    do
    {
      v5[v7 + 1] = a1[v7 + 2]._os_unfair_lock_opaque;
      ++v7;
    }
    while (v7 < a1[1]._os_unfair_lock_opaque);
  }
  __CFSetLastAllocationEventName();
  os_unfair_lock_unlock(a1);
  return v6;
}

_DWORD *CUIBitVectorFromData(unsigned int *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v5;
  unint64_t v6;

  v2 = *a1;
  v3 = 4 * v2;
  if (4 * v2 + 4 != a2)
    return 0;
  v5 = malloc_type_malloc(v3 + 8, 0x7EDDED84uLL);
  bzero(v5, v3 + 8);
  __CFSetLastAllocationEventName();
  *v5 = 0;
  v5[1] = v2;
  if ((_DWORD)v2)
  {
    v6 = 0;
    do
    {
      v5[v6 / 4 + 2] = a1[v6 / 4 + 1];
      v6 += 4;
    }
    while (v3 != v6);
  }
  return v5;
}

BOOL CUIBitVectorEqual(os_unfair_lock_s *a1, os_unfair_lock_s *a2)
{
  uint64_t os_unfair_lock_opaque;
  uint64_t v5;
  os_unfair_lock_s *v6;
  os_unfair_lock_s *v7;
  uint32_t v8;
  uint32_t v9;
  uint32_t v10;
  uint32_t v11;
  BOOL v13;
  _BOOL8 v14;

  os_unfair_lock_lock(a1);
  os_unfair_lock_lock(a2);
  os_unfair_lock_opaque = a1[1]._os_unfair_lock_opaque;
  if ((_DWORD)os_unfair_lock_opaque == a2[1]._os_unfair_lock_opaque)
  {
    if ((_DWORD)os_unfair_lock_opaque)
    {
      v5 = os_unfair_lock_opaque - 1;
      v6 = a1 + 2;
      v7 = a2 + 2;
      do
      {
        v9 = v6->_os_unfair_lock_opaque;
        ++v6;
        v8 = v9;
        v11 = v7->_os_unfair_lock_opaque;
        ++v7;
        v10 = v11;
        v13 = v5-- != 0;
        v14 = v8 == v10;
      }
      while (v8 == v10 && v13);
    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }
  os_unfair_lock_unlock(a2);
  os_unfair_lock_unlock(a1);
  return v14;
}

_BYTE *CUIBitVectorToString(os_unfair_lock_s *a1)
{
  int v2;
  _BYTE *v3;
  signed int os_unfair_lock_opaque;
  unint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char v12;

  os_unfair_lock_lock(a1);
  v2 = (34 * a1[1]._os_unfair_lock_opaque) | 1;
  v3 = malloc_type_calloc((2 * a1[1]._os_unfair_lock_opaque + 32 * a1[1]._os_unfair_lock_opaque) | 1, 1uLL, 0x100004077774924uLL);
  os_unfair_lock_opaque = a1[1]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = 0;
      v8 = v6;
      v3[v6] = 91;
      v9 = (v6 + 1);
      v10 = &v3[(int)v9];
      v11 = v9 << 32;
      do
      {
        if (((a1[v5 + 2]._os_unfair_lock_opaque >> v7) & 1) != 0)
          v12 = 49;
        else
          v12 = 48;
        v10[v7++] = v12;
        v11 += 0x100000000;
      }
      while ((_DWORD)v7 != 32);
      v6 += 34;
      v3[v11 >> 32] = 93;
      ++v5;
    }
    while (v5 < a1[1]._os_unfair_lock_opaque);
    os_unfair_lock_opaque = v8 + 34;
  }
  if (os_unfair_lock_opaque >= v2)
    CUIBitVectorToString_cold_1();
  __CFSetLastAllocationEventName();
  os_unfair_lock_unlock(a1);
  return v3;
}

uint64_t CUIGeneratePlaceholderAssetCatalog(void *a1, void *a2, void *a3, uint64_t *a4)
{
  uint64_t result;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  result = objc_msgSend(a3, "count");
  if (result)
  {
    result = preserveAssetsNamed(objc_msgSend((id)objc_msgSend(a3, "componentsJoinedByString:", CFSTR(",")), "UTF8String"), 916.0, 0, (const char *)objc_msgSend(a1, "fileSystemRepresentation"), (const char *)objc_msgSend(a2, "fileSystemRepresentation"));
    if ((_DWORD)result != 1)
    {
      if (!a4)
        return 0;
      if ((_DWORD)result == -2)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = *MEMORY[0x1E0CB2FE0];
        v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("ERROR inputfile not a valid Asset catalog"), *MEMORY[0x1E0CB2D68], 0);
        v12 = v15;
        v13 = v16;
        v14 = 5;
      }
      else if ((_DWORD)result == -1)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0CB2FE0];
        v19 = *__error();
        v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("ERROR copying input to output"), *MEMORY[0x1E0CB2D68], 0);
        v12 = v17;
        v13 = v18;
        v14 = v19;
      }
      else
      {
        if ((_DWORD)result)
        {
          v20 = 0;
          goto LABEL_13;
        }
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = *MEMORY[0x1E0CB2FE0];
        v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Passed Invalid namesToPreserve"), *MEMORY[0x1E0CB2D68], 0);
        v12 = v9;
        v13 = v10;
        v14 = 45;
      }
      v20 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v11);
LABEL_13:
      result = 0;
      *a4 = v20;
    }
  }
  return result;
}

uint64_t parseIdiom(const char *a1)
{
  uint64_t result;
  const char *v3;
  _QWORD *v4;

  result = strcasecmp(a1, "universal");
  if ((_DWORD)result)
  {
    if (!strcasecmp(a1, "reality"))
    {
      return 8;
    }
    else
    {
      v3 = *(const char **)(MEMORY[0x1E0D1A720] + 16);
      if (v3)
      {
        v4 = (_QWORD *)MEMORY[0x1E0D1A720];
        while (strcasecmp(a1, v3))
        {
          v3 = (const char *)v4[5];
          v4 += 3;
          if (!v3)
            return 0xFFFFFFFFLL;
        }
        return *(unsigned int *)v4;
      }
      else
      {
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

char *getIdiomListUsage()
{
  uint64_t v0;
  const char *v1;
  uint64_t v2;

  getIdiomListUsage_idiomListUsage = 0;
  v0 = MEMORY[0x1E0D1A720];
  v1 = *(const char **)(MEMORY[0x1E0D1A720] + 16);
  if (v1)
  {
    v2 = 0;
    do
    {
      while (strcasecmp(v1, "universal"))
      {
        __strcat_chk();
        ++v2;
        v1 = *(const char **)(v0 + 24 * v2 + 16);
        if (!v1)
          return &getIdiomListUsage_idiomListUsage;
        __strcat_chk();
      }
      ++v2;
      v1 = *(const char **)(v0 + 24 * v2 + 16);
    }
    while (v1);
  }
  return &getIdiomListUsage_idiomListUsage;
}

char *getIdiomUsage()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  getIdiomUsage_idiomUsage = 0;
  v0 = MEMORY[0x1E0D1A720];
  if (*(_QWORD *)(MEMORY[0x1E0D1A720] + 16))
  {
    __strcat_chk();
    if (*(_QWORD *)(v0 + 40))
    {
      v1 = (uint64_t *)(v0 + 64);
      do
      {
        __strcat_chk();
        __strcat_chk();
        v2 = *v1;
        v1 += 3;
      }
      while (v2);
    }
  }
  return &getIdiomUsage_idiomUsage;
}

const char *getDisplayGamutUsage()
{
  return "srgb/p3/all";
}

uint64_t getDeploymentTargetUsage()
{
  uint64_t v0;
  _QWORD block[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v6 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __getDeploymentTargetUsage_block_invoke;
  block[3] = &unk_1E9769218;
  block[4] = &v3;
  if (getDeploymentTargetUsage_onceToken != -1)
    dispatch_once(&getDeploymentTargetUsage_onceToken, block);
  v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

void __getDeploymentTargetUsage_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 6);
  if (*(_QWORD *)(MEMORY[0x1E0D1A700] + 16))
  {
    v2 = (uint64_t *)(MEMORY[0x1E0D1A700] + 40);
    do
    {
      objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:"));
      v3 = *v2;
      v2 += 3;
    }
    while (v3);
  }
  v4 = objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("9.0,10.0,11.0,12.0,12.2,13.0,14.0,15.0 (or %@). 'any' means targeting 2015 or earlier)"), v4), "UTF8String");

}

void *getGraphicsClassUsage()
{
  if (getGraphicsClassUsage_onceToken != -1)
    dispatch_once(&getGraphicsClassUsage_onceToken, &__block_literal_global_14);
  return &getGraphicsClassUsage_graphicsClassUsage;
}

size_t __getGraphicsClassUsage_block_invoke()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  size_t result;

  if (*(_QWORD *)(MEMORY[0x1E0D1A718] + 16))
  {
    v0 = (uint64_t *)(MEMORY[0x1E0D1A718] + 40);
    do
    {
      __strncat_chk();
      __strncat_chk();
      v1 = *v0;
      v0 += 3;
    }
    while (v1);
  }
  __strncat_chk();
  if (*(_QWORD *)(MEMORY[0x1E0D1A710] + 16))
  {
    v2 = (uint64_t *)(MEMORY[0x1E0D1A710] + 40);
    do
    {
      __strncat_chk();
      __strncat_chk();
      v3 = *v2;
      v2 += 3;
    }
    while (v3);
  }
  result = strlen(getGraphicsClassUsage_graphicsClassUsage);
  getGraphicsClassUsage_graphicsClassUsage[result - 1] = 0;
  return result;
}

uint64_t parseDisplayGamut(const char *a1)
{
  const char *v2;
  _QWORD *v3;

  if (!strcasecmp(a1, "all"))
    return 10;
  v2 = *(const char **)(MEMORY[0x1E0D1A708] + 16);
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = (_QWORD *)MEMORY[0x1E0D1A708];
  while (strcasecmp(a1, v2))
  {
    v2 = (const char *)v3[5];
    v3 += 3;
    if (!v2)
      return 0xFFFFFFFFLL;
  }
  return *(unsigned int *)v3;
}

id parseIdiomList(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D825804C]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a1);
  v4 = (void *)objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = parseIdiom((const char *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet")), "UTF8String"));
        if ((int)v10 < 1)
        {

          objc_autoreleasePoolPop(v2);
          return 0;
        }
        v11 = v10;
        if (!v7)
          v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
  objc_autoreleasePoolPop(v2);
  return v7;
}

uint64_t parseGraphicsFeatureSetClass(char *a1)
{
  const char *v2;
  _QWORD *v3;
  const char *v4;

  v2 = *(const char **)(MEMORY[0x1E0D1A718] + 16);
  if (v2)
  {
    v3 = (_QWORD *)MEMORY[0x1E0D1A718];
    while (strcasecmp(a1, v2))
    {
      v2 = (const char *)v3[5];
      v3 += 3;
      if (!v2)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v4 = *(const char **)(MEMORY[0x1E0D1A710] + 16);
    if (!v4)
      return 0xFFFFFFFFLL;
    v3 = (_QWORD *)MEMORY[0x1E0D1A710];
    while (strcasecmp(a1, v4))
    {
      v4 = (const char *)v3[5];
      v3 += 3;
      if (!v4)
        return 0xFFFFFFFFLL;
    }
  }
  return *(unsigned int *)v3;
}

id parseGraphicsFallBacks(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D825804C]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a1);
  v4 = (void *)objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = parseGraphicsFeatureSetClass((char *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet")), "UTF8String"));
        if ((v10 & 0x80000000) != 0)
        {

          objc_autoreleasePoolPop(v2);
          return 0;
        }
        v11 = v10;
        if (!v7)
          v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
  objc_autoreleasePoolPop(v2);
  return v7;
}

id parseSubtypeFallBacks(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D825804C]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a1);
  v4 = (void *)objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet")), "integerValue");
        if ((v10 & 0x80000000) != 0)
        {
LABEL_17:

          objc_autoreleasePoolPop(v2);
          return 0;
        }
        if (!v7)
          v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
        if (objc_msgSend(v7, "count"))
        {
          if ((int)objc_msgSend((id)objc_msgSend(v7, "lastObject"), "intValue") < (int)v10)
            goto LABEL_17;
        }
        else if (objc_msgSend(v7, "count") == 1
               && objc_msgSend((id)objc_msgSend(v7, "lastObject"), "intValue"))
        {
          goto LABEL_17;
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
  objc_autoreleasePoolPop(v2);
  return v7;
}

uint64_t processIdiom()
{
  return 1;
}

void resetComparisonResultsToString()
{
  __comparisonResultString = 0;
}

char *lastComparisonResult()
{
  return &__comparisonResultString;
}

uint64_t compareThinningParameters()
{
  return 0;
}

uint64_t compareThinningParametersInBatch()
{
  return 0;
}

uint64_t firstIntegerValue(void *a1)
{
  if (objc_msgSend(a1, "count"))
    return objc_msgSend((id)objc_msgSend(a1, "firstObject"), "intValue");
  else
    return 0xFFFFFFFFLL;
}

uint64_t preserveAssetsNamed(uint64_t a1, double a2, uint64_t a3, const char *a4, const char *a5)
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _copyfile_state *v15;
  int v16;
  CUIPlaceholderCUICarUtilAssetStorage *v17;
  CUIPlaceholderCUICarUtilAssetStorage *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v25;
  _QWORD v26[9];

  v9 = (void *)MEMORY[0x1D825804C]();
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1), "componentsSeparatedByString:", CFSTR(",")));
  if (!objc_msgSend(v10, "count"))
  {
    v14 = 0;
LABEL_16:
    objc_autoreleasePoolPop(v9);
    return v14;
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = objc_msgSend(v11, "stringWithFileSystemRepresentation:length:", a4, strlen(a4));
  if (*a5)
    v13 = (void *)objc_msgSend(v11, "stringWithFileSystemRepresentation:length:", a5, strlen(a5));
  else
    v13 = 0;
  if (objc_msgSend(v13, "length"))
  {
    v15 = copyfile_state_alloc();
    v16 = copyfile(a4, a5, v15, 0x20000Fu);
    copyfile_state_free(v15);
    v12 = (uint64_t)v13;
    if (v16 < 0)
    {
      v14 = 0xFFFFFFFFLL;
      goto LABEL_16;
    }
  }
  v17 = -[CUIPlaceholderCUICarUtilAssetStorage initWithPath:forWriting:]([CUIPlaceholderCUICarUtilAssetStorage alloc], "initWithPath:forWriting:", v12, 1);
  if (!v17)
  {
    if (objc_msgSend(v13, "length"))
      unlink(a5);
    v14 = 4294967294;
    goto LABEL_16;
  }
  v18 = v17;
  -[CUIPlaceholderCUIMutableCommonAssetStorage setUseBitmapIndex:](v17, "setUseBitmapIndex:", 1);
  v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v20 = -[CUIPlaceholderCUICommonAssetStorage keyFormat](v18, "keyFormat");
  v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __preserveAssetsNamed_block_invoke;
  v26[3] = &unk_1E9769268;
  v26[7] = v19;
  v26[8] = v20;
  v26[4] = v18;
  v26[5] = v21;
  v26[6] = v10;
  -[CUIPlaceholderCUICommonAssetStorage enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v26);
  if (objc_msgSend(v19, "count"))
  {
    v22 = -[CUIPlaceholderCUICommonAssetStorage thinningArguments](v18, "thinningArguments");
    if (objc_msgSend(v22, "length"))
      v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ [carutil %f preserve name '%s']"), v22, *(_QWORD *)&a2, a1);
    else
      v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[carutil %f preserve name '%s']"), *(_QWORD *)&a2, a1, v25);
    __removeUnwantedAssets(v18, v19, v21, v23);
  }

  objc_autoreleasePoolPop(v9);
  return 1;
}

void __preserveAssetsNamed_block_invoke(uint64_t a1, unsigned __int16 *a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  id *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t KeyTokenToData;
  void *v12;
  _QWORD v13[5];

  v4 = objc_msgSend(*(id *)(a1 + 32), "renditionNameForKeyBaseList:", a2);
  v5 = CUIRenditionKeyValueForAttribute(a2, 1);
  KeyTokenToData = __createKeyTokenToData((int *)a2, *(_QWORD *)(a1 + 64));
  v6 = CUIRenditionKeyValueForAttribute(a2, 17);
  if (v5 == 9 && !v6)
  {
    v7 = (id *)(a1 + 40);
    v8 = (void *)KeyTokenToData;
LABEL_6:
    objc_msgSend(*v7, "addObject:", v8, KeyTokenToData);
    v8 = v12;
    goto LABEL_7;
  }
  v9 = *(void **)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __preserveAssetsNamed_block_invoke_2;
  v13[3] = &unk_1E9769240;
  v13[4] = v4;
  v10 = objc_msgSend((id)objc_msgSend(v9, "objectsPassingTest:", v13, KeyTokenToData), "count");
  v8 = (void *)KeyTokenToData;
  if (!v10)
  {
    v7 = (id *)(a1 + 56);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __createKeyTokenToData(int *a1, uint64_t a2)
{
  void *v4;

  v4 = malloc_type_calloc(*(unsigned int *)(a2 + 8), 2uLL, 0x1000040BDFB0063uLL);
  CUIFillCARKeyArrayForRenditionKey((uint64_t)v4, a1, a2);
  return objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v4, 2 * *(unsigned int *)(a2 + 8), 1);
}

uint64_t __preserveAssetsNamed_block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2);
  if ((_DWORD)result)
    *a3 = 1;
  return result;
}

void __removeUnwantedAssets(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[7];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v8 = objc_msgSend(a1, "keyFormat");
  v9 = objc_msgSend(a3, "mutableCopy");
  v18[5] = v9;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = ____removeUnwantedAssets_block_invoke;
  v16[3] = &unk_1E97692B8;
  v16[4] = a1;
  v16[5] = &v23;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v16);
  if (objc_msgSend((id)v18[5], "count"))
  {
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = ____removeUnwantedAssets_block_invoke_2;
    v15[3] = &unk_1E97692E0;
    v15[4] = a1;
    v15[5] = &v17;
    v15[6] = v8;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v15);
    v11 = (void *)v18[5];
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = ____removeUnwantedAssets_block_invoke_3;
    v14[3] = &unk_1E97692B8;
    v14[4] = a1;
    v14[5] = &v23;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);
  }
  v12 = *((unsigned int *)v24 + 6);
  if ((_DWORD)v12)
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <removed %d>"), a4, v12);
  else
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <removed none>"), a4);
  objc_msgSend(a1, "setThinningArguments:", v13);
  objc_msgSend(a1, "updateBitmapInfo");
  objc_msgSend(a1, "writeToDiskAndCompact:", 1);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

void sub_1D4129E10(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t deleteAssetsNamed(uint64_t a1, double a2, uint64_t a3, const char *a4, const char *a5)
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _copyfile_state *v14;
  CUIPlaceholderCUICarUtilAssetStorage *v15;
  CUIPlaceholderCUICarUtilAssetStorage *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  FILE *v22;
  int *v23;
  char *v24;
  uint64_t v26;
  _QWORD v27[9];

  v9 = (void *)MEMORY[0x1D825804C]();
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1), "componentsSeparatedByString:", CFSTR(",")));
  if (!objc_msgSend(v10, "count"))
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "carutil: passed invalid names delete-assets-named '%s'\n");
    goto LABEL_17;
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = objc_msgSend(v11, "stringWithFileSystemRepresentation:length:", a4, strlen(a4));
  if (*a5)
    v13 = (void *)objc_msgSend(v11, "stringWithFileSystemRepresentation:length:", a5, strlen(a5));
  else
    v13 = 0;
  if (objc_msgSend(v13, "length"))
  {
    v14 = copyfile_state_alloc();
    if ((copyfile(a4, a5, v14, 0x20000Fu) & 0x80000000) == 0)
    {
      copyfile_state_free(v14);
      v12 = (uint64_t)v13;
      goto LABEL_9;
    }
    v22 = (FILE *)*MEMORY[0x1E0C80C10];
    v23 = __error();
    v24 = strerror(*v23);
    fprintf(v22, "carutil: error: %s copy %s to %s\n", v24, a4, a5);
    copyfile_state_free(v14);
LABEL_17:
    objc_autoreleasePoolPop(v9);
    return 0;
  }
LABEL_9:
  v15 = -[CUIPlaceholderCUICarUtilAssetStorage initWithPath:forWriting:]([CUIPlaceholderCUICarUtilAssetStorage alloc], "initWithPath:forWriting:", v12, 1);
  if (!v15)
  {
    if (objc_msgSend(v13, "length"))
      unlink(a5);
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "carutil: error:\n\t%s is not a valid AssetCatalog\n");
    goto LABEL_17;
  }
  v16 = v15;
  -[CUIPlaceholderCUIMutableCommonAssetStorage setUseBitmapIndex:](v15, "setUseBitmapIndex:", 1);
  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = -[CUIPlaceholderCUICommonAssetStorage keyFormat](v16, "keyFormat");
  v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __deleteAssetsNamed_block_invoke;
  v27[3] = &unk_1E9769268;
  v27[7] = v17;
  v27[8] = v18;
  v27[4] = v16;
  v27[5] = v19;
  v27[6] = v10;
  -[CUIPlaceholderCUICommonAssetStorage enumerateKeysAndObjectsUsingBlock:](v16, "enumerateKeysAndObjectsUsingBlock:", v27);
  if (objc_msgSend(v17, "count"))
  {
    v20 = -[CUIPlaceholderCUICommonAssetStorage thinningArguments](v16, "thinningArguments");
    if (objc_msgSend(v20, "length"))
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ [carutil %f remove name '%s']"), v20, *(_QWORD *)&a2, a1);
    else
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[carutil %f remove name '%s']"), *(_QWORD *)&a2, a1, v26);
    __removeUnwantedAssets(v16, v17, v19, v21);
  }

  objc_autoreleasePoolPop(v9);
  return 1;
}

void __deleteAssetsNamed_block_invoke(uint64_t a1, unsigned __int16 *a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  id *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t KeyTokenToData;
  void *v12;
  _QWORD v13[5];

  v4 = objc_msgSend(*(id *)(a1 + 32), "renditionNameForKeyBaseList:", a2);
  v5 = CUIRenditionKeyValueForAttribute(a2, 1);
  KeyTokenToData = __createKeyTokenToData((int *)a2, *(_QWORD *)(a1 + 64));
  v6 = CUIRenditionKeyValueForAttribute(a2, 17);
  if (v5 == 9 && !v6)
  {
    v7 = (id *)(a1 + 40);
    v8 = (void *)KeyTokenToData;
LABEL_6:
    objc_msgSend(*v7, "addObject:", v8, KeyTokenToData);
    v8 = v12;
    goto LABEL_7;
  }
  v9 = *(void **)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __deleteAssetsNamed_block_invoke_2;
  v13[3] = &unk_1E9769240;
  v13[4] = v4;
  v10 = objc_msgSend((id)objc_msgSend(v9, "objectsPassingTest:", v13, KeyTokenToData), "count");
  v8 = (void *)KeyTokenToData;
  if (!v10)
  {
    v7 = (id *)(a1 + 56);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __deleteAssetsNamed_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2) ^ 1;
}

uint64_t processCoreGlyphs(const char *a1, const char *a2, double a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _copyfile_state *v10;
  CUIPlaceholderCUICarUtilAssetStorage *v11;
  CUIPlaceholderCUICarUtilAssetStorage *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  FILE *v17;
  int *v18;
  char *v19;
  uint64_t v21;
  _QWORD v22[6];

  v6 = (void *)MEMORY[0x1D825804C]();
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = objc_msgSend(v7, "stringWithFileSystemRepresentation:length:", a1, strlen(a1));
  if (*a2)
    v9 = (void *)objc_msgSend(v7, "stringWithFileSystemRepresentation:length:", a2, strlen(a2));
  else
    v9 = 0;
  if (objc_msgSend(v9, "length"))
  {
    v10 = copyfile_state_alloc();
    if (copyfile(a1, a2, v10, 0x20000Fu) < 0)
    {
      v17 = (FILE *)*MEMORY[0x1E0C80C10];
      v18 = __error();
      v19 = strerror(*v18);
      fprintf(v17, "carutil: error: %s copy %s to %s\n", v19, a1, a2);
      copyfile_state_free(v10);
LABEL_15:
      objc_autoreleasePoolPop(v6);
      return 0;
    }
    copyfile_state_free(v10);
    v8 = (uint64_t)v9;
  }
  v11 = -[CUIPlaceholderCUICarUtilAssetStorage initWithPath:forWriting:]([CUIPlaceholderCUICarUtilAssetStorage alloc], "initWithPath:forWriting:", v8, 1);
  if (!v11)
  {
    if (objc_msgSend(v9, "length"))
      unlink(a2);
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "carutil: error:\n\t%s is not a valid AssetCatalog\n", a1);
    goto LABEL_15;
  }
  v12 = v11;
  -[CUIPlaceholderCUIMutableCommonAssetStorage setUseBitmapIndex:](v11, "setUseBitmapIndex:", 1);
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = -[CUIPlaceholderCUICommonAssetStorage keyFormat](v12, "keyFormat");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __processCoreGlyphs_block_invoke;
  v22[3] = &unk_1E9769290;
  v22[4] = v13;
  v22[5] = v14;
  -[CUIPlaceholderCUICommonAssetStorage enumerateKeysAndObjectsUsingBlock:](v12, "enumerateKeysAndObjectsUsingBlock:", v22);
  if (objc_msgSend(v13, "count"))
  {
    v15 = -[CUIPlaceholderCUICommonAssetStorage thinningArguments](v12, "thinningArguments");
    if (objc_msgSend(v15, "length"))
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ [carutil %f CoreGlyphs thin]"), v15, *(_QWORD *)&a3);
    else
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[carutil %f CoreGlyphs thin]"), *(_QWORD *)&a3, v21);
    __removeUnwantedAssets(v12, v13, 0, v16);
  }

  objc_autoreleasePoolPop(v6);
  return 1;
}

void __processCoreGlyphs_block_invoke(uint64_t a1, unsigned __int16 *a2)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  void *KeyTokenToData;
  void *v9;

  v4 = CUIRenditionKeyValueForAttribute(a2, 1);
  v5 = CUIRenditionKeyValueForAttribute(a2, 2);
  v6 = CUIRenditionKeyValueForAttribute(a2, 26);
  v7 = CUIRenditionKeyValueForAttribute(a2, 27);
  KeyTokenToData = (void *)__createKeyTokenToData((int *)a2, *(_QWORD *)(a1 + 40));
  if (v4 == 85)
  {
    if (v5 == 181 || v5 == 59 && (v7 != 1 || v6 > 9 || ((1 << v6) & 0x212) == 0))
    {
LABEL_10:
      v9 = KeyTokenToData;
      objc_msgSend(*(id *)(a1 + 32), "addObject:", KeyTokenToData);
      KeyTokenToData = v9;
    }
  }
  else if (v4 == 9 && v5 == 181)
  {
    goto LABEL_10;
  }

}

uint64_t validateInput(int a1, const char *a2, void *a3, void *a4, void *a5)
{
  uint64_t result;
  CUIPlaceholderCUICarUtilAssetStorage *v11;
  CUIPlaceholderCUICarUtilAssetStorage *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  FILE **v21;
  uint64_t v22;
  FILE *v23;
  int v24;
  const char *v25;
  FILE *v26;
  int v27;
  const char *v28;
  uint64_t v29;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "stringWithFileSystemRepresentation:length:", a2, strlen(a2));
  if (result)
  {
    v11 = -[CUIPlaceholderCUICarUtilAssetStorage initWithPath:forWriting:]([CUIPlaceholderCUICarUtilAssetStorage alloc], "initWithPath:forWriting:", result, 0);
    if (!v11)
      return 0xFFFFFFFFLL;
    v12 = v11;
    v13 = -[CUIPlaceholderCUICommonAssetStorage deploymentPlatform](v11, "deploymentPlatform");
    v14 = -[CUIPlaceholderCUICommonAssetStorage storageVersion](v12, "storageVersion");

    v15 = objc_msgSend(a4, "count");
    if (objc_msgSend(a5, "count") == v15 && v15)
    {
      v16 = 0;
      do
      {
        v29 = 0;
        v17 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", v16), "integerValue");
        v29 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", v16), "unsignedIntegerValue");
        v18 = CUIValidateIdiomSubtypes(v17, &v29);
        if (a1)
        {
          if ((v18 & 1) == 0)
            return 0xFFFFFFFFLL;
        }
      }
      while (v15 != ++v16);
    }
    if (v14 > 0x11)
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "carutil: not validating inputs '%s' of the future '%d > %d'\n", a2, v14, 17);
      return 0;
    }
    else
    {
      v19 = objc_msgSend(a3, "count");
      result = 0;
      if (v19 && v13 != -1)
      {
        v20 = 0;
        v21 = (FILE **)MEMORY[0x1E0C80C10];
        while (1)
        {
          v22 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v20), "integerValue");
          if (v22 > CUIMaxScaleForTargetPlatform(v13))
          {
            v23 = *v21;
            v24 = CUIMaxScaleForTargetPlatform(v13);
            v25 = (const char *)-[__CFString UTF8String]((id)CUIPlatformNameForPlatform(v13), "UTF8String");
            fprintf(v23, "carutil: error: scale larger than %d valid scale for platform %d %s'\n", v22, v24, v25);
            if (a1)
              break;
          }
          if (v22 < CUIMinScaleForTargetPlatform(v13))
          {
            v26 = *v21;
            v27 = CUIMinScaleForTargetPlatform(v13);
            v28 = (const char *)-[__CFString UTF8String]((id)CUIPlatformNameForPlatform(v13), "UTF8String");
            fprintf(v26, "carutil: error: scale smaller than %d valid scale for platform %d %s'\n", v22, v27, v28);
            if (a1)
              break;
          }
          if (v19 == ++v20)
            return 0;
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t ____removeUnwantedAssets_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "assetExistsForKey:", a2);
  if ((_DWORD)result)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    return objc_msgSend(*(id *)(a1 + 32), "removeAssetForKey:", a2);
  }
  return result;
}

void ____removeUnwantedAssets_block_invoke_2(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  void *KeyTokenToData;
  CUIPlaceholderCUIThemeRendition *v7;

  if (CUIRenditionKeyValueForAttribute(a2, 1) != 9)
  {
    v7 = -[CUIPlaceholderCUIThemeRendition initWithCSIData:forKey:version:]([CUIPlaceholderCUIThemeRendition alloc], "initWithCSIData:forKey:version:", a3, a2, objc_msgSend(*(id *)(a1 + 32), "distilledInCoreUIVersion"));
    if (-[CUIPlaceholderCUIThemeRendition isInternalLink](v7, "isInternalLink"))
    {
      KeyTokenToData = (void *)__createKeyTokenToData((int *)objc_msgSend(-[CUIPlaceholderCUIThemeRendition linkingToRendition](v7, "linkingToRendition"), "keyList"), *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObject:", KeyTokenToData);

    }
  }
}

uint64_t ____removeUnwantedAssets_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "assetExistsForKey:", a2);
  if ((_DWORD)result)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    return objc_msgSend(*(id *)(a1 + 32), "removeAssetForKey:", a2);
  }
  return result;
}

uint64_t BOMStorageNewWithOptionsAndSys(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 *v3;
  uint64_t v5;
  uint64_t v6;
  int *v8;
  _BYTE v9[1028];
  int v10;
  __int128 *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (!a3)
    v3 = BomSys_default();
  v5 = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))v3 + 2))(*((_QWORD *)v3 + 1), a1, 1538, 420);
  if ((_DWORD)v5 == -1)
  {
    v8 = __error();
    strerror(*v8);
    _CUILog();
  }
  else
  {
    v6 = v5;
    bzero(v9, 0x470uLL);
    v10 = v6;
    v11 = v3;
    if (!_WriteRootPage((uint64_t)v9))
    {
      (*((void (**)(_QWORD, uint64_t))v3 + 3))(*((_QWORD *)v3 + 1), v6);
      return BOMStorageOpenWithSys(a1, 1, v3);
    }
  }
  return 0;
}

uint64_t _WriteRootPage(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD *);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int *v61;

  if (a1)
    v2 = *(_QWORD *)(a1 + 1120);
  else
    v2 = 0;
  v3 = 1;
  v4 = BOMStreamWithFileAndSys(*(_DWORD *)(a1 + 1028), 0, 0x200uLL, 1, 0, (__int128 *)v2);
  if (v4)
  {
    v11 = (uint64_t (*)(_QWORD *))v4;
    BOMStreamWriteUInt32((uint64_t (*)(_QWORD *))v4, 1112493395, v5, v6, v7, v8, v9, v10);
    BOMStreamWriteUInt32(v11, 1953460837, v12, v13, v14, v15, v16, v17);
    BOMStreamWriteUInt32(v11, 1, v18, v19, v20, v21, v22, v23);
    BOMStreamWriteUInt32(v11, *(unsigned int *)(a1 + 1056), v24, v25, v26, v27, v28, v29);
    BOMStreamWriteUInt32(v11, *(unsigned int *)(a1 + 1060), v30, v31, v32, v33, v34, v35);
    BOMStreamWriteUInt32(v11, *(unsigned int *)(a1 + 1064), v36, v37, v38, v39, v40, v41);
    BOMStreamWriteUInt32(v11, *(unsigned int *)(a1 + 1096), v42, v43, v44, v45, v46, v47);
    BOMStreamWriteUInt32(v11, *(unsigned int *)(a1 + 1100), v48, v49, v50, v51, v52, v53);
    v3 = BOMStreamFree((uint64_t)v11, v54, v55, v56, v57, v58, v59, v60);
    if ((*(unsigned int (**)(_QWORD, _QWORD))(v2 + 64))(*(_QWORD *)(v2 + 8), *(unsigned int *)(a1 + 1028)))
    {
      v61 = __error();
      strerror(*v61);
      _CUILog();
      return 1;
    }
  }
  return v3;
}

uint64_t BOMStorageOpenWithSys(uint64_t a1, int a2, __int128 *a3)
{
  __int128 *v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  int v84;
  BOOL v85;
  unsigned int v86;
  char *v87;
  int v88;
  char *v89;
  int v90;
  int *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  int *v100;
  int *v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  char *v111;
  int v112;
  char *v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  int *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  char *v132;
  int *v133;
  char v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  int *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  int v153;
  int v154;
  unsigned int v155;
  char *v156;
  char *v157;
  unsigned int v158;
  uint64_t v159;
  uint64_t v160;
  _QWORD *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t (*v169)(_QWORD, _QWORD);
  uint64_t v170;
  NSObject *v171;
  int v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  int *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  char *v200;
  _OWORD v201[6];
  __int128 v202;
  __int128 v203;
  __int128 v204;
  uint8_t buf[4];
  uint64_t v206;
  __int16 v207;
  uint64_t v208;
  uint64_t v209;

  v3 = a3;
  v209 = *MEMORY[0x1E0C80C00];
  if (!a3)
    v3 = BomSys_default();
  v203 = 0u;
  v204 = 0u;
  v202 = 0u;
  memset(v201, 0, sizeof(v201));
  v6 = (*((uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))v3 + 2))(*((_QWORD *)v3 + 1), a1, 2 * (a2 != 0), 420);
  if ((_DWORD)v6 != -1)
  {
    v7 = v6;
    if ((*((unsigned int (**)(_QWORD, uint64_t, _OWORD *))v3 + 9))(*((_QWORD *)v3 + 1), v6, v201) != -1)
    {
      v8 = BOMStreamWithFileAndSys(v7, 0, 0x200uLL, 0, 0, v3);
      if (!v8)
      {
        v122 = __error();
        strerror(*v122);
        v130 = BOMExceptionHandlerMessage("can't read from: '%s' %s", v123, v124, v125, v126, v127, v128, v129, a1);
        v88 = *__error();
        v89 = v130;
        v90 = 286;
        goto LABEL_18;
      }
      v16 = (uint64_t)v8;
      if (BOMStreamReadUInt32((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15) == 1112493395
        && BOMStreamReadUInt32(v16, v17, v18, v19, v20, v21, v22, v23) == 1953460837)
      {
        if (BOMStreamReadUInt32(v16, v17, v18, v19, v20, v21, v22, v23) == 1)
        {
          v31 = BOM_malloczero(0x470uLL);
          v39 = (uint64_t)v31;
          if (!v31)
          {
            v133 = __error();
            v134 = strerror(*v133);
            v142 = BOMExceptionHandlerMessage("malloc: %s", v135, v136, v137, v138, v139, v140, v141, v134);
            v143 = __error();
            _BOMExceptionHandlerCall(v142, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 317, *v143);
            BOMStreamFree(v16, v144, v145, v146, v147, v148, v149, v150);
            (*((void (**)(_QWORD, uint64_t))v3 + 3))(*((_QWORD *)v3 + 1), v7);
            return v39;
          }
          v31[140] = v3;
          *((_DWORD *)v31 + 257) = v7;
          v40 = v202;
          *((_DWORD *)v31 + 258) = v202;
          *((_DWORD *)v31 + 259) = v40;
          *((_DWORD *)v31 + 263) = *((_DWORD *)v31 + 263) & 0xFFFFFFF6 | a2 & 1;
          *((_DWORD *)v31 + 264) = BOMStreamReadUInt32(v16, v32, v33, v34, v35, v36, v37, v38);
          *(_DWORD *)(v39 + 1060) = BOMStreamReadUInt32(v16, v41, v42, v43, v44, v45, v46, v47);
          *(_DWORD *)(v39 + 1064) = BOMStreamReadUInt32(v16, v48, v49, v50, v51, v52, v53, v54);
          *(_DWORD *)(v39 + 1096) = BOMStreamReadUInt32(v16, v55, v56, v57, v58, v59, v60, v61);
          *(_DWORD *)(v39 + 1100) = BOMStreamReadUInt32(v16, v62, v63, v64, v65, v66, v67, v68);
          *(_DWORD *)(v39 + 1052) &= ~4u;
          *(_QWORD *)(v39 + 1128) = 0;
          BOMStreamFree(v16, v69, v70, v71, v72, v73, v74, v75);
          v83 = *(_DWORD *)(v39 + 1060);
          v84 = *(_DWORD *)(v39 + 1064);
          v85 = __CFADD__(v84, v83);
          v86 = v84 + v83;
          if (v85)
          {
            v87 = BOMExceptionHandlerMessage("%s: stream invalid; overflow of admin offset+size",
                    v76,
                    v77,
                    v78,
                    v79,
                    v80,
                    v81,
                    v82,
                    a1);
            v88 = *__error();
            v89 = v87;
            v90 = 344;
          }
          else
          {
            v151 = *(unsigned int *)(v39 + 1032);
            if (v86 <= v151)
            {
              v153 = *(_DWORD *)(v39 + 1096);
              v154 = *(_DWORD *)(v39 + 1100);
              v85 = __CFADD__(v154, v153);
              v155 = v154 + v153;
              if (v85)
              {
                v156 = BOMExceptionHandlerMessage("%s: stream invalid; overflow of toc offset+size",
                         v76,
                         v151,
                         v78,
                         v79,
                         v80,
                         v81,
                         v82,
                         a1);
                v88 = *__error();
                v89 = v156;
                v90 = 358;
              }
              else
              {
                if (v155 <= v151)
                {
                  if (a2)
                  {
                    if (v151 <= 0x800)
                      v158 = 2048;
                    else
                      v158 = *(_DWORD *)(v39 + 1032);
                    *(_DWORD *)(v39 + 1048) = v158;
                    _CreateMapAddress(v39, v158);
                    v159 = *(_QWORD *)(v39 + 1040);
                    if (!v159)
                      goto LABEL_19;
                    *(_DWORD *)(v39 + 1052) |= 0xAu;
                    v160 = *(unsigned int *)(v39 + 1096);
                    if ((_DWORD)v160)
                    {
                      v161 = BOMStreamWithFileAndSys(*(_DWORD *)(v39 + 1028), v160, *(unsigned int *)(v39 + 1100), 0, (char *)(v159 + v160), v3);
                      if (!v161)
                        goto LABEL_19;
                      BOMStreamFree((uint64_t)v161, v162, v163, v164, v165, v166, v167, v168);
                    }
                  }
                  else
                  {
                    v169 = (uint64_t (*)(_QWORD, _QWORD))*((_QWORD *)v3 + 12);
                    if (!v169)
                      goto LABEL_48;
                    v170 = v169(*((_QWORD *)v3 + 1), 0);
                    if (CUILogRenditionLogEnabled())
                    {
                      v171 = CUILogHandle();
                      if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136446466;
                        v206 = a1;
                        v207 = 2050;
                        v208 = v170;
                        _os_log_impl(&dword_1D4106000, v171, OS_LOG_TYPE_INFO, "CoreUI %{public}s %{public}p", buf, 0x16u);
                      }
                    }
                    if (v170 == -1)
                    {
LABEL_48:
                      *(_DWORD *)(v39 + 1048) = 0;
                      *(_QWORD *)(v39 + 1040) = 0;
                      *(_DWORD *)(v39 + 1052) &= ~2u;
                      __error();
                      _CUILog();
                    }
                    else
                    {
                      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v39 + 1120) + 24))(*(_QWORD *)(*(_QWORD *)(v39 + 1120) + 8), *(unsigned int *)(v39 + 1028));
                      *(_DWORD *)(v39 + 1028) = -1;
                      v172 = *(_DWORD *)(v39 + 1052);
                      *(_DWORD *)(v39 + 1048) = *(_DWORD *)(v39 + 1032);
                      *(_QWORD *)(v39 + 1040) = v170;
                      *(_DWORD *)(v39 + 1052) = v172 | 0xA;
                      v173 = *(unsigned int *)(v39 + 1060);
                      if ((_DWORD)v173)
                        madvise((void *)(v170 + v173), *(unsigned int *)(v39 + 1064), 3);
                      v174 = *(unsigned int *)(v39 + 1096);
                      if ((_DWORD)v174)
                        madvise((void *)(*(_QWORD *)(v39 + 1040) + v174), *(unsigned int *)(v39 + 1100), 3);
                    }
                  }
                  _CreateBlockTable((_QWORD *)v39);
                  v175 = *(unsigned int *)(v39 + 1060);
                  if ((_DWORD)v175)
                  {
                    if (!a2 && (*(_BYTE *)(v39 + 1052) & 2) != 0)
                    {
                      v177 = BOMStreamWithAddress(*(_QWORD *)(v39 + 1040) + v175, *(unsigned int *)(v39 + 1064), 0);
                    }
                    else
                    {
                      v176 = (char *)BOM_malloczero(*(unsigned int *)(v39 + 1064));
                      *(_QWORD *)(v39 + 1128) = v176;
                      if (!v176)
                      {
                        v185 = __error();
                        strerror(*v185);
                        _CUILog();
                        return 0;
                      }
                      v177 = (uint64_t)BOMStreamWithFileAndSys(v7, *(unsigned int *)(v39 + 1060), *(unsigned int *)(v39 + 1064), 0, v176, v3);
                    }
                    v186 = v177;
                    if (!v177)
                    {
                      v200 = BOMExceptionHandlerMessage("can't read from %s unable to create a BOMStream", v178, v179, v180, v181, v182, v183, v184, a1);
                      v88 = *__error();
                      v89 = v200;
                      v90 = 452;
                      goto LABEL_18;
                    }
                    if (_ReadBlockTable(v39, v177, v179, v180, v181, v182, v183, v184)
                      || _ReadFreeList(v39, v186, v187, v188, v189, v190, v191, v192))
                    {
                      goto LABEL_19;
                    }
                    BOMStreamFree(v186, v193, v194, v195, v196, v197, v198, v199);
                  }
                  else
                  {
                    *(_QWORD *)(v39 + 1088) = _BOMFreeListAllocate();
                  }
                  __strlcpy_chk();
                  return v39;
                }
                v157 = BOMExceptionHandlerMessage("%s: stream invalid; toc range is outside of file",
                         v76,
                         v151,
                         v78,
                         v79,
                         v80,
                         v81,
                         v82,
                         a1);
                v88 = *__error();
                v89 = v157;
                v90 = 365;
              }
            }
            else
            {
              v152 = BOMExceptionHandlerMessage("%s: stream invalid; admin range is outside of file",
                       v76,
                       v151,
                       v78,
                       v79,
                       v80,
                       v81,
                       v82,
                       a1);
              v88 = *__error();
              v89 = v152;
              v90 = 351;
            }
          }
LABEL_18:
          _BOMExceptionHandlerCall(v89, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v90, v88);
          goto LABEL_19;
        }
        v132 = BOMExceptionHandlerMessage("%s has an unknown version: 0x%X", v24, v25, v26, v27, v28, v29, v30, a1);
        v112 = *__error();
        v113 = v132;
        v114 = 307;
      }
      else
      {
        v111 = BOMExceptionHandlerMessage("%s is not a BOMStorage file\n", v17, v18, v19, v20, v21, v22, v23, a1);
        v112 = *__error();
        v113 = v111;
        v114 = 293;
      }
      _BOMExceptionHandlerCall(v113, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v114, v112);
      BOMStreamFree(v16, v115, v116, v117, v118, v119, v120, v121);
LABEL_19:
      (*((void (**)(_QWORD, uint64_t))v3 + 3))(*((_QWORD *)v3 + 1), v7);
      return 0;
    }
    v101 = __error();
    v102 = strerror(*v101);
    v110 = BOMExceptionHandlerMessage("fstat: %s", v103, v104, v105, v106, v107, v108, v109, v102);
    v88 = *__error();
    v89 = v110;
    v90 = 277;
    goto LABEL_18;
  }
  v91 = __error();
  strerror(*v91);
  v99 = BOMExceptionHandlerMessage("can't open: '%s' %s", v92, v93, v94, v95, v96, v97, v98, a1);
  v100 = __error();
  _BOMExceptionHandlerCall(v99, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 270, *v100);
  return 0;
}

uint64_t _CreateMapAddress(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t result;
  int *v7;

  v3 = (unint64_t)a2 % *MEMORY[0x1E0C85AD8];
  if (v3)
    v4 = *MEMORY[0x1E0C85AD8] - v3;
  else
    v4 = 0;
  v5 = v4 + a2;
  result = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 1120)
                                                                                                 + 96))(*(_QWORD *)(*(_QWORD *)(a1 + 1120) + 8), 0, v5, 3, 4098, 0xFFFFFFFFLL, 0);
  *(_QWORD *)(a1 + 1040) = result;
  if (result == -1)
  {
    v7 = __error();
    strerror(*v7);
    result = _CUILog();
    *(_QWORD *)(a1 + 1040) = 0;
  }
  *(_DWORD *)(a1 + 1048) = v5;
  return result;
}

_QWORD *_CreateBlockTable(_QWORD *result)
{
  _QWORD *v1;

  if ((*((_BYTE *)result + 1052) & 1) != 0)
  {
    v1 = result;
    result[134] = BOM_malloczero(0x800uLL);
    result = BOM_malloczero(0x400uLL);
    v1[135] = result;
    *((_DWORD *)v1 + 267) = 256;
  }
  return result;
}

uint64_t _ReadBlockTable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  char *v19;
  int *v20;
  uint64_t DataPointer;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;

  result = BOMStreamReadUInt32(a2, a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)result)
  {
    v18 = result;
    if (result >> 29 || (v11 = 8 * result, v11 > *(unsigned int *)(a1 + 1064)))
    {
      v19 = BOMExceptionHandlerMessage("bad value for block table count", v11, v12, v13, v14, v15, v16, v17, v40);
      v20 = __error();
      _BOMExceptionHandlerCall(v19, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1594, *v20);
      return 1;
    }
    else if ((*(_BYTE *)(a1 + 1052) & 1) != 0)
    {
      v22 = result;
      _ExpandBlockTable((char *)a1, result);
      v30 = 0;
      v31 = 4 * v22;
      v32 = 4;
      do
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 1072) + v32 - 4) = BOMStreamReadUInt32(a2, v23, v24, v25, v26, v27, v28, v29);
        *(_DWORD *)(*(_QWORD *)(a1 + 1072) + v32) = BOMStreamReadUInt32(a2, v33, v34, v35, v36, v37, v38, v39);
        *(_BYTE *)(*(_QWORD *)(a1 + 1080) + v30) &= ~1u;
        v32 += 8;
        v30 += 4;
      }
      while (v31 != v30);
      return 0;
    }
    else
    {
      DataPointer = BOMStreamGetDataPointer(a2, v11);
      result = 0;
      *(_QWORD *)(a1 + 1072) = DataPointer;
      *(_DWORD *)(a1 + 1068) = v18;
    }
  }
  return result;
}

uint64_t _ReadFreeList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v9;
  uint64_t result;
  int UInt32;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, size_t, _BOOL8);
  _BOOL8 v30;
  char *v31;
  int *v32;

  if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
  {
    v9 = _BOMFreeListAllocate();
    result = 0;
    *(_QWORD *)(a1 + 1088) = v9;
    return result;
  }
  UInt32 = BOMStreamReadUInt32(a2, a2, a3, a4, a5, a6, a7, a8);
  *(_QWORD *)(a1 + 1088) = _BOMFreeListAllocate();
  if (!UInt32)
    return 0;
  v20 = (8 * UInt32);
  if ((int)v20 < 1)
  {
    v31 = BOMExceptionHandlerMessage("_ReadFreeList: tring to read %d byte for freelist table.", v13, v14, v15, v16, v17, v18, v19, v20);
    v32 = __error();
    _BOMExceptionHandlerCall(v31, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1723, *v32);
  }
  else
  {
    v21 = BOM_malloc(v20);
    if (v21)
    {
      v27 = v21;
      BOMStreamReadBuffer(a2, v21, v20, v22, v23, v24, v25, v26);
      v28 = *(_QWORD *)(a1 + 1088);
      v29 = *(void (**)(uint64_t, void *, size_t, _BOOL8))(v28 + 16);
      v30 = BOMStreamGetByteOrder(a2) == 1;
      v29(v28, v27, v20, v30);
      free(v27);
      return 0;
    }
  }
  return 1;
}

_QWORD *BOMStorageOpenInRAM(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  int v9;
  char *v10;
  int v11;
  char v12;
  int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int UInt32;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  int v90;
  BOOL v91;
  unsigned int v92;
  char *v93;
  char *v94;
  int v95;
  char *v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  char *v107;
  int *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unsigned int v116;
  char *v117;
  int v118;
  int v119;
  unsigned int v120;
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  int *v145;
  char v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  char v155;

  if (a2 <= 0x1FF)
  {
    v8 = BOMExceptionHandlerMessage("stream invalid; root page is outside of address range",
           a2,
           a3,
           a4,
           a5,
           a6,
           a7,
           a8,
           v155);
    v9 = *__error();
    v10 = v8;
    v11 = 486;
    goto LABEL_14;
  }
  v12 = a3;
  v13 = a2;
  v15 = BOMStreamWithAddress(a1, 512, 0);
  if (!v15)
  {
    v105 = BOMExceptionHandlerMessage("can't read from memory %p", v16, v17, v18, v19, v20, v21, v22, a1);
    v9 = *__error();
    v10 = v105;
    v11 = 494;
    goto LABEL_14;
  }
  v23 = v15;
  if (BOMStreamReadUInt32(v15, v16, v17, v18, v19, v20, v21, v22) == 1112493395
    && BOMStreamReadUInt32(v23, v24, v25, v26, v27, v28, v29, v30) == 1953460837)
  {
    UInt32 = BOMStreamReadUInt32(v23, v24, v25, v26, v27, v28, v29, v30);
    if (UInt32 == 1)
    {
      v39 = BOM_malloczero(0x470uLL);
      if (!v39)
      {
        v108 = __error();
        strerror(*v108);
        _CUILog();
        BOMStreamFree(v23, v109, v110, v111, v112, v113, v114, v115);
        return v39;
      }
      v39[140] = BomSys_default();
      *((_DWORD *)v39 + 257) = -1;
      *((_DWORD *)v39 + 258) = v13;
      *((_DWORD *)v39 + 259) = v13;
      *((_DWORD *)v39 + 263) = *((_DWORD *)v39 + 263) & 0xFFFFFFF6 | v12 & 1;
      *((_DWORD *)v39 + 264) = BOMStreamReadUInt32(v23, v40, v41, v42, v43, v44, v45, v46);
      *((_DWORD *)v39 + 265) = BOMStreamReadUInt32(v23, v47, v48, v49, v50, v51, v52, v53);
      *((_DWORD *)v39 + 266) = BOMStreamReadUInt32(v23, v54, v55, v56, v57, v58, v59, v60);
      *((_DWORD *)v39 + 274) = BOMStreamReadUInt32(v23, v61, v62, v63, v64, v65, v66, v67);
      *((_DWORD *)v39 + 275) = BOMStreamReadUInt32(v23, v68, v69, v70, v71, v72, v73, v74);
      *((_DWORD *)v39 + 263) |= 6u;
      BOMStreamFree(v23, v75, v76, v77, v78, v79, v80, v81);
      v89 = *((_DWORD *)v39 + 265);
      v90 = *((_DWORD *)v39 + 266);
      v91 = __CFADD__(v90, v89);
      v92 = v90 + v89;
      if (v91)
      {
        v93 = BOMExceptionHandlerMessage(" <memory>: stream invalid; overflow of admin offset+size",
                v82,
                v83,
                v84,
                v85,
                v86,
                v87,
                v88,
                v155);
        v9 = *__error();
        v10 = v93;
        v11 = 549;
      }
      else
      {
        v116 = *((_DWORD *)v39 + 258);
        if (v92 <= v116)
        {
          v118 = *((_DWORD *)v39 + 274);
          v119 = *((_DWORD *)v39 + 275);
          v91 = __CFADD__(v119, v118);
          v120 = v119 + v118;
          if (v91)
          {
            v121 = BOMExceptionHandlerMessage("<memory>: stream invalid; overflow of toc offset+size",
                     v82,
                     v83,
                     v84,
                     v85,
                     v86,
                     v87,
                     v88,
                     v155);
            v9 = *__error();
            v10 = v121;
            v11 = 561;
          }
          else
          {
            if (v120 <= v116)
            {
              *((_DWORD *)v39 + 262) = v116;
              v39[130] = a1;
              _CreateBlockTable(v39);
              v123 = *((unsigned int *)v39 + 265);
              if ((_DWORD)v123)
              {
                v124 = BOMStreamWithAddress(v39[130] + v123, *((unsigned int *)v39 + 266), 0);
                if (!v124)
                {
                  v145 = __error();
                  v146 = strerror(*v145);
                  v154 = BOMExceptionHandlerMessage("can't read from <memory>: %s", v147, v148, v149, v150, v151, v152, v153, v146);
                  v9 = *__error();
                  v10 = v154;
                  v11 = 585;
                  goto LABEL_14;
                }
                v131 = v124;
                if (_ReadBlockTable((uint64_t)v39, v124, v125, v126, v127, v128, v129, v130)
                  || _ReadFreeList((uint64_t)v39, v131, v132, v133, v134, v135, v136, v137))
                {
                  return 0;
                }
                BOMStreamFree(v131, v138, v139, v140, v141, v142, v143, v144);
              }
              else
              {
                v39[136] = _BOMFreeListAllocate();
              }
              __strlcpy_chk();
              return v39;
            }
            v122 = BOMExceptionHandlerMessage("<memory>: stream invalid; toc range is outside file",
                     v82,
                     v83,
                     v84,
                     v85,
                     v86,
                     v87,
                     v88,
                     v155);
            v9 = *__error();
            v10 = v122;
            v11 = 567;
          }
        }
        else
        {
          v117 = BOMExceptionHandlerMessage("<memory>: stream invalid; admin range is outside of file",
                   v82,
                   v83,
                   v84,
                   v85,
                   v86,
                   v87,
                   v88,
                   v155);
          v9 = *__error();
          v10 = v117;
          v11 = 555;
        }
      }
LABEL_14:
      _BOMExceptionHandlerCall(v10, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v11, v9);
      return 0;
    }
    v107 = BOMExceptionHandlerMessage("<memory> has an unknown version: 0x%X", v32, v33, v34, v35, v36, v37, v38, UInt32);
    v95 = *__error();
    v96 = v107;
    v97 = 514;
  }
  else
  {
    v94 = BOMExceptionHandlerMessage("%s is not a BOMStorage file", v24, v25, v26, v27, v28, v29, v30, (char)"<memory>");
    v95 = *__error();
    v96 = v94;
    v97 = 501;
  }
  _BOMExceptionHandlerCall(v96, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v97, v95);
  BOMStreamFree(v23, v98, v99, v100, v101, v102, v103, v104);
  return 0;
}

uint64_t BOMStorageFree(_BYTE *a1)
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD);
  int v6;
  int v7;
  int *v8;
  void *v9;

  if (!a1)
    return 1;
  if ((a1[1052] & 0x10) != 0 && BOMStorageCommit((uint64_t)a1))
    return 1;
  v3 = (void *)*((_QWORD *)a1 + 134);
  if (v3)
  {
    if ((a1[1052] & 1) != 0)
    {
      free(v3);
      v4 = (void *)*((_QWORD *)a1 + 135);
      if (v4)
        free(v4);
    }
  }
  v5 = (void (**)(_QWORD))*((_QWORD *)a1 + 136);
  if (v5)
  {
    v5[4](*((_QWORD *)a1 + 136));
    free(v5);
  }
  if (*((_QWORD *)a1 + 130))
  {
    if ((*((_DWORD *)a1 + 263) & 8) != 0)
    {
      v6 = *((_DWORD *)a1 + 263) & 3;
      v7 = (*(uint64_t (**)(_QWORD))(*((_QWORD *)a1 + 140) + 104))(*(_QWORD *)(*((_QWORD *)a1 + 140) + 8));
      if (v6 != 2 && v7 == -1)
      {
        v8 = __error();
        _BOMExceptionHandlerCall("munmap failed", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1505, *v8);
      }
    }
  }
  if (*((_DWORD *)a1 + 257) != -1)
    (*(void (**)(_QWORD))(*((_QWORD *)a1 + 140) + 24))(*(_QWORD *)(*((_QWORD *)a1 + 140) + 8));
  v9 = (void *)*((_QWORD *)a1 + 141);
  if (v9)
    free(v9);
  free(a1);
  return 0;
}

uint64_t BOMStorageCommit(uint64_t a1)
{
  int v2;
  _BOOL8 v3;
  uint64_t v5;
  int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  int v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(_QWORD *);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, _BOOL8, size_t *);
  _BOOL8 v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  size_t __len;

  if (!a1)
    return 1;
  v2 = *(_DWORD *)(a1 + 1052);
  if ((v2 & 0x10) == 0)
    return 0;
  if (*(_DWORD *)(a1 + 1028) == -1)
  {
    v3 = 0;
    *(_DWORD *)(a1 + 1036) = *(_DWORD *)(a1 + 1032);
    goto LABEL_8;
  }
  _FlushWriteCache(a1);
  if (_AdjustFileSize(a1, 0, 0))
    return 1;
  v5 = *(_QWORD *)(a1 + 1088);
  v6 = 8 * (*(_DWORD *)(a1 + 1068) + *(_DWORD *)(v5 + 8));
  v7 = (v6 + 24);
  if (v6 == -24)
  {
    v8 = 0;
  }
  else
  {
    v8 = (*(uint64_t (**)(uint64_t, _QWORD))(v5 + 48))(v5, (v6 + 39) & 0xFFFFFFF0);
    if (!v8)
      v8 = (*(_DWORD *)(a1 + 1032) + 15) & 0xFFFFFFF0;
  }
  v9 = *(_DWORD *)(a1 + 1060);
  v10 = *(_DWORD *)(a1 + 1064);
  *(_DWORD *)(a1 + 1060) = v8;
  *(_DWORD *)(a1 + 1064) = v7;
  if (v9 && v10)
    (*(void (**)(void))(*(_QWORD *)(a1 + 1088) + 40))();
  v11 = v8;
  v3 = 1;
  v12 = BOMStreamWithFile(*(_DWORD *)(a1 + 1028), v11, v7, 1, 0);
  if (v12)
  {
    v19 = (uint64_t (*)(_QWORD *))v12;
    v20 = *(unsigned int *)(a1 + 1068);
    BOMStreamWriteUInt32((uint64_t (*)(_QWORD *))v12, v20, v13, v14, v15, v16, v17, v18);
    if ((_DWORD)v20)
    {
      v27 = 0;
      v28 = 0;
      do
      {
        if (v28 >= *(unsigned int *)(a1 + 1068))
        {
          _CUILog();
          v31 = 0xFFFFFFFFLL;
        }
        else
        {
          v29 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + v27);
          v30 = bswap32(v29);
          if ((*(_BYTE *)(a1 + 1052) & 1) != 0)
            v31 = v29;
          else
            v31 = v30;
        }
        BOMStreamWriteUInt32(v19, v31, v21, v22, v23, v24, v25, v26);
        if (v28 >= *(unsigned int *)(a1 + 1068))
        {
          _CUILog();
          v40 = 0;
        }
        else
        {
          v38 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + v27 + 4);
          v39 = bswap32(v38);
          if ((*(_BYTE *)(a1 + 1052) & 1) != 0)
            v40 = v38;
          else
            v40 = v39;
        }
        BOMStreamWriteUInt32(v19, v40, v32, v33, v34, v35, v36, v37);
        ++v28;
        v27 += 8;
      }
      while (8 * v20 != v27);
    }
    BOMStreamWriteUInt32(v19, *(unsigned int *)(*(_QWORD *)(a1 + 1088) + 8), v21, v22, v23, v24, v25, v26);
    __len = 0;
    v41 = *(_QWORD *)(a1 + 1088);
    v42 = *(uint64_t (**)(uint64_t, _BOOL8, size_t *))(v41 + 24);
    v43 = BOMStreamGetByteOrder((uint64_t)v19) == 1;
    v44 = (void *)v42(v41, v43, &__len);
    BOMStreamWriteBuffer((uint64_t)v19, v44, __len, v45, v46, v47, v48, v49);
    free(v44);
    v57 = BOMStreamFree((uint64_t)v19, v50, v51, v52, v53, v54, v55, v56);
    if (_AdjustFileSize(a1, 0, 0))
      return 1;
    *(_DWORD *)(a1 + 1036) = *(_DWORD *)(a1 + 1032);
    v3 = (_WriteRootPage(a1) | v57) != 0;
    v2 = *(_DWORD *)(a1 + 1052);
LABEL_8:
    *(_DWORD *)(a1 + 1052) = v2 & 0xFFFFFFEF;
  }
  return v3;
}

uint64_t BOMStorageGetSys(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 1120);
  return result;
}

uint64_t BOMStorageIsOpenForWriting(uint64_t result)
{
  if (result)
    return *(_BYTE *)(result + 1052) & 1;
  return result;
}

BOOL BOMStorageMemoryMapped(_BOOL8 result)
{
  if (result)
    return (*(_DWORD *)(result + 1052) & 6) == 2;
  return result;
}

uint64_t BOMStorageNewBlock(uint64_t a1)
{
  uint64_t v1;
  unsigned int v3;

  if (!a1 || (*(_BYTE *)(a1 + 1052) & 1) == 0)
    return 0;
  v1 = (*(_DWORD *)(a1 + 1056) + 1);
  *(_DWORD *)(a1 + 1056) = v1;
  v3 = *(_DWORD *)(a1 + 1068);
  if (v1 >= v3)
    _ExpandBlockTable((char *)a1, v3 + 8);
  return v1;
}

char *_ExpandBlockTable(char *result, unsigned int a2)
{
  char *v2;
  uint64_t v3;
  int *v5;

  v2 = result;
  v3 = *((unsigned int *)result + 267);
  if (v3 < a2)
  {
    *((_QWORD *)result + 134) = BOM_realloczero(*((void **)result + 134), 8 * v3, 8 * a2);
    result = BOM_realloczero(*((void **)v2 + 135), 4 * *((unsigned int *)v2 + 267), 4 * a2);
    *((_QWORD *)v2 + 135) = result;
    *((_DWORD *)v2 + 267) = a2;
  }
  if (!*((_QWORD *)v2 + 134) || !*((_QWORD *)v2 + 135))
  {
    v5 = __error();
    return (char *)_BOMExceptionHandlerCall("Out of memory.", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1672, *v5);
  }
  return result;
}

uint64_t BOMStorageNewNamedBlock(uint64_t a1, const char *a2)
{
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int UInt32;
  uint64_t (*v23)(_QWORD *);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(_QWORD *);
  size_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t UInt8;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int i;
  _BYTE __dst[255];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
    return 0;
  if (_tocGet(a1, a2))
  {
    _CUILog();
    return 0;
  }
  v4 = BOMStorageNewBlock(a1);
  v6 = strnlen(a2, 0xFFuLL);
  v7 = v6;
  if (v6 < 0xFF)
  {
    if (*(_DWORD *)(a1 + 1096))
      v8 = *(_DWORD *)(a1 + 1100);
    else
      v8 = 4;
    v9 = v6 + v8;
    v10 = v9 + 5;
    if (v9 == -5)
    {
      v11 = 0;
    }
    else
    {
      v11 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 1088) + 48))();
      if (!v11)
        v11 = (*(_DWORD *)(a1 + 1032) + 15) & 0xFFFFFFF0;
    }
    _ExpandMapAddress(a1, v11 + v10);
    v12 = *(unsigned int *)(a1 + 1096);
    if ((_DWORD)v12)
    {
      v13 = BOMStreamWithAddress(*(_QWORD *)(a1 + 1040) + v12, *(unsigned int *)(a1 + 1100), 0);
      if (!v13)
        return v4;
      v21 = v13;
      UInt32 = BOMStreamReadUInt32(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      UInt32 = 0;
      v21 = 0;
    }
    v23 = (uint64_t (*)(_QWORD *))BOMStreamWithAddress(*(_QWORD *)(a1 + 1040) + v11, v10, 1);
    if (v23)
    {
      v30 = v23;
      v31 = v7;
      BOMStreamWriteUInt32(v23, (UInt32 + 1), v24, v25, v26, v27, v28, v29);
      if (v21)
      {
        for (i = v11; UInt32; --UInt32)
        {
          v39 = BOMStreamReadUInt32(v21, v32, v33, v34, v35, v36, v37, v38);
          UInt8 = BOMStreamReadUInt8(v21, v40, v41, v42, v43, v44, v45, v46);
          BOMStreamReadBuffer(v21, __dst, UInt8, v48, v49, v50, v51, v52);
          BOMStreamWriteUInt32(v30, v39, v53, v54, v55, v56, v57, v58);
          BOMStreamWriteUInt8(v30, UInt8, v59, v60, v61, v62, v63, v64);
          BOMStreamWriteBuffer((uint64_t)v30, __dst, UInt8, v65, v66, v67, v68, v69);
        }
        BOMStreamFree(v21, v32, v33, v34, v35, v36, v37, v38);
        if (*(_DWORD *)(a1 + 1096))
        {
          v33 = *(unsigned int *)(a1 + 1100);
          if ((_DWORD)v33)
            (*(void (**)(void))(*(_QWORD *)(a1 + 1088) + 40))();
        }
        v11 = i;
        v31 = v7;
      }
      BOMStreamWriteUInt32(v30, v4, v33, v34, v35, v36, v37, v38);
      BOMStreamWriteUInt8(v30, v7, v70, v71, v72, v73, v74, v75);
      BOMStreamWriteBuffer((uint64_t)v30, a2, v31, v76, v77, v78, v79, v80);
      BOMStreamFree((uint64_t)v30, v81, v82, v83, v84, v85, v86, v87);
      *(_DWORD *)(a1 + 1096) = v11;
      *(_DWORD *)(a1 + 1100) = v10;
      _AdjustFileSize(a1, v11, v10);
      if (*(_DWORD *)(a1 + 1028) != -1)
        _AddToWriteCache(a1, v11, v10);
      *(_DWORD *)(a1 + 1052) |= 0x10u;
    }
  }
  else
  {
    _CUILog();
  }
  return v4;
}

uint64_t _tocGet(uint64_t a1, const char *a2)
{
  uint64_t v4;
  size_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int UInt32;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int UInt8;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  void *v44;
  unsigned int v45;
  unsigned int v46;
  size_t v47;
  char __s2[256];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = *(unsigned int *)(a1 + 1096);
  if (!(_DWORD)v4)
    return 0;
  v5 = *(unsigned int *)(a1 + 1100);
  if (!(_DWORD)v5)
    return 0;
  v6 = (*(_BYTE *)(a1 + 1052) & 2) != 0
     ? (_QWORD *)BOMStreamWithAddress(*(_QWORD *)(a1 + 1040) + v4, *(unsigned int *)(a1 + 1100), 0)
     : BOMStreamWithFile(*(_DWORD *)(a1 + 1028), v4, v5, 0, 0);
  v14 = (uint64_t)v6;
  if (!v6)
    return 0;
  UInt32 = BOMStreamReadUInt32((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  if (UInt32)
  {
    v23 = UInt32;
    while (1)
    {
      v24 = BOMStreamReadUInt32(v14, v16, v17, v18, v19, v20, v21, v22);
      UInt8 = BOMStreamReadUInt8(v14, v25, v26, v27, v28, v29, v30, v31);
      BOMStreamReadBuffer(v14, __s2, UInt8, v33, v34, v35, v36, v37);
      __s2[UInt8] = 0;
      if (!strncmp(a2, __s2, 0xFFuLL))
        break;
      if (!--v23)
        goto LABEL_12;
    }
  }
  else
  {
LABEL_12:
    v24 = 0;
  }
  BOMStreamFree(v14, v16, v17, v18, v19, v20, v21, v22);
  v38 = *(_DWORD *)(a1 + 1068);
  if (v24 <= v38)
    v39 = v24;
  else
    v39 = 0;
  v40 = *(_DWORD *)(a1 + 1052);
  if ((v40 & 2) != 0 && (v40 & 1) == 0 && (_DWORD)v39)
  {
    v41 = *(_QWORD *)(a1 + 1040);
    if (v38 <= v39)
    {
      _CUILog();
      v38 = *(_DWORD *)(a1 + 1068);
      v42 = 0xFFFFFFFFLL;
    }
    else
    {
      v42 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * v39));
    }
    v44 = (void *)(v41 + v42);
    if (v38 <= v39)
    {
      _CUILog();
      v47 = 0;
    }
    else
    {
      v45 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * v39 + 4);
      v46 = bswap32(v45);
      if ((*(_BYTE *)(a1 + 1052) & 1) != 0)
        v47 = v45;
      else
        v47 = v46;
    }
    madvise(v44, v47, 3);
    return v24;
  }
  return v39;
}

uint64_t BOMStorageSizeOfBlock(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  result = 0;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a1 + 1056) < a2)
      return 0;
    v5 = *(_DWORD *)(a1 + 1068);
    if (v5 <= a2)
    {
      _CUILog();
      v5 = *(_DWORD *)(a1 + 1068);
    }
    else
    {
      v6 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2);
      v7 = bswap32(v6);
      if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
        v6 = v7;
      if (v6 != -1)
      {
LABEL_16:
        if (v5 > a2)
        {
          v10 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2 + 4);
          v11 = bswap32(v10);
          if ((*(_BYTE *)(a1 + 1052) & 1) != 0)
            return v10;
          else
            return v11;
        }
        _CUILog();
        return 0;
      }
    }
    if (v5 <= a2)
    {
      _CUILog();
      v5 = *(_DWORD *)(a1 + 1068);
    }
    else
    {
      v8 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2 + 4);
      v9 = bswap32(v8);
      if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
        v8 = v9;
      if (v8 == -1)
        return 0;
    }
    goto LABEL_16;
  }
  return result;
}

double BOMStorageFreeBlock(uint64_t a1, unsigned int a2)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  double result;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;

  if (a1 && a2 && *(_DWORD *)(a1 + 1056) >= a2)
  {
    v4 = *(_DWORD *)(a1 + 1068);
    if (v4 <= a2)
    {
      _CUILog();
      v4 = *(_DWORD *)(a1 + 1068);
      v7 = 0xFFFFFFFFLL;
    }
    else
    {
      v5 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2);
      v6 = bswap32(v5);
      if ((*(_BYTE *)(a1 + 1052) & 1) != 0)
        v7 = v5;
      else
        v7 = v6;
    }
    if (v4 <= a2)
    {
      _CUILog();
LABEL_19:
      result = NAN;
      *(_QWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2) = -1;
      return result;
    }
    v9 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2 + 4);
    v10 = bswap32(v9);
    if ((*(_BYTE *)(a1 + 1052) & 1) != 0)
      v11 = v9;
    else
      v11 = v10;
    if ((_DWORD)v7 != -1 || (_DWORD)v11 != -1)
    {
      if ((_DWORD)v7)
      {
        if ((_DWORD)v11)
          (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 1088) + 40))(*(_QWORD *)(a1 + 1088), v7, v11);
      }
      goto LABEL_19;
    }
  }
  return result;
}

void BOMStorageFreeNamedBlock(uint64_t a1, const char *a2)
{
  unsigned int v4;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(_QWORD *);
  int UInt32;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  size_t UInt8;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char __s1[256];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2)
    {
      v4 = _tocGet(a1, a2);
      if (v4)
      {
        BOMStorageFreeBlock(a1, v4);
        if (*(_DWORD *)(a1 + 1096))
        {
          v5 = strlen(a2);
          v6 = *(_DWORD *)(a1 + 1100);
          if (v6)
          {
            v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 1088) + 48))();
            if (!v7)
              v7 = (*(_DWORD *)(a1 + 1032) + 15) & 0xFFFFFFF0;
          }
          else
          {
            v7 = 0;
          }
          v8 = (v6 - v5 - 5);
          _ExpandMapAddress(a1, v7 + v8);
          v9 = BOMStreamWithAddress(*(_QWORD *)(a1 + 1040) + *(unsigned int *)(a1 + 1096), *(unsigned int *)(a1 + 1100), 0);
          if (v9)
          {
            v10 = v9;
            v11 = BOMStreamWithAddress(*(_QWORD *)(a1 + 1040) + v7, v8, 1);
            if (v11)
            {
              v19 = (uint64_t (*)(_QWORD *))v11;
              UInt32 = BOMStreamReadUInt32(v10, v12, v13, v14, v15, v16, v17, v18);
              BOMStreamWriteUInt32(v19, (UInt32 - 1), v21, v22, v23, v24, v25, v26);
              for (; UInt32; --UInt32)
              {
                v34 = BOMStreamReadUInt32(v10, v27, v28, v29, v30, v31, v32, v33);
                UInt8 = BOMStreamReadUInt8(v10, v35, v36, v37, v38, v39, v40, v41);
                BOMStreamReadBuffer(v10, __s1, UInt8, v43, v44, v45, v46, v47);
                __s1[UInt8] = 0;
                if (strcmp(__s1, a2))
                {
                  BOMStreamWriteUInt32(v19, v34, v28, v29, v30, v31, v32, v33);
                  BOMStreamWriteUInt8(v19, UInt8, v48, v49, v50, v51, v52, v53);
                  BOMStreamWriteBuffer((uint64_t)v19, __s1, UInt8, v54, v55, v56, v57, v58);
                }
              }
              BOMStreamFree(v10, v27, v28, v29, v30, v31, v32, v33);
              BOMStreamFree((uint64_t)v19, v59, v60, v61, v62, v63, v64, v65);
              if (*(_DWORD *)(a1 + 1096) && *(_DWORD *)(a1 + 1100))
                (*(void (**)(void))(*(_QWORD *)(a1 + 1088) + 40))();
              *(_DWORD *)(a1 + 1096) = v7;
              *(_DWORD *)(a1 + 1100) = v8;
              _AdjustFileSize(a1, v7, v8);
              if (*(_DWORD *)(a1 + 1028) != -1)
                _AddToWriteCache(a1, v7, v8);
              *(_DWORD *)(a1 + 1052) |= 0x10u;
            }
          }
        }
      }
    }
  }
}

uint64_t BOMStorageCopyToBlock(uint64_t a1, uint64_t a2, const void *a3, size_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v13;

  if (!a1 || !(_DWORD)a2 || *(_DWORD *)(a1 + 1056) < a2 || (*(_BYTE *)(a1 + 1052) & 1) == 0)
    return 1;
  if (*(_DWORD *)(a1 + 1068) <= a2)
  {
    _CUILog();
    v13 = 0;
  }
  else
  {
    v13 = *(unsigned int *)(*(_QWORD *)(a1 + 1072) + 8 * a2 + 4);
  }
  return BOMStorageCopyToBlockRange(a1, a2, a3, a4, 0, v13, a7, a8);
}

uint64_t BOMStorageCopyToBlockRange(uint64_t a1, uint64_t a2, const void *a3, size_t a4, unint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  unsigned int v10;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  int v22;
  char *v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  unint64_t v28;
  unsigned int v29;
  unint64_t v30;
  unint64_t v31;
  unsigned int v32;
  char *v33;
  unsigned int *v34;
  unint64_t v35;
  const void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  unsigned int v51;
  uint64_t v52;
  unsigned int v53;
  const void *v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  size_t v58;
  unsigned int v59;
  uint64_t v60;
  unsigned int v61;
  char *v62;
  int *v63;
  int v64;
  char *v65;
  char *v66;
  char *v67;
  const char *v68;
  unint64_t v69;

  result = 1;
  if (a1)
  {
    v10 = a2;
    if ((_DWORD)a2)
    {
      if (*(_DWORD *)(a1 + 1056) >= a2 && (*(_BYTE *)(a1 + 1052) & 1) != 0)
      {
        v15 = *(_DWORD *)(a1 + 1068);
        if (v15 <= a2)
        {
          v68 = "unsigned int _getBlockTableAddr(BOMStorage, BOMBlockID)";
          _CUILog();
          v15 = *(_DWORD *)(a1 + 1068);
          v16 = 0xFFFFFFFFLL;
        }
        else
        {
          v16 = *(unsigned int *)(*(_QWORD *)(a1 + 1072) + 8 * a2);
        }
        if (v15 <= v10)
        {
          v68 = "unsigned int _getBlockTableSize(BOMStorage, BOMBlockID)";
          _CUILog();
          v17 = 0;
        }
        else
        {
          v17 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * v10 + 4);
          v18 = bswap32(v17);
          if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
            v17 = v18;
        }
        v19 = a6 + a5;
        v20 = v17;
        v21 = v17 - (a6 + a5);
        if (v17 < a6 + a5)
        {
          v22 = *__error();
          v23 = "BOMStorageCopyToBlockRange: length extends beyond block size";
          v24 = 826;
          goto LABEL_31;
        }
        if (v17 <= a5)
          v25 = a5;
        else
          v25 = v17;
        v26 = v25 + a4;
        if (((v25 + a4) | v25 | a4) >> 32)
        {
          v27 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"BOMStorageCopyToBlockRange");
          v22 = *__error();
          v23 = v27;
          v24 = 843;
          goto LABEL_31;
        }
        v28 = v26 - a6;
        if ((v26 - a6) >> 32 || HIDWORD(a6))
        {
          v33 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"BOMStorageCopyToBlockRange");
          v22 = *__error();
          v23 = v33;
          v24 = 845;
          goto LABEL_31;
        }
        if ((_DWORD)v20 != (_DWORD)v28 || (v29 = v16, v16 < *(_DWORD *)(a1 + 1036)))
        {
          if ((_DWORD)v16 && (_DWORD)v20)
          {
            v30 = v28;
            (*(void (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)(a1 + 1088) + 40))(*(_QWORD *)(a1 + 1088), v16, v20);
            v28 = v30;
          }
          if ((_DWORD)v28)
          {
            v31 = v28;
            v32 = (*(uint64_t (**)(_QWORD, _QWORD, const void *))(*(_QWORD *)(a1 + 1088) + 48))(*(_QWORD *)(a1 + 1088), ((_DWORD)v28 + 15) & 0xFFFFFFF0, a3);
            v28 = v31;
            v29 = v32;
            if (!v32)
              v29 = (*(_DWORD *)(a1 + 1032) + 15) & 0xFFFFFFF0;
          }
          else
          {
            v29 = 0;
          }
          v34 = (unsigned int *)(*(_QWORD *)(a1 + 1072) + 8 * v10);
          *v34 = v29;
          v34[1] = v28;
        }
        result = 0;
        if (v29 && (_DWORD)v28)
        {
          v69 = v28;
          v35 = v28 + v29;
          if (HIDWORD(v35))
          {
            v65 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", v35, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"BOMStorageCopyToBlockRange");
            v22 = *__error();
            v23 = v65;
            v24 = 882;
          }
          else
          {
            if (_ExpandMapAddress(a1, v35))
              return 1;
            v43 = v29;
            v44 = v16;
            if (a5
              && (v45 = *(_QWORD *)(a1 + 1040), (v36 = (const void *)(v45 + v16)) != 0)
              && v45 + v29)
            {
              memmove((void *)(v45 + v29), v36, a5);
              v44 = v16;
              v43 = v29;
              v46 = a5;
            }
            else
            {
              v46 = 0;
            }
            v47 = v19 + v44;
            if ((v19 | (v19 + v44)) >> 32)
            {
              v48 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", (uint64_t)v36, v37, v38, v39, v40, v41, v42, (char)"BOMStorageCopyToBlockRange");
              v22 = *__error();
              v23 = v48;
              v24 = 905;
            }
            else
            {
              v49 = a5 + a4 + v43;
              if (!(((a5 + a4) | v49) >> 32))
              {
                if (v20 <= a5 || v29 < v16 || v29 >= (int)v20 + (int)v16)
                {
                  if (a4)
                  {
                    v54 = a3;
                    v55 = v46;
                    v56 = v43;
                    v57 = v47;
                    memmove((void *)(*(_QWORD *)(a1 + 1040) + v43 + v46), v54, a4);
                    v47 = v57;
                    v43 = v56;
                    v46 = v55 + a4;
                  }
                  if (v46 < v69)
                  {
                    v58 = v69 - v46;
                    if (HIDWORD(v58))
                    {
                      v67 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", (uint64_t)v36, v37, v38, v39, v40, v41, v42, (char)"BOMStorageCopyToBlockRange");
                      v22 = *__error();
                      v23 = v67;
                      v24 = 945;
                      goto LABEL_31;
                    }
                    v59 = v46;
                    memmove((void *)(*(_QWORD *)(a1 + 1040) + v43 + v46), (const void *)(*(_QWORD *)(a1 + 1040) + v47), v58);
                    v46 = v59 + v58;
                  }
                }
                else
                {
                  if (HIDWORD(v21))
                  {
                    v66 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", (uint64_t)v36, v37, v38, v39, v40, v41, v42, (char)"BOMStorageCopyToBlockRange");
                    v22 = *__error();
                    v23 = v66;
                    v24 = 917;
                    goto LABEL_31;
                  }
                  if ((_DWORD)v21)
                  {
                    v51 = v46;
                    v52 = v43;
                    memmove((void *)(*(_QWORD *)(a1 + 1040) + v49), (const void *)(*(_QWORD *)(a1 + 1040) + v47), v21);
                    v43 = v52;
                    v46 = v51;
                  }
                  if (a4)
                  {
                    v53 = v46;
                    memmove((void *)(*(_QWORD *)(a1 + 1040) + v43 + v46), a3, a4);
                    v46 = v53 + a4;
                  }
                  v46 += v21;
                }
                v60 = *(_QWORD *)(a1 + 1080);
                if (v60)
                {
                  *(_BYTE *)(v60 + 4 * v10) |= 1u;
                }
                else
                {
                  v61 = v46;
                  v62 = BOMExceptionHandlerMessage("BOM blockShadowTable is null", (uint64_t)v36, v37, v38, v39, v40, v41, v42, (char)v68);
                  v63 = __error();
                  _BOMExceptionHandlerCall(v62, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 957, *v63);
                  v46 = v61;
                }
                v64 = v69;
                if (v46 == (_DWORD)v69)
                {
                  if (*(_DWORD *)(a1 + 1028) == -1)
                  {
                    if (v29 + v69 > *(_DWORD *)(a1 + 1032))
                      *(_DWORD *)(a1 + 1032) = v29 + v69;
                  }
                  else
                  {
                    _AddToWriteCache(a1, v29, v69);
                    v64 = v69;
                  }
                  result = _AdjustFileSize(a1, v29, v64);
                  if (!(_DWORD)result)
                  {
                    *(_DWORD *)(a1 + 1052) |= 0x10u;
                    return result;
                  }
                  return 1;
                }
                v22 = *__error();
                v23 = "BOMStorageCopyToBlockRange: internal consistency error";
                v24 = 962;
                goto LABEL_31;
              }
              v50 = BOMExceptionHandlerMessage("ERROR in %s: %s [%s:%d]", (uint64_t)v36, v37, v38, v39, v40, v41, v42, (char)"BOMStorageCopyToBlockRange");
              v22 = *__error();
              v23 = v50;
              v24 = 906;
            }
          }
LABEL_31:
          _BOMExceptionHandlerCall(v23, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v24, v22);
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t _ExpandMapAddress(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  uint64_t v7;
  vm_address_t v8;
  vm_address_t v9;
  int *v10;
  int *v11;
  uint64_t v12;
  int v13;
  char *v14;
  int v15;

  v3 = *(_DWORD *)(a1 + 1048);
  if (v3 < a2)
  {
    if (v3 >= 0x100000)
      LODWORD(v4) = v3 + 0x100000;
    else
      LODWORD(v4) = 2 * v3;
    if (v4 <= a2)
      v4 = a2;
    else
      v4 = v4;
    v5 = v4 % *MEMORY[0x1E0C85AD8];
    v6 = *MEMORY[0x1E0C85AD8] - v5;
    if (!v5)
      v6 = 0;
    v7 = (v6 + v4);
    v8 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 1120)
                                                                                               + 96))(*(_QWORD *)(*(_QWORD *)(a1 + 1120) + 8), 0, v7, 3, 4098, 0xFFFFFFFFLL, 0);
    if (v8 == -1)
    {
      v13 = *__error();
      v14 = "mmap failed";
      v12 = 1;
      v15 = 1531;
    }
    else
    {
      v9 = v8;
      if (vm_copy(*MEMORY[0x1E0C83DA0], *(_QWORD *)(a1 + 1040), *(unsigned int *)(a1 + 1048), v8))
      {
        v10 = __error();
        _BOMExceptionHandlerCall("vm_copy failed", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1535, *v10);
      }
      if ((*(unsigned int (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 1120) + 104))(*(_QWORD *)(*(_QWORD *)(a1 + 1120) + 8), *(_QWORD *)(a1 + 1040), *(unsigned int *)(a1 + 1048)) != -1)
      {
        *(_QWORD *)(a1 + 1040) = v9;
        *(_DWORD *)(a1 + 1048) = v7;
        if (!v9)
          goto LABEL_17;
        return 0;
      }
      v13 = *__error();
      v14 = "munmap failed";
      v12 = 1;
      v15 = 1538;
    }
    _BOMExceptionHandlerCall(v14, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v15, v13);
    return v12;
  }
  if (!*(_QWORD *)(a1 + 1040))
  {
LABEL_17:
    v11 = __error();
    _BOMExceptionHandlerCall("Out of memory.", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1551, *v11);
  }
  return 0;
}

void _AddToWriteCache(uint64_t a1, unsigned int a2, int a3)
{
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  _DWORD *v12;
  int v13;
  _DWORD *v14;
  _QWORD *v15;
  unsigned int v16;
  _DWORD *v17;
  int *v18;

  if (!a2 || !a3)
    return;
  v5 = *(_DWORD **)(a1 + 1104);
  if (v5)
  {
    v6 = v5[2];
    if (v6 <= a2)
    {
      while (1)
      {
        v7 = v5;
        v5 = *(_DWORD **)v5;
        if (!v5)
          break;
        v8 = v5[2];
        if (v8 >= a2)
        {
          v10 = v7[3];
          if (v10 + v7[2] != a2)
            goto LABEL_6;
          v7[3] = v10 + a3;
          if (a3 + a2 == v5[2])
          {
            v7[3] = v5[3] + v10 + a3;
            *(_QWORD *)v7 = *(_QWORD *)v5;
            free(v5);
            v11 = *(_DWORD *)(a1 + 1112) - 1;
            goto LABEL_23;
          }
          goto LABEL_24;
        }
      }
      v13 = v7[3];
      if (v13 + v7[2] == a2)
      {
        v7[3] = v13 + a3;
        goto LABEL_24;
      }
      v12 = _newFreeListEntry(a2, a3);
      if (v12)
      {
        *(_QWORD *)v12 = 0;
        goto LABEL_21;
      }
    }
    else
    {
      v7 = 0;
      v8 = v5[2];
LABEL_6:
      if (a3 + a2 == v8)
      {
        v9 = v5[3] + a3;
        v5[2] = a2;
        v5[3] = v9;
        goto LABEL_24;
      }
      v12 = _newFreeListEntry(a2, a3);
      if (v12)
      {
        *(_QWORD *)v12 = v5;
        if (v6 <= a2)
LABEL_21:
          *(_QWORD *)v7 = v12;
        else
          *(_QWORD *)(a1 + 1104) = v12;
        v11 = *(_DWORD *)(a1 + 1112) + 1;
        goto LABEL_23;
      }
    }
    v18 = __error();
    _BOMExceptionHandlerCall("Out of memory.", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 2104, *v18);
    return;
  }
  *(_QWORD *)(a1 + 1104) = _newFreeListEntry(a2, a3);
  v11 = 1;
LABEL_23:
  *(_DWORD *)(a1 + 1112) = v11;
LABEL_24:
  if (*(_DWORD *)(a1 + 1112) < 0x10u)
  {
    v14 = *(_DWORD **)(a1 + 1104);
    if (v14)
    {
      v15 = 0;
      do
      {
        v16 = v14[3];
        if (v16 < 0xFFFF)
        {
          v17 = *(_DWORD **)v14;
          v15 = v14;
        }
        else
        {
          v17 = *(_DWORD **)v14;
          if (v15)
          {
            *v15 = v17;
            v17 = *(_DWORD **)v14;
          }
          else
          {
            *(_QWORD *)(a1 + 1104) = v17;
          }
          _WriteAddress(a1, v14[2], v16);
          free(v14);
          --*(_DWORD *)(a1 + 1112);
        }
        v14 = v17;
      }
      while (v17);
    }
  }
  else
  {
    _FlushWriteCache(a1);
  }
}

uint64_t _AdjustFileSize(uint64_t a1, int a2, int a3)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  int *v7;

  if (a2)
  {
    if ((a3 + a2) <= *(_DWORD *)(a1 + 1032))
    {
      return 0;
    }
    else
    {
      result = 0;
      *(_DWORD *)(a1 + 1032) = a3 + a2;
    }
  }
  else
  {
    v5 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 1120) + 56))(*(_QWORD *)(*(_QWORD *)(a1 + 1120) + 8), *(unsigned int *)(a1 + 1028), 0, 2);
    if (v5 == -1)
    {
      v7 = __error();
      strerror(*v7);
      _CUILog();
      return 1;
    }
    else
    {
      v6 = v5;
      result = 0;
      *(_DWORD *)(a1 + 1032) = v6;
    }
  }
  return result;
}

uint64_t BOMStorageCopyFromBlock(uint64_t a1, unsigned int a2, void *a3)
{
  int v5;
  char *v6;
  int v7;
  unsigned int v9;
  unsigned int v10;
  size_t v11;
  int *v12;

  if (!a1 || !a2)
  {
    if (a1)
    {
      if (!a2)
        goto LABEL_13;
    }
    else
    {
      v12 = __error();
      _BOMExceptionHandlerCall("BOMStorageCopyFromBlock: !storage", 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 994, *v12);
      if (!a2)
      {
LABEL_13:
        v5 = *__error();
        v6 = "BOMStorageCopyFromBlock: !bid";
        v7 = 996;
        goto LABEL_14;
      }
    }
    return 1;
  }
  if (*(_DWORD *)(a1 + 1056) < a2)
  {
    v5 = *__error();
    v6 = "BOMStorageCopyFromBlock: bid > storage->blocks";
    v7 = 1000;
LABEL_14:
    _BOMExceptionHandlerCall(v6, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v7, v5);
    return 1;
  }
  if (*(_DWORD *)(a1 + 1068) <= a2)
  {
    _CUILog();
    v11 = 0;
  }
  else
  {
    v9 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2 + 4);
    v10 = bswap32(v9);
    if ((*(_BYTE *)(a1 + 1052) & 1) != 0)
      v11 = v9;
    else
      v11 = v10;
  }
  return BOMStorageCopyFromBlockRange(a1, a2, 0, v11, a3);
}

uint64_t BOMStorageCopyFromBlockRange(uint64_t a1, unsigned int a2, uint64_t a3, size_t __len, void *__dst)
{
  int v8;
  char *v9;
  int v10;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int *v16;
  int *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v25;
  int v26;
  int v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  int *v59;
  const char *v60;

  if (!a1 || !a2 || !__dst)
  {
    if (a1)
    {
      if (a2)
        goto LABEL_8;
    }
    else
    {
      v16 = __error();
      _BOMExceptionHandlerCall("BOMStorageCopyFromBlockRange: !storage", 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1096, *v16);
      if (a2)
      {
LABEL_8:
        if (!__dst)
          goto LABEL_17;
        return 1;
      }
    }
    v17 = __error();
    _BOMExceptionHandlerCall("BOMStorageCopyFromBlockRange: !bid", 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1098, *v17);
    if (!__dst)
    {
LABEL_17:
      v8 = *__error();
      v9 = "BOMStorageCopyFromBlockRange: !data";
      v10 = 1100;
      goto LABEL_43;
    }
    return 1;
  }
  if (*(_DWORD *)(a1 + 1056) < a2)
  {
    v8 = *__error();
    v9 = "BOMStorageCopyRangeFromBlockRange: bad block (bid > storage->blocks)";
    v10 = 1106;
LABEL_43:
    _BOMExceptionHandlerCall(v9, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v10, v8);
    return 1;
  }
  v13 = *(_DWORD *)(a1 + 1068);
  if (v13 <= a2)
  {
    v60 = "unsigned int _getBlockTableAddr(BOMStorage, BOMBlockID)";
    _CUILog();
    v13 = *(_DWORD *)(a1 + 1068);
  }
  else
  {
    v14 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2);
    v15 = bswap32(v14);
    if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
      v14 = v15;
    if (v14 != -1)
      goto LABEL_25;
  }
  if (v13 <= a2)
  {
    v60 = "unsigned int _getBlockTableSize(BOMStorage, BOMBlockID)";
    _CUILog();
    v13 = *(_DWORD *)(a1 + 1068);
  }
  else
  {
    v18 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2 + 4);
    v19 = bswap32(v18);
    if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
      v18 = v19;
    if (v18 == -1)
    {
      v8 = *__error();
      v9 = "BOMStorageCopyRangeFromBlockRange: reading from free block";
      v10 = 1111;
      goto LABEL_43;
    }
  }
LABEL_25:
  if (v13 <= a2)
  {
    v60 = "unsigned int _getBlockTableAddr(BOMStorage, BOMBlockID)";
    _CUILog();
    v13 = *(_DWORD *)(a1 + 1068);
    v21 = -1;
  }
  else
  {
    v20 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2));
    if ((*(_BYTE *)(a1 + 1052) & 1) != 0)
      v21 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2);
    else
      v21 = v20;
  }
  if (v13 <= a2)
  {
    v60 = "unsigned int _getBlockTableSize(BOMStorage, BOMBlockID)";
    _CUILog();
    v22 = 0;
  }
  else
  {
    v22 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2 + 4);
    v23 = bswap32(v22);
    if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
      v22 = v23;
  }
  if (__CFADD__(v22, v21))
  {
    v8 = *__error();
    v9 = "BOMStorageCopyRangeFromBlockRange: 32-bit overflow with block address+size";
    v10 = 1121;
    goto LABEL_43;
  }
  if (v22 + v21 > *(_DWORD *)(a1 + 1032))
  {
    v8 = *__error();
    v9 = "BOMStorageCopyRangeFromBlockRange: block extends past end of storage";
    v10 = 1125;
    goto LABEL_43;
  }
  if (__CFADD__(__len, a3))
  {
    v8 = *__error();
    v9 = "BOMStorageCopyRangeFromBlockRange: length extends beyond block size overflow";
    v10 = 1136;
    goto LABEL_43;
  }
  if (__len + a3 > v22)
  {
    v8 = *__error();
    v9 = "BOMStorageCopyRangeFromBlockRange: length extends beyond block size";
    v10 = 1140;
    goto LABEL_43;
  }
  if (v22)
  {
    if (!v21)
    {
      v8 = *__error();
      v9 = "BOMStorageCopyRangeFromBlockRange: bad block address";
      v10 = 1148;
      goto LABEL_43;
    }
    v25 = *(_QWORD *)(a1 + 1080);
    if (v25 && (*(_BYTE *)(v25 + 4 * a2) & 1) != 0)
    {
      v26 = *(_DWORD *)(a1 + 1052);
    }
    else
    {
      v26 = *(_DWORD *)(a1 + 1052);
      if ((v26 & 1) != 0 && *(_DWORD *)(a1 + 1028) != -1)
        goto LABEL_55;
    }
    if ((v26 & 2) != 0)
    {
      v41 = (const void *)(*(_QWORD *)(a1 + 1040) + v21 + a3);
      goto LABEL_64;
    }
LABEL_55:
    v27 = *(_DWORD *)(a1 + 1028);
    if ((v26 & 2) == 0)
    {
      v28 = BOMStreamWithFile(v27, v21, v22, 0, 0);
      BOMStreamReadBuffer((uint64_t)v28, __dst, __len, v29, v30, v31, v32, v33);
      BOMStreamFree((uint64_t)v28, v34, v35, v36, v37, v38, v39, v40);
      return 0;
    }
    v42 = BOMStreamWithFile(v27, v21, v22, 0, (char *)(*(_QWORD *)(a1 + 1040) + v21));
    if (!v42)
    {
      v8 = *__error();
      v9 = "BOMStorageCopyRangeFromBlockRange: !stream";
      v10 = 1173;
      goto LABEL_43;
    }
    BOMStreamFree((uint64_t)v42, v43, v44, v45, v46, v47, v48, v49);
    v57 = *(_QWORD *)(a1 + 1080);
    if (v57)
    {
      *(_BYTE *)(v57 + 4 * a2) |= 1u;
    }
    else
    {
      v58 = BOMExceptionHandlerMessage("BOM blockShadowTable is null", v50, v51, v52, v53, v54, v55, v56, (char)v60);
      v59 = __error();
      _BOMExceptionHandlerCall(v58, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1180, *v59);
    }
    v41 = (const void *)(*(_QWORD *)(a1 + 1040) + v21 + a3);
LABEL_64:
    memmove(__dst, v41, __len);
  }
  return 0;
}

uint64_t BOMStorageReadFromBlock(uint64_t a1, unsigned int a2)
{
  int v4;
  char *v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v14;
  int v15;
  int v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  int *v34;
  const char *v35;

  if (!a1 || !a2)
  {
    if (a1)
    {
      if (!a2)
        goto LABEL_13;
    }
    else
    {
      v10 = __error();
      _BOMExceptionHandlerCall("BOMStorageCopyFromBlock: !storage", 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1013, *v10);
      if (!a2)
      {
LABEL_13:
        v4 = *__error();
        v5 = "BOMStorageCopyFromBlock: !bid";
        v6 = 1016;
        goto LABEL_27;
      }
    }
    return 0;
  }
  if (*(_DWORD *)(a1 + 1056) < a2)
  {
    v4 = *__error();
    v5 = "BOMStorageCopyRangeFromBlockRange: bad block (bid > storage->blocks)";
    v6 = 1023;
LABEL_27:
    _BOMExceptionHandlerCall(v5, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", v6, v4);
    return 0;
  }
  v7 = *(_DWORD *)(a1 + 1068);
  if (v7 <= a2)
  {
    v35 = "unsigned int _getBlockTableAddr(BOMStorage, BOMBlockID)";
    _CUILog();
    v7 = *(_DWORD *)(a1 + 1068);
    v9 = -1;
  }
  else
  {
    v8 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2));
    if ((*(_BYTE *)(a1 + 1052) & 1) != 0)
      v9 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2);
    else
      v9 = v8;
  }
  if (v7 <= a2)
  {
    v35 = "unsigned int _getBlockTableSize(BOMStorage, BOMBlockID)";
    _CUILog();
    v11 = 0;
  }
  else
  {
    v11 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * a2 + 4);
    v12 = bswap32(v11);
    if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
      v11 = v12;
    if (v9 == -1 && v11 == -1)
    {
      v4 = *__error();
      v5 = "BOMStorageCopyRangeFromBlockRange: reading from free block";
      v6 = 1032;
      goto LABEL_27;
    }
  }
  if (__CFADD__(v11, v9))
  {
    v4 = *__error();
    v5 = "BOMStorageCopyRangeFromBlockRange: 32-bit overflow with block address+size";
    v6 = 1038;
    goto LABEL_27;
  }
  if (v11 + v9 > *(_DWORD *)(a1 + 1032))
  {
    v4 = *__error();
    v5 = "BOMStorageCopyRangeFromBlockRange: block extends past end of storage";
    v6 = 1042;
    goto LABEL_27;
  }
  if (!v11)
    return 0;
  v14 = *(_QWORD *)(a1 + 1080);
  if (v14 && (*(_BYTE *)(v14 + 4 * a2) & 1) != 0)
  {
    v15 = *(_DWORD *)(a1 + 1052);
LABEL_39:
    if ((v15 & 2) == 0)
      return 0;
    return *(_QWORD *)(a1 + 1040) + v9;
  }
  v15 = *(_DWORD *)(a1 + 1052);
  if ((v15 & 1) == 0)
    goto LABEL_39;
  v16 = *(_DWORD *)(a1 + 1028);
  if (v16 == -1)
    goto LABEL_39;
  if ((v15 & 2) == 0)
    return 0;
  v17 = BOMStreamWithFile(v16, v9, v11, 0, (char *)(*(_QWORD *)(a1 + 1040) + v9));
  if (!v17)
  {
    v4 = *__error();
    v5 = "BOMStorageCopyRangeFromBlockRange: !stream";
    v6 = 1070;
    goto LABEL_27;
  }
  BOMStreamFree((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
  v32 = *(_QWORD *)(a1 + 1080);
  if (v32)
  {
    *(_BYTE *)(v32 + 4 * a2) |= 1u;
  }
  else
  {
    v33 = BOMExceptionHandlerMessage("BOM blockShadowTable is null", v25, v26, v27, v28, v29, v30, v31, (char)v35);
    v34 = __error();
    _BOMExceptionHandlerCall(v33, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1077, *v34);
  }
  return *(_QWORD *)(a1 + 1040) + v9;
}

void _FlushWriteCache(uint64_t a1)
{
  _DWORD *i;

  for (i = *(_DWORD **)(a1 + 1104); i; i = *(_DWORD **)(a1 + 1104))
  {
    *(_QWORD *)(a1 + 1104) = *(_QWORD *)i;
    _WriteAddress(a1, i[2], i[3]);
    free(i);
  }
  *(_DWORD *)(a1 + 1112) = 0;
}

uint64_t BOMStorageCompact(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  size_t v35;
  unsigned int v36;
  _BYTE *v37;
  _BYTE *v38;
  int *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  char __s[1025];
  _BYTE v55[1025];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a1 || (*(_BYTE *)(a1 + 1052) & 1) == 0 || *(_DWORD *)(a1 + 1028) == -1)
    return 1;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  v2 = *(_QWORD *)(a1 + 1120);
  BOMStorageCommit(a1);
  __strlcpy_chk();
  v3 = (*(uint64_t (**)(_QWORD, _QWORD, __int128 *))(v2 + 72))(*(_QWORD *)(v2 + 8), *(unsigned int *)(a1 + 1028), &v45);
  if (v3 == -1)
  {
    v4 = __error();
    v5 = strerror(*v4);
    v13 = BOMExceptionHandlerMessage("fstat: %s", v6, v7, v8, v9, v10, v11, v12, v5);
    v14 = __error();
    _BOMExceptionHandlerCall(v13, 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 1303, *v14);
  }
  __strlcpy_chk();
  v15 = strrchr(__s, 47);
  if (v15)
    *v15 = 0;
  else
    __strlcpy_chk();
  __strlcat_chk();
  if (!mktemp(__s))
  {
    _CUILog();
    return 1;
  }
  v17 = BOMStorageNewWithOptionsAndSys((uint64_t)__s, v16, (__int128 *)v2);
  if (!v17)
  {
LABEL_57:
    unlink(__s);
    return 1;
  }
  v19 = v17;
  if (*(_DWORD *)(a1 + 1056))
  {
    v20 = 1;
    do
    {
      if ((_DWORD)v20 != BOMStorageNewBlock(v19))
        goto LABEL_56;
      v21 = *(_DWORD *)(a1 + 1068);
      if (v21 <= v20)
      {
        _CUILog();
        v21 = *(_DWORD *)(a1 + 1068);
      }
      else
      {
        v22 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * v20);
        v23 = bswap32(v22);
        if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
          v22 = v23;
        if (v22 != -1)
          goto LABEL_26;
      }
      if (v21 <= v20)
      {
        _CUILog();
        v21 = *(_DWORD *)(a1 + 1068);
      }
      else
      {
        v24 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * v20 + 4);
        v25 = bswap32(v24);
        if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
          v24 = v25;
        if (v24 == -1)
        {
          BOMStorageFreeBlock(v19, v20);
          goto LABEL_39;
        }
      }
LABEL_26:
      if (v21 <= v20)
      {
        _CUILog();
        v26 = 0;
      }
      else
      {
        v26 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * v20 + 4);
        v27 = bswap32(v26);
        if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
          v26 = v27;
      }
      v28 = BOM_malloc(v26);
      if (BOMStorageCopyFromBlock(a1, v20, v28))
        goto LABEL_45;
      if (*(_DWORD *)(a1 + 1068) <= v20)
      {
        _CUILog();
        v33 = 0;
      }
      else
      {
        v33 = *(_DWORD *)(*(_QWORD *)(a1 + 1072) + 8 * v20 + 4);
        v34 = bswap32(v33);
        if ((*(_BYTE *)(a1 + 1052) & 1) == 0)
          v33 = v34;
      }
      if (BOMStorageCopyToBlock(v19, v20, v28, v33, v29, v30, v31, v32))
      {
LABEL_45:
        _CUILog();
        free(v28);
        goto LABEL_57;
      }
      free(v28);
LABEL_39:
      v20 = (v20 + 1);
    }
    while (v20 <= *(_DWORD *)(a1 + 1056));
  }
  if (*(_DWORD *)(a1 + 1096))
  {
    v35 = *(unsigned int *)(a1 + 1100);
    *(_DWORD *)(v19 + 1100) = v35;
    if ((_DWORD)v35)
    {
      v36 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v19 + 1088) + 48))(*(_QWORD *)(v19 + 1088), ((_DWORD)v35 + 15) & 0xFFFFFFF0, v18);
      if (!v36)
        v36 = (*(_DWORD *)(v19 + 1032) + 15) & 0xFFFFFFF0;
    }
    else
    {
      v36 = 0;
    }
    *(_DWORD *)(v19 + 1096) = v36;
    _ExpandMapAddress(v19, v36 + v35);
    memmove((void *)(*(_QWORD *)(v19 + 1040) + *(unsigned int *)(v19 + 1096)), (const void *)(*(_QWORD *)(a1 + 1040) + *(unsigned int *)(a1 + 1096)), v35);
    _AdjustFileSize(v19, v36, v35);
    if (*(_DWORD *)(v19 + 1028) != -1)
      _AddToWriteCache(v19, v36, v35);
    *(_DWORD *)(v19 + 1052) |= 0x10u;
  }
  BOMStorageCommit(v19);
  v37 = BOM_malloc(0x470uLL);
  if (!v37)
  {
    BOMStorageFree((_BYTE *)v19);
    v43 = __error();
    strerror(*v43);
LABEL_56:
    _CUILog();
    goto LABEL_57;
  }
  v38 = v37;
  memcpy(v37, (const void *)a1, 0x470uLL);
  BOMStorageFree(v38);
  if ((*(unsigned int (**)(_QWORD, char *, _BYTE *))(v2 + 88))(*(_QWORD *)(v2 + 8), __s, v55))
  {
    v39 = __error();
    strerror(*v39);
    _CUILog();
    BOMStorageFree((_BYTE *)v19);
    v40 = 1;
    v41 = (void *)BOMStorageOpenWithSys((uint64_t)v55, 1, (__int128 *)v2);
    if (v41)
    {
      v42 = v41;
      memcpy((void *)a1, v41, 0x470uLL);
      free(v42);
    }
  }
  else
  {
    if (v3 != -1)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 112))(*(_QWORD *)(v2 + 8), *(unsigned int *)(v19 + 1028), WORD2(v45));
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v2 + 120))(*(_QWORD *)(v2 + 8), *(unsigned int *)(v19 + 1028), v46, DWORD1(v46));
    }
    memcpy((void *)a1, (const void *)v19, 0x470uLL);
    __strlcpy_chk();
    free((void *)v19);
    return 0;
  }
  return v40;
}

uint64_t BOMStorageDumpFreeList(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 1088) + 64))();
}

uint64_t _BOMStoragePrintDiagnostics(uint64_t result)
{
  uint64_t v1;
  FILE **v2;

  if (result)
  {
    v1 = result;
    v2 = (FILE **)MEMORY[0x1E0C80C10];
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "   # blocks : %d\n", *(_DWORD *)(result + 1056));
    fprintf(*v2, "   adm size : %d\n", *(_DWORD *)(v1 + 1064));
    fprintf(*v2, "   bt size  : %d\n", (8 * *(_DWORD *)(v1 + 1068)) | 4);
    fprintf(*v2, "   fl size  : %d\n", *(_DWORD *)(*(_QWORD *)(v1 + 1088) + 8));
    return fprintf(*v2, "   toc size : %d\n", *(_DWORD *)(v1 + 1100));
  }
  return result;
}

uint64_t BOMStorageDump(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int UInt32;
  const char *v16;
  int v17;
  FILE **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int UInt8;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  FILE *v40;
  BOOL v41;
  BOOL v42;
  BOOL v43;
  uint64_t v49;
  const char *p_dst;
  unsigned int v51;
  uint64_t v52;
  int v54;
  __int128 __dst;
  __int16 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 1;
  v3 = *(unsigned int *)(a1 + 1096);
  if (!(_DWORD)v3)
    return 1;
  v5 = *(unsigned int *)(a1 + 1100);
  if (!(_DWORD)v5)
    return 1;
  v6 = BOMStreamWithAddress(*(_QWORD *)(a1 + 1040) + v3, v5, 0);
  if (!v6)
    return 2;
  v14 = v6;
  UInt32 = BOMStreamReadUInt32(v6, v7, v8, v9, v10, v11, v12, v13);
  v16 = "read/write";
  v17 = *(_DWORD *)(a1 + 1052);
  if ((v17 & 1) == 0)
    v16 = "readonly";
  if ((~v17 & 0x11) == 0)
    v16 = "read/write [dirty]";
  v18 = (FILE **)MEMORY[0x1E0C80C20];
  fprintf((FILE *)*MEMORY[0x1E0C80C20], "Storage: open %s (%u blocks)\n", v16, *(_DWORD *)(a1 + 1056));
  fprintf(*v18, "    ToC: %u entries (%u bytes)\n", UInt32, *(_DWORD *)(a1 + 1100));
  if (!UInt32)
  {
    v52 = 0;
    goto LABEL_66;
  }
  v54 = 0;
  do
  {
    v26 = BOMStreamReadUInt32(v14, v19, v20, v21, v22, v23, v24, v25);
    UInt8 = BOMStreamReadUInt8(v14, v27, v28, v29, v30, v31, v32, v33);
    BOMStreamReadBuffer(v14, &__dst, UInt8, v35, v36, v37, v38, v39);
    *((_BYTE *)&__dst + UInt8) = 0;
    BOMStorageSizeOfBlock(a1, v26);
    v40 = *v18;
    if ((a2 & 1) != 0)
      fprintf(v40, "    Bid: 0x%08x (%u) '%s' (%lu bytes)");
    else
      fprintf(v40, "    Bid: '%s' (%lu bytes)");
    if ((_QWORD)__dst == 0x6F666E496D6F42
      || ((_DWORD)__dst == 1752457552 ? (v41 = WORD2(__dst) == 115) : (v41 = 0),
          v41
       || (_QWORD)__dst == 0x7865646E494C48
       || ((_DWORD)__dst == 1684949334 ? (v42 = *(_DWORD *)((char *)&__dst + 3) == 7890276) : (v42 = 0),
           v42 || ((_DWORD)__dst == 1702521171 ? (v43 = *(_DWORD *)((char *)&__dst + 3) == 3421797) : (v43 = 0), v43))))
    {
      fwrite(" [BOM]\n", 7uLL, 1uLL, *v18);
      goto LABEL_50;
    }
    if ((_QWORD)__dst == 0x547463656A6F7250 && *((_QWORD *)&__dst + 1) == 0x656C6261546761)
    {
      fwrite(" [Metabom]\n", 0xBuLL, 1uLL, *v18);
      v54 |= 0x10u;
      v49 = a1;
      p_dst = "ProjectTagTable";
    }
    else if ((_QWORD)__dst == 0x546567616B636150 && *((_QWORD *)&__dst + 1) == 0x656C6261546761)
    {
      fwrite(" [Metabom]\n", 0xBuLL, 1uLL, *v18);
      v54 |= 0x20u;
      v49 = a1;
      p_dst = "PackageTagTable";
    }
    else
    {
      if ((_QWORD)__dst != 0x5467615468746150 || *(_QWORD *)((char *)&__dst + 5) != 0x656C6261546761)
      {
        if ((_QWORD)__dst == 0x547463656A6F7250 && *((_QWORD *)&__dst + 1) == 0x657254687461506FLL && v56 == 101)
        {
          fwrite(" [Metabom]\n", 0xBuLL, 1uLL, *v18);
          v54 |= 0x80u;
          v49 = a1;
          p_dst = "ProjectToPathTree";
          v51 = a2 | 0x1310000;
        }
        else
        {
          if ((v54 & 0x20) == 0)
          {
            fputc(10, *v18);
            goto LABEL_50;
          }
          fwrite(" [Package]\n", 0xBuLL, 1uLL, *v18);
          p_dst = (const char *)&__dst;
          v49 = a1;
          v51 = a2 | 0x230000;
        }
        goto LABEL_56;
      }
      fwrite(" [Metabom]\n", 0xBuLL, 1uLL, *v18);
      v54 |= 0x40u;
      v49 = a1;
      p_dst = "PathTagTable";
    }
    v51 = a2 | 0x210000;
LABEL_56:
    BOMStorageDumpTree(v49, p_dst, v51);
LABEL_50:
    --UInt32;
  }
  while (UInt32);
  v52 = 0;
  if ((v54 & 0xF0) != 0 && (v54 & 0xF0) != 0xF0)
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "WARNING: file appears to be a corrupt Metabom! (found %04x expected %04x or %04x)\n", v54 & 0xF0, 240, 0);
    v52 = 3;
  }
LABEL_66:
  BOMStreamFree(v14, v19, v20, v21, v22, v23, v24, v25);
  return v52;
}

uint64_t BOMStorageDumpBlock(uint64_t a1, const char *a2, unsigned int a3)
{
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  size_t v9;

  if (a1)
  {
    if (*(_DWORD *)(a1 + 1096))
    {
      if (*(_DWORD *)(a1 + 1100))
      {
        v6 = _tocGet(a1, a2);
        if (v6)
        {
          v7 = v6;
          v8 = BOMStorageSizeOfBlock(a1, v6);
          v9 = BOMStorageReadFromBlock(a1, v7);
          fprintf((FILE *)*MEMORY[0x1E0C80C20], "        %s ", a2);
          BOMValueDump(v9, v8, "        ", a3);
        }
      }
    }
  }
  return 1;
}

_DWORD *_newFreeListEntry(int a1, int a2)
{
  _DWORD *v4;
  _DWORD *v5;
  int *v6;

  v4 = BOM_malloc(0x10uLL);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)v4 = 0;
    v4[2] = a1;
    v4[3] = a2;
  }
  else
  {
    v6 = __error();
    strerror(*v6);
    _CUILog();
  }
  return v5;
}

uint64_t (*_WriteAddress(uint64_t a1, unsigned int a2, unsigned int a3))(_QWORD *)
{
  _QWORD *v3;
  void *v4;
  int *v6;

  v3 = BOMStreamWithFile(*(_DWORD *)(a1 + 1028), a2, a3, 1, (char *)(*(_QWORD *)(a1 + 1040) + a2));
  if (v3)
  {
    v4 = v3;
    BOMStreamFlush();
    return (uint64_t (*)(_QWORD *))BOMStreamFree(v4);
  }
  else
  {
    v6 = __error();
    return _BOMExceptionHandlerCall("Unable to create write stream.", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStorage.c", 2177, *v6);
  }
}

uint64_t BomSys_init(_QWORD *a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  v4 = BOM_malloc(0x80uLL);
  result = 0;
  v4[4] = xmmword_1E9768110;
  v4[5] = *(_OWORD *)&off_1E9768120;
  v4[6] = xmmword_1E9768130;
  v4[7] = *(_OWORD *)&off_1E9768140;
  *v4 = gDefaultSys;
  v4[1] = *(_OWORD *)&off_1E97680E0;
  v4[2] = xmmword_1E97680F0;
  v4[3] = *(_OWORD *)&off_1E9768100;
  *((_QWORD *)v4 + 1) = a2;
  *a1 = v4;
  return result;
}

void BomSys_free(void *a1)
{
  if (a1 != &gDefaultNOMMAPSys && a1 != 0 && a1 != &gDefaultSys)
    free(a1);
}

__int128 *BomSys_set_open(__int128 *result, uint64_t a2)
{
  BOOL v3;

  v3 = result == (__int128 *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(_QWORD *)result)
    return (__int128 *)_CUILog();
  if (a2)
    *((_QWORD *)result + 2) = a2;
  else
    *((_QWORD *)result + 2) = BomSys_open;
  return result;
}

uint64_t BomSys_open(int a1, char *a2, int a3, unsigned int a4)
{
  return open(a2, a3, a4);
}

__int128 *BomSys_set_close(__int128 *result, uint64_t a2)
{
  BOOL v3;

  v3 = result == (__int128 *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(_QWORD *)result)
    return (__int128 *)_CUILog();
  if (a2)
    *((_QWORD *)result + 3) = a2;
  else
    *((_QWORD *)result + 3) = BomSys_close;
  return result;
}

uint64_t BomSys_close(int a1, int a2)
{
  return close(a2);
}

__int128 *BomSys_set_fcntl(__int128 *result, uint64_t a2)
{
  BOOL v3;

  v3 = result == (__int128 *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(_QWORD *)result)
    return (__int128 *)_CUILog();
  if (a2)
    *((_QWORD *)result + 4) = a2;
  else
    *((_QWORD *)result + 4) = BomSys_fcntl;
  return result;
}

uint64_t BomSys_fcntl(int a1, int a2, int a3, uint64_t a4)
{
  return fcntl(a2, a3, a4);
}

__int128 *BomSys_set_read(__int128 *result, uint64_t a2)
{
  BOOL v3;

  v3 = result == (__int128 *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(_QWORD *)result)
    return (__int128 *)_CUILog();
  if (a2)
    *((_QWORD *)result + 5) = a2;
  else
    *((_QWORD *)result + 5) = BomSys_read;
  return result;
}

ssize_t BomSys_read(int a1, int a2, void *a3, size_t a4)
{
  return read(a2, a3, a4);
}

__int128 *BomSys_set_write(__int128 *result, uint64_t a2)
{
  BOOL v3;

  v3 = result == (__int128 *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(_QWORD *)result)
    return (__int128 *)_CUILog();
  if (a2)
    *((_QWORD *)result + 6) = a2;
  else
    *((_QWORD *)result + 6) = BomSys_write;
  return result;
}

ssize_t BomSys_write(int a1, int __fd, void *__buf, size_t __nbyte)
{
  return write(__fd, __buf, __nbyte);
}

__int128 *BomSys_set_lseek(__int128 *result, uint64_t a2)
{
  BOOL v3;

  v3 = result == (__int128 *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(_QWORD *)result)
    return (__int128 *)_CUILog();
  if (a2)
    *((_QWORD *)result + 7) = a2;
  else
    *((_QWORD *)result + 7) = BomSys_lseek;
  return result;
}

off_t BomSys_lseek(int a1, int a2, off_t a3, int a4)
{
  return lseek(a2, a3, a4);
}

__int128 *BomSys_set_fsync(__int128 *result, uint64_t a2)
{
  BOOL v3;

  v3 = result == (__int128 *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(_QWORD *)result)
    return (__int128 *)_CUILog();
  if (a2)
    *((_QWORD *)result + 8) = a2;
  else
    *((_QWORD *)result + 8) = BomSys_fsync;
  return result;
}

uint64_t BomSys_fsync(int a1, int a2)
{
  return fsync(a2);
}

__int128 *BomSys_set_fstat(__int128 *result, uint64_t a2)
{
  BOOL v3;

  v3 = result == (__int128 *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(_QWORD *)result)
    return (__int128 *)_CUILog();
  if (a2)
    *((_QWORD *)result + 9) = a2;
  else
    *((_QWORD *)result + 9) = BomSys_fstat;
  return result;
}

uint64_t BomSys_fstat(int a1, int a2, stat *a3)
{
  return fstat(a2, a3);
}

__int128 *BomSys_set_fstatfs(__int128 *result, uint64_t a2)
{
  BOOL v3;

  v3 = result == (__int128 *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(_QWORD *)result)
    return (__int128 *)_CUILog();
  if (a2)
    *((_QWORD *)result + 10) = a2;
  else
    *((_QWORD *)result + 10) = BomSys_fstatfs;
  return result;
}

uint64_t BomSys_fstatfs(int a1, int a2, statfs *a3)
{
  return fstatfs(a2, a3);
}

__int128 *BomSys_set_rename(__int128 *result, uint64_t a2)
{
  BOOL v3;

  v3 = result == (__int128 *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(_QWORD *)result)
    return (__int128 *)_CUILog();
  if (a2)
    *((_QWORD *)result + 11) = a2;
  else
    *((_QWORD *)result + 11) = BomSys_rename;
  return result;
}

void BomSys_rename(int a1, std::__fs::filesystem::path *__from, std::__fs::filesystem::path *__to)
{
  rename(__from, __to, (std::error_code *)__to);
}

__int128 *BomSys_set_mmap(__int128 *result, uint64_t a2)
{
  BOOL v3;

  v3 = result == (__int128 *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(_QWORD *)result)
    return (__int128 *)_CUILog();
  if (a2)
    *((_QWORD *)result + 12) = a2;
  else
    *((_QWORD *)result + 12) = BomSys_mmap;
  return result;
}

void *BomSys_mmap(int a1, void *a2, size_t a3, int a4, int a5, int a6, off_t a7)
{
  return mmap(a2, a3, a4, a5, a6, a7);
}

__int128 *BomSys_set_munmap(__int128 *result, uint64_t a2)
{
  BOOL v3;

  v3 = result == (__int128 *)&gDefaultNOMMAPSys || result == 0 || result == &gDefaultSys;
  if (v3 || *(_QWORD *)result)
    return (__int128 *)_CUILog();
  if (a2)
    *((_QWORD *)result + 13) = a2;
  else
    *((_QWORD *)result + 13) = BomSys_munmap;
  return result;
}

uint64_t BomSys_munmap(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

__int128 *BomSys_default()
{
  return &gDefaultSys;
}

void *BomSys_defaultNoMMAP()
{
  return &gDefaultNOMMAPSys;
}

uint64_t BomSys_fchmod(int a1, int a2, mode_t a3)
{
  return fchmod(a2, a3);
}

uint64_t BomSys_fchown(int a1, int a2, uid_t a3, gid_t a4)
{
  return fchown(a2, a3, a4);
}

void **BOMStackNew()
{
  void **v0;
  void **v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  char v13;

  v0 = (void **)BOM_calloc(1uLL, 0x18uLL);
  v1 = v0;
  if (v0)
  {
    v0[1] = (void *)1024;
    v2 = BOM_malloczero(0x2000uLL);
    *v1 = v2;
    if (!v2)
    {
      BOMStackFree(v1);
      v11 = BOMExceptionHandlerMessage("Allocating BOMStack failed", v4, v5, v6, v7, v8, v9, v10, v13);
      v12 = __error();
      _BOMFatalException(v11, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMStack.c", 38, *v12);
    }
  }
  return v1;
}

void BOMStackFree(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      free(v2);
    free(a1);
  }
}

uint64_t *BOMStackPop(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v1 = *result;
    if (*result && (v2 = result[2]) != 0)
    {
      v3 = v2 - 1;
      result[2] = v3;
      result = *(uint64_t **)(v1 + 8 * v3);
      *(_QWORD *)(v1 + 8 * v3) = 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_QWORD *BOMStackPeek(_QWORD *result)
{
  uint64_t v1;

  if (result)
  {
    if (*result && (v1 = result[2]) != 0)
      return *(_QWORD **)(*result + 8 * v1 - 8);
    else
      return 0;
  }
  return result;
}

char *BOMStackPush(char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int *v22;
  char *v23;
  int *v24;
  char v25;

  if (result)
  {
    v8 = result;
    result = *(char **)result;
    if (result)
    {
      v11 = v8[1];
      v10 = v8[2];
      v12 = v10 + 1;
      if (v10 + 1 >= v11)
      {
        if (v11 == 0xFFFFFFF)
        {
          v21 = BOMExceptionHandlerMessage("BOMStack is full can't grow anymore", a2, a3, a4, a5, a6, a7, a8, v25);
          v22 = __error();
          _BOMFatalException(v21, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMStack.c", 103, *v22);
        }
        v13 = 2 * v11;
        if (2 * v11 >= 0xFFFFFFF)
          v13 = 0xFFFFFFFLL;
        v8[1] = v13;
        result = BOM_realloczero(result, 8 * v11, 8 * v13);
        *v8 = result;
        if (!result)
        {
          v23 = BOMExceptionHandlerMessage("BOMStack got blown", v14, v15, v16, v17, v18, v19, v20, v25);
          v24 = __error();
          _BOMFatalException(v23, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMStack.c", 122, *v24);
        }
        v10 = v8[2];
        v12 = v10 + 1;
      }
      v8[2] = v12;
      *(_QWORD *)&result[8 * v10] = a2;
    }
  }
  return result;
}

BOOL BOMStackIsEmpty(uint64_t a1)
{
  return !a1 || !*(_QWORD *)a1 || *(_DWORD *)(a1 + 16) < 1;
}

uint64_t BOMStackCount(uint64_t result)
{
  if (result)
  {
    if (*(_QWORD *)result)
      return *(unsigned int *)(result + 16);
    else
      return 0;
  }
  return result;
}

uint64_t BOMCFArrayMaxRange(const __CFArray *a1)
{
  CFArrayGetCount(a1);
  return 0;
}

uint64_t BOMExceptionHandlerSet(void *a1)
{
  uint64_t result;

  if (__BOMExceptionHandlerKey___onceHandler != -1)
    dispatch_once(&__BOMExceptionHandlerKey___onceHandler, &__block_literal_global_15);
  result = pthread_setspecific(__BOMExceptionHandlerKey___key, a1);
  if ((_DWORD)result)
    return _CUILog();
  return result;
}

uint64_t BOMExceptionHandlerSetDefault()
{
  return BOMExceptionHandlerSet(__defaultHandler);
}

uint64_t __defaultHandler(uint64_t a1)
{
  uint64_t result;

  result = _CUILog();
  if (*(_BYTE *)(a1 + 8))
    abort();
  return result;
}

void _BOMFatalException(void *a1, const char *a2, int a3, int a4)
{
  uint64_t (*v8)(uint64_t);
  uint64_t (*v9)(uint64_t);
  const char *v10;
  _QWORD v11[3];
  int v12;
  int v13;

  v8 = (uint64_t (*)(uint64_t))__BOMGlobalExceptionHandler();
  if (!a1)
    a1 = __BOMExceptionMessageString();
  v9 = __defaultHandler;
  if (v8)
    v9 = v8;
  v11[0] = a1;
  v11[1] = 1;
  if (a2)
    v10 = a2;
  else
    v10 = "";
  v11[2] = v10;
  v12 = a3;
  v13 = a4;
  v9((uint64_t)v11);
  abort();
}

void *__BOMGlobalExceptionHandler()
{
  if (__BOMExceptionHandlerKey___onceHandler != -1)
    dispatch_once(&__BOMExceptionHandlerKey___onceHandler, &__block_literal_global_15);
  return pthread_getspecific(__BOMExceptionHandlerKey___key);
}

void *__BOMExceptionMessageString()
{
  void *v0;

  if (__BOMExceptionMessageString___onceMessage != -1)
    dispatch_once(&__BOMExceptionMessageString___onceMessage, &__block_literal_global_5_0);
  v0 = pthread_getspecific(__BOMExceptionMessageString___key);
  if (!v0)
  {
    v0 = malloc_type_calloc(0x1000uLL, 1uLL, 0x100004077774924uLL);
    __CFSetLastAllocationEventName();
    if (pthread_setspecific(__BOMExceptionMessageString___key, v0))
      _CUILog();
  }
  return v0;
}

uint64_t (*_BOMExceptionHandlerCall(void *a1, unsigned __int8 a2, const char *a3, int a4, int a5))(_QWORD *)
{
  uint64_t (*result)(_QWORD *);
  uint64_t (*v11)(_QWORD *);
  const char *v12;
  _QWORD v13[3];
  int v14;
  int v15;

  result = (uint64_t (*)(_QWORD *))__BOMGlobalExceptionHandler();
  if (result)
  {
    v11 = result;
    if (!a1)
      a1 = __BOMExceptionMessageString();
    v13[0] = a1;
    v12 = "";
    v13[1] = a2;
    if (a3)
      v12 = a3;
    v13[2] = v12;
    v14 = a4;
    v15 = a5;
    return (uint64_t (*)(_QWORD *))v11(v13);
  }
  return result;
}

char *BOMExceptionHandlerMessage(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v10;

  v10 = (char *)__BOMExceptionMessageString();
  vsnprintf(v10, 0x1000uLL, a1, &a9);
  return v10;
}

void *BOM_malloc(size_t a1)
{
  char v1;
  void *v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;

  v1 = a1;
  v2 = malloc_type_malloc(a1, 0x1607F7D5uLL);
  if (v2)
  {
    __CFSetLastAllocationEventName();
  }
  else
  {
    v3 = __error();
    strerror(*v3);
    v11 = BOMExceptionHandlerMessage("BOM_malloc: (%zd bytes) %s\n", v4, v5, v6, v7, v8, v9, v10, v1);
    v12 = __error();
    _BOMExceptionHandlerCall(v11, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMSystemCmds.c", 24, *v12);
  }
  return v2;
}

void *BOM_malloczero(size_t size)
{
  char v1;
  void *v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;

  v1 = size;
  v2 = malloc_type_calloc(1uLL, size, 0x83655E9DuLL);
  if (v2)
  {
    __CFSetLastAllocationEventName();
  }
  else
  {
    v3 = __error();
    strerror(*v3);
    v11 = BOMExceptionHandlerMessage("BOM_malloczero: (%zd bytes) %s\n", v4, v5, v6, v7, v8, v9, v10, v1);
    v12 = __error();
    _BOMExceptionHandlerCall(v11, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMSystemCmds.c", 37, *v12);
  }
  return v2;
}

void *BOM_calloc(size_t a1, size_t a2)
{
  char v2;
  void *v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int *v13;

  v2 = a2;
  v3 = malloc_type_calloc(a1, a2, 0x561175E7uLL);
  if (v3)
  {
    __CFSetLastAllocationEventName();
  }
  else
  {
    v4 = __error();
    strerror(*v4);
    v12 = BOMExceptionHandlerMessage("BOM_calloc: (%zd bytes) %s\n", v5, v6, v7, v8, v9, v10, v11, v2);
    v13 = __error();
    _BOMExceptionHandlerCall(v12, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMSystemCmds.c", 54, *v13);
  }
  return v3;
}

void *BOM_realloc(void *a1, size_t a2)
{
  char v2;
  void *v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int *v13;

  v2 = a2;
  v3 = reallocf(a1, a2);
  if (v3)
  {
    __CFSetLastAllocationEventName();
  }
  else
  {
    v4 = __error();
    strerror(*v4);
    v12 = BOMExceptionHandlerMessage("BOM_realloc: (%zd bytes) %s\n", v5, v6, v7, v8, v9, v10, v11, v2);
    v13 = __error();
    _BOMExceptionHandlerCall(v12, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMSystemCmds.c", 70, *v13);
  }
  return v3;
}

char *BOM_realloczero(void *a1, unint64_t a2, size_t __size)
{
  char *v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int *v15;

  v5 = (char *)reallocf(a1, __size);
  if (v5)
  {
    __CFSetLastAllocationEventName();
    if (__size > a2)
      bzero(&v5[a2], __size - a2);
  }
  else
  {
    v6 = __error();
    strerror(*v6);
    v14 = BOMExceptionHandlerMessage("BOM_realloczero: (%zd bytes) %s\n", v7, v8, v9, v10, v11, v12, v13, __size);
    v15 = __error();
    _BOMExceptionHandlerCall(v14, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Common/BOMSystemCmds.c", 85, *v15);
  }
  return v5;
}

_DWORD *_BOMFreeListAllocate()
{
  _QWORD *v0;
  _DWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;

  v0 = BOM_malloc(0x48uLL);
  v1 = v0;
  if (v0)
  {
    v0[2] = _dense_initialize;
    v0[3] = _dense_serialize;
    v0[4] = _dense_deallocate;
    v0[5] = _dense_addFreeRange;
    v0[6] = _dense_allocateRange;
    v0[7] = _dense_clear;
    v0[8] = _dense_print;
    v2 = BOM_malloc(0x18uLL);
    if (v2)
    {
      v3 = v2;
      v4 = BOM_calloc(0x20uLL, 8uLL);
      *v3 = v4;
      if (v4)
      {
        v3[1] = 0;
        *((_DWORD *)v3 + 4) = 32;
        *(_QWORD *)v1 = v3;
        v1[2] = 0;
        return v1;
      }
      free(v1);
      v5 = v3;
    }
    else
    {
      v5 = v1;
    }
    free(v5);
    return 0;
  }
  return v1;
}

uint64_t _dense_initialize(uint64_t result, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;

  if ((a3 & 7) == 0 && (int)(a3 >> 3) >= 1)
  {
    v5 = result;
    v6 = (a3 >> 3);
    v7 = (unsigned int *)(a2 + 4);
    do
    {
      v8 = *(v7 - 1);
      v9 = bswap32(v8);
      v10 = bswap32(*v7);
      if (a4)
        v11 = v9;
      else
        v11 = v8;
      if (a4)
        v12 = v10;
      else
        v12 = *v7;
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(v5, v11, v12);
      v7 += 2;
      --v6;
    }
    while (v6);
  }
  return result;
}

_DWORD *_dense_serialize(uint64_t **a1, int a2, size_t *a3)
{
  uint64_t *v4;
  size_t v5;
  _DWORD *result;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t *v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t *v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;

  v4 = *a1;
  v5 = 8 * *((int *)a1 + 2);
  *a3 = v5;
  result = BOM_malloc(v5);
  if (result)
  {
    v7 = *((_DWORD *)v4 + 4);
    if (v7 < 1)
    {
      v9 = 0;
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v10 = *v4;
      do
      {
        v11 = *(uint64_t **)(v10 + 8 * v8);
        if (v11)
        {
          v12 = 2 * v9;
          do
          {
            v13 = *((_DWORD *)v11 + 2);
            v14 = *((_DWORD *)v11 + 3);
            v15 = bswap32(v13);
            v16 = bswap32(v14);
            if (a2)
            {
              v13 = v15;
              v14 = v16;
            }
            result[v12] = v13;
            result[v12 + 1] = v14;
            v11 = (uint64_t *)*v11;
            v12 += 2;
            ++v9;
          }
          while (v11);
          v7 = *((_DWORD *)v4 + 4);
        }
        ++v8;
      }
      while (v8 < v7);
    }
    v17 = (uint64_t *)v4[1];
    if (v17)
    {
      v18 = 2 * v9;
      do
      {
        v19 = *((_DWORD *)v17 + 2);
        v20 = *((_DWORD *)v17 + 3);
        v21 = bswap32(v19);
        v22 = bswap32(v20);
        if (a2)
          v19 = v21;
        result[v18] = v19;
        if (a2)
          v23 = v22;
        else
          v23 = v20;
        result[v18 + 1] = v23;
        v17 = (uint64_t *)*v17;
        v18 += 2;
      }
      while (v17);
    }
  }
  return result;
}

void _dense_deallocate(uint64_t a1)
{
  void **v2;

  v2 = *(void ***)a1;
  (*(void (**)(void))(a1 + 56))();
  free(*v2);
  free(v2);
  *(_QWORD *)a1 = 0;
}

_QWORD *_dense_clear(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t i;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *result;
  _QWORD *v7;

  v1 = *a1;
  v2 = *(_DWORD *)(*a1 + 16);
  if (v2 >= 1)
  {
    for (i = 0; i < v2; ++i)
    {
      v4 = *(_QWORD **)(*(_QWORD *)v1 + 8 * i);
      *(_QWORD *)(*(_QWORD *)v1 + 8 * i) = 0;
      if (v4)
      {
        do
        {
          v5 = (_QWORD *)*v4;
          free(v4);
          v4 = v5;
        }
        while (v5);
        v2 = *(_DWORD *)(v1 + 16);
      }
    }
  }
  result = *(_QWORD **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;
  if (result)
  {
    do
    {
      v7 = (_QWORD *)*result;
      free(result);
      result = v7;
    }
    while (v7);
  }
  return result;
}

_DWORD *_dense_addFreeRange(_DWORD *result, int a2, unint64_t a3)
{
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  char *v10;
  uint64_t v11;

  if (a3)
  {
    v5 = result;
    v6 = *(_QWORD *)result;
    if (a3 < 0x10000)
    {
      v8 = *(int *)(v6 + 16);
      if (v8 <= a3)
      {
        v9 = a3 + 1;
        v10 = (char *)BOM_realloc(*(void **)v6, (8 * (a3 + 1)));
        *(_QWORD *)v6 = v10;
        if ((int)v8 <= (int)a3)
          bzero(&v10[8 * *(int *)(v6 + 16)], 8 * (v9 - (int)v8));
        *(_DWORD *)(v6 + 16) = v9;
        v6 = *(_QWORD *)v5;
      }
      v11 = *(_QWORD *)(*(_QWORD *)v6 + 8 * a3);
      result = BOM_malloc(0x10uLL);
      result[2] = a2;
      result[3] = a3;
      *(_QWORD *)result = v11;
      *(_QWORD *)(*(_QWORD *)v6 + 8 * a3) = result;
    }
    else
    {
      v7 = *(_QWORD *)(v6 + 8);
      result = BOM_malloc(0x10uLL);
      result[2] = a2;
      result[3] = a3;
      *(_QWORD *)result = v7;
      *(_QWORD *)(v6 + 8) = result;
    }
    ++v5[2];
  }
  return result;
}

uint64_t _dense_allocateRange(uint64_t a1, unint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  void **v13;
  _QWORD *v14;
  void **v15;
  unint64_t v16;
  void **v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v4 = *(_QWORD **)a1;
  v5 = *(int *)(*(_QWORD *)a1 + 16);
  if (v5 > a2)
  {
    v6 = *(unsigned int **)(*v4 + 8 * a2);
    if (v6)
    {
      v7 = v6[2];
      v8 = *(_QWORD *)v6;
      free(v6);
      *(_QWORD *)(*v4 + 8 * a2) = v8;
      --*(_DWORD *)(a1 + 8);
      return v7;
    }
  }
  LODWORD(v9) = 0;
  while (1)
  {
    v10 = (a2 + 1 + v9);
    if (v10 >= v5)
      break;
    v11 = *(unsigned int **)(*v4 + 8 * v10);
    v9 = (v9 + 1);
    if (v11)
    {
      v7 = v11[2];
      v12 = *(_QWORD *)v11;
      free(v11);
      *(_QWORD *)(*v4 + 8 * v10) = v12;
      --*(_DWORD *)(a1 + 8);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(a1 + 40))(a1, (v7 + a2), v9);
      return v7;
    }
  }
  v15 = (void **)v4[1];
  v14 = v4 + 1;
  v13 = v15;
  if (!v15)
    return 0;
  v16 = *((unsigned int *)v13 + 3);
  if (v16 < a2)
  {
    while (1)
    {
      v17 = v13;
      v13 = (void **)*v13;
      if (!v13)
        return 0;
      v16 = *((unsigned int *)v13 + 3);
      if (v16 >= a2)
        goto LABEL_15;
    }
  }
  v17 = 0;
LABEL_15:
  v18 = (void **)*v13;
  v7 = *((unsigned int *)v13 + 2);
  v19 = (v7 + a2);
  v20 = (v16 - a2);
  free(v13);
  if (v17)
    v21 = v17;
  else
    v21 = v14;
  *v21 = v18;
  --*(_DWORD *)(a1 + 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 40))(a1, v19, v20);
  return v7;
}

uint64_t _dense_print(uint64_t result, FILE *__stream, int a3)
{
  uint64_t v5;
  int v6;
  uint64_t i;
  _QWORD *v8;
  int v9;
  const char *v10;
  uint64_t *v11;
  int v12;
  const char *v13;

  v5 = *(_QWORD *)result;
  v6 = *(_DWORD *)(*(_QWORD *)result + 16);
  if (v6 >= 1)
  {
    for (i = 0; i < v6; ++i)
    {
      v8 = *(_QWORD **)(*(_QWORD *)v5 + 8 * i);
      if (v8)
      {
        v9 = 0;
        do
        {
          ++v9;
          v8 = (_QWORD *)*v8;
        }
        while (v8);
        if (v9 == 1)
          v10 = "y";
        else
          v10 = "ies";
        result = fprintf(__stream, "Size %d: %d entr%s\n", i, v9, v10);
        v6 = *(_DWORD *)(v5 + 16);
      }
    }
  }
  v11 = *(uint64_t **)(v5 + 8);
  if (v11)
  {
    if (a3)
      fwrite("Large sizes:\n\t", 0xEuLL, 1uLL, __stream);
    v12 = 1;
    if (!a3)
      goto LABEL_17;
    while (1)
    {
      fprintf(__stream, "%d ", *((_DWORD *)v11 + 3));
      v11 = (uint64_t *)*v11;
      if (!v11)
        break;
      while (1)
      {
        ++v12;
        if (a3)
          break;
LABEL_17:
        v11 = (uint64_t *)*v11;
        if (!v11)
        {
          v13 = "ies";
          if (v12 == 1)
            v13 = "y";
          return fprintf(__stream, "Large sizes: %d entr%s\n", v12, v13);
        }
      }
    }
    return fputc(10, __stream);
  }
  return result;
}

_DWORD *BOMTreeNewWithName(uint64_t a1, const char *a2)
{
  unsigned int v4;

  if (a1 && a2 && (v4 = BOMStorageNewNamedBlock(a1, a2)) != 0)
    return _BOMTreeNew(a1, a2, v4, 0, 0);
  else
    return 0;
}

_DWORD *_BOMTreeNew(uint64_t a1, const char *a2, unsigned int a3, int a4, char a5)
{
  _DWORD *result;
  uint64_t v11;
  int v12;
  unsigned int v13;
  _QWORD *v14;

  result = _newBOMTree(a1, a2);
  if (result)
  {
    v11 = (uint64_t)result;
    result[4] = a3;
    if ((a4 - 1) >= 0x2F)
      v12 = a4;
    else
      v12 = 48;
    if (!v12)
      v12 = 4096;
    result[76] = v12;
    v13 = v12 - 16;
    result[77] = v13 >> 3;
    result[78] = (v13 >> 3) + 1;
    result[79] = v13 >> 4;
    result[89] = result[89] & 0xFFFFFFFB | (4 * (a5 & 1));
    v14 = _NewPage((uint64_t)result, 0);
    *(_QWORD *)(v11 + 24) = v14;
    *((_WORD *)v14 + 2) |= 1u;
    *(_DWORD *)(v11 + 356) |= 1u;
    BOMTreeFree(v11);
    return (_DWORD *)_BOMTreeOpen(a1, a2, a3, 1);
  }
  return result;
}

_DWORD *BOMTreeNewWithOptions(uint64_t a1, unsigned int a2, const char *a3, int a4, char a5)
{
  unsigned int v8;

  if (a1 && ((v8 = a2) != 0 || a3) && (a2 || (v8 = BOMStorageNewNamedBlock(a1, a3)) != 0))
    return _BOMTreeNew(a1, a3, v8, a4, a5);
  else
    return 0;
}

uint64_t BOMTreeOpenWithName(uint64_t a1, const char *a2, char a3)
{
  unsigned int NamedBlock;

  if (a1 && a2 && (NamedBlock = BOMStorageGetNamedBlock(a1, a2)) != 0)
    return _BOMTreeOpen(a1, a2, NamedBlock, a3);
  else
    return 0;
}

uint64_t _BOMTreeOpen(uint64_t a1, const char *a2, unsigned int a3, char a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int UInt32;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v7 = _newBOMTree(a1, a2);
  v8 = (uint64_t)v7;
  if (v7)
  {
    *v7 = a1;
    *((_DWORD *)v7 + 4) = a3;
    v9 = BOMStorageSizeOfBlock(a1, a3);
    v10 = *(_QWORD *)v8;
    if ((*(_BYTE *)(v8 + 356) & 0x40) != 0)
    {
      v19 = BOMStorageReadFromBlock(v10, a3);
      if (!v19)
        goto LABEL_16;
      v20 = (void *)v19;
      v18 = BOMStreamWithAddress(v19, v9, 0);
      madvise(v20, v9, 3);
      if (!v18)
        goto LABEL_16;
    }
    else
    {
      v18 = BOMStreamWithBlockID(v10, a3, v9, 0);
      if (!v18)
        goto LABEL_16;
    }
    if (BOMStreamReadUInt32(v18, v11, v12, v13, v14, v15, v16, v17) != 1953654117
      || BOMStreamReadUInt32(v18, v21, v22, v23, v24, v25, v26, v27) != 1)
    {
      _CUILog();
      BOMStreamFree(v18, v80, v81, v82, v83, v84, v85, v86);
LABEL_16:
      BOMTreeFree(v8);
      return 0;
    }
    UInt32 = BOMStreamReadUInt32(v18, v28, v29, v30, v31, v32, v33, v34);
    *(_DWORD *)(v8 + 304) = BOMStreamReadUInt32(v18, v36, v37, v38, v39, v40, v41, v42);
    *(_DWORD *)(v8 + 20) = BOMStreamReadUInt32(v18, v43, v44, v45, v46, v47, v48, v49);
    *(_DWORD *)(v8 + 356) = *(_DWORD *)(v8 + 356) & 0xFFFFFFFB | (4
                                                                * (BOMStreamReadUInt8(v18, v50, v51, v52, v53, v54, v55, v56) & 1));
    if (!BOMStreamAtEOF(v18, v57, v58, v59, v60, v61, v62, v63))
    {
      *(_DWORD *)(v8 + 348) = BOMStreamReadUInt32(v18, v64, v65, v66, v67, v68, v69, v70);
      if (!BOMStreamAtEOF(v18, v71, v72, v73, v74, v75, v76, v77))
        *(_DWORD *)(v8 + 352) = BOMStreamReadUInt32(v18, v64, v65, v66, v67, v68, v69, v70);
    }
    BOMStreamFree(v18, v64, v65, v66, v67, v68, v69, v70);
    v78 = *(_DWORD *)(v8 + 304) - 16;
    *(_DWORD *)(v8 + 308) = v78 >> 3;
    *(_DWORD *)(v8 + 312) = (v78 >> 3) + 1;
    *(_DWORD *)(v8 + 316) = v78 >> 4;
    v79 = _NewPage(v8, UInt32);
    *(_QWORD *)(v8 + 24) = v79;
    if (!v79 || _ReadPage(v8, (uint64_t)v79))
      goto LABEL_16;
    *(_DWORD *)(v8 + 356) = *(_DWORD *)(v8 + 356) & 0xFFFFFFFD | (2 * (a4 & 1));
  }
  return v8;
}

uint64_t BOMTreeFree(uint64_t result)
{
  uint64_t v1;
  uint64_t i;
  _WORD *v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;

  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 356) & 1) != 0 && BOMTreeCommit(result))
    {
      return 1;
    }
    else
    {
      for (i = 32; i != 288; i += 8)
      {
        v3 = *(_WORD **)(v1 + i);
        if (v3)
        {
          if ((v3[2] & 2) != 0)
            _WritePage(v1, *(_QWORD *)(v1 + i));
          _FreePage(v1, v3);
          *(_QWORD *)(v1 + i) = 0;
        }
      }
      _FreePage(v1, *(void **)(v1 + 24));
      *(_QWORD *)(v1 + 24) = 0;
      v4 = *(void **)(v1 + 8);
      if (v4 && (*(_BYTE *)(v1 + 356) & 0x20) != 0)
      {
        free(v4);
        *(_QWORD *)(v1 + 8) = 0;
      }
      v5 = *(const void **)(v1 + 296);
      if (v5)
      {
        CFRelease(v5);
        *(_QWORD *)(v1 + 296) = 0;
      }
      v6 = *(void **)(v1 + 336);
      if (v6)
      {
        free(v6);
        *(_QWORD *)(v1 + 336) = 0;
      }
      v7 = *(void **)(v1 + 320);
      if (v7)
        free(v7);
      free((void *)v1);
      return 0;
    }
  }
  return result;
}

uint64_t BOMTreeCommit(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v5;
  uint64_t (*v6)(_QWORD *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(_QWORD *);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  if (!a1 || (*(_BYTE *)(a1 + 356) & 1) == 0)
    return 0;
  for (i = 32; i != 288; i += 8)
  {
    v5 = *(_QWORD *)(a1 + i);
    if (v5 && (*(_WORD *)(v5 + 4) & 2) != 0)
      _WritePage(a1, v5);
  }
  _WritePage(a1, *(_QWORD *)(a1 + 24));
  v2 = 1;
  v6 = (uint64_t (*)(_QWORD *))BOMStreamWithBlockID(*(_QWORD *)a1, *(_DWORD *)(a1 + 16), 0x1DuLL, 1);
  if (v6)
  {
    v13 = v6;
    BOMStreamWriteUInt32(v6, 1953654117, v7, v8, v9, v10, v11, v12);
    BOMStreamWriteUInt32(v13, 1, v14, v15, v16, v17, v18, v19);
    BOMStreamWriteUInt32(v13, **(unsigned int **)(a1 + 24), v20, v21, v22, v23, v24, v25);
    BOMStreamWriteUInt32(v13, *(unsigned int *)(a1 + 304), v26, v27, v28, v29, v30, v31);
    BOMStreamWriteUInt32(v13, *(unsigned int *)(a1 + 20), v32, v33, v34, v35, v36, v37);
    BOMStreamWriteUInt8(v13, (*(unsigned __int8 *)(a1 + 356) >> 2) & 1, v38, v39, v40, v41, v42, v43);
    if ((*(_BYTE *)(a1 + 356) & 4) != 0)
      v50 = 0;
    else
      v50 = *(unsigned int *)(a1 + 348);
    BOMStreamWriteUInt32(v13, v50, v44, v45, v46, v47, v48, v49);
    BOMStreamWriteUInt32(v13, 0, v51, v52, v53, v54, v55, v56);
    if (!BOMStreamFree((uint64_t)v13, v57, v58, v59, v60, v61, v62, v63))
    {
      v2 = 0;
      *(_DWORD *)(a1 + 356) &= ~1u;
    }
  }
  return v2;
}

void _FreePage(uint64_t a1, void *a2)
{
  if (a2)
  {
    *(_DWORD *)a2 = -1;
    *((_QWORD *)a2 + 1) = -1;
    *((_QWORD *)a2 + 4) = 0;
    if ((*(_BYTE *)(a1 + 356) & 0x40) == 0)
      free(*((void **)a2 + 3));
    free(a2);
  }
}

uint64_t BOMTreeRemoveAndFree(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  size_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const void *v37;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)result;
    v3 = BOMTreeIteratorNew(result, 0, 0, 0);
    if (v3)
    {
      for (i = v3;
            !BOMTreeIteratorIsAtEnd((uint64_t)i, v4, v5, v6, v7, v8, v9, v10);
            BOMTreeIteratorNext((uint64_t)i, v28, v29, v30, v31, v32, v33, v34))
      {
        v19 = (void *)BOMTreeIteratorKey((uint64_t)i, v12, v13, v14, v15, v16, v17, v18);
        v27 = BOMTreeIteratorKeySize((uint64_t)i, v20, v21, v22, v23, v24, v25, v26);
        BOMTreeRemoveValue(v1, v19, v27);
      }
      BOMTreeIteratorFree(i);
      BOMStorageFreeBlock(v2, **(_DWORD **)(v1 + 24));
      _FreePage(v1, *(void **)(v1 + 24));
      *(_QWORD *)(v1 + 24) = 0;
      v35 = *(const char **)(v1 + 8);
      if (v35)
        BOMStorageFreeNamedBlock(v2, v35);
      else
        BOMStorageFreeBlock(v2, *(_DWORD *)(v1 + 16));
      v36 = *(void **)(v1 + 8);
      if (v36 && (*(_BYTE *)(v1 + 356) & 0x20) != 0)
      {
        free(v36);
        *(_QWORD *)(v1 + 8) = 0;
      }
      v37 = *(const void **)(v1 + 296);
      if (v37)
        CFRelease(v37);
      free((void *)v1);
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

_QWORD *BOMTreeIteratorNew(uint64_t a1, void *a2, size_t a3, BOOL *a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  const __CFArray *v14;
  CFIndex v15;
  CFIndex v16;
  CFIndex v17;
  __CFArray *Mutable;
  int *v19;
  CFRange v21;

  v8 = BOM_malloczero(0x40uLL);
  v13 = v8;
  if (!v8)
    return v13;
  *v8 = a1;
  BOMTreeIteratorSet((uint64_t)v8, a2, a3, a4, v9, v10, v11, v12);
  v14 = *(const __CFArray **)(a1 + 296);
  if (!v14)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    *(_QWORD *)(a1 + 296) = Mutable;
    if (!Mutable)
    {
      v19 = __error();
      _BOMExceptionHandlerCall("Out of memory.", 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 2679, *v19);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  v15 = BOMCFArrayMaxRange(v14);
  v17 = v16;
  v21.location = v15;
  v21.length = v17;
  if (!CFArrayContainsValue(*(CFArrayRef *)(a1 + 296), v21, v13))
  {
    Mutable = *(__CFArray **)(a1 + 296);
LABEL_6:
    CFArrayAppendValue(Mutable, v13);
  }
LABEL_8:
  if ((*(_BYTE *)(*v13 + 356) & 4) == 0)
    v13[3] = BOM_malloc(v13[4]);
  v13[5] = BOM_malloc(v13[6]);
  return v13;
}

uint64_t BOMTreeIteratorIsAtEnd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;
  _DWORD *v10;
  int v11;

  if (!a1)
    return 1;
  v9 = *(unsigned __int8 *)(a1 + 57);
  if ((v9 & 8) != 0)
    return 1;
  if ((v9 & 1) != 0 || (v10 = *(_DWORD **)(a1 + 8)) == 0 || *v10 != *(_DWORD *)(a1 + 16))
  {
    v11 = _revalidateIterator(a1, a2, a3, a4, a5, a6, a7, a8);
    v9 = *(unsigned __int8 *)(a1 + 57);
    if (!v11)
    {
      v9 |= 8u;
      *(_BYTE *)(a1 + 57) = v9;
    }
  }
  return (v9 >> 3) & 1;
}

uint64_t BOMTreeIteratorKey(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  size_t v18;
  uint64_t v19;
  unsigned int v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;

  if (result)
  {
    v8 = result;
    if ((*(_BYTE *)(result + 57) & 8) != 0)
      return 0;
    if (((*(_BYTE *)(result + 57) & 1) != 0 || (v9 = *(_DWORD **)(result + 8)) == 0
                                             || *v9 != *(_DWORD *)(result + 16))
      && !_revalidateIterator(result, a2, a3, a4, a5, a6, a7, a8))
    {
      result = 0;
      *(_BYTE *)(v8 + 57) |= 8u;
      return result;
    }
    v10 = *(_QWORD *)v8;
    v11 = *(_DWORD *)(*(_QWORD *)v8 + 356);
    if ((v11 & 4) == 0)
    {
      if ((*(_BYTE *)(v8 + 57) & 2) != 0)
        return *(_QWORD *)(v8 + 24);
      if ((v11 & 0x40) != 0)
      {
        v15 = *(unsigned int *)(v10 + 348);
        if ((int)v15 >= 1)
        {
LABEL_18:
          v16 = *(_QWORD *)(v8 + 32);
          if (v15 > v16)
          {
            v17 = *(void **)(v8 + 24);
            if (v17)
            {
              free(v17);
              *(_QWORD *)(v8 + 24) = 0;
              v16 = *(_QWORD *)(v8 + 32);
            }
            if (v15 <= 2 * v16)
              v18 = 2 * v16;
            else
              v18 = v15;
            *(_QWORD *)(v8 + 32) = v18;
            *(_QWORD *)(v8 + 24) = BOM_malloc(v18);
          }
          v19 = *(_QWORD *)v8;
          if ((*(_BYTE *)(*(_QWORD *)v8 + 356) & 0x40) == 0)
          {
            v20 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20) + 4);
            goto LABEL_31;
          }
          v21 = *(unsigned int *)(v19 + 348);
          v22 = *(_QWORD *)(v8 + 8);
          if ((int)v21 < 1)
          {
            v20 = bswap32(*(_DWORD *)(*(_QWORD *)(v22 + 24) + 8 * *(int *)(v8 + 20) + 4));
LABEL_31:
            if (BOMStorageCopyFromBlock(*(_QWORD *)v19, v20, *(void **)(v8 + 24)))
              return 0;
            goto LABEL_34;
          }
          v23 = *(_QWORD *)(v22 + 32);
          if (v23)
          {
            memcpy(*(void **)(v8 + 24), (const void *)(v23 + *(int *)(v8 + 20) * v21), v21);
LABEL_34:
            *(_BYTE *)(v8 + 57) |= 2u;
            return *(_QWORD *)(v8 + 24);
          }
          return 0;
        }
        v12 = bswap32(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20) + 4));
      }
      else
      {
        v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20) + 4);
      }
      v15 = BOMStorageSizeOfBlock(*(_QWORD *)v10, v12);
      goto LABEL_18;
    }
    v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20) + 4);
    v14 = bswap32(v13);
    if ((v11 & 0x40) != 0)
      return v14;
    else
      return v13;
  }
  return result;
}

uint64_t BOMTreeIteratorKeySize(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  int v11;
  unsigned int v12;

  if (result)
  {
    v8 = result;
    if ((*(_BYTE *)(result + 57) & 8) != 0)
      return 0;
    if (((*(_BYTE *)(result + 57) & 1) != 0 || (v9 = *(_DWORD **)(result + 8)) == 0
                                             || *v9 != *(_DWORD *)(result + 16))
      && !_revalidateIterator(result, a2, a3, a4, a5, a6, a7, a8))
    {
      result = 0;
      *(_BYTE *)(v8 + 57) |= 8u;
      return result;
    }
    v10 = *(_QWORD *)v8;
    v11 = *(_DWORD *)(*(_QWORD *)v8 + 356);
    if ((v11 & 4) != 0)
    {
      return 0;
    }
    else
    {
      if ((v11 & 0x40) == 0)
      {
        v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20) + 4);
        return BOMStorageSizeOfBlock(*(_QWORD *)v10, v12);
      }
      result = *(unsigned int *)(v10 + 348);
      if ((int)result < 1)
      {
        v12 = bswap32(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20) + 4));
        return BOMStorageSizeOfBlock(*(_QWORD *)v10, v12);
      }
    }
  }
  return result;
}

uint64_t BOMTreeRemoveValue(uint64_t a1, void *a2, size_t a3)
{
  uint64_t result;
  int v5;
  uint64_t v6;

  result = 1;
  if (a1)
  {
    if (a2)
    {
      v5 = *(_DWORD *)(a1 + 356);
      if (a3 || (v5 & 4) != 0)
      {
        if ((v5 & 2) != 0)
        {
          v6 = *(_QWORD *)(a1 + 24);
          result = _findRemove(a1, &v6, 0, 0, 0, 0, a2, a3, 0);
          if (!(_DWORD)result)
          {
            --*(_DWORD *)(a1 + 20);
            *(_DWORD *)(a1 + 356) |= 1u;
          }
        }
        else
        {
          _CUILog();
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t BOMTreeIteratorNext(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _DWORD *v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  char v13;

  if (result)
  {
    v8 = result;
    if ((*(_BYTE *)(result + 57) & 8) == 0)
    {
      if ((*(_BYTE *)(result + 57) & 1) == 0
        && (v9 = *(_DWORD **)(result + 8)) != 0
        && *v9 == *(_DWORD *)(result + 16)
        || (result = _revalidateIterator(result, a2, a3, a4, a5, a6, a7, a8), (_DWORD)result))
      {
        if (*(_BYTE *)(v8 + 56))
        {
          v10 = *(_DWORD *)(v8 + 20) + 1;
          *(_DWORD *)(v8 + 20) = v10;
          v11 = *(_QWORD *)(v8 + 8);
          if (v10 >= *(unsigned __int16 *)(v11 + 16))
          {
            *(_DWORD *)(v8 + 20) = 0;
            v12 = *(_DWORD *)(v11 + 8);
            if (!v12
              || (*(_DWORD *)(v8 + 16) = v12,
                  result = (uint64_t)_findPage(*(_QWORD *)v8, v12),
                  (*(_QWORD *)(v8 + 8) = result) == 0))
            {
              *(_BYTE *)(v8 + 57) |= 8u;
            }
          }
        }
        else
        {
          *(_BYTE *)(v8 + 56) = 1;
        }
        v13 = *(_BYTE *)(v8 + 57) & 0xF9;
      }
      else
      {
        v13 = *(_BYTE *)(v8 + 57) | 8;
      }
      *(_BYTE *)(v8 + 57) = v13;
    }
  }
  return result;
}

void BOMTreeIteratorFree(_BYTE *a1)
{
  char v2;
  char v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  const __CFArray *v8;
  CFIndex v9;
  CFIndex v10;
  CFIndex v11;
  CFIndex FirstIndexOfValue;
  CFRange v13;

  if (a1)
  {
    v2 = a1[57];
    a1[56] = 0;
    v3 = v2 | 9;
    a1[57] = v3;
    v4 = (void *)*((_QWORD *)a1 + 3);
    if (v4 && (*(_BYTE *)(*(_QWORD *)a1 + 356) & 4) == 0)
    {
      free(v4);
      *((_QWORD *)a1 + 3) = 0;
      v3 = a1[57];
    }
    v5 = v3 & 0xFD;
    a1[57] = v5;
    v6 = (void *)*((_QWORD *)a1 + 5);
    if (v6)
    {
      free(v6);
      *((_QWORD *)a1 + 5) = 0;
      v5 = a1[57];
    }
    a1[57] = v5 & 0xFB;
    *((_DWORD *)a1 + 4) = -1;
    *((_QWORD *)a1 + 1) = 0;
    v7 = *(_QWORD *)a1;
    v8 = *(const __CFArray **)(*(_QWORD *)a1 + 296);
    if (v8)
    {
      v9 = BOMCFArrayMaxRange(v8);
      v11 = v10;
      v13.location = v9;
      v13.length = v11;
      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(*(CFArrayRef *)(v7 + 296), v13, a1);
      if (FirstIndexOfValue != -1)
      {
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v7 + 296), FirstIndexOfValue);
        if (!CFArrayGetCount(*(CFArrayRef *)(v7 + 296)))
        {
          CFRelease(*(CFTypeRef *)(v7 + 296));
          *(_QWORD *)(v7 + 296) = 0;
        }
      }
    }
    free(a1);
  }
}

uint64_t (*_WritePage(uint64_t a1, uint64_t a2))(_QWORD *)
{
  size_t v4;
  int v5;
  uint64_t (*result)(_QWORD *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(_QWORD *);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  size_t v54;
  void *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  int *v71;

  v4 = *(unsigned int *)(a1 + 304);
  if ((*(_BYTE *)(a1 + 356) & 4) == 0)
  {
    v5 = *(_DWORD *)(a1 + 348);
    if (v5 >= 1)
      v4 += v5 * (unint64_t)*(unsigned __int16 *)(a2 + 16);
  }
  result = (uint64_t (*)(_QWORD *))BOMStreamWithBlockID(*(_QWORD *)a1, *(_DWORD *)a2, v4, 1);
  if (result)
  {
    v13 = result;
    BOMStreamWriteUInt16(result, *(_WORD *)(a2 + 4) & 1, v7, v8, v9, v10, v11, v12);
    BOMStreamWriteUInt16(v13, *(unsigned __int16 *)(a2 + 16), v14, v15, v16, v17, v18, v19);
    BOMStreamWriteUInt32(v13, *(unsigned int *)(a2 + 8), v20, v21, v22, v23, v24, v25);
    BOMStreamWriteUInt32(v13, *(unsigned int *)(a2 + 12), v26, v27, v28, v29, v30, v31);
    if (*(_WORD *)(a2 + 16))
    {
      v38 = 0;
      v39 = 0;
      do
      {
        BOMStreamWriteUInt32(v13, *(unsigned int *)(*(_QWORD *)(a2 + 24) + v38), v32, v33, v34, v35, v36, v37);
        BOMStreamWriteUInt32(v13, *(unsigned int *)(*(_QWORD *)(a2 + 24) + v38 + 4), v40, v41, v42, v43, v44, v45);
        ++v39;
        v46 = *(unsigned __int16 *)(a2 + 16);
        v38 += 8;
      }
      while (v39 < v46);
    }
    else
    {
      v46 = 0;
    }
    BOMStreamWriteUInt32(v13, *(unsigned int *)(*(_QWORD *)(a2 + 24) + 8 * v46), v32, v33, v34, v35, v36, v37);
    if ((*(_BYTE *)(a1 + 356) & 4) == 0)
    {
      v54 = *(unsigned int *)(a1 + 348);
      if ((int)v54 >= 1)
      {
        v55 = BOM_malloc(v54);
        if (*(_WORD *)(a2 + 16))
        {
          v56 = 0;
          v57 = 4;
          do
          {
            if (BOMStorageSizeOfBlock(*(_QWORD *)a1, *(_DWORD *)(*(_QWORD *)(a2 + 24) + v57)) != *(_DWORD *)(a1 + 348))
            {
              v70 = BOMExceptionHandlerMessage("%s blockSize %d != tree->keySize %d", v58, v59, v60, v61, v62, v63, v64, (char)"_WritePage");
              v71 = __error();
              _BOMFatalException(v70, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 1408, *v71);
            }
            BOMStorageCopyFromBlock(*(_QWORD *)a1, *(_DWORD *)(*(_QWORD *)(a2 + 24) + v57), v55);
            BOMStreamWriteBuffer((uint64_t)v13, v55, *(int *)(a1 + 348), v65, v66, v67, v68, v69);
            ++v56;
            v57 += 8;
          }
          while (v56 < *(unsigned __int16 *)(a2 + 16));
        }
        free(v55);
      }
    }
    result = (uint64_t (*)(_QWORD *))BOMStreamFree((uint64_t)v13, v47, v48, v49, v50, v51, v52, v53);
    *(_WORD *)(a2 + 4) &= ~2u;
  }
  return result;
}

uint64_t BOMTreeStorage(uint64_t result)
{
  if (result)
    return *(_QWORD *)result;
  return result;
}

uint64_t BOMTreeSetValue(uint64_t a1, void *a2, size_t a3, const void *a4, size_t a5)
{
  uint64_t v5;
  int v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  unsigned int IndexForKey;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int *v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int v34;
  BOOL v36;

  v36 = 0;
  v5 = 1;
  if (a1)
  {
    if (a2)
    {
      v11 = *(_DWORD *)(a1 + 356);
      if (a3 || (v11 & 4) != 0)
      {
        if ((v11 & 2) == 0)
        {
          _CUILog();
          return v5;
        }
        v12 = BOMStackNew();
        if (!_findPagesForKey(a1, (char *)v12, a2, a3, v13, v14, v15, v16))
        {
          BOMStackFree(v12);
          return v5;
        }
        if (v12)
        {
          if ((*(_BYTE *)(a1 + 356) & 4) != 0)
          {
            v25 = (int)a2;
          }
          else
          {
            v17 = BOMStackPeek(v12);
            if (!v17)
            {
              v27 = 0;
              goto LABEL_27;
            }
            v18 = v17;
            IndexForKey = _findIndexForKey(a1, (uint64_t)v17, a2, a3, &v36);
            if (v36)
            {
              v24 = (unsigned int *)(v18[3] + 8 * IndexForKey);
              v26 = *v24;
              v25 = v24[1];
              if ((_DWORD)v26)
              {
LABEL_17:
                if (!BOMStorageCopyToBlock(*(_QWORD *)a1, v26, a4, a5, v20, v21, v22, v23)
                  && !_PageSetValue(a1, (uint64_t *)v12, a2, a3, v25, v26))
                {
                  if (!v36)
                    ++*(_DWORD *)(a1 + 20);
                  v5 = 0;
                  *(_DWORD *)(a1 + 356) |= 1u;
                  v27 = 1;
LABEL_27:
                  while (!BOMStackIsEmpty((uint64_t)v12))
                  {
                    v33 = BOMStackPop((uint64_t *)v12);
                    *((_WORD *)v33 + 2) &= ~8u;
                  }
                  BOMStackFree(v12);
                  if (v27)
                  {
                    if ((*(_BYTE *)(a1 + 356) & 4) == 0)
                    {
                      v34 = *(_DWORD *)(a1 + 348);
                      if (v34 != -1)
                      {
                        if (!v34)
                        {
                          v5 = 0;
                          *(_DWORD *)(a1 + 348) = a3;
                          return v5;
                        }
                        if (v34 != a3)
                        {
                          v5 = 0;
                          *(_DWORD *)(a1 + 348) = -1;
                          return v5;
                        }
                      }
                    }
                    return 0;
                  }
                  return v5;
                }
LABEL_25:
                v27 = 0;
                v5 = 1;
                goto LABEL_27;
              }
            }
            else
            {
              v28 = BOMStorageNewBlock(*(_QWORD *)a1);
              if (!(_DWORD)v28)
                goto LABEL_25;
              v25 = v28;
              if (BOMStorageCopyToBlock(*(_QWORD *)a1, v28, a2, a3, v29, v30, v31, v32))
                goto LABEL_25;
            }
          }
          v26 = BOMStorageNewBlock(*(_QWORD *)a1);
          if (!(_DWORD)v26)
            goto LABEL_25;
          goto LABEL_17;
        }
      }
    }
  }
  return v5;
}

uint64_t _findIndexForKey(uint64_t a1, uint64_t a2, void *__s1, size_t a4, BOOL *a5)
{
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  unsigned int v20;
  size_t v21;
  size_t v22;
  int v23;
  int v24;
  BOOL v25;

  if (*(_WORD *)(a2 + 16))
  {
    v9 = 0;
    v10 = *(unsigned __int16 *)(a2 + 16) - 1;
    while (1)
    {
      v11 = v9 + ((v10 - v9) >> 1);
      v12 = *(_DWORD *)(*(_QWORD *)(a2 + 24) + 8 * (int)v11 + 4);
      v13 = *(_DWORD *)(a1 + 356);
      v14 = bswap32(v12);
      if ((v13 & 0x40) != 0)
        v15 = v14;
      else
        v15 = v12;
      if (!(_DWORD)v15)
      {
        v15 = 0;
LABEL_18:
        v16 = 0;
        goto LABEL_27;
      }
      if ((v13 & 4) != 0)
        goto LABEL_18;
      if ((v13 & 0x40) != 0)
      {
        v16 = *(unsigned int *)(a1 + 348);
        if ((int)v16 >= 1)
          goto LABEL_12;
        v12 = v14;
      }
      v16 = BOMStorageSizeOfBlock(*(_QWORD *)a1, v12);
LABEL_12:
      v17 = *(unsigned int *)(a1 + 344);
      v15 = *(_QWORD *)(a1 + 336);
      if (v16 > v17)
      {
        v18 = (2 * v17);
        if (v16 > v18)
          LODWORD(v18) = v16;
        *(_DWORD *)(a1 + 344) = v18;
        if (v15)
        {
          free((void *)v15);
          *(_QWORD *)(a1 + 336) = 0;
          v19 = *(unsigned int *)(a1 + 344);
        }
        else
        {
          v19 = v18;
        }
        v15 = (unint64_t)BOM_malloc(v19);
        *(_QWORD *)(a1 + 336) = v15;
      }
      if ((*(_BYTE *)(a1 + 356) & 0x40) != 0)
      {
        v21 = *(unsigned int *)(a1 + 348);
        if ((int)v21 >= 1)
        {
          memcpy((void *)v15, (const void *)(*(_QWORD *)(a2 + 32) + v21 * (int)v11), v21);
          goto LABEL_27;
        }
        v20 = bswap32(*(_DWORD *)(*(_QWORD *)(a2 + 24) + 8 * (int)v11 + 4));
      }
      else
      {
        v20 = *(_DWORD *)(*(_QWORD *)(a2 + 24) + 8 * (int)v11 + 4);
      }
      BOMStorageCopyFromBlock(*(_QWORD *)a1, v20, (void *)v15);
LABEL_27:
      if ((*(_BYTE *)(a1 + 356) & 4) != 0)
      {
        if (v15 <= (unint64_t)__s1)
          v24 = 0;
        else
          v24 = -1;
        if (v15 < (unint64_t)__s1)
          v23 = 1;
        else
          v23 = v24;
        goto LABEL_43;
      }
      if ((void *)v15 == __s1)
      {
        if (!a5)
          return v11;
        v23 = 0;
        v25 = 1;
        goto LABEL_47;
      }
      if (__s1)
      {
        if (!v15)
        {
          v23 = 1;
          goto LABEL_43;
        }
        if (a4 >= v16)
          v22 = v16;
        else
          v22 = a4;
        v23 = memcmp(__s1, (const void *)v15, v22);
        if (v23)
          goto LABEL_43;
        if (v16 <= a4)
        {
          v23 = v16 < a4;
          goto LABEL_43;
        }
      }
      v23 = -1;
LABEL_43:
      if (!a5)
        goto LABEL_48;
      v25 = v23 == 0;
LABEL_47:
      *a5 = v25;
LABEL_48:
      if (v10 == v9)
      {
        if (v23 <= 0)
          return v11;
        else
          return (v11 + 1);
      }
      if (v23 >= 1)
      {
        if ((_DWORD)v11 == v10)
          v9 += (v10 - v9) >> 1;
        else
          v9 = v11 + 1;
      }
      else
      {
        if ((v23 & 0x80000000) == 0)
          return v11;
        v10 = v11 - ((v10 - v9) > 1);
      }
    }
  }
  v11 = 0;
  if (a5)
    *a5 = 0;
  return v11;
}

uint64_t _PageSetValue(uint64_t a1, uint64_t *a2, void *a3, size_t a4, int a5, int a6)
{
  uint64_t v6;
  uint64_t *v13;
  uint64_t v14;
  _BOOL4 v15;
  unsigned int IndexForKey;
  uint64_t v17;
  unsigned __int16 v18;
  int v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _QWORD *v27;
  unsigned int *v28;
  int v29;
  int v30;
  int v31;
  _QWORD *Page;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int16 v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _DWORD *v43;
  uint64_t v44;
  unsigned int v45;
  _QWORD *v46;
  _QWORD *v47;
  _DWORD *v48;
  int v49;
  char *v50;
  int v51;
  BOOL v53;

  v53 = 0;
  v6 = 1;
  if (a5)
  {
    if (a6)
    {
      v13 = BOMStackPop(a2);
      if (v13)
      {
        v14 = (uint64_t)v13;
        v15 = (*((_WORD *)v13 + 2) & 1) == 0;
        _invalidateIteratorsForPageID(a1, *(_DWORD *)v13);
        IndexForKey = _findIndexForKey(a1, v14, a3, a4, &v53);
        v17 = *(_QWORD *)(v14 + 24);
        if (v53)
        {
          v18 = *(_WORD *)(v14 + 16);
        }
        else
        {
          if (*(_DWORD *)(v17 + 8 * IndexForKey + 4))
          {
            v19 = *(_DWORD *)(a1 + 356);
            if ((v19 & 8) != 0)
            {
              *(_DWORD *)(a1 + 356) = v19 & 0xFFFFFFF7;
              v17 = *(_QWORD *)(v14 + 24);
            }
            v20 = *(unsigned __int16 *)(v14 + 16);
            LODWORD(v21) = v20 - IndexForKey;
            if (v20 != IndexForKey)
            {
              if (v21 <= 1)
                v21 = 1;
              else
                v21 = v21;
              v22 = v15 + v20;
              v23 = *(unsigned __int16 *)(v14 + 16);
              do
              {
                v24 = v17 + 8 * v23--;
                v25 = 8 * v22--;
                v26 = *(_DWORD *)(v17 + 8 * v22);
                *(_DWORD *)(v24 + 4) = *(_DWORD *)(v17 + 8 * v23 + 4);
                *(_DWORD *)(v17 + v25) = v26;
                --v21;
              }
              while (v21);
            }
          }
          else
          {
            LOWORD(v20) = *(_WORD *)(v14 + 16);
          }
          *(_DWORD *)(v17 + 8 * IndexForKey + 4) = a5;
          v18 = v20 + 1;
          *(_WORD *)(v14 + 16) = v20 + 1;
        }
        *(_DWORD *)(v17 + 8 * (IndexForKey + v15)) = a6;
        *(_WORD *)(v14 + 4) |= 2u;
        if (*(_DWORD *)(a1 + 308) >= v18)
        {
          v6 = 0;
        }
        else
        {
          v27 = _NewPage(a1, 0);
          if (v27)
          {
            v28 = (unsigned int *)v27;
            *((_WORD *)v27 + 2) = *((_WORD *)v27 + 2) & 0xFFFC | *(_WORD *)(v14 + 4) & 1 | 2;
            if ((*(_WORD *)(v14 + 4) & 1) == 0
              || (v29 = *(_DWORD *)v27,
                  v30 = *(_DWORD *)v14,
                  *((_DWORD *)v27 + 2) = *(_DWORD *)(v14 + 8),
                  *(_DWORD *)(v14 + 8) = v29,
                  *((_DWORD *)v27 + 3) = v30,
                  (v31 = *((_DWORD *)v27 + 2)) == 0))
            {
LABEL_25:
              if ((*(_BYTE *)(a1 + 356) & 8) != 0)
              {
                LODWORD(v34) = *(_DWORD *)(a1 + 308) - 1;
                v33 = *(unsigned __int16 *)(v14 + 16);
              }
              else
              {
                v33 = *(unsigned __int16 *)(v14 + 16);
                LODWORD(v34) = v33 >> 1;
              }
              v35 = *(_QWORD *)(v14 + 24);
              v36 = *((_QWORD *)v28 + 3);
              if ((int)v34 + 1 >= (int)v33)
              {
                v38 = *((_WORD *)v28 + 8);
                v34 = (int)v34;
                v40 = v33;
              }
              else
              {
                v34 = (int)v34;
                v37 = (int)v34 + 1;
                v38 = *((_WORD *)v28 + 8);
                do
                {
                  v39 = (_QWORD *)(v35 + 8 * v37);
                  *(_QWORD *)(v36 + 8 * v38++) = *v39;
                  *((_WORD *)v28 + 8) = v38;
                  *v39 = 0;
                  ++v37;
                  v40 = *(unsigned __int16 *)(v14 + 16);
                }
                while (v37 < v40);
                LOWORD(v33) = *(_WORD *)(v14 + 16);
              }
              v41 = 8 * v40;
              *(_DWORD *)(v36 + 8 * v38) = *(_DWORD *)(v35 + v41);
              *(_DWORD *)(v35 + v41) = 0;
              *(_WORD *)(v14 + 16) = v33 - v38;
              v42 = v35 + 8 * v34;
              v45 = *(_DWORD *)(v42 + 4);
              v43 = (_DWORD *)(v42 + 4);
              v44 = v45;
              if ((*(_BYTE *)(v14 + 4) & 1) == 0)
              {
                *v43 = 0;
                *(_WORD *)(v14 + 16) = v33 - v38 - 1;
              }
              _addPageToCache(a1, (uint64_t)v28);
              if (BOMStackIsEmpty((uint64_t)a2))
              {
                v46 = _NewPage(a1, 0);
                v6 = 1;
                if (v46)
                {
                  v47 = v46;
                  v48 = (_DWORD *)v46[3];
                  *v48 = *(_DWORD *)v14;
                  v48[1] = v44;
                  v48[2] = *v28;
                  *((_WORD *)v46 + 8) = 1;
                  *((_WORD *)v46 + 2) |= 2u;
                  _addPageToCache(a1, v14);
                  v6 = 0;
                  *(_QWORD *)(a1 + 24) = v47;
                }
              }
              else
              {
                v6 = _PageSetValue(a1, a2, a3, a4, v44, *v28);
              }
              goto LABEL_44;
            }
            Page = _findPage(a1, v31);
            if (Page)
            {
              if (*((_DWORD *)Page + 3) == *(_DWORD *)v14)
              {
                *((_DWORD *)Page + 3) = *v28;
                *((_WORD *)Page + 2) |= 2u;
                goto LABEL_25;
              }
              v49 = *__error();
              v50 = "internal btree error";
              v6 = 1;
              v51 = 2201;
            }
            else
            {
              v49 = *__error();
              v50 = "missing tree page";
              v6 = 1;
              v51 = 2197;
            }
            _BOMExceptionHandlerCall(v50, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", v51, v49);
          }
          else
          {
            v6 = 1;
          }
        }
LABEL_44:
        *(_WORD *)(v14 + 4) &= ~8u;
      }
    }
  }
  return v6;
}

uint64_t BOMTreeGetValueSize(uint64_t a1, void *a2, size_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t PagesForKey;
  uint64_t v14;
  int IndexForKey;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  BOOL v19;

  result = 1;
  if (a1 && a2 && a4 && (a3 || (*(_BYTE *)(a1 + 356) & 4) != 0))
  {
    PagesForKey = _findPagesForKey(a1, 0, a2, a3, a5, a6, a7, a8);
    if (PagesForKey && (v14 = PagesForKey, v19 = 0, IndexForKey = _findIndexForKey(a1, PagesForKey, a2, a3, &v19), v19))
    {
      v16 = bswap32(*(_DWORD *)(*(_QWORD *)(v14 + 24) + 8 * IndexForKey));
      if ((*(_DWORD *)(a1 + 356) & 0x40) != 0)
        v17 = v16;
      else
        v17 = *(_DWORD *)(*(_QWORD *)(v14 + 24) + 8 * IndexForKey);
      v18 = BOMStorageSizeOfBlock(*(_QWORD *)a1, v17);
      result = 0;
      *a4 = v18;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t BOMTreeValueExists(uint64_t a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  BOOL v12;

  result = 0;
  v12 = 0;
  if (a1 && a2)
  {
    if (a3 || (*(_BYTE *)(a1 + 356) & 4) != 0)
    {
      result = _findPagesForKey(a1, 0, a2, a3, a5, a6, a7, a8);
      if (result)
      {
        _findIndexForKey(a1, result, a2, a3, &v12);
        return v12;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

unint64_t BOMTreeGetValue(uint64_t a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t result;
  unint64_t v12;
  int IndexForKey;
  int v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unsigned int v20;
  unsigned int v21;
  BOOL v22;

  result = 0;
  v22 = 0;
  if (a1 && a2)
  {
    if (!a3 && (*(_BYTE *)(a1 + 356) & 4) == 0)
      return 0;
    result = _findPagesForKey(a1, 0, a2, a3, a5, a6, a7, a8);
    if (!result)
      return result;
    v12 = result;
    IndexForKey = _findIndexForKey(a1, result, a2, a3, &v22);
    if (!v22)
      return 0;
    v14 = IndexForKey;
    v15 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 24) + 8 * IndexForKey));
    v16 = (*(_DWORD *)(a1 + 356) & 0x40) != 0 ? v15 : *(_DWORD *)(*(_QWORD *)(v12 + 24) + 8 * IndexForKey);
    result = BOMStorageSizeOfBlock(*(_QWORD *)a1, v16);
    if (result)
    {
      v17 = result;
      v18 = *(void **)(a1 + 320);
      if (v18)
      {
        if (result <= *(unsigned int *)(a1 + 328))
          goto LABEL_19;
        free(*(void **)(a1 + 320));
        *(_QWORD *)(a1 + 320) = 0;
        v19 = (2 * *(_DWORD *)(a1 + 328));
        if (v17 <= v19)
          result = v19;
        else
          result = v17;
        *(_DWORD *)(a1 + 328) = result;
      }
      else
      {
        *(_DWORD *)(a1 + 328) = result;
        result = result;
      }
      v18 = BOM_malloc(result);
      *(_QWORD *)(a1 + 320) = v18;
LABEL_19:
      v20 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 24) + 8 * v14));
      if ((*(_DWORD *)(a1 + 356) & 0x40) != 0)
        v21 = v20;
      else
        v21 = *(_DWORD *)(*(_QWORD *)(v12 + 24) + 8 * v14);
      if (!BOMStorageCopyFromBlock(*(_QWORD *)a1, v21, v18))
        return *(_QWORD *)(a1 + 320);
      return 0;
    }
  }
  return result;
}

uint64_t BOMTreeReadValue(uint64_t a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v12;
  int IndexForKey;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;

  result = 0;
  v16 = 0;
  if (a1 && a2)
  {
    if (!a3 && (*(_BYTE *)(a1 + 356) & 4) == 0)
      return 0;
    result = _findPagesForKey(a1, 0, a2, a3, a5, a6, a7, a8);
    if (!result)
      return result;
    v12 = result;
    IndexForKey = _findIndexForKey(a1, result, a2, a3, &v16);
    if (v16)
    {
      v14 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 24) + 8 * IndexForKey));
      if ((*(_DWORD *)(a1 + 356) & 0x40) != 0)
        v15 = v14;
      else
        v15 = *(_DWORD *)(*(_QWORD *)(v12 + 24) + 8 * IndexForKey);
      return BOMStorageReadFromBlock(*(_QWORD *)a1, v15);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t _findRemove(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, size_t a8, char *a9)
{
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unsigned int IndexForKey;
  unsigned int v19;
  uint64_t v20;
  _QWORD *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t result;
  char v25;
  _QWORD *v26;
  __int16 v27;
  uint64_t v28;
  char v29;
  _QWORD *v30;
  uint64_t v31;
  __int16 v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int *v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;
  unsigned int v42;
  _WORD *v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL4 v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  _WORD *Page;
  int v51;
  unsigned int v52;
  uint64_t v53;
  BOOL v54;
  _BOOL4 v55;
  _WORD *v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  _DWORD *v62;
  int v63;
  char v64;
  unsigned __int16 v65;
  int *v66;
  uint64_t v67;
  void *v68;
  size_t v69;
  _BOOL4 v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v74;
  char *v76;
  char v77;
  _QWORD *v78;
  BOOL v79;

  v14 = a2;
  v15 = a1;
  v16 = a9;
  v79 = 0;
  v17 = *a2;
  v78 = 0;
  v77 = 0;
  if (!a9)
    v16 = &v77;
  v76 = v16;
  IndexForKey = _findIndexForKey(a1, v17, a7, a8, &v79);
  v19 = IndexForKey;
  *(_DWORD *)(v17 + 20) = IndexForKey;
  if ((*(_BYTE *)(v17 + 4) & 1) != 0)
  {
    v23 = v79;
    result = 1;
    if (!v79)
      return result;
LABEL_42:
    if (v23)
    {
      _invalidateIteratorsForPageID(v15, *(_DWORD *)v17);
LABEL_45:
      v33 = *(unsigned __int16 *)(v17 + 16);
      v34 = *(_QWORD *)(v17 + 24);
      LODWORD(v35) = v33 - v19;
      if (v33 == v19)
      {
        v36 = 0;
        v37 = 0;
        *(_DWORD *)(v34 + 8 * (v19 - 1) + 4) = 0;
      }
      else
      {
        v38 = (unsigned int *)(v34 + 8 * v19);
        v37 = *v38;
        v36 = v38[1];
        if (v35 <= 1)
          v35 = 1;
        else
          v35 = v35;
        v39 = v19;
        do
        {
          *(_QWORD *)(v34 + 8 * v39) = *(_QWORD *)(v34 + 8 * (v39 + 1));
          ++v39;
          --v35;
        }
        while (v35);
      }
      *(_DWORD *)(v34 + 8 * v33) = 0;
      *(_WORD *)(v17 + 16) = v33 - 1;
      if ((*(_WORD *)(v17 + 4) & 1) != 0)
      {
        if ((*(_BYTE *)(v15 + 356) & 4) == 0 && v36)
          BOMStorageFreeBlock(*(_QWORD *)v15, v36);
        if (v37)
          BOMStorageFreeBlock(*(_QWORD *)v15, v37);
      }
      v40 = *(_WORD *)(v17 + 4);
      *(_WORD *)(v17 + 4) = v40 | 2;
      v41 = *(unsigned __int16 *)(v17 + 16);
      if ((v40 & 1) != 0 && a6 && v19 == v41)
      {
        *(_DWORD *)(*(_QWORD *)(a6 + 24) + 8 * *(unsigned int *)(a6 + 20) + 4) = *(_DWORD *)(*(_QWORD *)(v17 + 24)
                                                                                             + 8 * (v19 - 1)
                                                                                             + 4);
        *(_WORD *)(a6 + 4) |= 2u;
        v41 = *(unsigned __int16 *)(v17 + 16);
      }
      v42 = *(_DWORD *)(v15 + 316);
      if (v42 <= v41)
      {
        result = 0;
        *v76 = 0;
        return result;
      }
      if (v17 != *(_QWORD *)(v15 + 24))
      {
        v43 = (_WORD *)*v14;
        if (!(a3 | a4))
        {
LABEL_111:
          result = 0;
          *v14 = (uint64_t)v43;
          return result;
        }
        v71 = a3;
        v73 = v14;
        if (a3)
          v44 = a3;
        else
          v44 = a4;
        v45 = a5;
        if (!a3)
          v45 = a6;
        if (a4)
          v46 = a3 != 0;
        else
          v46 = 0;
        v70 = v46;
        if (v46)
        {
          v47 = *(unsigned __int16 *)(a3 + 16);
          v48 = *(unsigned __int16 *)(a4 + 16);
          if (v47 >= v48)
          {
            if (v47 <= v48)
            {
              v51 = *(_DWORD *)(*(_QWORD *)(a6 + 24) + 8 * *(unsigned int *)(a6 + 20));
              if (*(_DWORD *)v43 == v51)
                v44 = a4;
              else
                v44 = a3;
              if (*(_DWORD *)v43 != v51)
                a6 = a5;
            }
            else
            {
              v44 = a3;
              a6 = a5;
            }
          }
          else
          {
            v44 = a4;
          }
        }
        else
        {
          a6 = v45;
        }
        v52 = *(unsigned __int16 *)(v44 + 16);
        v53 = a4;
        v54 = v44 == a4;
        v55 = v44 == a4;
        if (v54)
          v56 = (_WORD *)*v14;
        else
          v56 = (_WORD *)v44;
        if ((v43[2] & 1) != 0)
          _invalidateIteratorsForPageID(v15, *(_DWORD *)v44);
        v57 = a6;
        v58 = *(_DWORD *)(a6 + 20) - (v44 != v53);
        if ((v56[2] & 1) == 0)
        {
          v59 = (unsigned __int16)v56[8];
          *(_DWORD *)(*((_QWORD *)v56 + 3) + 8 * v59 + 4) = *(_DWORD *)(*(_QWORD *)(v57 + 24) + 8 * v58 + 4);
          v56[8] = v59 + 1;
          v56[2] |= 2u;
        }
        if (v42 < v52)
        {
          _shiftKeysAndValues(v15, (uint64_t)v43, v44, v55);
          v60 = *(_DWORD *)(*((_QWORD *)v56 + 3) + 8 * (unsigned __int16)v56[8] - 4);
          v61 = *(_QWORD *)(v57 + 24) + 8 * v58;
          v63 = *(_DWORD *)(v61 + 4);
          v62 = (_DWORD *)(v61 + 4);
          if (v63 != v60)
          {
            *v62 = v60;
            *(_WORD *)(v57 + 4) |= 2u;
          }
          v14 = v73;
          v64 = 0;
          if ((v56[2] & 1) == 0)
          {
            v65 = v56[8] - 1;
            v56[8] = v65;
            *(_DWORD *)(*((_QWORD *)v56 + 3) + 8 * v65 + 4) = 0;
            v56[2] |= 2u;
          }
          goto LABEL_110;
        }
        _shiftKeysAndValues(v15, v44, (uint64_t)v43, v44 != v53);
        if (v70)
        {
          v14 = v73;
          *(_DWORD *)(v71 + 8) = *(_DWORD *)v53;
          *(_DWORD *)(v53 + 12) = *(_DWORD *)v71;
          *(_WORD *)(v71 + 4) |= 2u;
        }
        else if (v71)
        {
          *(_DWORD *)(v71 + 8) = 0;
          v53 = v71;
          v14 = v73;
        }
        else
        {
          v14 = v73;
          if (!v53)
          {
LABEL_109:
            v43[2] &= ~8u;
            _removePageFromCache(v15, v43);
            BOMStorageFreeBlock(*(_QWORD *)v15, *(_DWORD *)v43);
            _FreePage(v15, v43);
            v43 = 0;
            v64 = 1;
LABEL_110:
            *v76 = v64;
            goto LABEL_111;
          }
          *(_DWORD *)(v53 + 12) = 0;
        }
        *(_WORD *)(v53 + 4) |= 2u;
        goto LABEL_109;
      }
      if (!(*(_WORD *)(v17 + 4) & 1 | v41))
      {
        v49 = **(_DWORD **)(v17 + 24);
        if (v49)
        {
          Page = _findPage(v15, v49);
          Page[2] &= ~8u;
          _removePageFromCache(v15, Page);
          *(_QWORD *)(v15 + 24) = Page;
          BOMStorageFreeBlock(*(_QWORD *)v15, *(_DWORD *)v17);
          _FreePage(v15, (void *)v17);
        }
      }
      return 0;
    }
LABEL_44:
    if (!*v76)
      return 0;
    goto LABEL_45;
  }
  v74 = a6;
  if (IndexForKey)
  {
    v20 = v15;
    v21 = _findPage(v15, *(_DWORD *)(*(_QWORD *)(v17 + 24) + 8 * (IndexForKey - 1)));
    v22 = *((_WORD *)v21 + 2);
    if ((v22 & 8) == 0)
    {
      v67 = v17;
LABEL_12:
      v25 = 0;
      *((_WORD *)v21 + 2) = v22 | 8;
      goto LABEL_16;
    }
    v25 = 1;
    v67 = v17;
  }
  else if (a3)
  {
    v20 = v15;
    v21 = _findPage(v15, *(_DWORD *)(*(_QWORD *)(a3 + 24) + 8 * *(unsigned __int16 *)(a3 + 16)));
    v22 = *((_WORD *)v21 + 2);
    if ((v22 & 8) == 0)
    {
      v67 = a5;
      goto LABEL_12;
    }
    v25 = 1;
    v67 = a5;
  }
  else
  {
    v20 = v15;
    v67 = 0;
    v21 = 0;
    v25 = 1;
  }
LABEL_16:
  v72 = v14;
  v69 = a8;
  v68 = a7;
  if (v19 == *(unsigned __int16 *)(v17 + 16))
  {
    if (a4)
    {
      v26 = _findPage(v20, **(_DWORD **)(a4 + 24));
      v27 = *((_WORD *)v26 + 2);
      if ((v27 & 8) == 0)
      {
        v28 = v74;
LABEL_22:
        v29 = 0;
        *((_WORD *)v26 + 2) = v27 | 8;
        goto LABEL_26;
      }
      v29 = 1;
      v28 = v74;
    }
    else
    {
      v28 = 0;
      v26 = 0;
      v29 = 1;
    }
  }
  else
  {
    v26 = _findPage(v20, *(_DWORD *)(*(_QWORD *)(v17 + 24) + 8 * (v19 + 1)));
    v27 = *((_WORD *)v26 + 2);
    if ((v27 & 8) == 0)
    {
      v28 = v17;
      goto LABEL_22;
    }
    v29 = 1;
    v28 = v17;
  }
LABEL_26:
  v30 = _findPage(v20, *(_DWORD *)(*(_QWORD *)(v17 + 24) + 8 * v19));
  v78 = v30;
  if (!v30)
  {
    v66 = __error();
    _BOMFatalException("BOMTree in invalid state - nextNode is NULL!", "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 1810, *v66);
  }
  v31 = v28;
  v32 = *((_WORD *)v30 + 2);
  if ((v32 & 8) == 0)
    *((_WORD *)v30 + 2) = v32 | 8;
  if (a3)
    *(_WORD *)(a3 + 4) &= ~4u;
  if (a4)
    *(_WORD *)(a4 + 4) &= ~4u;
  *((_WORD *)v30 + 2) &= ~4u;
  result = _findRemove(v20, &v78, v21, v26, v67, v31, v68, v69, v76);
  if ((v25 & 1) == 0)
    *((_WORD *)v21 + 2) &= ~8u;
  if ((v29 & 1) == 0)
    *((_WORD *)v26 + 2) &= ~8u;
  v15 = v20;
  if ((v32 & 8) == 0 && v78)
    *((_WORD *)v78 + 2) &= ~8u;
  v14 = v72;
  a6 = v74;
  if (!(_DWORD)result)
  {
    v23 = v79;
    if ((*(_WORD *)(v17 + 4) & 1) == 0)
      goto LABEL_44;
    goto LABEL_42;
  }
  return result;
}

_DWORD *BOMTreeIteratorSet(uint64_t a1, void *a2, size_t a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *result;
  uint64_t v13;
  int v14;

  *(_BYTE *)(a1 + 57) &= 0xF6u;
  result = (_DWORD *)_findPagesForKey(*(_QWORD *)a1, 0, a2, a3, a5, a6, a7, a8);
  *(_QWORD *)(a1 + 8) = result;
  if (result)
  {
    *(_DWORD *)(a1 + 16) = *result;
    result = (_DWORD *)_findIndexForKey(*(_QWORD *)a1, (uint64_t)result, a2, a3, a4);
    *(_DWORD *)(a1 + 20) = (_DWORD)result;
    *(_BYTE *)(a1 + 56) = 1;
    v13 = *(_QWORD *)(a1 + 8);
    if (result >= *(unsigned __int16 *)(v13 + 16))
    {
      *(_DWORD *)(a1 + 20) = 0;
      v14 = *(_DWORD *)(v13 + 8);
      if (!v14
        || (*(_DWORD *)(a1 + 16) = v14, result = _findPage(*(_QWORD *)a1, v14), (*(_QWORD *)(a1 + 8) = result) == 0))
      {
        *(_BYTE *)(a1 + 57) |= 8u;
      }
    }
  }
  else
  {
    *(_BYTE *)(a1 + 57) |= 8u;
    *(_BYTE *)(a1 + 56) = 0;
  }
  return result;
}

_QWORD *_findPage(uint64_t a1, int a2)
{
  uint64_t v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  void *v10;
  unsigned int v11;
  int v12;
  int v13;
  BOOL v14;
  int v15;
  int v16;
  int *v17;

  if (a2)
  {
    if (a1)
    {
      v4 = 0;
      while (1)
      {
        v5 = *(_QWORD **)(a1 + 32 + v4);
        if (v5)
        {
          if (*(_DWORD *)v5 == a2)
            break;
        }
        v4 += 8;
        if (v4 == 256)
          goto LABEL_7;
      }
    }
    else
    {
LABEL_7:
      v5 = 0;
    }
    v6 = 0;
    while (1)
    {
      if (v5)
        return v5;
      v7 = *(int *)(a1 + 288);
      v5 = *(_QWORD **)(a1 + 8 * v7 + 32);
      if (!v5)
      {
        v5 = _NewPage(a1, a2);
        if (!v5)
          return v5;
        if (_ReadPage(a1, (uint64_t)v5))
          return 0;
        v7 = *(int *)(a1 + 288);
        *(_QWORD *)(a1 + 8 * v7 + 32) = v5;
        goto LABEL_26;
      }
      v8 = *((_WORD *)v5 + 2);
      if ((v8 & 0xC) == 4)
        break;
      if ((v8 & 4) != 0)
      {
        v5 = 0;
LABEL_26:
        v12 = v6;
        goto LABEL_27;
      }
      v12 = 0;
      *((_WORD *)v5 + 2) = v8 | 4;
      LODWORD(v7) = *(_DWORD *)(a1 + 288);
      v5 = 0;
LABEL_27:
      v13 = v7 + 1;
      v14 = -v13 < 0;
      v15 = -v13 & 0x1F;
      v16 = v13 & 0x1F;
      if (!v14)
        v16 = -v15;
      *(_DWORD *)(a1 + 288) = v16;
      v6 = v12 + 1;
      if (!v5 && v12 >= 32)
      {
        v17 = __error();
        _BOMExceptionHandlerCall("btree cache is deadlocked", 0, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 2347, *v17);
        return 0;
      }
    }
    if ((v8 & 2) != 0)
      _WritePage(a1, (uint64_t)v5);
    v9 = 0;
    v10 = (void *)v5[3];
    v5[4] = 0;
    *(_OWORD *)v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    if ((*(_BYTE *)(a1 + 356) & 0x40) == 0)
    {
      v11 = *(_DWORD *)(a1 + 308);
      if (v11 <= *(_DWORD *)(a1 + 312))
        v11 = *(_DWORD *)(a1 + 312);
      bzero(v10, 8 * v11);
      v9 = v10;
    }
    *(_DWORD *)v5 = a2;
    v5[1] = -1;
    v5[3] = v9;
    v5[4] = 0;
    if (_ReadPage(a1, (uint64_t)v5))
      return 0;
    v7 = *(int *)(a1 + 288);
    *(_QWORD *)(a1 + 8 * v7 + 32) = v5;
    goto LABEL_26;
  }
  return 0;
}

uint64_t _revalidateIterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *Page;
  int v10;
  uint64_t PagesForKey;
  int IndexForKey;
  uint64_t result;

  if ((*(_BYTE *)(a1 + 57) & 1) != 0)
  {
    PagesForKey = _findPagesForKey(*(_QWORD *)a1, 0, *(void **)(a1 + 24), *(_QWORD *)(a1 + 32), a5, a6, a7, a8);
    *(_QWORD *)(a1 + 8) = PagesForKey;
    if (!PagesForKey)
    {
      *(_BYTE *)(a1 + 57) |= 1u;
      goto LABEL_12;
    }
    IndexForKey = _findIndexForKey(*(_QWORD *)a1, PagesForKey, *(void **)(a1 + 24), *(_QWORD *)(a1 + 32), (BOOL *)(a1 + 56));
    Page = *(_QWORD **)(a1 + 8);
    *(_DWORD *)(a1 + 16) = *(_DWORD *)Page;
    *(_DWORD *)(a1 + 20) = IndexForKey;
    *(_BYTE *)(a1 + 57) &= ~1u;
    goto LABEL_9;
  }
  Page = *(_QWORD **)(a1 + 8);
  if (!Page)
  {
    v10 = *(_DWORD *)(a1 + 16);
LABEL_8:
    Page = _findPage(*(_QWORD *)a1, v10);
    *(_QWORD *)(a1 + 8) = Page;
    if (!Page)
      goto LABEL_12;
    goto LABEL_9;
  }
  v10 = *(_DWORD *)(a1 + 16);
  if (*(_DWORD *)Page != v10)
    goto LABEL_8;
LABEL_9:
  if (*(_DWORD *)(a1 + 20) < *((unsigned __int16 *)Page + 8))
    return 1;
LABEL_12:
  result = 0;
  *(_BYTE *)(a1 + 57) |= 1u;
  return result;
}

uint64_t BOMTreeIteratorValueSize(uint64_t **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  if (!a1 || (*((_BYTE *)a1 + 57) & 8) != 0)
    return 0;
  if ((*((_BYTE *)a1 + 57) & 1) != 0 || (v9 = a1[1]) == 0 || *(_DWORD *)v9 != *((_DWORD *)a1 + 4))
  {
    if (_revalidateIterator((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8))
    {
      v9 = a1[1];
      goto LABEL_8;
    }
    *((_BYTE *)a1 + 57) |= 8u;
    return 0;
  }
LABEL_8:
  v10 = *(_DWORD *)(v9[3] + 8 * *((int *)a1 + 5));
  v11 = bswap32(v10);
  if ((*((_DWORD *)*a1 + 89) & 0x40) != 0)
    v12 = v11;
  else
    v12 = v10;
  return BOMStorageSizeOfBlock(**a1, v12);
}

uint64_t BOMTreeIteratorValue(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  char v9;
  _DWORD *v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  size_t v18;
  unsigned int v19;
  unsigned int v20;

  if (result)
  {
    v8 = result;
    v9 = *(_BYTE *)(result + 57);
    if ((v9 & 8) != 0)
      return 0;
    if ((*(_BYTE *)(result + 57) & 1) == 0
      && (v10 = *(_DWORD **)(result + 8)) != 0
      && *v10 == *(_DWORD *)(result + 16)
      || (v11 = _revalidateIterator(result, a2, a3, a4, a5, a6, a7, a8), v9 = *(_BYTE *)(v8 + 57), v11))
    {
      if ((v9 & 4) == 0)
      {
        v12 = bswap32(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20)));
        if ((*(_DWORD *)(*(_QWORD *)v8 + 356) & 0x40) != 0)
          v13 = v12;
        else
          v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20));
        v14 = BOMStorageSizeOfBlock(**(_QWORD **)v8, v13);
        v15 = *(_QWORD *)(v8 + 48);
        if (v14 > v15)
        {
          v16 = v14;
          v17 = *(void **)(v8 + 40);
          if (v17)
          {
            free(v17);
            *(_QWORD *)(v8 + 40) = 0;
            v15 = *(_QWORD *)(v8 + 48);
          }
          if (v16 <= 2 * v15)
            v18 = 2 * v15;
          else
            v18 = v16;
          *(_QWORD *)(v8 + 48) = v18;
          *(_QWORD *)(v8 + 40) = BOM_malloc(v18);
        }
        v19 = bswap32(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20)));
        if ((*(_DWORD *)(*(_QWORD *)v8 + 356) & 0x40) != 0)
          v20 = v19;
        else
          v20 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) + 8 * *(int *)(v8 + 20));
        if (BOMStorageCopyFromBlock(**(_QWORD **)v8, v20, *(void **)(v8 + 40)))
          return 0;
        *(_BYTE *)(v8 + 57) |= 4u;
      }
      return *(_QWORD *)(v8 + 40);
    }
    else
    {
      result = 0;
      *(_BYTE *)(v8 + 57) = v9 | 8;
    }
  }
  return result;
}

uint64_t _BOMTreeDiagnosticTraverse(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _QWORD *a6, _QWORD *a7)
{
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  int v16;
  unsigned int v17;
  int v18;
  _QWORD *Page;
  uint64_t v21;
  unint64_t v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  _QWORD *v29;
  unsigned int v30;

  if (!a1)
    return 1;
  v12 = a2;
  if (!a2)
    v12 = *(_QWORD *)(a1 + 24);
  *a3 = BOMStorageSizeOfBlock(*(_QWORD *)a1, *(_DWORD *)v12);
  if ((*(_WORD *)(v12 + 4) & 1) != 0)
  {
    if (a4)
      ++*a4;
    if (*(_WORD *)(v12 + 16))
    {
      v21 = 0;
      v22 = 0;
      do
      {
        if (a6)
        {
          v23 = *(_DWORD *)(a1 + 356);
          if ((v23 & 4) == 0)
          {
            v24 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 24) + v21 + 4));
            if ((v23 & 0x40) != 0)
              v25 = v24;
            else
              v25 = *(_DWORD *)(*(_QWORD *)(v12 + 24) + v21 + 4);
            *a6 += BOMStorageSizeOfBlock(*(_QWORD *)a1, v25);
          }
        }
        if (a7)
        {
          v26 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 24) + v21));
          if ((*(_DWORD *)(a1 + 356) & 0x40) != 0)
            v27 = v26;
          else
            v27 = *(_DWORD *)(*(_QWORD *)(v12 + 24) + v21);
          *a7 += BOMStorageSizeOfBlock(*(_QWORD *)a1, v27);
        }
        ++v22;
        v21 += 8;
      }
      while (v22 < *(unsigned __int16 *)(v12 + 16));
    }
    else
    {
      v22 = 0;
    }
    v30 = *(_DWORD *)(*(_QWORD *)(v12 + 24) + 8 * v22);
    if ((*(_BYTE *)(a1 + 356) & 0x40) != 0)
    {
      v16 = 0;
      if (!a7 || !v30)
        return v16 != 0;
      v30 = bswap32(v30);
    }
    else
    {
      v16 = 0;
      if (!a7 || !v30)
        return v16 != 0;
    }
    v16 = 0;
    *a7 += BOMStorageSizeOfBlock(*(_QWORD *)a1, v30);
  }
  else
  {
    if (a5)
      ++*a5;
    if (*(_WORD *)(v12 + 16))
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
      do
      {
        v17 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 24) + v14));
        if ((*(_DWORD *)(a1 + 356) & 0x40) != 0)
          v18 = v17;
        else
          v18 = *(_DWORD *)(*(_QWORD *)(v12 + 24) + v14);
        Page = _findPage(a1, v18);
        v16 += _BOMTreeDiagnosticTraverse(a1, Page, a3, a4, a5, a6, a7);
        ++v15;
        v14 += 8;
      }
      while (v15 < *(unsigned __int16 *)(v12 + 16));
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
    v28 = *(_DWORD *)(*(_QWORD *)(v12 + 24) + 8 * v15);
    if ((*(_BYTE *)(a1 + 356) & 0x40) == 0)
    {
      if (!v28)
        return v16 != 0;
      goto LABEL_38;
    }
    if (v28)
    {
      v28 = bswap32(v28);
LABEL_38:
      v29 = _findPage(a1, v28);
      v16 += _BOMTreeDiagnosticTraverse(a1, v29, a3, a4, a5, a6, a7);
    }
  }
  return v16 != 0;
}

uint64_t _BOMTreePrintDiagnostics(uint64_t result)
{
  uint64_t v1;
  int v2;
  FILE **v3;
  size_t v4;
  size_t v5;
  int v6;
  int v7;
  int v8;

  v8 = 0;
  v6 = 0;
  v7 = 0;
  v4 = 0;
  v5 = 0;
  if (result)
  {
    v1 = result;
    result = _BOMTreeDiagnosticTraverse(result, 0, &v7, &v8, &v6, &v5, &v4);
    if (!(_DWORD)result)
    {
      v2 = v6 + v8;
      v3 = (FILE **)MEMORY[0x1E0C80C20];
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "           # records: %d\n", *(_DWORD *)(v1 + 20));
      fprintf(*v3, "           page size: %d (%d)\n", *(_DWORD *)(v1 + 304), v7);
      fprintf(*v3, "           # pages  : %d (%d)\n", v2, *(_DWORD *)(v1 + 304) * v2);
      fprintf(*v3, "             leaf   : %d (%d)\n", v8, *(_DWORD *)(v1 + 304) * v8);
      fprintf(*v3, "             branch : %d (%d)\n", v6, *(_DWORD *)(v1 + 304) * v6);
      fprintf(*v3, "           key size : %zd\n", v5);
      return fprintf(*v3, "           data size: %zd\n", v4);
    }
  }
  return result;
}

uint64_t BOMMemoryDump(unsigned __int8 *a1, uint64_t a2, const char *a3)
{
  uint64_t v3;
  FILE **v5;
  FILE *v6;
  unsigned __int8 *v8;
  unint64_t v9;
  const char *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int v15;
  char v16;
  char *v17;
  uint64_t v18;
  unsigned __int8 *v19;
  uint64_t v20;
  int v21;
  char v22;
  uint64_t v23;
  uint64_t v25;
  const char *v26;
  unsigned __int8 *v27;
  char v28[17];
  uint64_t v29;

  v3 = a2;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = (FILE **)MEMORY[0x1E0C80C20];
  v6 = (FILE *)*MEMORY[0x1E0C80C20];
  v27 = a1;
  if (!a1)
  {
    fprintf(v6, "(%lu bytes) (NULL)\n", a2);
    return 0;
  }
  fprintf(v6, "(%lu bytes)\n", a2);
  if (v3 >= 1)
  {
    v8 = v27;
    v9 = (unint64_t)&v27[v3];
    v10 = "";
    if (a3)
      v10 = a3;
    v25 = v3;
    v26 = v10;
    while (1)
    {
      v11 = v8;
      fprintf(*v5, "%s%08x:", v26, (_DWORD)v8 - (_DWORD)v27);
      v12 = 0;
      v13 = v28;
      do
      {
        fprintf(*v5, " %02x", *v8);
        v14 = *v8;
        if ((v14 & 0x80) != 0)
          v15 = __maskrune(v14, 0x40000uLL);
        else
          v15 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v14 + 60) & 0x40000;
        if (v15)
          v16 = v14;
        else
          v16 = 46;
        *v13 = v16;
        v17 = v13 + 1;
        v18 = v12 + 1;
        if (v12 < 15)
        {
          v19 = &v11[v18];
          if ((unint64_t)&v11[v18] < v9)
          {
            fprintf(*v5, "%02x", *v19);
            v20 = *v19;
            if ((v20 & 0x80) != 0)
              v21 = __maskrune(v20, 0x40000uLL);
            else
              v21 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v20 + 60) & 0x40000;
            if (v21)
              v22 = v20;
            else
              v22 = 46;
            v17 = v13 + 2;
            v13[1] = v22;
            v18 = v12 + 2;
          }
        }
        v8 = &v11[v18];
        if (v18 > 15)
          break;
        v13 = v17;
        v12 = v18;
      }
      while ((unint64_t)v8 < v9);
      if (v18 > 15)
        goto LABEL_29;
      v23 = 16 - v18;
      if (((16 - (_DWORD)v18) & 1) == 0)
        goto LABEL_28;
      fwrite("  ", 2uLL, 1uLL, *v5);
      if (v18 != 15)
        break;
LABEL_29:
      *v17 = 0;
      fprintf(*v5, "  %s\n", v28);
      if ((unint64_t)v8 >= v9)
        return v25;
    }
    v23 = 15 - v18;
    do
    {
LABEL_28:
      fwrite("     ", 5uLL, 1uLL, *v5);
      v23 -= 2;
    }
    while (v23);
    goto LABEL_29;
  }
  return v3;
}

size_t BOMValueDump(size_t result, unint64_t a2, const char *a3, unsigned int a4)
{
  unsigned int v4;
  unint64_t v6;
  unsigned __int8 *v7;
  unsigned int v8;
  unsigned int v9;
  const char *v10;
  int v11;
  FILE **v12;

  v4 = a4;
  v6 = a2;
  v7 = (unsigned __int8 *)result;
  if ((a4 & 0x1000000) == 0)
  {
LABEL_8:
    if (v6)
    {
      v11 = (v4 >> 20) & 0xF;
      v12 = (FILE **)MEMORY[0x1E0C80C20];
      do
      {
        if ((v4 & 0x1000000) != 0)
          fprintf(*v12, "  %s", a3);
        switch(v11)
        {
          case 3:
            result = BOMPathKeyDump((uint64_t)v7, v6, a3);
            break;
          case 2:
            result = BOMPathIdDump(v7, v6, a3);
            break;
          case 1:
            result = BOMPathDump((char *)v7);
            break;
          default:
            result = BOMMemoryDump(v7, v6, a3);
            break;
        }
        v7 += result;
        v6 -= result;
      }
      while (v6);
    }
    return result;
  }
  if (a2 < 4)
  {
    v4 = 0;
    goto LABEL_8;
  }
  v7 = (unsigned __int8 *)(result + 4);
  v8 = *(_DWORD *)result;
  v9 = bswap32(*(_DWORD *)result);
  v10 = "y";
  if (*(_DWORD *)result != 0x1000000)
    v10 = "ies";
  result = fprintf((FILE *)*MEMORY[0x1E0C80C20], "(%lu bytes for %d entr%s)\n", a2, v9, v10);
  v6 -= 4;
  if (v8)
    goto LABEL_8;
  return result;
}

size_t BOMPathDump(char *__s)
{
  size_t v2;

  if (__s)
    v2 = strlen(__s);
  else
    v2 = 0;
  fprintf((FILE *)*MEMORY[0x1E0C80C20], "\"%s\" (%lu bytes)\n", __s, v2);
  return v2;
}

uint64_t BOMPathIdDump(unsigned __int8 *a1, unint64_t a2, const char *a3)
{
  if (!a1 || a2 < 4)
    return BOMMemoryDump(a1, a2, a3);
  fprintf((FILE *)*MEMORY[0x1E0C80C20], "0x%02x%02x%02x%02x (%lu bytes)\n", *a1, a1[1], a1[2], a1[3], 4);
  return 4;
}

uint64_t BOMPathKeyDump(uint64_t a1, unint64_t a2, const char *a3)
{
  size_t v3;

  if (a1 && a2 >= 5)
  {
    v3 = strlen((const char *)(a1 + 4)) + 5;
    fprintf((FILE *)*MEMORY[0x1E0C80C20], "0x%02x%02x%02x%02x \"%s\" (%lu bytes)\n");
    return v3;
  }
  if (a1 && a2 == 4)
  {
    v3 = 4;
    fprintf((FILE *)*MEMORY[0x1E0C80C20], "0x%02x%02x%02x%02x (NULL) (%lu bytes)\n");
    return v3;
  }
  return BOMMemoryDump((unsigned __int8 *)a1, a2, a3);
}

uint64_t BOMStorageDumpTree(uint64_t a1, const char *a2, unsigned int a3)
{
  uint64_t v5;
  uint64_t v6;
  FILE **v7;
  uint64_t **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  size_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v5 = BOMTreeOpenWithName(a1, a2, 0);
  if (v5)
  {
    v6 = v5;
    v7 = (FILE **)MEMORY[0x1E0C80C20];
    fprintf((FILE *)*MEMORY[0x1E0C80C20], "        %s (%u entries) (%d localkeysize)\n", a2, *(_DWORD *)(v6 + 20), *(_DWORD *)(v6 + 348));
    _BOMTreePrintDiagnostics(v6);
    v8 = (uint64_t **)BOMTreeIteratorNew(v6, 0, 0, 0);
    if (!BOMTreeIteratorIsAtEnd((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15))
    {
      v16 = HIWORD(a3) & 0xF;
      do
      {
        fprintf(*v7, "        %s   Key ", a2);
        v24 = (unsigned __int8 *)BOMTreeIteratorKey((uint64_t)v8, v17, v18, v19, v20, v21, v22, v23);
        v32 = BOMTreeIteratorKeySize((uint64_t)v8, v25, v26, v27, v28, v29, v30, v31);
        switch(v16)
        {
          case 3:
            BOMPathKeyDump((uint64_t)v24, v32, "        ");
            break;
          case 2:
            BOMPathIdDump(v24, v32, "        ");
            break;
          case 1:
            BOMPathDump((char *)v24);
            break;
          default:
            BOMMemoryDump(v24, v32, "        ");
            break;
        }
        fprintf(*v7, "        %s Value ", a2);
        v40 = BOMTreeIteratorValue((uint64_t)v8, v33, v34, v35, v36, v37, v38, v39);
        v48 = BOMTreeIteratorValueSize(v8, v41, v42, v43, v44, v45, v46, v47);
        BOMValueDump(v40, v48, "        ", a3);
        BOMTreeIteratorNext((uint64_t)v8, v49, v50, v51, v52, v53, v54, v55);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v8, v56, v57, v58, v59, v60, v61, v62));
    }
    fputc(10, *v7);
    if (v8)
      BOMTreeIteratorFree(v8);
    BOMTreeFree(v6);
    return 0;
  }
  else
  {
    fputc(10, (FILE *)*MEMORY[0x1E0C80C20]);
    return 0xFFFFFFFFLL;
  }
}

uint64_t BOMTreePrint(uint64_t a1, const char *a2, FILE *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  int v11;

  v7 = BOMTreeOpenWithName(a1, a2, 0);
  if (v7)
  {
    v8 = v7;
    fprintf(a3, "        %s (%u entries)\n", a2, *(_DWORD *)(v7 + 20));
    _BOMTreePrintDiagnostics(v8);
    fputc(10, a3);
    v9 = *(unsigned int **)(v8 + 24);
    v11 = 0;
    _BOMTreePrintPage(v8, v9, a3, a4, 0, 0, &v11);
    fputc(10, a3);
    BOMTreeFree(v8);
    return 0;
  }
  else
  {
    fputc(10, a3);
    return 0xFFFFFFFFLL;
  }
}

uint64_t BOMTreeUsesNumericKeys(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 356) >> 2) & 1;
}

uint64_t BOMTreePageSize(uint64_t a1)
{
  return *(unsigned int *)(a1 + 304);
}

_QWORD *_newBOMTree(uint64_t a1, const char *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  int v6;
  int *v7;
  unsigned int v8;
  char *v9;

  v4 = BOM_malloczero(0x168uLL);
  v5 = v4;
  if (v4)
  {
    *v4 = a1;
    if (BOMStorageMemoryMapped(a1))
      v6 = (BOMStorageIsOpenForWriting(a1) == 0) << 6;
    else
      v6 = 0;
    v8 = *((_DWORD *)v5 + 89) & 0xFFFFFFBF | v6;
    *((_DWORD *)v5 + 89) = v8;
    if (a2)
    {
      v9 = strdup(a2);
      v5[1] = v9;
      *((_DWORD *)v5 + 89) = v8 & 0xFFFFFFDF | (32 * (v9 != a2));
    }
  }
  else
  {
    v7 = __error();
    strerror(*v7);
    _CUILog();
  }
  return v5;
}

_QWORD *_NewPage(uint64_t a1, int a2)
{
  uint64_t v3;
  unsigned int v4;
  _QWORD *result;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;

  v3 = *(_QWORD *)a1;
  if ((*(_BYTE *)(a1 + 356) & 0x40) != 0)
  {
    v8 = BOM_malloczero(0x28uLL);
    v6 = 0;
    result = 0;
    if (!v8)
      return result;
LABEL_8:
    if (!a2)
      a2 = BOMStorageNewBlock(v3);
    v8[3] = v6;
    *(_DWORD *)v8 = a2;
    return v8;
  }
  v4 = *(_DWORD *)(a1 + 308);
  if (v4 <= *(_DWORD *)(a1 + 312))
    v4 = *(_DWORD *)(a1 + 312);
  result = BOM_malloczero(8 * (v4 + 1));
  if (result)
  {
    v6 = result;
    v7 = BOM_malloczero(0x28uLL);
    if (!v7)
    {
      free(v6);
      return 0;
    }
    v8 = v7;
    goto LABEL_8;
  }
  return result;
}

uint64_t _ReadPage(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v63;
  uint64_t DataPointer;
  char *v65;
  int *v66;

  v4 = *(_DWORD *)a2;
  v5 = BOMStorageSizeOfBlock(*(_QWORD *)a1, *(_DWORD *)a2);
  v6 = *(_QWORD *)a1;
  if ((*(_BYTE *)(a1 + 356) & 0x40) != 0)
  {
    v15 = BOMStorageReadFromBlock(v6, v4);
    if (!v15)
      return 1;
    v16 = (void *)v15;
    v14 = BOMStreamWithAddress(v15, v5, 0);
    madvise(v16, v5, 3);
    if (!v14)
      return 1;
  }
  else
  {
    v14 = BOMStreamWithBlockID(v6, v4, v5, 0);
    if (!v14)
      return 1;
  }
  *(_WORD *)(a2 + 4) = *(_WORD *)(a2 + 4) & 0xFFFE | (BOMStreamReadUInt16(v14, v7, v8, v9, v10, v11, v12, v13) != 0);
  *(_WORD *)(a2 + 16) = BOMStreamReadUInt16(v14, v17, v18, v19, v20, v21, v22, v23);
  *(_DWORD *)(a2 + 8) = BOMStreamReadUInt32(v14, v24, v25, v26, v27, v28, v29, v30);
  *(_DWORD *)(a2 + 12) = BOMStreamReadUInt32(v14, v31, v32, v33, v34, v35, v36, v37);
  v45 = *(unsigned __int16 *)(a2 + 16);
  if (*(_DWORD *)(a1 + 308) < v45)
  {
    v65 = BOMExceptionHandlerMessage("(tree (%s) page->numKeys(%d) > tree->maxKeys(%d)", v38, v39, v40, v41, v42, v43, v44, *(_QWORD *)(a1 + 8));
    v66 = __error();
    _BOMFatalException(v65, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 1329, *v66);
  }
  if ((*(_BYTE *)(a1 + 356) & 0x40) != 0)
  {
    *(_QWORD *)(a2 + 24) = BOMStreamGetDataPointer(v14, (8 * v45) | 4);
  }
  else
  {
    if (*(_WORD *)(a2 + 16))
    {
      v46 = 0;
      v47 = 0;
      do
      {
        *(_DWORD *)(*(_QWORD *)(a2 + 24) + v46) = BOMStreamReadUInt32(v14, v38, v39, v40, v41, v42, v43, v44);
        *(_DWORD *)(*(_QWORD *)(a2 + 24) + v46 + 4) = BOMStreamReadUInt32(v14, v48, v49, v50, v51, v52, v53, v54);
        ++v47;
        v46 += 8;
      }
      while (v47 < *(unsigned __int16 *)(a2 + 16));
    }
    *(_DWORD *)(*(_QWORD *)(a2 + 24) + 8 * *(unsigned __int16 *)(a2 + 16)) = BOMStreamReadUInt32(v14, v38, v39, v40, v41, v42, v43, v44);
  }
  if ((*(_DWORD *)(a1 + 356) & 0x44) == 0x40 && (v63 = *(_DWORD *)(a1 + 348), v63 >= 1))
    DataPointer = BOMStreamGetDataPointer(v14, v63 * (unint64_t)*(unsigned __int16 *)(a2 + 16));
  else
    DataPointer = 0;
  *(_QWORD *)(a2 + 32) = DataPointer;
  BOMStreamFree(v14, v55, v56, v57, v58, v59, v60, v61);
  return 0;
}

void _invalidateIteratorsForPageID(uint64_t a1, unsigned int a2)
{
  const __CFArray *v3;
  CFIndex v5;
  CFIndex v6;
  CFIndex v7;
  CFRange v8;

  v3 = *(const __CFArray **)(a1 + 296);
  if (v3)
  {
    v5 = BOMCFArrayMaxRange(v3);
    v7 = v6;
    v8.location = v5;
    v8.length = v7;
    CFArrayApplyFunction(*(CFArrayRef *)(a1 + 296), v8, (CFArrayApplierFunction)_invalidateIterator, (void *)a2);
  }
}

void _addPageToCache(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  _WORD *v5;
  _WORD *v6;
  __int16 v8;
  int v9;
  BOOL v10;
  int v11;
  int v12;
  uint64_t v13;
  _WORD *v14;

  v3 = a1 + 8 * *(int *)(a1 + 288);
  v6 = *(_WORD **)(v3 + 32);
  v4 = (_QWORD *)(v3 + 32);
  v5 = v6;
  if (v6)
  {
    while (1)
    {
      v8 = v5[2];
      if ((v8 & 0xC) == 4)
        break;
      v5[2] = v8 | 4;
      v9 = *(_DWORD *)(a1 + 288) + 1;
      v10 = -v9 < 0;
      v11 = -v9 & 0x1F;
      v12 = v9 & 0x1F;
      if (!v10)
        v12 = -v11;
      *(_DWORD *)(a1 + 288) = v12;
      v13 = a1 + 8 * v12;
      v14 = *(_WORD **)(v13 + 32);
      v4 = (_QWORD *)(v13 + 32);
      v5 = v14;
      if (!v14)
        goto LABEL_10;
    }
    if ((v8 & 2) != 0)
      _WritePage(a1, (uint64_t)v5);
    _FreePage(a1, v5);
    v4 = (_QWORD *)(a1 + 8 * *(int *)(a1 + 288) + 32);
  }
LABEL_10:
  *v4 = a2;
}

uint64_t _invalidateIterator(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  int *v18;
  int *v19;

  if (result)
  {
    v2 = result;
    if (*(_DWORD *)(result + 16) == a2 && (*(_BYTE *)(result + 57) & 9) == 0)
    {
      result = *(_QWORD *)(result + 8);
      if (!result || *(_DWORD *)result != a2)
      {
        result = (uint64_t)_findPage(*(_QWORD *)v2, a2);
        *(_QWORD *)(v2 + 8) = result;
        if (!result)
          goto LABEL_27;
      }
      v3 = *(_QWORD *)v2;
      v4 = *(_DWORD *)(*(_QWORD *)v2 + 356);
      if ((v4 & 4) != 0)
      {
        v6 = *(_DWORD *)(*(_QWORD *)(result + 24) + 8 * *(int *)(v2 + 20) + 4);
        v7 = bswap32(v6);
        if ((v4 & 0x40) != 0)
          v8 = v7;
        else
          v8 = v6;
        *(_QWORD *)(v2 + 24) = v8;
        *(_QWORD *)(v2 + 32) = 0;
        goto LABEL_27;
      }
      if ((v4 & 0x40) != 0)
      {
        v9 = *(unsigned int *)(v3 + 348);
        if ((int)v9 >= 1)
        {
LABEL_17:
          *(_QWORD *)(v2 + 32) = v9;
          v10 = *(void **)(v2 + 24);
          if (v10)
          {
            free(v10);
            *(_QWORD *)(v2 + 24) = 0;
            v9 = *(_QWORD *)(v2 + 32);
          }
          v11 = BOM_malloc(v9);
          *(_QWORD *)(v2 + 24) = v11;
          if (!v11)
          {
            v17 = __error();
            _BOMFatalException("BOMTree iterator cannot cache keys. This is a fatal error (!it->key).", "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 2773, *v17);
          }
          v12 = *(_QWORD *)v2;
          if ((*(_BYTE *)(*(_QWORD *)v2 + 356) & 0x40) != 0)
          {
            v14 = *(unsigned int *)(v12 + 348);
            v15 = *(_QWORD *)(v2 + 8);
            if ((int)v14 >= 1)
            {
              v16 = *(_QWORD *)(v15 + 32);
              if (!v16)
              {
                v19 = __error();
                _BOMFatalException("BOMTree iterator cannot cache keys. This is a fatal error (__getKeyIDValuePTR return 0).", "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 2781, *v19);
              }
              result = (uint64_t)memcpy(v11, (const void *)(v16 + *(int *)(v2 + 20) * v14), v14);
              goto LABEL_27;
            }
            v13 = bswap32(*(_DWORD *)(*(_QWORD *)(v15 + 24) + 8 * *(int *)(v2 + 20) + 4));
          }
          else
          {
            v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 8) + 24) + 8 * *(int *)(v2 + 20) + 4);
          }
          result = BOMStorageCopyFromBlock(*(_QWORD *)v12, v13, v11);
          if ((_DWORD)result)
          {
            v18 = __error();
            _BOMFatalException("BOMTree iterator cannot cache keys. This is a fatal error (BOMStorageCopyFromBlock returned an error).", "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMTree.c", 2786, *v18);
          }
LABEL_27:
          *(_BYTE *)(v2 + 57) |= 1u;
          return result;
        }
        v5 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 24) + 8 * *(int *)(v2 + 20) + 4));
      }
      else
      {
        v5 = *(_DWORD *)(*(_QWORD *)(result + 24) + 8 * *(int *)(v2 + 20) + 4);
      }
      v9 = BOMStorageSizeOfBlock(*(_QWORD *)v3, v5);
      goto LABEL_17;
    }
  }
  return result;
}

void _removePageFromCache(uint64_t a1, _WORD *a2)
{
  uint64_t i;
  const __CFArray *v5;
  CFIndex v6;
  CFIndex v7;
  CFIndex v8;
  CFRange v9;

  if ((a2[2] & 8) == 0)
  {
    for (i = 32; i != 288; i += 8)
    {
      if (*(_WORD **)(a1 + i) == a2)
      {
        v5 = *(const __CFArray **)(a1 + 296);
        if (v5)
        {
          v6 = BOMCFArrayMaxRange(v5);
          v8 = v7;
          v9.location = v6;
          v9.length = v8;
          CFArrayApplyFunction(*(CFArrayRef *)(a1 + 296), v9, (CFArrayApplierFunction)_pageRemovedCallback, a2);
        }
        *(_QWORD *)(a1 + i) = 0;
      }
    }
    if ((a2[2] & 2) != 0)
      _WritePage(a1, (uint64_t)a2);
  }
}

uint64_t _pageRemovedCallback(uint64_t result, uint64_t a2)
{
  if (result && a2 && *(_QWORD *)(result + 8) == a2)
    *(_QWORD *)(result + 8) = 0;
  return result;
}

uint64_t _shiftKeysAndValues(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  BOOL v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = *(unsigned __int16 *)(a3 + 16);
  v5 = *(_DWORD *)(result + 316);
  v6 = v4 >= v5;
  v8 = v4 - v5;
  v7 = v8 != 0 && v6;
  v9 = (v8 + 1) >> 1;
  if (v7)
    v10 = v9;
  else
    v10 = *(unsigned __int16 *)(a3 + 16);
  v11 = *(unsigned __int16 *)(a2 + 16);
  v12 = v10 + v11;
  v13 = v4 - v10;
  if (a4)
  {
    v14 = 0;
    if (!v10)
      goto LABEL_14;
    goto LABEL_10;
  }
  v15 = *(_QWORD *)(a2 + 24);
  *(_DWORD *)(v15 + 8 * (v10 + v11)) = *(_DWORD *)(v15 + 8 * v11);
  if ((_DWORD)v11)
  {
    do
    {
      v16 = v10 - 1 + v11--;
      *(_QWORD *)(v15 + 8 * v16) = *(_QWORD *)(v15 + 8 * v11);
    }
    while (v11);
  }
  v14 = v4 - v10;
  if (v10)
  {
LABEL_10:
    v17 = *(_QWORD *)(a3 + 24);
    v18 = *(_QWORD *)(a2 + 24);
    v11 = v11;
    v19 = v10;
    do
    {
      *(_QWORD *)(v18 + 8 * v11) = *(_QWORD *)(v17 + 8 * v14);
      if (!a4)
        *(_QWORD *)(v17 + 8 * v14) = 0;
      ++v11;
      ++v14;
      --v19;
    }
    while (v19);
  }
LABEL_14:
  if (a4)
  {
    if ((*(_WORD *)(a2 + 4) & 1) == 0 && (_DWORD)v4 == v10)
    {
      v20 = *(_QWORD *)(a3 + 24);
      v21 = 8 * v14;
      *(_DWORD *)(*(_QWORD *)(a2 + 24) + 8 * v11) = *(_DWORD *)(v20 + v21);
      *(_DWORD *)(v20 + v21) = 0;
    }
    if ((_DWORD)v4 != v10)
    {
      if ((_DWORD)v4)
      {
        v22 = 0;
        v23 = v13 + v10;
        v24 = 8 * v10;
        v25 = 8 * v23;
        do
        {
          if (v22 >= v13)
          {
            v26 = *(_QWORD *)(a3 + 24);
            if (v13 == v22)
              *(_QWORD *)(v26 + 8 * v13) = *(unsigned int *)(v26 + v25);
            else
              *(_QWORD *)(v26 + 8 * v22) = 0;
          }
          else
          {
            v26 = *(_QWORD *)(a3 + 24);
            *(_QWORD *)(v26 + 8 * v22) = *(_QWORD *)(v26 + 8 * v22 + v24);
          }
          ++v22;
        }
        while (v4 != v22);
      }
      else
      {
        v26 = *(_QWORD *)(a3 + 24);
      }
      *(_DWORD *)(v26 + 8 * v4) = 0;
    }
  }
  *(_WORD *)(a2 + 16) = v12;
  *(_WORD *)(a2 + 4) |= 2u;
  *(_WORD *)(a3 + 16) = v13;
  *(_WORD *)(a3 + 4) |= 2u;
  return result;
}

uint64_t _findPagesForKey(uint64_t a1, char *a2, void *__s1, size_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  _QWORD *Page;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;

  if (!a1)
    return 0;
  v12 = *(_QWORD *)(a1 + 24);
  if (a2)
    BOMStackPush(a2, v12, (uint64_t)__s1, a4, a5, a6, a7, a8);
  if ((*(_WORD *)(v12 + 4) & 1) == 0)
  {
    do
    {
      v13 = *(_DWORD *)(*(_QWORD *)(v12 + 24) + 8 * (int)_findIndexForKey(a1, v12, __s1, a4, 0));
      v14 = bswap32(v13);
      if ((*(_DWORD *)(a1 + 356) & 0x40) != 0)
        v15 = v14;
      else
        v15 = v13;
      Page = _findPage(a1, v15);
      v12 = (uint64_t)Page;
      if (!Page)
        break;
      if (a2)
      {
        BOMStackPush(a2, (uint64_t)Page, v17, v18, v19, v20, v21, v22);
        v23 = *(_WORD *)(v12 + 4) | 8;
      }
      else
      {
        v23 = *((_WORD *)Page + 2);
      }
      *(_WORD *)(v12 + 4) = v23 & 0xFFFB;
    }
    while ((v23 & 1) == 0);
  }
  return v12;
}

uint64_t _BOMTreePrintPage(uint64_t a1, unsigned int *a2, FILE *a3, uint64_t a4, int a5, int a6, _DWORD *a7)
{
  int v8;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  __int16 v28;
  void **v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  size_t v33;
  unsigned int v34;
  unsigned int v35;
  size_t v36;
  void *v37;
  void *v38;
  char *v39;
  char *v40;
  signed int v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  int v52;
  int v53;
  int v54;
  void **v55;
  void *v56;
  unint64_t v57;
  int v58;
  unsigned int v59;
  _QWORD *Page;
  _QWORD *v61;
  char v62;
  char v63;
  int v64;
  int v66;
  char *v67;
  __int16 v68;
  size_t v69;
  uint64_t v70;
  unsigned int v71;
  int v74;
  int v75;

  v8 = a5;
  if (!a5)
    goto LABEL_10;
  v12 = a5;
  do
  {
    fwrite("                             ", 0x1DuLL, 1uLL, a3);
    --v12;
  }
  while (v12);
  if (v8)
  {
    fwrite("---", 3uLL, 1uLL, a3);
    v13 = (*a7)++;
    fprintf(a3, "| node #          : %*u\n", 8, v13);
    v14 = v8;
    do
    {
      fwrite("                             ", 0x1DuLL, 1uLL, a3);
      --v14;
    }
    while (v14);
    fwrite("   ", 3uLL, 1uLL, a3);
    fprintf(a3, "| bid             : %*u\n", 8, *a2);
    v15 = v8;
    do
    {
      fwrite("                             ", 0x1DuLL, 1uLL, a3);
      --v15;
    }
    while (v15);
    fwrite("   ", 3uLL, 1uLL, a3);
  }
  else
  {
LABEL_10:
    v16 = (*a7)++;
    fprintf(a3, "| node #          : %*u\n", 8, v16);
    fprintf(a3, "| bid             : %*u\n", 8, *a2);
  }
  v17 = BOMStorageSizeOfBlock(*(_QWORD *)a1, *a2);
  fprintf(a3, "| psize           : %*u\n", 8, v17);
  if (v8)
  {
    v18 = v8;
    do
    {
      fwrite("                             ", 0x1DuLL, 1uLL, a3);
      --v18;
    }
    while (v18);
    fwrite("   ", 3uLL, 1uLL, a3);
    fprintf(a3, "| prev            : %*u\n", 8, a2[3]);
    v19 = v8;
    do
    {
      fwrite("                             ", 0x1DuLL, 1uLL, a3);
      --v19;
    }
    while (v19);
    fwrite("   ", 3uLL, 1uLL, a3);
    fprintf(a3, "| next            : %*u\n", 8, a2[2]);
    v20 = v8;
    do
    {
      fwrite("                             ", 0x1DuLL, 1uLL, a3);
      --v20;
    }
    while (v20);
    fwrite("   ", 3uLL, 1uLL, a3);
  }
  else
  {
    fprintf(a3, "| prev            : %*u\n", 8, a2[3]);
    fprintf(a3, "| next            : %*u\n", 8, a2[2]);
  }
  fprintf(a3, "| num keys        : %*d/%d", 8, *((unsigned __int16 *)a2 + 8), *(_DWORD *)(a1 + 308));
  if ((a2[1] & 1) == 0)
  {
    fwrite("-----", 5uLL, 1uLL, a3);
    goto LABEL_40;
  }
  fputc(10, a3);
  if (v8)
  {
    v21 = v8;
    do
    {
      fwrite("                             ", 0x1DuLL, 1uLL, a3);
      --v21;
    }
    while (v21);
  }
  fwrite("   ", 3uLL, 1uLL, a3);
  if (*((_WORD *)a2 + 8))
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    do
    {
      v25 = bswap32(*(_DWORD *)(*((_QWORD *)a2 + 3) + v22));
      if ((*(_DWORD *)(a1 + 356) & 0x40) != 0)
        v26 = v25;
      else
        v26 = *(_DWORD *)(*((_QWORD *)a2 + 3) + v22);
      v24 += BOMStorageSizeOfBlock(*(_QWORD *)a1, v26);
      ++v23;
      v22 += 8;
    }
    while (v23 < *((unsigned __int16 *)a2 + 8));
  }
  else
  {
    v24 = 0;
    v23 = 0;
  }
  v27 = *(_DWORD *)(*((_QWORD *)a2 + 3) + 8 * v23);
  if ((*(_BYTE *)(a1 + 356) & 0x40) == 0)
  {
    if (!v27)
      goto LABEL_39;
    goto LABEL_38;
  }
  if (v27)
  {
    v27 = bswap32(v27);
LABEL_38:
    v24 += BOMStorageSizeOfBlock(*(_QWORD *)a1, v27);
  }
LABEL_39:
  fprintf(a3, "| data size       : %*lu", 8, v24);
LABEL_40:
  fputc(10, a3);
  v28 = *((_WORD *)a2 + 2);
  if ((v28 & 1) != 0)
  {
    v29 = (void **)BOM_calloc(*((unsigned __int16 *)a2 + 8), 8uLL);
    v74 = a6;
    v66 = v8;
    if (*((_WORD *)a2 + 8))
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0xFFFFFFFFLL;
      do
      {
        v34 = bswap32(*(_DWORD *)(*((_QWORD *)a2 + 3) + v30));
        if ((*(_BYTE *)(a1 + 356) & 0x40) != 0)
          v35 = v34;
        else
          v35 = *(_DWORD *)(*((_QWORD *)a2 + 3) + v30);
        if (v35)
        {
          v36 = BOMStorageSizeOfBlock(*(_QWORD *)a1, v35);
          if (v33 >= v36)
            v33 = v36;
          v37 = BOM_malloc(v36);
          if (v37)
          {
            v38 = v37;
            if (!BOMStorageCopyFromBlock(*(_QWORD *)a1, v35, v37))
              v29[v32++] = v38;
          }
        }
        ++v31;
        v30 += 8;
      }
      while (v31 < *((unsigned __int16 *)a2 + 8));
      v39 = (char *)malloc_type_malloc(v33, 0xC47B7872uLL);
      v67 = v39;
      if ((v33 & 0x80000000) == 0)
      {
        v40 = v39;
        v41 = 0;
        v42 = 0;
        do
        {
          v43 = 0;
          v44 = v33 - v41;
          if ((int)v33 < v41)
            ++v44;
          v45 = v41 + (v44 >> 1);
          v46 = (char *)*v29;
          while (v41 > v45)
          {
LABEL_62:
            if (++v43 > (unint64_t)((int)v32 - 1))
            {
              v69 = v45 - v41 + 1;
              memcpy(&v40[v42], &v46[v41], v69);
              v42 += v69;
              v41 = v45 + 1;
              goto LABEL_65;
            }
          }
          v47 = v41;
          while (*((unsigned __int8 *)v29[v43] + v47) == v46[v47])
          {
            if (++v47 > v45)
              goto LABEL_62;
          }
          LODWORD(v33) = v45 - 1;
LABEL_65:
          ;
        }
        while (v41 <= (int)v33);
        goto LABEL_69;
      }
    }
    else
    {
      v67 = (char *)malloc_type_malloc(0xFFFFFFFFuLL, 0xC47B7872uLL);
      v32 = 0;
    }
    v42 = 0;
LABEL_69:
    v48 = (char *)BOM_malloc((2 * v42) | 1);
    v49 = v48;
    v70 = v42;
    if (v42)
    {
      v50 = v67;
      v51 = v48;
      do
      {
        v52 = *v50++;
        v51 += sprintf(v51, "%02X", v52);
        --v42;
      }
      while (v42);
    }
    v8 = v66;
    if (v66)
    {
      v53 = v66;
      do
      {
        fwrite("                             ", 0x1DuLL, 1uLL, a3);
        --v53;
      }
      while (v53);
    }
    fwrite("   ", 3uLL, 1uLL, a3);
    fprintf(a3, "| common key part : %s (%lu bytes)\n", v49, v70);
    if (a4 && v70)
    {
      if (v66)
      {
        v54 = v66;
        do
        {
          fwrite("                             ", 0x1DuLL, 1uLL, a3);
          --v54;
        }
        while (v54);
      }
      fwrite("   ", 3uLL, 1uLL, a3);
      fwrite("|                 : ", 0x14uLL, 1uLL, a3);
      (*(void (**)(uint64_t, char *, uint64_t, FILE *))(a4 + 16))(a4, v67, v70, a3);
      fputc(10, a3);
    }
    free(v49);
    free(v67);
    if (v32)
    {
      v55 = v29;
      do
      {
        v56 = *v55++;
        free(v56);
        --v32;
      }
      while (v32);
    }
    free(v29);
    v28 = *((_WORD *)a2 + 2);
    a6 = v74;
  }
  if ((v28 & 1) != 0)
    return (unsigned __int16)a6;
  if (((*((unsigned __int16 *)a2 + 8) + 1) & 0x10000) != 0)
    goto LABEL_101;
  v68 = *((_WORD *)a2 + 8);
  v75 = a6;
  v57 = 0;
  v58 = v8 + 1;
  v71 = (unsigned __int16)(v8 + 1);
  do
  {
    v59 = *(_DWORD *)(*((_QWORD *)a2 + 3) + 8 * v57);
    if ((*(_BYTE *)(a1 + 356) & 0x40) != 0)
    {
      if (!v59)
        goto LABEL_99;
      v59 = bswap32(v59);
    }
    else if (!v59)
    {
      goto LABEL_99;
    }
    Page = _findPage(a1, v59);
    if (Page)
    {
      v61 = Page;
      v62 = 1;
      do
      {
        v63 = v62;
        v64 = v58;
        do
        {
          fwrite("                             ", 0x1DuLL, 1uLL, a3);
          --v64;
        }
        while (v64);
        fputc(124, a3);
        fputc(10, a3);
        v62 = 0;
      }
      while ((v63 & 1) != 0);
      v75 += _BOMTreePrintPage(a1, v61, a3, a4, v71, (unsigned __int16)(v75 + 2), a7) + 2;
    }
LABEL_99:
    ++v57;
  }
  while (v57 < (unsigned __int16)(v68 + 1));
  LOWORD(a6) = v75;
  if (v68)
LABEL_101:
    LOWORD(a6) = a6 + 3;
  return (unsigned __int16)a6;
}

uint64_t BOMStreamWithBlockID(uint64_t a1, unsigned int a2, size_t a3, int a4)
{
  _DWORD *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  int *v23;

  v8 = BOM_malloczero(0x58uLL);
  v9 = (uint64_t)v8;
  if (!v8)
  {
    v22 = __error();
    strerror(*v22);
    _CUILog();
    return v9;
  }
  v8[1] = 1;
  v10 = BOMStorageSizeOfBlock(a1, a2);
  *(_QWORD *)(v9 + 72) = BOMStorageGetSys(a1);
  *(_DWORD *)v9 = 0;
  *(_QWORD *)(v9 + 8) = a1;
  *(_DWORD *)(v9 + 16) = a2;
  if (a3)
    v11 = a3;
  else
    v11 = v10;
  *(_QWORD *)(v9 + 32) = v11;
  *(_DWORD *)(v9 + 40) = a4;
  if (v10 <= a3)
    v12 = a3;
  else
    v12 = v10;
  v13 = (char *)BOM_malloczero(v12);
  *(_QWORD *)(v9 + 48) = v13;
  if (!v13)
  {
    v23 = __error();
    strerror(*v23);
    _CUILog();
    goto LABEL_16;
  }
  v20 = (uint64_t)v13;
  *(_BYTE *)(v9 + 80) |= 1u;
  v21 = *(_QWORD *)(v9 + 32);
  *(_QWORD *)(v9 + 56) = v13;
  *(_QWORD *)(v9 + 64) = &v13[v21];
  if ((*(_DWORD *)(v9 + 40) | 2) != 2)
    goto LABEL_12;
  if (BOMStorageCopyFromBlock(a1, a2, v13))
  {
LABEL_16:
    BOMStreamFree(v9, v14, v20, v15, v16, v17, v18, v19);
    return 0;
  }
  v21 = *(_QWORD *)(v9 + 32);
LABEL_12:
  if (!v21)
    goto LABEL_16;
  return v9;
}

uint64_t BOMStreamFree(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  if (result)
  {
    v8 = result;
    if ((*(_BYTE *)(result + 80) & 2) != 0 && BOMStreamFlush((int *)result, a2, a3, a4, a5, a6, a7, a8))
    {
      return 1;
    }
    else
    {
      v9 = *(void **)(v8 + 48);
      if (v9)
      {
        if ((*(_BYTE *)(v8 + 80) & 1) != 0)
          free(v9);
      }
      free((void *)v8);
      return 0;
    }
  }
  return result;
}

_QWORD *BOMStreamWithFile(int a1, uint64_t a2, size_t a3, int a4, char *a5)
{
  return BOMStreamWithFileAndSys(a1, a2, a3, a4, a5, 0);
}

_QWORD *BOMStreamWithFileAndSys(int a1, uint64_t a2, size_t a3, int a4, char *a5, __int128 *a6)
{
  _QWORD *v12;
  int *v13;
  char *v14;
  int *v15;

  v12 = BOM_malloczero(0x58uLL);
  if (v12)
  {
    if (!a6)
      a6 = BomSys_default();
    v12[9] = a6;
    *v12 = 0x100000001;
    *((_DWORD *)v12 + 5) = a1;
    v12[3] = a2;
    v12[4] = a3;
    *((_DWORD *)v12 + 10) = a4;
    if (a5)
    {
      v12[6] = a5;
      *((_BYTE *)v12 + 80) &= ~1u;
      if ((a3 & 0x8000000000000000) != 0)
      {
LABEL_15:
        v15 = __error();
        strerror(*v15);
        _CUILog();
LABEL_16:
        BOMStreamFree(v12);
        return 0;
      }
    }
    else
    {
      v14 = (char *)BOM_malloczero(a3);
      v12[6] = v14;
      if (!v14)
        goto LABEL_15;
      a5 = v14;
      *((_BYTE *)v12 + 80) |= 1u;
      a3 = v12[4];
      if ((a3 & 0x8000000000000000) != 0)
        goto LABEL_15;
    }
    v12[7] = a5;
    v12[8] = &a5[a3];
    if ((*((_DWORD *)v12 + 10) | 2) == 2)
    {
      if ((*((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))a6 + 7))(*((_QWORD *)a6 + 1), *((unsigned int *)v12 + 5), v12[3], 0) == -1)goto LABEL_15;
      a3 = (*((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))a6 + 5))(*((_QWORD *)a6 + 1), *((unsigned int *)v12 + 5), v12[6], v12[4]);
      if (a3 != v12[4])
        goto LABEL_15;
    }
    if (!a3)
      goto LABEL_16;
  }
  else
  {
    v13 = __error();
    strerror(*v13);
    _CUILog();
  }
  return v12;
}

uint64_t BOMStreamWithAddress(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;

  v6 = BOM_malloczero(0x58uLL);
  v14 = (uint64_t)v6;
  if (v6)
  {
    *v6 = 0x100000002;
    v6[4] = a2;
    *((_DWORD *)v6 + 10) = a3;
    v6[6] = a1;
    *((_BYTE *)v6 + 80) &= ~1u;
    if (a2 < 0)
    {
      _CUILog();
LABEL_7:
      BOMStreamFree(v14, v7, v8, v9, v10, v11, v12, v13);
      return 0;
    }
    v6[7] = a1;
    v6[8] = a1 + a2;
    if (!a2)
      goto LABEL_7;
  }
  else
  {
    v15 = __error();
    strerror(*v15);
    _CUILog();
  }
  return v14;
}

uint64_t BOMStreamFlush(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t result;
  int *v11;

  if (!a1)
    goto LABEL_7;
  if (!a1[10])
    goto LABEL_12;
  v9 = *a1;
  if (*a1 == 2)
    goto LABEL_12;
  if (v9 == 1)
  {
    if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*((_QWORD *)a1 + 9) + 56))(*(_QWORD *)(*((_QWORD *)a1 + 9) + 8), a1[5], *((_QWORD *)a1 + 3), 0) != -1&& (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*((_QWORD *)a1 + 9) + 48))(*(_QWORD *)(*((_QWORD *)a1 + 9) + 8), a1[5], *((_QWORD *)a1 + 6), *((_QWORD *)a1 + 4)) == *((_QWORD *)a1 + 4))
    {
      goto LABEL_12;
    }
    v11 = __error();
    strerror(*v11);
LABEL_7:
    _CUILog();
    return 1;
  }
  if (v9)
  {
    _CUILog();
LABEL_12:
    result = 0;
    goto LABEL_13;
  }
  result = BOMStorageCopyToBlock(*((_QWORD *)a1 + 1), a1[4], *((const void **)a1 + 6), *((_QWORD *)a1 + 4), a5, a6, a7, a8);
LABEL_13:
  *((_BYTE *)a1 + 80) &= ~2u;
  return result;
}

uint64_t BOMStreamGetByteOrder(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 4);
  return result;
}

uint64_t BOMStreamReadUInt32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v9;
  int v10;
  char *v11;
  unsigned __int8 v12;
  int v13;
  unsigned int *v14;
  unsigned int *v15;
  char *v16;
  unsigned int v17;
  unsigned int v18;

  if (*(_DWORD *)(a1 + 40) == 1)
  {
    v9 = BOMExceptionHandlerMessage("%s read called on read-only buffer", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamReadUInt32");
    v10 = *__error();
    v11 = v9;
    v12 = 0;
    v13 = 272;
LABEL_5:
    _BOMExceptionHandlerCall(v11, v12, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v13, v10);
    v17 = 0;
    goto LABEL_7;
  }
  v14 = *(unsigned int **)(a1 + 56);
  v15 = v14 + 1;
  if ((unint64_t)(v14 + 1) > *(_QWORD *)(a1 + 64))
  {
    v16 = BOMExceptionHandlerMessage("%s buffer overflow", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamReadUInt32");
    v10 = *__error();
    v11 = v16;
    v12 = 1;
    v13 = 274;
    goto LABEL_5;
  }
  v17 = *v14;
  *(_QWORD *)(a1 + 56) = v15;
LABEL_7:
  v18 = bswap32(v17);
  if (*(_DWORD *)(a1 + 4) == 2)
    return v17;
  else
    return v18;
}

uint64_t BOMStreamReadUInt16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v9;
  int v10;
  char *v11;
  unsigned __int8 v12;
  int v13;
  unsigned __int16 *v14;
  unsigned __int16 *v15;
  char *v16;
  unsigned int v17;
  unsigned int v18;

  if (*(_DWORD *)(a1 + 40) == 1)
  {
    v9 = BOMExceptionHandlerMessage("%s read called on read-only buffer", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamReadUInt16");
    v10 = *__error();
    v11 = v9;
    v12 = 0;
    v13 = 292;
LABEL_5:
    _BOMExceptionHandlerCall(v11, v12, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v13, v10);
    v17 = 0;
    goto LABEL_7;
  }
  v14 = *(unsigned __int16 **)(a1 + 56);
  v15 = v14 + 1;
  if ((unint64_t)(v14 + 1) > *(_QWORD *)(a1 + 64))
  {
    v16 = BOMExceptionHandlerMessage("%s buffer overflow", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamReadUInt16");
    v10 = *__error();
    v11 = v16;
    v12 = 1;
    v13 = 294;
    goto LABEL_5;
  }
  v17 = *v14;
  *(_QWORD *)(a1 + 56) = v15;
LABEL_7:
  v18 = __rev16(v17);
  if (*(_DWORD *)(a1 + 4) == 2)
    return v17;
  else
    return v18;
}

uint64_t BOMStreamReadUInt8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  int v9;
  char *v10;
  unsigned __int8 v11;
  int v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  char *v15;
  uint64_t v16;

  if (*(_DWORD *)(a1 + 40) == 1)
  {
    v8 = BOMExceptionHandlerMessage("%s read called on read-only buffer", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamReadUInt8");
    v9 = *__error();
    v10 = v8;
    v11 = 0;
    v12 = 312;
  }
  else
  {
    v13 = *(unsigned __int8 **)(a1 + 56);
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) <= *(_QWORD *)(a1 + 64))
    {
      v16 = *v13;
      *(_QWORD *)(a1 + 56) = v14;
      return v16;
    }
    v15 = BOMExceptionHandlerMessage("%s buffer overflow", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamReadUInt8");
    v9 = *__error();
    v10 = v15;
    v11 = 1;
    v12 = 314;
  }
  _BOMExceptionHandlerCall(v10, v11, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v12, v9);
  return 0;
}

uint64_t (*BOMStreamReadBuffer(uint64_t a1, void *__dst, size_t __len, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(_QWORD *)
{
  char *v8;
  int v9;
  char *v10;
  unsigned __int8 v11;
  int v12;
  const void *v15;
  char *v16;
  uint64_t (*result)(_QWORD *);
  char *v18;

  if (*(_DWORD *)(a1 + 40) == 1)
  {
    v8 = BOMExceptionHandlerMessage("%s read called on read-only buffer", (uint64_t)__dst, __len, a4, a5, a6, a7, a8, (char)"BOMStreamReadBuffer");
    v9 = *__error();
    v10 = v8;
    v11 = 0;
    v12 = 326;
    return _BOMExceptionHandlerCall(v10, v11, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v12, v9);
  }
  v15 = *(const void **)(a1 + 56);
  if (__CFADD__(__len, v15))
  {
    v18 = BOMExceptionHandlerMessage("%s buffer overflow", (uint64_t)__dst, __len, a4, a5, a6, a7, a8, (char)"BOMStreamReadBuffer");
    v9 = *__error();
    v10 = v18;
    v11 = 1;
    v12 = 338;
    return _BOMExceptionHandlerCall(v10, v11, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v12, v9);
  }
  if ((unint64_t)v15 + __len > *(_QWORD *)(a1 + 64))
  {
    v16 = BOMExceptionHandlerMessage("%s buffer overflow", (uint64_t)__dst, __len, a4, a5, a6, a7, a8, (char)"BOMStreamReadBuffer");
    v9 = *__error();
    v10 = v16;
    v11 = 1;
    v12 = 341;
    return _BOMExceptionHandlerCall(v10, v11, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v12, v9);
  }
  result = (uint64_t (*)(_QWORD *))memmove(__dst, v15, __len);
  *(_QWORD *)(a1 + 56) += __len;
  return result;
}

BOOL BOMStreamAtEOF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v9;
  int *v10;

  if (*(_DWORD *)(a1 + 40))
  {
    v9 = BOMExceptionHandlerMessage("%s Can't check EOF on a writeable stream", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamAtEOF");
    v10 = __error();
    _BOMExceptionHandlerCall(v9, 1u, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", 353, *v10);
  }
  return *(_QWORD *)(a1 + 56) == *(_QWORD *)(a1 + 64);
}

uint64_t (*BOMStreamWriteUInt32(uint64_t (*result)(_QWORD *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(_QWORD *)
{
  unsigned int v8;
  int v9;
  _DWORD *v10;
  char *v11;
  int v12;
  char *v13;
  unsigned __int8 v14;
  int v15;
  char *v16;

  v8 = bswap32(a2);
  if (*((_DWORD *)result + 1) == 2)
    v9 = a2;
  else
    v9 = v8;
  if (!*((_DWORD *)result + 10))
  {
    v16 = BOMExceptionHandlerMessage("%s write called on read-only buffer", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamWriteUInt32");
    v12 = *__error();
    v13 = v16;
    v14 = 0;
    v15 = 371;
    return _BOMExceptionHandlerCall(v13, v14, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v15, v12);
  }
  v10 = (_DWORD *)*((_QWORD *)result + 7);
  if ((unint64_t)(v10 + 1) > *((_QWORD *)result + 8))
  {
    v11 = BOMExceptionHandlerMessage("%s buffer overflow", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamWriteUInt32");
    v12 = *__error();
    v13 = v11;
    v14 = 1;
    v15 = 373;
    return _BOMExceptionHandlerCall(v13, v14, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v15, v12);
  }
  *v10 = v9;
  *((_QWORD *)result + 7) += 4;
  *((_BYTE *)result + 80) |= 2u;
  return result;
}

uint64_t (*BOMStreamWriteUInt16(uint64_t (*result)(_QWORD *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(_QWORD *)
{
  __int16 v8;
  __int16 v9;
  _WORD *v10;
  char *v11;
  int v12;
  char *v13;
  unsigned __int8 v14;
  int v15;
  char *v16;

  v8 = __rev16(a2);
  if (*((_DWORD *)result + 1) == 2)
    v9 = a2;
  else
    v9 = v8;
  if (!*((_DWORD *)result + 10))
  {
    v16 = BOMExceptionHandlerMessage("%s write called on read-only buffer", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamWriteUInt16");
    v12 = *__error();
    v13 = v16;
    v14 = 0;
    v15 = 390;
    return _BOMExceptionHandlerCall(v13, v14, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v15, v12);
  }
  v10 = (_WORD *)*((_QWORD *)result + 7);
  if ((unint64_t)(v10 + 1) > *((_QWORD *)result + 8))
  {
    v11 = BOMExceptionHandlerMessage("%s buffer overflow", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamWriteUInt16");
    v12 = *__error();
    v13 = v11;
    v14 = 1;
    v15 = 392;
    return _BOMExceptionHandlerCall(v13, v14, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v15, v12);
  }
  *v10 = v9;
  *((_QWORD *)result + 7) += 2;
  *((_BYTE *)result + 80) |= 2u;
  return result;
}

uint64_t (*BOMStreamWriteUInt8(uint64_t (*result)(_QWORD *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(_QWORD *)
{
  _BYTE *v8;
  char *v9;
  int v10;
  char *v11;
  unsigned __int8 v12;
  int v13;
  char *v14;

  if (!*((_DWORD *)result + 10))
  {
    v14 = BOMExceptionHandlerMessage("%s write called on read-only buffer", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamWriteUInt8");
    v10 = *__error();
    v11 = v14;
    v12 = 0;
    v13 = 403;
    return _BOMExceptionHandlerCall(v11, v12, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v13, v10);
  }
  v8 = (_BYTE *)*((_QWORD *)result + 7);
  if ((unint64_t)(v8 + 1) > *((_QWORD *)result + 8))
  {
    v9 = BOMExceptionHandlerMessage("%s buffer overflow", a2, a3, a4, a5, a6, a7, a8, (char)"BOMStreamWriteUInt8");
    v10 = *__error();
    v11 = v9;
    v12 = 1;
    v13 = 405;
    return _BOMExceptionHandlerCall(v11, v12, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v13, v10);
  }
  *v8 = a2;
  ++*((_QWORD *)result + 7);
  *((_BYTE *)result + 80) |= 2u;
  return result;
}

uint64_t (*BOMStreamWriteBuffer(uint64_t a1, const void *a2, size_t __len, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(_QWORD *)
{
  void *v10;
  char *v11;
  int v12;
  char *v13;
  unsigned __int8 v14;
  int v15;
  char *v16;
  uint64_t (*result)(_QWORD *);

  if (!*(_DWORD *)(a1 + 40))
  {
    v16 = BOMExceptionHandlerMessage("%s write called on read-only buffer", (uint64_t)a2, __len, a4, a5, a6, a7, a8, (char)"BOMStreamWriteBuffer");
    v12 = *__error();
    v13 = v16;
    v14 = 0;
    v15 = 416;
    return _BOMExceptionHandlerCall(v13, v14, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v15, v12);
  }
  v10 = *(void **)(a1 + 56);
  if ((unint64_t)v10 + __len > *(_QWORD *)(a1 + 64))
  {
    v11 = BOMExceptionHandlerMessage("%s buffer overflow", (uint64_t)a2, __len, a4, a5, a6, a7, a8, (char)"BOMStreamWriteBuffer");
    v12 = *__error();
    v13 = v11;
    v14 = 1;
    v15 = 418;
    return _BOMExceptionHandlerCall(v13, v14, "/Library/Caches/com.apple.xbs/Sources/CoreUI/Bom/Storage/BOMStream.c", v15, v12);
  }
  result = (uint64_t (*)(_QWORD *))memmove(v10, a2, __len);
  *(_QWORD *)(a1 + 56) += __len;
  *(_BYTE *)(a1 + 80) |= 2u;
  return result;
}

uint64_t BOMStreamGetDataPointer(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_DWORD *)(a1 + 40))
    return 0;
  result = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = result + a2;
  return result;
}

void CopyImageBlockSetCallback_cold_1()
{
  __assert_rtn("CopyImageBlockSetCallback", "IFImage.m", 61, "[imageDataSource isKindOfClass:[NSData class]] == YES");
}

void ReleaseInfoCallback_cold_1()
{
  __assert_rtn("ReleaseInfoCallback", "IFImage.m", 80, "[imageDataSource isKindOfClass:[NSData class]] || [imageDataSource isKindOfClass:[ISCGImageBlockSet class]]");
}

void logAndSetError_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_1D4106000, log, OS_LOG_TYPE_ERROR, "%@ (%ld)", (uint8_t *)&v3, 0x16u);
}

void __CUISubtypeFromIndex_cold_1(uint64_t a1)
{
  CUIPlatformNameForPlatform(a1);
  OUTLINED_FUNCTION_0_2();
  abort();
}

void CUIFillRenditionKeyForCARKeyArray_cold_1()
{
  __assert_rtn("CUIFillRenditionKeyForCARKeyArray", "CUIThemeRendition_Support.m", 37, "CARKeyArray && key");
}

void CUIRenditionKeySetValueForAttribute_cold_1()
{
  __assert_rtn("CUIRenditionKeySetValueForAttribute", "CUIThemeRendition_Support.m", 513, "maxCountIncludingZeroTerminator > 0");
}

void CUIRenditionKeySetValueForAttribute_cold_2()
{
  __assert_rtn("CUIRenditionKeySetValueForAttribute", "CUIThemeRendition_Support.m", 525, "tokenCount < maxCountIncludingZeroTerminator - 1");
}

void CUIRenditionKeySetValueForAttribute_cold_3()
{
  __assert_rtn("CUIRenditionKeySetValueForAttribute", "CUIThemeRendition_Support.m", 538, "tokenCount < maxCountIncludingZeroTerminator");
}

void CUIFillCARKeyArrayForRenditionKey2_cold_1()
{
  __assert_rtn("CUIFillCARKeyArrayForRenditionKey2", "CUIThemeRendition_Support.m", 580, "CARKeyArray && key");
}

void CUIRenditionKeyCopy_cold_1()
{
  __assert_rtn("CUIRenditionKeyCopy", "CUIThemeRendition_Support.m", 868, "result && key");
}

void CUIRenditionKeyCopy_cold_2()
{
  __assert_rtn("CUIRenditionKeyCopy", "CUIThemeRendition_Support.m", 871, "maxCountIncludingZeroTerminator > 0 && tokenCount < maxCountIncludingZeroTerminator");
}

void CUICopyKeySignatureWithPrefix_cold_1()
{
  __assert_rtn("CUICopyKeySignatureWithPrefix", "CUIThemeRendition_Support.m", 755, "keyFormat");
}

void _CUIRenditionKeySetIntegerValueForAttribute_cold_1(unsigned __int16 a1)
{
  CUIThemeAttributeNameToString(a1);
  _CUILog();
  __assert_rtn("_CUIRenditionKeySetIntegerValueForAttribute", "CUIRenditionKey.m", 28, "0");
}

void CUIBitVectorToString_cold_1()
{
  __assert_rtn("CUIBitVectorToString", "CUIBitVector.c", 332, "index < (int)size");
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFArrayRef CFBundleCopyResourceURLsOfType(CFBundleRef bundle, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFArrayRef)MEMORY[0x1E0C98098](bundle, resourceType, subDirName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C990E0](string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1E0C99128](string);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1E0C99338](url, key, propertyValueTypeRefPtr, error);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BC90](color, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x1E0C9BCF8](color);
  return result;
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

uint64_t CGContextClear()
{
  return MEMORY[0x1E0C9C018]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x1E0C9C030](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C038](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
  MEMORY[0x1E0C9C1A0](c, page);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFlush(CGContextRef c)
{
  MEMORY[0x1E0C9C230](c);
}

uint64_t CGContextGetBlendMode()
{
  return MEMORY[0x1E0C9C248]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9C260](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGContextGetFillColorAsColor()
{
  return MEMORY[0x1E0C9C280]();
}

uint64_t CGContextGetLineWidth()
{
  return MEMORY[0x1E0C9C2C0]();
}

uint64_t CGContextGetStrokeColorAsColor()
{
  return MEMORY[0x1E0C9C2F8]();
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x1E0C9C3D8]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
  MEMORY[0x1E0C9C4E0](c, shouldSmoothFonts);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
  MEMORY[0x1E0C9C520](c, *(_QWORD *)&mode);
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x1E0C9C530](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C538](c, x, y);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C578](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

uint64_t CGImageBlockCreate()
{
  return MEMORY[0x1E0C9CB00]();
}

uint64_t CGImageBlockSetCreate()
{
  return MEMORY[0x1E0C9CB28]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1E0C9CB68]();
}

uint64_t CGImageBlockSetRetain()
{
  return MEMORY[0x1E0C9CB70]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGImageCreateWithImageProvider()
{
  return MEMORY[0x1E0C9CBB0]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1E0C9CC70]();
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1E0C9CC98]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

uint64_t CGImageProviderCopyImageBlockSet()
{
  return MEMORY[0x1E0C9CD18]();
}

uint64_t CGImageProviderCreate()
{
  return MEMORY[0x1E0C9CD30]();
}

uint64_t CGImageProviderGetColorSpace()
{
  return MEMORY[0x1E0C9CD50]();
}

uint64_t CGImageProviderGetComponentType()
{
  return MEMORY[0x1E0C9CD58]();
}

uint64_t CGImageProviderGetSize()
{
  return MEMORY[0x1E0C9CD80]();
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1E0C9CDC0]();
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x1E0C9CF60](url);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x1E0C9CF98](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x1E0C9CFA0](document, pageNumber);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D090](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1E0CA7A68](*(_QWORD *)&uiType, language, size);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1E0CA7EA8](line, context);
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EE0](line, context);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x1E0CA7F18](line, ascent, descent, leading);
  return result;
}

uint64_t CUILogHandle()
{
  return MEMORY[0x1E0D1A690]();
}

uint64_t CUILogRenditionLogEnabled()
{
  return MEMORY[0x1E0D1A698]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1E0CA5940](inUTI, inConformsToUTI);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x1E0C99FA8]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CUILog()
{
  return MEMORY[0x1E0D1A6F8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __CFSetLastAllocationEventName()
{
  return MEMORY[0x1E0C9A9A0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1E0C80C30]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t __strncat_chk()
{
  return MEMORY[0x1E0C80C50]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1E0C82B20]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1E0C82B28](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C832E0](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1E0C83570](*(_QWORD *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1E0C83578](*(_QWORD *)&a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1E0C841C0](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1E0C850F0](path, name, *(_QWORD *)&options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl stpncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C854F8](__dst, __src, __n);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C85A00](uu);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x1E0C85A20](out);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x1E0C85A90](*(_QWORD *)&target_task, source_address, size, dest_address);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

