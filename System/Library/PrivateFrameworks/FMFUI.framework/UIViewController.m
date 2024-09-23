@implementation UIViewController

uint64_t __61__UIViewController_FMFModal__fmf_presentModalViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fmf_afterPresentAnimation:", *(_QWORD *)(a1 + 40));
}

void __61__UIViewController_FMFModal__fmf_dismissModalViewController___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6 + v10, v8, v10);

  objc_msgSend(*(id *)(a1 + 40), "fmf_dimmingViewForViewController:", *(_QWORD *)(a1 + 32));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", 0.0);

}

uint64_t __61__UIViewController_FMFModal__fmf_dismissModalViewController___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  LogCategory_Daemon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DD58000, v2, OS_LOG_TYPE_DEFAULT, "FMFMapViewController: fmf_dismissModalViewController completed", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "fmf_afterDismissAnimation:", *(_QWORD *)(a1 + 40));
}

@end
