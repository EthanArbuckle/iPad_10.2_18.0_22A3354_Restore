@implementation NTKDateStyleFromStringDict

void ___NTKDateStyleFromStringDict_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  _NTKStringFromDateStyleDict();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _DictionaryByReversingDictionary(v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKDateStyleFromStringDict_dictionary;
  _NTKDateStyleFromStringDict_dictionary = v0;

}

@end
