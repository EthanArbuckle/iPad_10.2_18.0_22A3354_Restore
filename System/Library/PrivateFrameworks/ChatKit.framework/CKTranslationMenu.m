@implementation CKTranslationMenu

+ (id)translateActionForChatItem:(id)a3 forController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v5 = a3;
  v6 = a4;
  location = 0;
  objc_initWeak(&location, v6);
  v7 = (void *)MEMORY[0x1E0CEA688];
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TRANSLATE_ORB_MENU"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__CKTranslationMenu_translateActionForChatItem_forController___block_invoke;
  v13[3] = &unk_1E274D310;
  v10 = v5;
  v14 = v10;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v7, "actionWithTitle:type:handler:", v9, 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
  return v11;
}

void __62__CKTranslationMenu_translateActionForChatItem_forController___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v4;
  id WeakRetained;

  v4 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[CKTranslationMenu actionTranslateIsTappedForChatItem:forController:](CKTranslationMenu, "actionTranslateIsTappedForChatItem:forController:", v4, WeakRetained);

  *a3 = 1;
}

+ (id)translateOrbActionForChatItem:(id)a3 forController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v5 = a3;
  v6 = a4;
  location = 0;
  objc_initWeak(&location, v6);
  v7 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TRANSLATE_ORB_MENU"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("translate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__CKTranslationMenu_translateOrbActionForChatItem_forController___block_invoke;
  v14[3] = &unk_1E2757858;
  v11 = v5;
  v15 = v11;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, v10, 0, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  return v12;
}

void __65__CKTranslationMenu_translateOrbActionForChatItem_forController___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[CKTranslationMenu actionTranslateIsTappedForChatItem:forController:](CKTranslationMenu, "actionTranslateIsTappedForChatItem:forController:", v1, WeakRetained);

}

+ (void)actionTranslateIsTappedForChatItem:(id)a3 forController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "text");
    else
      objc_msgSend(v5, "transcriptText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0910]), "initWithNibName:bundle:", 0, 0);
    objc_msgSend(v8, "setIsSourceEditable:", 0);
    objc_msgSend(v8, "setText:", v7);
    objc_msgSend(v8, "setModalPresentationStyle:", 7);
    v18[0] = *MEMORY[0x1E0D381F0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIgnoredAttributes:", v9);

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11 == 1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "collectionViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "balloonViewForChatItem:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "presentationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSourceView:", v13);

    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__CKTranslationMenu_actionTranslateIsTappedForChatItem_forController___block_invoke;
    v16[3] = &unk_1E274A208;
    v15 = v6;
    v17 = v15;
    objc_msgSend(v8, "setDismissCompletionHandler:", v16);
    objc_msgSend(v15, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

uint64_t __70__CKTranslationMenu_actionTranslateIsTappedForChatItem_forController___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "entryViewWasActiveOnContextMenuPresentation"))
    objc_msgSend(*(id *)(a1 + 32), "showKeyboard");
  return objc_msgSend(*(id *)(a1 + 32), "reloadInputViews");
}

@end
