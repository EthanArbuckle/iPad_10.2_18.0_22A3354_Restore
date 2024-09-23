@implementation PKStrokeGroupItem

- (void)refreshStrokesInDrawing:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    v5 = a1[2];
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = a1[2];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "_strokeUUID", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "_visibleStrokeForIdentifier:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v6, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v13 = objc_msgSend(v6, "count");
    if (v13 == objc_msgSend(a1[2], "count"))
      objc_setProperty_nonatomic_copy(a1, v14, v6, 16);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokes, 0);
  objc_storeStrong((id *)&self->_strokeGroupItem, 0);
}

@end
