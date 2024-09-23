@implementation NTKWrappedDateComplicationType

void __NTKWrappedDateComplicationType_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKWrappedDateComplicationType_date;
  NTKWrappedDateComplicationType_date = v0;

}

@end
