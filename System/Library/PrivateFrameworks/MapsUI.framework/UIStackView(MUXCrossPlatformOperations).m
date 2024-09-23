@implementation UIStackView(MUXCrossPlatformOperations)

- (uint64_t)_mapsui_setContentEdgeInsets:()MUXCrossPlatformOperations
{
  objc_msgSend(a1, "setLayoutMargins:");
  return objc_msgSend(a1, "setLayoutMarginsRelativeArrangement:", 1);
}

- (void)_mapsui_setArrangedSubviews:()MUXCrossPlatformOperations
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(a1, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObjectsInArray:", v4);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "_mapsui_removeArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v10);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
        objc_msgSend(a1, "removeArrangedSubview:", v18, (_QWORD)v19);
        objc_msgSend(a1, "addArrangedSubview:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

}

- (void)_mapsui_removeArrangedSubview:()MUXCrossPlatformOperations
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v6);

    if (v5)
    {
      objc_msgSend(a1, "removeArrangedSubview:", v6);
      objc_msgSend(v6, "removeFromSuperview");
    }
  }

}

@end
