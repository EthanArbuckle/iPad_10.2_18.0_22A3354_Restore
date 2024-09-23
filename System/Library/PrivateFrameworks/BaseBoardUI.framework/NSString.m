@implementation NSString

- (id)_bsui_rangesOfEmojiTokens:(void *)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  if (a1)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__1;
    v31 = __Block_byref_object_dispose__1;
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__1;
    v25 = __Block_byref_object_dispose__1;
    if (a2)
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v4 = 0;
    v26 = v4;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3010000000;
    v19 = 0;
    v20 = 0;
    v18 = &unk_1A0254B5A;
    objc_msgSend(a1, "length");
    CEMEnumerateEmojiTokensInStringWithBlock();
    if (v22[5])
    {
      v5 = v16[4];
      v6 = v16[5];
      if (v6 + v5 < (unint64_t)objc_msgSend(a1, "length"))
      {
        v7 = v16[4];
        v8 = v16[5];
        v9 = objc_msgSend(a1, "length");
        v10 = v8 + v7;
        v11 = (void *)v22[5];
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v10, v9 - (v16[4] + v16[5]));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

      }
      if (a2)
        *a2 = objc_retainAutorelease((id)v22[5]);
    }
    v13 = (id)v28[5];
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

void __67__NSString_BSUIPartialStylingAdditions___bsui_rangesOfEmojiTokens___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (a3 != -1 && a4 != -1)
  {
    v7 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v9 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    if (v9)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) + *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 32);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v10, a3 - v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

      v12 = *(_QWORD *)(a1[6] + 8);
      *(_QWORD *)(v12 + 32) = a3;
      *(_QWORD *)(v12 + 40) = a4;
    }
  }
}

@end
