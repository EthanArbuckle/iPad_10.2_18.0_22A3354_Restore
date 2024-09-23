@implementation NTKFaceStyleFromStringDict

void ___NTKFaceStyleFromStringDict_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  _NTKStringFromFaceStyleDict();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _DictionaryByReversingDictionary(v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKFaceStyleFromStringDict_dictionary;
  _NTKFaceStyleFromStringDict_dictionary = v0;

}

@end
