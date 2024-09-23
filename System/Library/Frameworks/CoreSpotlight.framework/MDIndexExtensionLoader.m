@implementation MDIndexExtensionLoader

void __43___MDIndexExtensionLoader__matchDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB2A28];
  v3[0] = &unk_1E242F9A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_matchDictionary_sMatchDictionary;
  _matchDictionary_sMatchDictionary = v0;

}

@end
