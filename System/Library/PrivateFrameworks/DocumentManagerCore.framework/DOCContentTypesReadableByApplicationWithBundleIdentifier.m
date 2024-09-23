@implementation DOCContentTypesReadableByApplicationWithBundleIdentifier

void __DOCContentTypesReadableByApplicationWithBundleIdentifier_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "handlerRank");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDC1620]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDC1610]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDC1618]))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "typeIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
}

@end
