@implementation UICollectionViewDiffableDataSource(MapsUI)

- (id)_mapkit_visibleFocusItemsInCollectionView:()MapsUI forSection:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "frame");
  if (CGRectGetWidth(v39) > 0.0)
  {
    objc_msgSend(v6, "frame");
    if (CGRectGetHeight(v40) > 0.0)
    {
      objc_msgSend(a1, "snapshotForSection:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (!v10)
      {
        v29 = (void *)MEMORY[0x1E0C9AA60];
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(v6, "layoutIfNeeded");
      objc_msgSend(v6, "visibleCells");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v14)
      {
        v15 = v14;
        v31 = v8;
        v32 = v7;
        v16 = *(_QWORD *)v34;
        v17 = -1;
        do
        {
          v18 = v13;
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(v18);
            v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v6, "indexPathForCell:", v20, v31);
            v21 = v6;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "row");

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v24);

            v6 = v21;
            if (v17 >= v23)
              v17 = v23;
          }
          v13 = v18;
          v15 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v15);

        if (v17 == -1)
        {
          v29 = (void *)MEMORY[0x1E0C9AA60];
          v8 = v31;
          v7 = v32;
          goto LABEL_23;
        }
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count"));
        v7 = v32;
        if (v17 < objc_msgSend(v12, "count") + v17)
        {
          v26 = v17;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v28);

            ++v26;
          }
          while (v26 < objc_msgSend(v12, "count") + v17);
        }
        v29 = (void *)objc_msgSend(v25, "copy");
        v8 = v31;
        v6 = v21;
      }
      else
      {
        v29 = (void *)MEMORY[0x1E0C9AA60];
        v25 = v13;
      }

LABEL_23:
      goto LABEL_24;
    }
  }
  v29 = (void *)MEMORY[0x1E0C9AA60];
LABEL_25:

  return v29;
}

@end
