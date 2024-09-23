@implementation FIUIDateOfBirthDisplayString

uint64_t __FIUIDateOfBirthDisplayString_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)FIUIDateOfBirthDisplayString___birthdayDateFormatter;
  FIUIDateOfBirthDisplayString___birthdayDateFormatter = (uint64_t)v0;

  objc_msgSend((id)FIUIDateOfBirthDisplayString___birthdayDateFormatter, "setTimeStyle:", 0);
  return objc_msgSend((id)FIUIDateOfBirthDisplayString___birthdayDateFormatter, "setDateStyle:", 2);
}

@end
