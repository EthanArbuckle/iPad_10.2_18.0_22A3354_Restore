@implementation BWInferenceSmartCameraCurrentVersion

uint64_t __BWInferenceSmartCameraCurrentVersion_block_invoke()
{
  _BOOL8 v0;
  uint64_t result;

  v0 = +[BWEspressoInferenceAdapter allowE5ForInferenceType:](BWEspressoInferenceAdapter, "allowE5ForInferenceType:", 101);
  result = (uint64_t)+[BWEspressoInferenceAdapter findAvailableVersion:defaultOverrideKey:versionLocator:e5Bundle:](BWEspressoInferenceAdapter, "findAvailableVersion:defaultOverrideKey:versionLocator:e5Bundle:", &unk_1E4A017A8, CFSTR("smart_camera_pipeline_version"), BWInferenceSmartCameraNetworkForVersion, v0);
  BWInferenceSmartCameraCurrentVersion_version = result;
  word_1ECFEA27C = WORD2(result);
  return result;
}

@end
