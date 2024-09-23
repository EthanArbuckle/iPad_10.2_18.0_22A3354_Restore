@implementation MADProtoFaceAsset

+ (id)protoFromPhotosAsset:(id)a3
{
  id v3;
  MADProtoFaceAsset *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  MADProtoFaceAsset *v26;
  void *v27;
  id v29;
  _QWORD v30[3];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MADProtoFaceAsset);
  objc_msgSend(v3, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoFaceAsset setAssetLocalIdentifier:](v4, "setAssetLocalIdentifier:", v5);

  objc_msgSend(v3, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v6, "mad_cloudIdentifierForLocalIdentifier:error:", v7, &v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v29;
  -[MADProtoFaceAsset setAssetCloudIdentifier:](v4, "setAssetCloudIdentifier:", v8);

  -[MADProtoFaceAsset assetCloudIdentifier](v4, "assetCloudIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v3, "adjustmentTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    -[MADProtoFaceAsset setAssetAdjustmentTimestamp:](v4, "setAssetAdjustmentTimestamp:");

    -[MADProtoFaceAsset setAlgorithmVersion:](v4, "setAlgorithmVersion:", objc_msgSend(v3, "faceAnalysisVersion"));
    objc_msgSend(v3, "faceAdjustmentVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    -[MADProtoFaceAsset setAdjustmentVersion:](v4, "setAdjustmentVersion:");

    objc_msgSend(v3, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mad_allFacesFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *MEMORY[0x1E0CD1B68];
    v30[0] = *MEMORY[0x1E0CD1B70];
    v30[1] = v15;
    v30[2] = *MEMORY[0x1E0CD1B58];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFetchPropertySets:", v16);

    objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:", v3, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      v19 = 0;
      do
      {
        v20 = (void *)MEMORY[0x1BCCA1B2C]();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[MADProtoDetectedFace protoFromPhotosFace:](MADProtoDetectedFace, "protoFromPhotosFace:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v22);

        objc_autoreleasePoolPop(v20);
        ++v19;
      }
      while (v19 < objc_msgSend(v17, "count"));
    }
    -[MADProtoFaceAsset setValue:forKey:](v4, "setValue:forKey:", v18, CFSTR("detectedFaces"));
    if ((int)MediaAnalysisLogLevel() > 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "localIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADProtoFaceAsset detectedFaces](v4, "detectedFaces");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");
      *(_DWORD *)buf = 138412546;
      v32 = v23;
      v33 = 1024;
      LODWORD(v34) = v25;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Backed up %d faces", buf, 0x12u);

    }
    v26 = v4;

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "localIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v27;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to fetch asset cloud identifier: %@", buf, 0x16u);

    }
    v26 = 0;
  }

  return v26;
}

- (void)persistToPhotosAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  int v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  int v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  MADProtoFaceAsset *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v79;
  void *context;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  _BYTE v89[24];
  _QWORD v90[5];

  v90[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD13A8], "changeRequestForAsset:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADProtoFaceAsset detectedFaces](self, "detectedFaces");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v87 = v6;
    v88 = 1024;
    *(_DWORD *)v89 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Restoring %d faces", buf, 0x12u);

  }
  -[MADProtoFaceAsset detectedFaces](self, "detectedFaces");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
LABEL_54:
    v62 = (void *)MEMORY[0x1E0C99D68];
    -[MADProtoFaceAsset adjustmentVersion](self, "adjustmentVersion");
    objc_msgSend(v62, "dateWithTimeIntervalSinceReferenceDate:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFaceAdjustmentVersion:", v63);

    objc_msgSend(v5, "setFaceAnalysisVersion:", (__int16)-[MADProtoFaceAsset algorithmVersion](self, "algorithmVersion"));
    if (objc_msgSend(v4, "mad_isEligibleForComputeSync"))
    {
      v64 = objc_msgSend(v5, "faceAnalysisVersion");
      objc_msgSend(v4, "photoLibrary");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "mad_faceProcessingInternalVersion");

      if (v66 == v64)
        objc_msgSend(v5, "setAssetAnalysisStage:", objc_msgSend(v4, "mad_analysisStageAfterCompletingAnalysis:", 3));
    }
    goto LABEL_63;
  }
  v10 = 0;
  v77 = *MEMORY[0x1E0CD1B70];
  v76 = *MEMORY[0x1E0CD1B68];
  v75 = *MEMORY[0x1E0CD1B58];
  v78 = v4;
  v72 = v5;
  v74 = self;
  while (1)
  {
    v11 = (void *)MEMORY[0x1BCCA1B2C]();
    -[MADProtoFaceAsset detectedFaces](self, "detectedFaces");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "vcpPhotosFace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mad_allFacesFetchOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v90[0] = v77;
    v90[1] = v76;
    v90[2] = v75;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFetchPropertySets:", v17);

    objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:", v4, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    context = v11;
    v81 = v18;
    if (!objc_msgSend(v18, "count"))
      break;
    +[VCPPhotosFace facesFromPHFetchResult:copyOption:](VCPPhotosFace, "facesFromPHFetchResult:copyOption:", v18, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "size");
    v21 = v20;
    v22 = MediaAnalysisLogLevel();
    if (v21 == 0.0)
    {
      if (v22 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "localIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "gist");
        v33 = v19;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v87 = v32;
        v88 = 2112;
        *(_QWORD *)v89 = v34;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Face not present in restored face (%@), finding matching torso", buf, 0x16u);

        v19 = v33;
      }
      v82 = 0;
      v26 = (id *)&v82;
      objc_msgSend(MEMORY[0x1E0D751E0], "sortedViableMergeCandidateTorsosFor:from:ignoreSourceAssetDimensions:matchScores:", v14, v19, 0, &v82);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v22 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "localIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "gist");
        v24 = v19;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v87 = v23;
        v88 = 2112;
        *(_QWORD *)v89 = v25;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Face present in restored face (%@), finding matching face", buf, 0x16u);

        v19 = v24;
      }
      v83 = 0;
      v26 = (id *)&v83;
      objc_msgSend(MEMORY[0x1E0D751E0], "sortedViableMergeCandidateFacesFor:from:ignoreSourceAssetDimensions:matchScores:", v14, v19, 0, &v83);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v35 = (void *)v27;
    v79 = *v26;
    if (objc_msgSend(v35, "count"))
    {
      v73 = v19;
      if (objc_msgSend(v35, "count"))
      {
        v36 = 0;
        while (1)
        {
          objc_msgSend(v35, "objectAtIndexedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v14, "detectionType");
          v39 = objc_msgSend(v37, "detectionType");
          v40 = MediaAnalysisLogLevel();
          if (v38 == v39)
            break;
          if (v40 >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v4, "localIdentifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "gist");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "gist");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v87 = v41;
            v88 = 2112;
            *(_QWORD *)v89 = v42;
            *(_WORD *)&v89[8] = 2112;
            *(_QWORD *)&v89[10] = v43;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, " [%@] Mismatching detection type for detected face (%@) and existing face (%@), skip merging", buf, 0x20u);

            v4 = v78;
          }

          if (++v36 >= (unint64_t)objc_msgSend(v35, "count"))
            goto LABEL_29;
        }
        if (v40 >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "localIdentifier");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v35, "count");
          objc_msgSend(v37, "gist");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "objectAtIndexedSubscript:", v36);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v87 = v71;
          v88 = 1024;
          *(_DWORD *)v89 = v69;
          *(_WORD *)&v89[4] = 2112;
          *(_QWORD *)&v89[6] = v60;
          *(_WORD *)&v89[14] = 2112;
          *(_QWORD *)&v89[16] = v61;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] %d viable merge candidates, merging with the most matching one (%@, distanceScore: %@)", buf, 0x26u);

        }
      }
      else
      {
LABEL_29:
        v37 = 0;
      }
      +[VCPFaceUtils phFaceFromVCPPhotosFace:withFetchOptions:](VCPFaceUtils, "phFaceFromVCPPhotosFace:withFetchOptions:", v37, v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v31 == 0;
      v45 = MediaAnalysisLogLevel();
      if (v31)
      {
        if (v45 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "localIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "gist");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "gist");
          v47 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v87 = v46;
          v88 = 2112;
          *(_QWORD *)v89 = v70;
          *(_WORD *)&v89[8] = 2112;
          *(_QWORD *)&v89[10] = v47;
          v48 = (void *)v47;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Merging restored face (%@) with existing face (%@)", buf, 0x20u);

          v4 = v78;
        }
        objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", v31);
        v49 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v45 >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "localIdentifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "gist");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v87 = v53;
          v88 = 2112;
          *(_QWORD *)v89 = v54;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to find matching PHFace (%@), creating new face for restored face", buf, 0x16u);

          v4 = v78;
        }
        objc_msgSend(MEMORY[0x1E0CD1530], "creationRequestForFace");
        v49 = objc_claimAutoreleasedReturnValue();
      }
      v30 = (void *)v49;

      v19 = v73;
    }
    else
    {
      v50 = MediaAnalysisLogLevel();
      v51 = MEMORY[0x1E0C81028];
      if (v50 >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "localIdentifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v87 = v52;
        _os_log_impl(&dword_1B6C4A000, v51, OS_LOG_TYPE_ERROR, "[%@] No viable merge candidate, creating new face for restored face", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CD1530], "creationRequestForFace");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v44 = 1;
    }

    if (!v30)
    {
      v5 = v72;
      v11 = context;
      goto LABEL_59;
    }
    +[VCPFaceUtils assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:](VCPFaceUtils, "assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:", v14, v30);
    if (!v44)
    {
      v84 = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v72;
      objc_msgSend(v72, "addFaces:", v57);

      objc_msgSend(v30, "setClusterSequenceNumber:", 0);
      objc_msgSend(v30, "setVuObservationID:", 0);
      goto LABEL_49;
    }
    v5 = v72;
LABEL_47:
    objc_msgSend(v30, "placeholderForCreatedFace");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addFaces:", v56);

LABEL_49:
    objc_autoreleasePoolPop(context);
    ++v10;
    self = v74;
    -[MADProtoFaceAsset detectedFaces](v74, "detectedFaces");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "count");

    if (v10 >= v59)
      goto LABEL_54;
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "localIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v87 = v28;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] No existing face, creating new face for restored face", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CD1530], "creationRequestForFace");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    +[VCPFaceUtils assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:](VCPFaceUtils, "assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:", v14, v29);
    v31 = 0;
    goto LABEL_47;
  }
  v31 = 0;
LABEL_59:
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "localIdentifier");
    v67 = v11;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v87 = v68;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to create PHFaceChangeRequest; skipping",
      buf,
      0xCu);

    v11 = v67;
  }

  objc_autoreleasePoolPop(v11);
LABEL_63:

}

- (BOOL)hasAssetLocalIdentifier
{
  return self->_assetLocalIdentifier != 0;
}

- (BOOL)hasAssetCloudIdentifier
{
  return self->_assetCloudIdentifier != 0;
}

- (void)setAssetAdjustmentTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_assetAdjustmentTimestamp = a3;
}

- (void)setHasAssetAdjustmentTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAssetAdjustmentTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAlgorithmVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_algorithmVersion = a3;
}

- (void)setHasAlgorithmVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAlgorithmVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAdjustmentVersion:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_adjustmentVersion = a3;
}

- (void)setHasAdjustmentVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdjustmentVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearDetectedFaces
{
  -[NSMutableArray removeAllObjects](self->_detectedFaces, "removeAllObjects");
}

- (void)addDetectedFaces:(id)a3
{
  id v4;
  NSMutableArray *detectedFaces;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  detectedFaces = self->_detectedFaces;
  v8 = v4;
  if (!detectedFaces)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_detectedFaces;
    self->_detectedFaces = v6;

    v4 = v8;
    detectedFaces = self->_detectedFaces;
  }
  -[NSMutableArray addObject:](detectedFaces, "addObject:", v4);

}

- (unint64_t)detectedFacesCount
{
  return -[NSMutableArray count](self->_detectedFaces, "count");
}

- (id)detectedFacesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_detectedFaces, "objectAtIndex:", a3);
}

+ (Class)detectedFacesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MADProtoFaceAsset;
  -[MADProtoFaceAsset description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoFaceAsset dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *assetLocalIdentifier;
  NSString *assetCloudIdentifier;
  char has;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  assetLocalIdentifier = self->_assetLocalIdentifier;
  if (assetLocalIdentifier)
    objc_msgSend(v3, "setObject:forKey:", assetLocalIdentifier, CFSTR("assetLocalIdentifier"));
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if (assetCloudIdentifier)
    objc_msgSend(v4, "setObject:forKey:", assetCloudIdentifier, CFSTR("assetCloudIdentifier"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_assetAdjustmentTimestamp);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("assetAdjustmentTimestamp"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_algorithmVersion);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("algorithmVersion"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_adjustmentVersion);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("adjustmentVersion"));

  }
LABEL_9:
  if (-[NSMutableArray count](self->_detectedFaces, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_detectedFaces, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = self->_detectedFaces;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("detectedFaces"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MADProtoFaceAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_assetLocalIdentifier)
    PBDataWriterWriteStringField();
  if (self->_assetCloudIdentifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_8:
    PBDataWriterWriteDoubleField();
LABEL_9:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_detectedFaces;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_assetLocalIdentifier)
  {
    objc_msgSend(v4, "setAssetLocalIdentifier:");
    v4 = v10;
  }
  if (self->_assetCloudIdentifier)
  {
    objc_msgSend(v10, "setAssetCloudIdentifier:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_15:
    *((_DWORD *)v4 + 6) = self->_algorithmVersion;
    *((_BYTE *)v4 + 56) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_assetAdjustmentTimestamp;
  *((_BYTE *)v4 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_adjustmentVersion;
    *((_BYTE *)v4 + 56) |= 1u;
  }
LABEL_9:
  if (-[MADProtoFaceAsset detectedFacesCount](self, "detectedFacesCount"))
  {
    objc_msgSend(v10, "clearDetectedFaces");
    v6 = -[MADProtoFaceAsset detectedFacesCount](self, "detectedFacesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[MADProtoFaceAsset detectedFacesAtIndex:](self, "detectedFacesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addDetectedFaces:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_assetLocalIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_assetCloudIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_assetAdjustmentTimestamp;
    *(_BYTE *)(v5 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_algorithmVersion;
  *(_BYTE *)(v5 + 56) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_adjustmentVersion;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
LABEL_5:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_detectedFaces;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addDetectedFaces:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *assetLocalIdentifier;
  NSString *assetCloudIdentifier;
  NSMutableArray *detectedFaces;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  assetLocalIdentifier = self->_assetLocalIdentifier;
  if ((unint64_t)assetLocalIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](assetLocalIdentifier, "isEqual:"))
      goto LABEL_23;
  }
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if ((unint64_t)assetCloudIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](assetCloudIdentifier, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_assetAdjustmentTimestamp != *((double *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_23:
    v8 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_algorithmVersion != *((_DWORD *)v4 + 6))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_adjustmentVersion != *((double *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_23;
  }
  detectedFaces = self->_detectedFaces;
  if ((unint64_t)detectedFaces | *((_QWORD *)v4 + 6))
    v8 = -[NSMutableArray isEqual:](detectedFaces, "isEqual:");
  else
    v8 = 1;
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double assetAdjustmentTimestamp;
  double v8;
  long double v9;
  double v10;
  uint64_t v11;
  double adjustmentVersion;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;

  v3 = -[NSString hash](self->_assetLocalIdentifier, "hash");
  v4 = -[NSString hash](self->_assetCloudIdentifier, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    assetAdjustmentTimestamp = self->_assetAdjustmentTimestamp;
    v8 = -assetAdjustmentTimestamp;
    if (assetAdjustmentTimestamp >= 0.0)
      v8 = self->_assetAdjustmentTimestamp;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 4) != 0)
  {
    v11 = 2654435761 * self->_algorithmVersion;
    if ((has & 1) != 0)
      goto LABEL_11;
LABEL_16:
    v16 = 0;
    return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ -[NSMutableArray hash](self->_detectedFaces, "hash");
  }
  v11 = 0;
  if ((has & 1) == 0)
    goto LABEL_16;
LABEL_11:
  adjustmentVersion = self->_adjustmentVersion;
  v13 = -adjustmentVersion;
  if (adjustmentVersion >= 0.0)
    v13 = self->_adjustmentVersion;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0)
      v16 += (unint64_t)v15;
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ -[NSMutableArray hash](self->_detectedFaces, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[MADProtoFaceAsset setAssetLocalIdentifier:](self, "setAssetLocalIdentifier:");
  if (*((_QWORD *)v4 + 4))
    -[MADProtoFaceAsset setAssetCloudIdentifier:](self, "setAssetCloudIdentifier:");
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_assetAdjustmentTimestamp = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 56);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_algorithmVersion = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_8:
    self->_adjustmentVersion = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_9:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[MADProtoFaceAsset addDetectedFaces:](self, "addDetectedFaces:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (void)setAssetLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetLocalIdentifier, a3);
}

- (NSString)assetCloudIdentifier
{
  return self->_assetCloudIdentifier;
}

- (void)setAssetCloudIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetCloudIdentifier, a3);
}

- (double)assetAdjustmentTimestamp
{
  return self->_assetAdjustmentTimestamp;
}

- (int)algorithmVersion
{
  return self->_algorithmVersion;
}

- (double)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (NSMutableArray)detectedFaces
{
  return self->_detectedFaces;
}

- (void)setDetectedFaces:(id)a3
{
  objc_storeStrong((id *)&self->_detectedFaces, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedFaces, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetCloudIdentifier, 0);
}

@end
