@implementation CNPosterPreviewViewController

- (CNPosterPreviewViewController)initWithPosterConfiguration:(id)a3 fromProviderItem:(id)a4 contact:(id)a5 editingState:(int64_t)a6 isEditingSNaP:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  CNPosterPreviewViewController *v15;
  void *v16;
  uint64_t v17;
  _TtC10ContactsUI32CNPosterPreviewViewConfiguration *configuration;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _TtC10ContactsUI32CNPosterPreviewViewConfiguration *v25;
  CNPosterPreviewViewController *v26;
  id v28;
  _BOOL4 v29;
  objc_super v30;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CNPosterPreviewViewController;
  v15 = -[CNPosterPreviewViewController init](&v30, sel_init);
  if (v15)
  {
    if (v12)
    {
      objc_msgSend(v14, "posterName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNPosterPreviewViewConfiguration configurationForExistingPosterConfiguration:displayName:](_TtC10ContactsUI32CNPosterPreviewViewConfiguration, "configurationForExistingPosterConfiguration:displayName:", v12, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      configuration = v15->_configuration;
      v15->_configuration = (_TtC10ContactsUI32CNPosterPreviewViewConfiguration *)v17;
    }
    else
    {
      objc_opt_class();
      v19 = v13;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      configuration = v20;

      v29 = v7;
      v28 = v13;
      if (configuration)
      {
        -[CNPosterPreviewViewConfiguration monogramText](configuration, "monogramText");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      objc_msgSend(v19, "assetIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPosterPreviewViewController backgroundColorFromPhotoPickerProviderItem:](v15, "backgroundColorFromPhotoPickerProviderItem:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "posterName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNPosterPreviewViewConfiguration configurationForNewPosterWithPhotoAssetID:backgroundColor:displayName:isEditingSNaP:monogramText:](_TtC10ContactsUI32CNPosterPreviewViewConfiguration, "configurationForNewPosterWithPhotoAssetID:backgroundColor:displayName:isEditingSNaP:monogramText:", v21, v22, v23, v29, v16);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v15->_configuration;
      v15->_configuration = (_TtC10ContactsUI32CNPosterPreviewViewConfiguration *)v24;

      v13 = v28;
    }

    objc_storeStrong((id *)&v15->_contact, a5);
    v15->_editingState = a6;
    v26 = v15;
  }

  return v15;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNPosterPreviewViewController;
  -[CNPosterPreviewViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CNPosterPreviewViewController updateNavigationBar](self, "updateNavigationBar");
}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC10ContactsUI26CNPosterPreviewViewWrapper *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _TtC10ContactsUI26CNPosterPreviewViewWrapper *v11;
  _TtC10ContactsUI26CNPosterPreviewViewWrapper *v12;
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
  _TtC10ContactsUI26CNPosterPreviewViewWrapper *v37;
  objc_super v38;
  _QWORD v39[5];

  v39[4] = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)CNPosterPreviewViewController;
  -[CNPosterPreviewViewController viewIsAppearing:](&v38, sel_viewIsAppearing_, a3);
  v4 = [_TtC10ContactsUI26CNPosterPreviewViewWrapper alloc];
  -[CNPosterPreviewViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterPreviewViewController contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNPosterPreviewViewController editingState](self, "editingState");
  -[CNPosterPreviewViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNPosterPreviewViewWrapper initWithConfiguration:contact:editingState:delegate:windowScene:](v4, "initWithConfiguration:contact:editingState:delegate:windowScene:", v5, v6, v7, self, v10);

  v12 = v11;
  -[CNPosterPreviewViewWrapper hostingController](v11, "hostingController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNPosterPreviewViewWrapper hostingController](v12, "hostingController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "willMoveToParentViewController:", self);

  v37 = v12;
  -[CNPosterPreviewViewWrapper hostingController](v12, "hostingController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterPreviewViewController addChildViewController:](self, "addChildViewController:", v16);

  -[CNPosterPreviewViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v14);

  -[CNPosterPreviewViewWrapper hostingController](v12, "hostingController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "didMoveToParentViewController:", self);

  v29 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v14, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterPreviewViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v33;
  objc_msgSend(v14, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterPreviewViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v28;
  objc_msgSend(v14, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterPreviewViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v22;
  objc_msgSend(v14, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterPreviewViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v27);

}

- (id)backgroundColorFromPhotoPickerProviderItem:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "imageType");
  if (v4 == 2 || v4 == 4)
  {
    objc_opt_class();
    v10 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v7 = v11;

    objc_msgSend(v7, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 != 3)
    {
      v9 = 0;
      goto LABEL_14;
    }
    objc_opt_class();
    v5 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_msgSend(v7, "backgroundColorVariant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_14:

  return v9;
}

- (void)updateNavigationBar
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[CNPosterPreviewViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasExistingPoster");
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("SNAP_POSTER_PREVIEW");
  else
    v7 = CFSTR("SNAP_POSTER_PREVIEW_ADD");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterPreviewViewController setTitle:](self, "setTitle:", v8);

  -[CNPosterPreviewViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setBackgroundHidden:", 1);

  if (-[CNPosterPreviewViewController editingState](self, "editingState") == 1)
  {
    v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
    CNContactsUIBundle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SNAP_POSTER_PREVIEW_SKIP"), &stru_1E20507A8, CFSTR("Localized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v11, 0, self, sel_skipPosterSetup);
    -[CNPosterPreviewViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

  }
  else
  {
    -[CNPosterPreviewViewController navigationItem](self, "navigationItem");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightBarButtonItem:", 0);
  }

}

- (void)skipPosterSetup
{
  id v3;

  -[CNPosterPreviewViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterPreviewViewControllerDidSelectCustomizeLater:", self);

}

- (void)previewViewDidCreateWithPosterConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CNPosterPreviewViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "posterName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPosterPreviewViewConfiguration configurationForExistingPosterConfiguration:displayName:](_TtC10ContactsUI32CNPosterPreviewViewConfiguration, "configurationForExistingPosterConfiguration:displayName:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPosterPreviewViewController setConfiguration:](self, "setConfiguration:", v7);
  -[CNPosterPreviewViewController setEditingState:](self, "setEditingState:", +[CNMeCardSharingSettingsEditingStateMachine stateAfterPerformingAction:onState:](CNMeCardSharingSettingsEditingStateMachine, "stateAfterPerformingAction:onState:", 1, -[CNPosterPreviewViewController editingState](self, "editingState")));
  -[CNPosterPreviewViewController updateNavigationBar](self, "updateNavigationBar");
}

- (void)previewViewDidFinishWithPosterConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNPosterPreviewViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "posterPreviewViewController:didFinishWithPosterConfiguration:", self, v4);

}

- (void)previewViewDidSelectUseDifferentPoster
{
  id v3;

  -[CNPosterPreviewViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterPreviewViewControllerDidSelectUseDifferentPoster:", self);

}

- (_TtC10ContactsUI32CNPosterPreviewViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (CNPosterPreviewViewControllerDelegate)delegate
{
  return (CNPosterPreviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)editingState
{
  return self->_editingState;
}

- (void)setEditingState:(int64_t)a3
{
  self->_editingState = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
