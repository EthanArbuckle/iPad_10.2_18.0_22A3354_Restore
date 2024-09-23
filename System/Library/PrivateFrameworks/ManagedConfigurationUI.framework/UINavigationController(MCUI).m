@implementation UINavigationController(MCUI)

- (void)popToViewController:()MCUI pushViewController:animated:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "viewControllers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v14)
        objc_enumerationMutation(v11);
      v16 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v15);
      objc_msgSend(v10, "addObject:", v16);
      if (v16 == v8)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(v10, "addObject:", v9);
  objc_msgSend(a1, "setViewControllers:animated:", v10, a5);

}

@end
