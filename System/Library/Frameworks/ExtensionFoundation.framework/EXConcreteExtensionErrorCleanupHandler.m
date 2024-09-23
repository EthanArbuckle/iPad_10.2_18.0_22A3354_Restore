@implementation EXConcreteExtensionErrorCleanupHandler

void __EXConcreteExtensionErrorCleanupHandler_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_extensionContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_extensionServiceConnections");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

@end
