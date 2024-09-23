@implementation VNObjectTrackerLegacyFaceCore

- (BOOL)isResettable
{
  return 0;
}

- (VNObjectTrackerLegacyFaceCore)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  VNObjectTrackerLegacyFaceCore *v7;
  void *v8;
  void *v9;
  void *v10;
  VNObjectTrackerLegacyFaceCore *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *detectOptions;
  uint64_t v16;
  NSDictionary *extractOptions;
  uint64_t v18;
  FaceCoreDetector *detector;
  void *v20;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VNObjectTrackerLegacyFaceCore;
  v7 = -[VNTracker initWithOptions:error:](&v22, sel_initWithOptions_error_, v6, a4);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNTracker level](v7, "level");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("VNTrackingOption_TrackingLevelFast")))
    {
      FCRKeypointTrackingParameters();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addEntriesFromDictionary:", v10);
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("VNTrackingOption_TrackingLevelAccurate")))
      {
        if (a4)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error: Unsupported/unimplemented tracking level by FaceCore"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
LABEL_14:
        v11 = 0;
        goto LABEL_15;
      }
      FCRStandardTrackingParameters();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addEntriesFromDictionary:", v10);
    }

    v12 = (void *)objc_opt_class();
    objc_msgSend(v12, "_convertOptionsToFaceCoreSetupOptions:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v13);

    objc_msgSend(v12, "_convertOptionsToFaceCoreDetectOptions:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    detectOptions = v7->_detectOptions;
    v7->_detectOptions = (NSDictionary *)v14;

    objc_msgSend(v12, "_convertOptionsToFaceCoreExtractOptions:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
    extractOptions = v7->_extractOptions;
    v7->_extractOptions = (NSDictionary *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEE4F0]), "initWithOptions:", v8);
    detector = v7->_detector;
    v7->_detector = (FaceCoreDetector *)v18;

    if (v7->_detector)
    {
      v11 = v7;
LABEL_15:

      goto LABEL_16;
    }
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error: Failed to initialize FaceCore detector"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v11 = 0;
      *a4 = v20;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (id)setTrackedObjects:(id)a3 inFrame:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  if (-[VNTracker isTracking](self, "isTracking"))
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error: Tracker is busy with previous tracking requests. It needs to be reset to restart tracking sequence"));
      v8 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    -[VNObjectTrackerLegacyFaceCore _detectFacesInImage:error:](self, "_detectFacesInImage:error:", v7, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v8, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "boundingBox");
        -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:");

        -[VNTracker setTrackedFrameNumber:](self, "setTrackedFrameNumber:", 0);
      }
      v11 = v8;
    }

  }
  return v8;
}

- (id)trackInFrame:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  if (-[VNTracker isTracking](self, "isTracking"))
  {
    -[VNObjectTrackerLegacyFaceCore _detectFacesInImage:error:](self, "_detectFacesInImage:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[VNTracker setTrackedFrameNumber:](self, "setTrackedFrameNumber:", -[VNTracker trackedFrameNumber](self, "trackedFrameNumber") + 1);
      v8 = v7;
    }

  }
  else if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error: Tracker is not initialized"));
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)reset:(id *)a3
{
  -[VNTracker setTrackedFrameNumber:](self, "setTrackedFrameNumber:", -1);
  -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  return 1;
}

- (id)_detectFacesInImage:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __CVBuffer *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __CVBuffer *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD aBlock[5];
  id v25;
  __CVBuffer **v26;
  uint64_t v27;
  uint64_t v28;
  __CVBuffer *v29;
  __CVBuffer **v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "width");
  v8 = objc_msgSend(v6, "height");
  v9 = objc_msgSend(v6, "originalCGImage");
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEE4F8]), "initWithCGImage:", v9);
  }
  else
  {
    v29 = (__CVBuffer *)objc_msgSend(v6, "bufferWithWidth:height:format:options:error:", v7, v8, 1111970369, 0, a4);
    if (v29)
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEE4F8]), "initWithCVPixelBuffer:", v29);
    else
      v10 = 0;
    apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v29);
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1904;
  v33 = __Block_byref_object_dispose__1905;
  v34 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VNObjectTrackerLegacyFaceCore__detectFacesInImage_error___block_invoke;
  aBlock[3] = &unk_1E4543628;
  aBlock[4] = self;
  v11 = v10;
  v27 = v7;
  v28 = v8;
  v25 = v11;
  v26 = &v29;
  v12 = _Block_copy(aBlock);
  if ((VNExecuteBlock(v12, (uint64_t)a4) & 1) != 0)
  {
    -[VNTracker key](self, "key");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = v30[5];
    v15 = -[__CVBuffer countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "setUUID:", v13, (_QWORD)v20);
        }
        v15 = -[__CVBuffer countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
      }
      while (v15);
    }

    v18 = v30[5];
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v29, 8);
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractOptions, 0);
  objc_storeStrong((id *)&self->_detectOptions, 0);
  objc_storeStrong((id *)&self->_detector, 0);
}

uint64_t __59__VNObjectTrackerLegacyFaceCore__detectFacesInImage_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  VNFaceLegacyFaceCore *v12;
  VNFaceLegacyFaceCore *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 96), "detectFacesInImage:options:error:", a1[5], *(_QWORD *)(a1[4] + 104), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 0;
  if (objc_msgSend(*(id *)(a1[4] + 112), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 96), "extractDetailsForFaces:inImage:options:error:", v4, a1[5], *(_QWORD *)(a1[4] + 112), a2);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
    if (!v5)
      return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v10);
        v12 = [VNFaceLegacyFaceCore alloc];
        v13 = -[VNFaceLegacyFaceCore initWithFace:](v12, "initWithFace:", v11, (_QWORD)v31);
        -[VNFaceLegacyFaceCore faceBoundingBox](v13, "faceBoundingBox");
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v21 = a1[7];
        v22 = 0.0;
        v23 = 0.0;
        v24 = 0.0;
        if (v21)
        {
          v23 = v16 / (double)v21;
          v24 = v20 / (double)v21;
        }
        v25 = a1[8];
        v26 = 0.0;
        if (v25)
        {
          v22 = v18 / (double)v25;
          v26 = v14 / (double)v25;
        }
        +[VNFaceObservation faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:](VNFaceObservation, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:", 3737841665, 0, 0, 0, v23, v22, v24, v26, v18);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setLegacyFaceCore:", v13);
        objc_msgSend(v6, "addObject:", v27);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

  v28 = *(_QWORD *)(a1[6] + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v6;

  return 1;
}

+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4
{
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)trackerObservationClass
{
  return (Class)objc_opt_class();
}

+ (id)_convertOptionsToFaceCoreSetupOptions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  int v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    v7 = *MEMORY[0x1E0CEE4E0];
    v8 = *MEMORY[0x1E0CEE4D8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_MinFaceSize"));
        v13 = v8;
        if ((v12 & 1) != 0
          || (v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_NumberOfDetectionAngles"), v8), v13 = v7, v14))
        {
          objc_msgSend(v4, "setValue:forKey:", v11, v13);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  return v4;
}

+ (id)_convertOptionsToFaceCoreDetectOptions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  int v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    v7 = *MEMORY[0x1E0CEE450];
    v8 = *MEMORY[0x1E0CEE440];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("VNTrackObjectPrivateRevisionLegacyCoreProcessOption_EnhanceEyesAndMouthLocalization"));
        v13 = v8;
        if ((v12 & 1) != 0
          || (v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_KalmanFilter"), v8), v13 = v7, v14))
        {
          objc_msgSend(v4, "setValue:forKey:", v11, v13);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  return v4;
}

+ (id)_convertOptionsToFaceCoreExtractOptions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  char v14;
  char v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    v18 = *MEMORY[0x1E0CEE470];
    v19 = *MEMORY[0x1E0CEE468];
    v7 = *MEMORY[0x1E0CEE460];
    v8 = *MEMORY[0x1E0CEE458];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("VNTrackObjectPrivateRevisionLegacyCoreProcessOption_EnhanceEyesAndMouthLocalization"));
        v13 = v8;
        if ((v12 & 1) != 0
          || (v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_ExtractBlink"), v8), v13 = v7, (v14 & 1) != 0)|| (v15 = objc_msgSend(v10, "isEqualToString:", CFSTR("VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_ExtractSmile"), v7), v13 = v19, (v15 & 1) != 0)|| (v16 = objc_msgSend(v10, "isEqualToString:", CFSTR("VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_KalmanFilter"), v19), v13 = v18,
              v16))
        {
          objc_msgSend(v4, "setValue:forKey:", v11, v13);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  return v4;
}

@end
