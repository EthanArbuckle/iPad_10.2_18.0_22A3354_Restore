@implementation CARDatePreferenceDescription

uint64_t __CARDatePreferenceDescription_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)CARDatePreferenceDescription__formatter;
  CARDatePreferenceDescription__formatter = (uint64_t)v0;

  objc_msgSend((id)CARDatePreferenceDescription__formatter, "setDateStyle:", 1);
  return objc_msgSend((id)CARDatePreferenceDescription__formatter, "setTimeStyle:", 0);
}

@end
