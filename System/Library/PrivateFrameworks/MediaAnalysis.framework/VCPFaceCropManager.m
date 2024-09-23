@implementation VCPFaceCropManager

- (VCPFaceCropManager)initWithPhotoLibrary:(id)a3 andContext:(id)a4
{
  id v7;
  id v8;
  VCPFaceCropManager *v9;
  VCPFaceCropManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VCPFaceCropManager;
  v9 = -[VCPFaceCropManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (BOOL)_persistGeneratedFaceCrops:(id)a3 forAsset:(id)a4 error:(id *)a5
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  VCPFaceCropManager *v38;
  id v39;
  id v41;
  void *v42;
  id obj;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  _QWORD aBlock[4];
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  _BYTE v63[128];
  _QWORD v64[4];

  v64[2] = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v41 = a4;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = self;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setIncludeNonvisibleFaces:", 1);
  v7 = *MEMORY[0x1E0CD1B80];
  v64[0] = *MEMORY[0x1E0CD1B68];
  v64[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFetchPropertySets:", v8);

  if (_os_feature_enabled_impl())
    objc_msgSend(v44, "setIncludedDetectionTypes:", &unk_1E6B76530);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v39;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (!v9)
  {

    v48 = 0;
LABEL_25:
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__VCPFaceCropManager__persistGeneratedFaceCrops_forAsset_error___block_invoke;
    aBlock[3] = &unk_1E6B16D58;
    v50 = v42;
    v51 = v41;
    v31 = _Block_copy(aBlock);
    v32 = -[PHPhotoLibrary performChangesAndWait:error:](v38->_photoLibrary, "performChangesAndWait:error:", v31, a5);

    goto LABEL_30;
  }
  v47 = *(_QWORD *)v53;
  v48 = 0;
  v45 = *MEMORY[0x1E0CB2F90];
  v10 = 1;
  v46 = *MEMORY[0x1E0CB2D50];
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v53 != v47)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v11);
      objc_msgSend(v12, "originatingFace");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v61 = v46;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot generate facecrop without originating face"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", v45, -18, v35);
        v36 = objc_claimAutoreleasedReturnValue();

        v48 = (id)v36;
        goto LABEL_27;
      }
      v14 = (void *)MEMORY[0x1BCCA1B2C]();
      objc_msgSend(v13, "localIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (!v15)
        goto LABEL_15;
      v17 = (void *)MEMORY[0x1E0CD1520];
      v60 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fetchFacesWithLocalIdentifiers:options:", v18, v44);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "count") != 1)
      {

LABEL_15:
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v58 = v46;
        v28 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v13, "localIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("Failed to find originating PHFace %@"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", v45, -18, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        v20 = 0;
LABEL_16:

        v29 = 0;
        v10 = 0;
        v48 = (id)v26;
        goto LABEL_17;
      }
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_15;
      if (objc_msgSend(v20, "manual"))
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v56 = v46;
        v22 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "localIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("Failed to generate facecrop on manual originating face %@"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", v45, -18, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      objc_msgSend(v42, "setObject:forKey:", v12, v20);
      v29 = 1;
LABEL_17:

      objc_autoreleasePoolPop(v14);
      if (!v29)
        goto LABEL_22;
      ++v11;
    }
    while (v9 != v11);
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    v9 = v30;
  }
  while (v30);
LABEL_22:

  if ((v10 & 1) != 0)
    goto LABEL_25;
LABEL_27:
  if (a5)
  {
    v48 = objc_retainAutorelease(v48);
    v32 = 0;
    *a5 = v48;
  }
  else
  {
    v32 = 0;
  }
LABEL_30:

  return v32;
}

void __64__VCPFaceCropManager__persistGeneratedFaceCrops_forAsset_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v2)
  {
    v4 = *(_QWORD *)v16;
    *(_QWORD *)&v3 = 138412546;
    v13 = v3;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6, v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0CD1550];
        objc_msgSend(v7, "faceCropData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v8, "creationRequestsForFaceCropsWithOriginatingFace:resourceData:", v6, v9);

        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "localIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v13;
          v20 = v11;
          v21 = 2112;
          v22 = v12;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCropManager][%@] Publish facecrop for face %@", buf, 0x16u);

        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v2);
  }

}

- (id)_faceAssociatedWithFaceCrop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeNonvisibleFaces:", 1);
  if (_os_feature_enabled_impl())
    objc_msgSend(v5, "setIncludedDetectionTypes:", &unk_1E6B76548);
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesForFaceCrop:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_bestFaceForFacePrintRequest:(id)a3 withRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 == 1)
  {
    objc_msgSend(v8, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v8, "results", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v26;
      v16 = 1.17549435e-38;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v18, "boundingBox");
          v35.origin.x = x;
          v35.origin.y = y;
          v35.size.width = width;
          v35.size.height = height;
          v32 = CGRectUnion(v31, v35);
          v19 = v32.size.width;
          v20 = v32.size.height;
          objc_msgSend(v18, "boundingBox", v32.origin.x, v32.origin.y);
          v36.origin.x = x;
          v36.origin.y = y;
          v36.size.width = width;
          v36.size.height = height;
          v34 = CGRectIntersection(v33, v36);
          v21 = v19 * v20;
          if (v19 * v20 > 0.0)
          {
            v22 = v34.size.width * v34.size.height / v21;
            if (v22 > v16)
            {
              v23 = v18;

              v12 = v23;
              v16 = v22;
            }
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16, v21);
      }
      while (v14);
    }

  }
  return v12;
}

+ (BOOL)_allowANE
{
  return 1;
}

- (id)_vcpHumanFaceWithFaceCrop:(id)a3 imageRequestHandler:(id)a4 faceDetectionRequest:(id)a5 normalizedFaceCropBoundingBox:(CGRect)a6 faceCropImageDimension:(CGSize)a7 faceprintRequest:(id)a8 error:(id *)a9
{
  double height;
  double width;
  double v13;
  double v14;
  double y;
  double x;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  _QWORD v39[2];
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  height = a7.height;
  width = a7.width;
  v13 = a6.size.height;
  v14 = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v46 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a8;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v37, "localIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v23;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCropManager][%@] Create human face for face crop", buf, 0xCu);

  }
  -[VCPFaceCropManager _bestFaceForFacePrintRequest:withRect:](self, "_bestFaceForFacePrintRequest:withRect:", v22, x, y, v14, v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    goto LABEL_10;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v37, "localIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v25;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCropManager][%@] No human face detected; force faceprinting",
      buf,
      0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CEDEE0], "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", objc_msgSend(v21, "revision"), x, y, v14, v13, x, y, v14, v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setInputFaceObservations:", v26);

  objc_msgSend(v22, "setForceFaceprintCreation:", 1);
  v42 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v28 = objc_msgSend(v20, "performRequests:error:", v27, &v38);
  v29 = v38;

  if ((v28 & 1) != 0)
  {
    objc_msgSend(v22, "results");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v31;
LABEL_10:
    v39[0] = v21;
    v39[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v36) = 1;
    +[VCPPhotosFace faceFromFaceObservation:humanObservation:sourceWidth:sourceHeight:visionRequests:processingVersion:force:andError:](VCPPhotosFace, "faceFromFaceObservation:humanObservation:sourceWidth:sourceHeight:visionRequests:processingVersion:force:andError:", v24, 0, (unint64_t)width, (unint64_t)height, v29, -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion"), v36, a9);
    a9 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (a9)
  {
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create faceprint - %@"), v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v35);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

    a9 = 0;
  }
LABEL_11:

  return a9;
}

- (id)_bestObservationInAnimalObservations:(id)a3 withRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v8;
    v9 = 0;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v23;
      v13 = 1.17549435e-38;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v15, "boundingBox", (_QWORD)v22);
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          v29 = CGRectUnion(v28, v32);
          v16 = v29.size.width;
          v17 = v29.size.height;
          objc_msgSend(v15, "boundingBox", v29.origin.x, v29.origin.y);
          v33.origin.x = x;
          v33.origin.y = y;
          v33.size.width = width;
          v33.size.height = height;
          v31 = CGRectIntersection(v30, v33);
          v18 = v16 * v17;
          if (v16 * v17 > 0.0)
          {
            v19 = v31.size.width * v31.size.height / v18;
            if (v19 > v13)
            {
              v20 = v15;

              v9 = v20;
              v13 = v19;
            }
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v18);
      }
      while (v11);
    }

  }
  return v9;
}

- (id)_vcpAnimalFaceWithFaceCrop:(id)a3 animalFaceObservations:(id)a4 animalBodyObservations:(id)a5 animalprintRequest:(id)a6 normalizedFaceCropBoundingBox:(CGRect)a7 faceCropImageDimension:(CGSize)a8 error:(id *)a9
{
  double height;
  double width;
  double v11;
  double v12;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id *v34;
  void *v35;
  void *v37;
  uint64_t v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  height = a8.height;
  width = a8.width;
  v11 = a7.size.height;
  v12 = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v42 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v19, "localIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v23;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCropManager][%@] Create animal face for face crop", buf, 0xCu);

  }
  -[VCPFaceCropManager _bestObservationInAnimalObservations:withRect:](self, "_bestObservationInAnimalObservations:withRect:", v20, x, y, v12, v11);
  v24 = objc_claimAutoreleasedReturnValue();
  -[VCPFaceCropManager _bestObservationInAnimalObservations:withRect:](self, "_bestObservationInAnimalObservations:withRect:", v21, x, y, v12, v11);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v24 | v25)
  {
    if (v25)
    {
      objc_msgSend((id)v25, "labels");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v29 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend((id)v24, "labels");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CEE238]) & 1) != 0)
      {
        v34 = (id *)MEMORY[0x1E0CEE248];
      }
      else
      {
        if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CEE230]) & 1) == 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v19, "localIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v41 = v37;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FaceCropManager][%@] faceLabel is not dog or cat. Ignoring", buf, 0xCu);

          }
          v31 = 0;
          goto LABEL_17;
        }
        v34 = (id *)MEMORY[0x1E0CEE240];
      }
      v29 = *v34;
    }

    v39 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion");
    +[VCPPhotosFace faceFromAnimalHeadObservation:animalBodyObservation:animalLabel:sourceWidth:sourceHeight:visionRequests:processingVersion:](VCPPhotosFace, "faceFromAnimalHeadObservation:animalBodyObservation:animalLabel:sourceWidth:sourceHeight:visionRequests:processingVersion:", v24, v26, v29, (unint64_t)width, (unint64_t)height, v35, v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v29;
LABEL_17:

    goto LABEL_18;
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v19, "localIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v30;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCropManager][%@] Either animal face or animal body detected in face crop", buf, 0xCu);

  }
  v31 = 0;
LABEL_18:

  return v31;
}

- (id)_faceFromFaceCrop:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  double x;
  double y;
  double width;
  double height;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double *v27;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  id v41;
  int v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  int v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  id v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  void *v72;
  void *v73;
  char v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  char v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  char v85;
  int v86;
  id v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _BOOL4 v99;
  void *v100;
  void *v101;
  BOOL v102;
  void *v103;
  void *v104;
  BOOL v105;
  void *v106;
  void *v107;
  BOOL v108;
  void *v109;
  char v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  _BOOL4 v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  id v127;
  id v128;
  void *v129;
  id v130;
  id v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  uint64_t v147;
  void *v148;
  _QWORD v149[2];
  uint64_t v150;
  void *v151;
  id v152;
  void *v153;
  uint64_t v154;
  void *v155;
  id v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  void *v160;
  id v161;
  uint8_t buf[4];
  id v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  id v169;
  uint64_t v170;
  id v171;
  _QWORD v172[3];
  uint64_t v173;
  void *v174;
  uint64_t v175;
  void *v176;
  uint64_t v177;
  id v178;
  uint64_t v179;
  id v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  id v184;
  uint64_t v185;
  void *v186;
  uint64_t v187;
  id v188;
  uint64_t v189;
  void *v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  _QWORD v194[4];
  CGRect v195;
  NSRect v196;
  CGRect v197;
  NSRect v198;

  v194[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "resourceData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (+[VCPFaceCropUtils isValidFaceCrop:](VCPFaceCropUtils, "isValidFaceCrop:", v8))
      {
        +[VCPFaceCropUtils faceBoundsFromFaceCrop:error:](VCPFaceCropUtils, "faceBoundsFromFaceCrop:error:", v8, a4);
        x = v195.origin.x;
        y = v195.origin.y;
        width = v195.size.width;
        height = v195.size.height;
        if (CGRectIsNull(v195))
        {
          if (a4)
          {
            v13 = (void *)MEMORY[0x1E0CB35C8];
            v187 = *MEMORY[0x1E0CB2D50];
            v14 = (void *)MEMORY[0x1E0CB3940];
            v196.origin.x = x;
            v196.origin.y = y;
            v196.size.width = width;
            v196.size.height = height;
            NSStringFromRect(v196);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "stringWithFormat:", CFSTR("Invalid facecrop bounding box %@"), v15);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            v188 = v16;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v188, &v187, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v17);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
            v18 = 0;
LABEL_15:

            goto LABEL_16;
          }
          goto LABEL_31;
        }
        +[VCPFaceCropUtils faceCropDimensionsFromFaceCrop:error:](VCPFaceCropUtils, "faceCropDimensionsFromFaceCrop:error:", v8, a4);
        v25 = v23;
        v26 = v24;
        v27 = (double *)MEMORY[0x1E0C9D820];
        if (v23 != *MEMORY[0x1E0C9D820] || v24 != *(double *)(MEMORY[0x1E0C9D820] + 8))
        {
          +[VCPGeometryUtils normalizedRectForRect:inBoundsOfSize:](VCPGeometryUtils, "normalizedRectForRect:inBoundsOfSize:", x, y, width, height, v23, v24);
          v29 = v197.origin.x;
          v30 = v197.origin.y;
          v133 = v197.size.width;
          v134 = v197.size.height;
          if (CGRectIsNull(v197))
          {
            if (a4)
            {
              v31 = (void *)MEMORY[0x1E0CB35C8];
              v183 = *MEMORY[0x1E0CB2D50];
              v32 = (void *)MEMORY[0x1E0CB3940];
              v198.origin.x = x;
              v198.origin.y = y;
              v198.size.width = width;
              v198.size.height = height;
              NSStringFromRect(v198);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "stringWithFormat:", CFSTR("Failed to normalize bound %@ with image (%.0fx%.0f)"), v15, *(_QWORD *)&v25, *(_QWORD *)&v26);
              v16 = (id)objc_claimAutoreleasedReturnValue();
              v184 = v16;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v33);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_7;
            }
LABEL_31:
            v18 = 0;
            goto LABEL_32;
          }
          +[VCPFaceCropUtils faceCropDimensionsFromFaceCrop:error:](VCPFaceCropUtils, "faceCropDimensionsFromFaceCrop:error:", v8, a4);
          v37 = v36;
          v38 = v35;
          if (v36 == *v27 && v35 == v27[1])
          {
            if (!a4)
              goto LABEL_31;
            v39 = (void *)MEMORY[0x1E0CB35C8];
            v181 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to obtain the facecrop image dimensions"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v182 = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v16);
            v21 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
          v41 = objc_alloc(MEMORY[0x1E0CEDF70]);
          v15 = (void *)objc_msgSend(v41, "initWithData:orientation:options:", v8, 1, MEMORY[0x1E0C9AA70]);
          if (!v15)
          {
            if (!a4)
            {
              v18 = 0;
              goto LABEL_16;
            }
            v46 = (void *)MEMORY[0x1E0CB35C8];
            v179 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create VNImageRequestHandler"));
            v16 = (id)objc_claimAutoreleasedReturnValue();
            v180 = v16;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v180, &v179, 1);
            v44 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v44);
            v18 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_61;
          }
          v146 = 0;
          v42 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v146, objc_opt_class(), -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion"));
          v16 = v146;
          if (v42)
          {
            if (!a4)
              goto LABEL_7;
            v43 = (void *)MEMORY[0x1E0CB35C8];
            v177 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set VNDetectFaceRectanglesRequest"));
            v44 = (id)objc_claimAutoreleasedReturnValue();
            v178 = v44;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v45);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_60;
          }
          if (_os_feature_enabled_impl())
          {
            v145 = 0;
            v47 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v145, objc_opt_class(), -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion"));
            v48 = v145;
            v49 = v48;
            if (v47)
            {
              if (a4)
              {
                v50 = (void *)MEMORY[0x1E0CB35C8];
                v175 = *MEMORY[0x1E0CB2D50];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set VNRecognizeAnimalFacesRequest"));
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v176 = v51;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v52);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_59;
            }
            v132 = v48;
            v144 = 0;
            v64 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v144, objc_opt_class(), -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion"));
            v65 = v144;
            if (v64)
            {
              if (a4)
              {
                v66 = (void *)MEMORY[0x1E0CB35C8];
                v173 = *MEMORY[0x1E0CB2D50];
                v67 = v65;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set VNRecognizeAnimalsRequest"));
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v174 = v68;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v69);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

                v65 = v67;
              }

              goto LABEL_59;
            }
            v172[0] = v16;
            v172[1] = v132;
            v130 = v65;
            v172[2] = v65;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 3);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v143 = 0;
            v85 = objc_msgSend(v15, "performRequests:error:", v84, &v143);
            v128 = v143;

            if ((v85 & 1) != 0)
            {
              v142 = 0;
              v86 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v142, objc_opt_class(), -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion"));
              v87 = v142;
              if (v86)
              {
                if (!a4)
                {
                  v44 = 0;
                  v89 = 1;
LABEL_120:

LABEL_121:
                  if (v89)
                    goto LABEL_60;
LABEL_122:
                  if (v44)
                  {
                    objc_msgSend(v44, "imageprintWrapper");
                    v115 = (void *)objc_claimAutoreleasedReturnValue();
                    v116 = v115 == 0;

                    if (!v116)
                    {
                      v44 = v44;
                      v18 = v44;
                      goto LABEL_61;
                    }
                    if (a4)
                    {
                      v118 = (void *)MEMORY[0x1E0CB35C8];
                      v147 = *MEMORY[0x1E0CB2D50];
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to wrap faceprint/faceTorsoprint/animalprint"));
                      v119 = (void *)objc_claimAutoreleasedReturnValue();
                      v148 = v119;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v118, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v120);
                      *a4 = (id)objc_claimAutoreleasedReturnValue();

                    }
LABEL_60:
                    v18 = 0;
LABEL_61:

                    goto LABEL_15;
                  }
                  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  {
                    v117 = *a4;
                    *(_DWORD *)buf = 138412290;
                    v163 = v117;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceCropManager] Failed to create VCPPhotosFace - %@", buf, 0xCu);
                  }
LABEL_59:
                  v44 = 0;
                  goto LABEL_60;
                }
                v88 = (void *)MEMORY[0x1E0CB35C8];
                v168 = *MEMORY[0x1E0CB2D50];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set VNCreateFaceprintRequest"));
                v127 = (id)objc_claimAutoreleasedReturnValue();
                v169 = v127;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1);
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v125);
                v44 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
                v89 = 1;

LABEL_119:
                goto LABEL_120;
              }
              v141 = 0;
              v92 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v141, objc_opt_class(), -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion"));
              v127 = v141;
              if (!v92)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "results");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = v98 == 0;

                if (!v99)
                {
                  objc_msgSend(v16, "results");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v87, "setInputFaceObservations:", v100);

                  objc_msgSend(v126, "addObject:", v87);
                }
                objc_msgSend(v132, "results");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                v102 = v101 == 0;

                if (!v102)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v130, "results");
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  v105 = objc_msgSend(v104, "count") == 0;

                  if (!v105)
                  {
                    objc_msgSend(v130, "results");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v103, "addObjectsFromArray:", v106);

                  }
                  objc_msgSend(v132, "results");
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  v108 = objc_msgSend(v107, "count") == 0;

                  if (!v108)
                  {
                    objc_msgSend(v132, "results");
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v103, "addObjectsFromArray:", v109);

                  }
                  objc_msgSend(v127, "setInputDetectedObjectObservations:", v103);
                  objc_msgSend(v126, "addObject:", v127);

                }
                v140 = v128;
                v110 = objc_msgSend(v15, "performRequests:error:", v126, &v140);
                v124 = v140;

                if ((v110 & 1) != 0)
                {
                  -[PHPhotoLibrary mad_allPersonsFetchOptions](self->_photoLibrary, "mad_allPersonsFetchOptions");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonForFaceCrop:options:", v7, v94);
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v129, "firstObject");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  v112 = v111;
                  if (v111)
                  {
                    if (objc_msgSend(v111, "detectionType") == 1)
                    {
                      -[VCPFaceCropManager _vcpHumanFaceWithFaceCrop:imageRequestHandler:faceDetectionRequest:normalizedFaceCropBoundingBox:faceCropImageDimension:faceprintRequest:error:](self, "_vcpHumanFaceWithFaceCrop:imageRequestHandler:faceDetectionRequest:normalizedFaceCropBoundingBox:faceCropImageDimension:faceprintRequest:error:", v7, v15, v16, v87, a4, v29, v30, v133, v134, v37, v38);
                      v44 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    else if (objc_msgSend(v112, "detectionType") == 3
                           || objc_msgSend(v112, "detectionType") == 4)
                    {
                      objc_msgSend(v132, "results");
                      v123 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v130, "results");
                      v122 = (void *)objc_claimAutoreleasedReturnValue();
                      -[VCPFaceCropManager _vcpAnimalFaceWithFaceCrop:animalFaceObservations:animalBodyObservations:animalprintRequest:normalizedFaceCropBoundingBox:faceCropImageDimension:error:](self, "_vcpAnimalFaceWithFaceCrop:animalFaceObservations:animalBodyObservations:animalprintRequest:normalizedFaceCropBoundingBox:faceCropImageDimension:error:", v7, v123, v122, v127, a4, v29, v30, v133, v134, v37, v38);
                      v44 = (id)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v44 = 0;
                    }
                    v89 = 0;
                  }
                  else
                  {
                    if ((int)MediaAnalysisLogLevel() >= 3
                      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(v7, "localIdentifier");
                      v114 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v163 = v114;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceCropManager][%@] Failed to retrieve PHPerson from face crop", buf, 0xCu);

                    }
                    v44 = 0;
                    v89 = 1;
                  }

                }
                else
                {
                  if (!a4)
                  {
                    v44 = 0;
                    v89 = 1;
                    v128 = v124;
LABEL_118:

                    goto LABEL_119;
                  }
                  v113 = (void *)MEMORY[0x1E0CB35C8];
                  v164 = *MEMORY[0x1E0CB2D50];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to print facecrop - %@"), v124);
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  v165 = v94;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1);
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v113, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v129);
                  v44 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                  v89 = 1;
                }

                v128 = v124;
LABEL_117:

                goto LABEL_118;
              }
              if (a4)
              {
                v93 = (void *)MEMORY[0x1E0CB35C8];
                v166 = *MEMORY[0x1E0CB2D50];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set VNCreateAnimalprintRequest"));
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                v167 = v126;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v94);
                v44 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
                v89 = 1;
                goto LABEL_117;
              }
              v44 = 0;
            }
            else
            {
              if (!a4)
              {
                v44 = 0;
                v89 = 1;
                goto LABEL_121;
              }
              v90 = (void *)MEMORY[0x1E0CB35C8];
              v170 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to detect facecrop - %@"), v128);
              v87 = (id)objc_claimAutoreleasedReturnValue();
              v171 = v87;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1);
              v127 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v127);
              v44 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            v89 = 1;
            goto LABEL_119;
          }
          v161 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v161, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = 0;
          v54 = objc_msgSend(v15, "performRequests:error:", v53, &v139);
          v55 = v139;

          if ((v54 & 1) == 0)
          {
            if (a4)
            {
              v61 = (void *)MEMORY[0x1E0CB35C8];
              v159 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to detect facecrop - %@"), v55);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v160 = v62;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v63);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_59;
          }
          v138 = 0;
          v56 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v138, objc_opt_class(), -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion"));
          v131 = v138;
          if (v56)
          {
            if (!a4)
            {
LABEL_51:

              goto LABEL_59;
            }
            v57 = (void *)MEMORY[0x1E0CB35C8];
            v157 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set VNCreateFaceprintRequest"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v158 = v58;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_50:
            *a4 = v60;

            goto LABEL_51;
          }
          objc_msgSend(v16, "results");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v70 == 0;

          if (!v71)
          {
            objc_msgSend(v16, "results");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "setInputFaceObservations:", v72);

            v156 = v131;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v156, 1);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = v55;
            v74 = objc_msgSend(v15, "performRequests:error:", v73, &v137);
            v75 = v137;

            if ((v74 & 1) == 0)
            {
              if (!a4)
              {
                v55 = v75;
                goto LABEL_51;
              }
              v91 = (void *)MEMORY[0x1E0CB35C8];
              v154 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to print facecrop - %@"), v75);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v155 = v58;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = v75;
              goto LABEL_50;
            }
            v55 = v75;
          }
          -[VCPFaceCropManager _bestFaceForFacePrintRequest:withRect:](self, "_bestFaceForFacePrintRequest:withRect:", v131, v29, v30, v133, v134);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v76)
          {
            if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "localIdentifier");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v163 = v77;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FaceCropManager][%@] No face detected; force faceprinting",
                buf,
                0xCu);

            }
            objc_msgSend(MEMORY[0x1E0CEDEE0], "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", objc_msgSend(v16, "revision"), v29, v30, v133, v134, v29, v30, v133, v134);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            v153 = v135;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "setInputFaceObservations:", v78);

            objc_msgSend(v131, "setForceFaceprintCreation:", 1);
            v152 = v131;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v152, 1);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v136 = 0;
            v80 = objc_msgSend(v15, "performRequests:error:", v79, &v136);
            v81 = v136;

            if ((v80 & 1) == 0)
            {
              if (a4)
              {
                v95 = (void *)MEMORY[0x1E0CB35C8];
                v150 = *MEMORY[0x1E0CB2D50];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create faceprint - %@"), v81);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                v151 = v96;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v97);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_59;
            }
            objc_msgSend(v131, "results");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "firstObject");
            v76 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v149[0] = v16;
          v149[1] = v131;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 2);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v121) = 1;
          +[VCPPhotosFace faceFromFaceObservation:humanObservation:sourceWidth:sourceHeight:visionRequests:processingVersion:force:andError:](VCPPhotosFace, "faceFromFaceObservation:humanObservation:sourceWidth:sourceHeight:visionRequests:processingVersion:force:andError:", v76, 0, (unint64_t)v37, (unint64_t)v38, v83, -[VCPPhotosFaceProcessingContext processingVersion](self->_context, "processingVersion"), v121, a4);
          v44 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_122;
        }
        if (!a4)
          goto LABEL_31;
        v34 = (void *)MEMORY[0x1E0CB35C8];
        v185 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Facecrop image size equals to 0"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v186 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v186, &v185, 1);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v16);
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!a4)
          goto LABEL_31;
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v189 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid facecrop image data %@"), v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v190 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v190, &v189, 1);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v16);
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (!a4)
        goto LABEL_31;
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v191 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing image data from facecrop %@"), v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v192, &v191, 1);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v16);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:
    v18 = 0;
    *a4 = v21;
    goto LABEL_15;
  }
  if (a4)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v193 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Facecrop is nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v194[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v194, &v193, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v15);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_32:
    goto LABEL_33;
  }
  v18 = 0;
LABEL_33:

  return v18;
}

- (id)_associateFace:(id)a3 withFaceCrop:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
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
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_QWORD *);
  void *v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Face has already been persisted with a facecrop"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_4:
      a5 = 0;
    }
  }
  else
  {
    objc_msgSend(v8, "imageprintWrapper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      if (!a5)
        goto LABEL_13;
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Face does not have a faceprint"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__26;
    v34 = __Block_byref_object_dispose__26;
    v35 = 0;
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __56__VCPFaceCropManager__associateFace_withFaceCrop_error___block_invoke;
    v26 = &unk_1E6B192F8;
    v27 = v8;
    v29 = &v30;
    v28 = v9;
    v15 = _Block_copy(&v23);
    if (-[PHPhotoLibrary performChangesAndWait:error:](self->_photoLibrary, "performChangesAndWait:error:", v15, a5, v23, v24, v25, v26))
    {
      a5 = (id *)(id)v31[5];
    }
    else if (a5)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to persist face and facecrop"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
    }

    _Block_object_dispose(&v30, 8);
  }
LABEL_13:

  return a5;
}

void __56__VCPFaceCropManager__associateFace_withFaceCrop_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CD1530], "creationRequestForFace");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[VCPFaceUtils assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:](VCPFaceUtils, "assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:", a1[4]);
  objc_msgSend(v7, "placeholderForCreatedFace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(MEMORY[0x1E0CD1550], "changeRequestForFaceCrop:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setState:", 1);
  objc_msgSend(v6, "setFace:", v2);

}

- (BOOL)_clearDirtyStateOnFaceCrop:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD aBlock[4];
  id v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__VCPFaceCropManager__clearDirtyStateOnFaceCrop_error___block_invoke;
    aBlock[3] = &unk_1E6B15468;
    v12 = v6;
    v8 = _Block_copy(aBlock);
    v9 = -[PHPhotoLibrary performChangesAndWait:error:](self->_photoLibrary, "performChangesAndWait:error:", v8, a4);

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceCropManager] faceCrop is nil; ignore resetting state to PHFaceCropStateProcessed",
        buf,
        2u);
    }
    v9 = 0;
  }

  return v9;
}

void __55__VCPFaceCropManager__clearDirtyStateOnFaceCrop_error___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD1550], "changeRequestForFaceCrop:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setState:", 1);

}

- (BOOL)_generateAndAssociateFaceprintedFaceForFaceCrop:(id)a3 faceCropFaceLocalIdentifier:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v21 = 0;
  -[VCPFaceCropManager _faceFromFaceCrop:error:](self, "_faceFromFaceCrop:error:", v8, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;
  v11 = v10;
  if (v9)
  {
    v20 = v10;
    -[VCPFaceCropManager _associateFace:withFaceCrop:error:](self, "_associateFace:withFaceCrop:error:", v9, v8, &v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;

    v14 = v12 != 0;
    if (v12)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "localIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v15;
        v24 = 2112;
        v25 = v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FacecropManager][%@] Associated with face %@", buf, 0x16u);

      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "localIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v23 = v17;
        v24 = 2112;
        v25 = v18;
        v26 = 2112;
        v27 = v13;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceCropManager][%@] Failed to associate with face %@ - %@", buf, 0x20u);

      }
      if (a5)
        *a5 = objc_retainAutorelease(v13);
    }

    v11 = v13;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "localIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v16;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceCropManager][%@] Failed to faceprint - %@", buf, 0x16u);

    }
    if (a5)
      *a5 = objc_retainAutorelease(v11);
    -[VCPFaceCropManager _clearDirtyStateOnFaceCrop:error:](self, "_clearDirtyStateOnFaceCrop:error:", v8, a5);
    v14 = 0;
  }

  return v14;
}

- (BOOL)_updateFaceprint:(id)a3 forFace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  _QWORD aBlock[4];
  id v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc(MEMORY[0x1E0CD1568]);
  objc_msgSend(v8, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFaceprintData:faceprintVersion:", v11, (int)objc_msgSend(v8, "version"));

  if (v12)
  {
    objc_msgSend(v9, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[VCPPhotosPersistenceDelegate newAllPersonsFetchOptionsWithPhotoLibrary:](VCPPhotosPersistenceDelegate, "newAllPersonsFetchOptionsWithPhotoLibrary:", v13);

    objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonWithFace:options:", v9, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "type") == -1 && objc_msgSend(v16, "verifiedType") == 2)
      v17 = -1;
    else
      v17 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__VCPFaceCropManager__updateFaceprint_forFace_error___block_invoke;
    aBlock[3] = &unk_1E6B16EB8;
    v23 = v9;
    v24 = v12;
    v25 = v17;
    v18 = _Block_copy(aBlock);
    v19 = -[PHPhotoLibrary performChangesAndWait:error:](self->_photoLibrary, "performChangesAndWait:error:", v18, a5);

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "localIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FacecropManager] Failed to retreive faceprint for face %@", buf, 0xCu);

    }
    v19 = 0;
  }

  return v19;
}

void __53__VCPFaceCropManager__updateFaceprint_forFace_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFaceprint:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setClusterSequenceNumber:", 0);
  objc_msgSend(v2, "setVuObservationID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setFaceAlgorithmVersion:", objc_msgSend(*(id *)(a1 + 40), "faceprintVersion"));
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FacecropManager] Updating faceprint for face %@", (uint8_t *)&v4, 0xCu);

  }
}

- (BOOL)_updateFace:(id)a3 withFaceCrop:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  BOOL v15;
  id v17;
  id v18;

  v8 = a3;
  v18 = 0;
  -[VCPFaceCropManager _faceFromFaceCrop:error:](self, "_faceFromFaceCrop:error:", a4, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v9, "imageprintWrapper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    v13 = -[VCPFaceCropManager _updateFaceprint:forFace:error:](self, "_updateFaceprint:forFace:error:", v12, v8, &v17);
    v14 = v17;

    if (v13)
    {
      v15 = 1;
LABEL_10:
      v11 = v14;
      goto LABEL_11;
    }
    if (!a5)
    {
      v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    if (!a5)
    {
      v15 = 0;
      goto LABEL_11;
    }
    v14 = v10;
  }
  v11 = objc_retainAutorelease(v14);
  v15 = 0;
  *a5 = v11;
LABEL_11:

  return v15;
}

- (BOOL)_recordNeedToPersonBuildOnFaceGroupContainingFace:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  _QWORD aBlock[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsWithFace:options:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__VCPFaceCropManager__recordNeedToPersonBuildOnFaceGroupContainingFace_error___block_invoke;
    aBlock[3] = &unk_1E6B15468;
    v11 = v9;
    v18 = v11;
    v12 = _Block_copy(aBlock);
    v13 = -[PHPhotoLibrary performChangesAndWait:error:](self->_photoLibrary, "performChangesAndWait:error:", v12, a4);
    if (v13 && (int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "localIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCropManager] Set personBuilderState of faceGroup %@ for face %@", buf, 0x16u);

    }
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

void __78__VCPFaceCropManager__recordNeedToPersonBuildOnFaceGroupContainingFace_error___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD1560], "changeRequestForFaceGroup:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPersonBuilderState:", 1);

}

- (BOOL)_processDirtyFaceCrop:(id)a3 faceCropFaceLocalIdentifier:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  id v24;
  BOOL v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  _BYTE v39[10];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "resourceData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPFaceCropUtils faceCropDimensionsFromFaceCrop:error:](VCPFaceCropUtils, "faceCropDimensionsFromFaceCrop:error:", v9, a5);
  v11 = v10;
  v13 = v12;

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v37 = v14;
    v38 = 2048;
    *(_QWORD *)v39 = v11;
    *(_WORD *)&v39[8] = 2048;
    v40 = v13;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceCropManager][%@] Analyzing facecrop (%.0fx%.0f)", buf, 0x20u);

  }
  if (!objc_msgSend(v8, "state"))
  {
    objc_msgSend(v8, "resourceData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (v19)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "localIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v29;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceCropManager][%@] FaceCrop does not have data", buf, 0xCu);

      }
    }
    else
    {
      -[VCPFaceCropManager _faceAssociatedWithFaceCrop:](self, "_faceAssociatedWithFaceCrop:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "localIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = v21;
        v38 = 2112;
        *(_QWORD *)v39 = v22;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCropManager][%@] existing face %@", buf, 0x16u);

      }
      if (!v20)
      {
        v30 = -[VCPFaceCropManager _generateAndAssociateFaceprintedFaceForFaceCrop:faceCropFaceLocalIdentifier:error:](self, "_generateAndAssociateFaceprintedFaceForFaceCrop:faceCropFaceLocalIdentifier:error:", v8, a4, a5);
LABEL_35:
        v17 = v30;
        goto LABEL_36;
      }
      v35 = 0;
      v23 = -[VCPFaceCropManager _updateFace:withFaceCrop:error:](self, "_updateFace:withFaceCrop:error:", v20, v8, &v35);
      v24 = v35;
      if (v23)
      {
        if (objc_msgSend(v20, "clusterSequenceNumber"))
        {
          v34 = 0;
          v25 = -[VCPFaceCropManager _recordNeedToPersonBuildOnFaceGroupContainingFace:error:](self, "_recordNeedToPersonBuildOnFaceGroupContainingFace:error:", v20, &v34);
          v26 = v34;
          if (!v25
            && (int)MediaAnalysisLogLevel() >= 4
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v20, "localIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "localIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v37 = v27;
            v38 = 2112;
            *(_QWORD *)v39 = v28;
            *(_WORD *)&v39[8] = 2112;
            v40 = v26;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FaceCropManager][%@] Failed to record needing to Person Building for face %@ - %@", buf, 0x20u);

          }
        }
        else if (a4
               && (objc_msgSend(v20, "detectionType") == 1
                || -[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery")))
        {
          objc_msgSend(v20, "localIdentifier");
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        v30 = -[VCPFaceCropManager _clearDirtyStateOnFaceCrop:error:](self, "_clearDirtyStateOnFaceCrop:error:", v8, a5);
        goto LABEL_35;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v20, "localIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = v31;
        v38 = 2112;
        *(_QWORD *)v39 = v32;
        *(_WORD *)&v39[8] = 2112;
        v40 = v24;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceCropManager][%@] Failed to update associated face %@ - %@", buf, 0x20u);

      }
    }
    v17 = 0;
    goto LABEL_36;
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "state");
    *(_DWORD *)buf = 138412802;
    v37 = v15;
    v38 = 1024;
    *(_DWORD *)v39 = v16;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceCropManager][%@] Not in a dirty state (state:%d, expect:%d); skipping process",
      buf,
      0x18u);

  }
  v17 = 1;
LABEL_36:

  return v17;
}

- (id)_vcpFaceCropFromPHFaceCrop:(id)a3
{
  id v3;
  void *v4;
  VCPFaceCrop *v5;
  void *v6;
  VCPFaceCrop *v7;

  v3 = a3;
  objc_msgSend(v3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [VCPFaceCrop alloc];
    objc_msgSend(v3, "resourceData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[VCPFaceCrop initWithLocalIdentifier:faceCropData:](v5, "initWithLocalIdentifier:faceCropData:", v4, v6);

    -[VCPFaceCrop setState:](v7, "setState:", objc_msgSend(v3, "state"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)generateAndPersistFaceCropsForFaces:(id)a3 withAsset:(id)a4 resource:(id)a5 resourceURL:(id)a6 error:(id *)a7
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  id v40;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v43 = a4;
  v40 = a5;
  v42 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(v12);
        +[VCPPhotosFace faceFromPHFace:copyOption:](VCPPhotosFace, "faceFromPHFace:copyOption:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v11, "addObject:", v16);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v17 = v11;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v45;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v45 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v20);
          if (objc_msgSend(v21, "manual"))
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v43, "localIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "localIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v53 = v22;
              v54 = 2112;
              v55 = (uint64_t)v23;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FaceCropManager][%@] Facecrop will not be generated for the manual face %@", buf, 0x16u);

            }
          }
          else
          {
            objc_msgSend(v43, "creationDate");
            v24 = (id)objc_claimAutoreleasedReturnValue();
            if (_GetGroupingIdentifier(NSDate *)::dateFormatterCreationToken != -1)
              dispatch_once(&_GetGroupingIdentifier(NSDate *)::dateFormatterCreationToken, &__block_literal_global_45);
            objc_msgSend((id)_GetGroupingIdentifier(NSDate *)::dateFormatterToStripTime, "stringFromDate:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            +[VCPFaceCrop generateFaceCropsForFace:resourceURL:groupingIdentifier:](VCPFaceCrop, "generateFaceCropsForFace:resourceURL:groupingIdentifier:", v21, v42, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              objc_msgSend(v41, "addObject:", v26);
              objc_msgSend(v26, "imageDimensions");
              if (v27 < 128.0 || (objc_msgSend(v26, "imageDimensions"), v28 < 128.0))
              {
                if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v43, "localIdentifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "imageDimensions");
                  v31 = v30;
                  objc_msgSend(v26, "imageDimensions");
                  *(_DWORD *)buf = 138413314;
                  v53 = v29;
                  v54 = 2048;
                  v55 = v31;
                  v56 = 2048;
                  v57 = v32;
                  v58 = 2112;
                  v59 = v40;
                  v60 = 2112;
                  v61 = v42;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceCropManager][%@] Too small facecrop (%.0fx%.0f) using resource %@ (%@)", buf, 0x34u);

                }
              }
            }

          }
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
      }
      while (v18);
    }

    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v43, "localIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v41, "count");
      *(_DWORD *)buf = 138412546;
      v53 = v33;
      v54 = 2048;
      v55 = v34;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceCropManager][%@] Generated %lu facecrop(s)", buf, 0x16u);

    }
    v35 = -[VCPFaceCropManager _persistGeneratedFaceCrops:forAsset:error:](self, "_persistGeneratedFaceCrops:forAsset:error:", v41, v43, a7);

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v43, "localIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v53 = v36;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceCropManager][%@] Asset has face; skip facecrop generation",
        buf,
        0xCu);

    }
    v35 = 1;
  }

  return v35;
}

- (int)processDirtyFaceCrops:(unint64_t *)a3 withCancelBlock:(id)a4 andExtendTimeoutBlock:(id)a5
{
  uint64_t (**v6)(_QWORD);
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  char v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t spid;
  unint64_t v29;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(_QWORD))a4;
  v7 = (void (**)(_QWORD))a5;
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  spid = v9;
  v29 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPFaceProcessingDirtyFaceCrops", ", buf, 2u);
  }

  v12 = (void *)MEMORY[0x1E0CD1540];
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchFaceCropsNeedingFaceDetectionWithOptions:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 134217984;
    v34 = v15;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceCropManager] Library has %lu dirty face crops to analyze", buf, 0xCu);
  }
  v16 = 0;
  v17 = 0;
  while (v17 < objc_msgSend(v14, "count"))
  {
    v18 = (void *)MEMORY[0x1BCCA1B2C]();
    v19 = v6[2](v6);
    if ((v19 & 1) == 0)
    {
      if (v7)
        v7[2](v7);
      objc_msgSend(v14, "objectAtIndexedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v21 = -[VCPFaceCropManager _processDirtyFaceCrop:faceCropFaceLocalIdentifier:error:](self, "_processDirtyFaceCrop:faceCropFaceLocalIdentifier:error:", v20, 0, &v32);
      v22 = v32;
      if (v21)
      {
        ++v16;
      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v20, "localIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = (uint64_t)v23;
        v35 = 2112;
        v36 = v22;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceCropManager] Failed to process dirty facecrop %@ - %@", buf, 0x16u);

      }
    }
    objc_autoreleasePoolPop(v18);
    ++v17;
    if ((v19 & 1) != 0)
    {
      v24 = -128;
      goto LABEL_24;
    }
  }
  *a3 = v16;
  VCPSignPostLog();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v26, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceProcessingDirtyFaceCrops", ", buf, 2u);
  }

  v24 = 0;
LABEL_24:

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
