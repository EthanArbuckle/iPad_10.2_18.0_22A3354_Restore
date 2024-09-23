@implementation NSISSparseVectorDescription

uint64_t __NSISSparseVectorDescription_block_invoke(uint64_t a1, double a2, double a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%g:%g"), *(_QWORD *)&a2, *(_QWORD *)&a3));
}

@end
