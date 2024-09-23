@implementation CALayer(ControlCenterAdditions)

- (void)_ccuiEnumerateSubtreeUsingBlock:()ControlCenterAdditions stop:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (a4)
    {
      if (*a4)
        goto LABEL_15;
      (*((void (**)(id, void *, _BYTE *))v6 + 2))(v6, a1, a4);
      if (*a4)
        goto LABEL_15;
    }
    else
    {
      (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, a1, 0);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(a1, "sublayers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "_ccuiEnumerateSubtreeUsingBlock:stop:", v7, a4);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
LABEL_15:

}

- (uint64_t)ccuiEnumerateSubtreeUsingBlock:()ControlCenterAdditions
{
  char v4;

  v4 = 0;
  return objc_msgSend(a1, "_ccuiEnumerateSubtreeUsingBlock:stop:", a3, &v4);
}

@end
