@implementation PHAssetBundleExportSession

- (PHAssetBundleExportSession)initWithAsset:(id)a3 withAssetExportRequestFileURLs:(id)a4
{
  id v7;
  id v8;
  PHAssetBundleExportSession *v9;
  void *v10;
  uint64_t v11;
  NSString *sessionUUID;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHAssetBundleExportSession;
  v9 = -[PHAssetBundleExportSession init](&v14, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v9->_sessionUUID;
    v9->_sessionUUID = (NSString *)v11;

    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v9->_fileURLs, a4);
  }

  return v9;
}

- (void)writeToDirectoryURL:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[PHAssetBundleExportSession asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetBundleExportSession fileURLs](self, "fileURLs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[PHAssetBundleExportSession _createAssetBundleFromAsset:withFileURLs:atURL:withError:](self, "_createAssetBundleFromAsset:withFileURLs:atURL:withError:", v8, v9, v7, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v12;
  if (v6)
    v6[2](v6, v10, v11);

}

- (id)_filenameBaseForAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  NSString *sessionUUID;
  void *v16;
  NSString *v17;
  void *v18;
  int v20;
  NSString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHAssetBundleExportSession customFilenameBase](self, "customFilenameBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[PHAssetBundleExportSession customFilenameBase](self, "customFilenameBase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "fetchPropertySetsIfNeeded");
    objc_msgSend(v4, "originalMetadataProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originalFilename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v9, "stringByDeletingPathExtension");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "filename");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      PLPhotoKitGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          sessionUUID = self->_sessionUUID;
          objc_msgSend(v4, "filename");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543618;
          v21 = sessionUUID;
          v22 = 2114;
          v23 = v16;
          _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEFAULT, "[AssetBundleExport: %{public}@] Asset does not have valid originalFilename, going with library filename: %{public}@", (uint8_t *)&v20, 0x16u);

        }
        objc_msgSend(v4, "filename");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v14)
        {
          v17 = self->_sessionUUID;
          objc_msgSend(v4, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543618;
          v21 = v17;
          v22 = 2114;
          v23 = v18;
          _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEFAULT, "[AssetBundleExport: %{public}@] Asset does not have valid originalFilename, going with UUID: %{public}@", (uint8_t *)&v20, 0x16u);

        }
        objc_msgSend(v4, "uuid");
        v10 = objc_claimAutoreleasedReturnValue();
      }
    }
    v7 = (void *)v10;

  }
  return v7;
}

- (id)_createAssetBundleFromAsset:(id)a3 withFileURLs:(id)a4 atURL:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  void *v73;
  _BOOL4 v74;
  uint64_t v75;
  void (**v76)(_QWORD);
  NSObject *v77;
  NSString *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  NSObject *v83;
  NSString *sessionUUID;
  NSObject *v85;
  NSString *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v91;
  uint64_t v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  PHAssetBundleExportSession *v103;
  void *v104;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  _QWORD block[4];
  void (**v112)(_QWORD);
  _QWORD aBlock[4];
  id v114;
  _BYTE *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  char v120;
  char v121;
  uint64_t v122;
  id v123;
  uint8_t v124[4];
  NSString *v125;
  _BYTE buf[24];
  id v127;
  _BYTE v128[128];
  _QWORD v129[3];
  uint64_t v130;
  id v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  _QWORD v135[4];

  v135[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v109 = a5;
  v103 = self;
  -[PHAssetBundleExportSession _filenameBaseForAsset:](self, "_filenameBaseForAsset:", v10);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchPropertySetsIfNeeded");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v107, *MEMORY[0x1E0D753C0]);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "URLByAppendingPathComponent:", v106);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = 0;
  objc_msgSend(v109, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v108, "fileExistsAtPath:isDirectory:", v13, &v121);

  if (v121)
    v15 = v14;
  else
    v15 = 0;
  if ((v15 & 1) != 0)
  {
LABEL_8:
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, v103, CFSTR("PHAssetBundleExportSession.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleURL"));

    }
    v120 = 0;
    objc_msgSend(v12, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v108, "fileExistsAtPath:isDirectory:", v22, &v120);

    if (v120)
      v24 = 1;
    else
      v24 = v23;
    if (v24 == 1)
      objc_msgSend(v108, "removeItemAtURL:error:", v12, 0);
    objc_msgSend(v10, "photoIrisProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "photoIrisVisibilityState");

    v27 = objc_msgSend(v10, "mediaType");
    if (v27 >= 4)
      v28 = 1;
    else
      v28 = v27;
    v29 = objc_msgSend(v10, "playbackStyle");
    if ((unint64_t)(v29 - 1) >= 5)
      v30 = 0;
    else
      v30 = v29;
    v101 = v30;
    v31 = objc_msgSend(v10, "playbackVariation");
    if ((v31 - 1) < 3)
      v32 = (unsigned __int16)(v31 - 1) + 1;
    else
      v32 = 0;
    v100 = v32;
    v33 = objc_msgSend(v10, "mediaSubtypes");
    v34 = (v33 >> 1) & 0x20 | v33 & 0x3F031F | (((v33 >> 10) & 1) << 22);
    if (v28 == 2)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestVideoFileURLKey"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if (v104)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        buf[0] = 0;
        objc_msgSend(v12, "path");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v102, "fileExistsAtPath:isDirectory:", v41, buf);

        if (buf[0])
          v43 = 1;
        else
          v43 = v42;
        if (v43 == 1)
          objc_msgSend(v102, "removeItemAtURL:error:", v12, 0);
        v44 = objc_alloc(MEMORY[0x1E0D750B8]);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestFullSizeVideoURLKey"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestAdjustmentBaseVideoURLKey"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestSpatialOvercaptureVideoURLKey"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestAdjustmentDataFileURLKey"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestOriginalAdjustmentDataFileURLKey"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v44, "initWithOriginalVideoURL:fullSizeRenderedVideoURL:adjustmentBaseVideoURL:spatialOvercaptureVideoURL:adjustmentsURL:originalAdjustmentsURL:mediaSubtypes:playbackStyle:playbackVariation:", v104, v45, v46, v47, v48, v49, v34, v101, v100);

LABEL_39:
        if (v40)
        {
          objc_msgSend(v10, "keywordProperties");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "keywordTitles");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setKeywordTitles:", v56);

          objc_msgSend(v10, "descriptionProperties");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "assetDescription");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setAssetDescription:", v58);

          objc_msgSend(v10, "descriptionProperties");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "accessibilityDescription");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setAccessibilityDescription:", v60);

          objc_msgSend(v10, "title");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setAssetTitle:", v61);

          objc_msgSend(v10, "originalMetadataProperties");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "originalFilename");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setOriginalFilename:", v63);

          objc_msgSend(v10, "creationDate");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "originalMetadataProperties");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "timeZone");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setLibraryCreationDate:inTimeZone:", v64, v66);

          objc_msgSend(v10, "location");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setLibraryLocation:", v67);

          v129[0] = CFSTR("PHAssetExportRequestSpatialOvercapturePhotoURLKey");
          v129[1] = CFSTR("PHAssetExportRequestSpatialOvercapturePairedVideoURLKey");
          v129[2] = CFSTR("PHAssetExportRequestSpatialOvercaptureVideoURLKey");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 3);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = 0u;
          v119 = 0u;
          v116 = 0u;
          v117 = 0u;
          v69 = v68;
          v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
          if (v70)
          {
            v71 = *(_QWORD *)v117;
            while (2)
            {
              for (i = 0; i != v70; ++i)
              {
                if (*(_QWORD *)v117 != v71)
                  objc_enumerationMutation(v69);
                objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i));
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = v73 == 0;

                if (!v74)
                {

                  *(_QWORD *)buf = 0;
                  *(_QWORD *)&buf[8] = buf;
                  *(_QWORD *)&buf[16] = 0x2020000000;
                  LOBYTE(v127) = 0;
                  v75 = MEMORY[0x1E0C809B0];
                  aBlock[0] = MEMORY[0x1E0C809B0];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __87__PHAssetBundleExportSession__createAssetBundleFromAsset_withFileURLs_atURL_withError___block_invoke;
                  aBlock[3] = &unk_1E35DF920;
                  v114 = v10;
                  v115 = buf;
                  v76 = (void (**)(_QWORD))_Block_copy(aBlock);
                  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
                  {
                    v76[2](v76);
                  }
                  else
                  {
                    block[0] = v75;
                    block[1] = 3221225472;
                    block[2] = __87__PHAssetBundleExportSession__createAssetBundleFromAsset_withFileURLs_atURL_withError___block_invoke_49;
                    block[3] = &unk_1E35DF948;
                    v112 = v76;
                    dispatch_sync(MEMORY[0x1E0C80D38], block);

                  }
                  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
                  {
                    PLPhotoKitGetLog();
                    v83 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                    {
                      sessionUUID = v103->_sessionUUID;
                      *(_DWORD *)v124 = 138543362;
                      v125 = sessionUUID;
                      _os_log_impl(&dword_1991EC000, v83, OS_LOG_TYPE_DEFAULT, "[AssetBundleExport: %{public}@] Marking SOC resource(s) as purgeable in asset bundle.", v124, 0xCu);
                    }

                    objc_msgSend(v40, "setSpatialOvercaptureResourcesPurgeable:", 1);
                  }

                  _Block_object_dispose(buf, 8);
                  goto LABEL_61;
                }
              }
              v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
              if (v70)
                continue;
              break;
            }
          }

LABEL_61:
          v110 = 0;
          objc_msgSend(v40, "writeToBundleAtURL:error:", v12, &v110);
          v82 = v110;
          if (v82)
          {
            PLPhotoKitGetLog();
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              v86 = v103->_sessionUUID;
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v86;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v12;
              *(_WORD *)&buf[22] = 2112;
              v127 = v82;
              _os_log_impl(&dword_1991EC000, v85, OS_LOG_TYPE_ERROR, "[AssetBundleExport: %{public}@] Unable to create '%@' bundle due to following error '%@'", buf, 0x20u);
            }

            v87 = (void *)MEMORY[0x1E0CB35C8];
            v122 = *MEMORY[0x1E0CB3388];
            v123 = v82;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobileslideshow.sharing"), 4, v88);
            v89 = (void *)objc_claimAutoreleasedReturnValue();

            if (a6)
              *a6 = objc_retainAutorelease(v89);

            v12 = 0;
          }
          goto LABEL_67;
        }
LABEL_69:
        v12 = v12;
        v21 = v12;
        goto LABEL_70;
      }
      PLPhotoKitGetLog();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        v78 = v103->_sessionUUID;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v78;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = 0;
        _os_log_impl(&dword_1991EC000, v77, OS_LOG_TYPE_DEFAULT, "[AssetBundleExport: %{public}@] Unable to initialize asset bundle. Original Video URL is: '%{public}@'. Need original video URL to be non-nil to properly create an asset bundle.", buf, 0x16u);
      }

      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The video URL (%@) was empty."), 0);
        v69 = (id)objc_claimAutoreleasedReturnValue();
        v79 = (void *)MEMORY[0x1E0CB35C8];
        v130 = *MEMORY[0x1E0CB2D50];
        v131 = v69;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobileslideshow.sharing"), 3, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        v82 = objc_retainAutorelease(v81);
        v40 = 0;
        *a6 = v82;
LABEL_67:

LABEL_68:
        goto LABEL_69;
      }
    }
    else
    {
      if (v28 != 1)
        goto LABEL_69;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestPhotoFileURLKey"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if (v104)
      {
        v93 = objc_alloc(MEMORY[0x1E0D750B8]);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestAlternatePhotoURLKey"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestFullSizePhotoURLKey"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestAdjustmentBaseFullSizePhotoURLKey"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestSpatialOvercapturePhotoURLKey"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestVideoFileURLKey"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestFullSizeVideoURLKey"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestAdjustmentBasePairedVideoURLKey"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestSpatialOvercapturePairedVideoURLKey"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestAdjustmentDataFileURLKey"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestOriginalAdjustmentDataFileURLKey"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestAdjustmentSecondaryDataFileURLKey"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LOWORD(v92) = v26 & 0xF;
        v40 = (void *)objc_msgSend(v93, "initWithOriginalPhotoURL:alternatePhotoURL:fullSizePhotoURL:adjustmentBaseFullSizePhotoURL:spatialOvercapturePhotoURL:originalPairedVideoURL:fullSizePairedVideoURL:adjustmentBaseFullSizePairedVideoURL:spatialOvercapturePairedVideoURL:fullSizeVideoURL:adjustmentsURL:originalAdjustmentsURL:adjustmentsSecondaryDataURL:mediaSubtypes:playbackStyle:playbackVariation:videoComplementVisibilityState:", v104, v102, v98, v97, v95, v96, v94, v35, v36, 0, v37, v38, v39, v34,
                        v101,
                        v100,
                        v92);

        goto LABEL_39;
      }
      PLPhotoKitGetLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = v103->_sessionUUID;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = 0;
        _os_log_impl(&dword_1991EC000, v50, OS_LOG_TYPE_DEFAULT, "[AssetBundleExport: %{public}@] Unable to initialize asset bundle. Original Photo URL is: '%{public}@'. Need original photo URL to be non-nil to properly create an asset bundle.", buf, 0x16u);
      }

      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The photo URL (%@) was empty."), 0);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)MEMORY[0x1E0CB35C8];
        v132 = *MEMORY[0x1E0CB2D50];
        v133 = v102;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobileslideshow.sharing"), 2, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        v99 = objc_retainAutorelease(v54);
        v40 = 0;
        *a6 = v99;

        goto LABEL_39;
      }
    }
    v40 = 0;
    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The output directory URL (%@) is missing or is not a directory."), v109);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v134 = *MEMORY[0x1E0CB2D50];
  v135[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v135, &v134, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobileslideshow.sharing"), 1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a6)
  {

    goto LABEL_8;
  }
  v20 = objc_retainAutorelease(v19);
  *a6 = v20;

  v21 = 0;
LABEL_70:

  return v21;
}

- (NSString)customFilenameBase
{
  return self->_customFilenameBase;
}

- (void)setCustomFilenameBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (NSDictionary)fileURLs
{
  return self->_fileURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_customFilenameBase, 0);
}

void __87__PHAssetBundleExportSession__createAssetBundleFromAsset_withFileURLs_atURL_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pl_managedAsset");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modernResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("resourceType IN %@ AND trashedState = 1"), &unk_1E36576A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "count") != 0;

}

uint64_t __87__PHAssetBundleExportSession__createAssetBundleFromAsset_withFileURLs_atURL_withError___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
