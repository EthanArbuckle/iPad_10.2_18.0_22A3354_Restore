@implementation PHMediaProcessingAlgorithmVersionProvider

void __102__PHMediaProcessingAlgorithmVersionProvider_MediaAnalysis__mad_sharedVersionProviderWithPhotoLibrary___block_invoke(uint64_t a1)
{
  int64_t v2;
  id v3;
  __int16 v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;

  v2 = +[VCPVideoCaptionAnalyzer mode](VCPVideoCaptionAnalyzer, "mode");
  v3 = objc_alloc(*(Class *)(a1 + 40));
  v4 = VCPPhotosSceneProcessingVersionInternal();
  v5 = objc_msgSend(*(id *)(a1 + 32), "mad_faceProcessingInternalVersion");
  v6 = VCPPhotosVisualSearchAlgorithmVersion();
  if (v2 == 1)
    v7 = VCPPhotosCaptionProcessingVersion;
  else
    v7 = 0;
  HIWORD(v11) = v7;
  LOWORD(v11) = 69;
  LOWORD(v10) = VCPPhotosPECProcessingVersion;
  v8 = objc_msgSend(v3, "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", v4, v5, (__int16)VCPPhotosOCRProcessingVersion, v6, 1, v10, 69, v11);
  v9 = (void *)mad_sharedVersionProviderWithPhotoLibrary__instance;
  mad_sharedVersionProviderWithPhotoLibrary__instance = v8;

}

@end
