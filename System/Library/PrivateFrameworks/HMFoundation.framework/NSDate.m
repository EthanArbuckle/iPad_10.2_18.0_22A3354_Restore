@implementation NSDate

uint64_t __48__NSDate_HMFoundation__hmf_localTimeDescription__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)qword_1ED013218;
  qword_1ED013218 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED013218, "setFormatOptions:", 3059);
}

@end
