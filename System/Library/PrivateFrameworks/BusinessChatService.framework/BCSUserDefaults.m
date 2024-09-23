@implementation BCSUserDefaults

+ (id)sharedDefaults
{
  void *v2;

  v2 = (void *)_MergedGlobals_34;
  if (!_MergedGlobals_34)
  {
    if (qword_253EC0A48 != -1)
      dispatch_once(&qword_253EC0A48, &__block_literal_global_2);
    v2 = (void *)_MergedGlobals_34;
  }
  return v2;
}

void __33__BCSUserDefaults_sharedDefaults__block_invoke()
{
  BCSUserDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(BCSUserDefaults);
  v1 = (void *)_MergedGlobals_34;
  _MergedGlobals_34 = (uint64_t)v0;

}

@end
