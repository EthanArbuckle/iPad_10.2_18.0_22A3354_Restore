@implementation _CNContactQuickActionsModalDisambiguationMenuPresentation

- (id)viewControllerForPresentingActionsController:(id)a3 fromView:(id)a4 dismissDisambiguationMenuHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CNUICancelBarButtonItem *v16;
  CNUICancelBarButtonItem *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)_CNContactQuickActionsModalDisambiguationMenuPresentation;
  -[CNContactQuickActionsDisambiguationMenuPresentation viewControllerForPresentingActionsController:fromView:dismissDisambiguationMenuHandler:](&v24, sel_viewControllerForPresentingActionsController_fromView_dismissDisambiguationMenuHandler_, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setModalPresentationStyle:", 3);
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 == 3)
  {
    +[CNUIColorRepository carPlayTableViewBackgroundColor](CNUIColorRepository, "carPlayTableViewBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v14);

  }
  else
  {
    objc_initWeak(&location, v11);
    v16 = [CNUICancelBarButtonItem alloc];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __148___CNContactQuickActionsModalDisambiguationMenuPresentation_viewControllerForPresentingActionsController_fromView_dismissDisambiguationMenuHandler___block_invoke;
    v20[3] = &unk_1E2049F90;
    objc_copyWeak(&v22, &location);
    v21 = v10;
    v17 = -[CNUICancelBarButtonItem initWithDidTapHandler:](v16, "initWithDidTapHandler:", v20);
    objc_msgSend(v11, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLeftBarButtonItem:", v17);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v11;
}

@end
