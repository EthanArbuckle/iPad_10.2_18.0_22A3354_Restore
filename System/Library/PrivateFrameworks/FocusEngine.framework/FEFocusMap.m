@implementation FEFocusMap

void __54___FEFocusMap__inferredDefaultFocusItemInEnvironment___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "addObject:", v6);
  v7 = (id)a1[5];

  if (v7 == v6)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
}

uint64_t __103___FEFocusMap__nextFocusedItemForLinearFocusMovementRequest_startingFromRegion_inRegions_withSnapshot___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t IsFocusableInFocusSystemWithSearchInfo;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "searchInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsFocusableInFocusSystemWithSearchInfo = _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(v4, v2, v5);

  return IsFocusableInFocusSystemWithSearchInfo;
}

uint64_t __76___FEFocusMap__linearlySortedFocusItemsForItems_groupFilter_itemStandInMap___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "focusGroupForItem:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToFocusGroup:", *(_QWORD *)(a1 + 40));

  return v4;
}

uint64_t __76___FEFocusMap__linearlySortedFocusItemsForItems_groupFilter_itemStandInMap___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return _FEFocusItemCompare(a2, a3);
}

@end
