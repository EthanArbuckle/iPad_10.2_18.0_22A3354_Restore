@implementation VSGetErrorStringsForType

void __VSGetErrorStringsForType_block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = &unk_1E93CC5A0;
  if (VSSubscriptionErrorStrings_onceToken != -1)
    dispatch_once(&VSSubscriptionErrorStrings_onceToken, &__block_literal_global_47);
  v6[1] = &unk_1E93CC5B8;
  v7[0] = VSSubscriptionErrorStrings_errorStrings;
  v0 = VSUserAccountErrorStrings_onceToken;
  v1 = (id)VSSubscriptionErrorStrings_errorStrings;
  if (v0 != -1)
    dispatch_once(&VSUserAccountErrorStrings_onceToken, &__block_literal_global_70);
  v7[1] = VSUserAccountErrorStrings_errorStrings;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = (id)VSUserAccountErrorStrings_errorStrings;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)VSGetErrorStringsForType_errorStringMaps;
  VSGetErrorStringsForType_errorStringMaps = v4;

}

@end
