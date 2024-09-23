@implementation AVLoadValuesAsynchronously

uint64_t __AVLoadValuesAsynchronously_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = *MEMORY[0x1E0CB2938];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(a1 + 40), "statusOfValueForKey:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), &v16);
        if ((unint64_t)(v8 - 2) >= 2)
        {
          if (v8 == 4)
          {
            v9 = -11878;
            v10 = 0;
          }
          else
          {
            v17 = v6;
            v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected terminal status %d"), v8);
            v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
            v9 = -11800;
          }
          v16 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), v9, v10);
          if (v16)
            return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }
        else if (v16)
        {
          return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    }
    while (v4);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
