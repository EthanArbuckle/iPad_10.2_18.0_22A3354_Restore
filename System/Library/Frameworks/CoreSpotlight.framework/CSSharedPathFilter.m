@implementation CSSharedPathFilter

void __CSSharedPathFilter_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x18D782104](a1, a2);
  v3 = (void *)MDCreateFilterGenerator();
  objc_msgSend(v3, "addNamed:auxValue:forPath:", CFSTR("<ROOT>"), 1, CFSTR("/"));
  objc_msgSend(v3, "filterDataForMountDepth:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D9B8]), "initWithData:", v4);
  v6 = (void *)CSSharedPathFilter_sCSPathFIlter;
  CSSharedPathFilter_sCSPathFIlter = v5;

  objc_autoreleasePoolPop(v2);
}

@end
