@implementation UIDiffableDataSourceApplyInsertUpdate

uint64_t ___UIDiffableDataSourceApplyInsertUpdate_block_invoke(uint64_t a1, uint64_t a2)
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

uint64_t ___UIDiffableDataSourceApplyInsertUpdate_block_invoke_2(uint64_t a1)
{
  void *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v18;
  void *v19;

  objc_msgSend(*(id *)(a1 + 32), "destinationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "destinationIdentifierIsSectionIdentifier"))
    v3 = v2 == 0;
  else
    v3 = 1;
  if (!v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v2);
LABEL_8:
    v5 = v4;
    goto LABEL_9;
  }
  if (v2)
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "sectionForGlobalIndex:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))());
    goto LABEL_8;
  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "count") - 1;
LABEL_9:
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v2)
      goto LABEL_11;
LABEL_18:
    v8 = objc_msgSend(*(id *)(a1 + 56), "count");
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)_block_invoke_2");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("_UIDiffableDataSourceUpdate.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section != NSNotFound"));

  if (!v2)
    goto LABEL_18;
LABEL_11:
  if (objc_msgSend(*(id *)(a1 + 32), "destinationIdentifierIsSectionIdentifier"))
  {
    v6 = objc_msgSend(*(id *)(a1 + 48), "rangeForSection:", v5);
    v8 = v6 + v7;
  }
  else
  {
    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    if (objc_msgSend(*(id *)(a1 + 32), "relativePosition") == 1)
      ++v8;
  }
LABEL_19:
  if (v5 >= objc_msgSend(*(id *)(a1 + 48), "numberOfSections"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)_block_invoke_2");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_UIDiffableDataSourceUpdate.m"), 318, CFSTR("Invalid section. Did you forget to create one?"));

  }
  v11 = objc_msgSend(*(id *)(a1 + 56), "count");
  v12 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _UIDiffableDataSourceInsertIdentifiersAtIndex(v12, v13, v8, 1);

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

  v16 = objc_msgSend(*(id *)(a1 + 56), "count") - v11;
  objc_msgSend(*(id *)(a1 + 48), "_incrementSectionCount:byCount:", v5, v16);

  return v16;
}

@end
