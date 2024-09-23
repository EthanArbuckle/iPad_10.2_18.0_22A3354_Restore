@implementation AXNTKFormattingManager

void __AXNTKFormattingManager_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD3C40], "fiui_sharedHealthStoreForCarousel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE37948]), "initWithHealthStore:", v3);
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BE37938]), "initWithUnitManager:", v0);
  v2 = (void *)AXNTKFormattingManager_FormattingManager;
  AXNTKFormattingManager_FormattingManager = v1;

}

@end
