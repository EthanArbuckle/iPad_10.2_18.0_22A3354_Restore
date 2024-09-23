@implementation UIViewController(BaseBoardUI)

- (uint64_t)bs_endAppearanceTransitionForChildViewController:()BaseBoardUI toVisible:
{
  id v6;
  uint64_t v7;

  v6 = a3;
  objc_msgSend(a1, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v6, a4, 0);
  v7 = objc_msgSend(a1, "bs_endAppearanceTransitionForChildViewController:", v6);

  return v7;
}

- (uint64_t)bs_endAppearanceTransitionForChildViewController:()BaseBoardUI
{
  id v5;
  id v6;
  uint64_t v7;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1 == v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("self != childController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v14 = v10;
      v15 = 2114;
      v16 = v12;
      v17 = 2048;
      v18 = a1;
      v19 = 2114;
      v20 = CFSTR("UIViewController+BaseBoardUI.m");
      v21 = 1024;
      v22 = 83;
      v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A0236888);
  }
  if ((objc_msgSend(a1, "shouldAutomaticallyForwardAppearanceMethods") & 1) == 0
    && (objc_msgSend(v5, "parentViewController"),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == a1))
  {
    v7 = objc_msgSend(v5, "bs_endAppearanceTransition");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)bs_endAppearanceTransition:()BaseBoardUI
{
  objc_msgSend(a1, "bs_beginAppearanceTransition:animated:", a3, 0);
  return objc_msgSend(a1, "bs_endAppearanceTransition");
}

- (uint64_t)bs_beginAppearanceTransitionForChildViewController:()BaseBoardUI toVisible:animated:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (a1 == v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("self != childController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v18 = v14;
      v19 = 2114;
      v20 = v16;
      v21 = 2048;
      v22 = a1;
      v23 = 2114;
      v24 = CFSTR("UIViewController+BaseBoardUI.m");
      v25 = 1024;
      v26 = 68;
      v27 = 2114;
      v28 = v13;
      _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A0236AC4);
  }
  if ((objc_msgSend(a1, "shouldAutomaticallyForwardAppearanceMethods") & 1) != 0
    || (objc_msgSend(v9, "parentViewController"),
        v10 = (id)objc_claimAutoreleasedReturnValue(),
        v10,
        v10 != a1)
    || (_DWORD)a4 && !objc_msgSend(a1, "_appearState"))
  {
    v11 = 0;
  }
  else
  {
    v11 = objc_msgSend(v9, "bs_beginAppearanceTransition:animated:", a4, a5);
  }

  return v11;
}

- (BOOL)bs_endAppearanceTransition
{
  int v2;

  v2 = objc_msgSend(a1, "_appearState") & 0xFFFFFFFD;
  if (v2 == 1)
    objc_msgSend(a1, "endAppearanceTransition");
  return v2 == 1;
}

- (uint64_t)bs_beginAppearanceTransition:()BaseBoardUI animated:
{
  uint64_t result;

  if ((_DWORD)a3)
  {
    if ((objc_msgSend(a1, "bs_isDisappearingOrDisappeared") & 1) == 0)
      return 0;
  }
  else
  {
    result = objc_msgSend(a1, "bs_isAppearingOrAppeared");
    if (!(_DWORD)result)
      return result;
  }
  objc_msgSend(a1, "beginAppearanceTransition:animated:", a3, a4);
  return 1;
}

- (BOOL)bs_isAppearingOrAppeared
{
  return objc_msgSend(a1, "_appearState") - 1 < 2;
}

- (BOOL)bs_isDisappearingOrDisappeared
{
  int v1;

  v1 = objc_msgSend(a1, "_appearState");
  return !v1 || v1 == 3;
}

+ (id)bs_nextViewControllerForView:()BaseBoardUI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    do
    {
      objc_msgSend(a1, "viewControllerForView:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        break;
      v5 = v7;
    }
    while (!v6);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  return v6;
}

- (uint64_t)bs_addChildViewController:()BaseBoardUI
{
  return objc_msgSend(a1, "bs_addChildViewController:withSuperview:animated:transitionBlock:", a3, 0, 0, 0);
}

- (uint64_t)bs_addChildViewController:()BaseBoardUI animated:transitionBlock:
{
  return objc_msgSend(a1, "bs_addChildViewController:withSuperview:animated:transitionBlock:", a3, 0, a4, a5);
}

- (uint64_t)bs_addChildViewController:()BaseBoardUI withSuperview:
{
  return objc_msgSend(a1, "bs_addChildViewController:withSuperview:animated:transitionBlock:", a3, a4, 0, 0);
}

- (uint64_t)bs_addChildViewController:()BaseBoardUI withSuperview:animated:transitionBlock:
{
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  void *v25;
  void (*v26)(_QWORD *, _QWORD *);
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  void (**v31)(_QWORD, _QWORD);
  _QWORD v32[4];
  id v33;
  void *v34;
  char v35;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10
    && objc_msgSend(a1, "isViewLoaded")
    && (objc_msgSend(v10, "parentViewController"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v13 != a1))
  {
    objc_msgSend(v10, "loadViewIfNeeded");
    objc_msgSend(a1, "addChildViewController:", v10);
    v14 = objc_msgSend(a1, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v10, 1, a5);
    if (v11)
    {
      v15 = v11;
    }
    else
    {
      objc_msgSend(a1, "view");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v15;
    objc_msgSend(v10, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "superview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20 || (objc_msgSend(v20, "isDescendantOfView:", v18) & 1) == 0)
      objc_msgSend(v18, "addSubview:", v19);
    v22 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke;
    v32[3] = &unk_1E43490D0;
    v33 = v10;
    v34 = a1;
    v35 = v14;
    v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AF63A8](v32);
    v24 = v23;
    if (v12)
    {
      v25 = (void *)MEMORY[0x1E0D016E8];
      v30[0] = v22;
      v30[1] = 3221225472;
      v30[2] = __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke_9;
      v30[3] = &unk_1E43490F8;
      v31 = v23;
      objc_msgSend(v25, "sentinelWithCompletion:", v30);
      v28[0] = v22;
      v28[1] = 3221225472;
      v28[2] = __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke_2_11;
      v28[3] = &unk_1E4348DB0;
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v26 = (void (*)(_QWORD *, _QWORD *))v12[2];
      v27 = v29;
      v26(v12, v28);

    }
    else
    {
      v23[2](v23, 1);
    }

    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (uint64_t)bs_removeChildViewController:()BaseBoardUI
{
  return objc_msgSend(a1, "bs_removeChildViewController:animated:transitionBlock:", a3, 0, 0);
}

- (uint64_t)bs_removeChildViewController:()BaseBoardUI animated:transitionBlock:
{
  id v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  void (*v17)(_QWORD *, _QWORD *);
  id v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  void (**v23)(_QWORD, _QWORD);
  _QWORD v24[4];
  id v25;
  void *v26;
  char v27;

  v8 = a3;
  v9 = a5;
  if (v8
    && (objc_msgSend(v8, "parentViewController"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10 == a1))
  {
    objc_msgSend(v8, "willMoveToParentViewController:", 0);
    v12 = objc_msgSend(a1, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v8, 0, a4);
    v13 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke;
    v24[3] = &unk_1E43490D0;
    v25 = v8;
    v26 = a1;
    v27 = v12;
    v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AF63A8](v24);
    v15 = v14;
    if (v9)
    {
      v16 = (void *)MEMORY[0x1E0D016E8];
      v22[0] = v13;
      v22[1] = 3221225472;
      v22[2] = __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke_12;
      v22[3] = &unk_1E43490F8;
      v23 = v14;
      objc_msgSend(v16, "sentinelWithCompletion:", v22);
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke_2_13;
      v20[3] = &unk_1E4348DB0;
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (void (*)(_QWORD *, _QWORD *))v9[2];
      v18 = v21;
      v17(v9, v20);

    }
    else
    {
      v14[2](v14, 1);
    }

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)bs_presentedViewControllerIncludingAncestors
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_presentedViewControllerIncludingAncestors");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)bs_presentationContextDefiningViewController
{
  id v1;
  void *v2;
  void *i;
  char v4;
  char v5;
  id v6;
  uint64_t v7;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    for (i = v1; ; i = (void *)v7)
    {
      v4 = objc_msgSend(v2, "definesPresentationContext");
      v5 = i ? v4 : 1;
      if ((v5 & 1) != 0)
        break;
      v6 = i;

      objc_msgSend(v6, "parentViewController");
      v7 = objc_claimAutoreleasedReturnValue();

      v2 = v6;
    }
  }
  else
  {
    i = 0;
  }

  return v2;
}

- (id)bs_topPresentedViewController
{
  id v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
    do
    {
      v4 = v2;
      v2 = v3;

      objc_msgSend(v2, "presentedViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v3);
  }
  return v2;
}

- (void)bs_traitCollectionDidChange:()BaseBoardUI forManagedTraitEnvironment:
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(a1, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_traitCollectionDidChange:forManagedTraitEnvironment:", v8, v6);

}

@end
