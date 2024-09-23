@implementation CNAvatarCardController

- (void)setActionCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)configurePreviewInteraction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CNActionMenuHelper *v8;

  -[CNAvatarCardController contextMenuInteraction](self, "contextMenuInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
    -[CNAvatarCardController setContextMenuInteraction:](self, "setContextMenuInteraction:", v4);

  }
  -[CNAvatarCardController setPresentationResult:](self, "setPresentationResult:", 1);
  -[CNAvatarCardController sourceView](self, "sourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardController contextMenuInteraction](self, "contextMenuInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addInteraction:", v6);

  -[CNAvatarCardController actionMenuHelper](self, "actionMenuHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(CNActionMenuHelper);
    -[CNAvatarCardController setActionMenuHelper:](self, "setActionMenuHelper:", v8);

  }
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setSourceView:(id)a3
{
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  if (self->_sourceView != v5)
  {
    v11 = v5;
    -[CNAvatarCardController sourceView](self, "sourceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardController contextMenuInteraction](self, "contextMenuInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeInteraction:", v7);

    objc_storeStrong((id *)&self->_sourceView, a3);
    -[UIView traitCollection](v11, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[CNAvatarCardController avatarCardEnabledForTraitCollection:](CNAvatarCardController, "avatarCardEnabledForTraitCollection:", v8);

    -[CNAvatarCardController sourceView](self, "sourceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && v9)
      -[CNAvatarCardController configurePreviewInteraction](self, "configurePreviewInteraction");
    else
      -[CNAvatarCardController setContextMenuInteraction:](self, "setContextMenuInteraction:", 0);
    v5 = v11;
  }

}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setPresentationResult:(int64_t)a3
{
  self->_presentationResult = a3;
}

- (CNActionMenuHelper)actionMenuHelper
{
  return self->_actionMenuHelper;
}

+ (BOOL)avatarCardEnabledForTraitCollection:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "userInterfaceIdiom") != 3 && objc_msgSend(v3, "userInterfaceIdiom") != 5;

  return v4;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAvatarView:(id)a3
{
  objc_storeWeak((id *)&self->_avatarView, a3);
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
}

- (void)setActionMenuHelper:(id)a3
{
  objc_storeStrong((id *)&self->_actionMenuHelper, a3);
}

- (void)setBypassActionValidation:(BOOL)a3
{
  self->_bypassActionValidation = a3;
}

+ (id)descriptorForRequiredKeys
{
  return (id)objc_msgSend(a1, "descriptorForRequiredKeysIncludingAvatarViewDescriptors:", 1);
}

+ (id)descriptorForRequiredKeysIncludingAvatarViewDescriptors:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v3 = a3;
  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatterWithFallBacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactOrbHeaderView descriptorForRequiredKeysForContactFormatter:includingAvatarViewDescriptors:](CNContactOrbHeaderView, "descriptorForRequiredKeysForContactFormatter:includingAvatarViewDescriptors:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  +[CNContactOrbActionsController descriptorForRequiredKeys](CNContactOrbActionsController, "descriptorForRequiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNAvatarCardController descriptorForRequiredKeysIncludingAvatarViewDescriptors:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptorWithKeyDescriptors:description:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_avatarView);
  objc_storeStrong((id *)&self->_orbActionsController, 0);
  objc_storeStrong((id *)&self->_orbHeaderViewController, 0);
  objc_storeStrong((id *)&self->_actionMenuHelper, 0);
  objc_storeStrong((id *)&self->_overrideImageData, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionCategories, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

- (id)headerViewController
{
  CNContactOrbHeaderViewController *orbHeaderViewController;
  CNContactOrbHeaderViewController *v4;
  void *v5;
  CNContactOrbHeaderViewController *v6;
  void *v7;
  void *v8;

  orbHeaderViewController = self->_orbHeaderViewController;
  if (!orbHeaderViewController)
  {
    v4 = [CNContactOrbHeaderViewController alloc];
    -[CNAvatarCardController contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNContactOrbHeaderViewController initWithContacts:](v4, "initWithContacts:", v5);
    -[CNAvatarCardController setOrbHeaderViewController:](self, "setOrbHeaderViewController:", v6);

    -[CNAvatarCardController orbHeaderViewController](self, "orbHeaderViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "headerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardController setHeaderView:](self, "setHeaderView:", v8);

    orbHeaderViewController = self->_orbHeaderViewController;
  }
  return orbHeaderViewController;
}

- (CNContactOrbHeaderView)headerView
{
  CNContactOrbHeaderView *headerView;
  CNContactOrbHeaderViewController *v4;
  void *v5;
  CNContactOrbHeaderViewController *v6;
  void *v7;
  void *v8;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = [CNContactOrbHeaderViewController alloc];
    -[CNAvatarCardController contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNContactOrbHeaderViewController initWithContacts:](v4, "initWithContacts:", v5);
    -[CNAvatarCardController setOrbHeaderViewController:](self, "setOrbHeaderViewController:", v6);

    -[CNAvatarCardController orbHeaderViewController](self, "orbHeaderViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "headerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardController setHeaderView:](self, "setHeaderView:", v8);

    headerView = self->_headerView;
  }
  return headerView;
}

- (void)setContact:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAvatarCardController setContacts:](self, "setContacts:", v6, v7, v8);
}

- (CNContact)contact
{
  void *v2;
  void *v3;

  -[CNAvatarCardController contacts](self, "contacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v3;
}

- (void)setContacts:(id)a3
{
  -[CNAvatarCardController prepareWithContacts:storeProvider:](self, "prepareWithContacts:storeProvider:", a3, &__block_literal_global_52808);
  -[CNAvatarCardController prepareForDisplay](self, "prepareForDisplay");
}

- (void)prepareWithContacts:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CNAvatarCardController_prepareWithContacts_store___block_invoke;
  v8[3] = &unk_1E204E8C0;
  v9 = v6;
  v7 = v6;
  -[CNAvatarCardController prepareWithContacts:storeProvider:](self, "prepareWithContacts:storeProvider:", a3, v8);

}

- (void)prepareWithContacts:(id)a3 storeProvider:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *contacts;
  id v9;

  v9 = a3;
  v6 = a4;
  -[CNAvatarCardController prepareWithOverrideImageData:](self, "prepareWithOverrideImageData:", 0);
  if (!-[CNAvatarCardController readyForContactsMatching:](self, "readyForContactsMatching:", v9))
  {
    -[CNAvatarCardController refetchContactsMatching:storeProvider:](self, "refetchContactsMatching:storeProvider:", v9, v6);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    contacts = self->_contacts;
    self->_contacts = v7;

    -[CNAvatarCardController setActionsNeedRefresh:](self, "setActionsNeedRefresh:", 0);
  }

}

- (BOOL)readyForContactsMatching:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  char v16;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  -[CNAvatarCardController contacts](self, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 == v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[CNAvatarCardController contacts](self, "contacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "allLinkedIdentifiers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __51__CNAvatarCardController_readyForContactsMatching___block_invoke;
    v18[3] = &unk_1E2050520;
    v19 = v8;
    v15 = v8;
    v16 = objc_msgSend(v4, "_cn_all:", v18);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)refetchContactsMatching:(id)a3 storeProvider:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  _QWORD aBlock[4];
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v5, "count"))
  {
    v6[2](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((objc_msgSend(v16, "areKeysAvailable:", v9) & 1) == 0)
          {
            objc_msgSend(v16, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v17);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v7, "unifiedContactsMatchingPredicate:keysToFetch:error:", v18, v9, &v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v33;

    if (!v19)
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNAvatarCardController.m", 251, 3, CFSTR("Error fetching contact: %@"), v21, v22, v23, v24, (uint64_t)v20);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CNAvatarCardController_refetchContactsMatching_storeProvider___block_invoke;
    aBlock[3] = &unk_1E204E8E8;
    v31 = v9;
    v32 = v19;
    v25 = v19;
    v26 = v9;
    v27 = _Block_copy(aBlock);
    objc_msgSend(v11, "_cn_map:", v27);
    v28 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = v5;
  }

  return v28;
}

- (BOOL)hasActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[CNAvatarCardController contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[CNAvatarCardController contacts](self, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[CNQuickActionsManager hasActionsForContact:](CNQuickActionsManager, "hasActionsForContact:", v6);

  return v7;
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[CNAvatarCardController overrideImageData](self, "overrideImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C97360], "contactWithDisplayName:emailOrPhoneNumber:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardController overrideImageData](self, "overrideImageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImageData:", v5);

    -[CNAvatarCardController headerView](self, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateWithContacts:", v7);

LABEL_5:
    goto LABEL_6;
  }
  -[CNAvatarCardController contacts](self, "contacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardController headerView](self, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v10)
  {
    -[CNAvatarCardController headerView](self, "headerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardController contacts](self, "contacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateWithContacts:", v6);
    goto LABEL_5;
  }
LABEL_6:
  -[CNAvatarCardController contacts](self, "contacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardController setupActionsForContacts:](self, "setupActionsForContacts:", v11);

}

- (void)cleanupAfterDisplay
{
  -[CNAvatarCardController prepareWithContacts:store:](self, "prepareWithContacts:store:", 0, 0);
  -[CNAvatarCardController prepareForDisplay](self, "prepareForDisplay");
}

- (void)setName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNAvatarCardController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlternateName:", v4);

  -[CNAvatarCardController headerView](self, "headerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (NSString)name
{
  void *v2;
  void *v3;

  -[CNAvatarCardController headerView](self, "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternateName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNAvatarCardController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v4);

  -[CNAvatarCardController headerView](self, "headerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (NSString)message
{
  void *v2;
  void *v3;

  -[CNAvatarCardController headerView](self, "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)showContact
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  _QWORD v9[4];
  id v10;

  -[CNAvatarCardController contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNAvatarCardController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0
      && (-[CNAvatarCardController delegate](self, "delegate"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "avatarCardController:shouldShowContact:", self, v4),
          v7,
          (v8 & 1) == 0))
    {

      v4 = 0;
    }
    else if (objc_msgSend(v4, "hasBeenPersisted"))
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __37__CNAvatarCardController_showContact__block_invoke;
      v9[3] = &unk_1E204F648;
      v4 = v4;
      v10 = v4;
      -[CNAvatarCardController dismissAnimated:completionHandler:](self, "dismissAnimated:completionHandler:", 1, v9);

    }
  }

}

- (UIViewController)presentingViewController
{
  void *v3;
  void *v4;

  -[CNAvatarCardController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForAvatarCardController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v4;
}

- (void)dismissAnimated:(BOOL)a3
{
  -[CNAvatarCardController dismissAnimated:completionHandler:](self, "dismissAnimated:completionHandler:", a3, 0);
}

- (void)dismissAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  CNAvatarCardController *v18;
  id v19;

  v4 = a3;
  v6 = a4;
  -[CNAvatarCardController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNAvatarCardController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avatarCardControllerWillDismiss:", self);

  }
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __60__CNAvatarCardController_dismissAnimated_completionHandler___block_invoke;
  v17 = &unk_1E204F9B0;
  v18 = self;
  v19 = v6;
  v10 = v6;
  v11 = (void (**)(_QWORD))_Block_copy(&v14);
  -[CNAvatarCardController contextMenuInteraction](self, "contextMenuInteraction", v14, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v11[2](v11);
  }
  else
  {
    -[CNAvatarCardController presentingViewController](self, "presentingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", v4, v11);

  }
}

- (id)contextMenuInteractionTargetedPreview
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[CNAvatarCardController highlightView](self, "highlightView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3
     || (-[CNAvatarCardController sourceView](self, "sourceView"),
         (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    && (objc_msgSend(v3, "window"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    -[CNAvatarCardController actionMenuHelper](self, "actionMenuHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "targetedPreviewForSourceView:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)MEMORY[0x1E0DC3508];
      objc_msgSend(v3, "bounds");
      objc_msgSend(v11, "bezierPathWithOvalInRect:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "parameters");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setVisiblePath:", v12);

    }
  }
  else
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNAvatarCardController.m", 445, 3, CFSTR("Tried to initialize UITargetedPreview with a view that is not in a window: %@"), v4, v5, v6, v7, (uint64_t)v3);
    v10 = 0;
  }

  return v10;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];

  y = a4.y;
  x = a4.x;
  -[CNAvatarCardController setPresentationResult:](self, "setPresentationResult:", 1);
  -[CNAvatarCardController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  -[CNAvatarCardController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    -[CNAvatarCardController setPresentationResult:](self, "setPresentationResult:", objc_msgSend(v9, "avatarCardController:presentationResultForLocation:", self, x, y));

    if ((unint64_t)(-[CNAvatarCardController presentationResult](self, "presentationResult") - 1) < 2)
      goto LABEL_10;
  }
  else
  {
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[CNAvatarCardController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "avatarCardController:shouldPresentForLocation:", self, x, y);

      if (!v13)
      {
LABEL_10:
        v19 = 0;
        return v19;
      }
      -[CNAvatarCardController setPresentationResult:](self, "setPresentationResult:", 0);
    }
  }
  -[CNAvatarCardController retrieveActions](self, "retrieveActions");
  -[CNAvatarCardController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[CNAvatarCardController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "avatarCardControllerWillBeginPreviewInteraction:", self);

  }
  -[CNAvatarCardController actionMenuHelper](self, "actionMenuHelper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configurationActionProviderWithActionBlock:", &__block_literal_global_44_52770);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__CNAvatarCardController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v21[3] = &unk_1E204E930;
  v21[4] = self;
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, v21, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  -[CNAvatarCardController actionMenuHelper](self, "actionMenuHelper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "willDisplayMenuWithContextMenuInteraction:", v6);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v5;

  -[CNAvatarCardController actionMenuHelper](self, "actionMenuHelper", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willDismissMenu");

}

- (void)updateWithMenuItems:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNAvatarCardController actionMenuHelper](self, "actionMenuHelper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardController contextMenuInteraction](self, "contextMenuInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithMenuItems:contextMenuInteraction:", v4, v5);

}

- (void)setupActionsForContacts:(id)a3
{
  id v4;

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    -[CNAvatarCardController setupActionsControllerForContacts:](self, "setupActionsControllerForContacts:", v4);

}

- (void)retrieveActions
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *MEMORY[0x1E0D137F8];
  -[CNAvatarCardController contacts](self, "contacts");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t))(v3 + 16))(v3) & 1) == 0)
  {
    -[CNAvatarCardController orbActionsController](self, "orbActionsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
    -[CNAvatarCardController orbActionsController](self, "orbActionsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadMenuItems");

    -[CNAvatarCardController orbActionsController](self, "orbActionsController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAvailableMenuItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardController updateWithMenuItems:](self, "updateWithMenuItems:", v6);

  }
}

- (void)setupActionsControllerForContacts:(id)a3
{
  id v4;
  CNContactOrbActionsController *v5;
  void *v6;
  CNContactOrbActionsController *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = [CNContactOrbActionsController alloc];
  -[CNAvatarCardController actionCategories](self, "actionCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNContactOrbActionsController initWithContacts:actionCategories:bypassActionValidation:](v5, "initWithContacts:actionCategories:bypassActionValidation:", v4, v6, -[CNAvatarCardController bypassActionValidation](self, "bypassActionValidation"));

  -[CNAvatarCardController setOrbActionsController:](self, "setOrbActionsController:", v7);
  -[CNAvatarCardController orbActionsController](self, "orbActionsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNAvatarCardController orbActionsController](self, "orbActionsController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

  }
}

- (void)contactOrbActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  -[CNAvatarCardController updateWithMenuItems:](self, "updateWithMenuItems:", a4);
}

- (id)presentingViewControllerForActionsController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[CNAvatarCardController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNAvatarCardController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentingViewControllerForAvatarCardController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (NSArray)actionCategories
{
  return self->_actionCategories;
}

- (CNAvatarCardControllerDelegate)delegate
{
  return (CNAvatarCardControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (int64_t)presentationResult
{
  return self->_presentationResult;
}

- (NSData)overrideImageData
{
  return self->_overrideImageData;
}

- (void)setOverrideImageData:(id)a3
{
  objc_storeStrong((id *)&self->_overrideImageData, a3);
}

- (CNContactOrbHeaderViewController)orbHeaderViewController
{
  return self->_orbHeaderViewController;
}

- (void)setOrbHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_orbHeaderViewController, a3);
}

- (CNContactOrbActionsController)orbActionsController
{
  return self->_orbActionsController;
}

- (void)setOrbActionsController:(id)a3
{
  objc_storeStrong((id *)&self->_orbActionsController, a3);
}

- (CNAvatarView)avatarView
{
  return (CNAvatarView *)objc_loadWeakRetained((id *)&self->_avatarView);
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIGestureRecognizer)rolloverGestureRecognizer
{
  return self->_rolloverGestureRecognizer;
}

- (void)setRolloverGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_rolloverGestureRecognizer, a3);
}

- (BOOL)actionsNeedRefresh
{
  return self->_actionsNeedRefresh;
}

- (void)setActionsNeedRefresh:(BOOL)a3
{
  self->_actionsNeedRefresh = a3;
}

- (BOOL)bypassActionValidation
{
  return self->_bypassActionValidation;
}

uint64_t __80__CNAvatarCardController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "orbHeaderViewController");
}

void __60__CNAvatarCardController_dismissAnimated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avatarCardControllerDidDismiss:", *(_QWORD *)(a1 + 32));

  }
}

void __37__CNAvatarCardController_showContact__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (CNUIIsMobilePhone())
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v4, "setScheme:", CFSTR("search"));
    objc_msgSend(v4, "setHost:", v3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%u/%u"), 2, objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPath:", v5);

    objc_msgSend(v4, "URL");
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("contact://show?id=%@"), v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v4);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue();

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openSensitiveURLInBackground:withOptions:", v10, 0);

}

id __64__CNAvatarCardController_refetchContactsMatching_storeProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  if (objc_msgSend(v3, "areKeysAvailable:", *(_QWORD *)(a1 + 32)))
  {
    v4 = v3;
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__CNAvatarCardController_refetchContactsMatching_storeProvider___block_invoke_2;
    v10[3] = &unk_1E2050520;
    v11 = v3;
    objc_msgSend(v5, "_cn_firstObjectPassingTest:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = objc_alloc_init(MEMORY[0x1E0C97200]);
    v4 = v8;

  }
  return v4;
}

uint64_t __64__CNAvatarCardController_refetchContactsMatching_storeProvider___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "allLinkedIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

uint64_t __51__CNAvatarCardController_readyForContactsMatching___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

id __52__CNAvatarCardController_prepareWithContacts_store___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __38__CNAvatarCardController_setContacts___block_invoke()
{
  void *v0;
  void *v1;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "contactStore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)previewHeaderViewControllerForContacts:(id)a3
{
  id v3;
  CNContactOrbHeaderViewController *v4;

  v3 = a3;
  v4 = -[CNContactOrbHeaderViewController initWithContacts:]([CNContactOrbHeaderViewController alloc], "initWithContacts:", v3);

  return v4;
}

@end
