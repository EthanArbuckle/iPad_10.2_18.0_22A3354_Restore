@implementation FigDisplayedVitalityClassifierLoadModel

_DWORD *__FigDisplayedVitalityClassifierLoadModel_block_invoke()
{
  uint64_t v0;
  _DWORD *result;
  uint64_t v2;

  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CMCapture")), "URLForResource:withExtension:", CFSTR("DisplayedVitalityForest"), CFSTR("plist"));
  v2 = 0;
  result = (_DWORD *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v0, &v2);
  if (result)
  {
    result = fdvc_buildForest(result);
    FigDisplayedVitalityClassifierLoadModel_aForestClassifier = (uint64_t)result;
  }
  return result;
}

@end
