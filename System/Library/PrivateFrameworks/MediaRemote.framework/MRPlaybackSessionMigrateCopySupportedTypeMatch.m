@implementation MRPlaybackSessionMigrateCopySupportedTypeMatch

id __MRPlaybackSessionMigrateCopySupportedTypeMatch_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = v4;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              if ((objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j)) & 1) != 0)
              {
                v16 = v10;

                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v16 = 0;
    }
    while (v7);
  }
  else
  {
    v16 = 0;
  }
LABEL_19:

  return v16;
}

@end
