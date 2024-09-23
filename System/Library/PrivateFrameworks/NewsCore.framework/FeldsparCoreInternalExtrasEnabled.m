@implementation FeldsparCoreInternalExtrasEnabled

void __FeldsparCoreInternalExtrasEnabled_block_invoke()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB34D0], "fc_feldsparCoreInternalExtrasBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_182 = v0 != 0;

}

@end
