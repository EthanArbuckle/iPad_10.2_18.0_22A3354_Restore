@implementation CKSpellingSubstitutionsDefaults

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_40);
  return (id)sharedInstance_sInstance_0;
}

void __49__CKSpellingSubstitutionsDefaults_sharedInstance__block_invoke()
{
  CKSpellingSubstitutionsDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(CKSpellingSubstitutionsDefaults);
  v1 = (void *)sharedInstance_sInstance_0;
  sharedInstance_sInstance_0 = (uint64_t)v0;

}

@end
