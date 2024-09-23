@implementation SFPopoverPresentationDelegate

uint64_t __55___SFPopoverPresentationDelegate_updatePopoverPosition__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  void *v11;
  id v12;

  v11 = *(void **)(a1 + 32);
  v12 = a2;
  objc_msgSend(v11, "setSourceRect:", a3, a4, a5, a6);
  objc_msgSend(*(id *)(a1 + 32), "setSourceView:", v12);

  return objc_msgSend(*(id *)(a1 + 32), "setBarButtonItem:", 0);
}

uint64_t __55___SFPopoverPresentationDelegate_updatePopoverPosition__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBarButtonItem:", a2);
}

id __99___SFPopoverPresentationDelegate_popoverPresentationController_willRepositionPopoverToRect_inView___block_invoke(uint64_t a1, id a2, double a3, double a4, double a5, double a6)
{
  double *v7;
  id result;

  v7 = *(double **)(a1 + 32);
  *v7 = a3;
  v7[1] = a4;
  v7[2] = a5;
  v7[3] = a6;
  result = objc_retainAutorelease(a2);
  **(_QWORD **)(a1 + 40) = result;
  return result;
}

void __99___SFPopoverPresentationDelegate_popoverPresentationController_willRepositionPopoverToRect_inView___block_invoke_3(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

@end
