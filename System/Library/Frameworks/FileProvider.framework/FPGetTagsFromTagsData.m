@implementation FPGetTagsFromTagsData

uint64_t __FPGetTagsFromTagsData_block_invoke(uint64_t a1, uint64_t a2)
{
  FPTag *v4;
  void *v5;
  FPTag *v6;

  v4 = [FPTag alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FPTag initWithLabel:color:](v4, "initWithLabel:color:", v5, *(unsigned __int8 *)(a2 + 8));

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  return 1;
}

@end
