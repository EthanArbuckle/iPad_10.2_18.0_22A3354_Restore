@implementation CNContactQuickActionsModalDisambiguationMenuPresentation

void __148___CNContactQuickActionsModalDisambiguationMenuPresentation_viewControllerForPresentingActionsController_fromView_dismissDisambiguationMenuHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_3:

    v4 = WeakRetained;
    goto LABEL_4;
  }
  objc_msgSend(WeakRetained, "navigationController");
  v6 = objc_claimAutoreleasedReturnValue();
  v4 = WeakRetained;
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(WeakRetained, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v4 = WeakRetained;
    if (v9 == WeakRetained)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);
      goto LABEL_3;
    }
  }
LABEL_4:
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
    v4 = WeakRetained;
  }

}

@end
