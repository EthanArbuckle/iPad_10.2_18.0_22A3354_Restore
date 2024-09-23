@implementation UIAlertController

void __67__UIAlertController_MCUI__MCUIAddActionWithTitle_style_completion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__UIAlertController_MCUI__MCUIAddActionWithTitle_style_completion___block_invoke_2;
  block[3] = &unk_1EA2B5D88;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __67__UIAlertController_MCUI__MCUIAddActionWithTitle_style_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__UIAlertController_MCUI__MCUIShowFromController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);

}

void __65__UIAlertController_MCUI__MCUIShowRebootAlertFromViewController___block_invoke()
{
  void *v0;
  id v1;

  if (MCUIForPairedDevice())
  {
    NSLog(CFSTR("MCUI rebooting Watch"));
    v1 = (id)objc_opt_new();
    objc_msgSend(v1, "rebootDevice");
  }
  else
  {
    NSLog(CFSTR("MCUI rebooting iOS"));
    v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D23280]), "initWithReason:", CFSTR("MCUI reboot iOS device"));
    objc_msgSend(v1, "setRebootType:", 1);
    objc_msgSend(MEMORY[0x1E0D23288], "sharedService");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "shutdownWithOptions:", v1);

  }
}

void __65__UIAlertController_MCUI__MCUIShowRebootAlertFromViewController___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "MCUITopViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

@end
