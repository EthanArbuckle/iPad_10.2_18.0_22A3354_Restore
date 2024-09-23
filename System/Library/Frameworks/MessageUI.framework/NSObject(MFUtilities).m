@implementation NSObject(MFUtilities)

- (id)mf_objectWithHighest:()MFUtilities
{
  void (**v4)(id, void *, _BYTE *);
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = a1;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    v9 = NAN;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
      v16 = 0;
      v4[2](v4, v11, &v16);
      if (v16)
        break;
      v13 = v12;
      if (!v6 || v12 > v9)
      {
        v14 = v11;

        v6 = v14;
        v9 = v13;
      }
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  return v6;
}

@end
