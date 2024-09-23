@implementation UIView(NAUIAutolayoutDebugging)

+ (void)_naui_beginDebuggingAutolayout
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[5];
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("NAUIDebugAutolayout"));

  if (v3)
  {
    _showAutolayoutIssues = 1;
    _logsAutolayoutIssues = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _showAutolayoutIssues = objc_msgSend(v4, "BOOLForKey:", CFSTR("NAUIDebugAutolayout_Visualize"));

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _logsAutolayoutIssues = objc_msgSend(v5, "BOOLForKey:", CFSTR("NAUIDebugAutolayout_EnableLogs"));

    if (!(_showAutolayoutIssues | _logsAutolayoutIssues))
      return;
  }
  v6 = dispatch_time(0, 1500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__UIView_NAUIAutolayoutDebugging___naui_beginDebuggingAutolayout__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
  objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasAmbiguousLayout"))
  {
    v18 = v7;
    objc_msgSend(v7, "naui_descendantsWithAmbiguousLayout");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
          NSClassFromString(CFSTR("_UILayoutGuide"));
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v22 = 0u;
            v23 = 0u;
            v20 = 0u;
            v21 = 0u;
            objc_msgSend(v12, "_layoutVariablesWithAmbiguousValue");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v21;
              do
              {
                v17 = 0;
                do
                {
                  if (*(_QWORD *)v21 != v16)
                    objc_enumerationMutation(v13);
                  +[_NAUIAmbigousLayoutView installOnView:forVariable:](_NAUIAmbigousLayoutView, "installOnView:forVariable:", v12, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17++));
                }
                while (v15 != v17);
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
              }
              while (v15);
            }

          }
          ++v11;
        }
        while (v11 != v9);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v9);
    }

    v7 = v18;
  }

}

- (id)naui_descendantsWithAmbiguousLayout
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "naui_descendantsWithAmbiguousLayout");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
          objc_msgSend(v2, "addObjectsFromArray:", v9);
        if (objc_msgSend(v8, "hasAmbiguousLayout"))
          objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
    v10 = v2;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

@end
