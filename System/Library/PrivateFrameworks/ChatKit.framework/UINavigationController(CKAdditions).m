@implementation UINavigationController(CKAdditions)

- (void)__ck_callDelegateBlocks
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, &key);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &key, 0, (void *)0x301);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)__ck_enqueueCompletionBlock:()CKAdditions
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *aBlock;

  v5 = a3;
  if (v5)
  {
    aBlock = v5;
    objc_msgSend(a1, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UINavigationController_CKAdditions.m"), 18, CFSTR("Calling %@ on a navigation controller with no delegate is incorrect usage."), v10);

    }
    objc_getAssociatedObject(a1, &key);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(a1, &key, v7, (void *)0x301);
    }
    v8 = _Block_copy(aBlock);
    objc_msgSend(v7, "addObject:", v8);

    v5 = aBlock;
  }

}

- (void)__ck_pushViewController:()CKAdditions animated:completion:
{
  id v8;

  v8 = a3;
  objc_msgSend(a1, "__ck_enqueueCompletionBlock:", a5);
  objc_msgSend(a1, "pushViewController:animated:", v8, a4);

}

- (id)__ck_popViewControllerAnimated:()CKAdditions completion:
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __81__UINavigationController_CKAdditions____ck_popViewControllerAnimated_completion___block_invoke;
  v15 = &unk_1E275A018;
  v17 = &v18;
  v7 = (void (**)(_QWORD))v6;
  v16 = v7;
  v8 = _Block_copy(&v12);
  objc_msgSend(a1, "__ck_enqueueCompletionBlock:", v8, v12, v13, v14, v15);
  objc_msgSend(a1, "popViewControllerAnimated:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  *((_BYTE *)v19 + 24) = v9 != 0;
  if (v7 && !v9)
    v7[2](v7);

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)__ck_popToViewController:()CKAdditions animated:completion:
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __84__UINavigationController_CKAdditions____ck_popToViewController_animated_completion___block_invoke;
  v18 = &unk_1E275A018;
  v20 = &v21;
  v10 = (void (**)(_QWORD))v9;
  v19 = v10;
  v11 = _Block_copy(&v15);
  objc_msgSend(a1, "__ck_enqueueCompletionBlock:", v11, v15, v16, v17, v18);
  objc_msgSend(a1, "popToViewController:animated:", v8, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  *((_BYTE *)v22 + 24) = v13 != 0;
  if (v10 && !v13)
    v10[2](v10);

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (id)__ck_popToRootViewControllerAnimated:()CKAdditions completion:
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __87__UINavigationController_CKAdditions____ck_popToRootViewControllerAnimated_completion___block_invoke;
  v15 = &unk_1E275A018;
  v17 = &v18;
  v7 = (void (**)(_QWORD))v6;
  v16 = v7;
  v8 = _Block_copy(&v12);
  objc_msgSend(a1, "__ck_enqueueCompletionBlock:", v8, v12, v13, v14, v15);
  objc_msgSend(a1, "popToRootViewControllerAnimated:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  *((_BYTE *)v19 + 24) = v10 != 0;
  if (v7 && !v10)
    v7[2](v7);

  _Block_object_dispose(&v18, 8);
  return v9;
}

@end
