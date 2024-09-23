@implementation UIViewController(GKDashboardUtils)

- (id)_gkExtensionViewController
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EEC84980))
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(a1, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EEC84980))
    {
      v2 = v4;
    }
    else
    {
      objc_msgSend(a1, "parentViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parentViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EEC84980))
        v2 = v7;
      else
        v2 = 0;

    }
  }
  return v2;
}

- (void)_gkModifyTopConstraintToLayoutGuideForSubview:()GKDashboardUtils
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "firstItem", (_QWORD)v22);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13 == v4)
        {
          v14 = objc_msgSend(v12, "firstAttribute");

          if (v14 == 3)
          {
            objc_msgSend(v4, "topAnchor");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "view");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "safeAreaLayoutGuide");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "bottomAnchor");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "constant");
            objc_msgSend(v15, "constraintEqualToAnchor:constant:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(a1, "view");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "removeConstraint:", v12);

            objc_msgSend(a1, "view");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addConstraint:", v19);

            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)_gkShowViewController:()GKDashboardUtils
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "showViewController:sender:", v4, a1);
  objc_msgSend(v4, "_gkSetOriginatingViewController:", a1);

}

- (void)_gkRemoveViewController:()GKDashboardUtils animated:
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "_gkSetOriginatingViewController:", 0);
  objc_msgSend(v14, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v14);

  v8 = v7 - 1;
  if ((unint64_t)(v7 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(v14, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", a4, 0);
  }
  else
  {
    objc_msgSend(v14, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "popToViewController:animated:", v11, a4);

  }
}

- (void)_gkSetOriginatingViewController:()GKDashboardUtils
{
  objc_setAssociatedObject(a1, CFSTR("GKOriginatingViewControllerKey"), a3, 0);
}

- (id)_gkOriginatingViewController
{
  void *v2;

  objc_getAssociatedObject(a1, CFSTR("GKOriginatingViewControllerKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "_gkOriginatingViewControllerAutoDetermined");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_gkOriginatingViewControllerAutoDetermined
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "indexOfObject:", a1);
  v5 = v4 - 1;
  if (v4 < 1 || (objc_msgSend(v3, "objectAtIndex:", v5), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "presentingViewController", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_gkPresentViewController:()GKDashboardUtils animated:
{
  id v6;

  v6 = a3;
  objc_msgSend(a1, "presentViewController:animated:completion:", v6, a4, 0);
  objc_msgSend(v6, "_gkSetOriginatingViewController:", a1);

}

- (void)_gkPresentViewController:()GKDashboardUtils asPopoverFromView:animated:
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v20 = a4;
  v8 = a3;
  if (v20)
  {
    objc_msgSend(v8, "setModalPresentationStyle:", 7);
    objc_msgSend(v20, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSourceView:", v9);

    objc_msgSend(v20, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v8, "popoverPresentationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSourceRect:", v12, v14, v16, v18);

    objc_msgSend(a1, "presentViewController:animated:completion:", v8, a5, 0);
    objc_msgSend(v8, "_gkSetOriginatingViewController:", a1);
  }
  else
  {
    objc_msgSend(a1, "_gkPresentViewController:animated:", v8, a5);
  }

}

- (void)_gkDismissViewController:()GKDashboardUtils animated:
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(v5, "presentingViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkSetOriginatingViewController:", 0);

  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", a4, 0);
}

- (uint64_t)_gkPushViewController:()GKDashboardUtils animated:
{
  return objc_msgSend(a1, "_gkPushViewController:replaceCurrent:animated:", a3, 0, a4);
}

- (void)_gkPushViewController:()GKDashboardUtils replaceCurrent:animated:
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(a1, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4)
  {
    objc_msgSend(v8, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_gkSetOriginatingViewController:", 0);

    objc_msgSend(v11, "removeLastObject");
    objc_msgSend(v11, "addObject:", v13);
    objc_msgSend(v9, "setViewControllers:animated:", v11, a5);

  }
  else
  {
    objc_msgSend(v8, "pushViewController:animated:", v13, a5);
  }

  objc_msgSend(v13, "_gkSetOriginatingViewController:", a1);
}

- (void)_gkPopViewControllerAnimated:()GKDashboardUtils
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(a1, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_gkSetOriginatingViewController:", 0);

  objc_msgSend(a1, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "popViewControllerAnimated:", a3);

}

@end
