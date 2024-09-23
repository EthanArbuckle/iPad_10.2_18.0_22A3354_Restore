@implementation CNCombinedVisualIdentityEditorViewController

- (CNCombinedVisualIdentityEditorViewController)initWithProviderItem:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  CNCombinedVisualIdentityEditorViewController *v8;
  CNCombinedVisualIdentityEditorViewController *v9;
  id v10;
  uint64_t v11;
  id *v12;
  CNVisualIdentityAvatarStyleEditorViewController *v13;
  NSObject *p_super;
  void *v15;
  uint64_t v16;
  CNVisualIdentityAvatarStyleEditorViewController *emojiEditor;
  void *v18;
  void *v19;
  uint64_t v20;
  CNVisualIdentityAvatarStyleEditorViewController *textEditor;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CNCombinedVisualIdentityEditorViewController;
  v8 = -[CNCombinedVisualIdentityEditorViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (!v8)
    goto LABEL_14;
  objc_storeStrong((id *)&v8->_dataSource, a4);
  v10 = -[CNCombinedVisualIdentityEditorViewController _newStyleEditorWithItem:](v9, "_newStyleEditorWithItem:", v6);
  if (objc_msgSend(v6, "imageType") == 4)
  {
    v11 = 1000;
  }
  else
  {
    if (objc_msgSend(v6, "imageType") != 2)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_error_impl(&dword_18AC56000, p_super, OS_LOG_TYPE_ERROR, "Unsupported provider item type: %@", buf, 0xCu);
      }
      goto LABEL_9;
    }
    v11 = 992;
  }
  v12 = (id *)((char *)&v9->super.super.super.isa + v11);
  objc_storeStrong((id *)((char *)&v9->super.super.super.isa + v11), v10);
  v13 = (CNVisualIdentityAvatarStyleEditorViewController *)*v12;
  p_super = &v9->_selectedEditor->super.super.super;
  v9->_selectedEditor = v13;
LABEL_9:

  if (!v9->_emojiEditor)
  {
    +[CNVisualIdentityPickerViewController defaultItemSize](CNVisualIdentityPickerViewController, "defaultItemSize");
    +[CNPhotoPickerEmojiProviderItem addNewEmojiProviderItemWithSize:](CNPhotoPickerEmojiProviderItem, "addNewEmojiProviderItemWithSize:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CNCombinedVisualIdentityEditorViewController _newStyleEditorWithItem:](v9, "_newStyleEditorWithItem:", v15);
    emojiEditor = v9->_emojiEditor;
    v9->_emojiEditor = (CNVisualIdentityAvatarStyleEditorViewController *)v16;

  }
  if (!v9->_textEditor)
  {
    -[CNCombinedVisualIdentityEditorViewController dataSource](v9, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNVisualIdentityPickerViewController defaultItemSize](CNVisualIdentityPickerViewController, "defaultItemSize");
    objc_msgSend(v18, "monogramProviderMonogramItemWithSize:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = -[CNCombinedVisualIdentityEditorViewController _newStyleEditorWithItem:](v9, "_newStyleEditorWithItem:", v19);
    textEditor = v9->_textEditor;
    v9->_textEditor = (CNVisualIdentityAvatarStyleEditorViewController *)v20;

  }
LABEL_14:

  return v9;
}

- (id)_newStyleEditorWithItem:(id)a3
{
  id v4;
  CNVisualIdentityAvatarStyleEditorViewController *v5;
  void *v6;
  CNVisualIdentityAvatarStyleEditorViewController *v7;

  v4 = a3;
  v5 = [CNVisualIdentityAvatarStyleEditorViewController alloc];
  -[CNPhotoPickerDataSource variantsManager](self->_dataSource, "variantsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNVisualIdentityAvatarStyleEditorViewController initWithProviderItem:variantsManager:](v5, "initWithProviderItem:variantsManager:", v4, v6);

  -[CNVisualIdentityAvatarStyleEditorViewController setDelegate:](v7, "setDelegate:", self);
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNCombinedVisualIdentityEditorViewController;
  -[CNCombinedVisualIdentityEditorViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[CNCombinedVisualIdentityEditorViewController setupBarButtonItems](self, "setupBarButtonItems");
  -[CNCombinedVisualIdentityEditorViewController setupSegmentedControl](self, "setupSegmentedControl");
  -[CNCombinedVisualIdentityEditorViewController setupEditors](self, "setupEditors");
  +[CNUIColorRepository visualIdentityEditorBackgroundColor](CNUIColorRepository, "visualIdentityEditorBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[CNCombinedVisualIdentityEditorViewController updateDoneButtonEnabledState](self, "updateDoneButtonEnabledState");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNCombinedVisualIdentityEditorViewController;
  -[CNCombinedVisualIdentityEditorViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self->_selectedEditor, "editableAvatarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginEditing");

}

- (void)setupBarButtonItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_didTapCancel);
  -[CNCombinedVisualIdentityEditorViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_didTapDone);
  -[CNCombinedVisualIdentityEditorViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EDIT_PHOTO"), &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCombinedVisualIdentityEditorViewController navigationItem](self, "navigationItem");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "setTitle:", v8);

  -[CNCombinedVisualIdentityEditorViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStyle:", 0);

  -[CNCombinedVisualIdentityEditorViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setBackgroundHidden:", 1);

  -[CNCombinedVisualIdentityEditorViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v13, "isTranslucent");

  if ((v9 & 1) == 0)
    -[CNCombinedVisualIdentityEditorViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
}

- (void)updateDoneButtonEnabledState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[CNCombinedVisualIdentityEditorViewController selectedEditor](self, "selectedEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providerItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE033250))
  {
    objc_msgSend(v10, "itemText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = *MEMORY[0x1E0D13850];
  objc_msgSend(v4, "_cn_trimmedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  -[CNCombinedVisualIdentityEditorViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

}

- (void)setupSegmentedControl
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UISegmentedControl *v9;
  UISegmentedControl *segmentedControl;
  CNVisualIdentityAvatarStyleEditorViewController *v11;
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
  _QWORD v27[3];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3C58]);
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PHOTO_TEXT_STYLE_EDITOR_TEXT_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PHOTO_TEXT_STYLE_EDITOR_EMOJI_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (UISegmentedControl *)objc_msgSend(v3, "initWithItems:", v8);
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v9;

  -[CNCombinedVisualIdentityEditorViewController selectedEditor](self, "selectedEditor");
  v11 = (CNVisualIdentityAvatarStyleEditorViewController *)objc_claimAutoreleasedReturnValue();
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", v11 != self->_textEditor);

  -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, sel__segmentedControlDidChange_, 4096);
  -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_segmentedControl);

  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISegmentedControl topAnchor](self->_segmentedControl, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 86.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  -[UISegmentedControl leadingAnchor](self->_segmentedControl, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 16.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v17;
  -[UISegmentedControl trailingAnchor](self->_segmentedControl, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, -16.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraints:", v22);

}

- (void)_segmentedControlDidChange:(id)a3
{
  NSInteger v4;
  int *v5;
  void *v6;

  v4 = -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex", a3);
  v5 = &OBJC_IVAR___CNCombinedVisualIdentityEditorViewController__emojiEditor;
  if (!v4)
    v5 = &OBJC_IVAR___CNCombinedVisualIdentityEditorViewController__textEditor;
  objc_storeStrong((id *)&self->_selectedEditor, *(id *)((char *)&self->super.super.super.isa + *v5));
  -[CNCombinedVisualIdentityEditorViewController _updateEditorsVisibility](self, "_updateEditorsVisibility");
  -[CNCombinedVisualIdentityEditorViewController selectedEditor](self, "selectedEditor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginEditingAvatar");

  -[CNCombinedVisualIdentityEditorViewController updateDoneButtonEnabledState](self, "updateDoneButtonEnabledState");
}

- (void)setupEditors
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[10];

  v51[8] = *MEMORY[0x1E0C80C00];
  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_textEditor, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_textEditor, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_emojiEditor, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_emojiEditor, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[CNCombinedVisualIdentityEditorViewController addChildViewController:](self, "addChildViewController:", self->_textEditor);
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_textEditor, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[CNVisualIdentityAvatarStyleEditorViewController didMoveToParentViewController:](self->_textEditor, "didMoveToParentViewController:", self);
  -[CNCombinedVisualIdentityEditorViewController addChildViewController:](self, "addChildViewController:", self->_emojiEditor);
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_emojiEditor, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[CNVisualIdentityAvatarStyleEditorViewController didMoveToParentViewController:](self->_emojiEditor, "didMoveToParentViewController:", self);
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_textEditor, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISegmentedControl bottomAnchor](self->_segmentedControl, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 0.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v46;
  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_textEditor, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v41;
  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_textEditor, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 0.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v36;
  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_textEditor, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v31;
  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_emojiEditor, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISegmentedControl bottomAnchor](self->_segmentedControl, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v27;
  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_emojiEditor, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v22;
  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_emojiEditor, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v12, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v13;
  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_emojiEditor, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCombinedVisualIdentityEditorViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addConstraints:", v19);

  -[CNCombinedVisualIdentityEditorViewController _updateEditorsVisibility](self, "_updateEditorsVisibility");
}

- (void)_updateEditorsVisibility
{
  CNVisualIdentityAvatarStyleEditorViewController *v3;
  CNVisualIdentityAvatarStyleEditorViewController *emojiEditor;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  -[CNCombinedVisualIdentityEditorViewController selectedEditor](self, "selectedEditor");
  v3 = (CNVisualIdentityAvatarStyleEditorViewController *)objc_claimAutoreleasedReturnValue();
  emojiEditor = self->_emojiEditor;
  v5 = v3 == emojiEditor;
  v6 = v3 != emojiEditor;

  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_emojiEditor, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  -[CNVisualIdentityAvatarStyleEditorViewController view](self->_textEditor, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v5);

}

- (void)didTapCancel
{
  void *v3;
  id v4;

  -[CNCombinedVisualIdentityEditorViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNCombinedVisualIdentityEditorViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualIdentityEditorControllerDidCancel:", self);

  }
  else
  {
    -[CNCombinedVisualIdentityEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)didTapDone
{
  void *v3;
  void *v4;
  id v5;

  -[CNCombinedVisualIdentityEditorViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNCombinedVisualIdentityEditorViewController updatedProviderItem](self, "updatedProviderItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CNCombinedVisualIdentityEditorViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualIdentityEditorController:didFinishWithProviderItem:", self, v5);

  }
  else
  {
    -[CNCombinedVisualIdentityEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (id)updatedProviderItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[CNCombinedVisualIdentityEditorViewController selectedEditor](self, "selectedEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE033250))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  -[CNCombinedVisualIdentityEditorViewController selectedEditor](self, "selectedEditor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "editableAvatarViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatedProviderItemWithText:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "providerItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "copy");
  }

  return v11;
}

- (CNVisualIdentityItemEditorViewControllerDelegate)delegate
{
  return (CNVisualIdentityItemEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNPhotoPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (CNVisualIdentityAvatarStyleEditorViewController)textEditor
{
  return self->_textEditor;
}

- (void)setTextEditor:(id)a3
{
  objc_storeStrong((id *)&self->_textEditor, a3);
}

- (CNVisualIdentityAvatarStyleEditorViewController)emojiEditor
{
  return self->_emojiEditor;
}

- (void)setEmojiEditor:(id)a3
{
  objc_storeStrong((id *)&self->_emojiEditor, a3);
}

- (CNVisualIdentityAvatarStyleEditorViewController)selectedEditor
{
  return self->_selectedEditor;
}

- (void)setSelectedEditor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedEditor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedEditor, 0);
  objc_storeStrong((id *)&self->_emojiEditor, 0);
  objc_storeStrong((id *)&self->_textEditor, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)log
{
  if (log_cn_once_token_2_48072 != -1)
    dispatch_once(&log_cn_once_token_2_48072, &__block_literal_global_48073);
  return (id)log_cn_once_object_2_48074;
}

void __51__CNCombinedVisualIdentityEditorViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNVisualIdentityAvatarStyleEditorViewController");
  v1 = (void *)log_cn_once_object_2_48074;
  log_cn_once_object_2_48074 = (uint64_t)v0;

}

@end
