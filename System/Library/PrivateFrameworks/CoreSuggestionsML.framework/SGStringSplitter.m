@implementation SGStringSplitter

void __49__SGStringSplitter_splitString_withCharacterSet___block_invoke(uint64_t a1, UTF32Char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), a2) != 0;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v7 + 24)
    || *(_BYTE *)(*(_QWORD *)(v6 + 8) + 24)
    && (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a4,
        v6 = *(_QWORD *)(a1 + 48),
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8),
        *(_BYTE *)(v7 + 24)))
  {
    if (!*(_BYTE *)(*(_QWORD *)(v6 + 8) + 24))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v8, a4 - v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v9);

      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
  }
  *(_BYTE *)(v7 + 24) = *(_BYTE *)(*(_QWORD *)(v6 + 8) + 24);
}

+ (id)splitString:(id)a3 withCharacterSet:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a3;
  v6 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__199;
  v30 = __Block_byref_object_dispose__200;
  v31 = 0;
  v31 = (id)objc_opt_new();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v13 = MEMORY[0x24BDAC760];
  v7 = v6;
  v14 = v7;
  v8 = v5;
  v15 = v8;
  _PASIterateLongChars();
  if (*((_BYTE *)v21 + 24))
  {
    v9 = objc_msgSend(v8, "length", v13, 3221225472, __49__SGStringSplitter_splitString_withCharacterSet___block_invoke, &unk_24DDC4250, v7, v8, &v20, v24, &v16, &v26);
    objc_msgSend(v8, "substringWithRange:", v17[3], v9 - v17[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v27[5], "addObject:", v10);

  }
  v11 = (id)v27[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

@end
