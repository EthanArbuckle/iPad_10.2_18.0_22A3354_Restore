@implementation NTKWrappedNoneComplicationType

void __NTKWrappedNoneComplicationType_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKWrappedNoneComplicationType_none;
  NTKWrappedNoneComplicationType_none = v0;

}

@end
