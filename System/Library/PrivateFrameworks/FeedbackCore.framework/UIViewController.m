@implementation UIViewController

void __40__UIViewController_Spinner__hideSpinner__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_INFO, "Hiding toolbar activity indicator", v9, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 1);

    if (objc_msgSend(*(id *)(a1 + 32), "newFeedbackButtonState")
      || (objc_msgSend(*(id *)(a1 + 32), "leftToolbarItem"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      objc_msgSend(*(id *)(a1 + 32), "showToolbarWithStatus:animated:", &stru_24E15EAF8, 1);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setToolbarHidden:animated:", 1, 1);

    }
  }
}

void __122__UIViewController_Spinner__showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v1 = (void *)showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__leftSpacing;
  showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__leftSpacing = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v3 = (void *)showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__rightSpacing;
  showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__rightSpacing = v2;

}

void __122__UIViewController_Spinner__showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setToolbarHidden:animated:", 0, *(unsigned __int8 *)(a1 + 40));

  }
}

@end
