@implementation UINavigationController(DMC)

- (void)dmc_popToViewController:()DMC pushViewController:animated:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "viewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v8);

  if (v12)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(a1, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
LABEL_4:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v17);
        objc_msgSend(v10, "addObject:", v18);
        if (v18 == v8)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v15)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  if (v9 && (objc_msgSend(v10, "containsObject:", v9) & 1) == 0)
    objc_msgSend(v10, "addObject:", v9);
  objc_msgSend(a1, "topViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = a5 & ~objc_msgSend(v19, "isEqual:", v20);

  NSLog(CFSTR("%s after stack: %@"), "-[UINavigationController(DMC) dmc_popToViewController:pushViewController:animated:]", v10);
  objc_msgSend(a1, "setViewControllers:animated:", v10, v21);

}

@end
