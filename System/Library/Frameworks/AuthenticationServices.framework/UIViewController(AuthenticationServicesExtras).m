@implementation UIViewController(AuthenticationServicesExtras)

- (id)_as_applicationBackgroundBlock
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_getAssociatedObject(a1, (const void *)applicationBackgroundBlockKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "block");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x212BBEFEC]();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_as_setApplicationBackgroundBlock:()AuthenticationServicesExtras
{
  id v4;
  const void *v5;
  ASBackgroundObserver *v6;
  id v7;

  v4 = a3;
  v5 = (const void *)applicationBackgroundBlockKey;
  v7 = v4;
  if (v4)
  {
    v6 = -[ASBackgroundObserver initWithViewController:block:]([ASBackgroundObserver alloc], "initWithViewController:block:", a1, v4);
    objc_setAssociatedObject(a1, v5, v6, (void *)1);

  }
  else
  {
    objc_setAssociatedObject(a1, (const void *)applicationBackgroundBlockKey, 0, (void *)1);
  }

}

- (id)_as_viewControllerToPresentFrom
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_msgSend(v1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    while (1)
    {
      v3 = v2;
      if ((objc_msgSend(v2, "isBeingDismissed") & 1) != 0)
        break;

      objc_msgSend(v3, "presentedViewController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = v3;
      if (!v2)
      {
        v1 = v3;
        v3 = 0;
        break;
      }
    }

  }
  return v1;
}

- (id)_as_presentedViewControllerStackForPasswordManagerUpToClasses:()AuthenticationServicesExtras
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      v10 = (void *)MEMORY[0x24BDBD1A8];
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "presentedViewController", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          break;
        if (v8 == ++v11)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "presentedViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v14);

      objc_msgSend(a1, "presentedViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_as_presentedViewControllerStackForPasswordManagerUpToClasses:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v16);

      v6 = v15;
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

- (void)_as_restorePresentedViewControllerStackForPasswordManager:()AuthenticationServicesExtras
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __108__UIViewController_AuthenticationServicesExtras___as_restorePresentedViewControllerStackForPasswordManager___block_invoke;
    v7[3] = &unk_24C94F5F8;
    v8 = v5;
    v9 = v4;
    v6 = v5;
    objc_msgSend(a1, "presentViewController:animated:completion:", v6, 0, v7);

  }
}

@end
