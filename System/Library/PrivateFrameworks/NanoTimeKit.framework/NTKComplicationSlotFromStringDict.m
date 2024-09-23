@implementation NTKComplicationSlotFromStringDict

void ___NTKComplicationSlotFromStringDict_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  _NTKStringFromComplicationSlotDict();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _DictionaryByReversingDictionary(v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKComplicationSlotFromStringDict_dictionary;
  _NTKComplicationSlotFromStringDict_dictionary = v0;

}

@end
