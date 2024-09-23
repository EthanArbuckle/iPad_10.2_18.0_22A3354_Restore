@implementation NSArray(ExposureNotificationUI)

- (id)enui_map:()ExposureNotificationUI
{
  void (**v5)(id, _QWORD);
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = a1;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v5[2](v5, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+ExposureNotificationUI.m"), 14, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filter"));

    v6 = (id)objc_msgSend(a1, "copy");
  }

  return v6;
}

- (id)enui_filter:()ExposureNotificationUI
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1758];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__NSArray_ExposureNotificationUI__enui_filter___block_invoke;
  v10[3] = &unk_24E0C7308;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "predicateWithBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
