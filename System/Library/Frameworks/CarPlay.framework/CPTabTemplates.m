@implementation CPTabTemplates

void __CPTabTemplates_block_invoke()
{
  int HasAudioEntitlement;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  HasAudioEntitlement = CPCurrentProcessHasAudioEntitlement();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  if (HasAudioEntitlement)
  {
    objc_msgSend(v1, "setWithObjects:", v2, v3, 0, v7, v8);
  }
  else
  {
    v4 = objc_opt_class();
    objc_msgSend(v1, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  }
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)CPTabTemplates_classes;
  CPTabTemplates_classes = v5;

}

@end
