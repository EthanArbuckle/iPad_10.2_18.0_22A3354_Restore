@implementation HFForceNotAdministrator

id __HFForceNotAdministrator_block_invoke()
{
  if (qword_1ED3798D0 != -1)
    dispatch_once(&qword_1ED3798D0, &__block_literal_global_206_1);
  return (id)qword_1ED3798D8;
}

void __HFForceNotAdministrator_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HFPreferencesBooleanValueForKey(CFSTR("HFForceNotAdministrator")) == 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3798D8;
  qword_1ED3798D8 = v0;

}

@end
