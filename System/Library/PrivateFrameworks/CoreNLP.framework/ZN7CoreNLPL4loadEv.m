@implementation ZN7CoreNLPL4loadEv

void *___ZN7CoreNLPL4loadEv_block_invoke(CoreNLP *a1)
{
  void *LinguisticData;
  void *v2;
  void *result;
  BOOL v4;
  char v5;

  LinguisticData = (void *)CoreNLP::loadLinguisticData(a1);
  v2 = LinguisticData;
  if (LinguisticData)
  {
    result = dlsym(LinguisticData, "LDEnumerateAssetDataItems");
    CoreNLP::_LDEnumerateAssetDataItems = (uint64_t (*)(_QWORD, _QWORD, _QWORD))result;
  }
  else
  {
    result = CoreNLP::_LDEnumerateAssetDataItems;
  }
  if (v2)
    v4 = result == 0;
  else
    v4 = 1;
  v5 = !v4;
  CoreNLP::isSoftlinked = v5;
  return result;
}

@end
