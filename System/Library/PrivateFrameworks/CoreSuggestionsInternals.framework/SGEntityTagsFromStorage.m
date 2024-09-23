@implementation SGEntityTagsFromStorage

void __SGEntityTagsFromStorage_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D197F0], "resolveName:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

@end
