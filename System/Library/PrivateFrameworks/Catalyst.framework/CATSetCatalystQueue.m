@implementation CATSetCatalystQueue

void __CATSetCatalystQueue_block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)&mainQueue, *(id *)(a1 + 32));
}

@end
