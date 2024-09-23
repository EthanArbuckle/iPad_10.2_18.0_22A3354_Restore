@implementation GEOTrail(MUExtras)

- (uint64_t)_mapsui_hikingDifficultyFactoid
{
  return objc_msgSend(a1, "factoidWithSemantic:", 2);
}

- (id)_mapsui_createCombinedTrailTypeAndLengthFactoid
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "factoidWithSemantic:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "factoidWithSemantic:", 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = 0;
  if (v2 && v3)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26F68]), "initWithLabelFactoid:iconFactoid:", v2, v3);

  return v5;
}

- (id)factoidWithSemantic:()MUExtras
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "factoids", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "semantic") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

@end
