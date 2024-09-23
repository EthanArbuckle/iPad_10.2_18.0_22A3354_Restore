@implementation NTKComplicationTypeFromStringDict

void ___NTKComplicationTypeFromStringDict_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  _NTKStringFromComplicationTypeDict();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _DictionaryByReversingDictionary(v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKComplicationTypeFromStringDict_dictionary;
  _NTKComplicationTypeFromStringDict_dictionary = v0;

}

@end
