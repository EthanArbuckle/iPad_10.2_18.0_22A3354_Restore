@implementation FEFocusEnvironmentPreferredFocusMapContainer

void ___FEFocusEnvironmentPreferredFocusMapContainer_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "_focusMapContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
    goto LABEL_7;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(v11, "_focusItemContainer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_9:

      goto LABEL_10;
    }
    _FEFocusRegionContainerFromEnvironmentAndContainer((uint64_t)v11, (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
LABEL_7:

    *a3 = 1;
    goto LABEL_9;
  }
LABEL_10:

}

@end
