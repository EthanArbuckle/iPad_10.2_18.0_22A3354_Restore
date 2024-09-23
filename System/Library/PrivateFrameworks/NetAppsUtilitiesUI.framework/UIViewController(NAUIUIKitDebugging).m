@implementation UIViewController(NAUIUIKitDebugging)

+ (uint64_t)recursiveDescription
{
  return objc_msgSend(MEMORY[0x24BDF6F98], "_allDescriptions");
}

- (id)_recursiveDescriptionWithInset:()NAUIUIKitDebugging
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@    "), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a1, "childViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "_recursiveDescriptionWithInset:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@ view:%@"), v4, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@\n%@"), v17, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = v17;
  }

  return v20;
}

- (uint64_t)recursiveDescription
{
  return objc_msgSend(a1, "_recursiveDescriptionWithInset:", &stru_24D612948);
}

@end
