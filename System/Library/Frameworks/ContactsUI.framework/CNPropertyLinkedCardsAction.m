@implementation CNPropertyLinkedCardsAction

- (CNPropertyLinkedCardsAction)initWithContact:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPropertyLinkedCardsAction;
  return -[CNPropertyAction initWithContact:](&v4, sel_initWithContact_, a3);
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_contactDelegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)CNPropertyLinkedCardsAction;
  -[CNPropertyLinkedCardsAction dealloc](&v3, sel_dealloc);
}

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  void *v4;
  CNContactContentViewController *v6;
  void *v7;
  CNContactContentViewController *v8;
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
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  v49 = a3;
  v6 = [CNContactContentViewController alloc];
  objc_msgSend(v49, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNContactContentViewController initWithContact:](v6, "initWithContact:", v7);
  -[CNPropertyLinkedCardsAction setContactController:](self, "setContactController:", v8);

  -[CNContactAction delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyLinkedCardsAction contactController](self, "contactController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "action:prepareChildContactViewController:sender:", self, v10, self);

  -[CNContactAction delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contactViewCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "contact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountForContact:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "contact");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "policyForContact:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  CNContactsUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_CARD_ITEM_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C971B0], "_cnui_displayNameForACAccount:", v14);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  -[CNPropertyLinkedCardsAction contactController](self, "contactController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:", v18);

  -[CNPropertyLinkedCardsAction contactController](self, "contactController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "allowsEditing") && (objc_msgSend(v16, "isReadonly") & 1) == 0)
  {
    -[CNContactAction delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v4 != 0;
    v22 = 1;
  }
  else
  {
    v22 = 0;
    v23 = 0;
  }
  -[CNPropertyLinkedCardsAction contactController](self, "contactController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAllowsEditing:", v23);

  if (v22)
  -[CNPropertyLinkedCardsAction contactDelegate](self, "contactDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyLinkedCardsAction contactController](self, "contactController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setContactDelegate:", v25);

  objc_msgSend(v49, "contact");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNPropertyLinkedCardsAction setLinkedContact:](self, "setLinkedContact:", v27);
  }
  else
  {
    v28 = (void *)objc_msgSend(v27, "mutableCopy");
    -[CNPropertyLinkedCardsAction setLinkedContact:](self, "setLinkedContact:", v28);

  }
  -[CNPropertyLinkedCardsAction contactController](self, "contactController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "allowsSettingLinkedContactsAsPreferred");

  if (!v30)
    goto LABEL_21;
  -[CNPropertyLinkedCardsAction linkedContact](self, "linkedContact");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "isPreferredForImage") & 1) != 0)
    goto LABEL_16;
  -[CNPropertyLinkedCardsAction linkedContact](self, "linkedContact");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "thumbnailImageData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[CNPropertyLinkedCardsAction contactController](self, "contactController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("SET_PREFERRED_PHOTO_ACTION_BUTTON_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyLinkedCardsAction contactController](self, "contactController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "cardTopGroup");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addActionWithTitle:target:selector:inGroup:", v34, self, sel_setPreferredForImage, v36);

LABEL_16:
  }
  -[CNPropertyLinkedCardsAction linkedContact](self, "linkedContact");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v37, "isPreferredForName") & 1) != 0)
  {
LABEL_20:

    goto LABEL_21;
  }
  v38 = (void *)MEMORY[0x1E0C97218];
  -[CNPropertyLinkedCardsAction linkedContact](self, "linkedContact");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringFromContact:style:", v39, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[CNPropertyLinkedCardsAction contactController](self, "contactController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("SET_PREFERRED_NAME_ACTION_BUTTON_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyLinkedCardsAction contactController](self, "contactController");
    v48 = v16;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "cardTopGroup");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addActionWithTitle:target:selector:inGroup:", v41, self, sel_setPreferredForName, v43);

    v16 = v48;
    goto LABEL_20;
  }
LABEL_21:
  -[CNContactAction delegate](self, "delegate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyLinkedCardsAction contactController](self, "contactController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "action:pushViewController:sender:", self, v45, self);

}

- (void)setPreferredForImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[CNContactAction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactViewCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  -[CNPropertyLinkedCardsAction linkedContact](self, "linkedContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction mutableContact](self, "mutableContact");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferLinkedContactForImage:inUnifiedContact:", v7, v8);

  v19 = 0;
  LOBYTE(v8) = objc_msgSend(v5, "executeSaveRequest:error:", v6, &v19);
  v9 = v19;
  v14 = v9;
  if ((v8 & 1) == 0)
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyLinkedCardsAction.m", 96, 3, CFSTR("Could not set preferred contact for image: %@"), v10, v11, v12, v13, (uint64_t)v9);
  -[CNPropertyLinkedCardsAction contactController](self, "contactController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyLinkedCardsAction contactController](self, "contactController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cardTopGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeActionWithTarget:selector:inGroup:", self, sel_setPreferredForImage, v17);

  -[CNContactAction delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionDidFinish:", self);

}

- (void)setPreferredForName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[CNContactAction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactViewCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  -[CNPropertyLinkedCardsAction linkedContact](self, "linkedContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction mutableContact](self, "mutableContact");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferLinkedContactForName:inUnifiedContact:", v7, v8);

  v19 = 0;
  LOBYTE(v8) = objc_msgSend(v5, "executeSaveRequest:error:", v6, &v19);
  v9 = v19;
  v14 = v9;
  if ((v8 & 1) == 0)
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyLinkedCardsAction.m", 114, 3, CFSTR("Could not set preferred contact for name: %@"), v10, v11, v12, v13, (uint64_t)v9);
  -[CNPropertyLinkedCardsAction contactController](self, "contactController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyLinkedCardsAction contactController](self, "contactController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cardTopGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeActionWithTarget:selector:inGroup:", self, sel_setPreferredForName, v17);

  -[CNContactAction delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionDidFinish:", self);

}

- (CNContactContentViewControllerDelegate)contactDelegate
{
  return (CNContactContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_contactDelegate);
}

- (void)setContactDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactDelegate, a3);
}

- (CNContactContentViewController)contactController
{
  return (CNContactContentViewController *)objc_getProperty(self, a2, 96, 1);
}

- (void)setContactController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CNMutableContact)linkedContact
{
  return (CNMutableContact *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLinkedContact:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedContact, 0);
  objc_storeStrong((id *)&self->_contactController, 0);
  objc_destroyWeak((id *)&self->_contactDelegate);
}

@end
