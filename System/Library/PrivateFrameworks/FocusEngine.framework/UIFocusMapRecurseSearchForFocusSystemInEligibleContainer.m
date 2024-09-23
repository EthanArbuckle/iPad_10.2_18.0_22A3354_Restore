@implementation UIFocusMapRecurseSearchForFocusSystemInEligibleContainer

void ____UIFocusMapRecurseSearchForFocusSystemInEligibleContainer_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  v6 = v8;
  if (*(id *)(a1 + 32) != v8)
  {
    if (*(id *)(a1 + 40) == v8)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      *a3 = 1;
      goto LABEL_14;
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      v7 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", v8);
      v6 = v8;
      if (v7)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
        goto LABEL_14;
      }
    }
    if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v6))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = _FEFocusEnvironmentIsEligibleForFocusOcclusion(v8, 0);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
LABEL_13:
        v6 = v8;
        goto LABEL_14;
      }
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
    }
    *a3 = 1;
    goto LABEL_13;
  }
LABEL_14:

}

@end
