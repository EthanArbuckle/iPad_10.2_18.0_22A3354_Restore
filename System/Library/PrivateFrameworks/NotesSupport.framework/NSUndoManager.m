@implementation NSUndoManager

void __27__NSUndoManager_IC__shared__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3A48]);
  v1 = (void *)shared_sharedUndoManager;
  shared_sharedUndoManager = (uint64_t)v0;

}

@end
