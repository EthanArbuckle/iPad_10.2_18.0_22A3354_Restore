@implementation FEFocusEngineCommonEnvironmentScrollableContainerForItems

uint64_t ___FEFocusEngineCommonEnvironmentScrollableContainerForItems_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t CanScroll;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___FEFocusEngineCommonEnvironmentScrollableContainerForItems_block_invoke_2;
  v9[3] = &unk_250D3A0A8;
  v5 = v3;
  v10 = v5;
  if (objc_msgSend(v4, "indexOfObjectPassingTest:", v9) == 0x7FFFFFFFFFFFFFFFLL)
  {
    CanScroll = 0;
  }
  else
  {
    objc_msgSend(v5, "scrollableContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CanScroll = _FEFocusEngineScrollableContainerCanScroll(v7);

  }
  return CanScroll;
}

BOOL ___FEFocusEngineCommonEnvironmentScrollableContainerForItems_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "scrollableContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scrollableContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

@end
