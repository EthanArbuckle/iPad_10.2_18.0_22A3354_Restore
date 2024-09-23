@implementation PHMediaProcessingAlgorithmVersionProvider(MediaAnalysis)

+ (id)mad_sharedVersionProviderWithPhotoLibrary:()MediaAnalysis
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __102__PHMediaProcessingAlgorithmVersionProvider_MediaAnalysis__mad_sharedVersionProviderWithPhotoLibrary___block_invoke;
  v9[3] = &unk_1E6B199E8;
  v10 = v4;
  v11 = a1;
  v5 = mad_sharedVersionProviderWithPhotoLibrary__once;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&mad_sharedVersionProviderWithPhotoLibrary__once, v9);
  v7 = (id)mad_sharedVersionProviderWithPhotoLibrary__instance;

  return v7;
}

@end
