@implementation VCPFaceMerger

- (VCPFaceMerger)initWithThreshold:(double)a3
{
  VCPFaceMerger *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VCPFaceMerger;
  result = -[VCPFaceMerger init](&v5, sel_init);
  if (result)
    result->_mergeDistanceThreshold = a3;
  return result;
}

- (id)_faceObservationsWithBoundingBoxFromFaces:(id)a3 withFaceHashMapping:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (!objc_msgSend(v13, "algorithmVersion", (_QWORD)v30) && (objc_msgSend(v13, "manual") & 1) == 0)
        {
          objc_msgSend(v13, "size");
          v15 = v14;
          v16 = objc_msgSend(v13, "sourceWidth");
          v17 = objc_msgSend(v13, "sourceHeight");
          if (v16 <= v17)
            v18 = v17;
          else
            v18 = v16;
          v19 = v15 * (double)v18;
          v20 = v19 / (double)objc_msgSend(v13, "sourceWidth");
          v21 = v19 / (double)objc_msgSend(v13, "sourceHeight");
          objc_msgSend(v13, "centerX");
          v23 = v22 - v20 * 0.5;
          objc_msgSend(v13, "centerY");
          objc_msgSend(MEMORY[0x1E0CEDEE0], "observationWithBoundingBox:", v23, v24 - v21 * 0.5, v20, v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v25);
          objc_msgSend(v13, "localIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "hash");

          objc_msgSend(v25, "setFaceId:", v27);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v13, v28);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v10);
  }

  return v7;
}

+ (BOOL)_allowANE
{
  return 1;
}

- (id)_alignFaceObservations:(id)a3 withRequestHandler:(id)a4 error:(id *)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x1E0CEDD90];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithFaceObservations:", v9);

  if (!v10)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2F90];
    v27 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create VNAlignFaceRectangleRequest"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v28[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, -18, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    v15 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v10, "setRevision:", 1);
  objc_msgSend(v10, "setMetalContextPriority:", 1);
  objc_msgSend(v10, "setPreferBackgroundProcessing:", 1);
  if (DeviceHasANE() && objc_msgSend((id)objc_opt_class(), "_allowANE"))
  {
    objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProcessingDevice:", v11);

  }
  v26 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v13 = objc_msgSend(v7, "performRequests:error:", v12, &v23);
  v14 = v23;

  if ((v13 & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2F90];
    v24 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to exercise Vision request - %@"), v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, -18, v21);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_msgSend(v10, "results");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v15;
}

- (void)_alignBoundingBoxOfFaces:(id)a3 withRequestHandler:(id)a4 orientedWidth:(unint64_t)a5 orientedHeight:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  unint64_t v23;
  double v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  NSObject *v33;
  const char *v34;
  uint32_t v35;
  double v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPFaceMerger _faceObservationsWithBoundingBoxFromFaces:withFaceHashMapping:](self, "_faceObservationsWithBoundingBoxFromFaces:withFaceHashMapping:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v45 = 0;
    -[VCPFaceMerger _alignFaceObservations:withRequestHandler:error:](self, "_alignFaceObservations:withRequestHandler:error:", v13, v11, &v45);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v45;
    v16 = v15;
    if (v14)
    {
      v37 = v15;
      v38 = v14;
      v39 = v13;
      v40 = v10;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v17 = v14;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (!v18)
        goto LABEL_25;
      v19 = v18;
      v20 = *(_QWORD *)v42;
      v21 = (double)a5;
      v22 = (double)a6;
      if (a5 <= a6)
        v23 = a6;
      else
        v23 = a5;
      v24 = (double)v23;
      while (1)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(v17);
          v26 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v26, "faceId"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v26, "boundingBox");
            x = v50.origin.x;
            y = v50.origin.y;
            width = v50.size.width;
            height = v50.size.height;
            if (CGRectIsEmpty(v50))
            {
              if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v33 = MEMORY[0x1E0C81028];
                v34 = "[VCPFaceMerger] Bounding box aligner returned an empty rectangle";
                v35 = 2;
LABEL_19:
                _os_log_impl(&dword_1B6C4A000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, v35);
              }
            }
            else
            {
              v51.origin.x = x;
              v51.origin.y = y;
              v51.size.width = width;
              v51.size.height = height;
              objc_msgSend(v28, "setCenterX:", CGRectGetMidX(v51));
              v52.origin.x = x;
              v52.origin.y = y;
              v52.size.width = width;
              v52.size.height = height;
              objc_msgSend(v28, "setCenterY:", CGRectGetMidY(v52));
              v36 = width * v21;
              if (width * v21 < height * v22)
                v36 = height * v22;
              objc_msgSend(v28, "setSize:", v36 / v24);
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v26;
            v33 = MEMORY[0x1E0C81028];
            v34 = "[VCPFaceMerger] Missing face for observation %@ from mapping";
            v35 = 12;
            goto LABEL_19;
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (!v19)
        {
LABEL_25:

          v10 = v40;
          v14 = v38;
          v13 = v39;
          v16 = v37;
          goto LABEL_29;
        }
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VCPFaceMerger] Failed to align face observation - %@", buf, 0xCu);
    }
LABEL_29:

  }
}

- (id)_sortedViableFaceMergePairsFromQueryFaces:(id)a3 andCandidateFaces:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  void *v35;
  const char *v36;
  void *v37;
  NSObject *v38;
  os_log_type_t v39;
  const char *v40;
  uint32_t v41;
  double mergeDistanceThreshold;
  id v44;
  id obj;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *context;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  float v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  _BYTE v70[24];
  __int16 v71;
  int v72;
  __int16 v73;
  const char *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5 || !objc_msgSend(v6, "count"))
  {
    v52 = 0;
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v44 = v5;
  obj = v5;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
  if (!v48)
    goto LABEL_39;
  v8 = MEMORY[0x1E0C81028];
  v46 = *(_QWORD *)v64;
  v9 = 2;
  v47 = v7;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v64 != v46)
        objc_enumerationMutation(obj);
      v50 = v10;
      v11 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v10);
      context = (void *)MEMORY[0x1BCCA1B2C]();
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v12 = v7;
      v56 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
      if (v56)
      {
        v13 = *(_QWORD *)v60;
        v54 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v56; ++i)
          {
            if (*(_QWORD *)v60 != v13)
              objc_enumerationMutation(v12);
            v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            objc_msgSend(v15, "imageprintWrapper");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16 && (v17 = objc_msgSend(v15, "algorithmVersion"), v17 == objc_msgSend(v11, "algorithmVersion")))
            {
              v18 = objc_msgSend(v15, "detectionType");
              v19 = objc_msgSend(v11, "detectionType");

              if (v18 == v19)
              {
                v58 = 1.0;
                objc_msgSend(v11, "imageprintWrapper");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "imageprintWrapper");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = 0;
                v22 = objc_msgSend(v20, "calculateDistance:toWrapper:andError:", &v58, v21, &v57);
                v23 = v57;

                if (v22)
                {
                  if (self->_mergeDistanceThreshold > v58)
                  {
                    +[VCPPhotosFacePair pairWithFace:andFace:distance:](VCPPhotosFacePair, "pairWithFace:andFace:distance:", v11, v15);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v24)
                    {
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mergeDistanceThreshold);
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = objc_msgSend(v51, "indexOfObject:inSortedRange:options:usingComparator:", v25, 0, objc_msgSend(v51, "count"), 1024, &__block_literal_global_82);
                      objc_msgSend(v51, "insertObject:atIndex:", v25, v26);
                      objc_msgSend(v52, "insertObject:atIndex:", v24, v26);

                    }
                    goto LABEL_34;
                  }
                  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v8, (os_log_type_t)v9))
                  {
                    objc_msgSend(v15, "localIdentifier");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    mergeDistanceThreshold = self->_mergeDistanceThreshold;
                    *(_DWORD *)buf = 138412802;
                    v68 = (uint64_t)v37;
                    v69 = 2048;
                    *(double *)v70 = v58;
                    *(_WORD *)&v70[8] = 2048;
                    *(double *)&v70[10] = mergeDistanceThreshold;
                    v38 = v8;
                    v39 = v9;
                    v40 = "[VCPFaceMerger] Cannot merge face with face %@ - distance %f > threashold %f";
                    v41 = 32;
LABEL_33:
                    _os_log_impl(&dword_1B6C4A000, v38, v39, v40, buf, v41);

                  }
                }
                else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v15, "localIdentifier");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v68 = (uint64_t)v37;
                  v69 = 2112;
                  *(_QWORD *)v70 = v23;
                  v38 = v8;
                  v39 = OS_LOG_TYPE_DEFAULT;
                  v40 = "[VCPFaceMerger] Cannot merge face with face %@ - distance calculation failed %@";
                  v41 = 22;
                  goto LABEL_33;
                }
LABEL_34:

                v13 = v54;
                continue;
              }
            }
            else
            {

            }
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v8, (os_log_type_t)v9))
            {
              v55 = objc_msgSend(v11, "algorithmVersion");
              v27 = objc_msgSend(v11, "detectionType");
              objc_msgSend(v15, "localIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v15, "algorithmVersion");
              v30 = v11;
              v31 = v12;
              v32 = v9;
              v33 = v8;
              v34 = objc_msgSend(v15, "detectionType");
              objc_msgSend(v15, "imageprintWrapper");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134219266;
              v36 = "has";
              if (!v35)
                v36 = "no";
              v68 = v55;
              v69 = 1024;
              *(_DWORD *)v70 = v27;
              *(_WORD *)&v70[4] = 2112;
              *(_QWORD *)&v70[6] = v28;
              *(_WORD *)&v70[14] = 2048;
              *(_QWORD *)&v70[16] = v29;
              v13 = v54;
              v71 = 1024;
              v72 = v34;
              v8 = v33;
              v9 = v32;
              v12 = v31;
              v11 = v30;
              v73 = 2080;
              v74 = v36;
              _os_log_impl(&dword_1B6C4A000, v8, (os_log_type_t)v9, "[VCPFaceMerger] Cannot merge face (v%lu, type-%d) with face %@ (v%lu, type-%d, %s imageprint)", buf, 0x36u);

            }
          }
          v56 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
        }
        while (v56);
      }

      objc_autoreleasePoolPop(context);
      v10 = v50 + 1;
      v7 = v47;
    }
    while (v50 + 1 != v48);
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
  }
  while (v48);
LABEL_39:

  v5 = v44;
LABEL_41:

  return v52;
}

uint64_t __77__VCPFaceMerger__sortedViableFaceMergePairsFromQueryFaces_andCandidateFaces___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)mergeExistingFaces:(id)a3 andDetectedFaces:(id)a4 withRequestHandler:(id)a5 orientedWidth:(unint64_t)a6 orientedHeight:(unint64_t)a7 assetWidth:(unint64_t)a8 assetHeight:(unint64_t)a9
{
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void **p_vtable;
  uint64_t v33;
  void *v34;
  double v35;
  id *v36;
  void *v37;
  id v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void **v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  int *v52;
  const char *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  int *v59;
  const char *v60;
  uint64_t v61;
  BOOL v62;
  void *v63;
  void *v64;
  void *v65;
  id v67;
  void (**v68)(_QWORD, _QWORD);
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v74;
  id obj;
  void *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD aBlock[4];
  id v90;
  id v91;
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  unint64_t v101;
  __int16 v102;
  unint64_t v103;
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a4);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v18;
  v69 = v15;
  v70 = v14;
  v71 = (void *)v16;
  v72 = v17;
  if (objc_msgSend(v14, "count"))
  {
    -[VCPFaceMerger _alignBoundingBoxOfFaces:withRequestHandler:orientedWidth:orientedHeight:](self, "_alignBoundingBoxOfFaces:withRequestHandler:orientedWidth:orientedHeight:", v14, v15, a6, a7);
    objc_msgSend(v18, "addObjectsFromArray:", v14);
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v95 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
          objc_msgSend(v24, "imageprintWrapper");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v24, "imageprintWrapper");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "addObject:", v26);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
      }
      while (v21);
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __124__VCPFaceMerger_mergeExistingFaces_andDetectedFaces_withRequestHandler_orientedWidth_orientedHeight_assetWidth_assetHeight___block_invoke;
    aBlock[3] = &unk_1E6B1AE48;
    v27 = v71;
    v90 = v27;
    v28 = v19;
    v91 = v28;
    v92 = v76;
    v67 = v72;
    v93 = v67;
    v29 = _Block_copy(aBlock);
    v78 = v28;
    -[VCPFaceMerger _sortedViableFaceMergePairsFromQueryFaces:andCandidateFaces:](self, "_sortedViableFaceMergePairsFromQueryFaces:andCandidateFaces:", v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void (**)(_QWORD, _QWORD))v29;
    (*((void (**)(void *, void *))v29 + 2))(v29, v30);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = v27;
    v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
    if (v79)
    {
      v77 = *(_QWORD *)v86;
      p_vtable = MADServiceVideoTask.vtable;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v86 != v77)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v33);
          objc_msgSend(v34, "size");
          v80 = v33;
          if (v35 == 0.0)
          {
            v83 = 0;
            v36 = (id *)&v83;
            objc_msgSend(MEMORY[0x1E0D751E0], "sortedViableMergeCandidateTorsosFor:from:ignoreSourceAssetDimensions:matchScores:", v34, v78, 0, &v83);
          }
          else
          {
            v84 = 0;
            v36 = (id *)&v84;
            objc_msgSend(MEMORY[0x1E0D751E0], "sortedViableMergeCandidateFacesFor:from:ignoreSourceAssetDimensions:matchScores:", v34, v78, 0, &v84);
          }
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = *v36;
          if (objc_msgSend(v37, "count"))
          {
            v39 = 0;
            v81 = v37;
            do
            {
              objc_msgSend(v37, "objectAtIndex:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "objectAtIndexedSubscript:", v39);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "doubleValue");
              objc_msgSend(p_vtable + 492, "pairWithFace:andFace:distance:", v34, v40);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (v42)
              {
                if (objc_msgSend(v31, "count"))
                {
                  v43 = v38;
                  v44 = v34;
                  v45 = p_vtable;
                  v46 = objc_msgSend(v82, "indexOfObject:inSortedRange:options:usingComparator:", v41, 0, objc_msgSend(v82, "count"), 1024, &__block_literal_global_202_0);
                  objc_msgSend(v82, "insertObject:atIndex:", v41, v46);
                  v47 = v46;
                  p_vtable = v45;
                  v34 = v44;
                  v38 = v43;
                  v37 = v81;
                  objc_msgSend(v31, "insertObject:atIndex:", v42, v47);
                }
                else
                {
                  objc_msgSend(v31, "addObject:", v42);
                  objc_msgSend(v82, "addObject:", v41);
                }
              }

              ++v39;
            }
            while (v39 < objc_msgSend(v37, "count"));
          }

          v33 = v80 + 1;
        }
        while (v80 + 1 != v79);
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
      }
      while (v79);
    }

    ((void (**)(_QWORD, void *))v68)[2](v68, v31);
    objc_msgSend(v67, "addObjectsFromArray:", obj);

    v48 = v74;
  }
  else
  {
    objc_msgSend(v17, "addObjectsFromArray:", v16);
    v48 = v18;
  }
  v49 = objc_msgSend(v48, "count");
  if (v49)
  {
    v50 = v49 - 1;
    v51 = MEMORY[0x1E0C81028];
    v52 = &dword_1B6C4A000;
    v53 = "[VCPFaceMerger] Deleting manual face %@ with mismatched asset dimension (%ldx%ld)";
    while (1)
    {
      objc_msgSend(v74, "objectAtIndexedSubscript:", v50);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v54, "manual") & 1) == 0 && !objc_msgSend(v54, "algorithmVersion"))
        break;
      if (objc_msgSend(v54, "manual"))
      {
        if (objc_msgSend(v54, "sourceWidth") != a8 || objc_msgSend(v54, "sourceHeight") != a9)
        {
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v54, "gist");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v99 = v56;
            v100 = 2048;
            v101 = a8;
            v102 = 2048;
            v103 = a9;
            _os_log_impl(v52, v51, OS_LOG_TYPE_DEFAULT, v53, buf, 0x20u);

          }
          goto LABEL_54;
        }
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v54, "localIdentifier");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v99 = v55;
          _os_log_impl(v52, v51, OS_LOG_TYPE_DEBUG, "[VCPFaceMerger] Manual face %@; skip deletion", buf, 0xCu);

        }
LABEL_53:
        objc_msgSend(v74, "removeObjectAtIndex:", v50);
      }
LABEL_54:

      if (--v50 == -1)
        goto LABEL_55;
    }
    if (objc_msgSend(v54, "detectionType") != 1)
      goto LABEL_54;
    objc_msgSend(v54, "personLocalIdentifier");
    v57 = objc_claimAutoreleasedReturnValue();
    if (!v57)
      goto LABEL_54;
    v58 = (void *)v57;
    if (objc_msgSend(v54, "nameSource") == 1)
    {

    }
    else
    {
      v59 = v52;
      v60 = v53;
      v61 = objc_msgSend(v54, "nameSource");

      v62 = v61 == 3;
      v53 = v60;
      v52 = v59;
      if (!v62)
        goto LABEL_54;
    }
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v54, "localIdentifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v99 = v63;
      _os_log_impl(v52, v51, OS_LOG_TYPE_DEBUG, "[VCPFaceMerger] Face %@ with valid personIdentifier; reinstate as manual face",
        buf,
        0xCu);

    }
    objc_msgSend(v54, "setManual:", 1);
    objc_msgSend(v54, "setImageprintWrapper:", 0);
    objc_msgSend(v72, "addObject:", v54);
    goto LABEL_53;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v72)
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v72, CFSTR("FacesToPersist"));
  if (v74)
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v74, CFSTR("FacesToDelete"));

  return v65;
}

void __124__VCPFaceMerger_mergeExistingFaces_andDetectedFaces_withRequestHandler_orientedWidth_orientedHeight_assetWidth_assetHeight___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  __CFString *v18;
  double v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  const __CFString *v24;
  int v25;
  const __CFString *v26;
  void *v27;
  __int128 v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v31;
    *(_QWORD *)&v5 = 138412802;
    v28 = v5;
    v29 = v3;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v9, "face1", v28);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "face2");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v10, "detectionType");
        if ((_DWORD)v9 == objc_msgSend(v11, "detectionType"))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10)
            && objc_msgSend(*(id *)(a1 + 40), "containsObject:", v11))
          {
            objc_msgSend(v11, "replaceCoordinatesAndFeaturesFromDetectedFace:", v10);
            objc_msgSend(v10, "adjustmentVersion");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setAdjustmentVersion:", v12);

            objc_msgSend(v11, "setManual:", 0);
            objc_msgSend(v11, "imageprintWrapper");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              v14 = *(void **)(a1 + 48);
              objc_msgSend(v11, "imageprintWrapper");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "removeObject:", v15);

            }
            objc_msgSend(v10, "imageprintWrapper");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setImageprintWrapper:", v16);

            objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
            objc_msgSend(*(id *)(a1 + 40), "removeObject:", v11);
            objc_msgSend(*(id *)(a1 + 32), "removeObject:", v10);
            objc_msgSend(v10, "size");
            if (v17 == 0.0)
            {
              v18 = CFSTR("Torso");
            }
            else
            {
              objc_msgSend(v10, "bodyWidth");
              v18 = CFSTR("Face");
              if (v19 != 0.0)
                v18 = CFSTR("Facetorso");
            }
            v20 = v18;
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v10, "gist");
              v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "gist");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v28;
              v35 = v20;
              v36 = 2112;
              v37 = v21;
              v38 = 2112;
              v39 = v27;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPFaceMerger] Merged %@: detected %@ to existing %@", buf, 0x20u);

              v3 = v29;
LABEL_34:

            }
            goto LABEL_36;
          }
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "gist");
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "gist");
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v35 = v22;
            v36 = 2112;
            v37 = v23;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VCPFaceMerger] Failed to merge detected face %@ to existing face %@", buf, 0x16u);

            v3 = v29;
          }
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10))
              v24 = CFSTR("Yes");
            else
              v24 = CFSTR("No");
            v25 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v11);
            *(_DWORD *)buf = 138412546;
            if (v25)
              v26 = CFSTR("Yes");
            else
              v26 = CFSTR("No");
            v35 = v24;
            v3 = v29;
            v36 = 2112;
            v37 = v26;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VCPFaceMerger] [mutableDetectedFaces containsObject:detectedFace] %@ [facesToDelete containsObject:matchedExistingFace] %@ ", buf, 0x16u);
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "gist");
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "gist");
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v35 = v20;
          v36 = 2112;
          v37 = v21;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, " [VCPFaceMerger] Cannot Merge due to mismatched detection type:detected face: %@, existing face: %@", buf, 0x16u);
          goto LABEL_34;
        }
LABEL_36:

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v6);
  }

}

uint64_t __124__VCPFaceMerger_mergeExistingFaces_andDetectedFaces_withRequestHandler_orientedWidth_orientedHeight_assetWidth_assetHeight___block_invoke_201(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

@end
