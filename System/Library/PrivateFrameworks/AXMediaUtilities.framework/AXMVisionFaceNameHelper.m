@implementation AXMVisionFaceNameHelper

- (void)_resetState
{
  -[AXMVisionFaceNameHelper set_personsModel:](self, "set_personsModel:", 0);
  -[AXMVisionFaceNameHelper set_personsModelFileModifiedDate:](self, "set_personsModelFileModifiedDate:", 0);
  -[AXMVisionFaceNameHelper set_personLocalIdentifierToName:](self, "set_personLocalIdentifierToName:", 0);
  -[AXMVisionFaceNameHelper set_lastFileModificationCheckTime:](self, "set_lastFileModificationCheckTime:", 0.0);
}

- (unint64_t)faceprintRequestRevisionForPersonsModel
{
  id VCPMediaAnalyzerClass;
  void *v4;
  unint64_t v5;

  VCPMediaAnalyzerClass = getVCPMediaAnalyzerClass();
  -[AXMVisionFaceNameHelper _personsModel](self, "_personsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(VCPMediaAnalyzerClass, "faceprintRevisionForPersonModel:", v4);

  return v5;
}

- (id)photoLibraryWithURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)getPHPhotoLibraryClass_0()), "initWithPhotoLibraryURL:", v3);
    v11 = 0;
    v5 = objc_msgSend(v4, "openAndWaitWithUpgrade:error:", 0, &v11);
    v6 = v11;
    v7 = v6;
    if (v4 && !v6 && v5)
    {
      v8 = v4;
    }
    else
    {
      AXMediaLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[AXMVisionFaceNameHelper photoLibraryWithURL:].cold.1((uint64_t)v3, (uint64_t)v7, v9);

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_filePathForPersonsModelWithPhotoLibraryURL:(id)a3
{
  void *v3;
  void *v4;

  -[AXMVisionFaceNameHelper photoLibraryWithURL:](self, "photoLibraryWithURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(getVCPMediaAnalyzerClass(), "personModelFilepathForPhotoLibrary:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_loadPersonsModelWithPhotoLibraryURL:(id)a3
{
  id v4;
  double Current;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  double v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  NSObject *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  -[AXMVisionFaceNameHelper _filePathForPersonsModelWithPhotoLibraryURL:](self, "_filePathForPersonsModelWithPhotoLibraryURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    AXMediaLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "AXMVisionFaceNameHelper: Could not find filepath of VNPersonsModel";
      v16 = v10;
      v17 = 2;
LABEL_10:
      _os_log_impl(&dword_1B0E3B000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    }
LABEL_11:
    v11 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((v8 & 1) == 0)
  {
    AXMediaLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = *(double *)&v6;
      v15 = "AXMVisionFaceNameHelper: VNPersonsModel model path does not exist '%@'. (it may not be created yet)";
      v16 = v10;
      v17 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v20 = 0;
  objc_msgSend(getVCPMediaAnalyzerClass(), "loadPersonModelAtPath:error:", v6, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  v11 = v9 != 0;
  if (v9)
  {
    -[AXMVisionFaceNameHelper set_personsModel:](self, "set_personsModel:", v9);
    -[AXMVisionFaceNameHelper _fileModificationDateForPath:](self, "_fileModificationDateForPath:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFaceNameHelper set_personsModelFileModifiedDate:](self, "set_personsModelFileModifiedDate:", v12);

    -[AXMVisionFaceNameHelper set_lastFileModificationCheckTime:](self, "set_lastFileModificationCheckTime:", CFAbsoluteTimeGetCurrent());
    v13 = CFAbsoluteTimeGetCurrent();
    AXMediaLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v22 = v13 - Current;
      _os_log_impl(&dword_1B0E3B000, v14, OS_LOG_TYPE_DEFAULT, "AXMVisionFaceNameHelper: VNPersonsModel loadTime: %.3f", buf, 0xCu);
    }
  }
  else
  {
    AXMediaLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = *(double *)&v6;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_1B0E3B000, v14, OS_LOG_TYPE_DEFAULT, "AXMVisionFaceNameHelper: Could not load VNPersonsModel from path %@: %@ %@", buf, 0x20u);

    }
  }

LABEL_15:
  return v11;
}

- (BOOL)_shouldReloadPersonsModelWithPhotoLibraryURL:(id)a3
{
  id v4;
  void *v5;
  double Current;
  double v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v15;
  uint8_t v16[16];

  v4 = a3;
  -[AXMVisionFaceNameHelper _personsModel](self, "_personsModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (Current = CFAbsoluteTimeGetCurrent(),
        -[AXMVisionFaceNameHelper _lastFileModificationCheckTime](self, "_lastFileModificationCheckTime"),
        Current - v7 >= 600.0))
  {
    -[AXMVisionFaceNameHelper set_lastFileModificationCheckTime:](self, "set_lastFileModificationCheckTime:", CFAbsoluteTimeGetCurrent());
    -[AXMVisionFaceNameHelper _filePathForPersonsModelWithPhotoLibraryURL:](self, "_filePathForPersonsModelWithPhotoLibraryURL:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFaceNameHelper _fileModificationDateForPath:](self, "_fileModificationDateForPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && (-[AXMVisionFaceNameHelper _personsModelFileModifiedDate](self, "_personsModelFileModifiedDate"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v11)
      && (-[AXMVisionFaceNameHelper _personsModelFileModifiedDate](self, "_personsModelFileModifiedDate"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v10, "isEqualToDate:", v12),
          v12,
          (v13 & 1) == 0))
    {
      AXMediaLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1B0E3B000, v15, OS_LOG_TYPE_DEFAULT, "AXMVisionFaceNameHelper: Resetting state for change to personsModel file", v16, 2u);
      }

      v8 = 1;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_photoAuthorizationMessage:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return *(&off_1E625EFB8 + a3);
}

- (BOOL)_checkPhotoLibraryAuthorization
{
  return objc_msgSend(getPHPhotoLibraryClass_0(), "authorizationStatus") == 3;
}

- (id)_fileModificationDateForPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;

    if (v5)
    {
      objc_msgSend(v5, "fileModificationDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      AXMediaLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v13 = v3;
        v14 = 2112;
        v15 = v6;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_1B0E3B000, v8, OS_LOG_TYPE_DEFAULT, "AXMVisionFaceNameHelper: Could not load get fileModificationDate from path %@: %@ %@", buf, 0x20u);

      }
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_fetchPersonsForLocalIdentifiers:(id)a3 withPhotoLibraryURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  -[AXMVisionFaceNameHelper photoLibraryWithURL:](self, "photoLibraryWithURL:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIncludeGuestAssets:", 1);
    objc_msgSend(v11, "setMinimumVerifiedFaceCount:", 0);
    objc_msgSend(v11, "setMinimumUnverifiedFaceCount:", 0);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType == %d"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v12);

    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v13 = (void *)getPHPersonClass_softClass;
    v21 = getPHPersonClass_softClass;
    if (!getPHPersonClass_softClass)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __getPHPersonClass_block_invoke;
      v17[3] = &unk_1E625C4E8;
      v17[4] = &v18;
      __getPHPersonClass_block_invoke((uint64_t)v17);
      v13 = (void *)v19[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v18, 8);
    objc_msgSend(v14, "fetchPersonsWithLocalIdentifiers:options:", v8, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)prepareForLookupWithPhotoLibraryURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  const char *v9;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[AXMVisionFaceNameHelper _isDeviceUnlocked](self, "_isDeviceUnlocked"))
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "AXMVisionFaceNameHelper: Device is locked so face names should not be available";
LABEL_9:
      _os_log_impl(&dword_1B0E3B000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
LABEL_10:

LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  if (-[AXMVisionFaceNameHelper _shouldReloadPersonsModelWithPhotoLibraryURL:](self, "_shouldReloadPersonsModelWithPhotoLibraryURL:", v4))
  {
    -[AXMVisionFaceNameHelper _resetState](self, "_resetState");
  }
  -[AXMVisionFaceNameHelper _personLocalIdentifierToName](self, "_personLocalIdentifierToName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (!-[AXMVisionFaceNameHelper _checkPhotoLibraryAuthorization](self, "_checkPhotoLibraryAuthorization"))
    {
      AXMediaLogCommon();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[AXMVisionFaceNameHelper _photoAuthorizationMessage:](self, "_photoAuthorizationMessage:", (int)objc_msgSend(getPHPhotoLibraryClass_0(), "authorizationStatus"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = v28;
        _os_log_impl(&dword_1B0E3B000, v27, OS_LOG_TYPE_DEFAULT, "AXMVisionFaceNameHelper: PhotoLibrary Authorization Failure - Face names will not be available : %@", buf, 0xCu);

      }
      goto LABEL_11;
    }
    if (-[AXMVisionFaceNameHelper _loadPersonsModelWithPhotoLibraryURL:](self, "_loadPersonsModelWithPhotoLibraryURL:", v4))
    {
      -[AXMVisionFaceNameHelper _personsModel](self, "_personsModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[AXMVisionFaceNameHelper set_personLocalIdentifierToName:](self, "set_personLocalIdentifierToName:", v11);

      if (objc_msgSend(v6, "personCount"))
      {
        objc_msgSend(v6, "personUniqueIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMVisionFaceNameHelper _fetchPersonsForLocalIdentifiers:withPhotoLibraryURL:](self, "_fetchPersonsForLocalIdentifiers:withPhotoLibraryURL:", v12, v4);
        v13 = objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v29 = v6;
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v14 = v13;
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v31;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v31 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
                objc_msgSend(v19, "displayName");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v20;
                if (v20)
                {
                  v22 = v20;
                }
                else
                {
                  objc_msgSend(v19, "name");
                  v22 = (id)objc_claimAutoreleasedReturnValue();
                }
                v23 = v22;

                -[AXMVisionFaceNameHelper _personLocalIdentifierToName](self, "_personLocalIdentifierToName");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "localIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);

              }
              v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
            }
            while (v16);
          }

          v6 = v29;
        }
        -[AXMVisionFaceNameHelper _personLocalIdentifierToName](self, "_personLocalIdentifierToName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v26, "count") != 0;

      }
      else
      {
        AXMediaLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B0E3B000, v13, OS_LOG_TYPE_DEFAULT, "AXMVisionFaceNameHelper: No persons found in VNPersonsModel so face names will not be available", buf, 2u);
        }
        v7 = 0;
      }

      goto LABEL_6;
    }
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "AXMVisionFaceNameHelper: Failed to load VNPersonsModel so face names will not be available";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  -[AXMVisionFaceNameHelper _personLocalIdentifierToName](self, "_personLocalIdentifierToName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;
LABEL_6:

LABEL_12:
  return v7;
}

- (id)nameForFaceObservation:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id VCPMediaAnalyzerClass;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v15;

  v4 = a3;
  v5 = -[AXMVisionFaceNameHelper _checkPhotoLibraryAuthorization](self, "_checkPhotoLibraryAuthorization");
  v6 = 0;
  if (v4 && v5)
  {
    -[AXMVisionFaceNameHelper _personLocalIdentifierToName](self, "_personLocalIdentifierToName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      AXMediaLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AXMVisionFaceNameHelper nameForFaceObservation:].cold.1(v12);
      v6 = 0;
      goto LABEL_15;
    }
    VCPMediaAnalyzerClass = getVCPMediaAnalyzerClass();
    -[AXMVisionFaceNameHelper _personsModel](self, "_personsModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(VCPMediaAnalyzerClass, "classifyFaceObservation:withPersonsModel:error:", v4, v10, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;

    if (v12)
    {
      AXMediaLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[AXMVisionFaceNameHelper nameForFaceObservation:].cold.2((uint64_t)v12, v13);
      v6 = 0;
    }
    else
    {
      if (!v11)
      {
        v6 = 0;
        goto LABEL_14;
      }
      -[AXMVisionFaceNameHelper _personLocalIdentifierToName](self, "_personLocalIdentifierToName");
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_14:
LABEL_15:

  }
  return v6;
}

- (BOOL)_isDeviceUnlocked
{
  uint64_t (*v2)(_QWORD);
  int v3;
  _Unwind_Exception *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v2 = (uint64_t (*)(_QWORD))getMKBGetDeviceLockStateSymbolLoc_ptr;
  v11 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v7[3] = &unk_1E625C4E8;
    v7[4] = &v8;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v7);
    v2 = (uint64_t (*)(_QWORD))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    v6 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  v3 = v2(0);
  return !v3 || v3 == 3;
}

- (VNPersonsModel)_personsModel
{
  return self->__personsModel;
}

- (void)set_personsModel:(id)a3
{
  objc_storeStrong((id *)&self->__personsModel, a3);
}

- (NSDate)_personsModelFileModifiedDate
{
  return self->__personsModelFileModifiedDate;
}

- (void)set_personsModelFileModifiedDate:(id)a3
{
  self->__personsModelFileModifiedDate = (NSDate *)a3;
}

- (NSMutableDictionary)_personLocalIdentifierToName
{
  return self->__personLocalIdentifierToName;
}

- (void)set_personLocalIdentifierToName:(id)a3
{
  objc_storeStrong((id *)&self->__personLocalIdentifierToName, a3);
}

- (double)_lastFileModificationCheckTime
{
  return self->__lastFileModificationCheckTime;
}

- (void)set_lastFileModificationCheckTime:(double)a3
{
  self->__lastFileModificationCheckTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__personLocalIdentifierToName, 0);
  objc_storeStrong((id *)&self->__personsModel, 0);
}

- (void)photoLibraryWithURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_fault_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_FAULT, "AXMVisionFaceNameHelper: Could not fetch Photo Library using the photo library URL : %@ error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)nameForFaceObservation:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "AXMVisionFaceNameHelper: no names cached for nameForFaceObservation", v1, 2u);
}

- (void)nameForFaceObservation:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "AXMVisionFaceNameHelper: Error classifying face. Error: %@ %@", (uint8_t *)&v5, 0x16u);

}

@end
