@implementation HFForceRemoteAccessStateAvailable

void __HFForceRemoteAccessStateAvailable_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HFPreferencesBooleanValueForKey(CFSTR("HFForceRemoteAccessStateAvailable")) == 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3798C8;
  qword_1ED3798C8 = v0;

}

id __HFForceRemoteAccessStateAvailable_block_invoke()
{
  if (_MergedGlobals_288 != -1)
    dispatch_once(&_MergedGlobals_288, &__block_literal_global_204_0);
  return (id)qword_1ED3798C8;
}

@end
