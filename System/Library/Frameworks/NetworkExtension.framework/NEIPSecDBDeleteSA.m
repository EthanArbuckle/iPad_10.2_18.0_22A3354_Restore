@implementation NEIPSecDBDeleteSA

void __NEIPSecDBDeleteSA_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  int v5;
  _QWORD *v6;
  int v7;
  BOOL v8;
  int v9;
  BOOL v10;
  NSObject *v11;

  v2 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v2 + 80))
  {
    v3 = NEGetValueFromIntKeyedDictionary(*(const __CFDictionary **)(v2 + 80), *(_DWORD *)(a1 + 56));
    if (v3)
      v3 = CFRetain(v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
    v2 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = NEIPSecDBCreateQueuedRequest(v2, 4, *(_DWORD *)(a1 + 56));
      v2 = *(_QWORD *)(a1 + 48);
    }
  }
  v4 = *(void **)(v2 + 104);
  if (v4)
  {
    v5 = *(_DWORD *)(a1 + 56);
    do
    {
      v6 = *(_QWORD **)v4;
      v7 = *((_DWORD *)v4 + 4);
      if (v7)
        v8 = v7 == v5;
      else
        v8 = 0;
      if (v8)
      {
        *((_DWORD *)v4 + 4) = 0;
        if (!*((_DWORD *)v4 + 5))
          goto LABEL_24;
      }
      else
      {
        v9 = *((_DWORD *)v4 + 5);
        if (v9)
          v10 = v9 == v5;
        else
          v10 = 0;
        if (v10)
        {
          v9 = 0;
          *((_DWORD *)v4 + 5) = 0;
        }
        if (!v7 && !v9)
        {
LABEL_24:
          v11 = *((_QWORD *)v4 + 3);
          if (v11)
          {
            if (!dispatch_source_testcancel(*((dispatch_source_t *)v4 + 3)))
            {
              dispatch_source_cancel(v11);
              v6 = *(_QWORD **)v4;
            }
            *((_QWORD *)v4 + 3) = 0;
          }
          if (v6)
            v6[1] = *((_QWORD *)v4 + 1);
          **((_QWORD **)v4 + 1) = v6;
          free(v4);
          return;
        }
      }
      v4 = v6;
    }
    while (v6);
  }
}

@end
