@implementation NSBundle

+ (id)bs_baseBoardUIBundle
{
  objc_opt_self();
  if (qword_1ECEC3950 != -1)
    dispatch_once(&qword_1ECEC3950, &__block_literal_global_5);
  return (id)_MergedGlobals_12;
}

void __45__NSBundle_BaseBoardUI__bs_baseBoardUIBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = v0;

}

@end
