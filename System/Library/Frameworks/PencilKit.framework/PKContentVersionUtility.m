@implementation PKContentVersionUtility

+ (id)sharedUtility
{
  objc_opt_self();
  if (qword_1ECEE6218 != -1)
    dispatch_once(&qword_1ECEE6218, &__block_literal_global_39);
  return (id)qword_1ECEE6220;
}

void __40__PKContentVersionUtility_sharedUtility__block_invoke()
{
  PKContentVersionUtility *v0;
  void *v1;

  v0 = objc_alloc_init(PKContentVersionUtility);
  v1 = (void *)qword_1ECEE6220;
  qword_1ECEE6220 = (uint64_t)v0;

}

- (BOOL)programLinkedOnOrAfterDawnburst
{
  if (result)
  {
    if (qword_1ECEE6228 != -1)
      dispatch_once(&qword_1ECEE6228, &__block_literal_global_1);
    return _MergedGlobals_130 != 0;
  }
  return result;
}

uint64_t __58__PKContentVersionUtility_programLinkedOnOrAfterDawnburst__block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  _MergedGlobals_130 = result;
  return result;
}

- (BOOL)programLinkedOnOrAfterDawnburstE
{
  if (result)
  {
    if (qword_1ECEE6230 != -1)
      dispatch_once(&qword_1ECEE6230, &__block_literal_global_2);
    return byte_1ECEE6211 != 0;
  }
  return result;
}

uint64_t __59__PKContentVersionUtility_programLinkedOnOrAfterDawnburstE__block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  byte_1ECEE6211 = result;
  return result;
}

- (uint64_t)contentVersionForCurrentSDK
{
  if (result)
  {
    if (qword_1ECEE6230 != -1)
      dispatch_once(&qword_1ECEE6230, &__block_literal_global_2);
    if (byte_1ECEE6211 && (_os_feature_enabled_impl() & 1) != 0)
    {
      return 3;
    }
    else
    {
      if (qword_1ECEE6228 != -1)
        dispatch_once(&qword_1ECEE6228, &__block_literal_global_1);
      if (_MergedGlobals_130)
        return 2;
      else
        return 1;
    }
  }
  return result;
}

@end
