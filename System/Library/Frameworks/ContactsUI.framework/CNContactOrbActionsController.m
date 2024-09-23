@implementation CNContactOrbActionsController

+ (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  +[CNContactActionsController descriptorForRequiredKeys](CNContactActionsController, "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNQuickActionsManager descriptorForRequiredKeys](CNQuickActionsManager, "descriptorForRequiredKeys", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatterWithFallBacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactOrbActionsController descriptorForRequiredKeys]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CNContactOrbActionsController)initWithContact:(id)a3
{
  id v4;
  void *v5;
  CNContactOrbActionsController *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CNContactOrbActionsController initWithContacts:](self, "initWithContacts:", v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CNContactOrbActionsController)initWithContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNContactOrbActionsController *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      v6 = 0;
    }
    else
    {
      +[CNQuickActionsManager defaultCategories](CNQuickActionsManager, "defaultCategories");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    self = -[CNContactOrbActionsController initWithContacts:actionCategories:bypassActionValidation:](self, "initWithContacts:actionCategories:bypassActionValidation:", v5, v6, 0);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CNContactOrbActionsController)initWithContacts:(id)a3 actionCategories:(id)a4
{
  return -[CNContactOrbActionsController initWithContacts:actionCategories:bypassActionValidation:](self, "initWithContacts:actionCategories:bypassActionValidation:", a3, a4, 0);
}

- (CNContactOrbActionsController)initWithContacts:(id)a3 actionCategories:(id)a4 bypassActionValidation:(BOOL)a5
{
  id v9;
  id v10;
  CNContactOrbActionsController *v11;
  CNContactOrbActionsController *v12;
  CNContactOrbActionsController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNContactOrbActionsController;
  v11 = -[CNContactOrbActionsController init](&v15, sel_init);
  v12 = v11;
  v13 = 0;
  if (v9 && v11)
  {
    objc_storeStrong((id *)&v11->_actionCategories, a4);
    v12->_bypassActionValidation = a5;
    objc_storeStrong((id *)&v12->_contacts, a3);
    -[CNContactOrbActionsController setupActionsForContacts:](v12, "setupActionsForContacts:", v9);
    v13 = v12;
  }

  return v13;
}

- (void)setupActionsForContacts:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    if (-[CNContactOrbActionsController shouldUseActionsManagerForContacts:](self, "shouldUseActionsManagerForContacts:", v4))
    {
      -[CNContactOrbActionsController setupActionsManagerForContacts:](self, "setupActionsManagerForContacts:", v4);
      -[CNContactOrbActionsController actionsManager](self, "actionsManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __57__CNContactOrbActionsController_setupActionsForContacts___block_invoke;
      v6[3] = &unk_1E204F648;
      v6[4] = self;
      objc_msgSend(v5, "updateActionsWithBlock:", v6);
    }
    else
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactOrbActionsController setupActionsControllerForContact:](self, "setupActionsControllerForContact:", v5);
    }

  }
}

- (BOOL)shouldUseActionsManagerForContacts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  char v7;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_opt_class();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    if (v6)
    {
      if ((objc_msgSend(v6, "isUnknown") & 1) != 0)
        v7 = 1;
      else
        v7 = objc_msgSend(v6, "isSuggestedMe");
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)setupActionsManagerForContacts:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  CGRect v12;
  CGRect v13;

  +[CNQuickActionsManager actionsManagerForContacts:](CNQuickActionsManager, "actionsManagerForContacts:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactOrbActionsController actionCategories](self, "actionCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCategories:", v5);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
    if (CGRectGetHeight(v12) > 667.0)
    {
      objc_msgSend(v11, "setDesiredNumberOfActions:", 6);
LABEL_11:

      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userInterfaceIdiom"))
  {
    objc_msgSend(v11, "setDesiredNumberOfActions:", 5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_referenceBounds");
    if (CGRectGetHeight(v13) <= 568.0)
      v10 = 5;
    else
      v10 = 6;
    objc_msgSend(v11, "setDesiredNumberOfActions:", v10);

  }
  if (!v7)
    goto LABEL_11;
LABEL_12:

  objc_msgSend(v11, "setBypassActionValidation:", -[CNContactOrbActionsController bypassActionValidation](self, "bypassActionValidation"));
  objc_msgSend(v11, "setDelegate:", self);
  -[CNContactOrbActionsController setActionsManager:](self, "setActionsManager:", v11);

}

- (id)menuItemsForContactsWithActions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  CNContactOrbActionsController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  uint64_t v36;
  id obj;
  uint64_t v38;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v4;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v38)
  {
    v6 = *(_QWORD *)v41;
    v35 = v5;
    v36 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v41 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        -[CNContactOrbActionsController contacts](self, "contacts");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10 < 2)
        {
          objc_msgSend(v8, "titleForContext:", 0);
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "outlinedImage");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v18 = v16;
          }
          else
          {
            objc_msgSend(v8, "image");
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          v30 = v18;

          objc_msgSend(v8, "subtitleForContext:", 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          v11 = v8;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
          v13 = v12;

          objc_opt_class();
          if (v13)
          {
            objc_msgSend(v13, "mainAction");
            v14 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = v11;
          }
          v19 = v14;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v20 = v19;
          else
            v20 = 0;
          v21 = v20;

          if (!v21)
          {
            v6 = v36;
            goto LABEL_27;
          }
          v22 = self;
          objc_msgSend(v21, "propertyAction");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "propertyItem");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "contact");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatterWithFallBacks");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringFromContact:", v25);
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "outlinedImage");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            v29 = v27;
          }
          else
          {
            objc_msgSend(v21, "image");
            v29 = (id)objc_claimAutoreleasedReturnValue();
          }
          v30 = v29;

          v31 = 0;
          self = v22;
          v5 = v35;
          v6 = v36;
        }
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __65__CNContactOrbActionsController_menuItemsForContactsWithActions___block_invoke;
        v39[3] = &unk_1E2050228;
        v39[4] = v8;
        objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", v15, v30, 0, v39);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setDiscoverabilityTitle:", v31);
        objc_msgSend(v5, "addObject:", v32);

        v13 = (id)v15;
LABEL_27:

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v38);
  }

  v33 = (void *)objc_msgSend(v5, "copy");
  return v33;
}

- (id)actionsManager:(id)a3 presentingViewControllerForAction:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[CNContactOrbActionsController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNContactOrbActionsController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentingViewControllerForActionsController:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)setupActionsControllerForContact:(id)a3
{
  id v4;
  CNContactActionsController *v5;
  void *v6;
  CNContactActionsController *v7;
  CNContactActionsController *actionsController;
  CNContactActionsController *v9;

  v4 = a3;
  v5 = [CNContactActionsController alloc];
  +[CNContactActionsController supportedActionTypes](CNContactActionsController, "supportedActionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNContactActionsController initWithContact:actionTypes:](v5, "initWithContact:actionTypes:", v4, v6);

  -[CNContactActionsController setDisplayMenuIconAtTopLevel:](v7, "setDisplayMenuIconAtTopLevel:", 1);
  -[CNContactActionsController setShouldUseOutlinedActionGlyphStyle:](v7, "setShouldUseOutlinedActionGlyphStyle:", 1);
  -[CNContactActionsController setDelegate:](v7, "setDelegate:", self);
  actionsController = self->_actionsController;
  self->_actionsController = v7;
  v9 = v7;

  -[CNContactActionsController retrieveModels](self->_actionsController, "retrieveModels");
}

- (void)reloadMenuItems
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;

  -[CNContactOrbActionsController contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNContactOrbActionsController shouldUseActionsManagerForContacts:](self, "shouldUseActionsManagerForContacts:", v3);

  if (v4)
  {
    -[CNContactOrbActionsController actionsManager](self, "actionsManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactOrbActionsController menuItemsForContactsWithActions:](self, "menuItemsForContactsWithActions:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactOrbActionsController setMenuItems:](self, "setMenuItems:", v6);

  }
  else
  {
    -[CNContactOrbActionsController actionsController](self, "actionsController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "retrieveModels");
  }

}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0D13D70]);
  objc_msgSend(v4, "performActionWithContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__CNContactOrbActionsController_contactActionsController_didSelectAction___block_invoke;
  v12[3] = &unk_1E204E100;
  v8 = v4;
  v13 = v8;
  objc_msgSend(v6, "addSuccessBlock:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __74__CNContactOrbActionsController_contactActionsController_didSelectAction___block_invoke_2;
  v10[3] = &unk_1E204D1E8;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v6, "addFailureBlock:", v10);

}

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNContactOrbActionsController setMenuItems:](self, "setMenuItems:", v5);
  -[CNContactOrbActionsController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactOrbActionsController:didUpdateWithMenu:", self, v5);

}

- (CNContactOrbActionsControllerDelegate)delegate
{
  return (CNContactOrbActionsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (void)setMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_menuItems, a3);
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setActionsController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsController, a3);
}

- (CNQuickActionsManager)actionsManager
{
  return self->_actionsManager;
}

- (void)setActionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_actionsManager, a3);
}

- (NSArray)actionCategories
{
  return self->_actionCategories;
}

- (void)setActionCategories:(id)a3
{
  objc_storeStrong((id *)&self->_actionCategories, a3);
}

- (BOOL)bypassActionValidation
{
  return self->_bypassActionValidation;
}

- (void)setBypassActionValidation:(BOOL)a3
{
  self->_bypassActionValidation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionCategories, 0);
  objc_storeStrong((id *)&self->_actionsManager, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __74__CNContactOrbActionsController_contactActionsController_didSelectAction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactOrbActionsController.m", 214, 7, CFSTR("Did perform action %@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

void __74__CNContactOrbActionsController_contactActionsController_didSelectAction___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactOrbActionsController.m", 217, 3, CFSTR("Did fail to perform action %@, with error: %@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

uint64_t __65__CNContactOrbActionsController_menuItemsForContactsWithActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithCompletionBlock:", 0);
}

void __57__CNContactOrbActionsController_setupActionsForContacts___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "actionsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuItemsForContactsWithActions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMenuItems:", v4);

}

@end
