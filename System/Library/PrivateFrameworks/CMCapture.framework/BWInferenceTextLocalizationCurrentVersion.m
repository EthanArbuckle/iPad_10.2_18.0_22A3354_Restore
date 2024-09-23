@implementation BWInferenceTextLocalizationCurrentVersion

uint64_t __BWInferenceTextLocalizationCurrentVersion_block_invoke()
{
  _BOOL8 v0;
  uint64_t result;

  v0 = +[BWEspressoInferenceAdapter allowE5ForInferenceType:](BWEspressoInferenceAdapter, "allowE5ForInferenceType:", 116);
  result = (uint64_t)+[BWEspressoInferenceAdapter findAvailableVersion:defaultOverrideKey:versionLocator:e5Bundle:](BWEspressoInferenceAdapter, "findAvailableVersion:defaultOverrideKey:versionLocator:e5Bundle:", &unk_1E4A002C0, CFSTR("text_localization_version"), BWInferenceTextLocalizationNetworkForVersion, v0);
  BWInferenceTextLocalizationCurrentVersion_version = result;
  word_1EE6BF56C = WORD2(result);
  return result;
}

@end
