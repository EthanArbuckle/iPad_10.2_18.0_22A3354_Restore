@implementation NSString

uint64_t __65__NSString_MapsSharedExtras___maps_prefixMatchesForSearchString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __65__NSString_MapsSharedExtras___maps_prefixMatchesForSearchString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 32);
  v11[0] = a2;
  v7 = (void *)MEMORY[0x1E0CB3B18];
  v8 = a2;
  objc_msgSend(v7, "valueWithRange:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v10);

}

@end
