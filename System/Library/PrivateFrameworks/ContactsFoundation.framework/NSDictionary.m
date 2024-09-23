@implementation NSDictionary

void __47__NSDictionary_ContactsFoundation___cn_filter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

uint64_t __45__NSDictionary_ContactsFoundation___cn_each___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__NSDictionary_ContactsFoundation___cn_keysAndValues__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

void __44__NSDictionary_ContactsFoundation___cn_map___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  const __CFString *v20;
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    v22 = CFSTR("originalKey");
    v23[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("nil key during transform");
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    v20 = CFSTR("originalKey");
    v21 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("null key during transform");
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    v18[0] = CFSTR("originalKey");
    v18[1] = CFSTR("transformedKey");
    v19[0] = v17;
    v19[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("duplicated key during transform");
LABEL_8:
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v15, v14, v17);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v16);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v8);

}

void __48__NSDictionary_ContactsFoundation___cn_mapKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  id v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[2];
  const __CFString *v18;
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    v20 = CFSTR("originalKey");
    v21[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("nil key during transform");
    goto LABEL_8;
  }
  v7 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    v18 = CFSTR("originalKey");
    v19 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("null key during transform");
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    v16[0] = CFSTR("originalKey");
    v16[1] = CFSTR("transformedKey");
    v17[0] = v15;
    v17[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("duplicated key during transform");
LABEL_8:
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v13, v12, v15);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v14);
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);

}

void __50__NSDictionary_ContactsFoundation___cn_mapValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  void *v8;
  id v9;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  CNNilToNull_block_invoke_2((uint64_t)&__block_literal_global_1_2, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

}

@end
