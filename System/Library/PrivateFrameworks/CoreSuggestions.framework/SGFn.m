@implementation SGFn

+ (id)map:(id)a3 f:(id)a4
{
  return sgMap(a3, a4);
}

+ (id)mapAndFilter:(id)a3 f:(id)a4
{
  return sgMapAndFilter(a3, a4);
}

+ (id)filter:(id)a3 f:(id)a4
{
  return sgFilter(a3, a4);
}

+ (id)simpleDedupe:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5633;
  v19 = __Block_byref_object_dispose__5634;
  v20 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __21__SGFn_simpleDedupe___block_invoke;
  v12 = &unk_1E4762008;
  v4 = v3;
  v13 = v4;
  v14 = &v15;
  v5 = objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v9);
  if (v16[5])
  {
    v6 = (void *)MEMORY[0x1A8583A40](v5);
    objc_msgSend(v4, "objectsAtIndexes:", v16[5], v9, v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v7 = (void *)objc_msgSend(v4, "copy", v9, v10, v11, v12);
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __21__SGFn_simpleDedupe___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v11 = v5;
  if (a3
    && (v6 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inRange:", v5, 0, a3), v5 = v11, v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, a3);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      goto LABEL_7;
    }
  }
  else
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v7)
    {
      objc_msgSend(v7, "addIndex:", a3);
LABEL_7:
      v5 = v11;
    }
  }

}

@end
