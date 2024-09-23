@implementation _CNContactQuickActionsAlertSheetDisambiguationMenuPresentation

- (id)viewControllerForPresentingActionsController:(id)a3 fromView:(id)a4 dismissDisambiguationMenuHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  objc_super v24;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0DC3450];
  v11 = a3;
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)_CNContactQuickActionsAlertSheetDisambiguationMenuPresentation;
  -[CNContactQuickActionsDisambiguationMenuPresentation viewControllerForPresentingActionsController:fromView:dismissDisambiguationMenuHandler:](&v24, sel_viewControllerForPresentingActionsController_fromView_dismissDisambiguationMenuHandler_, v11, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setContentViewController:", v13);
  v14 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __153___CNContactQuickActionsAlertSheetDisambiguationMenuPresentation_viewControllerForPresentingActionsController_fromView_dismissDisambiguationMenuHandler___block_invoke;
  v22[3] = &unk_1E204E498;
  v23 = v9;
  v17 = v9;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v18);

  objc_msgSend(v12, "popoverPresentationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "setSourceView:", v8);
    objc_msgSend(v8, "bounds");
    objc_msgSend(v20, "setSourceRect:");
  }

  return v12;
}

@end
