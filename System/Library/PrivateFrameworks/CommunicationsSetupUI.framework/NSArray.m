@implementation NSArray

void __52__NSArray_CNFRegUtilities__CNFRegArrayPassingTests___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v18 = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        if (a4 && v18)
        {
          *a4 = 1;
LABEL_15:

          goto LABEL_16;
        }
        v13 = v12 ^ 1;
        if (v18)
          v13 = 1;
        if ((v13 & 1) != 0)
          goto LABEL_15;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6, (_QWORD)v14);
LABEL_16:

}

@end
