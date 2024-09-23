@implementation UIViewController

void __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  BSDispatchMain();

}

uint64_t __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 48))
  {
    BSLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D01748], "succinctDescriptionForObject:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D01748], "succinctDescriptionForObject:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_error_impl(&dword_1A0234000, v2, OS_LOG_TYPE_ERROR, "transition completion not called adding %@ to %@", (uint8_t *)&v6, 0x16u);

    }
  }
  if (*(_BYTE *)(a1 + 49))
    objc_msgSend(*(id *)(a1 + 40), "bs_endAppearanceTransitionForChildViewController:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
}

void __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v3, "isFailed") ^ 1);

}

uint64_t __98__UIViewController_BaseBoardUI__bs_addChildViewController_withSuperview_animated_transitionBlock___block_invoke_2_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

void __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  BSDispatchMain();

}

uint64_t __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 48))
  {
    BSLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D01748], "succinctDescriptionForObject:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D01748], "succinctDescriptionForObject:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_1A0234000, v2, OS_LOG_TYPE_ERROR, "transition completion not called removing %@ from %@", (uint8_t *)&v7, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  if (*(_BYTE *)(a1 + 49))
    objc_msgSend(*(id *)(a1 + 40), "bs_endAppearanceTransitionForChildViewController:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
}

void __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v3, "isFailed") ^ 1);

}

uint64_t __87__UIViewController_BaseBoardUI__bs_removeChildViewController_animated_transitionBlock___block_invoke_2_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

@end
