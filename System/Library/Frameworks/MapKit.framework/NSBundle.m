@implementation NSBundle

void __38__NSBundle_MKAdditions___mapkitBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE2DAB8;
  qword_1ECE2DAB8 = v0;

}

@end
