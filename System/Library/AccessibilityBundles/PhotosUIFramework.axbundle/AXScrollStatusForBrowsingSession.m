@implementation AXScrollStatusForBrowsingSession

void __AXScrollStatusForBrowsingSession_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __AXScrollStatusForBrowsingSession_block_invoke_2;
  v6[3] = &unk_24FF14F78;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v2, 0, v6);

}

uint64_t __AXScrollStatusForBrowsingSession_block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = objc_msgSend(a2, "section");
  result = objc_msgSend(*(id *)(a1 + 32), "section");
  if (v5 == result)
    *a3 = 1;
  else
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __AXScrollStatusForBrowsingSession_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfAssetsWithMaximum:", 0x7FFFFFFFFFFFFFFFLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
