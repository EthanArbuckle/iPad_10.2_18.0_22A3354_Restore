@implementation UIDiffableDataSourceApplyDeleteUpdate

uint64_t ___UIDiffableDataSourceApplyDeleteUpdate_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 0xB
    && (CVCIs__NSOrderedSetI(*(void **)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "identifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 >= 0xB)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithOrderedSet:", *(_QWORD *)(a1 + 32));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v9)
    v9 = *(void **)(a1 + 32);
  return objc_msgSend(v9, "indexOfObject:", a2);
}

void ___UIDiffableDataSourceApplyDeleteUpdate_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = objc_msgSend(*(id *)(a1 + 32), "rangeForSection:", a2);
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "removeObjectsInRange:", v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "_deleteSection:", a2);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    _CVCUpdateItemAlloc();
    v6 = (void *)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithInitialIndexPath:finalIndexPath:updateAction:", v7, 0, 1);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

  }
}

uint64_t ___UIDiffableDataSourceApplyDeleteUpdate_block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 0xB
    && (CVCIs__NSOrderedSetI(*(void **)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "identifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 >= 0xB)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithOrderedSet:", *(_QWORD *)(a1 + 32));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v9)
    v9 = *(void **)(a1 + 32);
  return objc_msgSend(v9, "indexOfObject:", a2);
}

@end
