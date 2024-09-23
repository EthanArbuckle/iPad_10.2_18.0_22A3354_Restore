@implementation FEFocusMovementPerformer

void __98___FEFocusMovementPerformer__findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "_focusLinearMovementSequence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __98___FEFocusMovementPerformer__findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest___block_invoke_2;
    v9[3] = &unk_250D3A7A0;
    v14 = *(_QWORD *)(a1 + 64);
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v12 = v6;
    v13 = v7;
    v15 = a3;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  }
}

void __98___FEFocusMovementPerformer__findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v6 = a2;
  v7 = *(_QWORD *)(a1 + 64) & 0x110;
  v23 = v6;
  objc_msgSend(v6, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(v8, "reverseObjectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  v12 = objc_msgSend(v9, "indexOfObjectIdenticalTo:", *(_QWORD *)(a1 + 32));
  v13 = v12;
  if ((*(_BYTE *)(a1 + 64) & 0x30) != 0)
  {
    if (v12 <= 0x7FFFFFFFFFFFFFFDLL)
    {
      i = v12 + 1;
      goto LABEL_8;
    }
  }
  else if (objc_msgSend(v9, "count"))
  {
    for (i = 0; ; ++i)
    {
LABEL_8:
      if (i >= objc_msgSend(v9, "count"))
      {
        if ((*(_BYTE *)(a1 + 64) & 0x30) == 0 || !objc_msgSend(v23, "isLooping"))
          goto LABEL_20;
        i = 0;
      }
      if (i == v13)
        goto LABEL_20;
      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "searchInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(v15, v16, v17);

      if ((v16 & 1) != 0)
        break;

    }
    if (v15)
    {
      v18 = -[_FEFocusUpdateContext _initWithFocusMovementRequest:nextFocusedItem:]([_FEFocusUpdateContext alloc], "_initWithFocusMovementRequest:nextFocusedItem:", *(_QWORD *)(a1 + 48), v15);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "_isValidInFocusSystem:", *(_QWORD *)(a1 + 40)))
      {
        *a4 = 1;
        **(_BYTE **)(a1 + 72) = 1;
      }
      else
      {
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = 0;

      }
    }
  }
LABEL_20:

}

void __63___FEFocusMovementPerformer__isMovementValidForFocusSequences___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "_focusLinearMovementSequence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __63___FEFocusMovementPerformer__isMovementValidForFocusSequences___block_invoke_2;
    v10[3] = &unk_250D3A7F0;
    v6 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v11 = v6;
    v12 = v8;
    v13 = v7;
    v14 = a3;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  }
}

void __63___FEFocusMovementPerformer__isMovementValidForFocusSequences___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nextFocusedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v7);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v11, "restrictsEnteringSequence"))
  {
    if (!v8 || *(_QWORD *)(a1 + 48) != 16)
    {
      objc_msgSend(v11, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == objc_msgSend(v9, "count") - 1)
      {

LABEL_9:
        *a4 = 1;
        **(_BYTE **)(a1 + 56) = 1;
        goto LABEL_10;
      }
      v10 = *(_QWORD *)(a1 + 48);

      if (v10 != 32)
        goto LABEL_9;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_9;
  }
LABEL_10:

}

@end
