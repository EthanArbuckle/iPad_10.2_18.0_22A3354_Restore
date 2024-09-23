@implementation SWCollaborationBarButtonItem

void __65___SWCollaborationBarButtonItem_initWithCollaborationButtonView___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemImageNamed:withConfiguration:", CFSTR("person.crop.circle.badge.checkmark"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3428];
  SWFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("COLLABORATION"), &stru_1E2875070, CFSTR("SharedWithYou"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __65___SWCollaborationBarButtonItem_initWithCollaborationButtonView___block_invoke_2;
  v15 = &unk_1E2873B88;
  v16 = *(id *)(a1 + 32);
  objc_copyWeak(&v17, (id *)(a1 + 40));
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, v6, 0, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1, v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v11);

  objc_destroyWeak(&v17);
}

void __65___SWCollaborationBarButtonItem_initWithCollaborationButtonView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _SWCollaborationDetailViewController *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _SWCollaborationDetailViewController *v15;

  v3 = a2;
  v4 = [_SWCollaborationDetailViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "buttonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_SWCollaborationDetailViewController initWithItemProvider_impl:](v4, "initWithItemProvider_impl:", v6);

  -[_SWCollaborationDetailViewController setModalPresentationStyle:](v15, "setModalPresentationStyle:", 7);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_SWCollaborationDetailViewController popoverPresentationController](v15, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", WeakRetained);

  objc_msgSend(v3, "presentationSourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationSourceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SWCollaborationDetailViewController popoverPresentationController](v15, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSourceItem:", v10);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1E0DC3F20];
    objc_msgSend(v9, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_viewControllerForFullScreenPresentationFromView:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "presentViewController:animated:completion:", v15, 1, 0);
  }

}

@end
