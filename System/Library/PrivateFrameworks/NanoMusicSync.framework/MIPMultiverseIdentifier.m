@implementation MIPMultiverseIdentifier

void __74__MIPMultiverseIdentifier_NanoMusicSync___pidsFromSyncIDs_containerClass___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *a3);

}

@end
