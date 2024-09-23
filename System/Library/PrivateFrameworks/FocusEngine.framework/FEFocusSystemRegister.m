@implementation FEFocusSystemRegister

void ___FEFocusSystemRegister_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = v0;

}

@end
