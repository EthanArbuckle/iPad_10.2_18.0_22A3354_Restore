@implementation CALayer(GKAdditions)

- (id)_gkDescriptionWithChildren:()GKAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _gkTabStringForTabLevel();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@%@\n"), v5, v7);

  objc_msgSend(a1, "sublayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    v12 = a3 + 1;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "_gkDescriptionWithChildren:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v14);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  v15 = (id)_gkUnicodifyDescription();

  return v6;
}

- (uint64_t)_gkRecursiveDescription
{
  return objc_msgSend(a1, "_gkDescriptionWithChildren:", 0);
}

- (void)_gkParentSublayerTransform
{
  void *v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;

  objc_msgSend(a1, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    objc_msgSend(v3, "sublayerTransform");
    v3 = v9;
  }
  else
  {
    v4 = (_OWORD *)MEMORY[0x1E0CD2610];
    v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    a2[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    a2[5] = v5;
    v6 = v4[7];
    a2[6] = v4[6];
    a2[7] = v6;
    v7 = v4[1];
    *a2 = *v4;
    a2[1] = v7;
    v8 = v4[3];
    a2[2] = v4[2];
    a2[3] = v8;
  }

}

@end
