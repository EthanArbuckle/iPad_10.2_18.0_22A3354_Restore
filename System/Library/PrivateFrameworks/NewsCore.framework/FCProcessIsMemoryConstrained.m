@implementation FCProcessIsMemoryConstrained

void __FCProcessIsMemoryConstrained_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  _MergedGlobals_137 = objc_msgSend(&unk_1E470C588, "containsObject:", v1);
}

@end
