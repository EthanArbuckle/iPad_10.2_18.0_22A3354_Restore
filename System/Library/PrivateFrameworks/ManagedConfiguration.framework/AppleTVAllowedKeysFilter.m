@implementation AppleTVAllowedKeysFilter

void ___AppleTVAllowedKeysFilter_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99D80];
  MCGetBaseResourcePath();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("AppleTVRestrictionPayloadKeysFilter.plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfFile:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_AppleTVAllowedKeysFilter_dict;
  _AppleTVAllowedKeysFilter_dict = v2;

}

@end
