@implementation UIMenu

void __101__UIMenu_MobileSafariExtras__safari_menuWithTitle_image_identifier_options_uncachedChildrenProvider___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  uint64_t v3;
  void (*v4)(uint64_t);
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))a2)[2](v5, v6);

}

void __99__UIMenu_MobileSafariExtras__safari_menuWithTitle_image_identifier_options_cachedChildrenProvider___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  uint64_t v3;
  void (*v4)(uint64_t);
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))a2)[2](v5, v6);

}

uint64_t __45__UIMenu_MobileSafariExtras__sf_bookmarkMenu__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC39D0], "sf_bookmarkMenuChildrenProvider");
}

id __71__UIMenu_MobileSafariExtras__sf_tabMenuWithAdditionalChildrenProvider___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;

  v1 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "commandWithTitle:image:action:propertyList:", v2, v3, sel_closeAllTabsMatchingSearch_, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAttributes:", 2);
  v5 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commandWithTitle:image:action:propertyList:", v6, v7, sel_closeAllTabs_, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAttributes:", 2);
  v9 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commandWithTitle:image:action:propertyList:", v10, v11, sel_closeActiveTab_, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setAttributes:", 2);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.square.on.square"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commandWithTitle:image:action:propertyList:", v15, v16, sel_openNewTab_, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v17);

  v18 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.square.fill.on.square.fill"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commandWithTitle:image:action:propertyList:", v19, v20, sel_openNewPrivateTab_, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v21);

  v22 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.square"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commandWithTitle:image:action:propertyList:", v23, v24, sel_openNewWindow_, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v25);

  v26 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.square.fill"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commandWithTitle:image:action:propertyList:", v27, v28, sel_openNewPrivateWindow_, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v29);

  v30 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.merge"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commandWithTitle:image:action:propertyList:", v31, v32, sel_mergeAllWindows_, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v33);

  v34 = *(_QWORD *)(a1 + 32);
  if (v34)
  {
    (*(void (**)(void))(v34 + 16))();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "count"))
      objc_msgSend(v13, "addObjectsFromArray:", v35);

  }
  objc_msgSend(v13, "addObject:", v12);
  objc_msgSend(v13, "addObject:", v8);
  objc_msgSend(v13, "addObject:", v4);

  return v13;
}

@end
