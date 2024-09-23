@implementation NSAttributedString

void __103__NSAttributedString_AXPropertyListCoersion___axRecursivelyPropertyListCoercedRepresentationWithError___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, _BYTE *a5)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  unint64_t v17;
  unint64_t v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v17 = bswap64(a4);
  v18 = bswap64(a3);
  v7 = (void *)MEMORY[0x1E0C99DF0];
  v8 = a2;
  objc_msgSend(v7, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendBytes:length:", &v18, 8);
  objc_msgSend(v9, "appendBytes:length:", &v17, 8);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v8, "_axRecursivelyPropertyListCoercedRepresentationWithError:", &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    v19[0] = CFSTR("Range");
    v19[1] = CFSTR("Attrs");
    v20[0] = v9;
    v20[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);

  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
    *a5 = 1;
  }

}

@end
