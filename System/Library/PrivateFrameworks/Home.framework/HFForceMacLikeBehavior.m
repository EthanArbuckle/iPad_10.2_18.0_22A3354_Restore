@implementation HFForceMacLikeBehavior

id __HFForceMacLikeBehavior_block_invoke()
{
  if (qword_1ED379900 != -1)
    dispatch_once(&qword_1ED379900, &__block_literal_global_212);
  return (id)qword_1ED379908;
}

void __HFForceMacLikeBehavior_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HFPreferencesBooleanValueForKey(CFSTR("HFHelloImAMacKey")) == 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379908;
  qword_1ED379908 = v0;

}

@end
