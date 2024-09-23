@implementation NSPredicate(MediaAnalysis)

+ (id)vcp_imagesPredicate:()MediaAnalysis
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 0);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mediaType == %d"), 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)vcp_stillImagesPredicate:()MediaAnalysis
{
  uint64_t v4;

  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d && kindSubtype != %d"), 0, 2, v4);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mediaType == %d && !((mediaSubtype & %d) == %d)"), 1, 8, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)vcp_livePhotosPredicate:()MediaAnalysis
{
  uint64_t v4;

  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype == %d"), 2, v4);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mediaSubtype & %d) == %d"), 8, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)vcp_nonPanoPredicate:()MediaAnalysis
{
  uint64_t v4;

  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype != %d"), 1, v4);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("!((mediaSubtype & %d) == %d)"), 1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)vcp_moviesPredicate:()MediaAnalysis
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 1);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mediaType == %d"), 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)vcp_fullAnalysisPredatesVersionInternalPredicate:()MediaAnalysis
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mediaAnalysisAttributes.mediaAnalysisVersion < %d"), a3);
}

+ (uint64_t)mad_prioritizedAssetsForFaceDetectionInternalPredicate
{
  void *v0;
  float v1;

  v0 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CD1398], "mad_peopleThreshold");
  return objc_msgSend(v0, "predicateWithFormat:", CFSTR("kindSubtype != %d && SUBQUERY(additionalAttributes.sceneClassifications, $s, $s.sceneIdentifier = %d AND $s.confidence > %f).@count > 0"), 1, 881, v1);
}

+ (uint64_t)mad_nonPrioritizedAssetsForFaceDetectionInternalPredicate
{
  void *v0;
  float v1;

  v0 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CD1398], "mad_peopleThreshold");
  return objc_msgSend(v0, "predicateWithFormat:", CFSTR("kindSubtype != %d && SUBQUERY(additionalAttributes.sceneClassifications, $s, $s.sceneIdentifier = %d AND $s.confidence > %f).@count = 0"), 1, 881, v1);
}

+ (id)mad_internalPredicateForTaskID:()MediaAnalysis
{
  void *v3;

  if (a3 == 12)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 0);
  }
  else
  {
    if (a3 != 10)
    {
      v3 = 0;
      return v3;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype != %d"), 1);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

+ (id)mad_internalPredicateWithPriority:()MediaAnalysis forTaskID:
{
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v5 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (a4 == 10)
  {
    if (a3 == 2)
    {
      v11 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CD1398], "vcp_ocrGatingThreshold");
      objc_msgSend(v11, "predicateWithFormat:", CFSTR("SUBQUERY(additionalAttributes.sceneClassifications, $s, $s.sceneIdentifier = %d AND $s.confidence >= %f).@count = 0"), 2147482063, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    if (a3 == 1)
    {
      v7 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CD1398], "vcp_ocrGatingThreshold");
      objc_msgSend(v7, "predicateWithFormat:", CFSTR("SUBQUERY(additionalAttributes.sceneClassifications, $s, $s.sceneIdentifier = %d AND $s.confidence >= %f).@count > 0"), 2147482063, v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
  }
  else if (a4 == 3)
  {
    switch(a3)
    {
      case 3:
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype == %d"), 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB3880], "mad_nonPrioritizedAssetsForFaceDetectionInternalPredicate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      case 1:
        objc_msgSend(MEMORY[0x1E0CB3880], "mad_prioritizedAssetsForFaceDetectionInternalPredicate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    VCPTaskIDDescription(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v9;
    v15 = 1024;
    v16 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Predicate requested for unsupported task (%@) & priority (%d)", buf, 0x12u);

  }
  v6 = 0;
  return v6;
}

+ (id)mad_internalPredicateNeedsProcessingForTaskID:()MediaAnalysis
{
  void *v4;
  void *v5;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 > 9)
  {
    if (a3 == 10)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mediaAnalysisAttributes.characterRecognitionAttributes = NULL || mediaAnalysisAttributes.characterRecognitionAttributes.algorithmVersion != %d || adjustmentTimestamp != mediaAnalysisAttributes.characterRecognitionAttributes.adjustmentVersion"), 8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    if (a3 == 12)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mediaAnalysisAttributes.visualSearchAttributes = NULL || mediaAnalysisAttributes.visualSearchAttributes.algorithmVersion != %d || mediaAnalysisAttributes.visualSearchAttributes.stickerConfidenceAlgorithmVersion != %d ||adjustmentTimestamp != mediaAnalysisAttributes.visualSearchAttributes.adjustmentVersion"), VCPPhotosVisualSearchAlgorithmVersion(), 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
  }
  else
  {
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("additionalAttributes.sceneAnalysisVersion != %d || adjustmentTimestamp != additionalAttributes.sceneAnalysisTimestamp"), VCPPhotosSceneProcessingVersionInternal());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    if (a3 == 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("adjustmentTimestamp != faceAdjustmentVersion"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    VCPTaskIDDescription(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Predicate requested for unsupported task (%@)", buf, 0xCu);

  }
  v4 = 0;
  return v4;
}

@end
