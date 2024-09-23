@implementation NSCountedSet

void __83__NSCountedSet_CLSNSCountedSet__enumerateObjectsSortedByCountUsingBlock_ascending___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("count");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("object");
  v9[0] = v6;
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

}

@end
