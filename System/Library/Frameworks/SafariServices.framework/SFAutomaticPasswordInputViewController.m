@implementation SFAutomaticPasswordInputViewController

void __138___SFAutomaticPasswordInputViewController__inputViewControllerWithAutoFillContext_passwordRules_overrideApplicationIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __138___SFAutomaticPasswordInputViewController__inputViewControllerWithAutoFillContext_passwordRules_overrideApplicationIdentifier_completion___block_invoke_cold_1((uint64_t)v8, v6, v10);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __138___SFAutomaticPasswordInputViewController__inputViewControllerWithAutoFillContext_passwordRules_overrideApplicationIdentifier_completion___block_invoke_16;
  v12[3] = &unk_1E4AC13D8;
  v13 = v5;
  v14 = *(id *)(a1 + 48);
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __138___SFAutomaticPasswordInputViewController__inputViewControllerWithAutoFillContext_passwordRules_overrideApplicationIdentifier_completion___block_invoke_16(uint64_t a1)
{
  _SFAutomaticPasswordInputViewController *v2;
  _SFAutomaticPasswordInputViewController *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    v2 = -[_SFAutomaticPasswordInputViewController initWithPassword:keyboardType:]([_SFAutomaticPasswordInputViewController alloc], "initWithPassword:keyboardType:", *(_QWORD *)(a1 + 32), 1);
  else
    v2 = 0;
  v3 = v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "inputViewControllerDidSelectUseCustomPassword:", *(_QWORD *)(a1 + 40));
}

uint64_t __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "replaceCurrentPasswordWithPassword:", *(_QWORD *)(a1 + 40));
}

uint64_t __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChooseStrongPasswordWithoutSpecialCharacters");

  return objc_msgSend(*(id *)(a1 + 32), "replaceCurrentPasswordWithPassword:", *(_QWORD *)(a1 + 40));
}

uint64_t __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChooseToEditStrongPassword");

  return objc_msgSend(*(id *)(a1 + 32), "makeStrongPasswordFieldViewableAndEditable:", 1);
}

uint64_t __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "copyCurrentStrongPassword");
}

void __138___SFAutomaticPasswordInputViewController__inputViewControllerWithAutoFillContext_passwordRules_overrideApplicationIdentifier_completion___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  unint64_t v9;
  __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D8A090]);

  if ((v8 & 1) != 0)
  {
    v9 = objc_msgSend(v5, "code");

    if (v9 > 3)
      v10 = &stru_1E4AC8470;
    else
      v10 = off_1E4AC4998[v9];
  }
  else
  {
    objc_msgSend(v5, "safari_privacyPreservingDescription");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v11 = 138543618;
  v12 = a1;
  v13 = 2114;
  v14 = v10;
  _os_log_error_impl(&dword_1A3B2D000, v6, OS_LOG_TYPE_ERROR, "Cannot show Automatic Strong Passwords for app bundleID: %{public}@ due to error: %{public}@", (uint8_t *)&v11, 0x16u);

}

@end
