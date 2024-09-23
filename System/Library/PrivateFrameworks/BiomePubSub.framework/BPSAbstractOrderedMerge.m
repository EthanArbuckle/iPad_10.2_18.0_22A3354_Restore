@implementation BPSAbstractOrderedMerge

void __42___BPSAbstractOrderedMerge_requestDemand___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = (void *)MEMORY[0x1AF415D18]();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v6))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", &unk_1E55656C0, a3);
      objc_msgSend(v9, "requestDemand:", 1);
    }
  }
  objc_autoreleasePoolPop(v5);

}

void __50___BPSAbstractOrderedMerge_isWaitingForMoreValues__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !v9 || (v9 & 1) == 0 && !objc_msgSend(v10, "count"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __43___BPSAbstractOrderedMerge__isBuffersEmpty__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v3) & 1) != 0)
  {

LABEL_4:
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    goto LABEL_5;
  }
  v4 = objc_msgSend(v5, "count");

  if (!v4)
    goto LABEL_4;
LABEL_5:

}

void __43___BPSAbstractOrderedMerge_nextValueIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "isEqual:", v5);

  v7 = v12;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v12, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(_QWORD *)(v9 + 40);
      v10 = (id *)(v9 + 40);
      if (!v11)
      {
LABEL_6:
        objc_storeStrong(v10, v8);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
        goto LABEL_7;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "compareFirst:withSecond:", v8) == -1)
      {
        v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        goto LABEL_6;
      }
    }
LABEL_7:

    v7 = v12;
  }

}

@end
