@implementation NSBundle

void __43__NSBundle_VSAdditions__vs_frameworkBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vs_frameworkBundle___vs_lazy_init_variable;
  vs_frameworkBundle___vs_lazy_init_variable = v0;

}

@end
