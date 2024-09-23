@implementation HUHomeUIBundle

void __HUHomeUIBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED580AC8;
  qword_1ED580AC8 = v0;

}

@end
