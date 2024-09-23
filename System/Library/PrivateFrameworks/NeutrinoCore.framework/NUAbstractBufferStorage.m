@implementation NUAbstractBufferStorage

void __51___NUAbstractBufferStorage_copyFromStorage_region___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v5 = (void *)a1[4];
  v4 = (void *)a1[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51___NUAbstractBufferStorage_copyFromStorage_region___block_invoke_2;
  v7[3] = &unk_1E50625E8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v5, "writeBufferInRegion:block:", v9, v7);

}

void __51___NUAbstractBufferStorage_copyFromStorage_region___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  __int128 v6;

  v3 = a2;
  objc_msgSend(v3, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bytesPerPixel");

  objc_msgSend(*(id *)(a1 + 32), "rowBytes");
  objc_msgSend(v3, "rowBytes");
  v5 = *(void **)(a1 + 40);
  if (v5)
    objc_msgSend(v5, "bounds");
  objc_msgSend(*(id *)(a1 + 32), "bytesAtPoint:", 0, 0, (unsigned __int128)0);
  objc_msgSend(v3, "mutableBytesAtPoint:", v6);

}

@end
