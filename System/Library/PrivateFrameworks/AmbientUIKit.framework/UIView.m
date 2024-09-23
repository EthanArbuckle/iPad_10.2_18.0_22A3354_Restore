@implementation UIView

uint64_t __94__UIView_AmbientUI__amui_applyRedModeFilterAnimated_withCoordinatedAnimationBlock_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "filters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1A8];
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFilters:", v5);

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __94__UIView_AmbientUI__amui_clearRedModeFilterAnimated_withCoordinatedAnimationBlock_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "mutableArrayValueForKeyPath:", CFSTR("filters"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  }
  if (*(_BYTE *)(a1 + 65))
  {
    objc_msgSend(*(id *)(a1 + 32), "mutableArrayValueForKeyPath:", CFSTR("filters"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 48));

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
