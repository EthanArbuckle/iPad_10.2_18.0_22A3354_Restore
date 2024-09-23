@implementation NTKEditModeFromStringDict

void ___NTKEditModeFromStringDict_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  _NTKStringFromEditModeDict();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _DictionaryByReversingDictionary(v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKEditModeFromStringDict_dictionary;
  _NTKEditModeFromStringDict_dictionary = v0;

}

@end
