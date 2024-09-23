@implementation IncrementalSearchOperation

void __35___IncrementalSearchOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  id WeakRetained;
  void (*v9)(uint64_t, id, _BYTE *);
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _BYTE __dst[1032];

  v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
  {
    *a4 = 1;
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) >= 0x40uLL)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      v9 = *(void (**)(uint64_t, id, _BYTE *))(v7 + 16);
      memcpy(__dst, (const void *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), sizeof(__dst));
      v9(v7, WeakRetained, __dst);

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 0;
    }
    v10 = objc_msgSend(v6, "range");
    v11 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
    v12 = v11[4];
    v11 += 4;
    *v11 = v12 + 1;
    v13 = &v11[2 * v12];
    v13[1] = v10;
    v13[2] = v14;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

@end
