@implementation HFHideQuickControls

void __HFHideQuickControls_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HFPreferencesBooleanValueForKey(CFSTR("hideQuickControls")) == 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3798F8;
  qword_1ED3798F8 = v0;

}

@end
