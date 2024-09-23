@implementation CAMPersistenceController

- (void)_handleStillImagePersistenceForRequest:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  CAMStillImageLocalPersistenceResult *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  NSObject *v32;
  int v33;
  int v34;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "persistenceOptions");
  if (v8)
  {
    v9 = v8;
    CAMSignpostWithIDAndArgs(49, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
    objc_msgSend(v7, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CAMPersistenceController _handleStillImagePersistenceForRequest:withResult:].cold.1();

      if (objc_msgSend(v6, "conformsToProtocol:", &unk_1F038ADF0))
      {
        v12 = -[CAMStillImageLocalPersistenceResult initWithCaptureResult:atURL:linkedURL:localAdjustmentsURL:diagnosticsPath:filteredPreviewPath:withUUID:creationDate:uniformTypeIdentifier:orientation:metadata:adjustmentsData:localPrivateMetadataFileURL:error:]([CAMStillImageLocalPersistenceResult alloc], "initWithCaptureResult:atURL:linkedURL:localAdjustmentsURL:diagnosticsPath:filteredPreviewPath:withUUID:creationDate:uniformTypeIdentifier:orientation:metadata:adjustmentsData:localPrivateMetadataFileURL:error:", v7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, v10);
        v13 = v6;
        objc_msgSend(v13, "burstIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[CAMPersistenceController _burstController](self, "_burstController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "processPersistedRequest:withResult:", v13, v12);

        }
      }
      if (v9 != 2)
        goto LABEL_19;
      objc_msgSend(v7, "coordinationInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMPersistenceController _coordinateRemotePersistenceForStillImageLocalResult:coordinationInfo:request:](self, "_coordinateRemotePersistenceForStillImageLocalResult:coordinationInfo:request:", 0, v16, v6);
    }
    else
    {
      objc_msgSend(v7, "coordinationInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[CAMPersistenceController _stillImageLocalPowerAssertionReasonForCoordinationInfo:](self, "_stillImageLocalPowerAssertionReasonForCoordinationInfo:", v16);
      -[CAMPersistenceController _powerController](self, "_powerController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v6, "assertionIdentifier");
      objc_msgSend(v18, "addAssertionForIndentifier:withReason:", v19, v17);
      if (-[CAMPersistenceController resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest](self, "resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest"))
      {
        objc_msgSend(v6, "persistenceUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMPersistenceController _ensureCoordinationGroupForIdentifier:](self, "_ensureCoordinationGroupForIdentifier:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        if (v21)
          dispatch_group_enter(v21);
      }
      else
      {
        v21 = 0;
      }
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __78__CAMPersistenceController__handleStillImagePersistenceForRequest_withResult___block_invoke;
      aBlock[3] = &unk_1EA32C6F0;
      v33 = v19;
      v34 = v17;
      v31 = v18;
      v32 = v21;
      v22 = v21;
      v23 = v18;
      v24 = _Block_copy(aBlock);
      if (objc_msgSend(v6, "shouldProtectPersistence"))
      {
        -[CAMPersistenceController _protectionController](self, "_protectionController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "startProtectingPersistenceForRequest:", v6);

      }
      -[CAMPersistenceController _localPersistenceQueue](self, "_localPersistenceQueue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v6;
      v29 = v7;
      v27 = v24;
      pl_dispatch_async();

    }
LABEL_19:

  }
}

- (unsigned)_stillImageLocalPowerAssertionReasonForCoordinationInfo:(id)a3
{
  id v3;
  int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "isHDR");
  v5 = objc_msgSend(v3, "isFiltered");

  if (v4)
    v6 = 64;
  else
    v6 = 32;
  if (v4)
    v7 = 256;
  else
    v7 = 128;
  if (v5)
    return v7;
  else
    return v6;
}

- (CAMPowerController)_powerController
{
  return self->__powerController;
}

- (BOOL)resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest
{
  CAMPersistenceController *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CAMPersistenceController _resultDelegateIsolationQueue](self, "_resultDelegateIsolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__CAMPersistenceController_resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest__block_invoke;
  v5[3] = &unk_1EA32C0D8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (OS_dispatch_queue)_resultDelegateIsolationQueue
{
  return self->__resultDelegateIsolationQueue;
}

uint64_t __92__CAMPersistenceController_resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (CAMProtectionController)_protectionController
{
  return self->__protectionController;
}

- (OS_dispatch_queue)_localPersistenceQueue
{
  return self->__localPersistenceQueue;
}

- (void)stillImageRequestDidCompleteCapture:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[CAMPersistenceController _irisVideoController](self, "_irisVideoController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "shouldHandleLivePhotoRenderingForRequest:", v6))
    objc_msgSend(v8, "stillImageRequestDidCompleteCapture:error:", v6, v7);
  if (-[CAMPersistenceController resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest](self, "resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest"))
  {
    objc_msgSend(v6, "persistenceUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPersistenceController _coordinationGroupForIdentifier:](self, "_coordinationGroupForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPersistenceController resultDelegate](self, "resultDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[CAMPersistenceController _localPersistenceQueue](self, "_localPersistenceQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = v6;
      pl_dispatch_group_notify();

      -[CAMPersistenceController _removeCoordinationGroupForIdentifier:](self, "_removeCoordinationGroupForIdentifier:", v9);
    }
    else if (objc_msgSend(v6, "persistenceOptions"))
    {
      objc_msgSend(v11, "persistenceController:didCompleteAllLocalPersistenceForRequest:", self, v6);
    }

  }
}

- (CAMIrisVideoController)_irisVideoController
{
  return self->__irisVideoController;
}

- (void)_locallyPersistStillImageResult:(id)a3 forRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "persistenceOptions");
  v12 = (void *)MEMORY[0x1DF0B55E8]();
  -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:](self, "_persistStillImageCaptureSurfaceResult:withRequest:", v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v12);
  -[CAMPersistenceController resultDelegate](self, "resultDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "persistenceController:didGenerateStillImageLocalPersistenceResult:forCaptureResult:fromRequest:", self, v13, v8, v9);
  CAMSignpostWithIDAndArgs(50, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  if (v11 == 2)
  {
    objc_msgSend(v8, "coordinationInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPersistenceController _coordinateRemotePersistenceForStillImageLocalResult:coordinationInfo:request:](self, "_coordinateRemotePersistenceForStillImageLocalResult:coordinationInfo:request:", v13, v15, v9);

  }
  v19 = v9;
  v20 = v10;
  v16 = v10;
  v17 = v13;
  v18 = v9;
  pl_dispatch_async();

}

- (id)_persistStillImageCaptureSurfaceResult:(id)a3 withRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  double Current;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  char v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  _BOOL4 v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  char v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  char v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  char v97;
  id v98;
  NSObject *v99;
  uint64_t v100;
  int v101;
  void *v102;
  uint64_t v103;
  BOOL v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  BOOL v110;
  unint64_t v111;
  uint64_t v112;
  int v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  NSObject *v118;
  NSObject *v119;
  void *v120;
  void *v121;
  NSObject *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  char v130;
  id v131;
  NSObject *v132;
  void *v133;
  CAMStillImageLocalPersistenceResult *v134;
  void *v135;
  CAMStillImageLocalPersistenceResult *v136;
  void *v137;
  void *v138;
  void *v140;
  int v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  int64_t v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  int v172;
  CAMStillImageLocalPersistenceResult *v173;
  CAMPersistenceController *v174;
  void *v175;
  void *v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182[2];
  id v183;
  uint8_t buf[4];
  void *v185;
  __int16 v186;
  void *v187;
  __int16 v188;
  id v189;
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "coordinationInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deferredPhotoIdentifier");
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "representsDeferredFilteredProxy");
  v158 = objc_msgSend(v6, "stillImageFilteredPreviewSurface");
  objc_msgSend(v6, "metadata");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistenceUUID");
  v165 = objc_claimAutoreleasedReturnValue();
  v176 = v7;
  -[CAMPersistenceController _uniformTypeForStillImageRequest:result:](self, "_uniformTypeForStillImageRequest:result:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v172 = objc_msgSend(v8, "isFilteredImageForFilteredPair");
  else
    v172 = 0;
  v171 = (void *)v10;
  objc_msgSend(v7, "localDestinationURL");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = objc_msgSend(v12, "length") != 0;
  else
    v14 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  v151 = +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", v6, objc_msgSend(v7, "captureDevice"), objc_msgSend(v7, "captureOrientation"));
  objc_msgSend(v6, "captureDate");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = self;
  -[CAMPersistenceController _localPersistenceThumbnailGenerator](self, "_localPersistenceThumbnailGenerator");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "stillImageUnfilteredPreviewSurface");
  objc_msgSend(v6, "capturePhoto");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = v17;
  if (!v17)
  {
    if (!objc_msgSend(v7, "photoEncodingBehavior"))
    {
      v33 = (void *)objc_msgSend(v171, "mutableCopy");
      +[CAMCaptureMetadataUtilities removeUnwantedKeysForPersistenceFromMetadata:](CAMCaptureMetadataUtilities, "removeUnwantedKeysForPersistenceFromMetadata:", v33);
      v163 = (void *)objc_msgSend(v33, "copy");
      v157 = v13;
      v34 = v11;
      v35 = v8;
      v36 = objc_msgSend(v6, "stillImageFullsizeSurface");
      v37 = objc_msgSend(v6, "stillImageFullsizeSurfaceSize");
      v38 = objc_alloc(MEMORY[0x1E0D73228]);
      v39 = v36;
      v8 = v35;
      v11 = v34;
      v13 = v157;
      v40 = v37;
      v17 = 0;
      v166 = (void *)objc_msgSend(v38, "initWithIOSurface:length:", v39, v40);
      v162 = (void *)objc_msgSend(v155, "newJPEGDataOfFormat:inOrientation:usingSurface:withMetadata:", 3039, 0, v16, v171);

      goto LABEL_16;
    }
LABEL_15:
    v162 = 0;
    v163 = 0;
    v166 = 0;
    goto LABEL_16;
  }
  if (!v172)
    goto LABEL_15;
  v18 = (void *)*MEMORY[0x1E0CEC530];
  if ((objc_msgSend(v11, "conformsToType:", *MEMORY[0x1E0CEC530]) & 1) == 0 && v14)
  {
    v19 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.9();

    goto LABEL_15;
  }
  -[CAMPersistenceController _physicallyRotatedJPEGDataFromCapturePhoto:](v174, "_physicallyRotatedJPEGDataFromCapturePhoto:", v17);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  if (v166)
  {
    -[CAMPersistenceController _createMetadataForPhysicallyOrientedImage:](v174, "_createMetadataForPhysicallyOrientedImage:", v171);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v18;

    v162 = (void *)objc_msgSend(v155, "newJPEGDataOfFormat:inOrientation:usingSurface:withMetadata:", 3039, v151, v16, v171);
    v11 = v32;
  }
  else
  {
    v162 = 0;
    v163 = 0;
    v166 = 0;
  }
LABEL_16:
  v161 = v8;
  if (v14)
  {
    v156 = v13;
    objc_msgSend(v13, "stringByDeletingLastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "fileExistsAtPath:", v20);

    if ((v22 & 1) != 0)
    {
      v23 = v168;
      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = 0;
    v29 = objc_msgSend(v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v183);
    v30 = v183;

    v23 = v168;
    if ((v29 & 1) == 0)
    {
      v31 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.8();

    }
  }
  else
  {
    v24 = objc_msgSend(v7, "shouldPersistToIncomingDirectory");
    -[CAMPersistenceController _extensionForUniformType:](v174, "_extensionForUniformType:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v172)
    {
      v25 = v13;
      v26 = v168;
      if (v9)
      {
        v27 = (id)*MEMORY[0x1E0D74A88];
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0D74A78], "stringByAppendingPathExtension:", v20);
        v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      v41 = v27;

      v20 = v41;
      v13 = v25;
    }
    else
    {
      v26 = v168;
    }
    +[CAMPersistenceController uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:](CAMPersistenceController, "uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:", v165, v20, v24, Current);
    v42 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v42);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v26;
    v156 = (void *)v42;
  }

  v17 = v167;
LABEL_34:

  objc_msgSend(v23, "path");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
  {
    v44 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.7();

  }
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F038AD80))
  {
    objc_msgSend(v7, "burstIdentifier");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
  }
  v164 = v11;
  v154 = (void *)v45;
  v152 = v6;
  if (v166)
  {
    v182[1] = 0;
    v46 = -[CAMPersistenceController _writeJPEGToURL:withData:thumbnail:properties:duringBurst:error:](v174, "_writeJPEGToURL:withData:thumbnail:properties:duringBurst:error:", v23);
    v153 = 0;
    if (v46)
      goto LABEL_43;
LABEL_52:
    v59 = os_log_create("com.apple.camera", "Camera");
    v60 = v153;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.6();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v62 = objc_claimAutoreleasedReturnValue();
    v159 = v61;
    if (objc_msgSend(v61, "fileExistsAtPath:", v62))
    {
      v177 = 0;
      v63 = objc_msgSend(v61, "removeItemAtURL:error:", v23, &v177);
      v64 = v177;

      if ((v63 & 1) != 0)
      {
        v65 = v23;
        v66 = v171;
LABEL_61:
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setObject:forKeyedSubscript:", v176, CFSTR("request"));
        objc_msgSend(v67, "setObject:forKeyedSubscript:", v6, CFSTR("result"));
        objc_msgSend(v67, "setObject:forKeyedSubscript:", v153, *MEMORY[0x1E0CB3388]);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CAMPersistenceControllerLocalPersistenceErrorDomain"), -22500, v67);
        v68 = v6;
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v173 = -[CAMStillImageLocalPersistenceResult initWithCaptureResult:atURL:linkedURL:localAdjustmentsURL:diagnosticsPath:filteredPreviewPath:withUUID:creationDate:uniformTypeIdentifier:orientation:metadata:adjustmentsData:localPrivateMetadataFileURL:error:]([CAMStillImageLocalPersistenceResult alloc], "initWithCaptureResult:atURL:linkedURL:localAdjustmentsURL:diagnosticsPath:filteredPreviewPath:withUUID:creationDate:uniformTypeIdentifier:orientation:metadata:adjustmentsData:localPrivateMetadataFileURL:error:", v68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, v69);
        v175 = 0;
        v70 = v156;
        v71 = v159;
        v72 = v161;
        v73 = (void *)v165;
        goto LABEL_140;
      }
      v62 = os_log_create("com.apple.camera", "Camera");
      v65 = v23;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.5();
    }
    else
    {
      v65 = v23;
      v64 = 0;
    }
    v66 = v171;

    goto LABEL_61;
  }
  if (v17)
  {
    objc_msgSend(v17, "fileDataRepresentation");
    v54 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v55 = objc_msgSend(v6, "stillImageFullsizeSurface");
    v56 = objc_msgSend(v6, "stillImageFullsizeSurfaceSize");
    v54 = objc_msgSend(objc_alloc(MEMORY[0x1E0D73228]), "initWithIOSurface:length:", v55, v56);
  }
  v57 = (void *)v54;
  v182[0] = 0;
  v58 = -[CAMPersistenceController _writeDataToURL:withData:duringBurst:error:](v174, "_writeDataToURL:withData:duringBurst:error:", v23, v54, v45 != 0, v182);
  v153 = v182[0];

  if (!v58)
    goto LABEL_52;
LABEL_43:
  v47 = 0;
  if (v158 && !v45)
  {
    objc_msgSend(v23, "URLByDeletingPathExtension");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "URLByAppendingPathExtension:", *MEMORY[0x1E0D74A88]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "path");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMPersistenceController _localPersistenceThumbnailGenerator](v174, "_localPersistenceThumbnailGenerator");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v50, "newJPEGDataInOrientation:usingSurface:withMetadata:", v151, v158, v171);
    if (objc_msgSend(v51, "length"))
    {
      CGImageWriteEXIFJPEGToPath();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "fileExistsAtPath:", v47);

      if ((v53 & 1) != 0)
        goto LABEL_69;
      v74 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v185 = v47;
        v75 = "Failed to write JPEG data for preview surface for %{public}@";
        goto LABEL_66;
      }
    }
    else
    {
      v74 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v185 = v47;
        v75 = "Failed to create JPEG data for preview surface for %{public}@";
LABEL_66:
        _os_log_impl(&dword_1DB760000, v74, OS_LOG_TYPE_DEFAULT, v75, buf, 0xCu);
      }
    }

    v47 = 0;
LABEL_69:

    v17 = v167;
  }
  if ((objc_msgSend(v161, "isUnfilteredImageForFilteredPair") & 1) != 0)
  {
    v160 = 0;
  }
  else
  {
    v76 = objc_msgSend(v6, "predictedFinalAssetPhotoDimensions");
    objc_msgSend(v17, "portraitMetadata");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPersistenceController _adjustmentsDataForRequest:captureDimensions:portraitMetadata:](v174, "_adjustmentsDataForRequest:captureDimensions:portraitMetadata:", v176, v76, v77);
    v160 = objc_claimAutoreleasedReturnValue();

  }
  v78 = v170;
  v79 = objc_msgSend(v6, "shouldPersistAdjustmentSidecar");
  objc_msgSend(MEMORY[0x1E0D73200], "filesystemPersistenceBatchItemForFileAtURL:", v23);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "bundleIdentifier");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v80, "setUUIDString:forKey:", v82, *MEMORY[0x1E0D73F38]);
    if (v45)
      objc_msgSend(v80, "setUUIDString:forKey:", v45, *MEMORY[0x1E0D73EC8]);
    objc_msgSend(v80, "setUInt16:forKey:", 1, *MEMORY[0x1E0D73F68]);
    if (v160)
      v83 = v79;
    else
      v83 = 1;
    if ((v83 & 1) == 0)
      objc_msgSend(v80, "setData:forKey:", v160, *MEMORY[0x1E0D73F50]);
    if (v47)
      objc_msgSend(v80, "setString:forKey:", v47, *MEMORY[0x1E0D73F60]);
    v84 = objc_msgSend(v6, "semanticEnhancement");
    if (v84)
      objc_msgSend(v80, "setInt32:forKey:", v84, *MEMORY[0x1E0D73F70]);
    objc_msgSend(v80, "persist");

    v78 = v170;
  }
  v141 = v79;
  v85 = v6;
  objc_msgSend(v23, "setResourceValue:forKey:error:", v78, *MEMORY[0x1E0C998E8], 0);
  objc_msgSend(v171, "objectForKey:", CFSTR("{Diagnostic}"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "objectForKey:", *MEMORY[0x1E0CF1318]);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "objectForKey:", *MEMORY[0x1E0D051C8]);
  v86 = objc_claimAutoreleasedReturnValue();
  v87 = 0;
  v150 = (void *)v86;
  if ((v172 & 1) == 0)
  {
    v87 = 0;
    if (objc_msgSend(v176, "shouldPersistDiagnosticsToSidecar"))
    {
      if (!v148)
      {
        -[CAMPersistenceController _xmpEncodedDiagnosticDataFromDictionary:](v174, "_xmpEncodedDiagnosticDataFromDictionary:", v147);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v88, "length"))
        {
          objc_msgSend(v23, "URLByDeletingPathExtension");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "URLByAppendingPathExtension:", CFSTR("DBG"));
          v90 = objc_claimAutoreleasedReturnValue();

          v181 = 0;
          v87 = (void *)v90;
          LOBYTE(v90) = objc_msgSend(v88, "writeToURL:options:error:", v90, 0, &v181);
          v91 = v181;
          if ((v90 & 1) == 0)
          {
            v92 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.4();

            v87 = 0;
          }

          v86 = (uint64_t)v150;
        }
        else
        {
          v87 = 0;
        }

      }
    }
  }
  v149 = v87;
  v93 = v85;
  v145 = v80;
  if (v86)
  {
    objc_msgSend(v23, "URLByDeletingPathExtension");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "URLByAppendingPathExtension:", CFSTR("tvis"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v150, 200, 0, 0);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v96, "length"))
    {
      v180 = 0;
      v97 = objc_msgSend(v96, "writeToURL:options:error:", v95, 0, &v180);
      v98 = v180;
      if ((v97 & 1) == 0)
      {
        v99 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
          -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.3();

        v95 = 0;
      }

    }
  }
  v146 = v47;
  objc_msgSend(v17, "privateClientMetadata");
  v100 = objc_claimAutoreleasedReturnValue();
  if (v100)
    v101 = v172;
  else
    v101 = 1;
  objc_msgSend(v23, "URLByDeletingPathExtension");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "URLByAppendingPathExtension:", CFSTR("MDATA"));
  v103 = objc_claimAutoreleasedReturnValue();

  v104 = v101 == 0;
  v105 = (void *)v103;
  v143 = (void *)v100;
  if (v104)
    v106 = v100;
  else
    v106 = 0;
  v107 = objc_msgSend(v176, "sharedLibraryMode");
  objc_msgSend(v176, "contactIDsInProximity");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "sharedLibraryDiagnostics");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = -[CAMPersistenceController writePrivateMetadataFileToURL:withPrivateClientMetadata:sharedLibraryMode:contactIDsInProximity:sharedLibraryDiagnostics:](v174, "writePrivateMetadataFileToURL:withPrivateClientMetadata:sharedLibraryMode:contactIDsInProximity:sharedLibraryDiagnostics:", v105, v106, v107, v108, v109);

  if (!v110)
  {

    v105 = 0;
  }
  v111 = 0x1E0CB3000uLL;
  v140 = v105;
  objc_msgSend(v93, "adjustmentFilters");
  v112 = objc_claimAutoreleasedReturnValue();
  if (v112)
    v113 = v141;
  else
    v113 = 0;
  if ((v113 & v172) == 1)
  {
    objc_msgSend(v17, "portraitMetadata");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = 0;
    objc_msgSend(MEMORY[0x1E0D750C0], "serializedDictionaryForFilters:portraitMetadata:error:", v112, v114, &v179);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v179;
    if (v115)
    {
      v117 = v23;
      v118 = 0;
      do
      {
        v119 = v118;
        v120 = v117;
        objc_msgSend(v117, "pathExtension");
        v118 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v117, "URLByDeletingPathExtension");
        v117 = (id)objc_claimAutoreleasedReturnValue();

      }
      while (-[NSObject length](v118, "length"));
      objc_msgSend(v117, "URLByAppendingPathExtension:", *MEMORY[0x1E0D74A60]);
      v121 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v115, "writeToURL:atomically:", v121, 1) & 1) == 0)
      {
        v122 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
          -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.2();

        v121 = 0;
      }
      v111 = 0x1E0CB3000;
    }
    else
    {
      v118 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.1();
      v121 = 0;
    }

  }
  else
  {
    v121 = 0;
  }
  v169 = v23;
  v142 = (void *)v112;
  if (objc_msgSend(v176, "temporaryPersistenceOptions") == 2)
  {
    -[CAMPersistenceController _extensionForUniformType:](v174, "_extensionForUniformType:", v164);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = v121;
    if (v172)
    {
      objc_msgSend((id)*MEMORY[0x1E0D74A78], "stringByAppendingPathExtension:", v123);
      v124 = objc_claimAutoreleasedReturnValue();

      v123 = (void *)v124;
    }
    +[CAMPersistenceController uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:](CAMPersistenceController, "uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:", v165, v123, 0, Current);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v111 + 1568), "defaultManager");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = 0;
    v130 = objc_msgSend(v129, "copyItemAtURL:toURL:error:", v169, v128, &v178);
    v131 = v178;

    if ((v130 & 1) == 0)
    {
      v132 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v185 = v169;
        v186 = 2114;
        v187 = v128;
        v188 = 2114;
        v189 = v131;
        _os_log_error_impl(&dword_1DB760000, v132, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@, external clients will not have a safe URL (%{public}@)", buf, 0x20u);
      }

      v128 = 0;
    }
    v175 = v128;
    v126 = v93;

  }
  else
  {
    v125 = v121;
    v126 = v93;
    v175 = 0;
  }
  v60 = v153;
  v69 = v149;
  objc_msgSend(v149, "path");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = [CAMStillImageLocalPersistenceResult alloc];
  objc_msgSend(v164, "identifier");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)v160;
  v136 = v134;
  v137 = v125;
  v138 = v125;
  v64 = v146;
  v173 = -[CAMStillImageLocalPersistenceResult initWithCaptureResult:atURL:linkedURL:localAdjustmentsURL:diagnosticsPath:filteredPreviewPath:withUUID:creationDate:uniformTypeIdentifier:orientation:metadata:adjustmentsData:localPrivateMetadataFileURL:error:](v136, "initWithCaptureResult:atURL:linkedURL:localAdjustmentsURL:diagnosticsPath:filteredPreviewPath:withUUID:creationDate:uniformTypeIdentifier:orientation:metadata:adjustmentsData:localPrivateMetadataFileURL:error:", v126, v169, v175, v138, v133, v146, v165, v170, v135, v151, v171, v160, v140, v153);

  v65 = v169;
  v73 = (void *)v165;

  v72 = v161;
  v70 = v156;
  v66 = v171;
  v67 = v145;
LABEL_140:

  return v173;
}

- (CAMThumbnailGenerator)_localPersistenceThumbnailGenerator
{
  return self->__localPersistenceThumbnailGenerator;
}

+ (id)uniquePathForAssetWithUUID:(id)a3 captureTime:(double)a4 extension:(id)a5 usingIncomingDirectory:(BOOL)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  id v28;

  v10 = a3;
  v11 = a5;
  if (objc_msgSend(v10, "length"))
  {
    if (a6)
    {
LABEL_3:
      objc_msgSend(a1, "_pathForIncomingDirectory");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v14;
    if (a6)
      goto LABEL_3;
  }
  NSTemporaryDirectory();
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v15 = (void *)v12;
  objc_msgSend(a1, "delimiterForIncomingAssetFilenames");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.f%@%@"), a4 * 100.0, v16, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v18, "stringByAppendingPathExtension:", v11);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  if (!a6)
  {
    NSTemporaryDirectory();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "fileExistsAtPath:", v20);

    if ((v22 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v24 = objc_msgSend(v23, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v28);
      v25 = v28;

      if ((v24 & 1) == 0)
      {
        v26 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          +[CAMPersistenceController uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:].cold.1();

      }
    }

  }
  return v18;
}

+ (id)_pathForIncomingDirectory
{
  if (_pathForIncomingDirectory_onceToken != -1)
    dispatch_once(&_pathForIncomingDirectory_onceToken, &__block_literal_global_257);
  return (id)__cachedPathForIncomingDirectory;
}

void __53__CAMPersistenceController__pathForIncomingDirectory__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  void *v4;
  id v5;

  CPSharedResourcesDirectory();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Media/DCIM/.MISC/Incoming"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__cachedPathForIncomingDirectory;
  __cachedPathForIncomingDirectory = v0;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", __cachedPathForIncomingDirectory);

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", __cachedPathForIncomingDirectory, 1, 0, 0);

  }
}

+ (id)delimiterForIncomingAssetFilenames
{
  return CFSTR("__");
}

- (BOOL)_writeDataToURL:(id)a3 withData:(id)a4 duringBurst:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  __CFWriteStream *v11;
  CFErrorRef v12;
  id v13;
  CFIndex v14;
  BOOL v15;
  CFErrorRef v16;
  id v18;

  v7 = a5;
  v10 = a4;
  v18 = 0;
  v11 = -[CAMPersistenceController _createOpenWriteStreamWithURL:forBurst:error:](self, "_createOpenWriteStreamWithURL:forBurst:error:", a3, v7, &v18);
  v12 = (CFErrorRef)v18;
  if (!v11)
  {
    v15 = 0;
    if (!a6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v13 = objc_retainAutorelease(v10);
  v14 = CFWriteStreamWrite(v11, (const UInt8 *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
  v15 = v14 > 0;
  if (v14 <= 0)
  {
    v16 = CFWriteStreamCopyError(v11);

    v12 = v16;
  }
  CFWriteStreamClose(v11);
  CFRelease(v11);
  if (a6)
LABEL_5:
    *a6 = objc_retainAutorelease(v12);
LABEL_6:

  return v15;
}

- (id)_xmpEncodedDiagnosticDataFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CGImageMetadata *Mutable;
  CGImageMetadata *v8;
  CFDataRef XMPData;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1DF0B55E8]();
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    Mutable = CGImageMetadataCreateMutable();
    if (Mutable)
    {
      v8 = Mutable;
      CGImageMetadataRegisterNamespaceForPrefix(Mutable, CFSTR("http://ns.apple.com/ios_debug"), CFSTR("ios_debug"), 0);
      CGImageMetadataSetValueWithPath(v8, 0, CFSTR("ios_debug:camera_diagnostics_bplist"), v6);
      XMPData = CGImageMetadataCreateXMPData(v8, 0);
      CFRelease(v8);
    }
    else
    {
      XMPData = 0;
    }

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    XMPData = 0;
  }

  return XMPData;
}

- (CAMPersistenceResultDelegate)resultDelegate
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  v12 = 0;
  -[CAMPersistenceController _resultDelegateIsolationQueue](self, "_resultDelegateIsolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__CAMPersistenceController_resultDelegate__block_invoke;
  v6[3] = &unk_1EA32C0D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CAMPersistenceResultDelegate *)v4;
}

void __42__CAMPersistenceController_resultDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)_coordinateRemotePersistenceForStillImageLocalResult:(id)a3 coordinationInfo:(id)a4 request:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;
  CAMPersistenceController *v15;
  id v16;
  id v17;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  CAMSignpostWithIDAndArgs(51, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  if (v8)
  {
    -[CAMPersistenceController _coordinationQueue](self, "_coordinationQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__CAMPersistenceController__coordinateRemotePersistenceForStillImageLocalResult_coordinationInfo_request___block_invoke;
    block[3] = &unk_1EA3290F0;
    v14 = v8;
    v15 = self;
    v16 = v12;
    v17 = v9;
    dispatch_barrier_sync(v10, block);

    v11 = v14;
  }
  else
  {
    objc_msgSend(0, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPersistenceController _dispatchRemotePersistenceForLocalPersistenceResult:filteredLocalResult:request:powerAssertionReason:loggingIdentifier:](self, "_dispatchRemotePersistenceForLocalPersistenceResult:filteredLocalResult:request:powerAssertionReason:loggingIdentifier:", v12, 0, v9, 512, v11);
  }

}

- (OS_dispatch_queue)_coordinationQueue
{
  return self->__coordinationQueue;
}

void __106__CAMPersistenceController__coordinateRemotePersistenceForStillImageLocalResult_coordinationInfo_request___block_invoke(uint64_t a1)
{
  void *v2;
  CAMStillImagePersistenceCoordinator *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_coordinationQueue_stillImagePersistenceCoordinators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v3 = (CAMStillImagePersistenceCoordinator *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[CAMStillImagePersistenceCoordinator initWithDelegate:loggingIdentifier:]([CAMStillImagePersistenceCoordinator alloc], "initWithDelegate:loggingIdentifier:", *(_QWORD *)(a1 + 40), v4);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);
  }
  -[CAMStillImagePersistenceCoordinator updateForCoordinationInfo:localPersistenceResult:request:](v3, "updateForCoordinationInfo:localPersistenceResult:request:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (-[CAMStillImagePersistenceCoordinator hasReceivedAllExpectedResponses](v3, "hasReceivedAllExpectedResponses"))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, v4);

}

- (OS_dispatch_queue)_remotePersistenceQueue
{
  return self->__remotePersistenceQueue;
}

- (CAMThumbnailGenerator)_remotePersistenceThumbnailGenerator
{
  return self->__remotePersistenceThumbnailGenerator;
}

uint64_t __93__CAMPersistenceController__locallyPersistStillImageResult_forRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfCompletedStillImageLocalPersistenceForRequest:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_notifyDelegateOfCompletedStillImageLocalPersistenceForRequest:(id)a3 withResult:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CAMStillImagePersistenceResponse *v22;
  void *v23;
  void *v24;
  CAMStillImagePersistenceResponse *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  CAMStillImagePersistenceResponse *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;

  v42 = a3;
  v6 = a4;
  objc_msgSend(v6, "localPersistenceUUID");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creationDate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "conformsToProtocol:", &unk_1F038ADF0))
  {
    -[CAMPersistenceController _burstController](self, "_burstController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "burstIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "estimatedCountForIdentifier:");

  }
  else
  {
    v10 = 0;
    v41 = 0;
  }
  objc_msgSend(v6, "captureResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localDestinationURL");
  v39 = objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v42, "sessionIdentifier");
  v14 = objc_msgSend(v11, "isExpectingPairedVideo");
  v15 = objc_msgSend(v42, "type");
  v38 = v11;
  v40 = v6;
  v16 = v10;
  v17 = (void *)v7;
  if (v15)
    v18 = CAMSizeForPhotoMetadata(v12);
  else
    +[CAMAspectCropUtilities finalExpectedSizeWithPhotoMetadata:aspectRatio:](CAMAspectCropUtilities, "finalExpectedSizeWithPhotoMetadata:aspectRatio:", v12, objc_msgSend(v42, "aspectRatioCrop"));
  v20 = v18;
  v21 = v19;
  v22 = [CAMStillImagePersistenceResponse alloc];
  objc_msgSend(v40, "captureResult");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "coordinationInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v37) = v14;
  v25 = v22;
  v26 = v17;
  v27 = v17;
  v28 = v13;
  v29 = (void *)v39;
  v30 = (void *)v8;
  v31 = -[CAMStillImagePersistenceResponse initWithUUID:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:metadata:burstIdentifier:burstRepresentedCount:expectingPairedVideo:coordinationInfo:](v25, "initWithUUID:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:metadata:burstIdentifier:burstRepresentedCount:expectingPairedVideo:coordinationInfo:", v27, v28, v39, v8, 0, v12, v20, v21, v41, v16, v37, v24);

  if (v15 == 2)
  {
    v36 = v42;
    objc_msgSend(v36, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      v32 = v40;
      goto LABEL_17;
    }
    v32 = v40;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(v40, "error");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "panoramaRequestDidCompleteLocalPersistence:withResponse:error:", v36, v31, v35);
LABEL_15:

    v29 = (void *)v39;
    goto LABEL_17;
  }
  v32 = v40;
  if (!v15)
  {
    v33 = v42;
    objc_msgSend(v33, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34 || (objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_17;
    objc_msgSend(v40, "error");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stillImageRequestDidCompleteStillImageLocalPersistence:withResponse:error:", v33, v31, v35);
    goto LABEL_15;
  }
LABEL_18:

}

- (CAMBurstController)_burstController
{
  return self->__burstController;
}

- (void)_handleCompletedStillImageJobForRequest:(id)a3 withReply:(id)a4 fromBatchOfSize:(unint64_t)a5 completionHandler:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    v16 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v26 = v15;
      v27 = 2114;
      v28 = v12;
      v29 = 2114;
      v30 = v13;
      v31 = 2048;
      v32 = a5;
      _os_log_error_impl(&dword_1DB760000, v16, OS_LOG_TYPE_ERROR, "Failed to remotely persist still image, error=%{public}@, request=%{public}@, reply=%{public}@, batchSize:%ld", buf, 0x2Au);
    }

  }
  v22 = MEMORY[0x1E0C809B0];
  v17 = v12;
  v23 = v13;
  v24 = v14;
  v18 = v14;
  v19 = v15;
  v20 = v13;
  pl_dispatch_async();
  if (objc_msgSend(v17, "shouldProtectPersistence", v22, 3221225472, __118__CAMPersistenceController__handleCompletedStillImageJobForRequest_withReply_fromBatchOfSize_completionHandler_error___block_invoke, &unk_1EA32C7B8, self))
  {
    -[CAMPersistenceController _protectionController](self, "_protectionController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stopProtectingPersistenceForRequest:", v17);

  }
  CAMSignpostWithIDAndArgs(52, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);

}

- (void)_notifyDelegateOfCompletedStillImageRemotePersistenceForRequest:(id)a3 withReply:(id)a4 fromBatchOfSize:(unint64_t)a5 error:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  CAMStillImagePersistenceResponse *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;

  v31 = a3;
  v9 = a4;
  v30 = a6;
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D74D38]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D74D40]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D74D70]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D74E98]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (objc_msgSend(v31, "conformsToProtocol:", &unk_1F038ADF0))
  {
    objc_msgSend(v31, "burstIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    a5 = 0;
    v15 = 0;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D98]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D88]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D74E70]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  LOBYTE(v29) = v14;
  v24 = -[CAMStillImagePersistenceResponse initWithUUID:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:metadata:burstIdentifier:burstRepresentedCount:expectingPairedVideo:coordinationInfo:]([CAMStillImagePersistenceResponse alloc], "initWithUUID:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:metadata:burstIdentifier:burstRepresentedCount:expectingPairedVideo:coordinationInfo:", v10, objc_msgSend(v31, "sessionIdentifier"), v23, v11, 0, v12, v18, v21, v15, a5, v29, 0);
  v25 = objc_msgSend(v31, "type");
  if (v25 == 2)
  {
    v28 = v31;
    objc_msgSend(v28, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v27, "panoramaRequestDidCompleteRemotePersistence:withResponse:error:", v28, v24, v30);
    goto LABEL_15;
  }
  if (!v25)
  {
    v26 = v31;
    objc_msgSend(v26, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v27, "stillImageRequestDidCompleteStillImageRemotePersistence:withResponse:error:", v26, v24, v30);
LABEL_15:

  }
}

- (CAMPersistenceController)initWithLocationController:(id)a3 burstController:(id)a4 protectionController:(id)a5 powerController:(id)a6 irisVideoController:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CAMPersistenceController *v17;
  CAMPersistenceController *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *localPersistenceQueue;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *remotePersistenceQueue;
  CAMThumbnailGenerator *v25;
  CAMThumbnailGenerator *localPersistenceThumbnailGenerator;
  CAMThumbnailGenerator *v27;
  CAMThumbnailGenerator *remotePersistenceThumbnailGenerator;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *resultDelegateIsolationQueue;
  NSObject *v32;
  dispatch_queue_t v33;
  OS_dispatch_queue *coordinationQueue;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  CAMPersistenceController *v40;
  void *v41;
  CAMPersistenceController *v42;
  NSObject *v44;
  id v45;
  _QWORD block[4];
  CAMPersistenceController *v47;
  objc_super v48;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v45 = a7;
  v48.receiver = self;
  v48.super_class = (Class)CAMPersistenceController;
  v17 = -[CAMPersistenceController init](&v48, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->__locationController, a3);
    objc_storeStrong((id *)&v18->__burstController, a4);
    objc_storeStrong((id *)&v18->__protectionController, a5);
    objc_storeStrong((id *)&v18->__powerController, a6);
    objc_storeStrong((id *)&v18->__irisVideoController, a7);
    v19 = MEMORY[0x1E0C80D50];
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
    v44 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.persistence-controller.local-persistence", v44);
    localPersistenceQueue = v18->__localPersistenceQueue;
    v18->__localPersistenceQueue = (OS_dispatch_queue *)v20;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("com.apple.persistence-controller.remote-persistence", v22);
    remotePersistenceQueue = v18->__remotePersistenceQueue;
    v18->__remotePersistenceQueue = (OS_dispatch_queue *)v23;

    v25 = objc_alloc_init(CAMThumbnailGenerator);
    localPersistenceThumbnailGenerator = v18->__localPersistenceThumbnailGenerator;
    v18->__localPersistenceThumbnailGenerator = v25;

    v27 = objc_alloc_init(CAMThumbnailGenerator);
    remotePersistenceThumbnailGenerator = v18->__remotePersistenceThumbnailGenerator;
    v18->__remotePersistenceThumbnailGenerator = v27;

    dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_USER_INITIATED, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("com.apple.persistence-controller.result-delegate-isolation", v29);
    resultDelegateIsolationQueue = v18->__resultDelegateIsolationQueue;
    v18->__resultDelegateIsolationQueue = (OS_dispatch_queue *)v30;

    dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_USER_INITIATED, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = dispatch_queue_create("com.apple.persistence-controller.coordination", v32);
    coordinationQueue = v18->__coordinationQueue;
    v18->__coordinationQueue = (OS_dispatch_queue *)v33;

    v35 = v18->__coordinationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __128__CAMPersistenceController_initWithLocationController_burstController_protectionController_powerController_irisVideoController___block_invoke;
    block[3] = &unk_1EA328868;
    v36 = v16;
    v37 = v15;
    v38 = v14;
    v39 = v13;
    v40 = v18;
    v47 = v40;
    dispatch_barrier_sync(v35, block);
    +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:selector:name:object:", v40, sel__mainThread_handleApplicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
    v42 = v40;
    v13 = v39;
    v14 = v38;
    v15 = v37;
    v16 = v36;

  }
  return v18;
}

void __128__CAMPersistenceController_initWithLocationController_burstController_protectionController_powerController_irisVideoController___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  *(_QWORD *)(v3 + 128) = v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 144);
  *(_QWORD *)(v9 + 144) = v8;

}

- (CAMPersistenceController)init
{
  -[CAMPersistenceController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -[CAMPersistenceController initWithLocationController:burstController:protectionController:powerController:irisVideoController:](self, "initWithLocationController:burstController:protectionController:powerController:irisVideoController:", 0, 0, 0, 0, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CAMPersistenceController;
  -[CAMPersistenceController dealloc](&v4, sel_dealloc);
}

- (NSMutableArray)_pendingLocalPersistenceWrappers
{
  NSMutableArray *pendingLocalPersistenceWrappers;
  NSMutableArray *v4;
  NSMutableArray *v5;

  pendingLocalPersistenceWrappers = self->_pendingLocalPersistenceWrappers;
  if (!pendingLocalPersistenceWrappers)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_pendingLocalPersistenceWrappers;
    self->_pendingLocalPersistenceWrappers = v4;

    pendingLocalPersistenceWrappers = self->_pendingLocalPersistenceWrappers;
  }
  return pendingLocalPersistenceWrappers;
}

- (NSMutableArray)_pendingRemotePersistenceWrappers
{
  NSMutableArray *pendingRemotePersistenceWrappers;
  NSMutableArray *v4;
  NSMutableArray *v5;

  pendingRemotePersistenceWrappers = self->_pendingRemotePersistenceWrappers;
  if (!pendingRemotePersistenceWrappers)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_pendingRemotePersistenceWrappers;
    self->_pendingRemotePersistenceWrappers = v4;

    pendingRemotePersistenceWrappers = self->_pendingRemotePersistenceWrappers;
  }
  return pendingRemotePersistenceWrappers;
}

- (void)setResultDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAMPersistenceController _resultDelegateIsolationQueue](self, "_resultDelegateIsolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CAMPersistenceController_setResultDelegate___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

uint64_t __46__CAMPersistenceController_setResultDelegate___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  result = objc_opt_respondsToSelector();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = result & 1;
  return result;
}

- (void)stillImageRequest:(id)a3 didCompleteVideoCaptureWithResult:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[CAMPersistenceController _irisVideoController](self, "_irisVideoController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "shouldHandleLivePhotoRenderingForRequest:", v9))
  {
    if (objc_msgSend(v9, "shouldProtectPersistenceForVideo"))
    {
      -[CAMPersistenceController _protectionController](self, "_protectionController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stopProtectingPersistenceForRequest:", v9);

    }
    objc_msgSend(v7, "stillImageRequest:didCompleteVideoCaptureWithResult:", v9, v6);
  }
  else
  {
    -[CAMPersistenceController _handleVideoPersistenceForRequest:withResult:](self, "_handleVideoPersistenceForRequest:withResult:", v9, v6);
  }

}

uint64_t __70__CAMPersistenceController_stillImageRequestDidCompleteCapture_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "persistenceController:didCompleteAllLocalPersistenceForRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (unsigned)_videoLocalPowerAssertionReasonForCoordinationInfo:(id)a3
{
  id v3;
  int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "isHDR");
  v5 = objc_msgSend(v3, "isFiltered");

  if (v4)
    v6 = 0x4000;
  else
    v6 = 0x2000;
  if (v4)
    v7 = 0x10000;
  else
    v7 = 0x8000;
  if (v5)
    return v7;
  else
    return v6;
}

- (unsigned)_videoRemotePowerAssertionReasonForCoordinationInfo:(id)a3
{
  id v3;
  int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "isHDR");
  v5 = objc_msgSend(v3, "isFiltered");

  if (v4)
    v6 = 0x40000;
  else
    v6 = 0x20000;
  if (v4)
    v7 = 0x100000;
  else
    v7 = 0x80000;
  if (v5)
    return v7;
  else
    return v6;
}

void __78__CAMPersistenceController__handleStillImagePersistenceForRequest_withResult___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "removeAssertionForIdentifier:withReason:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v2 = *(NSObject **)(a1 + 40);
  if (v2)
    dispatch_group_leave(v2);
}

void __78__CAMPersistenceController__handleStillImagePersistenceForRequest_withResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  CAMPendingLocalPersistenceWrapper *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "deferredPersistenceOptions") & 1) != 0)
  {
    v3 = -[CAMPendingLocalPersistenceWrapper initWithRequest:result:completionHandler:]([CAMPendingLocalPersistenceWrapper alloc], "initWithRequest:result:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "_pendingLocalPersistenceWrappers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_locallyPersistStillImageResult:forRequest:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  }
}

- (void)stillImagePersistenceCoordinator:(id)a3 requestsRemotePersistenceForLocalPersistenceResult:(id)a4 filteredLocalResult:(id)a5 request:(id)a6 powerAssertionReason:(unsigned int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = *(_QWORD *)&a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(a3, "loggingIdentifier");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMPersistenceController _dispatchRemotePersistenceForLocalPersistenceResult:filteredLocalResult:request:powerAssertionReason:loggingIdentifier:](self, "_dispatchRemotePersistenceForLocalPersistenceResult:filteredLocalResult:request:powerAssertionReason:loggingIdentifier:", v14, v13, v12, v7, v15);

}

- (void)stillImagePersistenceCoordinator:(id)a3 requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo:(id)a4 request:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  dispatch_time(0, 10000000000);
  -[CAMPersistenceController _localPersistenceQueue](self, "_localPersistenceQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  v10 = v8;
  v11 = v7;
  pl_dispatch_after();

}

void __141__CAMPersistenceController_stillImagePersistenceCoordinator_requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo_request___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __141__CAMPersistenceController_stillImagePersistenceCoordinator_requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo_request___block_invoke_2;
  block[3] = &unk_1EA329360;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_barrier_sync(v2, block);

}

void __141__CAMPersistenceController_stillImagePersistenceCoordinator_requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo_request___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_stillImagePersistenceCoordinators");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateForTimeoutTimerFiredForCoordinationInfo:request:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_dispatchRemotePersistenceForLocalPersistenceResult:(id)a3 filteredLocalResult:(id)a4 request:(id)a5 powerAssertionReason:(unsigned int)a6 loggingIdentifier:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  dispatch_time_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  CAMPersistenceController *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD aBlock[4];
  id v40;
  int v41;
  int v42;

  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v12)
  {
    objc_msgSend(v12, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v17 = objc_msgSend(v14, "assertionIdentifier");
      -[CAMPersistenceController _powerController](self, "_powerController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAssertionForIndentifier:withReason:", v17, v8);
      v19 = objc_msgSend(v14, "shouldProtectPersistence");
      if (v13 && v19)
      {
        -[CAMPersistenceController _protectionController](self, "_protectionController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stopProtectingPersistenceForRequest:", v14);

      }
      v21 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __147__CAMPersistenceController__dispatchRemotePersistenceForLocalPersistenceResult_filteredLocalResult_request_powerAssertionReason_loggingIdentifier___block_invoke;
      aBlock[3] = &unk_1EA32C768;
      v40 = v18;
      v41 = v17;
      v42 = v8;
      v22 = v18;
      v23 = _Block_copy(aBlock);
      v29 = v21;
      v30 = 3221225472;
      v31 = __147__CAMPersistenceController__dispatchRemotePersistenceForLocalPersistenceResult_filteredLocalResult_request_powerAssertionReason_loggingIdentifier___block_invoke_2;
      v32 = &unk_1EA32C790;
      v33 = self;
      v34 = v12;
      v35 = v13;
      v24 = v14;
      v36 = v24;
      v37 = v15;
      v38 = v23;
      v25 = v23;
      v26 = _Block_copy(&v29);
      if (objc_msgSend(v24, "shouldDelayRemotePersistence", v29, v30, v31, v32, v33))
      {
        v27 = dispatch_time(0, 5000000000);
        -[CAMPersistenceController _remotePersistenceQueue](self, "_remotePersistenceQueue");
        v28 = objc_claimAutoreleasedReturnValue();
        dispatch_after(v27, v28, v26);
      }
      else
      {
        -[CAMPersistenceController _remotePersistenceQueue](self, "_remotePersistenceQueue");
        v28 = objc_claimAutoreleasedReturnValue();
        pl_dispatch_async();
      }

    }
  }

}

uint64_t __147__CAMPersistenceController__dispatchRemotePersistenceForLocalPersistenceResult_filteredLocalResult_request_powerAssertionReason_loggingIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAssertionForIdentifier:withReason:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

void __147__CAMPersistenceController__dispatchRemotePersistenceForLocalPersistenceResult_filteredLocalResult_request_powerAssertionReason_loggingIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  CAMPendingRemotePersistenceWrapper *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_jobDictionaryForStillImageLocalResult:filteredLocalResult:fromRequest:loggingIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 56), "deferredPersistenceOptions") & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "creationDate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[CAMPendingRemotePersistenceWrapper initWithRequest:creationDate:job:loggingIdentifier:completionHandler:]([CAMPendingRemotePersistenceWrapper alloc], "initWithRequest:creationDate:job:loggingIdentifier:completionHandler:", *(_QWORD *)(a1 + 56), v2, v8, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 32), "_pendingRemotePersistenceWrappers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_remotelyPersistStillImageJob:forRequest:loggingIdentifier:completionHandler:", v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  if (objc_msgSend(*(id *)(a1 + 56), "conformsToProtocol:", &unk_1F038ADF0))
  {
    v5 = *(id *)(a1 + 56);
    objc_msgSend(v5, "burstIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "_burstController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "processPersistedRequest:withResult:", v5, *(_QWORD *)(a1 + 40));

    }
  }

}

- (id)_extensionForUniformType:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC530]) & 1) != 0)
  {
    v4 = CFSTR("JPG");
  }
  else
  {
    objc_msgSend(v3, "preferredFilenameExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uppercaseString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_uniformTypeForStillImageRequest:(id)a3 result:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id *v9;
  id v10;
  void *v11;

  v5 = a3;
  objc_msgSend(a4, "capturePhoto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processedFileType");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = (id)*MEMORY[0x1E0C8A2D8];
    v8 = objc_msgSend(v5, "photoEncodingBehavior");
    if (v8 == 1)
    {
      v9 = (id *)MEMORY[0x1E0C8A2C8];
      goto LABEL_6;
    }
    if (v8 == 2)
    {
      v9 = (id *)MEMORY[0x1E0C8A2C0];
LABEL_6:
      v10 = *v9;

      v7 = v10;
    }
  }
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_physicallyRotatedJPEGDataFromCapturePhoto:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v9;
  _QWORD v10[3];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "fileDataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D09548];
  v10[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CMPhotoDecompressionCreateCVPixelBufferForIndex();
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[CAMPersistenceController _physicallyRotatedJPEGDataFromCapturePhoto:].cold.1();

  return 0;
}

- (id)_createMetadataForPhysicallyOrientedImage:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t IsMirrored;
  uint64_t v17;
  void *v18;
  float v19;
  double v20;
  float v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  double v37;
  float v38;
  CGFloat v39;
  float v40;
  double v41;
  float v42;
  CGFloat v43;
  float v44;
  CGFloat v45;
  float v46;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  float v74;
  double v75;
  float v76;
  CGFloat v77;
  float v78;
  double v79;
  float v80;
  CGFloat v81;
  float v82;
  CGFloat v83;
  float v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id obj;
  int v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  uint64_t v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  CGAffineTransform v135;
  CGAffineTransform v136;
  _BYTE v137[128];
  _QWORD v138[6];
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;

  v138[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CBCFF0];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CBCB50];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CBCB50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CBCC28];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CBCC28]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CBCC30];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CBCC30]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1EA3B0AA8, v4);
  v115 = v5;
  objc_msgSend(v5, "shortValue");
  PLImageOrientationFromExifOrientation();
  v13 = PLDegreesForImageOrientation();
  v14 = v12;
  IsMirrored = PLImageOrientationIsMirrored();
  if ((int)v13 > 0 || (_DWORD)IsMirrored != 0)
  {
    v126 = v10;
    v17 = IsMirrored;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v7);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, v6);
    v114 = v9;
    objc_msgSend(v9, "floatValue");
    v20 = v19;
    v113 = v11;
    objc_msgSend(v11, "floatValue");
    v22 = v21;
    memset(&v136, 0, sizeof(v136));
    v117 = v17;
    -[CAMPersistenceController _affineTransformForRotationDegrees:mirrored:](self, "_affineTransformForRotationDegrees:mirrored:", v13, v17);
    v23 = fabs(0.0 * v22 + 0.0 * v20);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CBD048]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0CBD040]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, v8);

    v27 = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, v126);

    v29 = v9;
    v30 = *MEMORY[0x1E0CBCC88];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCC88]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v111 = v3;
    v112 = v14;
    v110 = v18;
    v118 = v13;
    if (v31)
    {
      objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = v30;
      objc_msgSend(v32, "objectAtIndexedSubscript:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = v33;
      objc_msgSend(v32, "objectAtIndexedSubscript:", 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "floatValue");
      v37 = v36;
      v122 = v34;
      objc_msgSend(v34, "floatValue");
      v39 = (v37 - v38 * 0.5) / v20;
      objc_msgSend(v33, "floatValue");
      v41 = v40;
      objc_msgSend(v35, "floatValue");
      v43 = (v41 - v42 * 0.5) / v22;
      objc_msgSend(v34, "floatValue");
      v45 = v44 / v20;
      objc_msgSend(v35, "floatValue");
      v135 = v136;
      v139.size.height = v46 / v22;
      v139.origin.x = v39;
      v139.origin.y = v43;
      v139.size.width = v45;
      v140 = CGRectApplyAffineTransform(v139, &v135);
      x = v140.origin.x;
      y = v140.origin.y;
      width = v140.size.width;
      height = v140.size.height;
      LODWORD(v3) = llround(v23 * CGRectGetMidX(v140));
      v141.origin.x = x;
      v141.origin.y = y;
      v141.size.width = width;
      v141.size.height = height;
      v51 = __PAIR64__(HIDWORD(v127), llround(v23 * CGRectGetMidY(v141)));
      v142.origin.x = x;
      v142.origin.y = y;
      v142.size.width = width;
      v142.size.height = height;
      v52 = v32;
      v53 = v7;
      LODWORD(v7) = llround(v23 * CGRectGetWidth(v142));
      v143.origin.x = x;
      v143.origin.y = y;
      v143.size.width = width;
      v143.size.height = height;
      LODWORD(v33) = llround(v23 * CGRectGetHeight(v143));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v138[0] = v54;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v51);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v138[1] = v55;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v7);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v138[2] = v56;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v33);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v138[3] = v57;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 4);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v53;
      v32 = v52;

      v27 = v110;
      v3 = v111;
      objc_msgSend(v110, "setObject:forKeyedSubscript:", v58, v130);

    }
    v59 = v27;
    v9 = v29;
    v11 = v113;
    v60 = *MEMORY[0x1E0CBCA28];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCA28]);
    v61 = v7;
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("Regions"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = *MEMORY[0x1E0CBCAC8];
    objc_msgSend(v63, "objectForKeyedSubscript:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v64, "count"))
    {
      v104 = v60;
      v106 = v63;
      v107 = v32;
      v108 = v61;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = 0u;
      v132 = 0u;
      v133 = 0u;
      v134 = 0u;
      v105 = v64;
      obj = v64;
      v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v137, 16);
      if (v123)
      {
        v120 = *(_QWORD *)v132;
        v119 = *MEMORY[0x1E0CBCAE0];
        v66 = *MEMORY[0x1E0CBCAD8];
        v65 = *MEMORY[0x1E0CBCAE8];
        v67 = *MEMORY[0x1E0CBCAC0];
        do
        {
          for (i = 0; i != v123; ++i)
          {
            if (*(_QWORD *)v132 != v120)
              objc_enumerationMutation(obj);
            v69 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
            objc_msgSend(v69, "objectForKeyedSubscript:", v119);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectForKeyedSubscript:", v65);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectForKeyedSubscript:", v66);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectForKeyedSubscript:", v67);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "floatValue");
            v75 = v74;
            objc_msgSend(v72, "floatValue");
            v77 = v75 - v76 * 0.5;
            v128 = v71;
            objc_msgSend(v71, "floatValue");
            v79 = v78;
            objc_msgSend(v73, "floatValue");
            v81 = v79 - v80 * 0.5;
            v125 = v72;
            objc_msgSend(v72, "floatValue");
            v83 = v82;
            objc_msgSend(v73, "floatValue");
            v144.size.height = v84;
            v135 = v136;
            v144.origin.x = v77;
            v144.origin.y = v81;
            v144.size.width = v83;
            v145 = CGRectApplyAffineTransform(v144, &v135);
            v85 = v145.origin.x;
            v86 = v145.origin.y;
            v87 = v145.size.width;
            v88 = v145.size.height;
            v89 = (void *)objc_msgSend(v69, "mutableCopy");
            v146.origin.x = v85;
            v146.origin.y = v86;
            v146.size.width = v87;
            v146.size.height = v88;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMidX(v146));
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "setObject:forKeyedSubscript:", v90, v119);

            v147.origin.x = v85;
            v147.origin.y = v86;
            v147.size.width = v87;
            v147.size.height = v88;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMidY(v147));
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "setObject:forKeyedSubscript:", v91, v65);

            v148.origin.x = v85;
            v148.origin.y = v86;
            v148.size.width = v87;
            v148.size.height = v88;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetWidth(v148));
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "setObject:forKeyedSubscript:", v92, v66);

            v149.origin.x = v85;
            v149.origin.y = v86;
            v149.size.width = v87;
            v149.size.height = v88;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetHeight(v149));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "setObject:forKeyedSubscript:", v93, v67);

            objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("AngleInfoRoll"));
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = v94;
            if (v94)
            {
              v96 = objc_msgSend(v94, "intValue") + v118;
              if (v117)
                v96 = -v96;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v96 % 360));
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "setObject:forKeyedSubscript:", v97, CFSTR("AngleInfoRoll"));

            }
            objc_msgSend(v121, "addObject:", v89);

          }
          v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v137, 16);
        }
        while (v123);
      }

      v59 = v110;
      v63 = v106;
      if (objc_msgSend(v121, "count"))
      {
        v98 = (void *)objc_msgSend(v106, "mutableCopy");
        objc_msgSend(v98, "setObject:forKeyedSubscript:", v121, v109);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setObject:forKeyedSubscript:", v99, *MEMORY[0x1E0CBCA78]);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setObject:forKeyedSubscript:", v100, *MEMORY[0x1E0CBCA70]);

        v101 = (void *)objc_msgSend(v62, "mutableCopy");
        objc_msgSend(v101, "setObject:forKeyedSubscript:", v98, CFSTR("Regions"));
        objc_msgSend(v110, "setObject:forKeyedSubscript:", v101, v104);
        objc_msgSend(v112, "setObject:forKeyedSubscript:", v101, v104);

      }
      v3 = v111;
      v32 = v107;
      v61 = v108;
      v11 = v113;
      v9 = v114;
      v64 = v105;
    }

    v7 = v61;
    v14 = v112;
  }
  +[CAMCaptureMetadataUtilities removeUnwantedKeysForPersistenceFromMetadata:](CAMCaptureMetadataUtilities, "removeUnwantedKeysForPersistenceFromMetadata:", v14);
  v102 = (void *)objc_msgSend(v14, "copy");

  return v102;
}

- (CGAffineTransform)_affineTransformForRotationDegrees:(SEL)a3 mirrored:(int)a4
{
  _BOOL4 v5;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CGAffineTransform *result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform t1;
  CGAffineTransform t2;

  v5 = a5;
  v8 = MEMORY[0x1E0C9BAA8];
  v17 = *MEMORY[0x1E0C9BAA8];
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v18;
  v16 = *(_OWORD *)(v8 + 32);
  *(_OWORD *)&retstr->tx = v16;
  CGAffineTransformMakeTranslation(&t2, -0.5, -0.5);
  *(_OWORD *)&t1.a = v17;
  *(_OWORD *)&t1.c = v18;
  *(_OWORD *)&t1.tx = v16;
  CGAffineTransformConcat(retstr, &t1, &t2);
  if (v5)
  {
    CGAffineTransformMakeScale(&v23, -1.0, 1.0);
    v9 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v22.c = v9;
    *(_OWORD *)&v22.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&t1, &v22, &v23);
    v10 = *(_OWORD *)&t1.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
    *(_OWORD *)&retstr->c = v10;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  }
  if (a4 >= 1)
  {
    memset(&t1, 0, sizeof(t1));
    CGAffineTransformMakeRotation(&t1, (double)a4 * 0.0174532925);
    v11 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v21.c = v11;
    *(_OWORD *)&v21.tx = *(_OWORD *)&retstr->tx;
    v20 = t1;
    CGAffineTransformConcat(&v22, &v21, &v20);
    v12 = *(_OWORD *)&v22.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v22.a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v22.tx;
  }
  CGAffineTransformMakeTranslation(&v19, 0.5, 0.5);
  v13 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v22.c = v13;
  *(_OWORD *)&v22.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&t1, &v22, &v19);
  v15 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v15;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  return result;
}

- (id)_persistenceErrorForWriteStream:(__CFWriteStream *)a3 url:(id)a4 code:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a3 || (v8 = CFWriteStreamCopyError(a3)) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v12 = CFSTR("url");
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("CAMPersistenceControllerLocalPersistenceErrorDomain"), a5, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (__CFWriteStream)_createOpenWriteStreamWithURL:(id)a3 forBurst:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  const __CFURL *v8;
  __CFWriteStream *v9;
  __CFWriteStream *v10;
  const __CFData *v11;
  const __CFData *v12;
  void *v13;
  CAMPersistenceController *v14;
  __CFWriteStream *v15;
  const __CFURL *v16;
  uint64_t v17;
  UInt8 buffer[4];
  CFRange v20;

  v6 = a4;
  v8 = (const __CFURL *)a3;
  v9 = CFWriteStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8);
  v10 = v9;
  if (!v9)
  {
    -[CAMPersistenceController _persistenceErrorForWriteStream:url:code:](self, "_persistenceErrorForWriteStream:url:code:", 0, v8, -22499);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a5)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (!CFWriteStreamOpen(v9))
  {
    v14 = self;
    v15 = v10;
    v16 = v8;
    v17 = -22498;
    goto LABEL_12;
  }
  v11 = (const __CFData *)CFWriteStreamCopyProperty(v10, CFSTR("_kCFStreamPropertyFileNativeHandle"));
  if (!v11)
  {
    v14 = self;
    v15 = v10;
    v16 = v8;
    v17 = -22497;
LABEL_12:
    -[CAMPersistenceController _persistenceErrorForWriteStream:url:code:](v14, "_persistenceErrorForWriteStream:url:code:", v15, v16, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v10);
    v10 = 0;
    if (!a5)
      goto LABEL_14;
LABEL_13:
    *a5 = objc_retainAutorelease(v13);
    goto LABEL_14;
  }
  v12 = v11;
  *(_DWORD *)buffer = 0;
  v20.location = 0;
  v20.length = 4;
  CFDataGetBytes(v11, v20, buffer);
  fcntl(*(int *)buffer, 48, 1);
  fcntl(*(int *)buffer, 62, 1);
  if (v6)
    fcntl(*(int *)buffer, 82, 1);
  CFRelease(v12);
  v13 = 0;
  if (a5)
    goto LABEL_13;
LABEL_14:

  return v10;
}

- (BOOL)_writeJPEGToURL:(id)a3 withData:(id)a4 thumbnail:(id)a5 properties:(id)a6 duringBurst:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  __CFWriteStream *v17;
  id v18;
  char v19;
  id v21;

  v9 = a7;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v21 = 0;
  v17 = -[CAMPersistenceController _createOpenWriteStreamWithURL:forBurst:error:](self, "_createOpenWriteStreamWithURL:forBurst:error:", a3, v9, &v21);
  v18 = v21;
  if (!v17)
  {
    v19 = 0;
    if (!a8)
      goto LABEL_4;
    goto LABEL_3;
  }
  v19 = CGImageWriteEXIFJPEGWithMetadata();
  CFWriteStreamClose(v17);
  CFRelease(v17);

  v18 = 0;
  if (a8)
LABEL_3:
    *a8 = objc_retainAutorelease(v18);
LABEL_4:

  return v19;
}

- (id)_adjustmentsDataForCinematicVideoRequest:(id)a3 result:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0D75150];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setDepthEnabled:", 1);
  objc_msgSend(v8, "setCinematicVideoRenderingVersion:", objc_msgSend(MEMORY[0x1E0D71178], "currentSystemRenderingVersion"));
  v9 = objc_msgSend(v7, "audioConfiguration");

  if (v9 == 3)
  {
    v10 = objc_alloc(MEMORY[0x1E0D75140]);
    objc_msgSend(v5, "localDestinationURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithAVURL:options:timeZoneLookup:", v11, 13, 0);

    v13 = objc_msgSend(v12, "hasSpatialAudio");
    if ((v13 & 1) == 0)
    {
      v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v14, OS_LOG_TYPE_DEFAULT, "Cinematic video does not have spatial audio, possibly due to DSTM.", buf, 2u);
      }

    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v8, "setIsEligibleForCinematicAudioEffectProcessing:", v13);
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0D750C0], "serializedAdjustments:error:", v8, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;
  if (!v15)
  {
    v17 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "Failed to serialize camera adjustments data for cinematic video error: %{public}@", buf, 0xCu);
    }

  }
  return v15;
}

- (id)_adjustmentsDataForVideoRequest:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D75150];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_msgSend(v4, "audioConfiguration");

  objc_msgSend(v5, "setIsEligibleForCinematicAudioEffectProcessing:", v6 == 3);
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0D750C0], "serializedAdjustments:error:", v5, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (!v7)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Failed to serialize camera adjustments data for video error: %{public}@", buf, 0xCu);
    }

  }
  return v7;
}

- (id)_adjustmentsDataForSloMoVideoRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D75150]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "setSloMoEnabled:", 1);
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0D750C0], "serializedAdjustments:error:", v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v4)
    {
      v6 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v10 = v5;
        _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Failed to serialize camera adjustments data for sloMo video error: %{public}@", buf, 0xCu);
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_adjustmentsDataForRequest:(id)a3 captureDimensions:(id)a4 portraitMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double var0;
  double var1;
  double v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  double v34;
  double v35;
  os_log_t v36;
  void *v37;
  id v38;
  NSObject *v39;
  __CFString *v40;
  double v41;
  uint64_t v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  id v51;
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v8;
  if (objc_msgSend(v10, "captureMode") == 1 || objc_msgSend(v10, "captureMode") == 8)
  {
    -[CAMPersistenceController _adjustmentsDataForVideoRequest:](self, "_adjustmentsDataForVideoRequest:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v12 = (void *)v11;
    goto LABEL_5;
  }
  if (objc_msgSend(v10, "captureMode") == 2 && objc_msgSend(v10, "type") == 1)
  {
    -[CAMPersistenceController _adjustmentsDataForSloMoVideoRequest:](self, "_adjustmentsDataForSloMoVideoRequest:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1F038AD20)
    && objc_msgSend(v10, "hasAdjustments"))
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "supportedPortraitLightingVersion");

    objc_msgSend(MEMORY[0x1E0D0D078], "ciFilterNameForLightingType:version:", objc_msgSend(v10, "lightingEffectType"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMEffectFilterManager ciFilterNameForFilterType:](CAMEffectFilterManager, "ciFilterNameForFilterType:", objc_msgSend(v10, "effectFilterType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "aspectRatioCrop");
    v19 = *MEMORY[0x1E0D753D8];
    v20 = *(double *)(MEMORY[0x1E0D753D8] + 8);
    v21 = *(double *)(MEMORY[0x1E0D753D8] + 16);
    v22 = *(double *)(MEMORY[0x1E0D753D8] + 24);
    v23 = v22;
    v24 = v21;
    v25 = v20;
    v26 = *MEMORY[0x1E0D753D8];
    if (v18)
    {
      v41 = *(double *)(MEMORY[0x1E0D753D8] + 8);
      v42 = *MEMORY[0x1E0D753D8];
      var0 = (double)a4.var0;
      var1 = (double)a4.var1;
      +[CAMAspectCropUtilities cropRectForAspectRatio:inImageBounds:](CAMAspectCropUtilities, "cropRectForAspectRatio:inImageBounds:", v18, 0.0, 0.0, (double)a4.var0, (double)a4.var1);
      v26 = v29;
      v25 = v30;
      v24 = v31;
      v23 = v32;
      v53.origin.x = 0.0;
      v53.origin.y = 0.0;
      v53.size.width = (double)a4.var0;
      v53.size.height = (double)a4.var1;
      v55.origin.x = v26;
      v55.origin.y = v25;
      v55.size.width = v24;
      v55.size.height = v23;
      if (CGRectEqualToRect(v53, v55))
      {
        v33 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[CAMPersistenceController _adjustmentsDataForRequest:captureDimensions:portraitMetadata:].cold.1(v18, v33, 0.0, 0.0, var0, var1);

      }
      v20 = v41;
      v19 = v42;
    }
    if (v9
      || v17
      || v16
      || (v54.origin.x = v26,
          v54.origin.y = v25,
          v54.size.width = v24,
          v54.size.height = v23,
          v34 = v21,
          v35 = v22,
          !CGRectEqualToRect(v54, *(CGRect *)&v19)))
    {
      v36 = (os_log_t)objc_alloc_init(MEMORY[0x1E0D75150]);
      -[NSObject setEffectFilterName:](v36, "setEffectFilterName:", v17);
      -[NSObject setPortraitEffectFilterName:](v36, "setPortraitEffectFilterName:", v16);
      -[NSObject setPortraitMetadata:](v36, "setPortraitMetadata:", v9);
      -[NSObject setDepthEnabled:](v36, "setDepthEnabled:", v9 != 0);
      -[NSObject setCropRect:](v36, "setCropRect:", v26, v25, v24, v23);
      v43 = 0;
      objc_msgSend(MEMORY[0x1E0D750C0], "serializedAdjustments:error:", v36, &v43);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v43;
      if (!v12)
      {
        v39 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          if (v18 > 3)
            v40 = 0;
          else
            v40 = off_1EA32CA60[v18];
          *(_DWORD *)buf = 138544130;
          v45 = v17;
          v46 = 2114;
          v47 = v16;
          v48 = 2114;
          v49 = v40;
          v50 = 2114;
          v51 = v38;
          _os_log_impl(&dword_1DB760000, v39, OS_LOG_TYPE_DEFAULT, "Failed to serialize camera adjustments data for filter name: %{public}@; lighting name: %{public}@; crop asp"
            "ect: %{public}@; error: %{public}@",
            buf,
            0x2Au);
        }

      }
    }
    else
    {
      v36 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0D0D078], "displayNameForLightingType:", objc_msgSend(v10, "lightingEffectType"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v37;
        _os_log_impl(&dword_1DB760000, v36, OS_LOG_TYPE_DEFAULT, "No adjustments needed for request even though hasAdjustments=YES: %{public}@", buf, 0xCu);

      }
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
LABEL_5:

  return v12;
}

- (id)_jobDictionaryForStillImageLocalResult:(id)a3 filteredLocalResult:(id)a4 fromRequest:(id)a5 loggingIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v78;
  void *v79;
  void *v80;
  void *v82;
  void *v83;
  char v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  uint8_t buf[4];
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (objc_class *)MEMORY[0x1E0C99E08];
  v13 = a6;
  v14 = objc_alloc_init(v12);
  objc_msgSend(v14, "setObject:forKey:", *MEMORY[0x1E0D74E00], *MEMORY[0x1E0D74DB8]);
  objc_msgSend(v9, "uniformTypeIdentifier");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:");
  objc_msgSend(v9, "localDestinationURL");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "path");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:");
  objc_msgSend(v10, "captureResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "representsDeferredFilteredProxy");

  v84 = v16;
  if ((v16 & 1) == 0)
  {
    objc_msgSend(v10, "localDestinationURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D74E68]);

  }
  v19 = objc_msgSend(v9, "imageOrientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v20, *MEMORY[0x1E0D74DA8]);

  objc_msgSend(v9, "captureResult");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deferredPhotoIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D74D58]);

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("captureLogID"));
  objc_msgSend(v9, "metadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "type"))
  {
    v24 = CAMSizeForPhotoMetadata(v23);
    v26 = v25;
  }
  else
  {
    v27 = v11;
    objc_msgSend(v9, "captureResult");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "capturePhoto");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "captureResult");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "predictedFinalAssetPhotoDimensions");

    v32 = PLExifOrientationFromImageOrientation();
    v33 = objc_msgSend(v27, "aspectRatioCrop");
    if (v29)
      +[CAMAspectCropUtilities finalExpectedSizeWithCaptureDimensions:orientation:aspectRatio:](CAMAspectCropUtilities, "finalExpectedSizeWithCaptureDimensions:orientation:aspectRatio:", v31, v32, v33);
    else
      +[CAMAspectCropUtilities finalExpectedSizeWithPhotoMetadata:aspectRatio:](CAMAspectCropUtilities, "finalExpectedSizeWithPhotoMetadata:aspectRatio:", v23, v33);
    v24 = v34;
    v26 = v35;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D74D98]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D74D88]);

  objc_msgSend(v10, "localAdjustmentsURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    objc_msgSend(v38, "path");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0D74E60]);

  }
  objc_msgSend(v9, "localAdjustmentsURL");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = 0;
    v42 = objc_msgSend(v41, "removeItemAtURL:error:", v88, &v90);
    v43 = v90;

    if ((v42 & 1) == 0)
    {
      v44 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v92 = (uint64_t)v88;
        v93 = 2114;
        v94 = (uint64_t)v43;
        _os_log_impl(&dword_1DB760000, v44, OS_LOG_TYPE_DEFAULT, "Failed to delete adjustments file when ingesting fullsize render as stand-alone asset %{public}@: %{public}@", buf, 0x16u);
      }

    }
  }
  v83 = v39;
  objc_msgSend(v9, "captureResult");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "coordinationInfo");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v46;
  v89 = v10;
  if (!v46)
  {
    v49 = v19;
    objc_msgSend(v9, "localPersistenceUUID");
    v48 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v47 = objc_msgSend(v46, "isFilteredImageForFilteredPair");
  objc_msgSend(v9, "localPersistenceUUID");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = v19;
  if (!v47)
  {
LABEL_23:
    v53 = v48;
    objc_msgSend(v9, "localPersistenceUUID");
    v51 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "UUIDString");
  v51 = objc_claimAutoreleasedReturnValue();

  v52 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v92 = v48;
    v93 = 2114;
    v94 = v51;
    _os_log_impl(&dword_1DB760000, v52, OS_LOG_TYPE_DEFAULT, "Persisting fullsize render for unfiltered+filtered pair %{public}@ as stand alone asset with new UUID %{public}@", buf, 0x16u);
  }
  v53 = v48;

LABEL_24:
  v78 = (void *)v51;
  objc_msgSend(v14, "setObject:forKey:", v51, *MEMORY[0x1E0D74D38]);
  objc_msgSend(v45, "compactMetadata");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v54, *MEMORY[0x1E0D74D70]);

  v55 = objc_msgSend(v45, "stillImageFilteredPreviewSurface");
  v56 = objc_msgSend(v45, "stillImageUnfilteredPreviewSurface");
  if (!v55)
    v55 = v56;
  -[CAMPersistenceController _remotePersistenceThumbnailGenerator](self, "_remotePersistenceThumbnailGenerator");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v82, "newJPEGDataOfFormat:inOrientation:usingSurface:withMetadata:", objc_msgSend(MEMORY[0x1E0D73130], "masterThumbnailFormat"), v49, v55, v23);
  if (v57)
    objc_msgSend(v14, "setObject:forKey:", v57, *MEMORY[0x1E0D74EE8]);
  v79 = (void *)v57;
  if (objc_msgSend(v11, "capturedFromPhotoBooth"))
    v58 = objc_msgSend(MEMORY[0x1E0D73148], "savedAssetTypeForPhotoBoothAsset");
  else
    v58 = objc_msgSend(MEMORY[0x1E0D73148], "savedAssetTypeForCameraCapturedAsset");
  v59 = (void *)v53;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v60, *MEMORY[0x1E0D74F00]);

  objc_msgSend(v14, "setObject:forKey:", &unk_1EA3B0AD8, *MEMORY[0x1E0D74CB0]);
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1F038AD80))
  {
    objc_msgSend(v11, "burstIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      objc_msgSend(v14, "setObject:forKey:", v61, *MEMORY[0x1E0D74D08]);
      objc_msgSend(v14, "setObject:forKey:", &unk_1EA3B0AF0, *MEMORY[0x1E0D74D00]);
      objc_msgSend(v14, "setObject:forKey:", &unk_1EA3B0B08, *MEMORY[0x1E0D74D10]);
    }

  }
  v62 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v14, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D74EC8]);
  objc_msgSend(v14, "setObject:forKey:", v62, *MEMORY[0x1E0D74CA0]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D74EF8]);
  v63 = v11;
  v64 = objc_msgSend(v11, "captureDevice");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v64 > 0xB) | (0xFDu >> v64) & 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v65, *MEMORY[0x1E0D74D18]);

  objc_msgSend(v89, "adjustmentsData");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66 || (objc_msgSend(v9, "adjustmentsData"), (v66 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v66, *MEMORY[0x1E0D74CF8]);

  }
  v67 = v59;
  if ((v84 & 1) == 0)
  {
    objc_msgSend(v9, "localFilteredPreviewPath");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v69)
      goto LABEL_43;
    goto LABEL_42;
  }
  objc_msgSend(v89, "localDestinationURL");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "path");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
LABEL_42:
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v69, *MEMORY[0x1E0D74E80]);
LABEL_43:
  objc_msgSend(v9, "localDiagnosticsPath");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v70, *MEMORY[0x1E0D74E78]);
  objc_msgSend(v9, "localPrivateMetadataFileURL");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "path");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v72, *MEMORY[0x1E0D74D20]);

  if (objc_msgSend(v63, "conformsToProtocol:", &unk_1F038AEF8))
  {
    v73 = objc_msgSend(v45, "isExpectingPairedVideo");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v74, *MEMORY[0x1E0D74E98]);

    if ((_DWORD)v73)
    {
      objc_msgSend(v45, "coordinationInfo");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "irisIdentifierForEV0:", objc_msgSend(v75, "isEV0ForHDREV0Pair"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v76, *MEMORY[0x1E0D74EA8]);

    }
  }

  return v14;
}

uint64_t __118__CAMPersistenceController__handleCompletedStillImageJobForRequest_withReply_fromBatchOfSize_completionHandler_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfCompletedStillImageRemotePersistenceForRequest:withReply:fromBatchOfSize:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_remotelyPersistStillImageJob:(id)a3 forRequest:(id)a4 loggingIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  CFAbsoluteTime Current;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  CAMPersistenceController *v26;
  id v27;
  id v28;
  CFAbsoluteTime v29;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = *MEMORY[0x1E0D74D38];
  v14 = a3;
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0D73168], "sharedSystemLibraryAssetsdClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resourceClient");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __105__CAMPersistenceController__remotelyPersistStillImageJob_forRequest_loggingIdentifier_completionHandler___block_invoke;
  v23[3] = &unk_1EA32C7E0;
  v29 = Current;
  v24 = v11;
  v25 = v15;
  v26 = self;
  v27 = v10;
  v28 = v12;
  v19 = v12;
  v20 = v10;
  v21 = v15;
  v22 = v11;
  objc_msgSend(v18, "saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandler:", v14, 0, 0, v23);

}

void __105__CAMPersistenceController__remotelyPersistStillImageJob_forRequest_loggingIdentifier_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  double Current;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  NSObject *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  if (a2)
  {
    v10 = Current;
    v11 = *(double *)(a1 + 72);
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D90]);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v18 = 138544130;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      v22 = 2114;
      v23 = v12;
      v24 = 2048;
      v25 = v10 - v11;
      _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ PersistenceController: added photo to library as %{public}@ %{public}@ (took %.3f seconds)", (uint8_t *)&v18, 0x2Au);
    }

  }
  else
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      v18 = 138543874;
      v19 = v16;
      v20 = 2114;
      v21 = v17;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ PersistenceController: error adding photo to library %{public}@: %{public}@", (uint8_t *)&v18, 0x20u);
    }
  }

  objc_msgSend(*(id *)(a1 + 48), "_handleCompletedStillImageJobForRequest:withReply:fromBatchOfSize:completionHandler:error:", *(_QWORD *)(a1 + 56), v7, 1, *(_QWORD *)(a1 + 64), v8);
}

- (void)_handleVideoPersistenceForRequest:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD aBlock[4];
  id v28;
  NSObject *v29;
  int v30;
  int v31;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "persistenceOptions");
  if (v8)
  {
    v9 = v8;
    if (v8 != 3)
    {
      objc_msgSend(v7, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CAMPersistenceController _handleStillImagePersistenceForRequest:withResult:].cold.1();

        if (objc_msgSend(v6, "shouldProtectPersistenceForVideo"))
        {
          -[CAMPersistenceController _protectionController](self, "_protectionController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stopProtectingPersistenceForRequest:", v6);

        }
        objc_msgSend(v7, "coordinationInfo");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v9 == 2 && v13)
          -[CAMPersistenceController _coordinateRemotePersistenceForVideoLocalResult:coordinationInfo:request:](self, "_coordinateRemotePersistenceForVideoLocalResult:coordinationInfo:request:", 0, v13, v6);
      }
      else
      {
        objc_msgSend(v7, "coordinationInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[CAMPersistenceController _videoLocalPowerAssertionReasonForCoordinationInfo:](self, "_videoLocalPowerAssertionReasonForCoordinationInfo:", v14);
        -[CAMPersistenceController _powerController](self, "_powerController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v6, "assertionIdentifier");
        objc_msgSend(v16, "addAssertionForIndentifier:withReason:", v17, v15);
        if (-[CAMPersistenceController resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest](self, "resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest"))
        {
          objc_msgSend(v6, "persistenceUUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMPersistenceController _ensureCoordinationGroupForIdentifier:](self, "_ensureCoordinationGroupForIdentifier:", v18);
          v19 = objc_claimAutoreleasedReturnValue();

          if (v19)
            dispatch_group_enter(v19);
        }
        else
        {
          v19 = 0;
        }
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __73__CAMPersistenceController__handleVideoPersistenceForRequest_withResult___block_invoke;
        aBlock[3] = &unk_1EA32C808;
        v30 = v17;
        v31 = v15;
        v28 = v16;
        v29 = v19;
        v20 = v19;
        v21 = v16;
        v22 = _Block_copy(aBlock);
        -[CAMPersistenceController _localPersistenceQueue](self, "_localPersistenceQueue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v6;
        v26 = v7;
        v24 = v22;
        pl_dispatch_async();

      }
    }
  }

}

void __73__CAMPersistenceController__handleVideoPersistenceForRequest_withResult___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "removeAssertionForIdentifier:withReason:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v2 = *(NSObject **)(a1 + 40);
  if (v2)
    dispatch_group_leave(v2);
}

void __73__CAMPersistenceController__handleVideoPersistenceForRequest_withResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  CAMPendingLocalPersistenceWrapper *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "deferredPersistenceOptions") & 1) != 0)
  {
    v3 = -[CAMPendingLocalPersistenceWrapper initWithRequest:result:completionHandler:]([CAMPendingLocalPersistenceWrapper alloc], "initWithRequest:result:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "_pendingLocalPersistenceWrappers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_locallyPersistVideoCaptureResult:forRequest:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  }
}

- (void)videoPersistenceCoordinator:(id)a3 requestsRemotePersistenceForLocalPersistenceResult:(id)a4 captureRequest:(id)a5 powerAssertionReason:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;

  v6 = *(_QWORD *)&a6;
  v10 = a5;
  v11 = a4;
  objc_msgSend(a3, "loggingIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMPersistenceController _dispatchRemotePersistenceForLocalVideoPersistenceResult:request:powerAssertionReason:loggingIdentifier:](self, "_dispatchRemotePersistenceForLocalVideoPersistenceResult:request:powerAssertionReason:loggingIdentifier:", v11, v10, v6, v12);

}

- (void)videoPersistenceCoordinator:(id)a3 requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo:(id)a4 request:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  dispatch_time(0, 10000000000);
  -[CAMPersistenceController _localPersistenceQueue](self, "_localPersistenceQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  v10 = v8;
  v11 = v7;
  pl_dispatch_after();

}

void __136__CAMPersistenceController_videoPersistenceCoordinator_requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo_request___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __136__CAMPersistenceController_videoPersistenceCoordinator_requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo_request___block_invoke_2;
  block[3] = &unk_1EA329360;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_barrier_sync(v2, block);

}

void __136__CAMPersistenceController_videoPersistenceCoordinator_requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo_request___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_videoPersistenceCoordinators");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateForTimeoutTimerFiredForCoordinationInfo:request:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_notifyDelegateOfCompletedVideoLocalPersistenceForRequest:(id)a3 withResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  CAMVideoPersistenceResponse *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  CAMVideoPersistenceResponse *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "localPersistenceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "sessionIdentifier");
  objc_msgSend(v6, "localDestinationURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creationDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v38 = 0uLL;
  v39 = 0;
  if (v6)
    objc_msgSend(v6, "duration");
  objc_msgSend(v6, "stillPersistenceUUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0uLL;
  v37 = 0;
  if (v6)
    objc_msgSend(v6, "stillDisplayTime");
  v10 = objc_msgSend(v5, "type");
  +[CAMOrientationUtilities imageOrientationForVideoRequest:](CAMOrientationUtilities, "imageOrientationForVideoRequest:", v5);
  v11 = PLExifOrientationFromImageOrientation();
  if (v10)
  {
    objc_msgSend(v6, "dimensions");
    CAMSizeForDimensions();
  }
  else
  {
    v14 = v5;
    v15 = objc_msgSend(v6, "dimensions");
    v16 = objc_msgSend(v14, "aspectRatioCrop");

    +[CAMAspectCropUtilities finalExpectedSizeWithCaptureDimensions:orientation:aspectRatio:](CAMAspectCropUtilities, "finalExpectedSizeWithCaptureDimensions:orientation:aspectRatio:", v15, v11, v16);
  }
  v17 = v12;
  v18 = v13;
  v19 = [CAMVideoPersistenceResponse alloc];
  v20 = objc_msgSend(v5, "captureMode");
  objc_msgSend(v6, "coordinationInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v38;
  v35 = v39;
  v32 = v36;
  v33 = v37;
  v22 = v20;
  v23 = (void *)v9;
  v24 = -[CAMVideoPersistenceResponse initWithUUID:captureMode:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:duration:stillPersistenceUUID:stillDisplayTime:coordinationInfo:](v19, "initWithUUID:captureMode:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:duration:stillPersistenceUUID:stillDisplayTime:coordinationInfo:", v7, v22, v8, v31, v9, 0, v17, v18, &v34, v30, &v32, v21);

  if (v10 == 1)
  {
    v29 = v5;
    objc_msgSend(v29, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26 || (objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_17;
    v27 = v7;
    objc_msgSend(v6, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "videoRequestDidCompleteLocalPersistence:withResponse:error:", v29, v24, v28);
    goto LABEL_16;
  }
  if (!v10)
  {
    v25 = v5;
    objc_msgSend(v25, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26 || (objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_17;
    v27 = v7;
    objc_msgSend(v6, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stillImageRequestDidCompleteVideoLocalPersistence:withResponse:error:", v25, v24, v28);
LABEL_16:

    v7 = v27;
LABEL_17:

  }
}

- (void)_locallyPersistVideoCaptureResult:(id)a3 forRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "persistenceOptions");
  -[CAMPersistenceController _persistVideoCaptureResult:withRequest:](self, "_persistVideoCaptureResult:withRequest:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPersistenceController resultDelegate](self, "resultDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "persistenceController:didGenerateVideoLocalPersistenceResult:forCaptureResult:fromRequest:", self, v12, v8, v9);
  if (v11 == 2 && !v13)
  {
    objc_msgSend(v8, "coordinationInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPersistenceController _coordinateRemotePersistenceForVideoLocalResult:coordinationInfo:request:](self, "_coordinateRemotePersistenceForVideoLocalResult:coordinationInfo:request:", v12, v15, v9);

  }
  v19 = v9;
  v20 = v10;
  v16 = v10;
  v17 = v12;
  v18 = v9;
  pl_dispatch_async();

}

uint64_t __95__CAMPersistenceController__locallyPersistVideoCaptureResult_forRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfCompletedVideoLocalPersistenceForRequest:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_coordinateRemotePersistenceForVideoLocalResult:(id)a3 coordinationInfo:(id)a4 request:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  CAMPersistenceController *v14;
  id v15;
  id v16;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  CAMSignpostWithIDAndArgs(55, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  if (v8)
  {
    -[CAMPersistenceController _coordinationQueue](self, "_coordinationQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__CAMPersistenceController__coordinateRemotePersistenceForVideoLocalResult_coordinationInfo_request___block_invoke;
    block[3] = &unk_1EA3290F0;
    v13 = v8;
    v14 = self;
    v15 = v11;
    v16 = v9;
    dispatch_barrier_sync(v10, block);

  }
  else if (v11)
  {
    -[CAMPersistenceController _dispatchRemotePersistenceForLocalVideoPersistenceResult:request:powerAssertionReason:loggingIdentifier:](self, "_dispatchRemotePersistenceForLocalVideoPersistenceResult:request:powerAssertionReason:loggingIdentifier:", v11, v9, 0x20000, &stru_1EA3325A0);
  }

}

void __101__CAMPersistenceController__coordinateRemotePersistenceForVideoLocalResult_coordinationInfo_request___block_invoke(uint64_t a1)
{
  void *v2;
  CAMVideoPersistenceCoordinator *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_coordinationQueue_videoPersistenceCoordinators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v3 = (CAMVideoPersistenceCoordinator *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[CAMVideoPersistenceCoordinator initWithDelegate:loggingIdentifier:]([CAMVideoPersistenceCoordinator alloc], "initWithDelegate:loggingIdentifier:", *(_QWORD *)(a1 + 40), v4);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);
  }
  -[CAMVideoPersistenceCoordinator updateForCoordinationInfo:localPersistenceResult:request:](v3, "updateForCoordinationInfo:localPersistenceResult:request:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (-[CAMVideoPersistenceCoordinator hasReceivedAllExpectedResponses](v3, "hasReceivedAllExpectedResponses"))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)_dispatchRemotePersistenceForLocalVideoPersistenceResult:(id)a3 request:(id)a4 powerAssertionReason:(unsigned int)a5 loggingIdentifier:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  dispatch_time_t v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  int v32;
  int v33;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_msgSend(v11, "assertionIdentifier");
  -[CAMPersistenceController _powerController](self, "_powerController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAssertionForIndentifier:withReason:", v13, v7);
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__CAMPersistenceController__dispatchRemotePersistenceForLocalVideoPersistenceResult_request_powerAssertionReason_loggingIdentifier___block_invoke;
  aBlock[3] = &unk_1EA32C768;
  v31 = v14;
  v32 = v13;
  v33 = v7;
  v16 = v14;
  v17 = _Block_copy(aBlock);
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __132__CAMPersistenceController__dispatchRemotePersistenceForLocalVideoPersistenceResult_request_powerAssertionReason_loggingIdentifier___block_invoke_2;
  v25[3] = &unk_1EA32C830;
  v25[4] = self;
  v26 = v10;
  v18 = v11;
  v27 = v18;
  v28 = v12;
  v29 = v17;
  v19 = v17;
  v20 = v12;
  v21 = v10;
  v22 = _Block_copy(v25);
  if (objc_msgSend(v18, "shouldDelayRemotePersistence"))
  {
    v23 = dispatch_time(0, 5000000000);
    -[CAMPersistenceController _remotePersistenceQueue](self, "_remotePersistenceQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v23, v24, v22);
  }
  else
  {
    -[CAMPersistenceController _remotePersistenceQueue](self, "_remotePersistenceQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    pl_dispatch_async();
  }

}

uint64_t __132__CAMPersistenceController__dispatchRemotePersistenceForLocalVideoPersistenceResult_request_powerAssertionReason_loggingIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAssertionForIdentifier:withReason:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

void __132__CAMPersistenceController__dispatchRemotePersistenceForLocalVideoPersistenceResult_request_powerAssertionReason_loggingIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  CAMPendingRemotePersistenceWrapper *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_jobDictionaryForVideoLocalResult:fromRequest:loggingIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 48), "deferredPersistenceOptions") & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "creationDate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[CAMPendingRemotePersistenceWrapper initWithRequest:creationDate:job:loggingIdentifier:completionHandler:]([CAMPendingRemotePersistenceWrapper alloc], "initWithRequest:creationDate:job:loggingIdentifier:completionHandler:", *(_QWORD *)(a1 + 48), v2, v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "_pendingRemotePersistenceWrappers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_remotelyPersistVideoJob:forRequest:loggingIdentifier:withSendHandler:completionHandler:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64));
  }

}

+ (id)videoMetadataDateFormatter
{
  if (videoMetadataDateFormatter_onceToken != -1)
    dispatch_once(&videoMetadataDateFormatter_onceToken, &__block_literal_global_30);
  return (id)videoMetadataDateFormatter_formatter;
}

uint64_t __54__CAMPersistenceController_videoMetadataDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)videoMetadataDateFormatter_formatter;
  videoMetadataDateFormatter_formatter = (uint64_t)v0;

  v2 = (void *)videoMetadataDateFormatter_formatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  v4 = (void *)videoMetadataDateFormatter_formatter;
  v5 = objc_alloc(MEMORY[0x1E0C99D48]);
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "setCalendar:", v6);

  return objc_msgSend((id)videoMetadataDateFormatter_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZ"));
}

+ (id)clientVideoMetadataForLocation:(id)a3 withCreationDate:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  void *v36;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v32 = a4;
  v7 = objc_alloc_init(v6);
  objc_msgSend(v5, "cam_videoMetadataRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = (uint64_t *)MEMORY[0x1E0C8A9D0];
  if (v5 && v8 && objc_msgSend(v8, "length"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    objc_msgSend(v11, "setKeySpace:", *v10);
    objc_msgSend(v11, "setKey:", *MEMORY[0x1E0C8A8A0]);
    objc_msgSend(v11, "setValue:", v9);
    objc_msgSend(v7, "addObject:", v11);
    v12 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    objc_msgSend(v12, "setIdentifier:", *MEMORY[0x1E0C8A980]);
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "horizontalAccuracy");
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%f"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:", v15);

    objc_msgSend(v7, "addObject:", v12);
  }
  v36 = v5;
  v16 = objc_alloc_init(MEMORY[0x1E0C8B278]);
  v17 = *v10;
  objc_msgSend(v16, "setKeySpace:", *v10);
  objc_msgSend(v16, "setKey:", *MEMORY[0x1E0C8A8A8]);
  objc_msgSend(v16, "setValue:", CFSTR("Apple"));
  objc_msgSend(v7, "addObject:", v16);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MGCopyAnswer();
  v35 = v9;
  v31 = v19;
  if (v19)
  {
    v20 = v19;
  }
  else
  {
    objc_msgSend(v18, "localizedModel");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;
  v30 = v20;
  v22 = objc_alloc_init(MEMORY[0x1E0C8B278]);
  objc_msgSend(v22, "setKeySpace:", v17);
  objc_msgSend(v22, "setKey:", *MEMORY[0x1E0C8A8B0]);
  objc_msgSend(v22, "setValue:", v21);
  objc_msgSend(v7, "addObject:", v22);
  objc_msgSend(v18, "systemVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x1E0C8B278]);
  objc_msgSend(v24, "setKeySpace:", v17);
  objc_msgSend(v24, "setKey:", *MEMORY[0x1E0C8A8B8]);
  objc_msgSend(v24, "setValue:", v23);
  objc_msgSend(v7, "addObject:", v24);
  objc_msgSend(a1, "videoMetadataDateFormatter");
  v34 = v18;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringFromDate:", v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc_init(MEMORY[0x1E0C8B278]);
  objc_msgSend(v27, "setKeySpace:", v17);
  objc_msgSend(v27, "setKey:", *MEMORY[0x1E0C8A890]);
  objc_msgSend(v27, "setValue:", v26);
  objc_msgSend(v7, "addObject:", v27);
  v28 = (void *)objc_msgSend(v7, "copy");

  return v28;
}

+ (id)clientVideoMetadataForRequest:(id)a3 withCreationDate:(id)a4 isEV0ForHDR:(BOOL)a5 livePhotoIdentifierOverride:(id)a6 slomoPlayback:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _BOOL4 v31;

  v7 = a7;
  v9 = a5;
  v12 = a3;
  v13 = a6;
  v14 = a4;
  objc_msgSend(v12, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clientVideoMetadataForLocation:withCreationDate:", v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  v18 = 0x1E0CB3000;
  if ((objc_msgSend(v12, "conformsToProtocol:", &unk_1F038AEF8) & 1) != 0)
  {
    v19 = v12;
    v20 = v19;
    if (v13)
    {
      v21 = v13;
    }
    else
    {
      objc_msgSend(v19, "irisIdentifierForEV0:", v9);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v21;
    v24 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    v22 = *MEMORY[0x1E0C8A9E8];
    objc_msgSend(v24, "setKeySpace:", *MEMORY[0x1E0C8A9E8]);
    objc_msgSend(v24, "setKey:", *MEMORY[0x1E0C8AA88]);
    objc_msgSend(v24, "setValue:", v23);
    objc_msgSend(v17, "addObject:", v24);
    if (objc_msgSend(v20, "irisMode") == 2)
    {
      v31 = v7;
      v25 = objc_alloc_init(MEMORY[0x1E0C8B278]);
      objc_msgSend(v25, "setIdentifier:", *MEMORY[0x1E0C8A940]);
      objc_msgSend(v25, "setDataType:", *MEMORY[0x1E0CA2488]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setValue:", v26);

      objc_msgSend(v17, "addObject:", v25);
      v7 = v31;
    }

    v18 = 0x1E0CB3000uLL;
  }
  else
  {
    v22 = *MEMORY[0x1E0C8A9E8];
  }
  v27 = objc_alloc_init(MEMORY[0x1E0C8B278]);
  objc_msgSend(v27, "setKeySpace:", v22);
  objc_msgSend(v27, "setKey:", *MEMORY[0x1E0C8AAA0]);
  objc_msgSend(*(id *)(v18 + 2024), "numberWithInt:", !v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setValue:", v28);

  objc_msgSend(v17, "addObject:", v27);
  v29 = (void *)objc_msgSend(v17, "copy");

  return v29;
}

- (id)_videoPersistenceUUIDForRequest:(id)a3 withResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "persistenceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "type"))
  {
    v8 = v5;
    if (objc_msgSend(v8, "isCTMVideo"))
    {
      objc_msgSend(v8, "persistenceUUID");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "localDestinationURL");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "irisVideoPersistenceUUIDForEV0:", objc_msgSend(v8, "isEV0LocalVideoDestinationURL:", v10));
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }

    v7 = (void *)v9;
  }

  return v7;
}

- (id)_stillPersistenceUUIDForRequest:(id)a3 withVideoResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "persistenceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "type"))
  {
    v8 = v5;
    objc_msgSend(v6, "localDestinationURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "irisStillImagePersistenceUUIDForEV0:", objc_msgSend(v8, "isEV0LocalVideoDestinationURL:", v9));
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }

  return v7;
}

- (id)_persistVideoCaptureResult:(id)a3 withRequest:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  dispatch_semaphore_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  NSObject *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  NSObject *v47;
  void *v48;
  char v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  CAMVideoLocalPersistenceResult *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  CAMVideoLocalPersistenceResult *v70;
  id v72;
  _BYTE v73[12];
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v82;
  __int128 v83;
  uint64_t v84;
  id v85;
  id v86;
  _QWORD v87[4];
  NSObject *v88;
  uint64_t *v89;
  _QWORD v90[4];
  int v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  __int128 v98;
  uint64_t v99;
  __int128 v100;
  uint64_t v101;
  _BYTE buf[24];
  id v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "localDestinationURL");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredLocalDestinationURL");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPersistenceController _videoPersistenceUUIDForRequest:withResult:](self, "_videoPersistenceUUIDForRequest:withResult:", v6, v5);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 0uLL;
  v101 = 0;
  if (v5)
    objc_msgSend(v5, "duration");
  -[CAMPersistenceController _stillPersistenceUUIDForRequest:withVideoResult:](self, "_stillPersistenceUUIDForRequest:withVideoResult:", v6, v5);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0uLL;
  v99 = 0;
  if (v5)
    objc_msgSend(v5, "stillDisplayTime");
  objc_msgSend(v5, "captureDate");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v73[4] = objc_msgSend(v6, "type");
  if (*(_QWORD *)&v73[4])
    v73[0] = 0;
  else
    *(_QWORD *)v73 = objc_msgSend(v6, "ctmCaptureType") != 2;
  v78 = objc_msgSend(v6, "captureMode");
  v92 = 0;
  v93 = &v92;
  v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__11;
  v96 = __Block_byref_object_dispose__11;
  v97 = 0;
  v7 = objc_msgSend(v5, "videoPreviewPixelBuffer");
  v8 = v7;
  if (v78 == 7 && v7)
  {
    objc_msgSend(v82, "URLByDeletingPathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathExtension:", *MEMORY[0x1E0D74A88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v93[5];
    v93[5] = v11;

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71BC8]), "initWithVideoURL:", v82);
    v14 = (void *)MEMORY[0x1E0D71260];
    v15 = (void *)objc_msgSend(MEMORY[0x1E0D71260], "newComposition");
    v16 = (void *)objc_msgSend(v14, "newCompositionControllerWithComposition:", v15);

    objc_msgSend(v13, "source");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSource:mediaType:", v17, 2);

    objc_msgSend(v16, "adjustmentConstants");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "PIPortraitVideoAdjustmentKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "modifyAdjustmentWithKey:modificationBlock:", v19, &__block_literal_global_218);

    LODWORD(v19) = +[CAMOrientationUtilities exifOrientationForVideoRequest:](CAMOrientationUtilities, "exifOrientationForVideoRequest:", v6);
    objc_msgSend(v16, "adjustmentConstants");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "PIOrientationAdjustmentKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __67__CAMPersistenceController__persistVideoCaptureResult_withRequest___block_invoke_2;
    v90[3] = &__block_descriptor_36_e43_v16__0__PIOrientationAdjustmentController_8l;
    v91 = (int)v19;
    objc_msgSend(v16, "modifyAdjustmentWithKey:modificationBlock:", v21, v90);

    v23 = objc_alloc_init(MEMORY[0x1E0D71188]);
    v24 = objc_alloc_init(MEMORY[0x1E0D71190]);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 2073600);
    objc_msgSend(v24, "setScalePolicy:", v25);

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 1);
    objc_msgSend(v24, "setPriority:", v26);

    v27 = dispatch_semaphore_create(0);
    objc_msgSend(v16, "composition");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v22;
    v87[1] = 3221225472;
    v87[2] = __67__CAMPersistenceController__persistVideoCaptureResult_withRequest___block_invoke_3;
    v87[3] = &unk_1EA32C8D8;
    v89 = &v92;
    v29 = v27;
    v88 = v29;
    objc_msgSend(v23, "exportImageToDataWithComposition:options:completion:", v28, v24, v87);

    dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
LABEL_20:

    goto LABEL_21;
  }
  if (!v7)
    goto LABEL_22;
  objc_msgSend(v82, "URLByDeletingPathExtension");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "URLByAppendingPathExtension:", *MEMORY[0x1E0D74A88]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "path");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v93[5];
  v93[5] = v32;

  -[CAMPersistenceController _localPersistenceThumbnailGenerator](self, "_localPersistenceThumbnailGenerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "newJPEGDataInOrientation:usingPixelBuffer:", +[CAMOrientationUtilities imageOrientationForVideoRequest:](CAMOrientationUtilities, "imageOrientationForVideoRequest:", v6), v8);
  if (!objc_msgSend(v16, "length"))
  {
    v36 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v93[5];
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v39;
      v38 = "Failed to create JPEG data for preview surface for %{public}@";
      goto LABEL_18;
    }
LABEL_19:

    v23 = (id)v93[5];
    v93[5] = 0;
    goto LABEL_20;
  }
  CGImageWriteEXIFJPEGToPath();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "fileExistsAtPath:", v93[5]);

  if ((v35 & 1) == 0)
  {
    v36 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v93[5];
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v37;
      v38 = "Failed to write JPEG data for preview surface for %{public}@";
LABEL_18:
      _os_log_impl(&dword_1DB760000, v36, OS_LOG_TYPE_DEFAULT, v38, buf, 0xCu);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
LABEL_21:

LABEL_22:
  if (objc_msgSend(v6, "temporaryPersistenceOptions") != 2)
  {
    v79 = 0;
    v43 = 0;
    goto LABEL_36;
  }
  NSTemporaryDirectory();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "lastPathComponent");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringByAppendingPathComponent:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0;
  v45 = objc_msgSend(v44, "copyItemAtURL:toURL:error:", v82, v43, &v86);
  v72 = v86;

  if ((v45 & 1) != 0)
  {
    if (!v80)
    {
      v79 = 0;
      goto LABEL_35;
    }
    objc_msgSend(v80, "lastPathComponent");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringByAppendingPathComponent:", v46);
    v47 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v47);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0;
    v49 = objc_msgSend(v48, "copyItemAtURL:toURL:error:", v80, v79, &v85);
    v50 = v85;

    if ((v49 & 1) == 0)
    {
      v51 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v80;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v79;
        *(_WORD *)&buf[22] = 2114;
        v103 = v50;
        _os_log_error_impl(&dword_1DB760000, v51, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@, external clients will not have a safe URL (%{public}@)", buf, 0x20u);
      }

      v79 = 0;
    }

  }
  else
  {
    v47 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v82;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v43;
      *(_WORD *)&buf[22] = 2114;
      v103 = v72;
      _os_log_error_impl(&dword_1DB760000, v47, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@, external clients will not have a safe URL (%{public}@)", buf, 0x20u);
    }
    v79 = 0;
    v46 = v43;
    v43 = 0;
  }

LABEL_35:
LABEL_36:
  v52 = objc_msgSend(v6, "captureMode");
  v53 = objc_msgSend(v6, "captureMode");
  v54 = objc_msgSend(v6, "captureMode");
  if (v78 == 7)
  {
    -[CAMPersistenceController _adjustmentsDataForCinematicVideoRequest:result:](self, "_adjustmentsDataForCinematicVideoRequest:result:", v6, v5);
    v55 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*(_QWORD *)&v73[4] && v52 != 1 && v53 != 8 && v54 != 2)
    {
      v56 = 0;
      goto LABEL_45;
    }
    -[CAMPersistenceController _adjustmentsDataForRequest:captureDimensions:portraitMetadata:](self, "_adjustmentsDataForRequest:captureDimensions:portraitMetadata:", v6, objc_msgSend(v5, "dimensions"), 0);
    v55 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v55;
LABEL_45:
  if ((v73[0] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D73200], "filesystemPersistenceBatchItemForFileAtURL:", v82);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v57)
    {
      if (v56)
        objc_msgSend(v57, "setData:forKey:", v56, *MEMORY[0x1E0D73F50]);
      v59 = v93[5];
      if (v59)
        objc_msgSend(v58, "setString:forKey:", v59, *MEMORY[0x1E0D73F60]);
      objc_msgSend(v58, "persist");
    }

  }
  objc_msgSend(v82, "URLByDeletingPathExtension");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "URLByAppendingPathExtension:", CFSTR("MDATA"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = objc_msgSend(v6, "sharedLibraryMode");
  objc_msgSend(v6, "contactIDsInProximity");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharedLibraryDiagnostics");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v62) = -[CAMPersistenceController writePrivateMetadataFileToURL:withPrivateClientMetadata:sharedLibraryMode:contactIDsInProximity:sharedLibraryDiagnostics:](self, "writePrivateMetadataFileToURL:withPrivateClientMetadata:sharedLibraryMode:contactIDsInProximity:sharedLibraryDiagnostics:", v61, 0, v62, v63, v64);

  if ((v62 & 1) == 0)
  {

    v61 = 0;
  }
  v65 = [CAMVideoLocalPersistenceResult alloc];
  v66 = v93[5];
  v67 = objc_msgSend(v5, "dimensions");
  objc_msgSend(v5, "metadata");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinationInfo");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)buf = v100;
  *(_QWORD *)&buf[16] = v101;
  v83 = v98;
  v84 = v99;
  v70 = -[CAMVideoLocalPersistenceResult initWithURL:filteredLocalDestinationURL:linkedURL:filteredLinkedURL:videoThumbnailPath:UUID:duration:dimensions:stillPersistenceUUID:stillDisplayTime:metadataItems:creationDate:adjustmentsData:coordinationInfo:localPrivateMetadataFileURL:error:](v65, "initWithURL:filteredLocalDestinationURL:linkedURL:filteredLinkedURL:videoThumbnailPath:UUID:duration:dimensions:stillPersistenceUUID:stillDisplayTime:metadataItems:creationDate:adjustmentsData:coordinationInfo:localPrivateMetadataFileURL:error:", v82, v80, v43, v79, v66, v77, buf, v67, v76, &v83, v68, v75, v56, v69, v61,
          v74);

  _Block_object_dispose(&v92, 8);
  return v70;
}

uint64_t __67__CAMPersistenceController__persistVideoCaptureResult_withRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", 1);
}

uint64_t __67__CAMPersistenceController__persistVideoCaptureResult_withRequest___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOrientation:", *(int *)(a1 + 32));
}

void __67__CAMPersistenceController__persistVideoCaptureResult_withRequest___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  objc_msgSend(a2, "result:", &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = v4 == 0;
  else
    v6 = 0;
  if (!v6)
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create JPEG data for preview surface for %{public}@", buf, 0xCu);
    }

    v9 = a1 + 40;
LABEL_12:
    v14 = *(_QWORD *)(*(_QWORD *)v9 + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

    goto LABEL_13;
  }
  v9 = a1 + 40;
  CGImageWriteEXIFJPEGToPath();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  if ((v11 & 1) == 0)
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 40);
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Failed to write JPEG data for preview surface for %{public}@", buf, 0xCu);
    }

    goto LABEL_12;
  }
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)writePrivateMetadataFileToURL:(id)a3 withPrivateClientMetadata:(id)a4 sharedLibraryMode:(int64_t)a5 contactIDsInProximity:(id)a6 sharedLibraryDiagnostics:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  char v24;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "sharedLibraryEnabled");

  if (v12 || v16)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750C8]), "initWithPrivateClientMetadata:contactIDsInProximity:sharedLibraryMode:", v12, v13, a5);
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v14, "count"))
    {
      v19 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v29 = objc_msgSend(v14, "count");
        _os_log_impl(&dword_1DB760000, v19, OS_LOG_TYPE_DEFAULT, "Internal only: Persisting shared library diagnostics: %lu entries.", buf, 0xCu);
      }

      objc_msgSend(v18, "setSharedLibraryDiagnostics:", v14);
    }
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0D750D8], "serializedDataFromCameraClientMetadata:error:", v18, &v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v27;
    if (v21)
    {
      v22 = v21;
      v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CAMPersistenceController writePrivateMetadataFileToURL:withPrivateClientMetadata:sharedLibraryMode:contactIDsInProximity:sharedLibraryDiagnostics:].cold.1();
    }
    else
    {
      v26 = 0;
      v24 = objc_msgSend(v20, "writeToURL:options:error:", v11, 0, &v26);
      v22 = v26;
      if ((v24 & 1) != 0)
      {
        v17 = 1;
LABEL_17:

        goto LABEL_18;
      }
      v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v29 = (uint64_t)v12;
        v30 = 2114;
        v31 = v11;
        v32 = 2114;
        v33 = v22;
        _os_log_error_impl(&dword_1DB760000, v23, OS_LOG_TYPE_ERROR, "Failed to persist private metadata %{public}@ to URL %{public}@ (%{public}@)", buf, 0x20u);
      }
    }

    v17 = 0;
    goto LABEL_17;
  }
  v17 = 0;
LABEL_18:

  return v17;
}

- (id)_jobDictionaryForVideoLocalResult:(id)a3 fromRequest:(id)a4 loggingIdentifier:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  int v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const __CFAllocator *v57;
  CFDictionaryRef v58;
  CFDictionaryRef v59;
  _BOOL8 v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  CMTime v81;
  CMTime time;
  CMTime v83;

  v7 = a3;
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0C99E08];
  v10 = a5;
  v11 = objc_alloc_init(v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v8, "isTimelapse");
    v13 = (id *)MEMORY[0x1E0D74E18];
    if (!v12)
      v13 = (id *)MEMORY[0x1E0D74E20];
  }
  else
  {
    v12 = 0;
    v13 = (id *)MEMORY[0x1E0D74E20];
  }
  v77 = *v13;
  objc_msgSend(v11, "setObject:forKey:");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("captureLogID"));

  objc_msgSend(v7, "localDestinationURL");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = *MEMORY[0x1E0D74F40];
  objc_msgSend(v11, "setObject:forKey:", v14);
  objc_msgSend(v7, "filteredLocalDestinationURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v17, *MEMORY[0x1E0D74D80]);
    v18 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = v14;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750B0]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", CFSTR("com.apple.opaque"), CFSTR("1.0"), v21, 0, CFSTR("com.apple.camera"), 0);
    objc_msgSend(v22, "propertyListDictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D74F18]);

    v14 = v19;
  }
  v69 = v16;
  objc_msgSend(v14, "pathExtension");
  v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v24, *MEMORY[0x1E0D74D78]);
  objc_msgSend(v7, "localPersistenceUUID");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:");
  objc_msgSend(v7, "creationDate");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v11, "setObject:forKey:", v25, *MEMORY[0x1E0D74D40]);
  v78 = (void *)v25;
  v26 = objc_msgSend(MEMORY[0x1E0D73148], "savedAssetTypeForCameraCapturedAsset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v27, *MEMORY[0x1E0D74F00]);

  objc_msgSend(v11, "setObject:forKey:", &unk_1EA3B0B20, *MEMORY[0x1E0D74CB0]);
  if (v12)
    objc_msgSend(v11, "setObject:forKey:", &unk_1EA3B0B38, *MEMORY[0x1E0D74CA8]);
  v28 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D74ED0]);
  objc_msgSend(v11, "setObject:forKey:", v28, *MEMORY[0x1E0D74CA0]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D74EF8]);
  v29 = objc_msgSend(v8, "captureDevice");
  v30 = (v29 > 0xB) | (0xFDu >> v29) & 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x1E0D74D18];
  objc_msgSend(v11, "setObject:forKey:", v31, *MEMORY[0x1E0D74D18]);

  memset(&v83, 0, sizeof(v83));
  if (v7)
    objc_msgSend(v7, "duration");
  time = v83;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(&time));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v33, CFSTR("kCAMVideoDurationKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "captureOrientation"));
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v72;
  v73 = (void *)v34;
  objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v36, v32, v78, *MEMORY[0x1E0D74D40], v34, *MEMORY[0x1E0D74E50], v14, v67, 0);
  v37 = objc_claimAutoreleasedReturnValue();

  v71 = (void *)v37;
  objc_msgSend(v11, "setObject:forKey:", v37, *MEMORY[0x1E0D74D70]);
  +[CAMOrientationUtilities imageOrientationForVideoRequest:](CAMOrientationUtilities, "imageOrientationForVideoRequest:", v8);
  v38 = PLExifOrientationFromImageOrientation();
  v75 = (void *)v24;
  if (objc_msgSend(v8, "type"))
  {
    objc_msgSend(v7, "dimensions");
    CAMSizeForDimensions();
  }
  else
  {
    v41 = v8;
    v42 = v14;
    v43 = objc_msgSend(v7, "dimensions");
    v44 = objc_msgSend(v41, "aspectRatioCrop");

    v45 = v43;
    v14 = v42;
    +[CAMAspectCropUtilities finalExpectedSizeWithCaptureDimensions:orientation:aspectRatio:](CAMAspectCropUtilities, "finalExpectedSizeWithCaptureDimensions:orientation:aspectRatio:", v45, v38, v44);
  }
  v46 = v40;
  v47 = v69;
  if (v39 > 0.0 && v40 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v48, *MEMORY[0x1E0D74D98]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v49, *MEMORY[0x1E0D74D88]);

  }
  objc_msgSend(v7, "filteredVideoPreviewPath");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v50, *MEMORY[0x1E0D74E80]);

  v51 = objc_msgSend(v8, "captureMode");
  v52 = objc_msgSend(v8, "captureMode");
  if (!objc_msgSend(v8, "type") && (objc_msgSend(v8, "isCTMVideo") & 1) != 0)
    goto LABEL_32;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1F038AEF8))
  {
    v70 = v14;
    v53 = v8;
    objc_msgSend(v7, "localDestinationURL");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "isEV0LocalVideoDestinationURL:");
    objc_msgSend(v53, "irisStillImagePersistenceUUIDForEV0:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
      objc_msgSend(v11, "setObject:forKey:", v55, *MEMORY[0x1E0D74E88]);
    objc_msgSend(v53, "irisIdentifierForEV0:", v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
      objc_msgSend(v11, "setObject:forKey:", v56, *MEMORY[0x1E0D74EA8]);
    v57 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    time = v83;
    v58 = CMTimeCopyAsDictionary(&time, v57);
    objc_msgSend(v11, "setObject:forKey:", v58, *MEMORY[0x1E0D74EB8]);
    CFRelease(v58);
    memset(&time, 0, sizeof(time));
    if (v7)
      objc_msgSend(v7, "stillDisplayTime");
    v81 = time;
    v59 = CMTimeCopyAsDictionary(&v81, v57);
    objc_msgSend(v11, "setObject:forKey:", v59, *MEMORY[0x1E0D74EB0]);
    CFRelease(v59);
    v60 = objc_msgSend(v53, "irisMode") == 2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v61, *MEMORY[0x1E0D74E90]);

    objc_msgSend(v7, "metadataItems");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __92__CAMPersistenceController__jobDictionaryForVideoLocalResult_fromRequest_loggingIdentifier___block_invoke;
    v79[3] = &unk_1EA32C900;
    v80 = v11;
    objc_msgSend(v62, "enumerateObjectsUsingBlock:", v79);

    v14 = v70;
    goto LABEL_33;
  }
  if (v51 == 7 || v52 == 2)
  {
LABEL_32:
    objc_msgSend(v7, "adjustmentsData");
    v53 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v53, *MEMORY[0x1E0D74CF8]);
LABEL_33:

  }
  objc_msgSend(v7, "localPrivateMetadataFileURL");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "path");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v64, *MEMORY[0x1E0D74D20]);

  v65 = v11;
  return v65;
}

void __92__CAMPersistenceController__jobDictionaryForVideoLocalResult_fromRequest_loggingIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8A978]);

  if (v7)
  {
    objc_msgSend(v9, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D74EA0]);

    *a4 = 1;
  }

}

- (void)_notifyDelegateOfCompletedVideoRemotePersistenceForRequest:(id)a3 withReply:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  Float64 v12;
  void *v13;
  const __CFDictionary *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  CAMVideoPersistenceResponse *v26;
  uint64_t v27;
  CAMVideoPersistenceResponse *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  const __CFDictionary *v37;
  CMTime v38;
  CMTime v39;
  CMTime v40;
  CMTime v41;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("kCAMVideoDurationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  memset(&v41, 0, sizeof(v41));
  CMTimeMakeWithSeconds(&v41, v12, 600);
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74E88]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74EB0]);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  memset(&v40, 0, sizeof(v40));
  CMTimeMakeFromDictionary(&v40, v14);
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74D38]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v7, "sessionIdentifier");
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74F28]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v14;
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74D40]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D98]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D88]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  v26 = [CAMVideoPersistenceResponse alloc];
  v27 = objc_msgSend(v7, "captureMode");
  v39 = v41;
  v38 = v40;
  v28 = -[CAMVideoPersistenceResponse initWithUUID:captureMode:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:duration:stillPersistenceUUID:stillDisplayTime:coordinationInfo:](v26, "initWithUUID:captureMode:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:duration:stillPersistenceUUID:stillDisplayTime:coordinationInfo:", v15, v27, v16, v18, v19, 0, v22, v25, &v39, v13, &v38, 0);
  v29 = objc_msgSend(v7, "type");
  if (v29 == 1)
  {
    v36 = v13;
    v30 = v9;
    v34 = v7;
    objc_msgSend(v34, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v35 = v34;
      v9 = v30;
      objc_msgSend(v32, "videoRequestDidCompleteRemotePersistence:withResponse:error:", v35, v28, v30);
      goto LABEL_13;
    }
LABEL_12:
    v9 = v30;
    goto LABEL_13;
  }
  if (!v29)
  {
    v36 = v13;
    v30 = v9;
    v31 = v7;
    objc_msgSend(v31, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v33 = v31;
      v9 = v30;
      objc_msgSend(v32, "stillImageRequestDidCompleteVideoRemotePersistence:withResponse:error:", v33, v28, v30);
LABEL_13:
      v13 = v36;

      goto LABEL_14;
    }
    goto LABEL_12;
  }
LABEL_14:

}

- (void)_handleCompletedVideoJobForRequest:(id)a3 withReply:(id)a4 completionHandler:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    v14 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CAMPersistenceController _handleCompletedVideoJobForRequest:withReply:completionHandler:error:].cold.1();

  }
  v15 = v10;
  v20 = v11;
  v21 = v13;
  v22 = v12;
  v16 = v12;
  v17 = v13;
  v18 = v11;
  pl_dispatch_async();
  if (objc_msgSend(v15, "shouldProtectPersistenceForVideo"))
  {
    -[CAMPersistenceController _protectionController](self, "_protectionController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stopProtectingPersistenceForRequest:", v15);

  }
  CAMSignpostWithIDAndArgs(56, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);

}

uint64_t __97__CAMPersistenceController__handleCompletedVideoJobForRequest_withReply_completionHandler_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfCompletedVideoRemotePersistenceForRequest:withReply:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_remotelyPersistVideoJob:(id)a3 forRequest:(id)a4 loggingIdentifier:(id)a5 withSendHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  CFAbsoluteTime Current;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  CAMPersistenceController *v31;
  id v32;
  id v33;
  CFAbsoluteTime v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(_QWORD))a6;
  v16 = a7;
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E88]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0D73168], "sharedSystemLibraryAssetsdClient");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resourceClient");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __116__CAMPersistenceController__remotelyPersistVideoJob_forRequest_loggingIdentifier_withSendHandler_completionHandler___block_invoke;
  v28[3] = &unk_1EA32C7E0;
  v34 = Current;
  v29 = v14;
  v30 = v20;
  v31 = self;
  v32 = v13;
  v33 = v16;
  v24 = v16;
  v25 = v13;
  v26 = v20;
  v27 = v14;
  objc_msgSend(v23, "saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandler:", v12, 0, 0, v28);

  if (v15)
    v15[2](v15);

}

void __116__CAMPersistenceController__remotelyPersistVideoJob_forRequest_loggingIdentifier_withSendHandler_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  double Current;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  NSObject *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  if (a2)
  {
    v10 = Current;
    v11 = *(double *)(a1 + 72);
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D74F28]);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v18 = 138544130;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      v22 = 2114;
      v23 = v12;
      v24 = 2048;
      v25 = v10 - v11;
      _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ PersistenceController: added video to library as %{public}@ %{public}@ (took %.3f seconds)", (uint8_t *)&v18, 0x2Au);
    }

  }
  else
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      v18 = 138543874;
      v19 = v16;
      v20 = 2114;
      v21 = v17;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ PersistenceController: error adding video to library %{public}@: %{public}@", (uint8_t *)&v18, 0x20u);
    }
  }

  objc_msgSend(*(id *)(a1 + 48), "_handleCompletedVideoJobForRequest:withReply:completionHandler:error:", *(_QWORD *)(a1 + 56), v7, *(_QWORD *)(a1 + 64), v8);
}

- (void)performDeferredRemotePersistenceWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CAMPersistenceController _remotePersistenceQueue](self, "_remotePersistenceQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  pl_dispatch_async();

}

void __82__CAMPersistenceController_performDeferredRemotePersistenceWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CAMPendingRemotePersistenceWrapper *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CFAbsoluteTime Current;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *context;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD *v28;
  CFAbsoluteTime v29;
  _QWORD v30[4];

  context = (void *)MEMORY[0x1DF0B55E8]();
  v24 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_pendingRemotePersistenceWrappers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortUsingComparator:", &__block_literal_global_250);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v2, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v2, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "creationDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "job");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "loggingIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "completionHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);
      v11 = -[CAMPendingRemotePersistenceWrapper initWithRequest:creationDate:job:loggingIdentifier:completionHandler:]([CAMPendingRemotePersistenceWrapper alloc], "initWithRequest:creationDate:job:loggingIdentifier:completionHandler:", v6, v7, 0, v9, v10);

      objc_msgSend(v2, "replaceObjectAtIndex:withObject:", v4, v11);
      ++v4;
    }
    while (v4 < objc_msgSend(v2, "count"));
  }
  v12 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v2, "removeAllObjects");
  objc_msgSend(v3, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "count");
  v15 = *MEMORY[0x1E0D74D08];
  if (v14 == 1)
  {
    objc_msgSend(v13, "removeObjectForKey:", v15);
    objc_msgSend(v13, "removeObjectForKey:", *MEMORY[0x1E0D74D00]);
    objc_msgSend(v13, "removeObjectForKey:", *MEMORY[0x1E0D74D10]);
  }
  else
  {
    objc_msgSend(v13, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v13, "setObject:forKey:", &unk_1EA3B0B50, *MEMORY[0x1E0D74D00]);
      objc_msgSend(v13, "setObject:forKey:", &unk_1EA3B0AD8, *MEMORY[0x1E0D74D10]);
    }
  }
  Current = CFAbsoluteTimeGetCurrent();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  objc_msgSend(MEMORY[0x1E0D73168], "sharedSystemLibraryAssetsdClient");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resourceInternalClient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __82__CAMPersistenceController_performDeferredRemotePersistenceWithCompletionHandler___block_invoke_252;
  v25[3] = &unk_1EA32C968;
  v29 = Current;
  v20 = v12;
  v28 = v30;
  v21 = *(_QWORD *)(v24 + 32);
  v26 = v20;
  v27 = v21;
  objc_msgSend(v19, "batchSaveAssetsWithJobDictionaries:completionHandler:", v3, v25);

  objc_msgSend(v18, "waitUntilConnectionSendsAllMessages");
  v22 = *(_QWORD *)(v24 + 40);
  if (v22)
    (*(void (**)(uint64_t, _QWORD))(v22 + 16))(v22, 0);

  _Block_object_dispose(v30, 8);
  objc_autoreleasePoolPop(context);
}

uint64_t __82__CAMPersistenceController_performDeferredRemotePersistenceWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __82__CAMPersistenceController_performDeferredRemotePersistenceWithCompletionHandler___block_invoke_252(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  double Current;
  double v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id obj;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  double v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  v9 = *(double *)(a1 + 56);
  v10 = os_log_create("com.apple.camera", "Camera");
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  v39 = v7;
  if (v7)
  {
    if (!v11)
      goto LABEL_7;
    *(_DWORD *)buf = 138543362;
    v46 = *(double *)&v7;
    v12 = "PersistenceController: received error for batch job: %{public}@";
  }
  else
  {
    if (!v11)
      goto LABEL_7;
    *(_DWORD *)buf = 134217984;
    v46 = Current - v9;
    v12 = "PersistenceController: received reply for batch job after %.3f seconds.";
  }
  _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
LABEL_7:

  v35 = objc_msgSend(v6, "count");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v6;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v13)
  {
    v15 = v13;
    v40 = *(_QWORD *)v42;
    v34 = *MEMORY[0x1E0D74E88];
    v37 = *MEMORY[0x1E0D74D38];
    v33 = *MEMORY[0x1E0D74F28];
    v32 = *MEMORY[0x1E0D74D90];
    *(_QWORD *)&v14 = 138543874;
    v31 = v14;
    do
    {
      v16 = 0;
      v36 = v15;
      do
      {
        if (*(_QWORD *)v42 != v40)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v16);
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v31);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "request");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "type");
        objc_msgSend(v18, "completionHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 == 1)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", v34);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            v28 = v26;
          }
          else
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", v37);
            v28 = (id)objc_claimAutoreleasedReturnValue();
          }
          v22 = v28;

          objc_msgSend(v17, "objectForKeyedSubscript:", v33);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "loggingIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v31;
            v46 = *(double *)&v30;
            v47 = 2114;
            v48 = v22;
            v49 = 2114;
            v50 = v23;
            _os_log_impl(&dword_1DB760000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ PersistenceController: added video to library as %{public}@ %{public}@", buf, 0x20u);

            v15 = v36;
          }

          objc_msgSend(*(id *)(a1 + 40), "_handleCompletedVideoJobForRequest:withReply:completionHandler:error:", v19, v17, v21, v39);
        }
        else
        {
          if (v20)
            goto LABEL_24;
          objc_msgSend(v17, "objectForKeyedSubscript:", v37);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v32);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "loggingIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v31;
            v46 = *(double *)&v25;
            v47 = 2114;
            v48 = v22;
            v49 = 2114;
            v50 = v23;
            _os_log_impl(&dword_1DB760000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ PersistenceController: added photo to library as %{public}@ %{public}@", buf, 0x20u);

            v15 = v36;
          }

          objc_msgSend(*(id *)(a1 + 40), "_handleCompletedStillImageJobForRequest:withReply:fromBatchOfSize:completionHandler:error:", v19, v17, v35, v21, v39);
        }

LABEL_24:
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

        ++v16;
      }
      while (v15 != v16);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v15);
  }

}

- (id)_ensureCoordinationGroupForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  -[CAMPersistenceController _coordinationQueue](self, "_coordinationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CAMPersistenceController__ensureCoordinationGroupForIdentifier___block_invoke;
  block[3] = &unk_1EA32C990;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __66__CAMPersistenceController__ensureCoordinationGroupForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  dispatch_group_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_coordinationQueueGroupsByIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v5 = dispatch_group_create();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(v8, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
  }

}

- (id)_coordinationGroupForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  -[CAMPersistenceController _coordinationQueue](self, "_coordinationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CAMPersistenceController__coordinationGroupForIdentifier___block_invoke;
  block[3] = &unk_1EA32C990;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __60__CAMPersistenceController__coordinationGroupForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_coordinationQueueGroupsByIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_removeCoordinationGroupForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAMPersistenceController _coordinationQueue](self, "_coordinationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CAMPersistenceController__removeCoordinationGroupForIdentifier___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

void __66__CAMPersistenceController__removeCoordinationGroupForIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_coordinationQueueGroupsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)persistBurstWithIdentifier:(id)a3 result:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CAMPersistenceController _powerController](self, "_powerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAssertionForIndentifier:withReason:", objc_msgSend(v11, "generateAssertionIdentifier"), 0x200000);
  -[CAMPersistenceController _remotePersistenceQueue](self, "_remotePersistenceQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v8;
  v18 = v9;
  v19 = v11;
  v20 = v10;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  pl_dispatch_async();

}

void __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  int v18;
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "allAssetIdentifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    if (v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0D74DC8], *MEMORY[0x1E0D74DB8]);
      objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D74EF8]);
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
      {
        objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x1E0D74D60]);
      }
      else
      {
        v6 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_cold_3();

      }
      objc_msgSend(*(id *)(a1 + 40), "allAssetIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "setObject:forKey:", v7, *MEMORY[0x1E0D74CD0]);
      }
      else
      {
        v8 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_cold_2();

      }
      objc_msgSend(*(id *)(a1 + 40), "goodAssetIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v4, "setObject:forKey:", v9, *MEMORY[0x1E0D74CD8]);
      }
      else
      {
        v10 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_cold_1();

      }
      objc_msgSend(*(id *)(a1 + 40), "bestAssetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v4, "setObject:forKey:", v11, *MEMORY[0x1E0D74CE0]);
      }
      else
      {
        v12 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Missing best asset identifier while preparing burst analysis results for assetsd! The stack asset won't be ideal.", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0D73168], "sharedSystemLibraryAssetsdClient");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resourceClient");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_254;
      v15[3] = &unk_1EA32C9B8;
      v17 = *(id *)(a1 + 56);
      v16 = *(id *)(a1 + 48);
      v18 = *(_DWORD *)(a1 + 64);
      objc_msgSend(v14, "saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandler:", v4, 0, 0, v15);

    }
  }
}

void __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_254(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;

  v7 = a3;
  v8 = a4;
  if ((a2 & 1) == 0)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_254_cold_1();

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
  objc_msgSend(*(id *)(a1 + 32), "removeAssertionForIdentifier:withReason:", *(unsigned int *)(a1 + 48), 0x200000);

}

- (void)persistPlaceholderTimelapseVideoWithResult:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "assetUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CAMPersistenceController _powerController](self, "_powerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAssertionForIndentifier:withReason:", objc_msgSend(v9, "generateAssertionIdentifier"), 0x400000);
    -[CAMPersistenceController _remotePersistenceQueue](self, "_remotePersistenceQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    v13 = v7;
    v11 = v9;
    pl_dispatch_async();

  }
}

void __89__CAMPersistenceController_persistPlaceholderTimelapseVideoWithResult_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  int v9;

  objc_msgSend(*(id *)(a1 + 32), "_jobDictionaryForTimelapsePlaceholderResult:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 40), "previewImageSurface");
  objc_msgSend(MEMORY[0x1E0D73168], "sharedSystemLibraryAssetsdClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__CAMPersistenceController_persistPlaceholderTimelapseVideoWithResult_completionHandler___block_invoke_2;
  v6[3] = &unk_1EA32C9B8;
  v8 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  v9 = *(_DWORD *)(a1 + 64);
  objc_msgSend(v5, "saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandler:", v2, 0, v3, v6);

}

void __89__CAMPersistenceController_persistPlaceholderTimelapseVideoWithResult_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;

  v7 = a3;
  v8 = a4;
  if ((a2 & 1) == 0)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __89__CAMPersistenceController_persistPlaceholderTimelapseVideoWithResult_completionHandler___block_invoke_2_cold_1();

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
  objc_msgSend(*(id *)(a1 + 32), "removeAssertionForIdentifier:withReason:", *(unsigned int *)(a1 + 48), 0x400000);

}

- (id)_jobDictionaryForTimelapsePlaceholderResult:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0D74E28], *MEMORY[0x1E0D74DB8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(MEMORY[0x1E0D73148], "savedAssetTypeForCameraCapturedAsset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x1E0D74F00]);

  objc_msgSend(v4, "setObject:forKey:", &unk_1EA3B0B20, *MEMORY[0x1E0D74CB0]);
  objc_msgSend(v4, "setObject:forKey:", &unk_1EA3B0B38, *MEMORY[0x1E0D74CA8]);
  objc_msgSend(v3, "assetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, *MEMORY[0x1E0D74D38]);

  objc_msgSend(v3, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, *MEMORY[0x1E0D74D40]);

  v8 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D74ED0]);
  objc_msgSend(v4, "setObject:forKey:", v8, *MEMORY[0x1E0D74CA0]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D74EF8]);
  objc_msgSend(v3, "videoDimensions");
  v11 = (unint64_t)v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)v9);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D74EE0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D74ED8]);

  v14 = objc_msgSend(v3, "captureDevice");
  LODWORD(v12) = (v14 > 0xB) | (0xFDu >> v14);
  v15 = objc_msgSend(v3, "captureOrientation");
  v22[0] = *MEMORY[0x1E0D74D18];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12 & 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v22[1] = *MEMORY[0x1E0D74E50];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v18, *MEMORY[0x1E0D74D70]);
  objc_msgSend(v3, "localPrivateMetadataFileURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D74D20]);

  return v4;
}

+ (id)uniqueIncomingPathForAssetWithUUID:(id)a3 captureTime:(double)a4 extension:(id)a5
{
  return (id)objc_msgSend(a1, "uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:", a3, a5, 1, a4);
}

- (void)emptyLocalPersistenceStorageWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  v6 = a4;
  -[CAMPersistenceController _localPersistenceQueue](self, "_localPersistenceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__CAMPersistenceController_emptyLocalPersistenceStorageWithTimeout_completionHandler___block_invoke;
  v9[3] = &unk_1EA328F58;
  v11 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

void __86__CAMPersistenceController_emptyLocalPersistenceStorageWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  double Current;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, void *, void *);
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__11;
  v36 = __Block_byref_object_dispose__11;
  v37 = 0;
  NSTemporaryDirectory();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "fileExistsAtPath:", v21))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
    v3 = objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __86__CAMPersistenceController_emptyLocalPersistenceStorageWithTimeout_completionHandler___block_invoke_2;
    v30 = &unk_1EA32CA28;
    v31 = &v32;
    v20 = (void *)v3;
    objc_msgSend(v2, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v42, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (CFAbsoluteTimeGetCurrent() - Current > *(double *)(a1 + 40))
          {
            v18 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DB760000, v18, OS_LOG_TYPE_DEFAULT, "Timed out deleting local persistence items", buf, 2u);
            }

            goto LABEL_19;
          }
          v11 = (id *)(v33 + 5);
          obj = (id)v33[5];
          v12 = objc_msgSend(v2, "removeItemAtURL:error:", v10, &obj);
          objc_storeStrong(v11, obj);
          v13 = os_log_create("com.apple.camera", "Camera");
          v14 = v13;
          if (v12)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "path");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v39 = v15;
              _os_log_impl(&dword_1DB760000, v14, OS_LOG_TYPE_DEFAULT, "Deleted local persistence item at %{public}@", buf, 0xCu);

            }
          }
          else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "path");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v33[5];
            *(_DWORD *)buf = 138543618;
            v39 = v16;
            v40 = 2114;
            v41 = v17;
            _os_log_error_impl(&dword_1DB760000, v14, OS_LOG_TYPE_ERROR, "Failed to delete local persistence item at %{public}@: %{public}@", buf, 0x16u);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v42, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_19:

  }
  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, v33[5]);

  _Block_object_dispose(&v32, 8);
}

uint64_t __86__CAMPersistenceController_emptyLocalPersistenceStorageWithTimeout_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __86__CAMPersistenceController_emptyLocalPersistenceStorageWithTimeout_completionHandler___block_invoke_2_cold_1();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  return 1;
}

- (CAMLocationController)_locationController
{
  return self->__locationController;
}

- (NSMapTable)_coordinationQueueGroupsByIdentifier
{
  return self->__coordinationQueueGroupsByIdentifier;
}

- (NSMutableDictionary)_coordinationQueue_stillImagePersistenceCoordinators
{
  return self->__coordinationQueue_stillImagePersistenceCoordinators;
}

- (NSMutableDictionary)_coordinationQueue_videoPersistenceCoordinators
{
  return self->__coordinationQueue_videoPersistenceCoordinators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__coordinationQueue_videoPersistenceCoordinators, 0);
  objc_storeStrong((id *)&self->__coordinationQueue_stillImagePersistenceCoordinators, 0);
  objc_storeStrong((id *)&self->__coordinationQueueGroupsByIdentifier, 0);
  objc_storeStrong((id *)&self->__coordinationQueue, 0);
  objc_storeStrong((id *)&self->__resultDelegateIsolationQueue, 0);
  objc_storeStrong((id *)&self->__irisVideoController, 0);
  objc_storeStrong((id *)&self->__burstController, 0);
  objc_storeStrong((id *)&self->__powerController, 0);
  objc_storeStrong((id *)&self->__protectionController, 0);
  objc_storeStrong((id *)&self->__locationController, 0);
  objc_storeStrong((id *)&self->__remotePersistenceThumbnailGenerator, 0);
  objc_storeStrong((id *)&self->__localPersistenceThumbnailGenerator, 0);
  objc_storeStrong((id *)&self->__remotePersistenceQueue, 0);
  objc_storeStrong((id *)&self->__localPersistenceQueue, 0);
  objc_destroyWeak((id *)&self->_resultDelegate);
  objc_storeStrong((id *)&self->_pendingRemotePersistenceWrappers, 0);
  objc_storeStrong((id *)&self->_pendingLocalPersistenceWrappers, 0);
}

- (void)_handleStillImagePersistenceForRequest:withResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Persistence cannot continue due to a capture error. (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to serialize filters %{public}@: %{public}@");
  OUTLINED_FUNCTION_1_0();
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to persist adjustmentsDictionary %{public}@ to URL %{public}@");
  OUTLINED_FUNCTION_1_0();
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to persist timelapse vis metadata to URL %{public}@ (%{public}@)");
  OUTLINED_FUNCTION_1_0();
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to persist diagnostics to URL %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to remove file from persistence failure: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Local persistence was attempted with invalid or missing JPEG data. We just lost someone's memories. (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Invalid localDestinationURL during local persistence %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to create directory hierarchy for localDestinationPath %{public}@ (%{public}@)");
  OUTLINED_FUNCTION_1_0();
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Cannot physically rotate non-JPEG fullsize image because destination path is already specified by client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, v0, v1, "Failed to physically rotate JPEG or HEIF data (status=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, v0, v1, "Failed to close container for rotated image as JPEG (status=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Failed to get dictionary representation for rotated matte data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, v0, v1, "Failed to add matte to container for rotated image as JPEG (status=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, v0, v1, "Failed to add depth to container for rotated image as JPEG (status=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, v0, v1, "Failed to encode the rotated image as JPEG (status=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, v0, v1, "Failed to create container for rotated pixel buffer (status=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, v0, v1, "Failed to create compression session for rotated pixel buffer (status=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_adjustmentsDataForRequest:(double)a3 captureDimensions:(double)a4 portraitMetadata:(double)a5 .cold.1(unint64_t a1, NSObject *a2, double a3, double a4, double a5, double a6)
{
  __CFString *v7;
  void *v8;
  int v9;
  __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1 > 3)
    v7 = 0;
  else
    v7 = off_1EA32CA48[a1 - 1];
  NSStringFromCGRect(*(CGRect *)&a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v7;
  v11 = 2114;
  v12 = v8;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Could not calculate a crop rect for aspect: %{public}@; photo bounds: %{public}@",
    (uint8_t *)&v9,
    0x16u);

}

- (void)writePrivateMetadataFileToURL:withPrivateClientMetadata:sharedLibraryMode:contactIDsInProximity:sharedLibraryDiagnostics:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Unable to encode private metadata object %{public}@ for persistence with error %{public}@");
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleCompletedVideoJobForRequest:withReply:completionHandler:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to remotely persist video! (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Error preparing burst analysis results for assetsd: missing good asset identifiers!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Error preparing burst analysis results for assetsd: missing all asset identifiers!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Error preparing burst analysis results for assetsd: missing burst identifier!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_254_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Sending burst analysis results to assetsd failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __89__CAMPersistenceController_persistPlaceholderTimelapseVideoWithResult_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Sending placeholder timelapse asset to assetsd failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to recreate missing NSTemporaryDirectory at %{public}@ (%{public}@)");
  OUTLINED_FUNCTION_1_0();
}

void __86__CAMPersistenceController_emptyLocalPersistenceStorageWithTimeout_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Could not iterate over local persistence item %{public}@: %{public}@");
  OUTLINED_FUNCTION_1_0();
}

@end
