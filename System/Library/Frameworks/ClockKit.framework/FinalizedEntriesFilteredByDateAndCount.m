@implementation FinalizedEntriesFilteredByDateAndCount

BOOL ___FinalizedEntriesFilteredByDateAndCount_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  if (*(_BYTE *)(a1 + 40))
    v3 = -1;
  else
    v3 = 1;
  objc_msgSend(a2, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compare:", *(_QWORD *)(a1 + 32)) == v3;

  return v5;
}

void ___FinalizedEntriesFilteredByDateAndCount_block_invoke_204(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "finalizedCopy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

@end
