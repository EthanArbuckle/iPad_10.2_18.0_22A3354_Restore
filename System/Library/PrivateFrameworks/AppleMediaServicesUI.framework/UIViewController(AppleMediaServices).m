@implementation UIViewController(AppleMediaServices)

- (id)ams_backgroundColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ams_backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ams_frontmostController
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    do
    {
      objc_msgSend(v1, "presentedViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "presentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v3;
    }
    while (v4);
  }
  else
  {
    v3 = v1;
  }
  return v3;
}

- (id)ams_navigationController
{
  void *v2;

  objc_msgSend(a1, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(a1, "navigationController");
  else
    objc_msgSend(a1, "ams_parentViewControllerOfClass:", objc_opt_class());
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)ams_navigationIndex
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "ams_navigationItemViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "ams_navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObject:", v2);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)ams_parentContainer
{
  return objc_msgSend(a1, "ams_parentViewControllerOfClass:", objc_opt_class());
}

- (id)ams_parentViewControllerOfClass:()AppleMediaServices
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v1, "parentViewController");
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v2;
    }
    while (v2);
  }
  return v1;
}

- (id)ams_navigationItemViewController
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    if (v1)
    {
      objc_msgSend(v1, "parentViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        while (1)
        {
          v4 = v3;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;

          objc_msgSend(v4, "parentViewController");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v1 = v4;
          if (!v3)
            goto LABEL_9;
        }
        v3 = v4;
      }
LABEL_9:

    }
    v1 = v1;
    v2 = v1;
  }

  return v2;
}

- (void)ams_setBackgroundColor:()AppleMediaServices
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_setBackgroundColor:", v4);

}

- (void)ams_dismissViewControllerAnimated:()AppleMediaServices includePresented:completion:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(void *, void *);
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD aBlock[4];
  id v20;
  id v21;
  char v22;

  v8 = a5;
  v9 = a1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__UIViewController_AppleMediaServices__ams_dismissViewControllerAnimated_includePresented_completion___block_invoke;
  aBlock[3] = &unk_24CB52320;
  v22 = a3;
  v10 = v9;
  v20 = v10;
  v11 = v8;
  v21 = v11;
  v12 = (void (**)(void *, void *))_Block_copy(aBlock);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v13, "addObject:", v10);
  if (a4)
  {
    objc_msgSend(v10, "presentedViewController");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      do
      {
        objc_msgSend(v13, "addObject:", v15);
        objc_msgSend(v15, "presentedViewController");
        v16 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v16;
      }
      while (v16);
    }
  }
  v17 = objc_msgSend(v13, "count") - 1;
  if (v17 >= 0)
  {
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v18);

      --v17;
    }
    while (v17 != -1);
  }

}

- (uint64_t)ams_hasDescendentChildViewController:()AppleMediaServices
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "childViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v10 == v4 || (objc_msgSend(v10, "ams_hasDescendentChildViewController:", v4) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (void)ams_removeFromParentViewController
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "ams_willMoveToParentViewController:", 0);
    objc_msgSend(a1, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(a1, "removeFromParentViewController");
  }
}

- (void)ams_setChildViewController:()AppleMediaServices
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "ams_removeFromParentViewController");
  objc_msgSend(a1, "addChildViewController:", v6);
  objc_msgSend(a1, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  objc_msgSend(v6, "ams_didMoveToParentViewController:", a1);
}

- (void)ams_transitionFromViewController:()AppleMediaServices toViewController:completionHandler:
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __108__UIViewController_AppleMediaServices__ams_transitionFromViewController_toViewController_completionHandler___block_invoke_2;
  v10[3] = &unk_24CB50840;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "transitionFromViewController:toViewController:duration:options:animations:completion:", a3, a4, 5242880, &__block_literal_global_35, v10, 0.3);

}

@end
