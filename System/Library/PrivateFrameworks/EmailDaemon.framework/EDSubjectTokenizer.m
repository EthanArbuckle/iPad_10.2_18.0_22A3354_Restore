@implementation EDSubjectTokenizer

+ (id)tokenizeString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__34;
  v21 = __Block_byref_object_dispose__34;
  v22 = (id)0xAAAAAAAAAAAAAAAALL;
  v22 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = (void *)MEMORY[0x1E0CB3730];
  v6 = objc_msgSend(v3, "length");
  v7 = *MEMORY[0x1E0CB2D28];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__EDSubjectTokenizer_tokenizeString___block_invoke;
  v13[3] = &unk_1E94A1E08;
  v8 = v3;
  v14 = v8;
  v16 = &v17;
  v9 = v4;
  v15 = v9;
  objc_msgSend(v5, "enumerateTagsForString:range:unit:scheme:options:orthography:usingBlock:", v8, 0, v6, 0, v7, 4, 0, v13);
  if (objc_msgSend((id)v18[5], "length"))
    objc_msgSend(v9, "addObject:", v18[5]);
  v10 = v15;
  v11 = v9;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __37__EDSubjectTokenizer_tokenizeString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  int v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB2CF0]);
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v8)
  {
    objc_msgSend(v9, "appendString:", v7);
  }
  else
  {
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v7, "lowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
}

@end
