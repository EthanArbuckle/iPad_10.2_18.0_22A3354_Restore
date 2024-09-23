@implementation UIViewController(SafeAppearancePropagation)

- (uint64_t)ccui_shouldPropagateAppearanceCalls
{
  return 0;
}

- (uint64_t)ccui_safelyBeginAppearanceTransition:()SafeAppearancePropagation animated:
{
  uint64_t result;

  objc_msgSend(a1, "bs_beginAppearanceTransition:animated:");
  result = objc_msgSend(a1, "ccui_shouldPropagateAppearanceCalls");
  if ((_DWORD)result)
    return objc_msgSend(a1, "ccui_safelyBeginAppearanceTransitionForChildViewControllers:animated:", a3, a4);
  return result;
}

- (uint64_t)ccui_safelyEndAppearanceTransition
{
  uint64_t result;

  objc_msgSend(a1, "bs_endAppearanceTransition");
  result = objc_msgSend(a1, "ccui_shouldPropagateAppearanceCalls");
  if ((_DWORD)result)
    return objc_msgSend(a1, "ccui_safelyEndAppearanceTransitionForChildViewControllers");
  return result;
}

- (void)ccui_safelyBeginAppearanceTransitionForChildViewControllers:()SafeAppearancePropagation animated:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_ccui_childViewControllersForAppearancePropagation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "ccui_safelyBeginAppearanceTransition:animated:", a3, a4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)ccui_safelyEndAppearanceTransitionForChildViewControllers
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_ccui_childViewControllersForAppearancePropagation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "ccui_safelyEndAppearanceTransition");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)_ccui_childViewControllersForAppearancePropagation
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "childViewControllersForAppearancePropagation");
  else
    objc_msgSend(a1, "childViewControllers");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
