@implementation PHAssetCreationRequestPlaceholderSupport

- (id)initForNewObjectWithUUID:(id)a3
{
  id v4;
  id v5;
  PHAssetCreationRequestPlaceholderSupport *v6;

  v4 = a3;
  v5 = -[PHChangeRequestHelper initForNewObjectWithUUID:changeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithUUID:changeRequest:", v4, self);

  v6 = -[PHAssetCreationRequest initWithHelper:](self, "initWithHelper:", v5);
  return v6;
}

- (PHAssetCreationRequestPlaceholderSupport)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  PHAssetCreationRequestPlaceholderSupport *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHAssetCreationRequestPlaceholderSupport;
  v5 = -[PHAssetCreationRequest initWithXPCDict:request:clientAuthorization:](&v8, sel_initWithXPCDict_request_clientAuthorization_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_clientConnection, v6);

  }
  return v5;
}

- (void)changeFailedOnClientWithLibrary:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__PHAssetCreationRequestPlaceholderSupport_changeFailedOnClientWithLibrary_error___block_invoke;
  v7[3] = &unk_1E35DF9E8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

- (void)changeFailedOnDaemonWithLibrary:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  if (!self->_placeholderCreationMode)
  {
    v7[1] = 3221225472;
    v7[2] = __82__PHAssetCreationRequestPlaceholderSupport_changeFailedOnDaemonWithLibrary_error___block_invoke;
    v7[3] = &unk_1E35DF9E8;
    v7[4] = self;
    v6 = v5;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v5;
    objc_msgSend(v8, "performBlockAndWait:", v7);

    v5 = v6;
  }

}

- (unsigned)_bundleScopeForPlaceholderAsset
{
  return -[PHAssetCreationRequest duplicateAssetPhotoLibraryType](self, "duplicateAssetPhotoLibraryType") == 0;
}

- (id)_createPlaceholderManagedAssetFromSourceManagedAsset:(id)a3 inPhotoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  PHAssetCreationAdjustmentBakeInOptions *v16;
  void *v17;
  void *v18;
  PHAssetCreationMetadataCopyOptions *v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char v47;
  int v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  int v56;
  char v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  NSObject *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v68;
  uint64_t v69;
  char v70;
  id v71;
  BOOL v72;
  char v73;
  char v74;
  int v75;
  unsigned int v76;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  id v83;
  NSObject *v84;
  uint64_t *v85;
  uint64_t *v86;
  char v87;
  BOOL v88;
  BOOL v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  char v99;
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v78 = a4;
  v96 = 0;
  v97 = &v96;
  v98 = 0x2020000000;
  v99 = 1;
  v90 = 0;
  v91 = &v90;
  v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__6458;
  v94 = __Block_byref_object_dispose__6459;
  v95 = 0;
  LOWORD(v69) = 257;
  objc_msgSend(MEMORY[0x1E0D71880], "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", v78, 0, 0, objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForPlaceholder"), -[PHAssetCreationRequestPlaceholderSupport _bundleScopeForPlaceholderAsset](self, "_bundleScopeForPlaceholderAsset"), 0, 0, 0, 0, v69);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    *((_BYTE *)v97 + 24) = 0;
    v9 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to insert placeholder asset for source asset: %@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v91[5];
    v91[5] = v11;

  }
  if (!*((_BYTE *)v97 + 24))
    goto LABEL_47;
  v13 = -[PHAssetCreationRequest duplicateAssetPhotoLibraryType](self, "duplicateAssetPhotoLibraryType");
  if (v13 == 1)
    v75 = objc_msgSend(MEMORY[0x1E0D71880], "shouldPerformServerCopyWithSourceAsset:copyingFromMomentShare:photoLibrary:", v7, 1, v78);
  else
    v75 = 0;
  v89 = 0;
  objc_msgSend(v7, "deferredProcessingNeeded");
  if ((PLManagedAssetDeferredProcessingNeededRequiresPhotoFinalization() & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v7, "videoDeferredProcessingNeeded");
    v14 = PLManagedAssetVideoDeferredProcessingNeededRequiresVideoFinalization();
  }
  v15 = objc_msgSend(v7, "deferredProcessingNeeded");
  v72 = v15 == 2;
  if (v13 == 1)
  {
    v76 = 0;
    v70 = 1;
    v73 = 1;
    v74 = 1;
  }
  else
  {
    -[PHAssetCreationRequest adjustmentBakeInOptions](self, "adjustmentBakeInOptions");
    v16 = (PHAssetCreationAdjustmentBakeInOptions *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      v16 = objc_alloc_init(PHAssetCreationAdjustmentBakeInOptions);
    v17 = (void *)MEMORY[0x1E0D71880];
    -[PHAssetCreationAdjustmentBakeInOptions plRepresentation](v16, "plRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v17, "shouldBakeInAdjustmentsAndFlattenLivePhoto:forSourceAsset:adjustmentBakeInOptions:", &v89, v7, v18);

    if (-[PHAssetCreationAdjustmentBakeInOptions flattenLivePhotoToStillIfNeeded](v16, "flattenLivePhotoToStillIfNeeded"))
    {
      v76 = 1;
      v89 = 1;
    }
    -[PHAssetCreationRequest metadataCopyOptions](self, "metadataCopyOptions");
    v19 = (PHAssetCreationMetadataCopyOptions *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      v19 = objc_alloc_init(PHAssetCreationMetadataCopyOptions);
    v74 = -[PHAssetCreationMetadataCopyOptions shouldCopyTitleDescriptionAndKeywords](v19, "shouldCopyTitleDescriptionAndKeywords");
    v73 = -[PHAssetCreationMetadataCopyOptions shouldCopySpatialOverCaptureResources](v19, "shouldCopySpatialOverCaptureResources");
    v70 = -[PHAssetCreationMetadataCopyOptions shouldCopyLocationData](v19, "shouldCopyLocationData");

  }
  v20 = *((unsigned __int8 *)v97 + 24);
  if (v15 == 2)
    v21 = 1;
  else
    v21 = v14;
  if (v13 != 1 && *((_BYTE *)v97 + 24) && !v75 && v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PHAssetCreationRequestPlaceholderSupport _createPlaceholderManagedAssetFromSourceManagedAsset:inPhotoLibrary:error:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pl_photoLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "libraryServicesManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "databaseContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_retainAutorelease(v22);
    v26 = (void *)objc_msgSend(v25, "newShortLivedLibraryWithName:", objc_msgSend(v71, "UTF8String"));

    objc_msgSend(v8, "scopedIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scopedIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = dispatch_group_create();
    dispatch_group_enter(v30);
    objc_msgSend(v26, "managedObjectContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke;
    v79[3] = &unk_1E35D7060;
    v32 = v29;
    v80 = v32;
    v33 = v26;
    v81 = v33;
    v87 = v14;
    v34 = v28;
    v82 = v34;
    v35 = v27;
    v83 = v35;
    v36 = v30;
    v84 = v36;
    v85 = &v96;
    v86 = &v90;
    v88 = v72;
    objc_msgSend(v31, "performBlock:", v79);

    dispatch_group_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(v78, "managedObjectContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "refreshAllObjects");

    v20 = *((unsigned __int8 *)v97 + 24);
  }
  if (!v20
    || (-[PHAssetCreationRequest momentShareUUID](self, "momentShareUUID"),
        v38 = (void *)objc_claimAutoreleasedReturnValue(),
        v39 = v38 == 0,
        v38,
        v39))
  {
    v43 = 0;
  }
  else
  {
    v40 = (void *)MEMORY[0x1E0D718F0];
    -[PHAssetCreationRequest momentShareUUID](self, "momentShareUUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "managedObjectContext");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "shareWithUUID:includeTrashed:inManagedObjectContext:", v41, 1, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!*((_BYTE *)v97 + 24))
    goto LABEL_45;
  -[PHChangeRequest uuid](self, "uuid");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[PHAssetCreationRequestPlaceholderSupport _bundleScopeForPlaceholderAsset](self, "_bundleScopeForPlaceholderAsset");
  -[PHAssetCreationRequest importSessionID](self, "importSessionID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v68) = v73;
  BYTE1(v68) = v74;
  LOBYTE(v68) = v89;
  v47 = objc_msgSend(v8, "setupPlaceholderAssetWithRequiredPropertiesFromSourceAsset:placeholderAssetUUID:bundleScope:momentShare:importSessionID:bakeInAdjustmentsFromSourceAsset:flattenLivePhoto:copyTitleDescriptionAndKeywords:copyCameraProcessingAdjustmentResources:library:", v7, v44, v45, v43, v46, v76, v68, v78);
  *((_BYTE *)v97 + 24) = v47;

  if (*((_BYTE *)v97 + 24))
  {
    v48 = 1;
  }
  else
  {
    v49 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v8, "scopedIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to setup placeholder asset: %@"), v50);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v91[5];
    v91[5] = v51;

    v48 = *((unsigned __int8 *)v97 + 24);
    if (!*((_BYTE *)v97 + 24))
      goto LABEL_41;
  }
  if (v75)
  {
    self->_placeholderCreationMode = 0;
    PLPhotoKitGetLog();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "scopedIdentifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scopedIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v101 = v54;
      v102 = 2112;
      v103 = v55;
      _os_log_impl(&dword_1991EC000, v53, OS_LOG_TYPE_INFO, "Decided to perform server copy on placeholder asset: %@ source asset: %@", buf, 0x16u);

    }
    if (*((_BYTE *)v97 + 24))
    {
      v56 = objc_msgSend(MEMORY[0x1E0D71880], "createMasterForPlaceholderAsset:withSourceAsset:shouldBakeInAdjustments:shouldFlattenLivePhoto:placeholderResourceURLToSourceResourceURLMap:photoLibrary:", v8, v7, v76, v89, 0, v78);
      *((_BYTE *)v97 + 24) = v56;
      if (v56)
      {
        v57 = objc_msgSend(MEMORY[0x1E0D71880], "createAssetResourcesForPlaceholderAsset:withSourceAsset:shouldBakeInAdjustments:shouldFlattenLivePhoto:placeholderResourceURLToSourceResourceURLMap:photoLibrary:", v8, v7, v76, v89, 0, v78);
        *((_BYTE *)v97 + 24) = v57;
      }
    }
    goto LABEL_45;
  }
LABEL_41:
  if (v48)
  {
    self->_placeholderCreationMode = 1;
    self->_downloadSourceMode_shouldBakeInAdjustments = v76;
    self->_downloadSourceMode_shouldFlattenLivePhoto = v89;
    self->_downloadSourceMode_shouldCopyLocationData = v70;
    PLPhotoKitGetLog();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "scopedIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scopedIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v101 = v59;
      v102 = 2112;
      v103 = v60;
      _os_log_impl(&dword_1991EC000, v58, OS_LOG_TYPE_INFO, "Decided to download source resources on placeholder asset: %@ source asset: %@", buf, 0x16u);

    }
  }
LABEL_45:

  if (!*((_BYTE *)v97 + 24))
  {
LABEL_47:
    v62 = 1;
    goto LABEL_48;
  }
  objc_msgSend(v7, "additionalAttributes");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setDestinationAssetCopyState:", 1);

  v62 = *((_BYTE *)v97 + 24) == 0;
LABEL_48:
  if (a5 && v62)
  {
    PLPhotoKitGetLog();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "scopedIdentifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scopedIdentifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v91[5];
      *(_DWORD *)buf = 138412802;
      v101 = v64;
      v102 = 2112;
      v103 = v65;
      v104 = 2112;
      v105 = v66;
      _os_log_impl(&dword_1991EC000, v63, OS_LOG_TYPE_INFO, "Failed to create placeholder asset %@ with source asset %@ returning error: %@", buf, 0x20u);

    }
    *a5 = objc_retainAutorelease((id)v91[5]);
  }
  _Block_object_dispose(&v90, 8);

  _Block_object_dispose(&v96, 8);
  return v8;
}

- (void)_updateManagedAssetAfterResourceDownload:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[3];
  char v16;

  v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 1;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__6458;
  v13[4] = __Block_byref_object_dispose__6459;
  v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__6458;
  v11[4] = __Block_byref_object_dispose__6459;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__PHAssetCreationRequestPlaceholderSupport__updateManagedAssetAfterResourceDownload___block_invoke;
  v6[3] = &unk_1E35DD8B8;
  v8 = v11;
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  v9 = v15;
  v10 = v13;
  objc_msgSend(v5, "performTransaction:", v6);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(v15, 8);
}

- (BOOL)_regenerateResourcesWithLocationDataRemoved:(id)a3 sourceExternalResources:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
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
  id *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  uint64_t *v94;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  _QWORD v114[4];
  id v115;
  id v116;
  id v117;
  NSObject *v118;
  uint64_t *v119;
  _QWORD v120[4];
  id v121;
  id v122;
  id v123;
  NSObject *v124;
  uint64_t *v125;
  _QWORD v126[9];
  _QWORD v127[4];
  id v128;
  id v129;
  id v130;
  NSObject *v131;
  uint64_t *v132;
  _QWORD v133[9];
  _QWORD v134[4];
  id v135;
  id v136;
  id v137;
  NSObject *v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t (*v143)(uint64_t, uint64_t);
  void (*v144)(uint64_t);
  id v145;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v10, "count"))
  {
    v39 = 1;
    goto LABEL_45;
  }
  v140 = 0;
  v141 = &v140;
  v142 = 0x3032000000;
  v143 = __Block_byref_object_copy__6458;
  v144 = __Block_byref_object_dispose__6459;
  v145 = 0;
  objc_msgSend(v10, "_pl_indexBy:", &__block_literal_global_61);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = a6;
  v110 = v11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D47C20], "policyWithLocation:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);
  v113 = v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D47D88];
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E3654FE8, *MEMORY[0x1E0D47D88]);
  v16 = (void *)MEMORY[0x1E0D751D8];
  objc_msgSend(v9, "uniformTypeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v16, "outputSupportedForTypeIdentifier:", v17);

  v18 = (_QWORD *)MEMORY[0x1E0D47D18];
  if ((_DWORD)v16)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D47D18]);
  objc_msgSend(MEMORY[0x1E0D47BF8], "policyWithPolicies:", v113);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D47D48]);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E3654FE8, v15);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D47CC0]);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v18);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D47CC8]);
  v21 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fileURLWithPath:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "UUIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("PHAssetCreationRequestPlaceholderSupport-%@"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URLByAppendingPathComponent:", v27);
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = dispatch_group_create();
  if (!v141[5])
  {
    if (objc_msgSend(v9, "isPhoto"))
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", &unk_1E3655000);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v29;
      if (v29)
      {
        v30 = (void *)MEMORY[0x1E0D47C18];
        objc_msgSend(v29, "fileURL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "collectionWithMainResourceURL:", v31);
        v103 = (id)objc_claimAutoreleasedReturnValue();

        v32 = (void *)MEMORY[0x1E0D751D8];
        objc_msgSend(v9, "uniformTypeIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v32) = objc_msgSend(v32, "outputSupportedForTypeIdentifier:", v33);

        if ((_DWORD)v32)
        {
          v34 = (void *)MEMORY[0x1E0D47C18];
          objc_msgSend(v105, "fileURL");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "lastPathComponent");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "URLByAppendingPathComponent:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "collectionWithMainResourceURL:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v105, "fileURL");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "lastPathComponent");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stringByDeletingPathExtension");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringByAppendingPathExtensionForType:", *MEMORY[0x1E0CEC530]);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v55 = (void *)MEMORY[0x1E0D47C18];
          objc_msgSend(v111, "URLByAppendingPathComponent:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "collectionWithMainResourceURL:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
        }

        dispatch_group_enter(v28);
        v49 = objc_alloc_init(MEMORY[0x1E0D47BE8]);
        v134[0] = MEMORY[0x1E0C809B0];
        v134[1] = 3221225472;
        v134[2] = __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_76;
        v134[3] = &unk_1E35D70C8;
        v139 = &v140;
        v135 = v112;
        v136 = v10;
        v137 = v38;
        v138 = v28;
        v50 = v137;
        objc_msgSend(v49, "convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v103, v137, v14, v134);

      }
      else
      {
        v50 = 0;
        v103 = 0;
        v49 = 0;
      }
      v41 = v105;
      if (v141[5])
        goto LABEL_30;
      if (!objc_msgSend(v9, "hasAdjustments"))
      {
        v41 = v105;
LABEL_30:
        dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);

        goto LABEL_31;
      }
      v99 = v49;
      objc_msgSend(v112, "objectForKeyedSubscript:", &unk_1E3655018);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v56;
      v41 = v105;
      if (v56)
      {
        v57 = (void *)MEMORY[0x1E0D47C18];
        objc_msgSend(v56, "fileURL");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "collectionWithMainResourceURL:", v58);
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = (void *)MEMORY[0x1E0D47C18];
        objc_msgSend(v101, "fileURL");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "lastPathComponent");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "URLByAppendingPathComponent:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "collectionWithMainResourceURL:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_group_enter(v28);
        v133[0] = MEMORY[0x1E0C809B0];
        v133[1] = 3221225472;
        v133[2] = __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_79;
        v133[3] = &unk_1E35D70C8;
        v133[8] = &v140;
        v64 = (id *)v133;
        v133[4] = v112;
        v133[5] = v10;
        v65 = v63;
        v133[6] = v65;
        v133[7] = v28;
        objc_msgSend(v99, "convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v96, v65, v14, v133);
LABEL_21:

        v41 = v105;
        v66 = v101;
LABEL_29:

        v49 = v99;
        goto LABEL_30;
      }
    }
    else
    {
      if (v141[5] || !objc_msgSend(v9, "isVideo"))
        goto LABEL_31;
      objc_msgSend(v112, "objectForKeyedSubscript:", &unk_1E3655030);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v40)
      {
        v42 = (void *)MEMORY[0x1E0D47C18];
        objc_msgSend(v40, "fileURL");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "collectionWithMainResourceURL:", v43);
        v103 = (id)objc_claimAutoreleasedReturnValue();

        v44 = (void *)MEMORY[0x1E0D47C18];
        objc_msgSend(v41, "fileURL");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "lastPathComponent");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "URLByAppendingPathComponent:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "collectionWithMainResourceURL:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_group_enter(v28);
        v49 = objc_alloc_init(MEMORY[0x1E0D47C30]);
        v127[0] = MEMORY[0x1E0C809B0];
        v127[1] = 3221225472;
        v127[2] = __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_81;
        v127[3] = &unk_1E35D70C8;
        v132 = &v140;
        v128 = v112;
        v129 = v10;
        v130 = v48;
        v131 = v28;
        v50 = v130;
        v51 = (id)objc_msgSend(v49, "convertVideoAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v103, v130, v20, v127);

      }
      else
      {
        v49 = 0;
        v103 = 0;
        v50 = 0;
      }
      if (v141[5] || !objc_msgSend(v9, "hasAdjustments"))
        goto LABEL_30;
      v99 = v49;
      objc_msgSend(v112, "objectForKeyedSubscript:", &unk_1E3655048);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v67;
      if (v67)
      {
        v68 = (void *)MEMORY[0x1E0D47C18];
        objc_msgSend(v67, "fileURL");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "collectionWithMainResourceURL:", v69);
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        v106 = (void *)MEMORY[0x1E0D47C18];
        objc_msgSend(v101, "fileURL");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "lastPathComponent");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "URLByAppendingPathComponent:", v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "collectionWithMainResourceURL:", v72);
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_group_enter(v28);
        v126[0] = MEMORY[0x1E0C809B0];
        v126[1] = 3221225472;
        v126[2] = __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_83;
        v126[3] = &unk_1E35D70C8;
        v126[8] = &v140;
        v64 = (id *)v126;
        v126[4] = v112;
        v126[5] = v10;
        v65 = v107;
        v126[6] = v65;
        v126[7] = v28;
        v73 = (id)objc_msgSend(v99, "convertVideoAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v96, v65, v20, v126);
        v105 = v41;
        goto LABEL_21;
      }
    }
    v66 = 0;
    goto LABEL_29;
  }
LABEL_31:
  if (!v141[5] && objc_msgSend(v9, "isPhotoIris"))
  {
    objc_msgSend(v112, "objectForKeyedSubscript:", &unk_1E3655060);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (v74)
    {
      v76 = (void *)MEMORY[0x1E0D47C18];
      objc_msgSend(v74, "fileURL");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "collectionWithMainResourceURL:", v77);
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      v78 = (void *)MEMORY[0x1E0D47C18];
      objc_msgSend(v75, "fileURL");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "lastPathComponent");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "URLByAppendingPathComponent:", v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "collectionWithMainResourceURL:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_group_enter(v28);
      v83 = objc_alloc_init(MEMORY[0x1E0D47C30]);
      v120[0] = MEMORY[0x1E0C809B0];
      v120[1] = 3221225472;
      v120[2] = __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_85;
      v120[3] = &unk_1E35D70C8;
      v125 = &v140;
      v121 = v112;
      v122 = v10;
      v84 = v82;
      v123 = v84;
      v124 = v28;
      v85 = (id)objc_msgSend(v83, "convertVideoAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v108, v84, v20, v120);

    }
    else
    {
      v83 = 0;
      v108 = 0;
      v84 = 0;
    }
    if (!v141[5] && objc_msgSend(v9, "hasAdjustments"))
    {
      v102 = v83;
      objc_msgSend(v112, "objectForKeyedSubscript:", &unk_1E3655078);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v86;
      if (v86)
      {
        v87 = (void *)MEMORY[0x1E0D47C18];
        objc_msgSend(v86, "fileURL");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "collectionWithMainResourceURL:", v88);
        v100 = (void *)objc_claimAutoreleasedReturnValue();

        v97 = (void *)MEMORY[0x1E0D47C18];
        objc_msgSend(v104, "fileURL");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "lastPathComponent");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "URLByAppendingPathComponent:", v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "collectionWithMainResourceURL:", v91);
        v98 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_group_enter(v28);
        v114[0] = MEMORY[0x1E0C809B0];
        v114[1] = 3221225472;
        v114[2] = __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_87;
        v114[3] = &unk_1E35D70C8;
        v119 = &v140;
        v115 = v112;
        v116 = v10;
        v92 = v98;
        v117 = v92;
        v118 = v28;
        v93 = (id)objc_msgSend(v102, "convertVideoAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v100, v92, v20, v114);

        v86 = v104;
      }

      v83 = v102;
    }
    dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);

  }
  v94 = v141;
  if (v109)
  {
    *v109 = objc_retainAutorelease((id)v141[5]);
    v94 = v141;
  }
  v39 = v94[5] == 0;

  _Block_object_dispose(&v140, 8);
  v11 = v110;
LABEL_45:

  return v39;
}

- (id)_fetchOptionsForDuplicateAssetPhotoLibraryType:(id)a3
{
  id v4;
  PHPhotoLibrary *v5;
  void *v6;

  v4 = a3;
  v5 = -[PHPhotoLibrary initWithPLPhotoLibrary:type:]([PHPhotoLibrary alloc], "initWithPLPhotoLibrary:type:", v4, -[PHAssetCreationRequest duplicateAssetPhotoLibraryType](self, "duplicateAssetPhotoLibraryType"));

  -[PHPhotoLibrary librarySpecificFetchOptions](v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  int v8;
  BOOL v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6458;
  v23 = __Block_byref_object_dispose__6459;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PHAssetCreationRequestPlaceholderSupport_validateInsertIntoPhotoLibrary_error___block_invoke;
  v11[3] = &unk_1E35DE5F8;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  v13 = &v15;
  v14 = &v19;
  objc_msgSend(v7, "performBlockAndWait:", v11);
  v8 = *((unsigned __int8 *)v16 + 24);
  if (a4 && !*((_BYTE *)v16 + 24))
  {
    *a4 = objc_retainAutorelease((id)v20[5]);
    v8 = *((unsigned __int8 *)v16 + 24);
  }
  v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v14;

  v6 = a3;
  -[PHAssetCreationRequest duplicateAssetIdentifier](self, "duplicateAssetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71880], "assetWithUUID:inLibrary:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  -[PHAssetCreationRequestPlaceholderSupport _createPlaceholderManagedAssetFromSourceManagedAsset:inPhotoLibrary:error:](self, "_createPlaceholderManagedAssetFromSourceManagedAsset:inPhotoLibrary:error:", v9, v6, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v14;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to create placeholder asset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v11 = objc_retainAutorelease(v12);
      *a4 = v11;
    }
    else
    {
      v11 = v12;
    }
  }

  return v10;
}

- (void)performTransactionCompletionHandlingInPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PLClientServerTransaction *v19;
  PLClientServerTransaction *serverTransaction;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  PHAssetCreationRequestPlaceholderSupport *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHChangeRequest uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71880], "assetWithUUID:inLibrary:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationRequest duplicateAssetIdentifier](self, "duplicateAssetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71880], "assetWithUUID:inLibrary:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (self->_placeholderCreationMode == 1)
    {
      if (v10)
      {
        if (!self->_serverTransaction)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D72EB8]);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x1E0D715F8];
          objc_msgSend(v4, "pathManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v13;
          v16 = (void *)v12;
          objc_msgSend(v15, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v12, v14, "-[PHAssetCreationRequestPlaceholderSupport performTransactionCompletionHandlingInPhotoLibrary:]");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = (void *)MEMORY[0x1E0D715F8];
          objc_msgSend(v28, "transactionToken");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "pathManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v17, v16, v18, "-[PHAssetCreationRequestPlaceholderSupport performTransactionCompletionHandlingInPhotoLibrary:]");
          v19 = (PLClientServerTransaction *)objc_claimAutoreleasedReturnValue();
          serverTransaction = self->_serverTransaction;
          self->_serverTransaction = v19;

          objc_msgSend(v28, "completeTransaction");
        }
        if (objc_msgSend(v11, "checkAllResourcesRequiredForCPLDisableWithReachableBlock:", 0))
        {
          -[PHAssetCreationRequestPlaceholderSupport _updateManagedAssetAfterResourceDownload:](self, "_updateManagedAssetAfterResourceDownload:", v4);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D71588], "defaultManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uuid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __95__PHAssetCreationRequestPlaceholderSupport_performTransactionCompletionHandlingInPhotoLibrary___block_invoke;
          v29[3] = &unk_1E35D70F0;
          v30 = v4;
          v31 = self;
          objc_msgSend(v25, "requestRequiredResourcesForManagedAssetObjectUUID:library:completionHandler:", v26, v30, v29);

        }
      }
      else
      {
        PLPhotoKitGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          -[PHChangeRequest uuid](self, "uuid");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v9;
          v34 = 2112;
          v35 = v24;
          _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "Failed to find source asset %@ for placeholder asset %@", buf, 0x16u);

        }
      }
    }
  }
  else
  {
    if (v10)
    {
      objc_msgSend(v10, "additionalAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDestinationAssetCopyState:", 0xFFFFFFFFLL);

    }
    PLPhotoKitGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "Placeholder asset %@ no longer exists in the database", buf, 0xCu);
    }

  }
}

- (NSXPCConnection)clientConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_clientConnection);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientConnection);
  objc_storeStrong((id *)&self->_serverTransaction, 0);
}

void __95__PHAssetCreationRequestPlaceholderSupport_performTransactionCompletionHandlingInPhotoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databaseContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "newShortLivedLibraryWithName:", "-[PHAssetCreationRequestPlaceholderSupport performTransactionCompletionHandlingInPhotoLibrary:]_block_invoke");

  objc_msgSend(*(id *)(a1 + 40), "_updateManagedAssetAfterResourceDownload:", v4);
}

void __81__PHAssetCreationRequestPlaceholderSupport_validateInsertIntoPhotoLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "duplicateAssetIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71880], "assetWithUUID:inLibrary:", v7, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isCloudSharedAsset") & 1) != 0 || objc_msgSend(v3, "isPhotoStreamPhoto"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("+[PHAssetCreationRequest creationRequestForAssetCopyFromAsset:options:] API does not support copying cloud shared or photo stream assets"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_76(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v10 = v5;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", &unk_1E3655000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v8);
    objc_msgSend(*(id *)(a1 + 48), "resourceURLForRole:", *MEMORY[0x1E0D47C68]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFileURL:", v9);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_79(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v10 = v5;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", &unk_1E3655018);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v8);
    objc_msgSend(*(id *)(a1 + 48), "resourceURLForRole:", *MEMORY[0x1E0D47C68]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFileURL:", v9);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_81(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v10 = v5;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", &unk_1E3655030);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v8);
    objc_msgSend(*(id *)(a1 + 48), "resourceURLForRole:", *MEMORY[0x1E0D47C68]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFileURL:", v9);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_83(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v10 = v5;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", &unk_1E3655048);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v8);
    objc_msgSend(*(id *)(a1 + 48), "resourceURLForRole:", *MEMORY[0x1E0D47C68]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFileURL:", v9);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_85(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v10 = v5;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", &unk_1E3655060);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v8);
    objc_msgSend(*(id *)(a1 + 48), "resourceURLForRole:", *MEMORY[0x1E0D47C68]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFileURL:", v9);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke_87(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v10 = v5;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", &unk_1E3655078);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v8);
    objc_msgSend(*(id *)(a1 + 48), "resourceURLForRole:", *MEMORY[0x1E0D47C68]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFileURL:", v9);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __131__PHAssetCreationRequestPlaceholderSupport__regenerateResourcesWithLocationDataRemoved_sourceExternalResources_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "type"));
}

void __85__PHAssetCreationRequestPlaceholderSupport__updateManagedAssetAfterResourceDownload___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  BOOL v32;
  _BYTE *v33;
  uint64_t v34;
  char v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  PHAssetResourceBag *v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _BYTE buf[24];
  _QWORD v77[2];

  v77[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "setBundleScope:", objc_msgSend(*(id *)(a1 + 32), "_bundleScopeForPlaceholderAsset"));
  objc_msgSend(MEMORY[0x1E0D71880], "assetWithUUID:inLibrary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Placeholder asset %@ no longer exists in the database. Terminating!"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v14 = 0;
LABEL_11:
    v23 = 0;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "_fetchOptionsForDuplicateAssetPhotoLibraryType:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "duplicateAssetIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(a1 + 32), "duplicateAssetIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to fetch source asset with duplicate UUID: %@"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    goto LABEL_11;
  v20 = *(unsigned __int8 **)(a1 + 32);
  v21 = v20[1201];
  v22 = v20[1200];
  v75 = 0;
  *(_OWORD *)buf = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  objc_msgSend(v20, "duplicatedAssetResourcesFromAsset:stillSourceTime:flattenLivePhotoIntoStillPhoto:duplicateAsOriginal:duplicateWithAdjustmentsBakedIn:duplicatePhotoAsData:error:", v14, buf, v21, 0, v22, 0, &v75);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v75;
  if (v24)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to duplicate asset resources for placeholder asset: %@ error: %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
LABEL_12:
  v28 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(v14, "uuid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "assetWithUUID:inLibrary:", v29, *(_QWORD *)(a1 + 40));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v32 = v30 == 0;
  else
    v32 = 1;
  if (!v32)
  {
    v33 = *(_BYTE **)(a1 + 32);
    if (v33[1202])
      goto LABEL_21;
    v34 = *(_QWORD *)(a1 + 40);
    v74 = 0;
    v35 = objc_msgSend(v33, "_regenerateResourcesWithLocationDataRemoved:sourceExternalResources:photoLibrary:error:", v14, v23, v34, &v74);
    v36 = v74;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v35;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to regenerate resources with location data removed for placeholder asset: %@ error: %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v36);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v39 = *(void **)(v38 + 40);
      *(_QWORD *)(v38 + 40) = v37;

    }
    v31 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  if (!v31)
  {
    v47 = 0;
    v40 = 0;
    goto LABEL_36;
  }
LABEL_21:
  v40 = -[PHAssetResourceBag initWithAssetResources:assetCreationRequest:]([PHAssetResourceBag alloc], "initWithAssetResources:assetCreationRequest:", v23, *(_QWORD *)(a1 + 32));
  v41 = *(_QWORD *)(a1 + 40);
  v73 = 0;
  -[PHAssetResourceBag validateForInsertIntoPhotoLibrary:error:](v40, "validateForInsertIntoPhotoLibrary:error:", v41, &v73);
  v42 = v73;
  v43 = v73;
  if (v43)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v42);
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v47 = 0;
LABEL_36:
    PLPhotoKitGetLog();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v62 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v61;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v62;
      _os_log_impl(&dword_1991EC000, v60, OS_LOG_TYPE_ERROR, "Failed to update placeholder asset %@ after source resources download: %@", buf, 0x16u);
    }

    v63 = (void *)MEMORY[0x1E0D71880];
    v64 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "assetWithUUID:inManagedObjectContext:", v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      objc_msgSend(v66, "setDestinationAssetCopyStateOnSourceAsset:", 0xFFFFFFFFLL);
      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "deleteObject:", v66);

    }
    goto LABEL_41;
  }
  v44 = *(_QWORD *)(a1 + 40);
  v45 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v46 = *(void **)(a1 + 32);
  v72 = 0;
  objc_msgSend(v46, "createAssetFromValidatedResources:withUUID:assetAlreadyExistsAsPlaceholder:inPhotoLibrary:error:", v40, v45, 1, v44, &v72);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v72;
  if (v47)
  {
    objc_msgSend(v47, "momentShare");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      objc_msgSend(v47, "fixupPlaceholderAssetWithSavedAssetType:", objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForMomentSharedAsset"));
    }
    else
    {
      objc_msgSend(v47, "fetchSourceAssetForDuplicationIfExists");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "additionalAttributes");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "originalStableHash");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v71 = v53;
      objc_msgSend(v53, "additionalAttributes");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "adjustedStableHash");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        objc_msgSend(v47, "additionalAttributes");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setOriginalStableHash:", v55);

      }
      if (v57)
      {
        objc_msgSend(v47, "additionalAttributes");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setAdjustedStableHash:", v57);

      }
      objc_msgSend(v47, "fixupPlaceholderAssetWithSavedAssetType:", objc_msgSend(MEMORY[0x1E0D73310], "defaultSavedAssetTypeForPhotoKitAssetCreationRequest"));

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to fetch destination asset with UUID: %@ error: %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v48);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v52 = *(void **)(v51 + 40);
    *(_QWORD *)(v51 + 40) = v50;

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    goto LABEL_36;
LABEL_41:
  v68 = *(void **)(*(_QWORD *)(a1 + 32) + 1176);
  if (v68)
  {
    objc_msgSend(v68, "completeTransactionScope:", *MEMORY[0x1E0D72EB8]);
    v69 = *(_QWORD *)(a1 + 32);
    v70 = *(void **)(v69 + 1176);
    *(_QWORD *)(v69 + 1176) = 0;

  }
}

void __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D71880];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetWithUUID:inManagedObjectContext:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(v5, "persistedResourcesMatching:", &__block_literal_global_6508);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v7 = v6;
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v8)
      {
        v9 = v8;
        v24 = v6;
        v10 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v36 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            PLPhotoKitGetLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v14 = *(_QWORD *)(a1 + 48);
              v15 = *(_QWORD *)(a1 + 56);
              *(_DWORD *)buf = 138412546;
              v41 = v14;
              v42 = 2112;
              v43 = v15;
              _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_INFO, "Source asset %@ for placeholder asset %@ needs deferred processing before CMM publish", buf, 0x16u);
            }

            v16 = objc_alloc_init(MEMORY[0x1E0D71A78]);
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
            objc_msgSend(v12, "dataStore");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke_31;
            v30[3] = &unk_1E35D7010;
            v34 = *(_OWORD *)(a1 + 72);
            v31 = *(id *)(a1 + 56);
            v32 = *(id *)(a1 + 48);
            v33 = *(id *)(a1 + 64);
            v18 = (id)objc_msgSend(v17, "requestLocalAvailabilityChange:forResource:options:completion:", 1, v12, v16, v30);

          }
          v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v9);
        v6 = v24;
      }
    }
    else
    {
      PLPhotoKitGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(a1 + 48);
        v23 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        v41 = v22;
        v42 = 2112;
        v43 = v23;
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Failed to find original resource that needs finalization in source asset %@ for placeholder asset %@", buf, 0x16u);
      }
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
    goto LABEL_18;
  }
  if (*(_BYTE *)(a1 + 89))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D47BE8]);
    v19 = objc_alloc_init(MEMORY[0x1E0D47C30]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMM requested on-demand deferred adjustment generation for asset %@"), *(_QWORD *)(a1 + 32));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke_39;
    v25[3] = &unk_1E35D7038;
    v29 = *(_OWORD *)(a1 + 72);
    v26 = *(id *)(a1 + 56);
    v27 = *(id *)(a1 + 48);
    v28 = *(id *)(a1 + 64);
    v21 = (id)objc_msgSend(v5, "generateDeferredAdjustmentForCMMPlaceholderWithImageConversionClient:videoConversionClient:reason:completion:", v6, v19, v20, v25);

LABEL_18:
  }

}

void __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke_31(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to finalize original resource for placeholder asset: %@ error: %@"), *(_QWORD *)(a1 + 32), a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v10 = "Failed to finalize source asset %@ for placeholder asset %@ error: %@";
      v11 = v6;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1991EC000, v11, v12, v10, buf, v13);
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      v10 = "Successfully finalized source asset %@ for placeholder asset %@";
      v11 = v6;
      v12 = OS_LOG_TYPE_INFO;
      v13 = 22;
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke_39(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to finalize async adjustment for placeholder asset: %@ error: %@"), *(_QWORD *)(a1 + 32), a3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      v11 = "Failed to finalize async adjustment for source asset %@ for placeholder asset %@ error: %@";
      v12 = v7;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
LABEL_6:
      _os_log_impl(&dword_1991EC000, v12, v13, v11, buf, v14);
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      v11 = "Successfully finalized async adjustment for source asset %@ for placeholder asset %@";
      v12 = v7;
      v13 = OS_LOG_TYPE_INFO;
      v14 = 22;
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __118__PHAssetCreationRequestPlaceholderSupport__createPlaceholderManagedAssetFromSourceManagedAsset_inPhotoLibrary_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D71880];
  v3 = a2;
  objc_msgSend(v2, "predicateToFetchResourcesAwaitingLocalAvailabilityChange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "evaluateWithObject:", v3);

  return v5;
}

void __82__PHAssetCreationRequestPlaceholderSupport_changeFailedOnDaemonWithLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetWithUUID:inLibrary:", v3, *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setDestinationAssetCopyStateOnSourceAsset:", 0xFFFFFFFFLL);
    v4 = v5;
  }

}

void __82__PHAssetCreationRequestPlaceholderSupport_changeFailedOnClientWithLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetWithUUID:inLibrary:", v3, *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setDestinationAssetCopyStateOnSourceAsset:", 0xFFFFFFFFLL);
    v4 = v5;
  }

}

@end
