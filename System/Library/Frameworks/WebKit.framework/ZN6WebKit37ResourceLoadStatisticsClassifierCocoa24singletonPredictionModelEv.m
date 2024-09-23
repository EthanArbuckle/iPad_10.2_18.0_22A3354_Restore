@implementation ZN6WebKit37ResourceLoadStatisticsClassifierCocoa24singletonPredictionModelEv

WTF::StringImpl *___ZN6WebKit37ResourceLoadStatisticsClassifierCocoa24singletonPredictionModelEv_block_invoke()
{
  WTF::StringImpl *v0;
  WTF::StringImpl *result;
  WTF *v2;
  WTF::StringImpl *v3;

  WebKit::ResourceLoadStatisticsClassifierCocoa::storagePath((WebKit::ResourceLoadStatisticsClassifierCocoa *)&v3);
  result = v3;
  if (v3)
  {
    if (!*((_DWORD *)v3 + 1))
    {
      v3 = 0;
LABEL_9:
      if (*(_DWORD *)result == 2)
        return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v0);
      *(_DWORD *)result -= 2;
      return result;
    }
    WTF::String::utf8();
    qword_1ECE72B28 = svm_load_model();
    _MergedGlobals_78 = 1;
    if (v2)
    {
      if (*(_DWORD *)v2 == 1)
        WTF::fastFree(v2, v0);
      else
        --*(_DWORD *)v2;
    }
    result = v3;
    v3 = 0;
    if (result)
      goto LABEL_9;
  }
  return result;
}

@end
