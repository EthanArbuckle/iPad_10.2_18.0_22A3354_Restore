@implementation CLKTimeFormatSentinel

void __59___CLKTimeFormatSentinel_listenForLocaleChangesIfNecessary__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleLocaleChange, *MEMORY[0x24BDBCA70], 0);

}

@end
