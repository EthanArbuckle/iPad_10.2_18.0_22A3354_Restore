@implementation HFForceNonInternalInstallBehavior

void __HFForceNonInternalInstallBehavior_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HFPreferencesBooleanValueForKey(CFSTR("HFForceNonInternalInstallBehavior")) == 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3798E8;
  qword_1ED3798E8 = v0;

}

id __HFForceNonInternalInstallBehavior_block_invoke()
{
  if (qword_1ED3798E0 != -1)
    dispatch_once(&qword_1ED3798E0, &__block_literal_global_208_0);
  return (id)qword_1ED3798E8;
}

@end
