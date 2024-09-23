@implementation OSLogEnumeratorCatalogSubchunk

uint64_t __61___OSLogEnumeratorCatalogSubchunk_enumerateChunksUsingBlock___block_invoke(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61___OSLogEnumeratorCatalogSubchunk_enumerateChunksUsingBlock___block_invoke_2;
  v10[3] = &unk_1E4156AE8;
  v7 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = a3;
  v13 = a4;
  v8 = enumerateAndDecompressSubchunk(v7, a2, (uint64_t)a2, v10);

  return v8;
}

uint64_t __61___OSLogEnumeratorCatalogSubchunk_enumerateChunksUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a3);
}

@end
