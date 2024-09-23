@implementation HKCreationInterval

uint64_t __HKCreationInterval_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_creationDate");
}

@end
