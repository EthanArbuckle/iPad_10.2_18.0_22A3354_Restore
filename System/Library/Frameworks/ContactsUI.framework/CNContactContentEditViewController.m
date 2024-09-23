@implementation CNContactContentEditViewController

- (CNContactContentEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  CNContactContentEditViewController *v6;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactContentEditViewController initWithEnvironment:](self, "initWithEnvironment:", v5);

  return v6;
}

- (CNContactContentEditViewController)initWithEnvironment:(id)a3
{
  id v5;
  char *v6;
  CNContactViewCache *v7;
  void *v8;
  CNUIGeminiDataSource *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  CNUIContactStoreSaveExecutor *v21;
  void *v22;
  CNUIContactStoreLinkedContactSaveExecutor *v23;
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
  void *v34;
  void *v35;
  id v36;
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CNContactContentEditViewController;
  v6 = -[CNContactContentEditViewController initWithNibName:bundle:](&v38, sel_initWithNibName_bundle_, 0, 0);
  objc_storeStrong((id *)v6 + 183, a3);
  v7 = objc_alloc_init(CNContactViewCache);
  v8 = (void *)*((_QWORD *)v6 + 184);
  *((_QWORD *)v6 + 184) = v7;

  if (objc_msgSend(MEMORY[0x1E0C97310], "deviceSupportsGemini"))
  {
    v9 = [CNUIGeminiDataSource alloc];
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "geminiManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNUIGeminiDataSource initWithGeminiManager:](v9, "initWithGeminiManager:", v11);
    v13 = (void *)*((_QWORD *)v6 + 186);
    *((_QWORD *)v6 + 186) = v12;

    objc_msgSend(*((id *)v6 + 186), "setDelegate:", v6);
  }
  v14 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *(_OWORD *)(v6 + 1608) = *MEMORY[0x1E0DC49E8];
  *(_OWORD *)(v6 + 1624) = v14;
  objc_storeWeak((id *)v6 + 132, v6);
  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatter");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)*((_QWORD *)v6 + 139);
  *((_QWORD *)v6 + 139) = v15;

  objc_msgSend(v5, "inProcessActivityManager");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)*((_QWORD *)v6 + 185);
  *((_QWORD *)v6 + 185) = v17;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)*((_QWORD *)v6 + 149);
  *((_QWORD *)v6 + 149) = v19;

  v21 = objc_alloc_init(CNUIContactStoreSaveExecutor);
  v22 = (void *)*((_QWORD *)v6 + 196);
  *((_QWORD *)v6 + 196) = v21;

  v23 = objc_alloc_init(CNUIContactStoreLinkedContactSaveExecutor);
  v24 = (void *)*((_QWORD *)v6 + 197);
  *((_QWORD *)v6 + 197) = v23;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:name:object:", v6, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", v6, sel_localeDidChange_, *MEMORY[0x1E0C99720], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", v6, sel_contactStoreDidChangeWithNotification_, *MEMORY[0x1E0C96870], 0);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:suspensionBehavior:", v6, sel_contactStoreDidChangeWithNotification_, *MEMORY[0x1E0D136D0], 0, 4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:selector:name:object:", v6, sel_keyboardDidShowNotification_, *MEMORY[0x1E0DC4E70], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:selector:name:object:", v6, sel_keyboardWillHideNotification_, *MEMORY[0x1E0DC4FE0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:selector:name:object:", v6, sel_favoritesDidChangeWithNotification_, *MEMORY[0x1E0C968E0], 0);

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "featureFlags");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v6[984] = objc_msgSend(v33, "isFeatureEnabled:", 18);

  objc_msgSend(v6, "setRestorationIdentifier:", CFSTR("ContactCard"));
  objc_msgSend(v6, "setRestorationClass:", objc_opt_class());
  objc_msgSend(v6, "navigationItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_setBackgroundHidden:", 1);

  objc_msgSend(v6, "navigationItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setLargeTitleDisplayMode:", 2);

  v36 = (id)objc_msgSend(v6, "applyContactStyle");
  return (CNContactContentEditViewController *)v6;
}

- (CNContactContentEditViewController)initWithContact:(id)a3 contactViewConfiguration:(id)a4
{
  id v6;
  id v7;
  CNContactContentEditViewController *v8;
  CNContactContentEditViewController *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[CNContactContentEditViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    -[CNContactContentEditViewController setContact:](v8, "setContact:", v6);
    -[CNContactContentEditViewController setContactViewConfiguration:](v9, "setContactViewConfiguration:", v7);
  }

  return v9;
}

- (void)setContactStore:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_contactStore, a3);
  v5 = a3;
  -[CNContactContentEditViewController contactViewCache](self, "contactViewCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContactStore:", v5);

}

- (void)setTitle:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  char v7;
  objc_super v8;

  v5 = a3;
  if (v5
    || (-[CNContactContentEditViewController title](self, "title"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CNContactContentEditViewController title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (!v5)
    {

      if ((v7 & 1) != 0)
        goto LABEL_6;
      goto LABEL_5;
    }
    if ((v7 & 1) == 0)
    {
LABEL_5:
      v8.receiver = self;
      v8.super_class = (Class)CNContactContentEditViewController;
      -[CNContactContentEditViewController setTitle:](&v8, sel_setTitle_, v5);
      -[CNContactContentEditViewController didChangeToShowTitle:](self, "didChangeToShowTitle:", v5 != 0);
    }
  }
LABEL_6:

}

- (void)setForcesTransparentBackground:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (self->_forcesTransparentBackground != a3)
  {
    self->_forcesTransparentBackground = a3;
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "schedulerProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mainThreadScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__CNContactContentEditViewController_setForcesTransparentBackground___block_invoke;
    v7[3] = &unk_1E204F648;
    v7[4] = self;
    objc_msgSend(v6, "performBlock:", v7);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CNContactView setDelegate:](self->_contactView, "setDelegate:", 0);
  -[CNContactView setDataSource:](self->_contactView, "setDataSource:", 0);
  -[CNContactHeaderView setDelegate:](self->_contactHeaderView, "setDelegate:", 0);
  -[CNContactHeaderEditView didFinishUsing](self->_contactHeaderView, "didFinishUsing");
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNContactContentEditViewController;
  -[CNContactContentEditViewController dealloc](&v4, sel_dealloc);
}

- (void)contactViewConfigurationDidUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  -[CNContactContentEditViewController reloadDataIfNeeded](self, "reloadDataIfNeeded");
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateForShowingNavBar:", objc_msgSend(v4, "layoutPositionallyAfterNavBar"));

  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController mutableContact](self, "mutableContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithNewContact:", v6);

  -[CNContactContentEditViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 0);
  v7 = -[CNContactContentEditViewController applyContactStyle](self, "applyContactStyle");
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsEditPhoto:preservingChanges:", objc_msgSend(v8, "allowsEditPhoto"), 0);

}

- (CNContactHeaderEditView)contactHeaderView
{
  CNContactHeaderEditView *contactHeaderView;
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CNContactHeaderEditView *v8;
  CNContactHeaderEditView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  contactHeaderView = self->_contactHeaderView;
  if (!contactHeaderView)
  {
    v4 = -[CNContactContentEditViewController isHeaderViewPhotoProhibited](self, "isHeaderViewPhotoProhibited");
    if (-[CNContactContentEditViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar"))
    {
      v5 = 1;
    }
    else
    {
      -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "layoutPositionallyAfterNavBar");

    }
    -[CNContactContentEditViewController mutableContact](self, "mutableContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactHeaderEditView contactHeaderViewWithContact:shouldAllowTakePhotoAction:showingNavBar:monogramOnly:isOutOfProcess:delegate:](CNContactHeaderEditView, "contactHeaderViewWithContact:shouldAllowTakePhotoAction:showingNavBar:monogramOnly:isOutOfProcess:delegate:", v7, 1, v5, v4, -[CNContactContentEditViewController isOutOfProcess](self, "isOutOfProcess"), self);
    v8 = (CNContactHeaderEditView *)objc_claimAutoreleasedReturnValue();
    v9 = self->_contactHeaderView;
    self->_contactHeaderView = v8;

    -[CNContactContentEditViewController presentingDelegate](self, "presentingDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderEditView setPresenterDelegate:](self->_contactHeaderView, "setPresenterDelegate:", v10);

    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contactHeaderBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderEditView setBackgroundColor:](self->_contactHeaderView, "setBackgroundColor:", v12);

    -[CNContactHeaderEditView setTranslatesAutoresizingMaskIntoConstraints:](self->_contactHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderEditView setAllowsEditPhoto:](self->_contactHeaderView, "setAllowsEditPhoto:", objc_msgSend(v13, "allowsEditPhoto") & !v4);

    v14 = -[CNContactContentEditViewController applyContactStyle](self, "applyContactStyle");
    contactHeaderView = self->_contactHeaderView;
  }
  return contactHeaderView;
}

- (BOOL)isHeaderViewPhotoProhibited
{
  void *v3;
  char v4;
  void *v5;

  -[CNContactContentEditViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0C96708]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[CNContactContentEditViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0C96890]);

  }
  return v4;
}

- (CNContactView)contactView
{
  CNContactView *contactView;
  CNContactView *v4;
  void *v5;
  CNContactView *v6;
  CNContactView *v7;

  contactView = self->_contactView;
  if (!contactView)
  {
    v4 = [CNContactView alloc];
    -[CNContactContentEditViewController contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNContactView initWithFrame:contact:](v4, "initWithFrame:contact:", v5, 0.0, 0.0, 320.0, 200.0);
    v7 = self->_contactView;
    self->_contactView = v6;

    -[CNContactView setEditing:](self->_contactView, "setEditing:", 1);
    -[CNContactView setDataSource:](self->_contactView, "setDataSource:", self);
    -[CNContactView setDelegate:](self->_contactView, "setDelegate:", self);
    -[CNContactView _setHeaderAndFooterViewsFloat:](self->_contactView, "_setHeaderAndFooterViewsFloat:", 0);
    -[CNContactView setTranslatesAutoresizingMaskIntoConstraints:](self->_contactView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactView setKeyboardDismissMode:](self->_contactView, "setKeyboardDismissMode:", 1);
    contactView = self->_contactView;
  }
  return contactView;
}

- (BOOL)isOutOfProcess
{
  void *v2;
  char v3;

  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOutOfProcess");

  return v3;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  id v5;

  -[CNContactView updateFontSizes](self->_contactView, "updateFontSizes", a3);
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateFontSizes");

  -[CNContactContentEditViewController viewDidLayoutSubviews](self, "viewDidLayoutSubviews");
  -[CNContactContentEditViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
  -[CNContactContentEditViewController setupConstraints](self, "setupConstraints");
  v5 = -[CNContactContentEditViewController applyContactStyle](self, "applyContactStyle");
}

- (void)localeDidChange:(id)a3
{
  -[CNContactContentEditViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
}

- (void)prepareCell:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  char v35;
  void *v36;
  id v37;

  v37 = a3;
  -[CNContactContentEditViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyCellAppearance:", v37);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_22;
  objc_opt_class();
  v5 = v37;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (objc_msgSend(v7, "displaysCellSelectionState"))
    v8 = 3;
  else
    v8 = 0;
  objc_msgSend(v7, "setSelectionStyle:", v8);
  objc_msgSend(v4, "labelTextAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueTextAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "actionTextAttributes");
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CNContactContentEditViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tintColorOverride");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v5;
    if (objc_msgSend(v21, "supportsValueColorUsesLabelColor"))
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "textColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    -[CNContactContentEditViewController highlightedProperties](self, "highlightedProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      -[CNContactContentEditViewController highlightedProperties](self, "highlightedProperties");
      v35 = isKindOfClass;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "propertyItem");
      v36 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "contactProperty");
      v26 = v21;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHighlightedProperty:", objc_msgSend(v24, "containsObject:", v27));

      v21 = v26;
      v23 = v36;

      isKindOfClass = v35;
    }
    else
    {
      objc_msgSend(v21, "setHighlightedProperty:", 0);
    }

    if (objc_msgSend(v21, "isSuggested"))
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "suggestedLabelTextColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "suggestedValueTextColor");
      v30 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(v21, "isHighlightedProperty")
        && -[CNContactContentEditViewController highlightedPropertyImportant](self, "highlightedPropertyImportant"))
      {
        objc_msgSend(v21, "setImportant:", -[CNContactContentEditViewController highlightedPropertyImportant](self, "highlightedPropertyImportant"));
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v30 = objc_claimAutoreleasedReturnValue();
        v15 = 0;
        goto LABEL_35;
      }
      if ((-[CNContactContentEditViewController isEditing](self, "isEditing") & 1) != 0
        || !objc_msgSend(v21, "supportsTintColorValue"))
      {
        v15 = 0;
LABEL_43:
        if (objc_msgSend(v21, "isHighlightedProperty"))
        {
          if ((objc_msgSend(v21, "isImportant") & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              v31 = v21;
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v32 = v31;
              else
                v32 = 0;
              v33 = v32;

              objc_msgSend(v33, "setShouldShowBadge:", 1);
            }
          }
        }

        if (!v15)
        {
LABEL_14:
          if (v14)
          {
            v16 = (void *)objc_msgSend(v10, "mutableCopy");
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0DC1140]);

            v10 = v16;
          }
          if ((isKindOfClass & 1) != 0)
            goto LABEL_18;
          goto LABEL_17;
        }
        v34 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DC1140]);
        v13 = v9;
        v9 = v34;
LABEL_13:

        goto LABEL_14;
      }
      -[CNContactContentEditViewController view](self, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "tintColorOverride");
      v30 = objc_claimAutoreleasedReturnValue();

      v15 = 0;
    }
    v14 = v29;
LABEL_35:

    v14 = (void *)v30;
    goto LABEL_43;
  }
  v15 = 0;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_18;
LABEL_17:
  objc_msgSend(v7, "labelTextAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqual:", v9);

  if ((v18 & 1) == 0)
LABEL_18:
    objc_msgSend(v7, "setLabelTextAttributes:", v9);
  objc_msgSend(v7, "valueTextAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqual:", v10);

  if ((v20 & 1) == 0)
    objc_msgSend(v7, "setValueTextAttributes:", v10);

LABEL_22:
}

- (BOOL)shouldAllowContainerPicking
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 6);

  if (v5)
  {
    -[CNContactContentEditViewController parentContainer](self, "parentContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isGuardianRestricted") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)setupContainerContextIfNeededForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CNUIContainerContext *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CNContactContentEditViewController shouldAllowContainerPicking](self, "shouldAllowContainerPicking"))
  {
    -[CNContactContentEditViewController containerContext](self, "containerContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      if (objc_msgSend(v4, "hasBeenPersisted"))
      {
        objc_msgSend(v4, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isUnified"))
      {
        v22 = v6;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v4, "mainStoreLinkedContacts");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v24;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v24 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
              -[CNContactContentEditViewController contactViewCache](self, "contactViewCache");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "containerForContact:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v13, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v16);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v10);
        }

        v6 = v22;
      }
      -[CNContactContentEditViewController parentContainer](self, "parentContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 && v6)
      {
        -[CNContactContentEditViewController parentContainer](self, "parentContainer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v6);

      }
      v19 = -[CNUIContainerContext initWithContainers:]([CNUIContainerContext alloc], "initWithContainers:", v7);
      -[CNContactContentEditViewController parentContainer](self, "parentContainer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 && !v6)
      {
        -[CNContactContentEditViewController parentContainer](self, "parentContainer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNUIContainerContext addContainer:](v19, "addContainer:", v21);

      }
      -[CNContactContentEditViewController setContainerContext:](self, "setContainerContext:", v19);

    }
  }

}

- (void)setContact:(id)a3
{
  CNContact *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char isKindOfClass;
  void *v58;
  CNMutableContact **p_mutableContact;
  NSObject *v60;
  void *v61;
  CNMutableContact *v62;
  void *v63;
  void *v64;
  void *v65;
  CNCardGroup *v66;
  CNCardGroup *cardEditingActionsGroup;
  CNCardGroup *v68;
  CNCardGroup *cardEditingDeleteContactGroup;
  NSDictionary *propertyGroups;
  void *v71;
  CNSiriContactContextProvider *v72;
  void *v73;
  CNSiriContactContextProvider *v74;
  void *v75;
  CNPropertyLinkedCardsAction *linkedCardsAction;
  CNContactAddLinkedCardAction *addLinkedCardAction;
  CNCardStaticIdentityGroup *cardStaticIdentityGroup;
  CNContactAddStaticIdentityAction *addStaticIdentityAction;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  _QWORD v88[5];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  _QWORD v94[4];
  id v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  CNMutableContact *v99;
  _BYTE v100[128];
  void *v101;
  void *v102;
  uint64_t v103;
  _QWORD v104[4];

  v104[1] = *MEMORY[0x1E0C80C00];
  v4 = (CNContact *)a3;
  v5 = v4;
  self->_needsRefetch = 0;
  if (self->_contact == v4)
    goto LABEL_45;
  -[CNContact identifier](v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact identifier](self->_contact, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
    -[CNContactContentEditViewController setDidSetNewContact:](self, "setDidSetNewContact:", 1);
  -[CNContactContentEditViewController environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultSchedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "suspendBackgroundScheduler");
  objc_msgSend(v10, "afterCACommitScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = 3221225472;
  v94[2] = __49__CNContactContentEditViewController_setContact___block_invoke;
  v94[3] = &unk_1E204F648;
  v13 = v10;
  v95 = v13;
  objc_msgSend(v11, "performBlock:", v94);

  -[CNContactContentEditViewController contactViewCache](self, "contactViewCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resetCache");

  LODWORD(v11) = -[CNContactContentEditViewController isOutOfProcess](self, "isOutOfProcess");
  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if ((_DWORD)v11)
  {
    v104[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController _updateContact:withMissingKeysFromRequiredKeys:](self, "_updateContact:withMissingKeysFromRequiredKeys:", v5, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v18;
  }
  else
  {
    v103 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertKeysAreAvailable:", v17);
  }

  -[CNContactContentEditViewController parentContainer](self, "parentContainer");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
LABEL_10:
    -[CNContactContentEditViewController contactViewCache](self, "contactViewCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "containerForContact:", v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController setParentContainer:](self, "setParentContainer:", v24);

    goto LABEL_11;
  }
  v20 = (void *)v19;
  -[CNContactContentEditViewController parentContainer](self, "parentContainer");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    v23 = objc_msgSend(v5, "hasBeenPersisted");

    if (!v23)
      goto LABEL_12;
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
  -[CNContactContentEditViewController setContainerContext:](self, "setContainerContext:", 0);
  -[CNContactContentEditViewController contactViewCache](self, "contactViewCache");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "policyForContact:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v26, "isReadonly"))
  {
    v87 = v13;
    -[CNContactContentEditViewController contactStore](self, "contactStore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForContact:", v5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0;
    objc_msgSend(v27, "unifiedContactWithIdentifier:keysToFetch:error:", v28, v30, &v93);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v93;

    if (v31)
    {
      v32 = v31;

      -[CNContactContentEditViewController contactViewCache](self, "contactViewCache");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "policyForContact:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v34;
      if (objc_msgSend(v34, "isReadonly"))
      {
        v84 = v34;
        v85 = v31;
        v35 = objc_alloc_init(MEMORY[0x1E0C97360]);
        objc_msgSend(v32, "availableKeyDescriptor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v35, "copyWithPropertyKeys:", v37);
        v39 = (void *)objc_msgSend(v38, "mutableCopy");
        -[CNContactContentEditViewController setShadowCopyOfReadonlyContact:](self, "setShadowCopyOfReadonlyContact:", v39);

        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        +[CNContactView nameProperties](CNContactView, "nameProperties");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v90;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v90 != v43)
                objc_enumerationMutation(v40);
              v45 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
              if (objc_msgSend(v32, "isKeyAvailable:", v45))
              {
                -[CNContactContentEditViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "valueForKey:", v45);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setValue:forKey:", v47, v45);

              }
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
          }
          while (v42);
        }

        v48 = (void *)MEMORY[0x1E0C99DE8];
        -[CNContactContentEditViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "arrayWithObject:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v87;
        if (objc_msgSend(v32, "isUnified"))
        {
          objc_msgSend(v32, "linkedContacts");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObjectsFromArray:", v51);

        }
        else
        {
          objc_msgSend(v50, "addObject:", v32);
        }
        v52 = v86;
        objc_msgSend(MEMORY[0x1E0C97200], "unifyContacts:", v50);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNContactContentEditViewController contactViewCache](self, "contactViewCache");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "policyForDefaultContainer");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentEditViewController setPolicy:](self, "setPolicy:", v54);

        -[CNContactContentEditViewController policy](self, "policy");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v55 || v86)
        {
          objc_msgSend(MEMORY[0x1E0C97390], "sharedPermissivePolicy");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentEditViewController setPolicy:](self, "setPolicy:", v56);

        }
        v12 = MEMORY[0x1E0C809B0];
        v26 = v84;
        v31 = v85;
        goto LABEL_33;
      }
      v5 = v32;
    }
    v52 = v86;
    v13 = v87;
    v12 = MEMORY[0x1E0C809B0];
LABEL_33:

  }
  objc_storeStrong((id *)&self->_contact, v5);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v58 = v5;
  if ((isKindOfClass & 1) == 0)
    v58 = (void *)objc_msgSend(v5, "mutableCopy");
  p_mutableContact = &self->_mutableContact;
  objc_storeStrong((id *)&self->_mutableContact, v58);
  if ((isKindOfClass & 1) == 0)

  CNUILogContactCard();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = *p_mutableContact;
    *(_DWORD *)buf = 138543618;
    v97 = v61;
    v98 = 2050;
    v99 = v62;
    _os_log_impl(&dword_18AC56000, v60, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] setting contact with identifier %{public}@, mutable contact %{public}p", buf, 0x16u);

  }
  -[CNContactContentEditViewController customActions](self, "customActions");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v12;
  v88[1] = 3221225472;
  v88[2] = __49__CNContactContentEditViewController_setContact___block_invoke_233;
  v88[3] = &unk_1E204F6B8;
  v88[4] = self;
  objc_msgSend(v63, "_cn_filter:", v88);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController setCustomActions:](self, "setCustomActions:", v64);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController setGroupsAfterGroup:](self, "setGroupsAfterGroup:", v65);

  v66 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardEditingActionsGroup = self->_cardEditingActionsGroup;
  self->_cardEditingActionsGroup = v66;

  v68 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardEditingDeleteContactGroup = self->_cardEditingDeleteContactGroup;
  self->_cardEditingDeleteContactGroup = v68;

  propertyGroups = self->_propertyGroups;
  self->_propertyGroups = 0;

  -[CNContactContentEditViewController siriContextProvider](self, "siriContextProvider");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v64) = objc_msgSend(v71, "isEnabled");

  v72 = [CNSiriContactContextProvider alloc];
  -[CNContactContentEditViewController contactStore](self, "contactStore");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = -[CNSiriContactContextProvider initWithContact:store:](v72, "initWithContact:store:", v5, v73);
  -[CNContactContentEditViewController setSiriContextProvider:](self, "setSiriContextProvider:", v74);

  if ((_DWORD)v64)
  {
    -[CNContactContentEditViewController siriContextProvider](self, "siriContextProvider");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setEnabled:", 1);

  }
  linkedCardsAction = self->_linkedCardsAction;
  self->_linkedCardsAction = 0;

  addLinkedCardAction = self->_addLinkedCardAction;
  self->_addLinkedCardAction = 0;

  cardStaticIdentityGroup = self->_cardStaticIdentityGroup;
  self->_cardStaticIdentityGroup = 0;

  addStaticIdentityAction = self->_addStaticIdentityAction;
  self->_addStaticIdentityAction = 0;

  -[CNContactContentEditViewController setIgnoreContactAction:](self, "setIgnoreContactAction:", 0);
  -[CNContactContentEditViewController setCardMedicalIDGroup:](self, "setCardMedicalIDGroup:", 0);
  -[CNContactContentEditViewController setMedicalIDAction:](self, "setMedicalIDAction:", 0);
  -[CNContactContentEditViewController setEmergencyContactAction:](self, "setEmergencyContactAction:", 0);
  -[CNContactContentEditViewController setCardEditingGeminiGroup:](self, "setCardEditingGeminiGroup:", 0);
  -[CNContactContentEditViewController geminiDataSource](self, "geminiDataSource");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setContact:", v5);

  if (self->_contactHeaderView)
  {
    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "updateWithNewContact:", *p_mutableContact);

  }
  -[CNContactContentEditViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 0);
  -[CNContactContentEditViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
  +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contact](self, "contact");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "logContactShown:", v83);

  -[CNContactContentEditViewController prepareContactDidAppearForPPT](self, "prepareContactDidAppearForPPT");
LABEL_45:

}

- (void)keyboardDidShowNotification:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CNContactContentEditViewController view](self, "view");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v31, "convertRect:fromView:", 0, v16, v18, v20, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(v31, "bounds");
  v34.origin.x = v24;
  v34.origin.y = v26;
  v34.size.width = v28;
  v34.size.height = v30;
  v33 = CGRectIntersection(v32, v34);
  -[CNContactContentEditViewController adjustInsetsForKeyboardOverlap:](self, "adjustInsetsForKeyboardOverlap:", CGRectGetHeight(v33));

}

- (void)keyboardWillHideNotification:(id)a3
{
  -[CNContactContentEditViewController adjustInsetsForKeyboardOverlap:](self, "adjustInsetsForKeyboardOverlap:", a3, 0.0);
}

- (void)adjustInsetsForKeyboardOverlap:(double)a3
{
  id v4;

  -[CNContactContentEditViewController setKeyboardVerticalOverlap:](self, "setKeyboardVerticalOverlap:", a3);
  -[CNContactContentEditViewController contactView](self, "contactView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController updateInsetsIfNeededForTableView:](self, "updateInsetsIfNeededForTableView:", v4);

}

- (void)contactStoreDidChangeWithNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[CNUIContactsEnvironment defaultSchedulerProvider](self->_environment, "defaultSchedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__CNContactContentEditViewController_contactStoreDidChangeWithNotification___block_invoke;
  v8[3] = &unk_1E2050400;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)saveNewContactDraft
{
  void *v3;

  -[CNContactContentEditViewController saveModelChangesToContact](self, "saveModelChangesToContact");
  -[CNContactContentEditViewController mutableContact](self, "mutableContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIDraftSupport saveNewContactDraft:](CNUIDraftSupport, "saveNewContactDraft:", v3);

  -[CNContactContentEditViewController _refetchContact](self, "_refetchContact");
}

- (void)_refetchContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[CNContactContentEditViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController parentContainer](self, "parentContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isMeContact:", v6);

    CNUILogContactCard();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        objc_msgSend(v3, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v10;
        _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it the me card, identifier %{public}@", buf, 0xCu);

      }
      -[CNContactContentEditViewController contactStore](self, "contactStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForContact:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(v11, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v13, &v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v26;
    }
    else
    {
      if (v9)
      {
        objc_msgSend(v3, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v16;
        _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it not the me card, identifier %{public}@", buf, 0xCu);

      }
      -[CNContactContentEditViewController contactStore](self, "contactStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForContact:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v11, "unifiedContactWithIdentifier:keysToFetch:error:", v12, v17, &v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v25;

    }
    -[CNContactContentEditViewController contactViewCache](self, "contactViewCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "containerForContact:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 || !v14)
    {
      CNUILogContactCard();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentEditViewController contactStore](self, "contactStore");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v28 = v23;
        v29 = 2112;
        v30 = v15;
        v31 = 2112;
        v32 = v24;
        v33 = 2112;
        v34 = v3;
        _os_log_error_impl(&dword_18AC56000, v22, OS_LOG_TYPE_ERROR, "Error refetching contact with identifier %@, %@, store %@, full contact %@", buf, 0x2Au);

      }
    }
    else
    {
      v20 = objc_msgSend(v14, "isEqual:", v3);
      v21 = objc_msgSend(v19, "isEqual:", v4);
      if (!v20 || (v21 & 1) == 0)
        -[CNContactContentEditViewController setContact:](self, "setContact:", v14);
    }

  }
}

- (NSArray)originalContacts
{
  NSArray *originalContacts;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  originalContacts = self->_originalContacts;
  if (originalContacts)
    return originalContacts;
  if (self->_contact)
  {
    v5[0] = self->_contact;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSDictionary *v34;
  NSDictionary *propertyGroups;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[8];
  _BYTE v44[128];
  uint64_t v45;

  v3 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  if ((-[CNContactContentEditViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    self->_needsReload = 0;
    -[CNContactContentEditViewController contactStore](self, "contactStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[CNContactContentEditViewController originalContacts](self, "originalContacts");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_cn_filter:", &__block_literal_global_241);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "count"))
        v8 = 7;
      else
        v8 = 1;
      -[CNContactContentEditViewController managedConfiguration](self, "managedConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = objc_alloc(MEMORY[0x1E0C97298]);
        -[CNContactContentEditViewController environment](self, "environment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cnEnvironment");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentEditViewController managedConfiguration](self, "managedConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v10, "initWithEnvironment:options:managedConfiguration:", v12, v8, v13);
        -[CNContactContentEditViewController setContactStore:](self, "setContactStore:", v14);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentEditViewController setContactStore:](self, "setContactStore:", v11);
      }

    }
    if (!-[CNContactContentEditViewController mode](self, "mode"))
    {
      -[CNContactContentEditViewController parentViewController](self, "parentViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_getClass("ABNewPersonViewController");
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        -[CNContactContentEditViewController setMode:](self, "setMode:", 3);
    }
    if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) != 3)
    {
      CNUILogContactCard();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AC56000, v17, OS_LOG_TYPE_ERROR, "CNContactContentViewController does not have authorization to access contacts.", buf, 2u);
      }

    }
    -[CNContactContentEditViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[CNContactContentEditViewController contact](self, "contact");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController _policyForContact:mode:](self, "_policyForContact:mode:", v19, -[CNContactContentEditViewController mode](self, "mode"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController setPolicy:](self, "setPolicy:", v20);

    }
    -[CNContactContentEditViewController contact](self, "contact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isUnified");

    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      -[CNContactContentEditViewController contact](self, "contact", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "linkedContacts");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v40 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            -[CNContactContentEditViewController _policyForContact:mode:](self, "_policyForContact:mode:", v30, -[CNContactContentEditViewController mode](self, "mode"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              objc_msgSend(v30, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setObject:forKey:", v31, v32);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v27);
      }

      v33 = (void *)objc_msgSend(v23, "copy");
      -[CNContactContentEditViewController setLinkedPoliciesByContactIdentifier:](self, "setLinkedPoliciesByContactIdentifier:", v33);

    }
    if (!self->_propertyGroups)
    {
      -[CNContactContentEditViewController _loadPropertyGroups](self, "_loadPropertyGroups");
      v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      propertyGroups = self->_propertyGroups;
      self->_propertyGroups = v34;

    }
    -[CNContactContentEditViewController _reloadStaticIdentityGroup](self, "_reloadStaticIdentityGroup");
    -[CNContactContentEditViewController _reloadGeminiGroupPreservingChanges:](self, "_reloadGeminiGroupPreservingChanges:", v3);
    -[CNContactContentEditViewController _reloadLinkedCardsGroup](self, "_reloadLinkedCardsGroup");
    -[CNContactContentEditViewController _reloadPropertyGroupsPreservingChanges:](self, "_reloadPropertyGroupsPreservingChanges:", v3);
    -[CNContactContentEditViewController _reloadMedicalIDGroup](self, "_reloadMedicalIDGroup");
    -[CNContactContentEditViewController _reloadContainerContextPreservingChanges:](self, "_reloadContainerContextPreservingChanges:", v3);
    -[CNContactContentEditViewController setupActionsPreservingChanges:](self, "setupActionsPreservingChanges:", v3);
    -[CNContactContentEditViewController _loadEditingGroupsPreservingChanges:](self, "_loadEditingGroupsPreservingChanges:", v3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController setEditingGroups:](self, "setEditingGroups:", v36);

    -[CNContactContentEditViewController _setNeedsUpdateCachedLabelWidths](self, "_setNeedsUpdateCachedLabelWidths");
    -[CNContactContentEditViewController contactView](self, "contactView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "reloadData");

    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "reloadDataPreservingChanges:", v3);

    -[CNContactContentEditViewController _updateUserActivity](self, "_updateUserActivity");
  }
  else
  {
    self->_needsReload = 1;
  }
}

- (id)cardGroupForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNContactContentEditViewController propertyGroups](self, "propertyGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)sectionOfGroup:(id)a3 inTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  -[CNContactContentEditViewController _currentGroupsForTableView:](self, "_currentGroupsForTableView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    v11 = objc_msgSend(v8, "indexOfObject:", v6);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      v10 = -[CNContactContentEditViewController tableViewSectionIndexFromGroupIndex:forTableView:](self, "tableViewSectionIndexFromGroupIndex:forTableView:", v11, v7);
  }

  return v10;
}

- (void)addCardGroup:(id)a3 afterGroup:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[CNContactContentEditViewController groupsAfterGroup](self, "groupsAfterGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNContactContentEditViewController groupsAfterGroup](self, "groupsAfterGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController groupsAfterGroup](self, "groupsAfterGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);
  }

}

- (void)reloadCardGroup:(id)a3 forTableView:(id)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (-[CNContactContentEditViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (!-[CNContactContentEditViewController needsReload](self, "needsReload"))
    {
      v7 = -[CNContactContentEditViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v10, v6);
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = v7;
        objc_msgSend(v6, "beginUpdates");
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reloadSections:withRowAnimation:", v9, 0);

        objc_msgSend(v6, "endUpdates");
        -[CNContactContentEditViewController updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:](self, "updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:", v6, 2, 0);
      }
    }
  }

}

- (id)indexPathOfDisplayedPropertyItem:(id)a3
{
  return -[CNContactContentEditViewController indexPathOfPropertyItem:editing:](self, "indexPathOfPropertyItem:editing:", a3, 0);
}

- (id)indexPathOfEditingPropertyItem:(id)a3
{
  return -[CNContactContentEditViewController indexPathOfPropertyItem:editing:](self, "indexPathOfPropertyItem:editing:", a3, 1);
}

- (id)indexPathOfPropertyItem:(id)a3 editing:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNContactContentEditViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v6, v7);
  objc_msgSend(v6, "editingItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v5);

  v11 = 0;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_policyForContact:(id)a3 mode:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a3;
  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "allowsAddingToAddressBook") & 1) != 0)
  {

  }
  else
  {
    v8 = objc_msgSend(v6, "hasBeenPersisted");

    if ((v8 & 1) == 0)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0C97390], "sharedPermissivePolicy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  if ((unint64_t)a4 <= 5 && ((1 << a4) & 0x32) != 0)
  {
    -[CNContactContentEditViewController contactViewCache](self, "contactViewCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v6;
  }
  else
  {
    -[CNContactContentEditViewController contactViewCache](self, "contactViewCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
  }
  objc_msgSend(v9, "policyForContact:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_9;
LABEL_10:

  return v12;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 4)
    return 0;
  -[CNContactContentEditViewController contactView](self, "contactView", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UINavigationItem)effectiveNavigationItem
{
  void *v2;
  void *v3;

  -[CNContactContentEditViewController navigationItemController](self, "navigationItemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UINavigationItem *)v3;
}

- (void)updateEditNavigationItemsAnimated:(BOOL)a3
{
  void *v3;
  void *v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;

  -[CNContactContentEditViewController navigationItemController](self, "navigationItemController");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController navItemUpdater](self, "navItemUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIViewController ab_isInSheet](self, "ab_isInSheet");
  v8 = -[CNContactContentEditViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar");
  v9 = -[CNContactContentEditViewController mode](self, "mode") == 4;
  BYTE1(v20) = a3;
  LOBYTE(v20) = -[CNContactContentEditViewController hasPendingChanges](self, "hasPendingChanges");
  objc_msgSend(v6, "updateEditingNavigationItemForController:actionTarget:isInSheet:isShowingNavBar:shouldUsePlatterStyle:isUpdatingContact:hasChanges:animated:", v21, self, v7, v8, 0, v9, v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentEditViewController setCancelKeyboardShortcutEnabled:](self, "setCancelKeyboardShortcutEnabled:", objc_msgSend(v10, "enableCancelShortcut"));
  -[CNContactContentEditViewController setSaveKeyboardShortcutEnabled:](self, "setSaveKeyboardShortcutEnabled:", objc_msgSend(v10, "enableSaveShortcut"));
  objc_msgSend(v21, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController navigationItemDelegate](self, "navigationItemDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController doneButtonItem](self, "doneButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contactNavigationItemProvider:didUpdateNavigationItem:doneButtonItem:", self, v11, v13);

  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "layoutPositionallyAfterNavBar");
  if ((v15 & 1) != 0)
  {
    v16 = 0;
    v17 = 1;
  }
  else
  {
    objc_msgSend(v11, "title");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v9 = v18;
      v16 = 0;
      v17 = 1;
    }
    else
    {
      objc_msgSend(v11, "titleView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      if (v3)
      {
        v16 = 1;
        v17 = 1;
      }
      else
      {
        v17 = objc_msgSend(v11, "_backgroundHidden") ^ 1;
        v16 = 1;
      }
    }
  }
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShouldShowBelowNavigationTitle:", v17);

  if (v16)
  if ((v15 & 1) == 0)

}

- (void)updateWindowTitleForAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    -[CNContactContentEditViewController title](self, "title");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[CNContactContentEditViewController navigationController](self, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "title");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        -[CNContactContentEditViewController contactFormatter](self, "contactFormatter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentEditViewController contact](self, "contact");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringFromContact:", v6);
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    -[CNContactContentEditViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v10);

  }
  else
  {
    -[CNContactContentEditViewController view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", 0);
  }

}

- (void)updateDoneButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CNContactContentEditViewController navigationItemController](self, "navigationItemController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController navItemUpdater](self, "navItemUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateEditDoneButtonForController:isUpdatingContact:hasChanges:", v8, -[CNContactContentEditViewController mode](self, "mode") == 4, -[CNContactContentEditViewController hasPendingChanges](self, "hasPendingChanges"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentEditViewController setSaveKeyboardShortcutEnabled:](self, "setSaveKeyboardShortcutEnabled:", objc_msgSend(v4, "enableSaveShortcut"));
  -[CNContactContentEditViewController navigationItemDelegate](self, "navigationItemDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController doneButtonItem](self, "doneButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactNavigationItemProvider:didUpdateNavigationItem:doneButtonItem:", self, v6, v7);

}

- (BOOL)hasPendingChanges
{
  return !-[CNContactContentEditViewController _modelIsEmpty](self, "_modelIsEmpty")
      && -[CNContactContentEditViewController _modelHasChanges](self, "_modelHasChanges");
}

- (void)cancelAsyncLookups
{
  void *v3;

  -[CNContactContentEditViewController medicalIDLookupToken](self, "medicalIDLookupToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNContactContentEditViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", 0);
}

- (void)editCancel:(id)a3
{
  void *v4;

  if (-[CNContactContentEditViewController hasPendingChanges](self, "hasPendingChanges", a3))
  {
    -[CNContactContentEditViewController contactView](self, "contactView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endEditing:", 1);

    -[CNContactContentEditViewController presentConfirmCancelAlertController](self, "presentConfirmCancelAlertController");
  }
  else
  {
    -[CNContactContentEditViewController performConfirmedCancel](self, "performConfirmedCancel");
  }
}

- (void)presentConfirmCancelAlertController
{
  void *v3;
  char v4;
  id v5;

  -[CNContactContentEditViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactContentEditViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactEditViewControllerRequestsCancelConfirmationAlert:", self);

  }
}

- (void)clearMapsDataIfEdited
{
  id v3;

  if (-[CNContactContentEditViewController _modelHasChanges](self, "_modelHasChanges"))
  {
    -[CNContactContentEditViewController mutableContact](self, "mutableContact");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMapsData:", 0);

  }
}

- (BOOL)saveChanges
{
  BOOL result;
  NSObject *v4;
  uint8_t v5[16];

  if (self->_saving)
    return 0;
  self->_saving = 1;
  -[CNContactContentEditViewController saveModelChangesToContact](self, "saveModelChangesToContact");
  CNUILogContactCard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "[CNContactContentEditViewController] performing save…", v5, 2u);
  }

  result = -[CNContactContentEditViewController performSave](self, "performSave");
  self->_saving = 0;
  return result;
}

- (void)saveModelChangesToContact
{
  void *v3;
  id v4;

  -[CNContactContentEditViewController editingGroups](self, "editingGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController _saveChangesForGroups:](self, "_saveChangesForGroups:", v3);

  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveContactPhoto");

}

- (BOOL)performSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD block[4];
  id v14;

  -[CNContactContentEditViewController saveContactExecutor](self, "saveContactExecutor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController saveDescriptionForCurrentState](self, "saveDescriptionForCurrentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeSaveWithConfiguration:saveDelegate:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController setIssuedSaveRequestIdentifiers:](self, "setIssuedSaveRequestIdentifiers:", v6);

  if (objc_msgSend(v5, "success"))
  {
    -[CNContactContentEditViewController setShadowCopyOfReadonlyContact:](self, "setShadowCopyOfReadonlyContact:", 0);
    _LargeDatabasesSignpostLogQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CNContactContentEditViewController_performSave__block_invoke;
    block[3] = &unk_1E204F648;
    v14 = v5;
    dispatch_async(v7, block);

  }
  -[CNContactContentEditViewController issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifiersOfIssuedSaveRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  -[CNContactContentEditViewController setEditingLinkedContacts:](self, "setEditingLinkedContacts:", 0);
  objc_msgSend(v5, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController setContact:](self, "setContact:", v10);

  v11 = objc_msgSend(v5, "success");
  return v11;
}

- (id)saveDescriptionForCurrentState
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
  CNUIContactSaveConfiguration *v12;
  uint64_t v14;
  void *v15;
  CNUIContactSaveConfiguration *v16;

  v16 = [CNUIContactSaveConfiguration alloc];
  -[CNContactContentEditViewController contact](self, "contact");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController mutableContact](self, "mutableContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController editingLinkedContacts](self, "editingLinkedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController parentGroup](self, "parentGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController parentContainer](self, "parentContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController containerContext](self, "containerContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v14) = 1;
  LOBYTE(v14) = objc_msgSend(v11, "ignoresParentalRestrictions");
  v12 = -[CNUIContactSaveConfiguration initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:](v16, "initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:", v15, v3, v4, v5, v7, v8, v9, v10, 0, v14);

  return v12;
}

- (void)updateContact:(id)a3
{
  void *v4;

  if (-[CNContactContentEditViewController saveChanges](self, "saveChanges", a3))
  {
    -[CNContactContentEditViewController mutableContact](self, "mutableContact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v4);

  }
  else
  {
    -[CNContactContentEditViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", 0);
  }
  -[CNContactContentEditViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
}

- (void)toggleEditing
{
  -[CNContactContentEditViewController toggleEditing:](self, "toggleEditing:", 0);
}

- (void)finishEditing
{
  -[CNContactContentEditViewController finishEditing:](self, "finishEditing:", 0);
}

- (void)finishEditing:(id)a3
{
  id v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = -[CNContactContentEditViewController isEditing](self, "isEditing");
  -[CNContactContentEditViewController cancelAsyncLookups](self, "cancelAsyncLookups");
  -[CNContactContentEditViewController contactView](self, "contactView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endEditing:", 1);

  if (v5)
  {
    if (!-[CNContactContentEditViewController _modelHasChanges](self, "_modelHasChanges"))
    {
      -[CNContactContentEditViewController editCancel:](self, "editCancel:", v4);
      goto LABEL_10;
    }
    CNUILogContactCard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] Done editing, will save changes", v10, 2u);
    }

    if (-[CNContactContentEditViewController saveChanges](self, "saveChanges"))
    {
      -[CNContactContentEditViewController mutableContact](self, "mutableContact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v8);

    }
    else
    {
      -[CNContactContentEditViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", 0);
    }
  }
  -[CNContactContentEditViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
  -[CNContactContentEditViewController contactView](self, "contactView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

LABEL_10:
  if ((-[CNContactContentEditViewController supportsDrafts](self, "supportsDrafts") & v5) == 1)
    +[CNUIDraftSupport deleteDrafts](CNUIDraftSupport, "deleteDrafts");

}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[CNContactContentEditViewController setView:](self, "setView:", v3);

  -[CNContactContentEditViewController loadContactViewControllerViews](self, "loadContactViewControllerViews");
}

- (void)loadContactViewControllerViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNContactContentEditViewController contactView](self, "contactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v5, "cellIdentifierForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController setNoteCell:](self, "setNoteCell:", v7);

  -[CNContactContentEditViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

}

- (void)setupViewHierarchyIncludingAvatarHeader:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v3 = a3;
  v31[1] = *MEMORY[0x1E0C80C00];
  if (-[CNContactContentEditViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNContactContentEditViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v3)
    {
      v31[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v7;
    }
    else
    {
      v30 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v6;
    }
    objc_msgSend(v11, "addObjectsFromArray:", v10);

    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController headerDropShadowView](self, "headerDropShadowView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    -[CNContactContentEditViewController contactView](self, "contactView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v14);

    -[CNContactContentEditViewController contactView](self, "contactView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contactView](self, "contactView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "panGestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 != v18)
    {
      -[CNContactContentEditViewController contactView](self, "contactView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "panGestureRecognizer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController contactView](self, "contactView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "panGestureRecognizer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeGestureRecognizer:", v23);

      -[CNContactContentEditViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController contactView](self, "contactView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "panGestureRecognizer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addGestureRecognizer:", v26);

    }
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __78__CNContactContentEditViewController_setupViewHierarchyIncludingAvatarHeader___block_invoke;
    v28[3] = &unk_1E204F838;
    v29 = v5;
    v27 = v5;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  }
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNContactContentNavigationItemUpdater *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNContactContentEditViewController;
  -[CNContactContentEditViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[CNContactContentEditViewController setEditing:](self, "setEditing:", 1);
  v3 = *MEMORY[0x1E0D13848];
  -[CNContactContentEditViewController initialPrompt](self, "initialPrompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) == 0)
  {
    -[CNContactContentEditViewController initialPrompt](self, "initialPrompt");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrompt:", v5);

  }
  if (-[CNContactContentEditViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar"))
  {
    -[CNContactContentEditViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setBackgroundHidden:", 0);

  }
  -[CNContactContentEditViewController navItemUpdater](self, "navItemUpdater");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(CNContactContentNavigationItemUpdater);
    -[CNContactContentEditViewController setNavItemUpdater:](self, "setNavItemUpdater:", v9);

  }
  -[CNContactContentEditViewController reloadDataIfNeeded](self, "reloadDataIfNeeded");
  -[CNContactContentEditViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsUpdateConstraints");

}

- (BOOL)shouldDisplayAvatarHeaderView
{
  void *v2;
  BOOL v3;

  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setupConstraints
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;

  v3 = -[CNContactContentEditViewController shouldDisplayAvatarHeaderView](self, "shouldDisplayAvatarHeaderView");
  -[CNContactContentEditViewController setupViewHierarchyIncludingAvatarHeader:](self, "setupViewHierarchyIncludingAvatarHeader:", v3);
  -[CNContactContentEditViewController setupTableHeaderView](self, "setupTableHeaderView");
  v4 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactContentEditViewController activatedConstraints](self, "activatedConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v73 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxHeight");
    objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 8, 0, 0, 0, 1.0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController setHeaderHeightConstraint:](self, "setHeaderHeightConstraint:", v10);

    -[CNContactContentEditViewController headerHeightConstraint](self, "headerHeightConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v11);

    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v16);

    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leftAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leftAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v21);

    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "rightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v26);

    -[CNContactContentEditViewController contactView](self, "contactView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v31);

    -[CNContactContentEditViewController contactView](self, "contactView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v36);

    -[CNContactContentEditViewController headerDropShadowView](self, "headerDropShadowView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "superview");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "scale");
      v41 = v40;

      -[CNContactContentEditViewController headerDropShadowView](self, "headerDropShadowView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "heightAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToConstant:", 1.0 / v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "addObject:", v44);

      -[CNContactContentEditViewController headerDropShadowView](self, "headerDropShadowView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "bottomAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController headerDropShadowView](self, "headerDropShadowView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "superview");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "bottomAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "addObject:", v50);

      -[CNContactContentEditViewController headerDropShadowView](self, "headerDropShadowView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "leftAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController headerDropShadowView](self, "headerDropShadowView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "superview");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "leftAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "addObject:", v56);

      -[CNContactContentEditViewController headerDropShadowView](self, "headerDropShadowView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "rightAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController headerDropShadowView](self, "headerDropShadowView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "superview");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "rightAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "addObject:", v62);

    }
  }
  -[CNContactContentEditViewController contactView](self, "contactView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "leftAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController view](self, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "leftAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addObject:", v67);

  -[CNContactContentEditViewController contactView](self, "contactView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "rightAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController view](self, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "rightAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addObject:", v72);

  -[CNContactContentEditViewController setActivatedConstraints:](self, "setActivatedConstraints:", v73);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v73);

}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactContentEditViewController;
  -[CNContactContentEditViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  -[CNContactContentEditViewController setupConstraints](self, "setupConstraints");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v3 = a3;
  if (-[CNContactContentEditViewController forcesTransparentBackground](self, "forcesTransparentBackground"))
  {
    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers"))goto LABEL_6;
    +[CNUIColorRepository popoverBackgroundColor](CNUIColorRepository, "popoverBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  -[CNContactContentEditViewController contactView](self, "contactView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

LABEL_6:
  v15.receiver = self;
  v15.super_class = (Class)CNContactContentEditViewController;
  -[CNContactContentEditViewController viewWillAppear:](&v15, sel_viewWillAppear_, v3);
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

  }
  -[CNContactContentEditViewController contactView](self, "contactView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_cnui_applyContactStyle");

  if (!-[CNContactContentEditViewController reloadDataIfNeeded](self, "reloadDataIfNeeded"))
    -[CNContactContentEditViewController _setNeedsUpdateCachedLabelWidths](self, "_setNeedsUpdateCachedLabelWidths");
  -[CNContactContentEditViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 0);
  -[CNContactContentEditViewController siriContextProvider](self, "siriContextProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnabled:", 1);

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "setNetworkActivityIndicatorVisible:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactContentEditViewController;
  -[CNContactContentEditViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (self->_needsRefetch)
  {
    -[CNContactContentEditViewController _refetchContact](self, "_refetchContact");
    self->_needsRefetch = 0;
  }
  -[CNContactContentEditViewController becomeFirstResponder](self, "becomeFirstResponder");
  -[CNContactContentEditViewController updateWindowTitleForAppearing:](self, "updateWindowTitleForAppearing:", 1);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  UIEdgeInsets *p_peripheryInsets;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNContactContentEditViewController;
  -[CNContactContentEditViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v13, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (!-[CNContactContentEditViewController isOutOfProcess](self, "isOutOfProcess"))
  {
    p_peripheryInsets = &self->_peripheryInsets;
    -[CNContactContentEditViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_peripheryInsets");
    p_peripheryInsets->top = v9;
    p_peripheryInsets->left = v10;
    p_peripheryInsets->bottom = v11;
    p_peripheryInsets->right = v12;

  }
}

- (void)prepareContactDidAppearForPPT
{
  if (-[CNContactContentEditViewController runningPPT](self, "runningPPT"))
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "installCACommitCompletionBlock:", &__block_literal_global_275);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactContentEditViewController;
  -[CNContactContentEditViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[CNContactContentEditViewController siriContextProvider](self, "siriContextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[CNContactContentEditViewController updateWindowTitleForAppearing:](self, "updateWindowTitleForAppearing:", 0);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactContentEditViewController;
  -[CNContactContentEditViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calculateLabelSizesIfNeeded");

  -[CNContactContentEditViewController updateEditPhotoButtonIfNeeded](self, "updateEditPhotoButtonIfNeeded");
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNContactContentEditViewController;
  -[CNContactContentEditViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[CNContactContentEditViewController _updateCachedLabelWidthsIfNeeded](self, "_updateCachedLabelWidthsIfNeeded");
  -[CNContactContentEditViewController setupTableHeaderView](self, "setupTableHeaderView");
  v4 = v3;
  v6 = v5;
  -[CNContactContentEditViewController initializeTableViewsForHeaderHeight](self, "initializeTableViewsForHeaderHeight");
  -[CNContactContentEditViewController contactView](self, "contactView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "frame");
    if (v4 != v10 || v6 != v9)
    {
      -[CNContactContentEditViewController contactView](self, "contactView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTableHeaderView:", v8);

    }
  }
  -[CNContactContentEditViewController focusOnFirstEditingItemIfNeeded](self, "focusOnFirstEditingItemIfNeeded");

}

- (CGSize)setupTableHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  CGSize result;

  if (-[CNContactContentEditViewController shouldDisplayAvatarHeaderView](self, "shouldDisplayAvatarHeaderView")
    || (-[CNContactContentEditViewController contactView](self, "contactView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "customHeaderView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    v6 = 0;
  }
  else
  {
    -[CNContactContentEditViewController contactView](self, "contactView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customHeaderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CNContactContentEditViewController contactView](self, "contactView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "needsUpdateConstraints");

  if (v6)
  {
    objc_msgSend(v6, "frame");
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[CNContactContentEditViewController contactView](self, "contactView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTableHeaderView:", v6);

  if ((v9 & 1) == 0)
  {
    -[CNContactContentEditViewController contactView](self, "contactView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tableHeaderView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "needsUpdateConstraints");

    if (v17)
    {
      -[CNContactContentEditViewController contactView](self, "contactView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "tableHeaderView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "updateConstraints");

    }
  }

  v20 = v11;
  v21 = v13;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)updateEditPhotoButtonIfNeeded
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  if (-[CNContactContentEditViewController isHeaderViewPhotoProhibited](self, "isHeaderViewPhotoProhibited"))
  {
    v3 = 0;
  }
  else
  {
    -[CNContactContentEditViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = +[CNVisualIdentityPickerViewController canShowPhotoPickerForView:withTraitCollection:](CNPhotoPickerViewController, "canShowPhotoPickerForView:withTraitCollection:", v4, v5);

  }
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowsEditPhoto");

  if (v3 != v7)
  {
    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsEditPhoto:preservingChanges:", v3, 1);

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)didChangeToEditMode:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[CNContactContentEditViewController isEditing](self, "isEditing") != a3)
    -[CNContactContentEditViewController setEditing:animated:](self, "setEditing:animated:", v3, 0);
}

- (void)editCancel
{
  -[CNContactContentEditViewController editCancel:](self, "editCancel:", 0);
}

- (void)didChangeToShowTitle:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutPositionallyAfterNavBar:", v3);

  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateForShowingNavBar:", objc_msgSend(v6, "layoutPositionallyAfterNavBar"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[CNContactContentEditViewController _currentGroupsForTableView:](self, "_currentGroupsForTableView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (BOOL)isStandardGroup:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentEditViewController isStandardGroup:](self, "isStandardGroup:", v5))
    objc_msgSend(v5, "editingItems");
  else
    objc_msgSend(v5, "actionItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (-[CNContactContentEditViewController _indexPathIsActionItem:forTableView:](self, "_indexPathIsActionItem:forTableView:", v8, v7))
  {
    -[CNContactContentEditViewController _cellForIndexPath:forTableView:](self, "_cellForIndexPath:forTableView:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v8, "section"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CNContactContentEditViewController isStandardGroup:](self, "isStandardGroup:", v10))
    {
      -[CNContactContentEditViewController _cellForIndexPath:forTableView:](self, "_cellForIndexPath:forTableView:", v8, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  -[CNContactContentEditViewController _updateLabelWidthForCell:](self, "_updateLabelWidthForCell:", v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[CNContactContentEditViewController prepareCell:](self, "prepareCell:", v9);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactContentEditViewController.m"), 1889, CFSTR("We have no cell to return!"));

  }
  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a5;
  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v8, "section"), v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "editingItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 2)
  {
    objc_msgSend(v15, "cellForRowAtIndexPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CNContactContentEditViewController addLinkedCardAction](self, "addLinkedCardAction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
      -[CNContactContentEditViewController addStaticIdentityAction](self, "addStaticIdentityAction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "performActionWithSender:", v12);

      goto LABEL_13;
    }
LABEL_12:
    -[CNContactContentEditViewController addEditingItemAtIndexPath:forTableView:](self, "addEditingItemAtIndexPath:forTableView:", v8, v15);
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "contact");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController removeLinkedContact:](self, "removeLinkedContact:", v12);
LABEL_13:

      goto LABEL_14;
    }
    -[CNContactContentEditViewController removeEditingItem:atIndexPath:forTableView:](self, "removeEditingItem:atIndexPath:forTableView:", v11, v8, v15);
  }
LABEL_14:
  -[CNContactContentEditViewController updateDoneButton](self, "updateDoneButton");

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  objc_msgSend(a3, "estimatedRowHeight");
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  objc_msgSend(a3, "rowHeight");
  return result;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  v10 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_opt_class();
  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v9, "section"), v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v12)
  {
    v16 = objc_msgSend(v9, "row");
    v17 = objc_msgSend(v19, "numberOfRowsInSection:", objc_msgSend(v9, "section"));
    if (v15 && v16 < v17 - 1)
    {
      objc_msgSend(v12, "setShowSeparator:", 1);
    }
    else
    {
      -[CNContactContentEditViewController environment](self, "environment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShowSeparator:", objc_msgSend(v18, "runningInContactsAppOniPad"));

    }
  }

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  BOOL v8;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = !v7 || (objc_msgSend(v7, "forceSuggested") & 1) == 0 && objc_msgSend(v7, "allowsCellSelection");
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(v14, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentEditViewController _indexPathIsActionItem:forTableView:](self, "_indexPathIsActionItem:forTableView:", v6, v14))
  {
    -[CNContactContentEditViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v6, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "performActionWithSender:", v7);
    objc_msgSend(v14, "indexPathForSelectedRow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deselectRowAtIndexPath:animated:", v11, 1);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(v14, "deselectRowAtIndexPath:animated:", v6, 1);
      -[CNContactContentEditViewController addEditingItemAtIndexPath:forTableView:](self, "addEditingItemAtIndexPath:forTableView:", v6, v14);
    }
    else
    {
      if ((objc_msgSend(v7, "shouldPerformDefaultAction") & 1) != 0
        || (-[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "allowsPropertyActions"),
            v12,
            v13))
      {
        objc_msgSend(v7, "performDefaultAction");
      }
      objc_msgSend(v14, "deselectRowAtIndexPath:animated:", v6, 1);
    }
  }

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;

  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_scaledValueForValue:", 44.0);
    v11 = v10 + 15.0;

  }
  else if ((isKindOfClass & 1) != 0
         && (-[CNContactContentEditViewController nameEditingGroups](self, "nameEditingGroups"),
             v12 = (void *)objc_claimAutoreleasedReturnValue(),
             v13 = objc_msgSend(v12, "containsObject:", v6),
             v12,
             v13))
  {
    v11 = 0.0;
    if (!a4)
    {
      v14 = *MEMORY[0x1E0D13848];
      -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "warningMessage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v16);

      if ((_DWORD)v14)
        v11 = 0.0;
      else
        v11 = *MEMORY[0x1E0DC53D8];
    }
  }
  else
  {
    v11 = 44.0;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;

  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController editingGroups](self, "editingGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
    v8 = 35.0;
  else
    v8 = 0.0;

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;

  v6 = a3;
  if (a4)
    goto LABEL_3;
  v7 = *MEMORY[0x1E0D13848];
  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "warningMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  if ((v7 & 1) != 0)
  {
LABEL_3:
    v10 = 0;
  }
  else
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *MEMORY[0x1E0D137F8];
    -[CNContactContentEditViewController mutableContact](self, "mutableContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "phoneNumbers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShouldDisplayWarningIcon:", (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v16));

    objc_msgSend(v10, "warningText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "warningMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqual:", v19);

    if ((v20 & 1) == 0)
    {
      -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "warningMessage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWarningText:", v22);

    }
  }

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "title");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNContactContentEditViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v7)
    {
      -[CNContactContentEditViewController ignoreContactAction](self, "ignoreContactAction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v6 = &stru_1E20507A8;
      else
        v6 = 0;
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (-[CNContactContentEditViewController nameEditingGroups](self, "nameEditingGroups"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "lastObject"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v5 == v7))
  {
    v8 = &stru_1E20507A8;
  }
  else
  {
    v8 = 0;
  }

  return (id)v8;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentEditViewController nameEditingGroups](self, "nameEditingGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5 == v7;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentEditViewController nameEditingGroups](self, "nameEditingGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v5);
    -[CNContactContentEditViewController nameEditingGroups](self, "nameEditingGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 == objc_msgSend(v8, "count") - 1;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a4;
  v8 = a3;
  -[CNContactContentEditViewController tableView:willDisplayFooterView:forSection:](self, "tableView:willDisplayFooterView:forSection:", v8, v20, a5);
  objc_msgSend(v20, "_cnui_applyContactStyle");
  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentEditViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v10
    && (-[CNContactContentEditViewController ignoreContactAction](self, "ignoreContactAction"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = v9,
        v15))
  {
    -[CNContactContentEditViewController contactView](self, "contactView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sectionBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[CNContactContentEditViewController contactView](self, "contactView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sectionBackgroundColor");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "backgroundColor");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v18 = (void *)v14;
      objc_msgSend(v20, "backgroundView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setBackgroundColor:", v18);

    }
  }

}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend(v14, "updateConstraintsIfNeeded");
  objc_msgSend(v14, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 1;
  }
  else
  {
    -[CNContactContentEditViewController environment](self, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "runningInContactsAppOniPad");

  }
  if (v9 && !v6)
  {
    v11 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v6 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  -[CNContactContentEditViewController contactView](self, "contactView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v13);

  objc_msgSend(v14, "setBackgroundView:", v6);
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[CNContactContentEditViewController _cellIdentifierForTableView:indexPath:](self, "_cellIdentifierForTableView:indexPath:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend((id)objc_opt_class(), "classForCellIdentifier:", v5);

  LOBYTE(v6) = objc_msgSend(v7, "shouldIndentWhileEditing");
  return (char)v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v4;
  id v5;
  int64_t v6;

  -[CNContactContentEditViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = 1;
          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              v6 = objc_opt_isKindOfClass() & 1;
              goto LABEL_15;
            }
          }
        }
      }
    }
    v6 = 2;
    goto LABEL_15;
  }
  v5 = v4;
  if ((objc_msgSend(v5, "isReadonly") & 1) != 0 || !objc_msgSend(v5, "canRemove"))
  {
    v6 = 0;
  }
  else
  {
    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() & 1) == 0;
  }

LABEL_15:
  return v6;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return 0;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v7;

  if (sel_copy_ == a4)
  {
    objc_msgSend(a3, "cellForRowAtIndexPath:", a5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, a4);

  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  -[CNContactContentEditViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
    v8 = CFSTR("UNLINK");
  else
    v8 = CFSTR("DELETE");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v4;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "shouldPerformAccessoryAction"))
    objc_msgSend(v4, "performAccessoryAction");

}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  CGRect v37;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "setModalPresentationStyle:", -[CNContactContentEditViewController _modalPresentationStyleForViewController:](self, "_modalPresentationStyleForViewController:", v7));
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalTransitionStyle:", objc_msgSend(v8, "modalTransitionStyle"));

  objc_opt_class();
  v36 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v36;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v7, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSourceView:", v10);

  objc_msgSend(v10, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[CNContactContentEditViewController contactView](self, "contactView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController centeredSourceRect:inContactView:](self, "centeredSourceRect:inContactView:", v20, v13, v15, v17, v19);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v7, "popoverPresentationController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSourceRect:", v22, v24, v26, v28);

  objc_msgSend(v7, "popoverPresentationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPermittedArrowDirections:", 15);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "presentationController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDelegate:", self);

  }
  if (!self->_disablingRotation)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "userInterfaceIdiom"))
    {
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_referenceBounds");
    if (CGRectGetHeight(v37) <= 667.0 || objc_msgSend(v7, "modalPresentationStyle"))
    {

      goto LABEL_11;
    }
    v34 = objc_msgSend(v7, "supportedInterfaceOrientations");
    v35 = -[CNContactContentEditViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations");

    if (v34 != v35)
    {
      -[CNContactContentEditViewController _beginDisablingInterfaceAutorotation](self, "_beginDisablingInterfaceAutorotation");
      self->_disablingRotation = 1;
    }
  }
LABEL_12:
  -[CNContactContentEditViewController setBackgroundColorIfNeededForPresentedViewController:](self, "setBackgroundColorIfNeededForPresentedViewController:", v7);
  -[CNContactContentEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  _QWORD v15[5];
  id v16;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNContactContentEditViewController;
  -[CNContactContentEditViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CNContactContentEditViewController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contactView](self, "contactView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v12)
    {
      -[CNContactContentEditViewController presentedViewController](self, "presentedViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __89__CNContactContentEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
        v15[3] = &unk_1E204ED70;
        v15[4] = self;
        v16 = v10;
        objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v15);

      }
    }
  }

}

- (void)updateOutOfProcessFullscreenPresentationIfNeeded
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;
  void *v7;
  char v8;
  id v9;

  if (-[CNContactContentEditViewController isOutOfProcess](self, "isOutOfProcess"))
  {
    if (-[CNContactContentEditViewController isPresentingModalViewController](self, "isPresentingModalViewController"))
    {
      -[CNContactContentEditViewController presentedViewController](self, "presentedViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        if (-[CNContactContentEditViewController isPresentingFullscreenForOutOfProcess](self, "isPresentingFullscreenForOutOfProcess"))
        {
          -[CNContactContentEditViewController delegate](self, "delegate");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_opt_respondsToSelector();

          if ((v6 & 1) != 0)
          {
            -[CNContactContentEditViewController delegate](self, "delegate");
            v9 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "contactEditViewControllerWillPresentFullscreen:", self);
LABEL_10:

            return;
          }
        }
        if (!-[CNContactContentEditViewController isPresentingFullscreenForOutOfProcess](self, "isPresentingFullscreenForOutOfProcess"))
        {
          -[CNContactContentEditViewController delegate](self, "delegate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_opt_respondsToSelector();

          if ((v8 & 1) != 0)
          {
            -[CNContactContentEditViewController delegate](self, "delegate");
            v9 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "contactEditViewControllerWillDismissFullscreen:", self);
            goto LABEL_10;
          }
        }
      }
    }
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && CNUIIsDDActionsService())
    return -1;
  else
    return -2;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  if (a4 != 5)
  {
    if (-[CNContactContentEditViewController isOutOfProcess](self, "isOutOfProcess"))
    {
      -[CNContactContentEditViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        objc_msgSend(v14, "presentedViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          -[CNContactContentEditViewController setIsPresentingFullscreenForOutOfProcess:](self, "setIsPresentingFullscreenForOutOfProcess:", 1);
          -[CNContactContentEditViewController delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "contactEditViewControllerWillPresentFullscreen:", self);

        }
      }
    }
  }

}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  char v5;
  id v6;

  if (-[CNContactContentEditViewController isOutOfProcess](self, "isOutOfProcess", a3))
  {
    -[CNContactContentEditViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CNContactContentEditViewController setIsPresentingFullscreenForOutOfProcess:](self, "setIsPresentingFullscreenForOutOfProcess:", 0);
      -[CNContactContentEditViewController delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contactEditViewControllerWillDismissFullscreen:", self);

    }
  }
}

- (void)performConfirmedCancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNContactContentEditViewController cancelAsyncLookups](self, "cancelAsyncLookups");
  -[CNContactContentEditViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", 0);
  if (-[CNContactContentEditViewController mode](self, "mode") == 3)
  {
    -[CNContactContentEditViewController contact](self, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[CNContactContentEditViewController cleanupRecentMetadata](self, "cleanupRecentMetadata");
  }
  -[CNContactContentEditViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endEditing:", 1);

  -[CNContactContentEditViewController setEditingLinkedContacts:](self, "setEditingLinkedContacts:", 0);
  -[CNContactContentEditViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
  -[CNContactContentEditViewController contactView](self, "contactView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

  if (-[CNContactContentEditViewController supportsDrafts](self, "supportsDrafts"))
    +[CNUIDraftSupport deleteDrafts](CNUIDraftSupport, "deleteDrafts");
}

- (int64_t)_modalPresentationStyleForViewController:(id)a3
{
  void *v3;
  id v5;
  int64_t v6;
  void *v7;
  char isKindOfClass;
  char v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;

  v5 = a3;
  if (NSClassFromString(CFSTR("QLPreviewController")) && (objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v5, "modalPresentationStyle"))
    goto LABEL_27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "modalPresentationStyle");
    goto LABEL_28;
  }
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = 7;
    goto LABEL_28;
  }
  getSLComposeViewControllerClass_21559();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 5;
    goto LABEL_28;
  }
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v5, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

LABEL_17:
      if (-[UIViewController ab_isInPopover](self, "ab_isInPopover"))
      {
        v6 = 2;
        goto LABEL_28;
      }
      if (-[CNContactContentEditViewController isOutOfProcess](self, "isOutOfProcess") || CNUIIsDDActionsService())
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "userInterfaceIdiom");

        if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
LABEL_27:
          v6 = 0;
          goto LABEL_28;
        }
      }
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "shouldPresentInCurrentContext") & 1) != 0)
      {
        v6 = 3;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "userInterfaceIdiom");

        if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          v6 = 2;
        else
          v6 = -2;
      }
LABEL_38:

      goto LABEL_28;
    }
  }
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();
  if ((v9 & 1) != 0)
  {

  }
  if ((v10 & 1) != 0)
    goto LABEL_17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "viewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();

    if ((v13 & 1) != 0)
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "shouldPresentInCurrentContext"))
        v6 = 6;
      else
        v6 = -2;
      goto LABEL_38;
    }
  }
  if (-[UIViewController ab_isInPopover](self, "ab_isInPopover")
    || -[UIViewController ab_isInSheet](self, "ab_isInSheet"))
  {
LABEL_40:
    v6 = 3;
    goto LABEL_28;
  }
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "shouldPresentInCurrentContext"))
  {

    goto LABEL_40;
  }
  v21 = CNUIIsDDActionsService();

  if (v21)
    goto LABEL_40;
  if (_CFMZEnabled())
    v6 = 3;
  else
    v6 = 7;
LABEL_28:

  return v6;
}

- (void)setBackgroundColorIfNeededForPresentedViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    v10 = v9 ^ 1;
  }
  else
  {
    v10 = 1;
  }

  -[CNContactContentEditViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if ((v10 & 1) == 0 && (v15 & 1) == 0)
  {
    -[CNContactContentEditViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v18);

  }
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
  -[CNContactContentEditViewController sender:dismissViewController:completionHandler:](self, "sender:dismissViewController:completionHandler:", a3, a4, 0);
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v7 = a4;
  v8 = a5;
  if (-[CNContactContentEditViewController isOutOfProcess](self, "isOutOfProcess"))
  {
    -[CNContactContentEditViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[CNContactContentEditViewController setIsPresentingFullscreenForOutOfProcess:](self, "setIsPresentingFullscreenForOutOfProcess:", 0);
      -[CNContactContentEditViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contactEditViewControllerWillDismissFullscreen:", self);

    }
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__CNContactContentEditViewController_sender_dismissViewController_completionHandler___block_invoke;
  v13[3] = &unk_1E204F9B0;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v13);

}

- (BOOL)isPresentingModalViewController
{
  void *v2;
  BOOL v3;

  -[CNContactContentEditViewController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)viewController:(id)a3 presentationControllerWillDismiss:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[CNContactContentEditViewController presentedViewController](self, "presentedViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
    -[CNContactContentEditViewController presentationControllerWillDismiss:](self, "presentationControllerWillDismiss:", v8);

}

- (void)action:(id)a3 prepareChildContactViewController:(id)a4 sender:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = objc_msgSend(&unk_1E20D3808, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(&unk_1E20D3808);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[CNContactContentEditViewController valueForKey:](self, "valueForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "setValue:forKey:", v14, v13);

      }
      v10 = objc_msgSend(&unk_1E20D3808, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }
  objc_msgSend(v8, "setAllowsSettingLinkedContactsAsPreferred:", 0);
  objc_msgSend(v8, "setAllowsAddToFavorites:", 0);
  objc_msgSend(v8, "setAllowsAddingToAddressBook:", 0);
  objc_msgSend(v8, "setShouldShowLinkedContacts:", 0);
  -[CNContactContentEditViewController parentGroup](self, "parentGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setParentGroup:", v15);

  -[CNContactContentEditViewController linkedCardsAction](self, "linkedCardsAction");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 != v7)
  {
    -[CNContactContentEditViewController parentContainer](self, "parentContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setParentContainer:", v17);

  }
  -[CNContactContentEditViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProhibitedPropertyKeys:", v18);

  objc_msgSend(v8, "contactView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController environment](self, "environment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAttributesFromContactView:runningInContactsAppOniPad:", v20, objc_msgSend(v21, "runningInContactsAppOniPad"));

}

- (id)action:(id)a3 cellForPropertyItem:(id)a4 sender:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(v6, "property");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactView cellIdentifierForProperty:](CNContactView, "cellIdentifierForProperty:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = +[CNContactView classForCellIdentifier:](CNContactView, "classForCellIdentifier:", v8);
  v10 = v9;
  if (v9)
  {
    v11 = [v9 alloc];
    NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_msgSend(v11, "initWithStyle:reuseIdentifier:", 0, v12);

    -[objc_class setIgnoreSuggested:](v10, "setIgnoreSuggested:", 1);
    -[objc_class setCardGroupItem:](v10, "setCardGroupItem:", v6);
    -[objc_class setDelegate:](v10, "setDelegate:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class setAllowsActions:](v10, "setAllowsActions:", objc_msgSend(v13, "allowsActions"));

    }
    -[CNContactContentEditViewController prepareCell:](self, "prepareCell:", v10);
  }

  return v10;
}

- (void)action:(id)a3 presentViewController:(id)a4 sender:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[CNContactContentEditViewController presentingDelegate](self, "presentingDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sender:presentViewController:", v7, v8);

}

- (void)action:(id)a3 dismissViewController:(id)a4 sender:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[CNContactContentEditViewController presentingDelegate](self, "presentingDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sender:dismissViewController:", v7, v8);

}

- (void)action:(id)a3 pushViewController:(id)a4 sender:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[CNContactContentEditViewController setBackgroundColorIfNeededForPresentedViewController:](self, "setBackgroundColorIfNeededForPresentedViewController:", v6);
  -[CNContactContentEditViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prompt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrompt:", v8);

  -[CNContactContentEditViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v6, 1);

}

- (void)actionDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  dispatch_time_t v26;
  void *v27;
  char v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  id v35;
  id v36;

  v4 = a3;
  -[CNContactContentEditViewController contactView](self, "contactView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v7, 1);

  -[CNContactContentEditViewController deleteContactAction](self, "deleteContactAction");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((id)v8 == v4)
  {

    goto LABEL_8;
  }
  v9 = (void *)v8;
  -[CNContactContentEditViewController ignoreContactAction](self, "ignoreContactAction");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v4)
  {
LABEL_8:
    -[CNContactContentEditViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0)
    {
LABEL_11:
      -[CNContactContentEditViewController navigationController](self, "navigationController");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v17, "popViewControllerAnimated:", 1);
LABEL_15:

      goto LABEL_16;
    }
    -[CNContactContentEditViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contact](self, "contact");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contactEditViewController:didDeleteContact:", self, v16);
LABEL_10:

    goto LABEL_11;
  }
  -[CNContactContentEditViewController addLinkedCardAction](self, "addLinkedCardAction");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    -[CNContactContentEditViewController addLinkedCardAction](self, "addLinkedCardAction");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "chosenContact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController addLinkedContact:](self, "addLinkedContact:", v19);
LABEL_14:

    goto LABEL_15;
  }
  -[CNContactContentEditViewController addStaticIdentityAction](self, "addStaticIdentityAction");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
    -[CNContactContentEditViewController addStaticIdentityAction](self, "addStaticIdentityAction");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "chosenIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController addStaticIdentity:](self, "addStaticIdentity:", v19);
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentEditViewController reloadUnifiedContact](self, "reloadUnifiedContact");
    goto LABEL_16;
  }
  -[CNContactContentEditViewController suggestedContactAction](self, "suggestedContactAction");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 == v4)
  {
    -[CNContactContentEditViewController delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_opt_respondsToSelector();

    if ((v28 & 1) == 0)
      goto LABEL_11;
    -[CNContactContentEditViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController suggestedContactAction](self, "suggestedContactAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contactEditViewController:didDeleteContact:", self, v29);

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v4;
    objc_msgSend(v17, "propertyItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "group");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v17, "selectedChoice");
    if (v22 == 2)
    {
      objc_msgSend(v17, "reject");
      objc_msgSend(v19, "reloadDataPreservingChanges:", 0);
    }
    else if (v22 == 1)
    {
      objc_msgSend(v17, "propertyItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController indexPathOfDisplayedPropertyItem:](self, "indexPathOfDisplayedPropertyItem:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactContentEditViewController contactView](self, "contactView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "selectRowAtIndexPath:animated:scrollPosition:", v24, 0, 0);

      v26 = dispatch_time(0, 500000000);
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __54__CNContactContentEditViewController_actionDidFinish___block_invoke;
      v34 = &unk_1E2050400;
      v35 = v17;
      v36 = v19;
      dispatch_after(v26, MEMORY[0x1E0C80D38], &v31);

    }
    goto LABEL_14;
  }
  -[CNContactContentEditViewController selectContainersAction](self, "selectContainersAction");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  if (v30 == v4)
    -[CNContactContentEditViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
LABEL_16:
  -[CNContactContentEditViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 1, v31, v32, v33, v34);

}

- (void)actionWasCanceled:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CNContactContentEditViewController contactView](self, "contactView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForSelectedRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1);

}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewLabel:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "updateLabeledValueWithLabel:", a5);
  objc_msgSend(v9, "updateWithPropertyItem:", v8);

  objc_msgSend(v8, "group");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentEditViewController contactView](self, "contactView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController _updateLabelWidthForCellsInGroup:forTableView:reset:](self, "_updateLabelWidthForCellsInGroup:forTableView:reset:", v10, v11, 1);

  -[CNContactContentEditViewController updateDoneButton](self, "updateDoneButton");
}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewValue:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  objc_msgSend(v8, "updateLabeledValueWithValue:", a5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v21, "updateWithPropertyItem:", v8);
  objc_msgSend(v8, "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController _updateLabelWidthForCellsInGroup:forTableView:reset:](self, "_updateLabelWidthForCellsInGroup:forTableView:reset:", v9, v10, 1);

  objc_msgSend(v8, "property");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C96680];
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C96680]))
  {

    v13 = *MEMORY[0x1E0C96888];
LABEL_6:
    -[CNContactContentEditViewController propertyGroups](self, "propertyGroups");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController _validateGroup:](self, "_validateGroup:", v17);

    -[CNContactContentEditViewController propertyGroups](self, "propertyGroups");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController _validateGroup:](self, "_validateGroup:", v19);

    goto LABEL_7;
  }
  objc_msgSend(v8, "property");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C96888];
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C96888]);

  if (v15)
    goto LABEL_6;
LABEL_7:
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateContactWithEditedPropertyItem:", v8);

  -[CNContactContentEditViewController updateDoneButton](self, "updateDoneButton");
}

- (void)propertyCell:(id)a3 performActionForItem:(id)a4 withTransportType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  CNPropertySuggestionAction *v13;
  void *v14;
  CNPropertySuggestionAction *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  CNContactContentEditViewController *v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentEditViewController linkedCardsAction](self, "linkedCardsAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v12 = v10;
    objc_msgSend(v10, "performActionForItem:sender:", v9, v8);
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentEditViewController addLinkedCardAction](self, "addLinkedCardAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v12 = v11;
    objc_msgSend(v11, "performActionWithSender:", v8);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentEditViewController staticIdentityAction](self, "staticIdentityAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentEditViewController addStaticIdentityAction](self, "addStaticIdentityAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentEditViewController selectContainersAction](self, "selectContainersAction");
    v13 = (CNPropertySuggestionAction *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController containerContext](self, "containerContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySuggestionAction performActionWithContainerContext:](v13, "performActionWithContainerContext:", v14);

  }
  else if (objc_msgSend(v8, "isSuggested"))
  {
    v15 = [CNPropertySuggestionAction alloc];
    -[CNContactContentEditViewController contact](self, "contact");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CNPropertyAction initWithContact:propertyItem:](v15, "initWithContact:propertyItem:", v16, v9);

    -[CNContactAction setDelegate:](v13, "setDelegate:", self);
    -[CNPropertySuggestionAction performActionForItem:sender:](v13, "performActionForItem:sender:", v9, v8);
  }
  else
  {
    if (a5 != 7)
    {
      +[CNPropertyAction performDefaultActionForItem:sender:](CNPropertyAction, "performDefaultActionForItem:sender:", v9, v8);
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v13 = (CNPropertySuggestionAction *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_TTY_CALL"), &stru_1E20507A8, CFSTR("Localized"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __90__CNContactContentEditViewController_propertyCell_performActionForItem_withTransportType___block_invoke;
    v39[3] = &unk_1E204F9D8;
    v39[4] = self;
    v20 = v9;
    v40 = v20;
    v21 = v8;
    v41 = v21;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, v39);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySuggestionAction addAction:](v13, "addAction:", v22);

    v23 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_TTY_RELAY_CALL"), &stru_1E20507A8, CFSTR("Localized"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __90__CNContactContentEditViewController_propertyCell_performActionForItem_withTransportType___block_invoke_2;
    v35 = &unk_1E204F9D8;
    v36 = self;
    v37 = v20;
    v26 = v21;
    v38 = v26;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, &v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySuggestionAction addAction:](v13, "addAction:", v27, v32, v33, v34, v35, v36);

    v28 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "actionWithTitle:style:handler:", v30, 1, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySuggestionAction addAction:](v13, "addAction:", v31);

    -[CNContactContentEditViewController sender:presentViewController:](self, "sender:presentViewController:", v26, v13);
  }

LABEL_12:
}

- (void)propertyCell:(id)a3 didDeleteLabel:(id)a4 forGroup:(id)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v21 = a5;
  objc_msgSend(v21, "itemsUsingLabel:", a4);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v19 = *(_QWORD *)v28;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v6);
        objc_msgSend(v21, "nextAvailableLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateLabeledValueWithLabel:", v8);
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        -[CNContactContentEditViewController contactView](self, "contactView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "visibleCells");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v24;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v15, "propertyItem");
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16 == v7)
                  objc_msgSend(v15, "updateWithPropertyItem:", v7);
              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v12);
        }

        ++v6;
      }
      while (v6 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }
  -[CNContactContentEditViewController contactView](self, "contactView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController _updateLabelWidthForCellsInGroup:forTableView:reset:](self, "_updateLabelWidthForCellsInGroup:forTableView:reset:", v21, v17, 1);

  -[CNContactContentEditViewController updateDoneButton](self, "updateDoneButton");
}

- (void)propertyCellDidChangeLayout:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CNContactContentEditViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("needsHeightCalculation"));
    objc_msgSend(v4, "_heightForRowAtIndexPath:", v5);
    objc_msgSend(v4, "_setHeight:forRowAtIndexPath:", v5);
  }

}

- (void)propertyItem:(id)a3 willChangeValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contactProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "phoneticProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CNContactContentEditViewController nameEditingGroups](self, "nameEditingGroups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __67__CNContactContentEditViewController_propertyItem_willChangeValue___block_invoke;
    v54[3] = &unk_1E204FA00;
    v11 = v9;
    v55 = v11;
    objc_msgSend(v10, "_cn_firstObjectPassingTest:", v54);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "editingItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "labeledValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentEditViewController _phoneticNameForValue:currentPhoneticName:property:](self, "_phoneticNameForValue:currentPhoneticName:property:", v7, v16, v11);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v44 = v16;
    if (!objc_msgSend(v7, "length"))
    {
      objc_msgSend(v6, "labeledValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "value");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v11;
      v21 = (void *)v19;
      v22 = v16;
      v23 = v20;
      -[CNContactContentEditViewController _phoneticNameForValue:currentPhoneticName:property:](self, "_phoneticNameForValue:currentPhoneticName:property:", v19, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {

        v17 = &stru_1E20507A8;
      }

      v11 = v23;
      v16 = v44;
    }
    if (v17)
    {
      v42 = v7;
      v43 = v6;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v12, "editingItems");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v51 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "updateLabeledValueWithValue:", v17);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
        }
        while (v27);
      }
      v45 = v11;
      v41 = v12;

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      -[CNContactContentEditViewController contactView](self, "contactView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "visibleCells");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v47 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v36, "propertyItem");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "property");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "isEqualToString:", v45);

              if (v39)
              {
                objc_msgSend(v36, "textField");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "setText:", v17);

              }
            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        }
        while (v33);
      }

      v7 = v42;
      v6 = v43;
      v12 = v41;
      v16 = v44;
    }

  }
}

- (id)_phoneticNameForValue:(id)a3 currentPhoneticName:(id)a4 property:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  const __CFString *v14;
  int v15;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "cnui_stringByTransliteratingToPhoneticCharactersForProperty:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_trimmedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_trimmedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v10, "isEqualToString:", v11);
  v13 = objc_msgSend(v7, "length");

  if (v13)
  {
    if ((v12 & 1) != 0)
    {
      v14 = &stru_1E20507A8;
LABEL_9:

      v9 = (void *)v14;
    }
  }
  else
  {
    if (objc_msgSend(v9, "length"))
      v15 = v12;
    else
      v15 = 1;
    if (v15 == 1)
    {
      v14 = 0;
      goto LABEL_9;
    }
  }
  return v9;
}

- (id)alreadyPickedGroups
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CNContactContentEditViewController editingGroups](self, "editingGroups", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v9, "property");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)contactGroupPickerDidCancel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactContentEditViewController presentingDelegate](self, "presentingDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sender:dismissViewController:", self, v4);

}

- (void)contactGroupPickerDidFinish:(id)a3 withGroup:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[CNContactContentEditViewController presentingDelegate](self, "presentingDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sender:dismissViewController:", self, v6);

  -[CNContactContentEditViewController _addedGroupWithName:](self, "_addedGroupWithName:", v8);
}

- (void)headerPhotoDidUpdate
{
  -[CNContactContentEditViewController updateDoneButton](self, "updateDoneButton");
  -[CNContactHeaderEditView updateEditButtonTitle](self->_contactHeaderView, "updateEditButtonTitle");
}

- (void)headerView:(id)a3 didAcceptDropOfImageData:(id)a4
{
  -[CNContactHeaderEditView presentAvatarPickerWithImageData:](self->_contactHeaderView, "presentAvatarPickerWithImageData:", a4);
}

- (BOOL)isNicknameProhibited
{
  void *v2;
  char v3;

  -[CNContactContentEditViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0C967A0]);

  return v3;
}

- (void)headerViewDidChangeHeight:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CNContactContentEditViewController viewDidLayoutSubviews](self, "viewDidLayoutSubviews");
    -[CNContactContentEditViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
    -[CNContactContentEditViewController setupConstraints](self, "setupConstraints");
  }
}

- (UIEdgeInsets)headerViewSafeAreaInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[CNContactContentEditViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[CNContactContentEditViewController navigationBarHeight](self, "navigationBarHeight");
  v11 = v5 - v10;
  v12 = 0.0;
  v13 = v7;
  v14 = v9;
  result.right = v14;
  result.bottom = v12;
  result.left = v13;
  result.top = v11;
  return result;
}

- (double)navigationBarHeight
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[CNContactContentEditViewController navigationItemController](self, "navigationItemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  return v6;
}

- (BOOL)headerViewShouldCacheContactBackgroundColor:(id)a3
{
  return 0;
}

- (BOOL)shouldShowActionsForAvatarView:(id)a3
{
  return -[CNContactContentEditViewController isEditing](self, "isEditing", a3) ^ 1;
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  -[CNContactContentEditViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainStoreLinkedContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v16);

  v8 = v16;
  if (v7)
  {
    -[CNContactContentEditViewController removeLinkedContact:](self, "removeLinkedContact:", v16);
    -[CNContactContentEditViewController saveLinkedContactsExecutor](self, "saveLinkedContactsExecutor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController saveDescriptionForCurrentState](self, "saveDescriptionForCurrentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executeSaveWithConfiguration:saveDelegate:", v10, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentEditViewController setEditingLinkedContacts:](self, "setEditingLinkedContacts:", 0);
    -[CNContactContentEditViewController issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifiersOfIssuedSaveRequests");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v13);

    objc_msgSend(v11, "contact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v11, "contact");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController setContact:](self, "setContact:", v15);

    }
    v8 = v16;
  }

}

- (BOOL)isSuggestedContact
{
  void *v2;
  char v3;

  -[CNContactContentEditViewController contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuggested");

  return v3;
}

- (void)setNeedsReload
{
  self->_needsReload = 1;
  -[CNContactContentEditViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_reloadDataIfNeeded, 0, 0.0);
}

- (void)setNeedsReloadLazy
{
  self->_needsReload = 1;
}

- (BOOL)reloadDataIfNeeded
{
  if (!self->_needsReload || self->_animating)
    return 0;
  -[CNContactContentEditViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
  return 1;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (id)_currentTopVisibleGroupInContactView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "tableHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  objc_msgSend(v4, "estimatedRowHeight");
  v11 = v9 - v10;

  if (v6 <= v11)
  {
LABEL_14:
    v18 = 0;
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v4, "visibleCells", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v14)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v19 = v17;

      if (!v19)
        goto LABEL_14;
      objc_msgSend(v19, "propertyItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "property");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController cardGroupForProperty:](self, "cardGroupForProperty:", v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v19;
    }
    else
    {
LABEL_10:
      v18 = 0;
    }

  }
  return v18;
}

- (void)_scrollContactView:(id)a3 toVisibleGroup:(id)a4
{
  id v6;
  double v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v16, "_effectiveContentInset");
  objc_msgSend(v16, "setContentOffset:", 0.0, -v7);
  if (!v6)
    goto LABEL_10;
  v8 = -[CNContactContentEditViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v6, v16);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  v9 = v8;
  objc_msgSend(v6, "displayItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (uint64_t)(double)((unint64_t)objc_msgSend(v10, "count") >> 1);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v16, "numberOfSections");
  if (v13 <= objc_msgSend(v12, "section"))
    goto LABEL_9;
  v14 = objc_msgSend(v16, "numberOfRowsInSection:", objc_msgSend(v12, "section"));
  if (v14 > objc_msgSend(v12, "row"))
    goto LABEL_7;
  if (objc_msgSend(v16, "numberOfRowsInSection:", objc_msgSend(v12, "section")) < 1)
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v9);
  v15 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v15;
LABEL_7:
  if (v12)
  {
    objc_msgSend(v16, "scrollToRowAtIndexPath:atScrollPosition:animated:", v12, 2, 0);
    goto LABEL_9;
  }
LABEL_10:

}

- (id)_cellIdentifierForTableView:(id)a3 indexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  -[CNContactContentEditViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CNContactView cellIdentifierForEditingPropertyItem:](CNContactView, "cellIdentifierForEditingPropertyItem:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_23:
    v13 = (void *)v10;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CNContactView cellIdentifierForPropertyPlaceholder](CNContactView, "cellIdentifierForPropertyPlaceholder");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CNContactView cellIdentifierForLinkedCardsEditingGroup](CNContactView, "cellIdentifierForLinkedCardsEditingGroup");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[CNContactView cellIdentifierForLinkedCardsPlaceholderGroup](CNContactView, "cellIdentifierForLinkedCardsPlaceholderGroup");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[CNContactView cellIdentifierForStaticIdentityPlaceholderGroup](CNContactView, "cellIdentifierForStaticIdentityPlaceholderGroup");
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[CNContactView cellIdentifierForStaticIdentityEditingGroup](CNContactView, "cellIdentifierForStaticIdentityEditingGroup");
            v10 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
LABEL_26:
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactContentEditViewController.m"), 3056, CFSTR("Unknown group item: %@"), v9);

              v13 = 0;
              goto LABEL_25;
            }
            +[CNContactView cellIdentifierForContactContainerEditingGroup](CNContactView, "cellIdentifierForContactContainerEditingGroup");
            v10 = objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
    goto LABEL_23;
  }
  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v8, "section"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "useSplitActions"))
  {
    +[CNContactView cellIdentifierForSplitActions](CNContactView, "cellIdentifierForSplitActions");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v11, "displaysDropdownMenu"))
      +[CNContactView cellIdentifierForDropdownMenuActions](CNContactView, "cellIdentifierForDropdownMenuActions");
    else
      +[CNContactView cellIdentifierForActions](CNContactView, "cellIdentifierForActions");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

LABEL_24:
  if (!v13)
    goto LABEL_26;
LABEL_25:

  return v13;
}

- (id)_cellForIndexPath:(id)a3 forTableView:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v40;

  v7 = a3;
  v8 = a4;
  -[CNContactContentEditViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController _cellIdentifierForTableView:indexPath:](self, "_cellIdentifierForTableView:indexPath:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentEditViewController noteCell](self, "noteCell");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_4;
  v12 = (void *)v11;
  -[CNContactContentEditViewController contactView](self, "contactView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_class();
  objc_msgSend(v14, "cellIdentifierForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "isEqualToString:", v15);

  if (v16)
  {
    -[CNContactContentEditViewController noteCell](self, "noteCell");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController setNoteCell:](self, "setNoteCell:", 0);
  }
  else
  {
LABEL_4:
    -[CNContactContentEditViewController contactView](self, "contactView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dequeueReusableCellWithIdentifier:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactContentEditViewController.m"), 3076, CFSTR("We couldn’t create a cell with identifier: %@ indexPath: %@"), v10, v7);

  }
  if (-[CNContactContentEditViewController mode](self, "mode") == 5)
  {
    objc_opt_class();
    v19 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    if (v21)
    {
      -[CNContactContentEditViewController highlightedProperties](self, "highlightedProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count"))
      {
        -[CNContactContentEditViewController highlightedProperties](self, "highlightedProperties");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "contactProperty");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "containsObject:", v24);

        if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "setForceSuggested:", 1);
      }
      else
      {

      }
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "setDelegate:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "setShouldShowTransportButtons:", objc_msgSend((id)objc_opt_class(), "enablesTransportButtons"));
  objc_msgSend(v17, "setCardGroupItem:", v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactContentEditViewController presentingDelegate](self, "presentingDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPresentingDelegate:", v26);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsActions:", objc_msgSend(v27, "allowsActions"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v28 = v17;
    -[CNContactContentEditViewController emergencyNumberIdentifier](self, "emergencyNumberIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "propertyItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "contactProperty");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setEmergencyPhoneNumber:", objc_msgSend(v29, "isEqualToString:", v32));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v33 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
    v35 = v34;

    objc_opt_class();
    v36 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;
    v38 = v37;

    -[CNContactContentEditViewController setMenuProviderForCell:forActionGroupItem:](self, "setMenuProviderForCell:forActionGroupItem:", v38, v35);
  }

  return v17;
}

- (void)setMenuProviderForCell:(id)a3 forActionGroupItem:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(a4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "menuProvider");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setMenuProvider:", v10);
  }
  else
  {
    objc_msgSend(v7, "target");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EDFDD040))
      v12 = v11;
    else
      v12 = 0;
    v10 = v12;

    if (v10)
    {
      objc_msgSend(v15, "contextMenuInteraction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "menuProviderForContextMenuInteraction:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMenuProvider:", v14);

    }
  }

}

- (void)geminiDataSourceDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "geminiResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editingItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "geminiDataSourceDidUpdate:", v4);
  -[CNContactContentEditViewController indexPathOfEditingPropertyItem:](self, "indexPathOfEditingPropertyItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNContactContentEditViewController shouldShowGemini](self, "shouldShowGemini");
  -[CNContactContentEditViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setGeminiResult:", v5);

  -[CNContactContentEditViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShouldShowGemini:", v10);

  -[CNContactContentEditViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (v9)
    {
      if (v10)
      {
        -[CNContactContentEditViewController contactView](self, "contactView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "reloadRowsAtIndexPaths:withRowAnimation:", v15, 100);
      }
      else
      {
        -[CNContactContentEditViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentEditViewController contactView](self, "contactView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[CNContactContentEditViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v21, v22);

        -[CNContactContentEditViewController editingGroups](self, "editingGroups");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeObjectAtIndex:", v23);

        -[CNContactContentEditViewController contactView](self, "contactView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v9, "indexAtPosition:", 0));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "deleteSections:withRowAnimation:", v15, 3);
      }
      goto LABEL_9;
    }
    if (v10)
    {
      -[CNContactContentEditViewController editingGroups](self, "editingGroups");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "insertObject:atIndex:", v17, 0);

      -[CNContactContentEditViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController contactView](self, "contactView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[CNContactContentEditViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v18, v19);

      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[CNContactContentEditViewController contactView](self, "contactView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertSections:withRowAnimation:", v15, 3);
LABEL_9:

      }
    }
  }

}

- (unint64_t)groupIndexFromTableViewSectionIndex:(unint64_t)a3 forTableView:(id)a4
{
  return a3;
}

- (unint64_t)tableViewSectionIndexFromGroupIndex:(unint64_t)a3 forTableView:(id)a4
{
  return a3;
}

- (id)_labelWidthKeyForGroup:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = (__CFString *)a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[__CFString property](v3, "property");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C96888]))
    {

LABEL_5:
      v4 = CFSTR("alerts");
      goto LABEL_6;
    }
    -[__CFString property](v3, "property");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C96680]);

    v4 = v3;
    if (v7)
      goto LABEL_5;
  }
LABEL_6:

  return v4;
}

- (id)_labelWidthKeyForItem:(id)a3
{
  return a3;
}

- (void)_updateCachedLabelWidthsForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double Width;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  int v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  CGRect v38;
  CGRect v39;

  v4 = a3;
  objc_opt_class();
  v37 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v37;
  else
    v5 = 0;
  v6 = v5;

  if (v6 && objc_msgSend(v6, "supportsLabel"))
  {
    v7 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    -[CNContactContentEditViewController contactView](self, "contactView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "labelTextAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "_scaledValueForValue:", 44.0);
      v12 = v11;
    }
    else
    {
      v12 = 44.0;
    }
    -[CNContactContentEditViewController contactView](self, "contactView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    Width = CGRectGetWidth(v38);
    if ((v7 & 1) != 0)
    {
      -[CNContactContentEditViewController contactView](self, "contactView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_marginWidth");
      v17 = Width - v16;

    }
    else
    {
      v17 = Width / 3.0;
    }

    if (v7)
      v17 = v17 + -53.0;
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v6, "displayLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contactView](self, "contactView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "labelTextAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v21);

    objc_msgSend(v22, "boundingRectWithSize:options:context:", 3, 0, v17, 10000.0);
    v23 = CGRectGetWidth(v39);
    if (v12 < v23)
      v24 = 1;
    else
      v24 = v7;
    if (!v24)
      v23 = v12;
    if (v23 >= v17)
      v23 = v17;
    v25 = ceil(v23);
    objc_msgSend(v6, "group");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController _labelWidthKeyForGroup:](self, "_labelWidthKeyForGroup:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController _labelWidthKeyForItem:](self, "_labelWidthKeyForItem:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController cachedLabelWidths](self, "cachedLabelWidths");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    v32 = v31;

    if (v25 > 0.0)
    {
      -[CNContactContentEditViewController cachedLabelWidths](self, "cachedLabelWidths");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v34, v28);

      if (v25 > v32)
      {
        -[CNContactContentEditViewController cachedLabelWidths](self, "cachedLabelWidths");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKey:", v36, v27);

      }
    }

  }
}

- (void)_updateCachedLabelWidthsForGroup:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "editingItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CNContactContentEditViewController _updateCachedLabelWidthsForItem:](self, "_updateCachedLabelWidthsForItem:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updateCachedLabelWidths
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController setCachedLabelWidths:](self, "setCachedLabelWidths:", v3);

  -[CNContactContentEditViewController editingGroups](self, "editingGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      -[CNContactContentEditViewController editingGroups](self, "editingGroups");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactContentEditViewController _updateCachedLabelWidthsForGroup:](self, "_updateCachedLabelWidthsForGroup:", v8);
      ++v6;
      -[CNContactContentEditViewController editingGroups](self, "editingGroups");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v6 < v10);
  }
  -[CNContactContentEditViewController _updateLabelWidthsForAllVisibleCells](self, "_updateLabelWidthsForAllVisibleCells");
}

- (void)_setNeedsUpdateCachedLabelWidths
{
  id v3;

  -[CNContactContentEditViewController setCachedLabelWidths:](self, "setCachedLabelWidths:", 0);
  if (-[CNContactContentEditViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNContactContentEditViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)_updateCachedLabelWidthsIfNeeded
{
  void *v3;

  -[CNContactContentEditViewController cachedLabelWidths](self, "cachedLabelWidths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CNContactContentEditViewController _updateCachedLabelWidths](self, "_updateCachedLabelWidths");
}

- (void)_updateLabelWidthForCell:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  id v15;

  v15 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v15;
    v7 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    objc_msgSend(v6, "propertyItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v7 & 1) != 0)
    {
      -[CNContactContentEditViewController _labelWidthKeyForItem:](self, "_labelWidthKeyForItem:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "group");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController _labelWidthKeyForGroup:](self, "_labelWidthKeyForGroup:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CNContactContentEditViewController cachedLabelWidths](self, "cachedLabelWidths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v6, "setLabelWidth:", v14);

    v5 = v15;
  }

}

- (void)_updateLabelWidthForCellsInGroup:(id)a3 forTableView:(id)a4 reset:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v16 = a3;
  v8 = a4;
  if (v5)
  {
    -[CNContactContentEditViewController _labelWidthKeyForGroup:](self, "_labelWidthKeyForGroup:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController cachedLabelWidths](self, "cachedLabelWidths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v9);

  }
  -[CNContactContentEditViewController _updateCachedLabelWidthsForGroup:](self, "_updateCachedLabelWidthsForGroup:", v16);
  v11 = -[CNContactContentEditViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v16, v8);
  objc_msgSend(v16, "editingItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cellForRowAtIndexPath:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController _updateLabelWidthForCell:](self, "_updateLabelWidthForCell:", v15);

      ++v13;
    }
    while (v13 < objc_msgSend(v12, "count"));
  }

}

- (void)_updateLabelWidthsForAllVisibleCells
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CNContactContentEditViewController contactView](self, "contactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "visibleCells", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[CNContactContentEditViewController _updateLabelWidthForCell:](self, "_updateLabelWidthForCell:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  objc_msgSend(v3, "setContentOffset:", v5, v7);
}

- (void)addEditingItemAtIndexPath:(id)a3 forTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[6];
  id v12;

  v6 = a3;
  v7 = a4;
  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v6, "section"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "addEditingItem"))
  {
    -[CNContactContentEditViewController _updateLabelWidthForCellsInGroup:forTableView:reset:](self, "_updateLabelWidthForCellsInGroup:forTableView:reset:", v8, v7, 0);
    v9 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__CNContactContentEditViewController_addEditingItemAtIndexPath_forTableView___block_invoke;
    v11[3] = &unk_1E204FAA0;
    v11[4] = v8;
    v11[5] = self;
    v12 = v6;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __77__CNContactContentEditViewController_addEditingItemAtIndexPath_forTableView___block_invoke_2;
    v10[3] = &unk_1E204FA78;
    v10[4] = self;
    v10[5] = v8;
    -[CNContactContentEditViewController updateContactsViewWithBlock:completion:](self, "updateContactsViewWithBlock:completion:", v11, v10);

  }
}

- (void)removeEditingItem:(id)a3 atIndexPath:(id)a4 forTableView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  CNContactContentEditViewController *v18;
  id v19;
  id v20;
  char v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v9, "section"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "canAddEditingItem");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__CNContactContentEditViewController_removeEditingItem_atIndexPath_forTableView___block_invoke;
  v16[3] = &unk_1E204FAF0;
  v16[4] = v11;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v20 = v9;
  v21 = v12;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  -[CNContactContentEditViewController updateContactsViewWithBlock:completion:](self, "updateContactsViewWithBlock:completion:", v16, 0);

}

- (void)focusOnFirstEditingItemIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  if (-[CNContactContentEditViewController mode](self, "mode") == 3
    && !-[CNContactContentEditViewController didSetFirstResponder](self, "didSetFirstResponder"))
  {
    -[CNContactContentEditViewController setDidSetFirstResponder:](self, "setDidSetFirstResponder:", 1);
    -[CNContactContentEditViewController nameEditingGroups](self, "nameEditingGroups");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "editingItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentEditViewController indexPathOfEditingPropertyItem:](self, "indexPathOfEditingPropertyItem:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[CNContactContentEditViewController contactView](self, "contactView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "firstResponderItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "becomeFirstResponder");
  }
}

- (void)focusOnLastEditingItemInGroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "lastEditingItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController indexPathOfEditingPropertyItem:](self, "indexPathOfEditingPropertyItem:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "firstResponderItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "becomeFirstResponder");
}

- (id)_updateContact:(id)a3 withMissingKeysFromRequiredKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "areKeysAvailable:useIgnorableKeys:findMissingKeys:", v7, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "first");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    v11 = v6;
  }
  else
  {
    objc_msgSend(v8, "second");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController setMissingRequiredKeys:](self, "setMissingRequiredKeys:", v12);

    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__21538;
    v28 = __Block_byref_object_dispose__21539;
    v29 = 0;
    v13 = objc_alloc(MEMORY[0x1E0C97210]);
    -[CNContactContentEditViewController missingRequiredKeys](self, "missingRequiredKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithKeysToFetch:", v14);

    v16 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v6, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateForContactsWithIdentifiers:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPredicate:", v19);

    objc_msgSend(v15, "setUnifyResults:", objc_msgSend(v6, "isUnified"));
    -[CNContactContentEditViewController contactStore](self, "contactStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __85__CNContactContentEditViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke;
    v23[3] = &unk_1E204FB18;
    v23[4] = &v24;
    objc_msgSend(v20, "enumerateContactsWithFetchRequest:error:usingBlock:", v15, 0, v23);

    v21 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v21, "overwriteStateFromContact:", v25[5]);
    objc_msgSend(v21, "freeze");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v24, 8);
  }

  return v11;
}

- (id)_removeUnauthorizedKeysFromContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNContactContentEditViewController missingRequiredKeys](self, "missingRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    -[CNContactContentEditViewController missingRequiredKeys](self, "missingRequiredKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeKeys:", v8);

    objc_msgSend(v7, "setFrozenSelfAsSnapshot");
    v4 = v7;
  }
  return v4;
}

- (void)_didCompleteWithContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[CNContactContentEditViewController _removeUnauthorizedKeysFromContact:](self, "_removeUnauthorizedKeysFromContact:", v4);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (self->_contact != &self->_mutableContact->super)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = objc_msgSend(v16, "copy");

        v16 = (id)v6;
      }
    }
    -[CNContactContentEditViewController suggestedContactAction](self, "suggestedContactAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "confirmSuggestion");

  }
  else
  {
    v16 = 0;
  }
  if (-[CNContactContentEditViewController mode](self, "mode") == 3)
  {
    -[CNContactContentEditViewController originalContacts](self, "originalContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 == 1)
    {
      if (v16)
      {
        +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentEditViewController originalContacts](self, "originalContacts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logContactCreated:originalContact:", v16, v12);

      }
    }
  }
  -[CNContactContentEditViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[CNContactContentEditViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contactEditViewController:didCompleteWithContact:", self, v16);

  }
}

- (void)createdNewContact:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    -[CNContactContentEditViewController setContact:](self, "setContact:", v4);
    -[CNContactContentEditViewController setMode:](self, "setMode:", 1);
    -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsAddingToAddressBook:", 0);

    v4 = v6;
  }
  -[CNContactContentEditViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v4);

}

- (void)updatedExistingContact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[CNContactContentEditViewController contact](self, "contact");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[CNContactContentEditViewController setContact:](self, "setContact:", v5);
  -[CNContactContentEditViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v6);

}

- (void)_setupEditingLinkedContactsForKeys:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CNContactContentEditViewController editingLinkedContacts](self, "editingLinkedContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v13;
  if (!v4)
  {
    -[CNContactContentEditViewController contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isUnified");

    if (v7)
    {
      -[CNContactContentEditViewController contact](self, "contact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mainStoreLinkedContacts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "mutableCopy");
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C99DE8];
      -[CNContactContentEditViewController contact](self, "contact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copyWithPropertyKeys:", v13);
      objc_msgSend(v11, "arrayWithObject:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v10;
    -[CNContactContentEditViewController setEditingLinkedContacts:](self, "setEditingLinkedContacts:", v10);

    v5 = v13;
  }

}

- (void)addLinkedContact:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CNContactContentEditViewController contact](self, "contact");
    v5 = objc_claimAutoreleasedReturnValue();
    if ((id)v5 == v4)
    {

    }
    else
    {
      v6 = (void *)v5;
      -[CNContactContentEditViewController contact](self, "contact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mainStoreLinkedContacts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v4);

      if ((v9 & 1) == 0)
      {
        objc_msgSend(v4, "availableKeyDescriptor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentEditViewController _setupEditingLinkedContactsForKeys:](self, "_setupEditingLinkedContactsForKeys:", v11);

        -[CNContactContentEditViewController editingLinkedContacts](self, "editingLinkedContacts");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v4);

        -[CNContactContentEditViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
        +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logContactActionType:attributes:", CNUIContactActionTypeLink, 0);

      }
    }
  }

}

- (void)removeLinkedContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CNContactContentEditViewController contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mainStoreLinkedContacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    -[CNContactContentEditViewController editingLinkedContacts](self, "editingLinkedContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if ((v7 & 1) != 0 || v9)
    {
      objc_msgSend(v4, "availableKeyDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController _setupEditingLinkedContactsForKeys:](self, "_setupEditingLinkedContactsForKeys:", v11);

      -[CNContactContentEditViewController editingLinkedContacts](self, "editingLinkedContacts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObject:", v4);

      -[CNContactContentEditViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
      +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logContactActionType:attributes:", CNUIContactActionTypeUnlink, 0);

    }
  }

}

- (void)addStaticIdentity:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNContactContentEditViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addIdentity:isNew:", v4, 1);

  -[CNContactContentEditViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
}

- (void)reloadUnifiedContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CNContactContentEditViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();

  -[CNContactContentEditViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "linkedContacts");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    objc_msgSend(v4, "unifyContacts:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController setContact:](self, "setContact:", v7);

    v6 = v8;
  }

}

- (void)cleanupRecentMetadata
{
  -[CNContactContentEditViewController cleanupRecentImageMetadata](self, "cleanupRecentImageMetadata");
  -[CNContactContentEditViewController cleanupRecentPosterMetadata](self, "cleanupRecentPosterMetadata");
}

- (void)cleanupRecentImageMetadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C97238]);
  v4 = (void *)MEMORY[0x1E0C97230];
  -[CNContactContentEditViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveRequestToDeleteImagesForContactIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(v3, "performSaveRequest:error:", v8, &v13);
  v9 = v13;
  if (v9)
  {
    CNUILogContactCard();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[CNContactContentEditViewController contact](self, "contact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_debug_impl(&dword_18AC56000, v10, OS_LOG_TYPE_DEBUG, "Failed to delete recent image metadata for contact: %@", buf, 0xCu);

    }
  }

}

- (void)cleanupRecentPosterMetadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C97278]);
  v4 = (void *)MEMORY[0x1E0C97270];
  -[CNContactContentEditViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveRequestToDeletePostersForContactIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(v3, "performSaveRequest:error:", v8, &v13);
  v9 = v13;
  if (v9)
  {
    CNUILogContactCard();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[CNContactContentEditViewController contact](self, "contact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_debug_impl(&dword_18AC56000, v10, OS_LOG_TYPE_DEBUG, "Failed to delete recent poster metadata for contact: %@", buf, 0xCu);

    }
  }

}

- (double)desiredHeightForWidth:(double)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  -[CNContactContentEditViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");
  -[CNContactContentEditViewController reloadDataIfNeeded](self, "reloadDataIfNeeded");
  -[CNContactContentEditViewController contactView](self, "contactView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "visibleCells");

  -[CNContactContentEditViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

  -[CNContactContentEditViewController requiredSizeForVisibleTableView](self, "requiredSizeForVisibleTableView");
  v10 = v9;
  objc_msgSend(v4, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  objc_msgSend(v4, "setFrame:");

  return v10;
}

- (CGSize)requiredSizeForVisibleTableView
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)updateContactsViewWithBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  ++self->_animating;
  -[CNContactContentEditViewController contactView](self, "contactView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__CNContactContentEditViewController_updateContactsViewWithBlock_completion___block_invoke;
  v13[3] = &unk_1E204FB40;
  v14 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__CNContactContentEditViewController_updateContactsViewWithBlock_completion___block_invoke_2;
  v11[3] = &unk_1E204FB68;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBatchUpdates:completion:", v13, v11);

}

- (void)_setupSuggestionActions
{
  void *v3;
  CNContactSuggestionAction *v4;
  void *v5;
  CNContactSuggestionAction *v6;
  void *v7;
  id v8;

  -[CNContactContentEditViewController originalContacts](self, "originalContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_456);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 1)
  {
    v4 = [CNContactSuggestionAction alloc];
    objc_msgSend(v8, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNContactAction initWithContact:](v4, "initWithContact:", v5);
    -[CNContactContentEditViewController setSuggestedContactAction:](self, "setSuggestedContactAction:", v6);

    -[CNContactContentEditViewController suggestedContactAction](self, "suggestedContactAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

  }
  else
  {
    -[CNContactContentEditViewController setSuggestedContactAction:](self, "setSuggestedContactAction:", 0);
  }

}

- (void)_setupEditingCardActions
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNContactAddStaticIdentityAction *v14;
  void *v15;
  CNContactAddStaticIdentityAction *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  CNContactIgnoreDonatedInformationAction *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  CNContactIgnoreDonatedInformationAction *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  char v41;
  CNContactDeleteContactAction *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  CNContactDeleteContactAction *v48;
  void *v49;
  void *v50;
  void *v51;
  CNContactSelectContainersAction *v52;
  id v53;

  -[CNContactContentEditViewController policy](self, "policy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReadonly");

  if ((v4 & 1) == 0)
  {
    -[CNContactContentEditViewController _setupSuggestionActions](self, "_setupSuggestionActions");
    -[CNContactContentEditViewController actionProvider](self, "actionProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopSharingWithFamilyAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canPerformAction");

    if (v7)
    {
      -[CNContactContentEditViewController cardEditingActionsGroup](self, "cardEditingActionsGroup");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController actionProvider](self, "actionProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stopSharingWithFamilyAction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController actionProvider](self, "actionProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stopSharingWithFamilyAction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:withTitle:", v10, v13);

    }
    v14 = [CNContactAddStaticIdentityAction alloc];
    -[CNContactContentEditViewController contact](self, "contact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CNContactAction initWithContact:](v14, "initWithContact:", v15);
    -[CNContactContentEditViewController setAddStaticIdentityAction:](self, "setAddStaticIdentityAction:", v16);

    -[CNContactContentEditViewController alreadyPickedGroups](self, "alreadyPickedGroups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController policy](self, "policy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = +[CNContactPropertyGroupPickerViewController propertiesLeftToPickWithPickedGroups:policy:prohibitedPropertyKeys:](CNContactPropertyGroupPickerViewController, "propertiesLeftToPickWithPickedGroups:policy:prohibitedPropertyKeys:", v17, v18, v19);

    if ((_DWORD)v16)
    {
      -[CNContactContentEditViewController _addNewFieldAction](self, "_addNewFieldAction");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController setAddNewFieldAction:](self, "setAddNewFieldAction:", v20);

      -[CNContactContentEditViewController cardEditingActionsGroup](self, "cardEditingActionsGroup");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController addNewFieldAction](self, "addNewFieldAction");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CNContactsUIBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("ADD_MORE_PROPERTIES"), &stru_1E20507A8, CFSTR("Localized"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addAction:withTitle:", v22, v24);

    }
    -[CNContactContentEditViewController contact](self, "contact");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isSuggestedMe");

    if (v26)
    {
      v27 = [CNContactIgnoreDonatedInformationAction alloc];
      -[CNContactContentEditViewController mutableContact](self, "mutableContact");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_alloc_init(MEMORY[0x1E0D136E0]);
      -[CNContactContentEditViewController environment](self, "environment");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsFactory");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[CNContactIgnoreDonatedInformationAction initWithContact:donationStore:componentsFactory:](v27, "initWithContact:donationStore:componentsFactory:", v28, v29, v31);
      -[CNContactContentEditViewController setIgnoreContactAction:](self, "setIgnoreContactAction:", v32);

      -[CNContactContentEditViewController ignoreContactAction](self, "ignoreContactAction");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setDelegate:", self);

      -[CNContactContentEditViewController ignoreContactAction](self, "ignoreContactAction");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setDestructive:", 1);

      -[CNContactContentEditViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController ignoreContactAction](self, "ignoreContactAction");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      CNContactsUIBundle();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      v39 = CFSTR("CARD_ACTION_IGNORE_CARD");
    }
    else
    {
      -[CNContactContentEditViewController contact](self, "contact");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v35, "isUnknown") & 1) != 0)
      {
LABEL_12:

LABEL_13:
        if (-[CNContactContentEditViewController shouldAllowContainerPicking](self, "shouldAllowContainerPicking"))
        {
          v52 = objc_alloc_init(CNContactSelectContainersAction);
          -[CNContactContentEditViewController setSelectContainersAction:](self, "setSelectContainersAction:", v52);

          -[CNContactContentEditViewController selectContainersAction](self, "selectContainersAction");
          v53 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setDelegate:", self);

        }
        return;
      }
      -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "editingProposedInformation");

      if ((v41 & 1) != 0)
        goto LABEL_13;
      v42 = [CNContactDeleteContactAction alloc];
      -[CNContactContentEditViewController mutableContact](self, "mutableContact");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController environment](self, "environment");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "recentsManager");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController environment](self, "environment");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "componentsFactory");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = -[CNContactDeleteContactAction initWithContact:recentsManager:componentsFactory:](v42, "initWithContact:recentsManager:componentsFactory:", v43, v45, v47);
      -[CNContactContentEditViewController setDeleteContactAction:](self, "setDeleteContactAction:", v48);

      -[CNContactContentEditViewController deleteContactAction](self, "deleteContactAction");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setDelegate:", self);

      -[CNContactContentEditViewController deleteContactAction](self, "deleteContactAction");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setDestructive:", 1);

      -[CNContactContentEditViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController deleteContactAction](self, "deleteContactAction");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      CNContactsUIBundle();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      v39 = CFSTR("CARD_ACTION_DELETE_CARD");
    }
    objc_msgSend(v37, "localizedStringForKey:value:table:", v39, &stru_1E20507A8, CFSTR("Localized"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addAction:withTitle:", v36, v51);

    goto LABEL_12;
  }
}

- (id)_propertyGroupsForKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[CNContactContentEditViewController propertyGroups](self, "propertyGroups", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_linkedCardsAction
{
  CNPropertyLinkedCardsAction *v3;
  void *v4;
  CNPropertyLinkedCardsAction *v5;

  v3 = [CNPropertyLinkedCardsAction alloc];
  -[CNContactContentEditViewController mutableContact](self, "mutableContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNPropertyLinkedCardsAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactAction setDelegate:](v5, "setDelegate:", self);
  -[CNPropertyLinkedCardsAction setContactDelegate:](v5, "setContactDelegate:", self);
  return v5;
}

- (id)_addLinkedCardAction
{
  CNContactAddLinkedCardAction *v3;
  void *v4;
  CNContactAddLinkedCardAction *v5;

  v3 = [CNContactAddLinkedCardAction alloc];
  -[CNContactContentEditViewController mutableContact](self, "mutableContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactAction setDelegate:](v5, "setDelegate:", self);
  return v5;
}

- (id)_selectContainersAction
{
  CNContactSelectContainersAction *v3;

  v3 = objc_alloc_init(CNContactSelectContainersAction);
  -[CNContactAction setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (id)_addNewFieldAction
{
  CNContactAddNewFieldAction *v3;
  void *v4;
  CNContactAddNewFieldAction *v5;
  void *v6;

  v3 = [CNContactAddNewFieldAction alloc];
  -[CNContactContentEditViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactContentEditViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAddNewFieldAction setProhibitedPropertyKeys:](v5, "setProhibitedPropertyKeys:", v6);

  -[CNContactAction setDelegate:](v5, "setDelegate:", self);
  -[CNContactAddNewFieldAction setGroupPickerDelegate:](v5, "setGroupPickerDelegate:", self);
  return v5;
}

- (Class)groupClassForProperty:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96680]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96888]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96800]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A0]) & 1) == 0)
  {
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96668]);
  }
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (BOOL)shouldShowGemini
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[CNContactContentEditViewController geminiDataSource](self, "geminiDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "geminiResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !-[CNContactContentEditViewController showingMeContact](self, "showingMeContact"))
  {
    -[CNContactContentEditViewController contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isSuggested") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[CNContactContentEditViewController contact](self, "contact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = +[CNContactContentEditViewController shouldShowGeminiForResult:contact:](CNContactContentEditViewController, "shouldShowGeminiForResult:contact:", v4, v7);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_loadPropertyGroups
{
  CNPropertyGroupsDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNPropertyGroupsDataSource *v9;
  CNPropertyGroupsDataSource *propertyGroupsDataSource;
  void *v11;
  void *v12;
  void *v13;

  v3 = [CNPropertyGroupsDataSource alloc];
  -[CNContactContentEditViewController mutableContact](self, "mutableContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController policy](self, "policy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController linkedPoliciesByContactIdentifier](self, "linkedPoliciesByContactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNPropertyGroupsDataSource initWithMutableContact:contactStore:policy:linkedPolicies:prohibitedKeys:](v3, "initWithMutableContact:contactStore:policy:linkedPolicies:prohibitedKeys:", v4, v5, v6, v7, v8);
  propertyGroupsDataSource = self->_propertyGroupsDataSource;
  self->_propertyGroupsDataSource = v9;

  -[CNContactContentEditViewController propertyGroupsDataSource](self, "propertyGroupsDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "buildPropertyGroups");

  -[CNContactContentEditViewController propertyGroupsDataSource](self, "propertyGroupsDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "propertyGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_reloadPropertyGroupsPreservingChanges:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNContactContentEditViewController propertyGroups](self, "propertyGroups", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "reloadDataPreservingChanges:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_addGroup:(id)a3 afterGroup:(id)a4 forTableView:(id)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v6 = a6;
  v18 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    -[CNContactContentEditViewController addCardGroup:afterGroup:](self, "addCardGroup:afterGroup:", v18, v10);
    -[CNContactContentEditViewController editingGroups](self, "editingGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "indexOfObject:", v10);
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = v13 + 1;
      goto LABEL_6;
    }
  }
  else
  {
    -[CNContactContentEditViewController editingGroups](self, "editingGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = 0;
LABEL_6:
  objc_msgSend(v11, "beginUpdates");
  objc_msgSend(v12, "insertObject:atIndex:", v18, v14);
  v15 = -[CNContactContentEditViewController tableViewSectionIndexFromGroupIndex:forTableView:](self, "tableViewSectionIndexFromGroupIndex:forTableView:", v14, v11);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v17 = 6;
  else
    v17 = 5;
  objc_msgSend(v11, "insertSections:withRowAnimation:", v16, v17);

  objc_msgSend(v11, "endUpdates");
}

- (void)_addMedicalIDGroupAnimated:(BOOL)a3 forTableView:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];

  v4 = a3;
  v6 = a4;
  -[CNContactContentEditViewController editingGroups](self, "editingGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__CNContactContentEditViewController__addMedicalIDGroupAnimated_forTableView___block_invoke;
  aBlock[3] = &unk_1E204FE98;
  aBlock[4] = self;
  v8 = _Block_copy(aBlock);
  v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", v8);
  if (v9)
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v7, "lastObject");
    else
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[CNContactContentEditViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController _addGroup:afterGroup:forTableView:animated:](self, "_addGroup:afterGroup:forTableView:animated:", v11, v10, v6, v4);

}

- (void)_reloadMedicalIDGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  -[CNContactContentEditViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthStoreManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentEditViewController medicalIDLookupToken](self, "medicalIDLookupToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[CNContactContentEditViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", 0);
  -[CNContactContentEditViewController setMedicalIDRegistrationToken:](self, "setMedicalIDRegistrationToken:", 0);
  -[CNContactContentEditViewController setCardMedicalIDGroup:](self, "setCardMedicalIDGroup:", 0);
  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "allowsActions") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsCardActions");

  if (!v8)
  {
LABEL_5:
    -[CNContactContentEditViewController setCardMedicalIDGroup:](self, "setCardMedicalIDGroup:", 0);
    -[CNContactContentEditViewController setMedicalIDAction:](self, "setMedicalIDAction:", 0);
    -[CNContactContentEditViewController setEmergencyContactAction:](self, "setEmergencyContactAction:", 0);
    -[CNContactContentEditViewController setEmergencyNumberIdentifier:](self, "setEmergencyNumberIdentifier:", 0);
    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke;
  v22[3] = &unk_1E204FEE8;
  objc_copyWeak(&v24, &location);
  v10 = v4;
  v23 = v10;
  objc_msgSend(v10, "registerMedicalIDDataHandler:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController setMedicalIDRegistrationToken:](self, "setMedicalIDRegistrationToken:", v11);
  v12 = (void *)MEMORY[0x1E0D139B8];
  v15 = v9;
  v16 = 3221225472;
  v17 = __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke_4;
  v18 = &unk_1E204FF10;
  objc_copyWeak(&v21, &location);
  v19 = v10;
  v13 = v11;
  v20 = v13;
  objc_msgSend(v12, "tokenWithCancelationBlock:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", v14, v15, v16, v17, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_6:

}

- (void)_reloadContainerContextPreservingChanges:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNContactContentEditViewController containerContext](self, "containerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !a3)
  {
    -[CNContactContentEditViewController containerContext](self, "containerContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetToInitialState");

    -[CNContactContentEditViewController parentContainer](self, "parentContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CNContactContentEditViewController containerContext](self, "containerContext");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController parentContainer](self, "parentContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addContainer:", v8);

    }
  }
}

- (BOOL)shouldReallyShowLinkedContacts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldShowLinkedContacts"))
  {
    -[CNContactContentEditViewController contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainStoreLinkedContacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      -[CNContactContentEditViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        -[CNContactContentEditViewController contact](self, "contact");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v8, "isSuggestedMe") ^ 1;

      }
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_reloadLinkedCardsGroup
{
  CNPropertyLinkedCardsAction *v3;
  CNPropertyLinkedCardsAction *linkedCardsAction;
  CNContactAddLinkedCardAction *addLinkedCardAction;
  CNContactAddLinkedCardAction *v6;
  CNContactAddLinkedCardAction *v7;
  CNCardLinkedCardsGroup *v8;
  void *v9;
  CNCardLinkedCardsGroup *v10;
  void *v11;
  NSMutableArray *editingLinkedContacts;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_linkedCardsAction)
  {
    -[CNContactContentEditViewController _linkedCardsAction](self, "_linkedCardsAction");
    v3 = (CNPropertyLinkedCardsAction *)objc_claimAutoreleasedReturnValue();
    linkedCardsAction = self->_linkedCardsAction;
    self->_linkedCardsAction = v3;

  }
  addLinkedCardAction = self->_addLinkedCardAction;
  if (!addLinkedCardAction)
  {
    -[CNContactContentEditViewController _addLinkedCardAction](self, "_addLinkedCardAction");
    v6 = (CNContactAddLinkedCardAction *)objc_claimAutoreleasedReturnValue();
    v7 = self->_addLinkedCardAction;
    self->_addLinkedCardAction = v6;

    addLinkedCardAction = self->_addLinkedCardAction;
  }
  -[CNContactAddLinkedCardAction setEditingLinkedContacts:](addLinkedCardAction, "setEditingLinkedContacts:", self->_editingLinkedContacts);
  v8 = [CNCardLinkedCardsGroup alloc];
  -[CNContactContentEditViewController mutableContact](self, "mutableContact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNCardGroup initWithContact:](v8, "initWithContact:", v9);
  -[CNContactContentEditViewController setCardLinkedCardsGroup:](self, "setCardLinkedCardsGroup:", v10);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  editingLinkedContacts = self->_editingLinkedContacts;
  if (editingLinkedContacts)
  {
    v13 = editingLinkedContacts;
  }
  else
  {
    -[CNContactContentEditViewController contact](self, "contact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mainStoreLinkedContacts");
    v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  }
  -[CNContactContentEditViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v13;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v20++), (_QWORD)v22);
        }
        while (v18 != v20);
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v18);
    }

  }
  -[CNContactContentEditViewController cardLinkedCardsGroup](self, "cardLinkedCardsGroup", (_QWORD)v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLinkedContacts:", v11);

}

- (void)_reloadStaticIdentityGroup
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  CNCardStaticIdentityGroup *v7;
  CNCardStaticIdentityGroup *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 11);

  if (v5 && -[CNContactContentEditViewController isEditing](self, "isEditing"))
  {
    -[CNContactContentEditViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = [CNCardStaticIdentityGroup alloc];
      -[CNContactContentEditViewController mutableContact](self, "mutableContact");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v8 = -[CNCardStaticIdentityGroup initWithContact:](v7, "initWithContact:", v9);
      -[CNContactContentEditViewController setCardStaticIdentityGroup:](self, "setCardStaticIdentityGroup:", v8);

    }
  }
}

- (id)_addGroupsInArray:(id)a3 afterGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CNContactContentEditViewController groupsAfterGroup](self, "groupsAfterGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++), (_QWORD)v17);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v10, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_reloadGeminiGroupPreservingChanges:(BOOL)a3
{
  void *v4;
  id v5;

  if (!a3)
  {
    -[CNContactContentEditViewController setCardEditingGeminiGroup:](self, "setCardEditingGeminiGroup:", 0);
    -[CNContactContentEditViewController geminiDataSource](self, "geminiDataSource");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetDataSource");
    -[CNContactContentEditViewController contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContact:", v4);

  }
}

- (void)createCardEditingGeminiGroupIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CNContactContentEditViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNContactContentEditViewController propertyGroups](self, "propertyGroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C96800]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController setCardEditingGeminiGroup:](self, "setCardEditingGeminiGroup:", v5);

    -[CNContactContentEditViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[CNContactContentEditViewController geminiDataSource](self, "geminiDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "geminiResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setGeminiResult:", v9);

    objc_msgSend(v10, "setDelegate:", self);
  }
}

- (void)createCardEditingContactContainerGroupIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  CNCardContactContainerGroup *v6;
  void *v7;
  CNCardContactContainerGroup *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 6);

  if (v5)
  {
    if (-[CNContactContentEditViewController shouldAllowContainerPicking](self, "shouldAllowContainerPicking"))
    {
      v6 = [CNCardContactContainerGroup alloc];
      -[CNContactContentEditViewController mutableContact](self, "mutableContact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CNCardGroup initWithContact:](v6, "initWithContact:", v7);
      -[CNContactContentEditViewController setCardEditingContactContainerGroup:](self, "setCardEditingContactContainerGroup:", v8);

      -[CNContactContentEditViewController containerContext](self, "containerContext");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectedContainers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController cardEditingContactContainerGroup](self, "cardEditingContactContainerGroup");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setContainers:", v9);

    }
    else
    {
      -[CNContactContentEditViewController setCardEditingContactContainerGroup:](self, "setCardEditingContactContainerGroup:", 0);
    }
  }
}

- (id)_loadEditingGroupsPreservingChanges:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    -[CNContactContentEditViewController _loadNameEditingGroups](self, "_loadNameEditingGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController setNameEditingGroups:](self, "setNameEditingGroups:", v6);

  }
  -[CNContactContentEditViewController nameEditingGroups](self, "nameEditingGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v8 = -[CNContactContentEditViewController shouldShowGemini](self, "shouldShowGemini");
  -[CNContactContentEditViewController createCardEditingGeminiGroupIfNeeded](self, "createCardEditingGeminiGroupIfNeeded");
  -[CNContactContentEditViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldShowGemini:", v8);

  if (-[CNContactContentEditViewController shouldShowGemini](self, "shouldShowGemini"))
  {
    -[CNContactContentEditViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_cn_addNonNilObject:", v10);

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  +[CNContactView allCardProperties](CNContactView, "allCardProperties", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v15);
        -[CNContactContentEditViewController propertyGroups](self, "propertyGroups");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          objc_msgSend(v5, "addObject:", v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v13);
  }

  -[CNContactContentEditViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_addNonNilObject:", v19);

  -[CNContactContentEditViewController cardEditingActionsGroup](self, "cardEditingActionsGroup");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    -[CNContactContentEditViewController cardEditingActionsGroup](self, "cardEditingActionsGroup");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v23);

  }
  -[CNContactContentEditViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "actionItems");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    -[CNContactContentEditViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_cn_addNonNilObject:", v27);

  }
  -[CNContactContentEditViewController createCardEditingContactContainerGroupIfNeeded](self, "createCardEditingContactContainerGroupIfNeeded");
  -[CNContactContentEditViewController cardEditingContactContainerGroup](self, "cardEditingContactContainerGroup");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_addNonNilObject:", v28);

  -[CNContactContentEditViewController cardLinkedCardsGroup](self, "cardLinkedCardsGroup");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_addNonNilObject:", v29);

  -[CNContactContentEditViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "actions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    -[CNContactContentEditViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v33);

  }
  return v5;
}

- (id)_loadNameEditingGroups
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[CNContactContentEditViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactView namePropertiesForContact:](CNContactView, "namePropertiesForContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v39;
    v30 = *(_QWORD *)v39;
    do
    {
      v8 = 0;
      v32 = v6;
      do
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v8);
        -[CNContactContentEditViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys", v30);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v9);

        if ((v11 & 1) == 0)
        {
          -[CNContactContentEditViewController contact](self, "contact");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "valueForKey:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          v14 = v13;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;
          v16 = v15;

          if (v14 && (!v16 || objc_msgSend(v16, "length"))
            || (+[CNContactView requiredNameProperties](CNContactView, "requiredNameProperties"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v17, "containsObject:", v9),
                v17,
                v18))
          {
            -[CNContactContentEditViewController mutableContact](self, "mutableContact");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactContentEditViewController contactStore](self, "contactStore");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactContentEditViewController policy](self, "policy");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactContentEditViewController linkedPoliciesByContactIdentifier](self, "linkedPoliciesByContactIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[CNCardPropertyGroup groupForProperty:contact:store:policy:linkedPolicies:](CNCardPropertyNameGroup, "groupForProperty:contact:store:policy:linkedPolicies:", v9, v19, v20, v21, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "setAddSpacerFromPreviousGroup:", 0);
            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            objc_msgSend(v23, "propertyItems");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v35;
              do
              {
                v28 = 0;
                do
                {
                  if (*(_QWORD *)v35 != v27)
                    objc_enumerationMutation(v24);
                  objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v28++), "setDelegate:", self);
                }
                while (v26 != v28);
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              }
              while (v26);
            }

            objc_msgSend(v31, "addObject:", v23);
            v7 = v30;
            v6 = v32;
          }

        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v6);
  }

  return v31;
}

- (BOOL)_modelHasChanges
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  BOOL v22;
  char v23;
  char v24;
  void *v25;
  char v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CNContactContentEditViewController editingGroups](self, "editingGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "modified", (_QWORD)v28) & 1) != 0)
        {
          v12 = 1;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  if (self->_contactHeaderView)
  {
    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 |= objc_msgSend(v13, "photoIsModified");

  }
  -[CNContactContentEditViewController editingLinkedContacts](self, "editingLinkedContacts", (_QWORD)v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentEditViewController containerContext](self, "containerContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addedContainers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  v18 = -[CNContactContentEditViewController mode](self, "mode");
  v19 = -[CNContactContentEditViewController mode](self, "mode") == 4
     || -[CNContactContentEditViewController mode](self, "mode") == 5;
  -[CNContactContentEditViewController contact](self, "contact");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "hasNonPersistedData"))
  {
    -[CNContactContentEditViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == 0;

  }
  else
  {
    v22 = 0;
  }
  if (v14)
    v23 = 1;
  else
    v23 = v12;
  if (v17)
    v23 = 1;
  if (v18 == 3)
    v24 = 1;
  else
    v24 = v23;

  -[CNContactContentEditViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "didChange");

  return (v19 || v22) | v26 | v24;
}

- (BOOL)_modelIsEmpty
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  char v22;
  char v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  -[CNContactContentEditViewController editingGroups](self, "editingGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    v25 = 1;
    do
    {
      v8 = 0;
      v26 = v6;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "editingItems");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v13)
          {
            v14 = v13;
            v15 = v7;
            v16 = *(_QWORD *)v29;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v29 != v16)
                  objc_enumerationMutation(v12);
                v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v18, "normalizedValue");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v19)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v19, "length"))
                    {

                      v25 = 0;
                      goto LABEL_21;
                    }
                  }

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              if (v14)
                continue;
              break;
            }
LABEL_21:
            v7 = v15;
            v6 = v26;
          }

        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v6);
  }
  else
  {
    v25 = 1;
  }

  if (self->_contactHeaderView)
  {
    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasPhoto");

    v22 = (v21 ^ 1) & v25;
  }
  else
  {
    v22 = v25;
  }

  return v22 & 1;
}

- (void)_validateGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CNContactContentEditViewController *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "propertyItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v19 = self;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "labeledValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "isValidValue:", v13);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v11, "labeledValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "replacementForInvalidValue:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "updateLabeledValueWithValue:", v17);

          v8 = 1;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
    if ((v8 & 1) != 0)
    {
      -[CNContactContentEditViewController contactView](v19, "contactView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController reloadCardGroup:forTableView:](v19, "reloadCardGroup:forTableView:", v4, v18);

    }
  }

}

- (void)_saveChangesForGroups:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9 = (void *)objc_opt_class();
        if (objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()))
          objc_msgSend(v8, "saveChanges");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)_cardGroupAtTableViewSectionIndex:(int64_t)a3 forTableView:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = -[CNContactContentEditViewController groupIndexFromTableViewSectionIndex:forTableView:](self, "groupIndexFromTableViewSectionIndex:forTableView:", a3, v6);
  -[CNContactContentEditViewController _currentGroupsForTableView:](self, "_currentGroupsForTableView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") <= v7)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_itemAtIndexPath:(id)a3 forTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v6, "section"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentEditViewController isStandardGroup:](self, "isStandardGroup:", v8))
  {
    objc_msgSend(v8, "editingItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[CNContactContentEditViewController _indexPathIsActionItem:forTableView:](self, "_indexPathIsActionItem:forTableView:", v6, v7))
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v8, "actionItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (BOOL)_indexPathIsActionItem:(id)a3 forTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;

  v6 = a3;
  v7 = a4;
  -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v6, "section"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentEditViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      isKindOfClass = 0;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass() ^ 1;
    }
  }

  return isKindOfClass & 1;
}

- (void)_addedGroupWithName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  CNContactContentEditViewController *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CNContactView nameProperties](CNContactView, "nameProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[CNContactContentEditViewController mutableContact](self, "mutableContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contactStore](self, "contactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController policy](self, "policy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController linkedPoliciesByContactIdentifier](self, "linkedPoliciesByContactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNCardPropertyGroup groupForProperty:contact:store:policy:linkedPolicies:](CNCardPropertyNameGroup, "groupForProperty:contact:store:policy:linkedPolicies:", v4, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[CNContactView nameProperties](CNContactView, "nameProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v11;
    objc_msgSend(v11, "property");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "indexOfObject:", v13);

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = self;
    -[CNContactContentEditViewController editingGroups](self, "editingGroups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    v43 = v4;
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v45;
      while (2)
      {
        v20 = 0;
        v40 = v18 + v17;
        do
        {
          if (*(_QWORD *)v45 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v20);
          +[CNContactView nameProperties](CNContactView, "nameProperties", v40);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "property");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "indexOfObject:", v23);

          if (v24 >= v14)
          {
            v25 = v18 + v20;
            goto LABEL_13;
          }
          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        v25 = v40;
        v18 = v40;
        if (v17)
          continue;
        break;
      }
    }
    else
    {
      v25 = 0;
    }
LABEL_13:

    -[CNContactContentEditViewController nameEditingGroups](v42, "nameEditingGroups");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopy");

    objc_msgSend(v27, "insertObject:atIndex:", v41, v25);
    v28 = (void *)objc_msgSend(v27, "copy");
    -[CNContactContentEditViewController setNameEditingGroups:](v42, "setNameEditingGroups:", v28);

    -[CNContactContentEditViewController editingGroups](v42, "editingGroups");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "mutableCopy");

    objc_msgSend(v30, "insertObject:atIndex:", v41, v25);
    v31 = (void *)objc_msgSend(v30, "copy");
    -[CNContactContentEditViewController setEditingGroups:](v42, "setEditingGroups:", v31);

    -[CNContactContentEditViewController contactView](v42, "contactView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "reloadData");

    -[CNContactContentEditViewController contactView](v42, "contactView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[CNContactContentEditViewController sectionOfGroup:inTableView:](v42, "sectionOfGroup:inTableView:", v41, v33);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contactView](v42, "contactView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "cellForRowAtIndexPath:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "firstResponderItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "becomeFirstResponder");

    -[CNContactContentEditViewController contactView](v42, "contactView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "scrollToRowAtIndexPath:atScrollPosition:animated:", v35, 2, 0);

    v4 = v43;
  }

}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNContactContentEditViewController;
  -[CNContactContentEditViewController encodeRestorableStateWithCoder:](&v19, sel_encodeRestorableStateWithCoder_, v4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  +[CNContactContentEditViewController BOOLStateRestorationProperties](CNContactContentEditViewController, "BOOLStateRestorationProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[CNContactContentEditViewController contactViewConfiguration](self, "contactViewConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "valueForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v4, "encodeObject:forKey:", v12, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v7);
  }

  -[CNContactContentEditViewController contact](self, "contact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("Identifier"));

}

- (void)_updateUserActivity
{
  NSObject *v3;
  void *v4;
  CNContactContentEditViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  CNContactContentEditViewController *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (CNUIIsContacts() || CNUIIsMobilePhone())
  {
    CNUILogContactCard();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v5 = (CNContactContentEditViewController *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_INFO, "Activity continuity - running in %@", (uint8_t *)&v17, 0xCu);

    }
    -[CNContactContentEditViewController activityManager](self, "activityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "makeActivityAdvertisingViewingOfContact:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentEditViewController userActivity](self, "userActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {

      if (!v10)
      {
        -[CNContactContentEditViewController setUserActivity:](self, "setUserActivity:", v8);
        -[CNContactContentEditViewController userActivity](self, "userActivity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "becomeCurrent");

        CNUILogContactCard();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          -[CNContactContentEditViewController userActivity](self, "userActivity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412546;
          v18 = self;
          v19 = 2112;
          v20 = v13;
          _os_log_impl(&dword_18AC56000, v12, OS_LOG_TYPE_INFO, "Activity continuity -  %@ created %@", (uint8_t *)&v17, 0x16u);

        }
      }
      -[CNContactContentEditViewController userActivity](self, "userActivity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNeedsSave:", 1);

    }
    else
    {
      objc_msgSend(v9, "resignCurrent");

      CNUILogContactCard();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[CNContactContentEditViewController userActivity](self, "userActivity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = self;
        v19 = 2112;
        v20 = v16;
        _os_log_impl(&dword_18AC56000, v15, OS_LOG_TYPE_INFO, "Activity continuity -  %@ removed %@", (uint8_t *)&v17, 0x16u);

      }
      -[CNContactContentEditViewController setUserActivity:](self, "setUserActivity:", 0);
    }

  }
}

- (void)updateUserActivityState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactContentEditViewController activityManager](self, "activityManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateUserActivityState:withContentsOfContact:", v4, v5);

}

- (void)setSaveKeyboardShortcutEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[CNContactContentEditViewController saveCommand](self, "saveCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("s"), 0x100000, sel_toggleEditing_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController setSaveCommand:](self, "setSaveCommand:", v6);

      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SAVE_CONTACT_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController saveCommand](self, "saveCommand");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDiscoverabilityTitle:", v8);

      -[CNContactContentEditViewController saveCommand](self, "saveCommand");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController addKeyCommand:](self, "addKeyCommand:", v11);

    }
  }
  else if (v5)
  {
    -[CNContactContentEditViewController saveCommand](self, "saveCommand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController removeKeyCommand:](self, "removeKeyCommand:", v10);

    -[CNContactContentEditViewController setSaveCommand:](self, "setSaveCommand:", 0);
  }
}

- (void)setCancelKeyboardShortcutEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[CNContactContentEditViewController cancelCommand](self, "cancelCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_editCancel_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController setCancelCommand:](self, "setCancelCommand:", v6);

      -[CNContactContentEditViewController cancelCommand](self, "cancelCommand");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentEditViewController addKeyCommand:](self, "addKeyCommand:", v8);

    }
  }
  else if (v5)
  {
    -[CNContactContentEditViewController cancelCommand](self, "cancelCommand");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController removeKeyCommand:](self, "removeKeyCommand:", v7);

    -[CNContactContentEditViewController setCancelCommand:](self, "setCancelCommand:", 0);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  if (-[CNContactContentEditViewController isScrollViewControllingHeaderResizeAnimation:](self, "isScrollViewControllingHeaderResizeAnimation:"))
  {
    objc_msgSend(v5, "_verticalVelocity");
    -[CNContactContentEditViewController updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:](self, "updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:", v5, v4 >= 0.0, 1);
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  y = a4.y;
  v25 = a3;
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minHeight");
  v10 = v9;

  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "maxHeight");
  v13 = v12;

  if (-[CNContactContentEditViewController isScrollViewControllingHeaderResizeAnimation:](self, "isScrollViewControllingHeaderResizeAnimation:", v25))
  {
    v14 = v13 - a5->y;
    objc_msgSend(v25, "contentInset");
    v16 = v14 - v15;
    objc_msgSend(v25, "_systemContentInset");
    v18 = v16 - v17;
    if (y <= 0.0)
    {
      v19 = v25;
      if (y >= 0.0)
      {
        if (v18 > v10 && v18 < v13)
        {
          if (v18 - v10 >= (v13 - v10) * 0.5)
            v18 = v13;
          else
            v18 = v10;
        }
      }
      else if (v18 < v13)
      {
        v18 = v13;
      }
    }
    else
    {
      v19 = v25;
      if (v18 > v10)
        v18 = v10;
    }
    v21 = v13 - v18;
    objc_msgSend(v19, "contentInset");
    v23 = v21 - v22;
    objc_msgSend(v25, "_systemContentInset");
    a5->y = v23 - v24;
  }

}

- (void)presentViewController:(id)a3 sourceView:(id)a4
{
  -[CNContactContentEditViewController sender:presentViewController:](self, "sender:presentViewController:", a4, a3);
}

- (double)globalHeaderHeightForContentOffset:(double)a3 contentInset:(UIEdgeInsets)a4
{
  double top;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  top = a4.top;
  -[CNContactContentEditViewController contactView](self, "contactView", a3, a4.top, a4.left, a4.bottom, a4.right);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_systemContentInset");
  v9 = top + v8;

  if (-v9 <= a3)
    v10 = -a3;
  else
    v10 = v9;
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minHeight");
  v13 = v12;

  if (v10 >= v13)
    return v10;
  else
    return v13;
}

- (double)contentOffsetYForGlobalHeaderHeight:(double)a3 contentInset:(UIEdgeInsets)a4
{
  return -a3;
}

- (void)updateHeaderHeightToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  id v19;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "contentOffset");
  v10 = v9;
  objc_msgSend(v8, "contentInset");
  -[CNContactContentEditViewController globalHeaderHeightForContentOffset:contentInset:](self, "globalHeaderHeightForContentOffset:contentInset:", v10, v11, v12, v13, v14);
  -[CNContactContentEditViewController updateHeaderConstraintForGlobalHeaderHeight:direction:animated:](self, "updateHeaderConstraintForGlobalHeaderHeight:direction:animated:", a4, v5);
  v16 = v15;
  objc_opt_class();
  v19 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v19;
  else
    v17 = 0;
  v18 = v17;

  objc_msgSend(v18, "setMaskingInset:", v16);
}

- (double)updateHeaderConstraintForGlobalHeaderHeight:(double)a3 direction:(int64_t)a4 animated:(BOOL)a5
{
  void *v8;
  double v9;
  double v10;
  void *v11;

  -[CNContactContentEditViewController headerHeightConstraint](self, "headerHeightConstraint", a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constant");
  v10 = v9;

  if (v10 != a3 && (a4 || v10 < a3))
  {
    -[CNContactContentEditViewController headerHeightConstraint](self, "headerHeightConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstant:", a3);

    return a3;
  }
  return v10;
}

- (BOOL)isScrollViewControllingHeaderResizeAnimation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactContentEditViewController contactView](self, "contactView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)scrollScrollViewAllTheWayUp:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "contentOffset");
  v4 = v3;
  objc_msgSend(v8, "contentInset");
  v6 = v5;
  objc_msgSend(v8, "_systemContentInset");
  objc_msgSend(v8, "setContentOffset:", v4, -(v6 + v7));

}

- (void)updateInsetsIfNeededForTableView:(id)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  _BOOL8 v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;

  v40 = a3;
  -[CNContactContentEditViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  if (v4 <= 0.0
    || (-[CNContactContentEditViewController view](self, "view"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "bounds"),
        v7 = v6,
        v5,
        v7 <= 0.0))
  {
    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "maxHeight");
    v18 = v14;
    v17 = 0;
  }
  else
  {
    -[CNContactContentEditViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    -[CNContactContentEditViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
    v12 = v10 - v11 + -64.0;

    v13 = fmax(v12, 0.0);
    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "maxHeight");
    v17 = v13 <= v16;
    v18 = v14;
    v19 = v13;
  }
  objc_msgSend(v18, "setConstrainedMaxHeight:enabled:", v17, v19);

  objc_msgSend(v40, "contentInset");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[CNContactContentEditViewController insetsForContactTableView:](self, "insetsForContactTableView:", v40);
  v32 = v28;
  v33 = v29;
  v34 = v30;
  v35 = v31;
  if (v29 != v23 || v28 != v21 || v31 != v27 || v30 != v25)
  {
    -[CNContactContentEditViewController scrollIndicatorInsetsForContactTableView:withContentInsets:](self, "scrollIndicatorInsetsForContactTableView:withContentInsets:", v40, v28, v29, v30, v31);
    -[CNContactContentEditViewController updateTableView:contentInsetsTo:withScrollIndicatorInsets:](self, "updateTableView:contentInsetsTo:withScrollIndicatorInsets:", v40, v32, v33, v34, v35, v36, v37, v38, v39);
  }

}

- (void)initializeTableViewsForHeaderHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  -[CNContactContentEditViewController contactView](self, "contactView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calculateLabelSizesIfNeeded");

  -[CNContactContentEditViewController headerHeightConstraint](self, "headerHeightConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constant");
  v6 = v5;
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minHeight");
  if (v6 > v8)
    v9 = 0.0;
  else
    v9 = 1.0;
  -[CNContactContentEditViewController headerDropShadowView](self, "headerDropShadowView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v9);

  -[CNContactContentEditViewController updateInsetsIfNeededForTableView:](self, "updateInsetsIfNeededForTableView:", v11);
  -[CNContactContentEditViewController updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:](self, "updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:", v11, 2, 0);

}

- (UIEdgeInsets)insetsForContactTableView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  UIEdgeInsets result;

  v4 = a3;
  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minHeight");
  v7 = v6;

  -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maxHeight");
  v10 = v9;

  if (v10 == 0.0)
  {
    v12 = *MEMORY[0x1E0DC49E8];
    v25 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v49 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v27 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    goto LABEL_18;
  }
  objc_msgSend(v4, "_systemContentInset");
  v12 = v10 - v11;
  objc_msgSend(v4, "bounds");
  v14 = v10 - v7 + v13;
  objc_msgSend(v4, "_systemContentInset");
  v16 = v14 - v15 - v12;
  objc_msgSend(v4, "_systemContentInset");
  v18 = v17;
  -[CNContactContentEditViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  if (v18 >= v19)
    v19 = v18;
  v20 = v16 - v19;
  objc_msgSend(v4, "contentSize");
  v22 = 0.0;
  if (v20 - v21 >= 0.0)
    v23 = v20 - v21;
  else
    v23 = 0.0;
  objc_msgSend(v4, "contentInset");
  v25 = v24;
  v27 = v26;
  -[CNContactContentEditViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  if (v28 > 0.0)
  {
    -[CNContactContentEditViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "window");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = (void *)v30;
      -[CNContactContentEditViewController view](self, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "window");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bounds");
      v35 = v34;
      objc_msgSend(v4, "bounds");
      v37 = v36;

      if (v35 <= v37)
      {
LABEL_12:
        -[CNContactContentEditViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
        v46 = v45;
        objc_msgSend(v4, "_systemContentInset");
        v48 = v22 + v46 - v47;
        goto LABEL_15;
      }
      -[CNContactContentEditViewController view](self, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "window");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "bounds");
      v41 = v40;
      objc_msgSend(v4, "bounds");
      v43 = v41 - v42;

      -[CNContactContentEditViewController contactHeaderView](self, "contactHeaderView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "minTitleOffset");
      v22 = v43 - v44;
    }

    goto LABEL_12;
  }
  objc_msgSend(v4, "_systemContentInset");
  v48 = -v50;
LABEL_15:
  if (v23 >= v48)
    v49 = v23;
  else
    v49 = v48;
LABEL_18:

  v51 = v12;
  v52 = v25;
  v53 = v49;
  v54 = v27;
  result.right = v54;
  result.bottom = v53;
  result.left = v52;
  result.top = v51;
  return result;
}

- (UIEdgeInsets)scrollIndicatorInsetsForContactTableView:(id)a3 withContentInsets:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat left;
  double top;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  right = a4.right;
  left = a4.left;
  top = a4.top;
  v8 = a3;
  objc_msgSend(v8, "_systemContentInset");
  v10 = top + v9;
  -[CNContactContentEditViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  v12 = v11;
  objc_msgSend(v8, "_systemContentInset");
  v14 = v13;

  v15 = fmax(v12 - v14, 0.0);
  v16 = v10;
  v17 = left;
  v18 = right;
  result.right = v18;
  result.bottom = v15;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)updateTableView:(id)a3 contentInsetsTo:(UIEdgeInsets)a4 withScrollIndicatorInsets:(UIEdgeInsets)a5
{
  double left;
  double top;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double bottom;
  double right;
  id v19;

  bottom = a5.bottom;
  right = a5.right;
  left = a5.left;
  top = a5.top;
  v7 = a4.right;
  v8 = a4.bottom;
  v9 = a4.left;
  v10 = a4.top;
  v19 = a3;
  objc_msgSend(v19, "contentInset");
  v12 = v10 - v11;
  objc_msgSend(v19, "contentOffset");
  v14 = v13;
  v16 = v15 - v12;
  objc_msgSend(v19, "setContentInset:", v10, v9, v8, v7);
  objc_msgSend(v19, "setScrollIndicatorInsets:", top, left, bottom, right);
  objc_msgSend(v19, "setContentOffset:", v14, v16);

}

- (id)applyContactStyle
{
  void *v3;
  uint64_t v4;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  CNContactHeaderEditView *contactHeaderView;
  void *v28;
  void *v29;
  uint64_t v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentEditViewController forcesTransparentBackground](self, "forcesTransparentBackground"))
  {
    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_6;
    objc_msgSend(v3, "backgroundColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
  -[CNContactContentEditViewController contactView](self, "contactView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

LABEL_6:
  objc_msgSend(v3, "sectionBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSectionBackgroundColor:", v8);

  objc_msgSend(v3, "separatorColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSeparatorColor:", v10);

  objc_msgSend(v3, "selectedCellBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentEditViewController contactView](self, "contactView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelectedCellBackgroundColor:", v12);

  v14 = (void *)MEMORY[0x1E0C99E08];
  -[CNContactContentEditViewController contactView](self, "contactView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueTextAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x1E0DC1140];
  v33[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(v3, "textColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = CFSTR("ABNotesTextColorAttributeName");
  v34[0] = v19;
  objc_msgSend(v3, "notesTextColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v21);

  -[CNContactContentEditViewController contactView](self, "contactView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValueTextAttributes:", v17);

  if (-[CNContactContentEditViewController forcesTransparentBackground](self, "forcesTransparentBackground"))
  {
    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNContactContentEditViewController environment](self, "environment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "runningInContactsAppOniPad");

    if (v25)
      +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
    else
      objc_msgSend(v3, "contactHeaderBackgroundColor");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v23;
  -[CNContactHeaderEditView setBackgroundColor:](self->_contactHeaderView, "setBackgroundColor:", v23);

  contactHeaderView = self->_contactHeaderView;
  v31 = v18;
  objc_msgSend(v3, "textColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](contactHeaderView, "cn_updateDictionaryForKey:withChanges:", CFSTR("nameTextAttributes"), v29);

  return v3;
}

- (BOOL)highlightedPropertyImportant
{
  return self->_highlightedPropertyImportant;
}

- (void)setHighlightedPropertyImportant:(BOOL)a3
{
  self->_highlightedPropertyImportant = a3;
}

- (CNContactContentNavigationItemDelegate)navigationItemDelegate
{
  return (CNContactContentNavigationItemDelegate *)objc_loadWeakRetained((id *)&self->_navigationItemDelegate);
}

- (void)setNavigationItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationItemDelegate, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNGroup)parentGroup
{
  return self->_parentGroup;
}

- (void)setParentGroup:(id)a3
{
  objc_storeStrong((id *)&self->_parentGroup, a3);
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (void)setParentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_parentContainer, a3);
}

- (void)setContactView:(id)a3
{
  objc_storeStrong((id *)&self->_contactView, a3);
}

- (void)setContactHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_contactHeaderView, a3);
}

- (CNContactContentEditViewControllerDelegate)delegate
{
  return (CNContactContentEditViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNPresenterDelegate)presentingDelegate
{
  return (CNPresenterDelegate *)objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (CNContactContentViewControllerConfiguration)contactViewConfiguration
{
  return self->_contactViewConfiguration;
}

- (void)setContactViewConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewConfiguration, a3);
}

- (CNMutableContact)mutableContact
{
  return self->_mutableContact;
}

- (void)setMutableContact:(id)a3
{
  objc_storeStrong((id *)&self->_mutableContact, a3);
}

- (NSMutableArray)issuedSaveRequestIdentifiers
{
  return self->_issuedSaveRequestIdentifiers;
}

- (void)setIssuedSaveRequestIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_issuedSaveRequestIdentifiers, a3);
}

- (CNMutableContact)shadowCopyOfReadonlyContact
{
  return self->_shadowCopyOfReadonlyContact;
}

- (void)setShadowCopyOfReadonlyContact:(id)a3
{
  objc_storeStrong((id *)&self->_shadowCopyOfReadonlyContact, a3);
}

- (CNUIContainerContext)containerContext
{
  return self->_containerContext;
}

- (void)setContainerContext:(id)a3
{
  objc_storeStrong((id *)&self->_containerContext, a3);
}

- (CNPropertyGroupsDataSource)propertyGroupsDataSource
{
  return self->_propertyGroupsDataSource;
}

- (void)setPropertyGroupsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_propertyGroupsDataSource, a3);
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (CNContactContainerPickerViewController)containerPicker
{
  return self->_containerPicker;
}

- (void)setContainerPicker:(id)a3
{
  objc_storeStrong((id *)&self->_containerPicker, a3);
}

- (BOOL)isPresentingFullscreenForOutOfProcess
{
  return self->_isPresentingFullscreenForOutOfProcess;
}

- (void)setIsPresentingFullscreenForOutOfProcess:(BOOL)a3
{
  self->_isPresentingFullscreenForOutOfProcess = a3;
}

- (NSMutableArray)editingGroups
{
  return self->_editingGroups;
}

- (void)setEditingGroups:(id)a3
{
  objc_storeStrong((id *)&self->_editingGroups, a3);
}

- (NSArray)nameEditingGroups
{
  return self->_nameEditingGroups;
}

- (void)setNameEditingGroups:(id)a3
{
  objc_storeStrong((id *)&self->_nameEditingGroups, a3);
}

- (NSMutableDictionary)groupsAfterGroup
{
  return self->_groupsAfterGroup;
}

- (void)setGroupsAfterGroup:(id)a3
{
  objc_storeStrong((id *)&self->_groupsAfterGroup, a3);
}

- (NSMapTable)cachedLabelWidths
{
  return self->_cachedLabelWidths;
}

- (void)setCachedLabelWidths:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLabelWidths, a3);
}

- (NSArray)extraRightBarButtonItems
{
  return self->_extraRightBarButtonItems;
}

- (void)setExtraRightBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, a3);
}

- (NSArray)extraLeftBarButtonItems
{
  return self->_extraLeftBarButtonItems;
}

- (void)setExtraLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, a3);
}

- (CNCardGroup)cardMedicalIDGroup
{
  return self->_cardMedicalIDGroup;
}

- (void)setCardMedicalIDGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardMedicalIDGroup, a3);
}

- (CNCardLinkedCardsGroup)cardLinkedCardsGroup
{
  return self->_cardLinkedCardsGroup;
}

- (void)setCardLinkedCardsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardLinkedCardsGroup, a3);
}

- (NSArray)customActions
{
  return self->_customActions;
}

- (void)setCustomActions:(id)a3
{
  objc_storeStrong((id *)&self->_customActions, a3);
}

- (CNPropertyNoteCell)noteCell
{
  return self->_noteCell;
}

- (void)setNoteCell:(id)a3
{
  objc_storeStrong((id *)&self->_noteCell, a3);
}

- (CNPropertyStaticIdentityAction)staticIdentityAction
{
  return self->_staticIdentityAction;
}

- (void)setStaticIdentityAction:(id)a3
{
  objc_storeStrong((id *)&self->_staticIdentityAction, a3);
}

- (CNContactAddStaticIdentityAction)addStaticIdentityAction
{
  return self->_addStaticIdentityAction;
}

- (void)setAddStaticIdentityAction:(id)a3
{
  objc_storeStrong((id *)&self->_addStaticIdentityAction, a3);
}

- (CNPropertyLinkedCardsAction)linkedCardsAction
{
  return self->_linkedCardsAction;
}

- (void)setLinkedCardsAction:(id)a3
{
  objc_storeStrong((id *)&self->_linkedCardsAction, a3);
}

- (CNContactAddLinkedCardAction)addLinkedCardAction
{
  return self->_addLinkedCardAction;
}

- (void)setAddLinkedCardAction:(id)a3
{
  objc_storeStrong((id *)&self->_addLinkedCardAction, a3);
}

- (CNContactAddNewFieldAction)addNewFieldAction
{
  return self->_addNewFieldAction;
}

- (void)setAddNewFieldAction:(id)a3
{
  objc_storeStrong((id *)&self->_addNewFieldAction, a3);
}

- (CNContactSuggestionAction)suggestedContactAction
{
  return self->_suggestedContactAction;
}

- (void)setSuggestedContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedContactAction, a3);
}

- (CNContactSelectContainersAction)selectContainersAction
{
  return self->_selectContainersAction;
}

- (void)setSelectContainersAction:(id)a3
{
  objc_storeStrong((id *)&self->_selectContainersAction, a3);
}

- (CNContactActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (void)setActionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_actionProvider, a3);
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setActivatedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activatedConstraints, a3);
}

- (NSLayoutConstraint)headerHeightConstraint
{
  return self->_headerHeightConstraint;
}

- (void)setHeaderHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_headerHeightConstraint, a3);
}

- (UIView)headerDropShadowView
{
  return self->_headerDropShadowView;
}

- (void)setHeaderDropShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_headerDropShadowView, a3);
}

- (CNMedicalIDAction)medicalIDAction
{
  return self->_medicalIDAction;
}

- (void)setMedicalIDAction:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDAction, a3);
}

- (CNEmergencyContactAction)emergencyContactAction
{
  return self->_emergencyContactAction;
}

- (void)setEmergencyContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyContactAction, a3);
}

- (CNHealthStoreManagerToken)medicalIDRegistrationToken
{
  return self->_medicalIDRegistrationToken;
}

- (void)setMedicalIDRegistrationToken:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDRegistrationToken, a3);
}

- (CNCancelable)medicalIDLookupToken
{
  return self->_medicalIDLookupToken;
}

- (void)setMedicalIDLookupToken:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDLookupToken, a3);
}

- (NSString)emergencyNumberIdentifier
{
  return self->_emergencyNumberIdentifier;
}

- (void)setEmergencyNumberIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyNumberIdentifier, a3);
}

- (CNCardGroup)cardEditingActionsGroup
{
  return self->_cardEditingActionsGroup;
}

- (void)setCardEditingActionsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardEditingActionsGroup, a3);
}

- (CNCardGroup)cardEditingDeleteContactGroup
{
  return self->_cardEditingDeleteContactGroup;
}

- (void)setCardEditingDeleteContactGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardEditingDeleteContactGroup, a3);
}

- (CNCardPropertyGeminiGroup)cardEditingGeminiGroup
{
  return self->_cardEditingGeminiGroup;
}

- (void)setCardEditingGeminiGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardEditingGeminiGroup, a3);
}

- (CNCardContactContainerGroup)cardEditingContactContainerGroup
{
  return self->_cardEditingContactContainerGroup;
}

- (void)setCardEditingContactContainerGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardEditingContactContainerGroup, a3);
}

- (CNCardStaticIdentityGroup)cardStaticIdentityGroup
{
  return self->_cardStaticIdentityGroup;
}

- (void)setCardStaticIdentityGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardStaticIdentityGroup, a3);
}

- (CNContactAction)deleteContactAction
{
  return self->_deleteContactAction;
}

- (void)setDeleteContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_deleteContactAction, a3);
}

- (CNContactAction)ignoreContactAction
{
  return self->_ignoreContactAction;
}

- (void)setIgnoreContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_ignoreContactAction, a3);
}

- (CNSiriContactContextProvider)siriContextProvider
{
  return self->_siriContextProvider;
}

- (void)setSiriContextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_siriContextProvider, a3);
}

- (NSMutableArray)editingLinkedContacts
{
  return self->_editingLinkedContacts;
}

- (void)setEditingLinkedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_editingLinkedContacts, a3);
}

- (NSDictionary)userActivityUserInfo
{
  return self->_userActivityUserInfo;
}

- (void)setUserActivityUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityUserInfo, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (BOOL)didSetFirstResponder
{
  return self->_didSetFirstResponder;
}

- (void)setDidSetFirstResponder:(BOOL)a3
{
  self->_didSetFirstResponder = a3;
}

- (NSArray)highlightedProperties
{
  return self->_highlightedProperties;
}

- (void)setHighlightedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedProperties, a3);
}

- (UIKeyCommand)saveCommand
{
  return self->_saveCommand;
}

- (void)setSaveCommand:(id)a3
{
  objc_storeStrong((id *)&self->_saveCommand, a3);
}

- (UIKeyCommand)cancelCommand
{
  return self->_cancelCommand;
}

- (void)setCancelCommand:(id)a3
{
  objc_storeStrong((id *)&self->_cancelCommand, a3);
}

- (double)keyboardVerticalOverlap
{
  return self->_keyboardVerticalOverlap;
}

- (void)setKeyboardVerticalOverlap:(double)a3
{
  self->_keyboardVerticalOverlap = a3;
}

- (NSArray)preEditLeftBarButtonItems
{
  return self->_preEditLeftBarButtonItems;
}

- (void)setPreEditLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, a3);
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (CNUIUserActivityManager)activityManager
{
  return self->_activityManager;
}

- (CNUIGeminiDataSource)geminiDataSource
{
  return self->_geminiDataSource;
}

- (BOOL)runningPPT
{
  return self->_runningPPT;
}

- (void)setRunningPPT:(BOOL)a3
{
  self->_runningPPT = a3;
}

- (UIEdgeInsets)peripheryInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_peripheryInsets.top;
  left = self->_peripheryInsets.left;
  bottom = self->_peripheryInsets.bottom;
  right = self->_peripheryInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)didSetNewContact
{
  return self->_didSetNewContact;
}

- (void)setDidSetNewContact:(BOOL)a3
{
  self->_didSetNewContact = a3;
}

- (BOOL)forcesTransparentBackground
{
  return self->_forcesTransparentBackground;
}

- (CNContactContentNavigationItemUpdater)navItemUpdater
{
  return self->_navItemUpdater;
}

- (void)setNavItemUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_navItemUpdater, a3);
}

- (BOOL)supportsDrafts
{
  return self->_supportsDrafts;
}

- (void)setSupportsDrafts:(BOOL)a3
{
  self->_supportsDrafts = a3;
}

- (CNPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (NSDictionary)linkedPoliciesByContactIdentifier
{
  return self->_linkedPoliciesByContactIdentifier;
}

- (void)setLinkedPoliciesByContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, a3);
}

- (NSArray)cardActions
{
  return self->_cardActions;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (NSArray)missingRequiredKeys
{
  return self->_missingRequiredKeys;
}

- (void)setMissingRequiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_missingRequiredKeys, a3);
}

- (void)setOriginalContacts:(id)a3
{
  objc_storeStrong((id *)&self->_originalContacts, a3);
}

- (BOOL)shouldDrawNavigationBar
{
  return self->_shouldDrawNavigationBar;
}

- (void)setShouldDrawNavigationBar:(BOOL)a3
{
  self->_shouldDrawNavigationBar = a3;
}

- (NSString)initialPrompt
{
  return self->_initialPrompt;
}

- (void)setInitialPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_initialPrompt, a3);
}

- (CNUIContactSaveExecutor)saveContactExecutor
{
  return self->_saveContactExecutor;
}

- (void)setSaveContactExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_saveContactExecutor, a3);
}

- (CNUIContactSaveExecutor)saveLinkedContactsExecutor
{
  return self->_saveLinkedContactsExecutor;
}

- (void)setSaveLinkedContactsExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, a3);
}

- (BOOL)shouldIgnoreContactStoreDidChangeNotification
{
  return self->_shouldIgnoreContactStoreDidChangeNotification;
}

- (void)setShouldIgnoreContactStoreDidChangeNotification:(BOOL)a3
{
  self->_shouldIgnoreContactStoreDidChangeNotification = a3;
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (CNContactRecentsReference)recentsData
{
  return self->_recentsData;
}

- (void)setRecentsData:(id)a3
{
  objc_storeStrong((id *)&self->_recentsData, a3);
}

- (NSDictionary)propertyGroups
{
  return self->_propertyGroups;
}

- (BOOL)showingMeContact
{
  return self->_showingMeContact;
}

- (void)setShowingMeContact:(BOOL)a3
{
  self->_showingMeContact = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyGroups, 0);
  objc_storeStrong((id *)&self->_recentsData, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, 0);
  objc_storeStrong((id *)&self->_saveContactExecutor, 0);
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_storeStrong((id *)&self->_originalContacts, 0);
  objc_storeStrong((id *)&self->_missingRequiredKeys, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_cardActions, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_navItemUpdater, 0);
  objc_storeStrong((id *)&self->_geminiDataSource, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cancelCommand, 0);
  objc_storeStrong((id *)&self->_saveCommand, 0);
  objc_storeStrong((id *)&self->_highlightedProperties, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_userActivityUserInfo, 0);
  objc_storeStrong((id *)&self->_editingLinkedContacts, 0);
  objc_storeStrong((id *)&self->_siriContextProvider, 0);
  objc_storeStrong((id *)&self->_ignoreContactAction, 0);
  objc_storeStrong((id *)&self->_deleteContactAction, 0);
  objc_storeStrong((id *)&self->_cardStaticIdentityGroup, 0);
  objc_storeStrong((id *)&self->_cardEditingContactContainerGroup, 0);
  objc_storeStrong((id *)&self->_cardEditingGeminiGroup, 0);
  objc_storeStrong((id *)&self->_cardEditingDeleteContactGroup, 0);
  objc_storeStrong((id *)&self->_cardEditingActionsGroup, 0);
  objc_storeStrong((id *)&self->_emergencyNumberIdentifier, 0);
  objc_storeStrong((id *)&self->_medicalIDLookupToken, 0);
  objc_storeStrong((id *)&self->_medicalIDRegistrationToken, 0);
  objc_storeStrong((id *)&self->_emergencyContactAction, 0);
  objc_storeStrong((id *)&self->_medicalIDAction, 0);
  objc_storeStrong((id *)&self->_headerDropShadowView, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
  objc_storeStrong((id *)&self->_selectContainersAction, 0);
  objc_storeStrong((id *)&self->_suggestedContactAction, 0);
  objc_storeStrong((id *)&self->_addNewFieldAction, 0);
  objc_storeStrong((id *)&self->_addLinkedCardAction, 0);
  objc_storeStrong((id *)&self->_linkedCardsAction, 0);
  objc_storeStrong((id *)&self->_addStaticIdentityAction, 0);
  objc_storeStrong((id *)&self->_staticIdentityAction, 0);
  objc_storeStrong((id *)&self->_noteCell, 0);
  objc_storeStrong((id *)&self->_customActions, 0);
  objc_storeStrong((id *)&self->_cardLinkedCardsGroup, 0);
  objc_storeStrong((id *)&self->_cardMedicalIDGroup, 0);
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cachedLabelWidths, 0);
  objc_storeStrong((id *)&self->_groupsAfterGroup, 0);
  objc_storeStrong((id *)&self->_nameEditingGroups, 0);
  objc_storeStrong((id *)&self->_editingGroups, 0);
  objc_storeStrong((id *)&self->_containerPicker, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_propertyGroupsDataSource, 0);
  objc_storeStrong((id *)&self->_containerContext, 0);
  objc_storeStrong((id *)&self->_shadowCopyOfReadonlyContact, 0);
  objc_storeStrong((id *)&self->_issuedSaveRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutableContact, 0);
  objc_storeStrong((id *)&self->_contactViewConfiguration, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactHeaderView, 0);
  objc_storeStrong((id *)&self->_contactView, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_parentGroup, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_navigationItemDelegate);
}

void __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultSchedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke_2;
  v13[3] = &unk_1E204FEC0;
  v14 = v6;
  v15 = WeakRetained;
  v16 = *(id *)(a1 + 32);
  v17 = v5;
  v11 = v5;
  v12 = v6;
  objc_msgSend(v10, "performBlock:", v13);

}

void __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setMedicalIDRegistrationToken:", 0);
  objc_msgSend(*(id *)(a1 + 32), "unregisterHandlerForToken:", *(_QWORD *)(a1 + 40));

}

void __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CNCardGroup *v6;
  CNCardGroup *v7;
  void *v8;
  void *v9;
  CNMedicalIDAction *v10;
  void *v11;
  CNMedicalIDAction *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  id v46;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "medicalIDRegistrationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3 && objc_msgSend(*(id *)(a1 + 40), "showingMeContact"))
  {
    objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeAllActions");
    }
    else
    {
      v6 = [CNCardGroup alloc];
      objc_msgSend(*(id *)(a1 + 40), "mutableContact");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CNCardGroup initWithContact:](v6, "initWithContact:", v5);
      objc_msgSend(*(id *)(a1 + 40), "setCardMedicalIDGroup:", v7);

    }
    objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAddSpacerFromPreviousGroup:", 0);

    if (objc_msgSend(*(id *)(a1 + 40), "showingMeContact"))
    {
      objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = [CNMedicalIDAction alloc];
        objc_msgSend(*(id *)(a1 + 40), "contact");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[CNPropertyAction initWithContact:](v10, "initWithContact:", v11);
        objc_msgSend(*(id *)(a1 + 40), "setMedicalIDAction:", v12);

        v13 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setHealthStoreManager:", v13);

        v15 = *(void **)(a1 + 40);
        objc_msgSend(v15, "medicalIDAction");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setDelegate:", v15);

        objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setShowBackgroundPlatter:", 0);

      }
      objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAddSpacerFromPreviousGroup:", 1);

      v19 = *(_QWORD *)(a1 + 56);
      CNContactsUIBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v19)
        v22 = CFSTR("CARD_ACTION_EDIT_MEDICAL_ID");
      else
        v22 = CFSTR("CARD_ACTION_CREATE_MEDICAL_ID");
      if (v19)
        v23 = 3;
      else
        v23 = 1;
      objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1E20507A8, CFSTR("Localized"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setMedicalIDActionType:", v23);

      objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNUIColorRepository contactListEmergencyContactAddTextColor](CNUIColorRepository, "contactListEmergencyContactAddTextColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNUIColorRepository contactListEmergencyContactGlyphColor](CNUIColorRepository, "contactListEmergencyContactGlyphColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addAction:withTitle:color:glyphColor:transportType:", v27, v24, v28, v29, 6);

    }
    objc_msgSend(*(id *)(a1 + 40), "contactView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "editingGroups");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1E0DC3F10];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke_3;
    v43[3] = &unk_1E204FAA0;
    v33 = v31;
    v34 = *(_QWORD *)(a1 + 40);
    v44 = v33;
    v45 = v34;
    v42 = v30;
    v46 = v42;
    objc_msgSend(v32, "performWithoutAnimation:", v43);
    objc_msgSend(*(id *)(a1 + 40), "emergencyNumberIdentifier");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)v35;
      objc_msgSend(*(id *)(a1 + 40), "emergencyNumberIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(0, "isEqualToString:", v37);

      if ((v38 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "setEmergencyNumberIdentifier:", 0);
        v39 = *(void **)(a1 + 40);
        objc_msgSend(v39, "propertyGroups");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", *MEMORY[0x1E0C967C0]);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "reloadCardGroup:forTableView:", v41, v42);

      }
    }

  }
}

void __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadCardGroup:forTableView:", v6, *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_addMedicalIDGroupAnimated:forTableView:", 0, *(_QWORD *)(a1 + 48));
  }
}

BOOL __78__CNContactContentEditViewController__addMedicalIDGroupAnimated_forTableView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cardLinkedCardsGroup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cardStaticIdentityGroup");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v3)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "cardEditingDeleteContactGroup");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v6 == v3;

    }
  }

  return v7;
}

uint64_t __61__CNContactContentEditViewController__setupSuggestionActions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggested");
}

uint64_t __77__CNContactContentEditViewController_updateContactsViewWithBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__CNContactContentEditViewController_updateContactsViewWithBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 972);
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataIfNeeded");
}

void __85__CNContactContentEditViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __81__CNContactContentEditViewController_removeEditingItem_atIndexPath_forTableView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeEditingItem:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_updateLabelWidthForCellsInGroup:forTableView:reset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 1);
  if (!objc_msgSend(*(id *)(a1 + 32), "isMultiValue"))
  {
    objc_msgSend(*(id *)(a1 + 32), "propertyItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = *(void **)(a1 + 56);
    if (v10 < 2)
    {
      v12 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadRowsAtIndexPaths:withRowAnimation:", v6, 100);
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deleteRowsAtIndexPaths:withRowAnimation:", v6, 2);
    }
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 48), "contactView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteRowsAtIndexPaths:withRowAnimation:", v3, 2);

  if (!*(_BYTE *)(a1 + 72) && objc_msgSend(*(id *)(a1 + 32), "canAddEditingItem"))
  {
    v4 = (void *)MEMORY[0x1E0CB36B0];
    objc_msgSend(*(id *)(a1 + 32), "editingItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathForRow:inSection:", objc_msgSend(v5, "count") - 1, objc_msgSend(*(id *)(a1 + 64), "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(a1 + 56);
    v14 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertRowsAtIndexPaths:withRowAnimation:", v8, 100);

LABEL_8:
  }
}

void __77__CNContactContentEditViewController_addEditingItemAtIndexPath_forTableView___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "isMultiValue"))
  {
    objc_msgSend(*(id *)(a1 + 40), "contactView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v7;
LABEL_6:
    objc_msgSend(v5, "arrayWithObjects:count:", v6, 1, v7, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadRowsAtIndexPaths:withRowAnimation:", v4, 100);
    goto LABEL_7;
  }
  v2 = objc_msgSend(*(id *)(a1 + 32), "canAddEditingItem");
  objc_msgSend(*(id *)(a1 + 40), "contactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v8 = *(_QWORD *)(a1 + 48);
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v8;
    goto LABEL_6;
  }
  v9[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertRowsAtIndexPaths:withRowAnimation:", v4, 6);
LABEL_7:

}

uint64_t __77__CNContactContentEditViewController_addEditingItemAtIndexPath_forTableView___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "focusOnLastEditingItemInGroup:", *(_QWORD *)(result + 40));
  return result;
}

uint64_t __67__CNContactContentEditViewController_propertyItem_willChangeValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __90__CNContactContentEditViewController_propertyCell_performActionForItem_withTransportType___block_invoke(uint64_t a1)
{
  CNPropertyTTYAction *v2;
  void *v3;
  CNPropertyTTYAction *v4;

  v2 = [CNPropertyTTYAction alloc];
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNPropertyAction initWithContact:propertyItem:](v2, "initWithContact:propertyItem:", v3, *(_QWORD *)(a1 + 40));

  -[CNContactAction setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[CNPropertyTTYAction performActionForItem:sender:](v4, "performActionForItem:sender:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __90__CNContactContentEditViewController_propertyCell_performActionForItem_withTransportType___block_invoke_2(uint64_t a1)
{
  CNPropertyTTYRelayAction *v2;
  void *v3;
  CNPropertyTTYRelayAction *v4;

  v2 = [CNPropertyTTYRelayAction alloc];
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNPropertyAction initWithContact:propertyItem:](v2, "initWithContact:propertyItem:", v3, *(_QWORD *)(a1 + 40));

  -[CNContactAction setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[CNPropertyTTYRelayAction performActionForItem:sender:](v4, "performActionForItem:sender:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __54__CNContactContentEditViewController_actionDidFinish___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "confirm");
  return objc_msgSend(*(id *)(a1 + 40), "reloadDataPreservingChanges:", 0);
}

uint64_t __85__CNContactContentEditViewController_sender_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t result;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[970])
  {
    objc_msgSend(v2, "_endDisablingInterfaceAutorotation");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 970) = 0;
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __89__CNContactContentEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "contactView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(v2, "scrollRectToVisible:animated:", 0);

}

uint64_t __78__CNContactContentEditViewController_setupViewHierarchyIncludingAvatarHeader___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", a2, 0);
}

void __49__CNContactContentEditViewController_performSave__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contact");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[CNContactContentEditViewController _telemetryForContact:](CNContactContentEditViewController, "_telemetryForContact:", v1);

}

uint64_t __66__CNContactContentEditViewController_reloadDataPreservingChanges___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggested");
}

void __76__CNContactContentEditViewController_contactStoreDidChangeWithNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  _BYTE *v13;
  void *v14;
  id v15;

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreContactStoreDidChangeNotification") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C97088]);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C97090]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "issuedSaveRequestIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((!v15 || (objc_msgSend(v15, "BOOLValue") & 1) == 0)
      && objc_msgSend(v8, "count")
      && objc_msgSend(v5, "count")
      && (objc_msgSend(v5, "isSubsetOfSet:", v8) & 1) != 0)
    {
      goto LABEL_14;
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 32), "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(*(id *)(a1 + 32), "isEditing");

      if (!v12)
      {
LABEL_10:
        v13 = *(_BYTE **)(a1 + 32);
        if (!v13[971])
        {
          objc_msgSend(v13, "contactViewCache");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "resetCache");

          objc_msgSend(*(id *)(a1 + 32), "_refetchContact");
        }
        goto LABEL_14;
      }
    }
    else
    {

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 969) = 1;
LABEL_14:

  }
}

uint64_t __49__CNContactContentEditViewController_setContact___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeBackgroundScheduler");
}

uint64_t __49__CNContactContentEditViewController_setContact___block_invoke_233(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValidForContact:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008));
}

id __69__CNContactContentEditViewController_setForcesTransparentBackground___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "applyContactStyle");
}

+ (id)descriptorForRequiredKeysForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableKeyDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v5;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactContentEditViewController descriptorForRequiredKeysForContact:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptorWithKeyDescriptors:description:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactContentEditViewController descriptorForRequiredKeys]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptorForRequiredKeysWithDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)tableViewStyle
{
  return 1;
}

+ (id)descriptorForRequiredKeysWithDescription:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CNContactContentEditViewController_descriptorForRequiredKeysWithDescription___block_invoke;
  block[3] = &unk_1E204F648;
  v11 = v3;
  v4 = descriptorForRequiredKeysWithDescription__cn_once_token_7;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&descriptorForRequiredKeysWithDescription__cn_once_token_7, block);
    v7 = v11;
  }
  v8 = (id)descriptorForRequiredKeysWithDescription__cn_once_object_7;

  return v8;
}

+ (BOOL)enablesTransportButtons
{
  if (enablesTransportButtons_s_onceToken != -1)
    dispatch_once(&enablesTransportButtons_s_onceToken, &__block_literal_global_21619);
  return enablesTransportButtons_s_enableTransportButtons;
}

+ (void)_telemetryForContact:(id)a3
{
  id v3;
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
  unint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  unint64_t v35;
  _BYTE v36[128];
  _QWORD v37[3];
  _QWORD v38[5];

  v38[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v37[0] = CFSTR("PhoneNumbers");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v6;
  v37[1] = CFSTR("EmailAddresses");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "emailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v9;
  v37[2] = CFSTR("PostalAddresses");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "postalAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "note");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15 >> 11 >= 5)
  {
    _LargeDatabasesLowSeveritySignpostLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      objc_msgSend(v3, "note");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349056;
      v33 = objc_msgSend(v17, "length");
      _os_signpost_emit_with_name_impl(&dword_18AC56000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LongContactNoteLength", " enableTelemetry=YES %{public, signpost.telemetry:number1, name=NoteLength}lu", buf, 0xCu);

    }
  }
  v27 = v3;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v13;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "unsignedIntegerValue");

        if (v25 >= 0xA)
        {
          _LargeDatabasesLowSeveritySignpostLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v26))
          {
            *(_DWORD *)buf = 138543618;
            v33 = v23;
            v34 = 2050;
            v35 = v25;
            _os_signpost_emit_with_name_impl(&dword_18AC56000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HighContactAttributeCount", " enableTelemetry=YES %{public, signpost.telemetry:string1, name=Label}@ %{public, signpost.telemetry:number1, name=LabelCount}lu", buf, 0x16u);
          }

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v20);
  }

}

+ (BOOL)shouldShowGeminiForResult:(id)a3 contact:(id)a4
{
  void *v4;
  void *v5;
  id v7;
  void *v8;
  BOOL v9;
  int v10;
  void *v11;

  v7 = a3;
  if (v7)
  {
    objc_msgSend(a4, "phoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") && objc_msgSend(MEMORY[0x1E0C97310], "deviceSupportsGemini"))
    {
      objc_msgSend(v7, "availableChannels");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v4, "count") > 1)
      {
        v9 = 1;
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      objc_msgSend(v7, "channel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 1;
      v9 = 1;
      if (!objc_msgSend(v5, "isAvailable"))
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v7, "channel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_msgSend(v11, "isAvailable") & 1) == 0 && objc_msgSend(v7, "usage") == 1;

    if (!v10)
      goto LABEL_16;
    goto LABEL_14;
  }
  v9 = 0;
LABEL_17:

  return v9;
}

+ (id)BOOLStateRestorationProperties
{
  return &unk_1E20D3820;
}

+ (CNContactContentEditViewController)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  CNContactContentEditViewController *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v7 = (void *)MEMORY[0x1E0C97200];
  +[CNContactContentEditViewController descriptorForRequiredKeys](CNContactContentEditViewController, "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactWithStateRestorationCoder:store:keys:", v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v21 = v6;
    v11 = -[CNContactContentViewControllerConfiguration initForOutOfProcess:]([CNContactContentViewControllerConfiguration alloc], "initForOutOfProcess:", 0);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(a1, "BOOLStateRestorationProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16);
          objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v11, "setValue:forKey:", v18, v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    v19 = -[CNContactContentEditViewController initWithContact:contactViewConfiguration:]([CNContactContentEditViewController alloc], "initWithContact:contactViewConfiguration:", v10, v11);
    v6 = v21;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __61__CNContactContentEditViewController_enablesTransportButtons__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("CNEnableTransportButtons"), (CFStringRef)*MEMORY[0x1E0C9B228], 0);
  enablesTransportButtons_s_enableTransportButtons = (_DWORD)result != 0;
  return result;
}

void __79__CNContactContentEditViewController_descriptorForRequiredKeysWithDescription___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[50];

  v13[49] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97310], "descriptorForRequiredKeys", *MEMORY[0x1E0C966E8], *MEMORY[0x1E0C96768], *MEMORY[0x1E0C96790], *MEMORY[0x1E0C966D0], *MEMORY[0x1E0C96780], *MEMORY[0x1E0C966C0], *MEMORY[0x1E0C96820], *MEMORY[0x1E0C96798], *MEMORY[0x1E0C967A0], *MEMORY[0x1E0C967D8], *MEMORY[0x1E0C967E0], *MEMORY[0x1E0C967D0], *MEMORY[0x1E0C967B8], *MEMORY[0x1E0C967E8], *MEMORY[0x1E0C96698], *MEMORY[0x1E0C96758], *MEMORY[0x1E0C96668],
    *MEMORY[0x1E0C96670],
    *MEMORY[0x1E0C967A8],
    *MEMORY[0x1E0C967B0],
    *MEMORY[0x1E0C96708],
    *MEMORY[0x1E0C96890],
    *MEMORY[0x1E0C96700],
    *MEMORY[0x1E0C96898],
    *MEMORY[0x1E0C967C0],
    *MEMORY[0x1E0C966A8],
    *MEMORY[0x1E0C967F0],
    *MEMORY[0x1E0C96690],
    *MEMORY[0x1E0C968A0],
    *MEMORY[0x1E0C96840],
    *MEMORY[0x1E0C96868],
    *MEMORY[0x1E0C96740],
    *MEMORY[0x1E0C966E0],
    *MEMORY[0x1E0C96768],
    *MEMORY[0x1E0C96680],
    *MEMORY[0x1E0C96888],
    *MEMORY[0x1E0C96688],
    *MEMORY[0x1E0C96770],
    *MEMORY[0x1E0C96678],
    *MEMORY[0x1E0C96728],
    *MEMORY[0x1E0C96710],
    *MEMORY[0x1E0C96778],
    *MEMORY[0x1E0C966C8],
    *MEMORY[0x1E0C96830],
    *MEMORY[0x1E0C96828]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C966A0];
  v13[45] = v2;
  v13[46] = v3;
  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[47] = v5;
  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactHeaderDisplayView descriptorForRequiredKeysForContactFormatter:](CNContactHeaderDisplayView, "descriptorForRequiredKeysForContactFormatter:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[48] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 49);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNSiriContactContextProvider descriptorForRequiredKeys](CNSiriContactContextProvider, "descriptorForRequiredKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "arrayByAddingObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0C97200], "descriptorWithKeyDescriptors:description:", v8, *(_QWORD *)(a1 + 32));
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)descriptorForRequiredKeysWithDescription__cn_once_object_7;
  descriptorForRequiredKeysWithDescription__cn_once_object_7 = v11;

}

@end
